unit dMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Vcl.Graphics,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB, WinApi.Windows,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, dxmdaset;

type
  TdtmMain = class(TDataModule)
    conMain: TFDConnection;
    qryGetKeywordsLists: TFDQuery;
    dsKeywordsLists: TDataSource;
    qryAddNewKeywordsLists: TFDQuery;
    mdKeywordsLists: TdxMemData;
    dlMain: TFDPhysSQLiteDriverLink;
    qryDeleteKeywordsLists: TFDQuery;
    qryUpdateKeywordsListsColor: TFDQuery;
    mdKeywords: TdxMemData;
    dsKeywords: TDataSource;
    qryGetKeywords: TFDQuery;
    qryAddNewKeywords: TFDQuery;
    qryDeleteKeywords: TFDQuery;
    qryGeyDefaultKeywordsLists: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FLoad: Boolean;
  public
    procedure LoadKeywordsLists;
    procedure LoadDefaultKeywordsLists;
    procedure LoadKeywords;
    procedure UpdateColor(AColor: TColor);
    function AddNewKeywordsLists(AKeyword: String; AColor: Integer): Boolean;
    function AddNewKeywords(AKeyword: String): Boolean;
    function DeleteKeywordsLists: Boolean;
    function DeleteKeywords: Boolean;
  end;

var
  dtmMain: TdtmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmMain }

function TdtmMain.AddNewKeywords(AKeyword: String): Boolean;
begin
  Result := True;
  try
    try
      if qryAddNewKeywords.Active then
        qryAddNewKeywords.Close;

      with qryAddNewKeywords do
      begin
        ParamByName('p_keywordID').AsInteger := mdKeywordsLists.FieldByName('ID').AsInteger;
        ParamByName('p_keyword').AsString := AKeyword;
        ParamByName('p_IsChecked').AsInteger := 0;
        Execute;
      end;
      conMain.Commit;
    except
      conMain.Rollback;
      Result := False;
    end;
  finally
    qryAddNewKeywords.Close;
  end;
end;

function TdtmMain.AddNewKeywordsLists(AKeyword: String; AColor: Integer): Boolean;
begin
  Result := True;
  try
    try
      if qryAddNewKeywordsLists.Active then
        qryAddNewKeywordsLists.Close;

      with qryAddNewKeywordsLists do
      begin
        ParamByName('p_keyword').AsString := AKeyword;
        ParamByName('p_IsDefault').AsInteger := 0;
        ParamByName('p_IsChecked').AsInteger := 1;
        ParamByName('p_color').AsInteger := AColor;
        Execute;
      end;
      conMain.Commit;
    except
      conMain.Rollback;
      Result := False;
    end;
  finally
    qryAddNewKeywordsLists.Close;
  end;
end;

procedure TdtmMain.DataModuleCreate(Sender: TObject);
begin
  conMain.Open;
end;

function TdtmMain.DeleteKeywords: Boolean;
begin
  Result := True;
  try
    try
      if qryDeleteKeywords.Active then
        qryDeleteKeywords.Close;

      with qryDeleteKeywords do
      begin
        ParamByName('p_id').AsInteger := mdKeywords.FieldByName('ID').AsInteger;
        Execute;
      end;
      conMain.Commit;
    except
      conMain.Rollback;
      Result := False;
    end;
  finally
    qryDeleteKeywords.Close;
  end;
end;

function TdtmMain.DeleteKeywordsLists: Boolean;
begin
  Result := True;
  try
    try
      if qryDeleteKeywordsLists.Active then
        qryDeleteKeywordsLists.Close;

      with qryDeleteKeywordsLists do
      begin
        ParamByName('p_id').AsInteger := mdKeywordsLists.FieldByName('ID').AsInteger;
        Execute;
      end;
      conMain.Commit;
    except
      conMain.Rollback;
      Result := False;
    end;
  finally
    qryDeleteKeywordsLists.Close;
  end;
end;

procedure TdtmMain.LoadDefaultKeywordsLists;
begin
  FLoad := True;
  mdKeywordsLists.Close;
  qryGeyDefaultKeywordsLists.Close;
  qryGeyDefaultKeywordsLists.Open;
  mdKeywordsLists.CreateFieldsFromDataSet(qryGeyDefaultKeywordsLists);
  mdKeywordsLists.CopyFromDataSet(qryGeyDefaultKeywordsLists);
  mdKeywordsLists.Append;
  mdKeywordsLists.FieldByName('keyword').AsString := 'Введите имя нового списка';
  mdKeywordsLists.Post;
  mdKeywordsLists.Active := True;
  FLoad := False;
end;

procedure TdtmMain.LoadKeywordsLists;
begin
  FLoad := True;
  mdKeywordsLists.Close;
  qryGetKeywordsLists.Close;
  qryGetKeywordsLists.Open;
  mdKeywordsLists.CreateFieldsFromDataSet(qryGetKeywordsLists);
  mdKeywordsLists.CopyFromDataSet(qryGetKeywordsLists);
  mdKeywordsLists.Append;
  mdKeywordsLists.FieldByName('keyword').AsString := 'Введите имя нового списка';
  mdKeywordsLists.Post;
  mdKeywordsLists.Active := True;
  FLoad := False;
end;

procedure TdtmMain.LoadKeywords;
begin
  FLoad := True;
  mdKeywords.Close;
  qryGetKeywords.Close;
  qryGetKeywords.ParamByName('p_keywordID').AsInteger := mdKeywordsLists.FieldByName('ID').AsInteger;
  qryGetKeywords.Open;
  mdKeywords.CreateFieldsFromDataSet(qryGetKeywords);
  mdKeywords.CopyFromDataSet(qryGetKeywords);
  mdKeywords.Append;
  mdKeywords.FieldByName('keyword').AsString := 'Введите новое ключевое слово';
  mdKeywords.Post;
  mdKeywords.Active := True;
  FLoad := False;
end;

procedure TdtmMain.UpdateColor(AColor: TColor);
begin
  try
    try
      if qryUpdateKeywordsListsColor.Active then
        qryUpdateKeywordsListsColor.Close;

      with qryUpdateKeywordsListsColor do
      begin
        ParamByName('p_color').AsInteger := AColor;
        ParamByName('p_id').AsInteger := mdKeywordsLists.FieldByName('ID').AsInteger;
        Execute;
      end;
      conMain.Commit;
    except
      conMain.Rollback;
    end;
  finally
    qryUpdateKeywordsListsColor.Close;
  end;
end;

end.
