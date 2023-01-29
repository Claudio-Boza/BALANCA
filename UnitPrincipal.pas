unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, ACBrBase, ACBrBAL, Vcl.StdCtrls,
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
    procedure btnBalancaClick(Sender: TObject);
    procedure btnPesagensClick(Sender: TObject);
    procedure edtDtEntradaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UnitDataModule, UnitCadastroBalanca, UnitPesagens;

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

procedure TFrmPrincipal.edtDtEntradaKeyPress(Sender: TObject; var Key: Char);
  var
    vData : TDate;
begin
  if (key = #104) or ( key = #72 ) then
    begin
      edtDtEntrada.Text := DateToStr(vData);
    end;
end;

end.
