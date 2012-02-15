unit frmInvokeUI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit,Windows;

type
  TfrmTestUI = class(TForm)
    btnGetName: TButton;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtName: TEdit;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblName: TLabel;
    edtDllPath: TEdit;
    lblDllPath: TLabel;
    btnSelectDll: TButton;
    procedure btnGetNameClick(Sender: TObject);
    procedure btnSelectDllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestUI: TfrmTestUI;

implementation

{$R *.fmx}

procedure TfrmTestUI.btnGetNameClick(Sender: TObject);
var
  Handle: THandle;
  TConcateName : function(strFirstName, strLastName: PChar):Integer; stdcall;
begin
  Handle := LoadLibrary(PWideChar(edtDllPath.Text));
  if Handle <> 0 then
  begin
    @TConcateName := GetProcAddress(Handle, 'ConcateName');
    if @TConcateName <> nil then
   	begin
    	  edtName.Text := IntToStr(TConcateName(PwideChar(edtFirstName.Text),PWideChar(edtLastName.Text)));
    end;
      FreeLibrary(Handle);
  end;
end;

procedure TfrmTestUI.btnSelectDllClick(Sender: TObject);
var OpenDlg : TOpenDialog;
begin OpenDlg := TOpenDialog.Create(Self);
 {set options here...}
 if OpenDlg.Execute then begin
  edtDllPath.Text := OpenDlg.FileName;
 end;
 OpenDlg.Free;
end;


end.
