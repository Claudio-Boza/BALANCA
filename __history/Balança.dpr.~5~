program Balança;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitDataModule in 'Database\UnitDataModule.pas' {DataModule1: TDataModule},
  UnitCadastroBalanca in 'Cadastros\UnitCadastroBalanca.pas' {FrmBalanca},
  UnitPesagens in 'Cadastros\UnitPesagens.pas' {FrmPesagens},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
