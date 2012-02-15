program InvokeTestRoutine;

uses
  FMX.Forms,
  frmInvokeUI in 'frmInvokeUI.pas' {frmTestUI};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTestUI, frmTestUI);
  Application.Run;
end.
