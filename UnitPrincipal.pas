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
    MaskEdit1: TMaskEdit;
    btnPesagens: TSpeedButton;
    procedure btnBalancaClick(Sender: TObject);
    procedure btnPesagensClick(Sender: TObject);
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

end.
