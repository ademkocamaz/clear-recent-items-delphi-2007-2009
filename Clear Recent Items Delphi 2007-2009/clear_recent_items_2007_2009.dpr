program clear_recent_items_2007_2009;

uses
  Forms,
  mainForm in 'mainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Clear Recent Items 2007/2009';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
