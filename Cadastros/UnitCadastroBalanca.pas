unit UnitCadastroBalanca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,ACBrDevice, ACBrBAL, ACBrBase, System.TypInfo,
  Vcl.DBCtrls;

type
  TFrmBalanca = class(TForm)
    cmbHand: TComboBox;
    cmbStop: TComboBox;
    cmbParity: TComboBox;
    cmbData: TComboBox;
    cmbBaud: TComboBox;
    cmbPorta: TComboBox;
    cmbBalanca: TComboBox;
    cbMonitorar: TCheckBox;
    edtTime: TEdit;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ACBrBAL1: TACBrBAL;
    COD: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FrmBalanca: TFrmBalanca;

implementation

{$R *.dfm}

uses UnitDataModule;




procedure TFrmBalanca.Button3Click(Sender: TObject);
begin
  DataModule1.tb_balanca.Edit;
  with DataModule1.tb_balanca do
    begin
      FieldByName('ID').Value := StrToInt(COD.Caption);
      FieldByName('MODELO').Value := cmbBalanca.ItemIndex;
      FieldByName('PORTA').Value := cmbPorta.Text;
      FieldByName('BOUD_RATE').Value := cmbBaud.Text;
      FieldByName('DATA_BITS').Value := cmbData.Text;
      FieldByName('PARITY').Value := cmbParity.ItemIndex;
      FieldByName('STOP_BITS').Value := cmbStop.ItemIndex;
      FieldByName('HANDSHAKING').Value := cmbHand.ItemIndex;
      FieldByName('CAMINHO_TXT').Value := 'C:\Windows\Temp\BalLog.txt';
      FieldByName('MONITORAR').Value := cbMonitorar.Checked;
      FieldByName('TIMEOUT').Value := edtTime.Text;
      Post;
    end;
   // DataModule1.tb_balanca.Post;
end;

procedure TFrmBalanca.Button4Click(Sender: TObject);
  begin
     DataModule1.tb_balanca.Cancel;
     Close;
  end;

procedure TFrmBalanca.FormCreate(Sender: TObject);
  begin
    DataModule1.queryBalanca.SQL.Clear;
    DataModule1.queryBalanca.SQL.Add('SELECT FIRST 1 * FROM BALANCA');
    DataModule1.queryBalanca.Open;
    DataModule1.queryBalanca.Active := True;
    if not DataModule1.queryBalanca.IsEmpty then
      begin
        with DataModule1.queryBalanca do
          begin
            COD.Caption := FieldByName('ID').Value;
            cmbBalanca.ItemIndex := FieldByName('MODELO').Value;
            cmbPorta.Text := FieldByName('PORTA').Value ;
            cmbBaud.Text := FieldByName('BOUD_RATE').Value;
            cmbData.Text := FieldByName('DATA_BITS').Value ;
            cmbParity.ItemIndex := FieldByName('PARITY').Value;
            cmbStop.ItemIndex := FieldByName('STOP_BITS').Value;
            cmbHand.ItemIndex := FieldByName('HANDSHAKING').Value;
            cbMonitorar.Checked := FieldByName('MONITORAR').Value;
            edtTime.Text := FieldByName('TIMEOUT').Value;
          end;
      end;
  end;

end.
