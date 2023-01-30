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
    Label8: TLabel;
    Label9: TLabel;
    lbPesoSaida: TLabel;
    EdtDataSaida: TMaskEdit;
    edtHorasSaida: TMaskEdit;
    edtDecricaoSaida: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
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
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UnitDataModule, UnitCadastroBalanca, UnitPesagens, ACBrDeviceSerial, ACBrUtil.Base,ACBrUtil.FilesIO;

procedure TFrmPrincipal.ACBrBAL1LePeso(Peso: Double; Resposta: String);
  var valid : integer;
  begin
     sttPeso.Caption     := formatFloat('##0.000', Peso );
    // sttResposta.Caption := Converte( Resposta ) ;
     {
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
      end ;}
  end;

procedure TFrmPrincipal.InicializarBalanca(Ativar: Boolean);
  begin
    ACBrBAL1.Desativar;

    if Ativar then
    begin
      //configura porta de comunica��o
      {ShowMessage('MODELO ' + DataModule1.tb_balanca.FieldByName('MODELO').Value);
      ShowMessage('HANDSHAKING ' + DataModule1.tb_balanca.FieldByName('HANDSHAKING').Value);
      ShowMessage('PARITY ' + DataModule1.tb_balanca.FieldByName('PARITY').Value);
      ShowMessage('STOP_BITS ' + DataModule1.tb_balanca.FieldByName('STOP_BITS').Value);
      ShowMessage('DATA_BITS ' + DataModule1.tb_balanca.FieldByName('DATA_BITS').Value);
      ShowMessage('BOUD_RATE ' + DataModule1.tb_balanca.FieldByName('BOUD_RATE').Value);
      ShowMessage('PORTA ' + DataModule1.tb_balanca.FieldByName('PORTA').Value);
      ShowMessage('CAMINHO_TXT ' + DataModule1.tb_balanca.FieldByName('CAMINHO_TXT').Value);}
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
  begin
    InicializarBalanca(True);

     ShowMessage(DataModule1.tb_balanca.FieldByName('TIMEOUT').Value);
     ACBrBAL1.LePeso( DataModule1.tb_balanca.FieldByName('TIMEOUT').Value );
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
