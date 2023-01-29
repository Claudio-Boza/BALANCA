unit UnitDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.IBBase, FireDAC.Comp.UI, System.iniFiles,Winapi.Messages,
  Winapi.Windows, WinSock, controls, forms, dialogs, stdctrls;

type
  TDataModule1 = class(TDataModule)
    conexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    drive: TFDPhysFBDriverLink;
    tb_balanca: TFDTable;
    queryBalanca: TFDQuery;
    ds_balanca: TDataSource;
    tb_pesagem: TFDTable;
    queryPesagem: TFDQuery;
    ds_pesagem: TDataSource;
    tb_balancaID: TIntegerField;
    tb_balancaMODELO: TIntegerField;
    tb_balancaPORTA: TStringField;
    tb_balancaBOUD_RATE: TIntegerField;
    tb_balancaDATA_BITS: TIntegerField;
    tb_balancaPARITY: TIntegerField;
    tb_balancaSTOP_BITS: TIntegerField;
    tb_balancaHANDSHAKING: TIntegerField;
    tb_balancaCAMINHO_TXT: TStringField;
    tb_balancaMONITORAR: TBooleanField;
    tb_balancaTIMEOUT: TIntegerField;
    tb_pesagemID: TIntegerField;
    tb_pesagemDESCRICAO: TStringField;
    tb_pesagemDATA_ENTRADA: TDateField;
    tb_pesagemHORAS_ENTRADA: TTimeField;
    tb_pesagemDATA_SAIDA: TDateField;
    tb_pesagemHORAS_SAIDA: TIntegerField;
    tb_pesagemPESO_BRUTO: TFMTBCDField;
    tb_pesagemPESO_LIQUIDO: TFMTBCDField;
    tb_pesagemPESO_TOTAL: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    database: String;
    port : String;
    host : String;
    dll : String;
    iniConfig : TiniFile;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
  begin
    try
      iniConfig := TIniFile.Create('.\Config.ini');
      database := iniConfig.ReadString('DATABASE', 'database', '');
      port := iniConfig.ReadString('DATABASE', 'port', '');
      host := iniConfig.ReadString('DATABASE', 'host', '');
      dll := iniConfig.ReadString('DATABASE', 'dll', '');
      MessageDlg(dll, mtInformation, mbOKCancel, 0);

    except
      MessageDlg('Arquivo Confg não encontrado!', mtInformation, mbOKCancel, 0);
    end;
    with conexao do
      begin
        Params.Clear;
        Params.Values['DriverID'] := 'FB';
        Params.Values['Server'] := host;
        Params.Values['Database'] := database;
        Params.Values['User_name'] := 'SYSDBA';
        Params.Values['password'] := 'masterkey';
        Params.Values['port'] := port;
        drive.VendorLib := dll;
        conexao.Connected := True;
        tb_pesagem.Active :=  True;
        tb_balanca.Active := True;
      end;
  end;

end.
