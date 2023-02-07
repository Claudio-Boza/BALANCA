unit UnitPesagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmPesagens = class(TForm)
    DBGrid1: TDBGrid;
    btnEditar: TButton;
    btnExcluir: TButton;
    Button1: TButton;
    Panel1: TPanel;
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesagens: TFrmPesagens;

implementation

{$R *.dfm}

uses UnitDataModule;

procedure TFrmPesagens.btnExcluirClick(Sender: TObject);
  begin
    if MessageDlg('Excluir registro?', mtInformation, [mbYes, mbNo],0) = mrYes then
      begin
        DataModule1.tb_pesagem.Delete;
      end
    else
      begin
        abort;
      end;

  end;
end.
