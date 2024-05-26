unit mainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sButton, Registry, sSkinManager, sSkinProvider;

type
  TForm1 = class(TForm)
    sBtn2007: TsButton;
    sBtn2009: TsButton;
    sLabel1: TsLabel;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    procedure sBtn2007Click(Sender: TObject);
    procedure sBtn2009Click(Sender: TObject);
  private
    { Private declarations }
    procedure ClearRecentlyOpenedProjects2007;
    procedure ClearRecentlyOpenedProjects2009;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.ClearRecentlyOpenedProjects2007;
var
  iCount  : Integer;
  Reg     : TRegistry;
  sList1  : TStrings;
  sList2  : TStrings;
begin
  sList1 := TStringList.Create;
  sList2 := TStringList.Create;
  Reg   := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    //----------------------------------
    if Reg.OpenKey('\Software\Borland\BDS\5.0\Closed Projects', True) then
      Reg.GetValueNames(sList1);

    if sList1.Count > 0 then
      begin
        for iCount := 0 to Pred(sList1.Count) do
          Reg.DeleteValue(sList1[icount]);
        MessageDlg('Closed Projects: Clear.', mtInformation, [mbOk], 0);
      end
    else
      MessageDlg('Closed Projects: No registry items to be cleaned at this time.',
        mtInformation, [mbOk], 0);
    //----------------------------------
    if Reg.OpenKey('\Software\Borland\BDS\5.0\Closed Files', True) then
      Reg.GetValueNames(sList2);

    if sList2.Count > 0 then
      begin
        for iCount := 0 to Pred(sList2.Count) do
          Reg.DeleteValue(sList2[icount]);
        MessageDlg('Closed Files: Clear.', mtInformation, [mbOk], 0);
      end
    else
      MessageDlg('Closed Files: No registry items to be cleaned at this time.',
        mtInformation, [mbOk], 0);
    //----------------------------------

  finally
    sList1.Free;
    Reg.Free;
  end;
end;

procedure TForm1.ClearRecentlyOpenedProjects2009;
var
  iCount  : Integer;
  Reg     : TRegistry;
  sList1  : TStrings;
  sList2  : TStrings;
begin
  sList1 := TStringList.Create;
  sList2 := TStringList.Create;
  Reg   := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    //----------------------------------
    if Reg.OpenKey('\Software\CodeGear\BDS\6.0\Closed Projects', True) then
      Reg.GetValueNames(sList1);

    if sList1.Count > 0 then
      begin
        for iCount := 0 to Pred(sList1.Count) do
          Reg.DeleteValue(sList1[icount]);
        MessageDlg('Closed Projects: Clear.', mtInformation, [mbOk], 0);
      end
    else
      MessageDlg('Closed Projects: No registry items to be cleaned at this time.',
        mtInformation, [mbOk], 0);
    //----------------------------------
    if Reg.OpenKey('\Software\CodeGear\BDS\6.0\Closed Files', True) then
      Reg.GetValueNames(sList2);

    if sList2.Count > 0 then
      begin
        for iCount := 0 to Pred(sList2.Count) do
          Reg.DeleteValue(sList2[icount]);
        MessageDlg('Closed Files: Clear.', mtInformation, [mbOk], 0);
      end
    else
      MessageDlg('Closed Files: No registry items to be cleaned at this time.',
        mtInformation, [mbOk], 0);
    //----------------------------------

  finally
    sList1.Free;
    Reg.Free;
  end;
end;

procedure TForm1.sBtn2007Click(Sender: TObject);
begin
  ClearRecentlyOpenedProjects2007;
end;

procedure TForm1.sBtn2009Click(Sender: TObject);
begin
  ClearRecentlyOpenedProjects2009;
end;

end.
