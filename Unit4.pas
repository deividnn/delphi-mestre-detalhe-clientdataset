unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DbxDevartMySql, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TForm4 = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    insericidade: TButton;
    salvacidade: TButton;
    excluicidade: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    conexao: TSQLConnection;
    qry_estado: TSQLQuery;
    dsp_estado: TDataSetProvider;
    cds_estado: TClientDataSet;
    ds_estado: TDataSource;
    qry_estadoid_estado: TIntegerField;
    qry_estadonome: TStringField;
    qry_estadosigla: TStringField;
    cds_estadoid_estado: TIntegerField;
    cds_estadonome: TStringField;
    cds_estadosigla: TStringField;
    DBEdit3: TDBEdit;
    ds_estado_cidade: TDataSource;
    qry_cidade: TSQLQuery;
    cds_cidade: TClientDataSet;
    ds_cidade: TDataSource;
    qry_cidadeid: TIntegerField;
    qry_cidadeid_estado: TIntegerField;
    qry_cidadenome: TStringField;
    cds_estadoqry_cidade: TDataSetField;
    cds_cidadeid: TIntegerField;
    cds_cidadeid_estado: TIntegerField;
    cds_cidadenome: TStringField;
    Button8: TButton;
    editacidade: TButton;
    cancelacidade: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure insericidadeClick(Sender: TObject);
    procedure salvacidadeClick(Sender: TObject);
    procedure excluicidadeClick(Sender: TObject);
    procedure cds_estadoAfterDelete(DataSet: TDataSet);
    procedure cds_estadoAfterPost(DataSet: TDataSet);
    procedure Button8Click(Sender: TObject);
    procedure editacidadeClick(Sender: TObject);
    procedure cancelacidadeClick(Sender: TObject);
  private
    procedure insercaocidade;
    procedure normalcidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.insericidadeClick(Sender: TObject);
begin
  cds_cidade.Insert;
  normalcidade;
end;

procedure TForm4.salvacidadeClick(Sender: TObject);
begin
  cds_cidade.post;
  insercaocidade;
end;

procedure TForm4.excluicidadeClick(Sender: TObject);
begin
  cds_cidade.delete;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  cds_estado.Insert;
  insercaocidade;

end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  cds_estado.post;
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
  cds_estado.delete;
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  cds_estado.cancel;
    insercaocidade;
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  cds_estado.Edit;
  insercaocidade;
end;

procedure TForm4.editacidadeClick(Sender: TObject);
begin
  cds_cidade.Edit;
  normalcidade;
end;

procedure TForm4.insercaocidade;
begin
  salvacidade.Enabled := false;
  insericidade.Enabled := true;
  editacidade.Enabled := true;
  excluicidade.Enabled := true;
  cancelacidade.Enabled:=false;
end;

procedure TForm4.normalcidade;
begin
  salvacidade.Enabled := true;
  insericidade.Enabled := false;
  editacidade.Enabled := false;
  excluicidade.Enabled := false;
    cancelacidade.Enabled:=true;
end;

procedure TForm4.cancelacidadeClick(Sender: TObject);
begin
insercaocidade;
end;

procedure TForm4.cds_estadoAfterDelete(DataSet: TDataSet);
begin
  cds_estado.ApplyUpdates(0);
end;

procedure TForm4.cds_estadoAfterPost(DataSet: TDataSet);
begin
  cds_estado.ApplyUpdates(0);
  cds_estado.Refresh;

end;

end.
