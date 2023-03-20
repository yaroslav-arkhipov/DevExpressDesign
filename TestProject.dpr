program TestProject;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {frmKeywordDispatcher},
  dMain in 'dMain.pas' {dtmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmKeywordDispatcher, frmKeywordDispatcher);
  Application.CreateForm(TdtmMain, dtmMain);
  Application.Run;
end.
