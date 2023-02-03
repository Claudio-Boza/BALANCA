unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, ACBrBase, ACBrDevice, ACBrBAL, Vcl.StdCtrls,
  Vcl.Mask;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnBalanca: TSpeedButton;
    ACBrBAL1: TACBrBAL;
    Label1: TLabel;
    edtDtEntrada: TMaskEdit;
    btnPesagens: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtHorasEntrada: TMaskEdit;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    sttPeso: TLabel;
    gbSaida: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lbPesoSaida: TLabel;
    EdtDataSaida: TMaskEdit;
    edtHorasSaida: TMaskEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    sttResposta: TLabel;
    Memo1: TMemo;
    Panel3: TPanel;
    Edit2: TEdit;
    Label10: TLabel;
    procedure btnBalancaClick(Sender: TObject);
    procedure btnPesagensClick(Sender: TObject);
    procedure edtDtEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ACBrBAL1LePeso(Peso: Double; Resposta: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure InicializarBalanca(Ativar: Boolean);
    function Converte(cmd: String): String;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UnitDataModule, UnitCadastroBalanca, UnitPesagens, ACBrDeviceSerial, ACBrUtil.Base,ACBrUtil.FilesIO;

function TFrmPrincipal.Converte(cmd: String): String;
  var A : Integer ;
  begin
    Result := '' ;
    For A := 1 to length( cmd ) do
    begin
       if not (cmd[A] in ['A'..'Z','a'..'z','0'..'9',
                          ' ','.',',','/','?','<','>',';',':',']','[','{','}',
                          '\','|','=','+','-','_',')','(','*','&','^','%','$',
                          '#','@','!','~' ]) then
          Result := Result + '#' + IntToStr(ord( cmd[A] )) + ' '
       else
          Result := Result + cmd[A] + ' ';
    end ;
  end;

procedure TFrmPrincipal.ACBrBAL1LePeso(Peso: Double; Resposta: String);
  var valid : integer;
  begin
     sttPeso.Caption     := formatFloat('##0.000', Peso );
     sttResposta.Caption := Converte( Resposta ) ;

     if Peso > 0 then
        Memo1.Lines.Text := 'Leitura OK !'
     else
      begin
        valid := Trunc(ACBrBAL1.UltimoPesoLido);
        case valid of
           0 : Memo1.Lines.Text := 'TimeOut !'+sLineBreak+
                                   'Coloque o produto sobre a Balan�a!' ;
          -1 : Memo1.Lines.Text := 'Peso Instavel ! ' +sLineBreak+
                                   'Tente Nova Leitura' ;
          -2 : Memo1.Lines.Text := 'Peso Negativo !' ;
         -10 : Memo1.Lines.Text := 'Sobrepeso !' ;
        end;
      end;
  end;

procedure TFrmPrincipal.InicializarBalanca(Ativar: Boolean);
  begin
    ACBrBAL1.Desativar;

    if Ativar then
    begin
      //configura porta de comunica��o
      ACBrBAL1.Modelo           := TACBrBALModelo( DataModule1.tb_balanca.FieldByName('MODELO').Value);
      ACBrBAL1.Device.HandShake := TACBrHandShake( DataModule1.tb_balanca.FieldByName('HANDSHAKING').Value);
      ACBrBAL1.Device.Parity    := TACBrSerialParity( DataModule1.tb_balanca.FieldByName('PARITY').Value );
      ACBrBAL1.Device.Stop      := TACBrSerialStop( DataModule1.tb_balanca.FieldByName('STOP_BITS').Value );
      ACBrBAL1.Device.Data      := StrToInt( DataModule1.tb_balanca.FieldByName('DATA_BITS').Value );
      ACBrBAL1.Device.Baud      := StrToInt( DataModule1.tb_balanca.FieldByName('BOUD_RATE').Value );
      ACBrBAL1.Device.Porta     := DataModule1.tb_balanca.FieldByName('PORTA').Value;
      ACBrBAL1.ArqLOG           := DataModule1.tb_balanca.FieldByName('CAMINHO_TXT').Value;

      // Conecta com a balan�a
      if DataModule1.tb_balanca.FieldByName('MONITORAR').Value then
      begin
        ACBrBAL1.MonitorarBalanca := True;
      end;

      ACBrBAL1.Ativar;
    end;
  end;

procedure TFrmPrincipal.btnBalancaClick(Sender: TObject);
  var
    FrmCadastroBalanca : TFrmBalanca;
begin
  try
    FrmCadastroBalanca := TFrmBalanca.Create(self);
    FrmCadastroBalanca.ShowModal;
  finally
    FrmCadastroBalanca.Free;
  end;
end;

procedure TFrmPrincipal.btnPesagensClick(Sender: TObject);
  var
    FrmPesagens : TFrmPesagens;
  begin
    try
      FrmPesagens :=  TFrmPesagens.Create(self);
      FrmPesagens.ShowModal;
    finally
      FrmPesagens.Free;
    end;

  end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
  var
    TimeOut : Integer;
    Time : TTime;
  begin
    //Time :=  GetTimeInDateTime(Now());
     edtDtEntrada.Text :=  FormatDateTime('dd/mm/yyyy', Date);
     edtHorasEntrada.Text := FormatDateTime('hh:mm:ss', Now);
     InicializarBalanca(True);
     try
        TimeOut := StrToInt(DataModule1.tb_balanca.FieldByName('TIMEOUT').Value);
     except
       TimeOut := 2000;
     end;
     //ACBrBAL1.LePeso(TimeOut);
     ACBrBAL1.LePeso( TimeOut );
     sttPeso.Caption := FloatToIntStr(ACBrBAL1.LePeso( TimeOut ));

  end;

procedure TFrmPrincipal.edtDtEntradaKeyPress(Sender: TObject; var Key: Char);
  var
    vData : TDate;
  begin
    try
      if (key = #104) or ( key = #72 ) then
        begin
          edtDtEntrada.Text := FormatDateTime('dd/mm/yyyy', Date);
        end;
    except
      ShowMessage('deu erro!');
    end;
  end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACBrBAL1.Desativar;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  DataModule1.tb_pesagem.Refresh;
end;

end.
