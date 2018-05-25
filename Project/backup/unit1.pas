unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, mysql51conn, sqldb, FileUtil, Forms, Controls,
  Graphics, Dialogs, DBGrids, StdCtrls, ComCtrls, DbCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MySQL51Connection1: TMySQL51Connection;
    PageControl1: TPageControl;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid2SelectEditor(Sender: TObject; Column: TColumn;
      var Editor: TWinControl);
    procedure MySQL51Connection1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
   str_sql : string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
   MySQL51Connection1.Connected:=true;
 except
   ShowMessage('Подключение к БД: ОШИБКА!');
   exit;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  try
   SQLTransaction1.Active:=true;
 except
   ShowMessage('Транзакция: ОШИБКА!');
   exit;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  try
   SQLQuery1.Active := false;
   SQLQuery1.SQL.Clear;
   str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
   SQLQuery1.sql.add(str_sql);
   SQLQuery1.ExecSQL;
   SQLQuery1.SQL.Clear;
   SQLQuery1.sql.add('SELECT fggyy.ID, fggyy.Name, fggyy.`Data`, fggyy.Pasport, rodstvo.name AS `Rodstvo` FROM fggyy JOIN rodstvo ON fggyy.Rodstvo = rodstvo.ID;');
   SQLQuery1.Open;
  except
   ShowMessage('SQL-запрос: ОШИБКА!');
   exit;
   DBgrid2.columns[0].width:= 10;
   DBgrid2.columns[1].width:=10;
   DBgrid2.columns[2].width:= 10;
   DBgrid2.columns[3].width:= 10;
 end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     SQLQuery1.Active:=false;
  SQLTransaction1.Commit;
  MySQL51Connection1.Connected:=false;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TForm1.DBGrid2SelectEditor(Sender: TObject; Column: TColumn;
  var Editor: TWinControl);
begin
  Edit1.Text := DBGrid2.Columns.Items[1].Field.Value;
  Edit2.Text := DBGrid2.Columns.Items[2].Field.Value;
  Edit3.Text := DBGrid2.Columns.Items[3].Field.Value;
  Edit4.Text := DBGrid2.Columns.Items[4].Field.Value;
end;

procedure TForm1.MySQL51Connection1AfterConnect(Sender: TObject);
begin

end;

end.

