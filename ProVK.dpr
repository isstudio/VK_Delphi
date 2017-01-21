program ProVK;

uses
  Forms,
  VK in 'VK.pas' {Form1},
  VK2 in 'VK2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
