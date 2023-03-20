unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels, dMain,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, System.UITypes,
  cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxTextEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxVariants,
  cxClasses, cxGridCustomView, cxGrid, System.Actions, Vcl.ActnList, cxCheckBox,
  System.ImageList, Vcl.ImgList, dxColorDialog, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, cxSplitter;

type
  TfrmKeywordDispatcher = class(TForm)
    pnlMain: TPanel;
    pnlBottomButtons: TPanel;
    btnDefault: TcxButton;
    btnClose: TcxButton;
    alMain: TActionList;
    actClose: TAction;
    ilColoredBitmap: TImageList;
    cdChangeKeywordColor: TColorDialog;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    icMain: TImageCollection;
    ilMain: TVirtualImageList;
    actExport: TAction;
    btnImport: TcxButton;
    actImport: TAction;
    spltMain: TcxSplitter;
    pnlKeywordsList: TPanel;
    grdKeywordsLists: TcxGrid;
    tvKeywordsLists: TcxGridDBTableView;
    tvcCheckBox: TcxGridDBColumn;
    tvcKeywordList: TcxGridDBColumn;
    tvcDelete: TcxGridDBColumn;
    tvcColor: TcxGridDBColumn;
    tvcIndex: TcxGridDBColumn;
    lvlKeywordsLists: TcxGridLevel;
    btnExport: TcxButton;
    pnlKeywords: TPanel;
    grdKeywords: TcxGrid;
    tvKeywords: TcxGridDBTableView;
    tvcKeywordsName: TcxGridDBColumn;
    tvcKeywordsDelete: TcxGridDBColumn;
    tvcKeywordsID: TcxGridDBColumn;
    lvlKeywords: TcxGridLevel;
    ilCheck: TVirtualImageList;
    actLoadDefault: TAction;
    procedure actCloseExecute(Sender: TObject);
    procedure tvKeywordsListsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvKeywordsListsCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure tvKeywordsListsCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tvKeywordsListsMouseLeave(Sender: TObject);
    procedure tvKeywordsListsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tvKeywordsListsEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure tvKeywordsListsEditKeyUp(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure actExportExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure tvKeywordsListsSelectionChanged(Sender: TcxCustomGridTableView);
    procedure actImportUpdate(Sender: TObject);
    procedure tvKeywordsCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvKeywordsMouseLeave(Sender: TObject);
    procedure tvKeywordsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tvKeywordsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvKeywordsEditKeyUp(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure tvKeywordsCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actLoadDefaultExecute(Sender: TObject);
    procedure tvcColorGetCellHint(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; ACellViewInfo: TcxGridTableDataCellViewInfo;
      const AMousePos: TPoint; var AHintText: TCaption;
      var AIsHintMultiLine: Boolean; var AHintTextRect: TRect);
    procedure tvKeywordListDataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
      AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
    procedure tvKeywordsDataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
      AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
  private
    FHotTrackedRecordKeywords: TcxCustomGridRecord;
    FHotTrackedRecordKeywordsList: TcxCustomGridRecord;
    FInserting: Boolean;
    procedure FillColorImageList;
  public
    { Public declarations }
  end;

var
  frmKeywordDispatcher: TfrmKeywordDispatcher;

implementation

{$R *.dfm}

function GetRandomColor: TColor;
begin
  Result := RGB(Random(255), Random(255), Random(255));
end;

function CustomVarToInt(AVar: Variant): Integer;
var
  iTmp: Integer;
begin
  Result := -1;
  if VarIsEmpty(AVar) or VarIsNull(AVar) then Exit;

  if TryStrToInt(VarToStr(AVar), iTmp) then
    Exit(iTmp);
end;

function CreateBitmapSolidColor(Width, Height: Word; Color: TColor): TBitmap; //Создаем иконку заполненную одним цветом
begin
  Result := TBitmap.Create;
  Result.PixelFormat := pf24bit;
  Result.Width := Width;
  Result.Height := Height;
  Result.Canvas.Brush.Color := Color;
  Result.Canvas.FillRect(Rect(0, 0, Width, Height));
end;

procedure TfrmKeywordDispatcher.actCloseExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmKeywordDispatcher.actExportExecute(Sender: TObject);
begin
  //
end;

procedure TfrmKeywordDispatcher.actImportExecute(Sender: TObject);
begin
  //
end;

procedure TfrmKeywordDispatcher.actImportUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (tvKeywordsLists.Controller.SelectedRecordCount > 0) and not FInserting;
end;

procedure TfrmKeywordDispatcher.actLoadDefaultExecute(Sender: TObject);
begin
  dtmMain.LoadDefaultKeywordsLists;
  FillColorImageList;
  dtmMain.mdKeywords.Close;
end;

procedure TfrmKeywordDispatcher.FillColorImageList;  //Заполняем ImageList(ilColoredBitmap) иконками заполненными одним цветом
var
  LColor: TColor;
  LBitmap: TBitmap;
begin
  ilColoredBitmap.Clear;
  dtmMain.mdKeywordsLists.First;
  LBitmap := nil;
  while not dtmMain.mdKeywordsLists.Eof do
  begin
    try
      LColor := dtmMain.mdKeywordsLists.FieldByName('Color').AsInteger;
      LBitmap := CreateBitmapSolidColor(16, 16, LColor);
      ilColoredBitmap.AddMasked(LBitmap, clNone);
    finally
      LBitmap.Free;
    end;
    dtmMain.mdKeywordsLists.Next;
  end;
end;

procedure TfrmKeywordDispatcher.FormCreate(Sender: TObject);
begin
  FHotTrackedRecordKeywords := nil;
  FHotTrackedRecordKeywordsList := nil;
end;

procedure TfrmKeywordDispatcher.FormShow(Sender: TObject);
begin
  FInserting := False;
  dtmMain.LoadKeywordsLists;
  FillColorImageList;
end;

{$REGION 'Left Grid'}
procedure TfrmKeywordDispatcher.tvcColorGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin
  AHintText := '';
end;

procedure TfrmKeywordDispatcher.tvKeywordsListsCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if ACellViewInfo = nil then Exit;
  
  if ACellViewInfo.Item.Index = tvcDelete.Index then
  begin
    dtmMain.DeleteKeywordsLists;
    dtmMain.LoadKeywordsLists;
    dtmMain.mdKeywords.Close;
    FillColorImageList;
  end;
  
  if ACellViewInfo.Item.Index = tvcColor.Index then
  begin
    if cdChangeKeywordColor.Execute then
    begin
      dtmMain.UpdateColor(cdChangeKeywordColor.Color);
      dtmMain.LoadKeywordsLists;
      FillColorImageList;
    end;
  end;
end;
  
procedure TfrmKeywordDispatcher.tvKeywordsListsCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  
  procedure _DrawIconWithText(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; AImgInd: Integer; AImageList: TVirtualImageList);
  var
    LRect: TRect;
    LText: String;
    LTextRect: TRect;
  begin
    LRect := AViewInfo.Bounds;
    LTextRect := TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect;
    if AViewInfo.GridRecord.Values[tvcKeywordList.Index] = null then
      LText := IntToStr(CustomVarToInt(AViewInfo.GridRecord.Values[tvcKeywordList.Index]))
    else
      LText := AViewInfo.GridRecord.Values[tvcKeywordList.Index];
    LRect.Left := AViewInfo.ClientBounds.Left;
    LRect.Top  := AViewInfo.ClientBounds.Top + 1;
  
    LTextRect.Left := LTextRect.Left + 16;
    ACanvas.FillRect(AViewInfo.Bounds, ACanvas.Brush.Color);
    AImageList.Draw(ACanvas.Canvas, LRect.Left, LRect.Top, AImgInd, True);
    ACanvas.DrawTexT(LText, LTextRect, TAlignment.taLeftJustify, TcxAlignmentVert.vaCenter, False, False);
  end;
  
  procedure _DrawIcon(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; AImgInd: Integer; AImageList: TVirtualImageList); overload;
  var
    ptLeftTop: TPoint;
    R        : TRect;
  begin
    R := AViewInfo.Bounds;
    ACanvas.Brush.Color :=  AViewInfo.Params.Color;
    ACanvas.FillRect(R);
  
    ptLeftTop := AViewInfo.Bounds.CenterPoint;
    ptLeftTop.Offset(-AImageList.Width div 2,
                     -AImageList.Height div 2);
  
    with AViewInfo.ClientBounds do
      AImageList.Draw(ACanvas.Canvas, ptLeftTop.X, ptLeftTop.Y, AImgInd, True);
  end;
  
  procedure _DrawIcon(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; AImgInd: Integer; AImageList: TImageList); overload;
  var
    ptLeftTop: TPoint;
    R        : TRect;
  begin
    R := AViewInfo.Bounds;
    ACanvas.Brush.Color :=  AViewInfo.Params.Color;
    ACanvas.FillRect(R);
  
    ptLeftTop := AViewInfo.Bounds.CenterPoint;
    ptLeftTop.Offset(-AImageList.Width div 2,
                     -AImageList.Height div 2);
  
    with AViewInfo.ClientBounds do
      AImageList.Draw(ACanvas.Canvas, ptLeftTop.X, ptLeftTop.Y, AImgInd, True);
  end;
  
var
  ImgInd: Integer;
  ptLeftTop: TPoint;
begin
  ImgInd := -1;
  
  if (AViewInfo.GridRecord.RecordIndex = (Sender as TcxGridDBTableView).DataController.RowCount - 1) then
  begin
    if (AViewInfo.Item = tvcKeywordList) then
    begin
      ImgInd := 2;
      ACanvas.Font.Style := [fsUnderline];
      ACanvas.Font.Color := clHighlight;
      _DrawIconWithText(ACanvas, AViewInfo, ImgInd, ilMain);
      ADone := True;
    end;
    Exit;
  end;
  
  if (FHotTrackedRecordKeywords <> nil) and (AViewInfo.GridRecord = FHotTrackedRecordKeywords) and (AViewInfo.Item = tvcDelete) then
  begin
    ImgInd := 4;
    _DrawIcon(ACanvas, AViewInfo, ImgInd, ilMain);
    ADone := True;
  end;
  
  if (AViewInfo.Item = tvcCheckBox) then
  begin
    ImgInd := 0;
    ACanvas.Brush.Color :=  AViewInfo.Params.Color;
    ACanvas.FillRect(AViewInfo.Bounds);
    ptLeftTop := AViewInfo.Bounds.CenterPoint;
    ptLeftTop.Offset(-ilCheck.Width div 2,
                     -ilCheck.Height div 2);
    with AViewInfo.ClientBounds do
      ilCheck.Draw(ACanvas.Canvas, ptLeftTop.X, ptLeftTop.Y, ImgInd, True);
    ADone := True;
  end;
  
  if (AViewInfo.Item = tvcColor) then
  begin
    if Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, (Sender as TcxGridDBTableView).GetColumnByFieldName('NUM').Index) <> null then
      ImgInd := Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, (Sender as TcxGridDBTableView).GetColumnByFieldName('NUM').Index) - 1;
    _DrawIcon(ACanvas, AViewInfo, ImgInd, ilColoredBitmap);
    ADone := True;
  end;
  
  if (AViewInfo.Item = tvcKeywordList) then
  begin
    ImgInd := 3;
    _DrawIconWithText(ACanvas, AViewInfo, ImgInd, ilMain);
    ADone := True;
  end;
end;
  
procedure TfrmKeywordDispatcher.tvKeywordListDataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
begin
  Compare := VarCompare(V1, V2);
  if (AItemIndex = tvcKeywordList.Index) then
  begin
    if (V1 <> null) and (pos('Введите', V1) > 0) then
      Compare := 0;
  end;
end;

procedure TfrmKeywordDispatcher.tvKeywordsListsEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  AAllow := (Sender.Controller.FocusedRecordIndex = Sender.DataController.RowCount - 1);
end;
  
procedure TfrmKeywordDispatcher.tvKeywordsListsEditKeyUp(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
var
  LValue: String;
begin
  if (Key = VK_RETURN) then
  begin
    if TcxGridTableController(tvKeywordsLists.Controller).EditingController.Edit.EditingValue <> null then
    begin
      LValue := TcxGridTableController(tvKeywordsLists.Controller).EditingController.Edit.EditingValue;
      dtmMain.AddNewKeywordsLists(LValue, GetRandomColor);
    end;
    dtmMain.LoadKeywordsLists;
    FillColorImageList;
    dtmMain.mdKeywords.Close;
    FInserting := False;
  end;
end;
  
procedure TfrmKeywordDispatcher.tvKeywordsListsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LSite: TcxGridSite;
  LHitTest: TcxCustomGridHitTest;
begin
  LSite := TcxGridSite(Sender);
  LHitTest := LSite.ViewInfo.GetHitTest(X, Y);
  if LHitTest is TcxGridRecordCellHitTest then
    with TcxGridRecordCellHitTest(LHitTest) do
      if GridRecord.RecordIndex = tvKeywordsLists.DataController.RowCount - 1 then
      begin
        FInserting := True;
        dtmMain.mdKeywords.Close;
        TcxGridTableController(LSite.GridView.Controller).FocusedColumnIndex := 1;
        TcxGridTableController(LSite.GridView.Controller).EditingController.ShowEdit();
        TcxGridTableController(LSite.GridView.Controller).EditingController.Edit.Clear;
      end;
end;
  
procedure TfrmKeywordDispatcher.tvKeywordsListsMouseLeave(Sender: TObject);
begin
  FHotTrackedRecordKeywords := nil;
  TcxGridSite(Sender).GridView.Invalidate();
end;
  
procedure TfrmKeywordDispatcher.tvKeywordsListsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  LHitTest: TcxCustomGridHitTest;
  LOldTrackedRecord: TcxCustomGridRecord;
begin
  LOldTrackedRecord := FHotTrackedRecordKeywords;
  FHotTrackedRecordKeywords := nil;
  LHitTest := TcxGridSite(Sender).ViewInfo.GetHitTest(X, Y);
  if LHitTest is TcxGridRecordHitTest then
    FHotTrackedRecordKeywords := TcxGridRecordHitTest(LHitTest).GridRecord;
  if (LOldTrackedRecord <> FHotTrackedRecordKeywords) then
  begin
    if LOldTrackedRecord <> nil then
      LOldTrackedRecord.Invalidate();
    if FHotTrackedRecordKeywords <> nil then
      FHotTrackedRecordKeywords.Invalidate();
  end;
end;
  
procedure TfrmKeywordDispatcher.tvKeywordsListsSelectionChanged(Sender: TcxCustomGridTableView);
begin
  dtmMain.LoadKeywords;
end;

{$ENDREGION}

{$REGION 'Right Grid'}
procedure TfrmKeywordDispatcher.tvKeywordsCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if ACellViewInfo = nil then Exit;

  if ACellViewInfo.Item.Index = tvcKeywordsDelete.Index then
  begin
    dtmMain.DeleteKeywords;
    dtmMain.LoadKeywords;
    AHandled := True;
  end;
end;

procedure TfrmKeywordDispatcher.tvKeywordsCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

  procedure _DrawIcon(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; AImgInd: Integer; AImageList: TVirtualImageList); overload;
  var
    ptLeftTop: TPoint;
    R        : TRect;
  begin
    R := AViewInfo.Bounds;
    ACanvas.Brush.Color :=  AViewInfo.Params.Color;
    ACanvas.FillRect(R);

    ptLeftTop := AViewInfo.Bounds.CenterPoint;
    ptLeftTop.Offset(-AImageList.Width div 2,
                     -AImageList.Height div 2);

    with AViewInfo.ClientBounds do
      AImageList.Draw(ACanvas.Canvas, ptLeftTop.X, ptLeftTop.Y, AImgInd, True);
  end;
  
var
  ImgInd: Integer;
  LTextRect: TRect;
  LText: String;
begin
  if (AViewInfo.GridRecord.RecordIndex = (Sender as TcxGridDBTableView).DataController.RowCount - 1) then
  begin
    if (AViewInfo.Item = tvcKeywordsName) then
    begin
      ACanvas.Font.Style := [fsUnderline];
      ACanvas.Font.Color := clHighlight;
      LTextRect := TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect;
      if AViewInfo.GridRecord.Values[tvcKeywordsName.Index] = null then
        LText := IntToStr(CustomVarToInt(AViewInfo.GridRecord.Values[tvcKeywordsName.Index]))
      else
        LText := AViewInfo.GridRecord.Values[tvcKeywordsName.Index];
  
      LTextRect.Left := LTextRect.Left + 16;
      ACanvas.FillRect(AViewInfo.Bounds, ACanvas.Brush.Color);
      ACanvas.DrawTexT(LText, LTextRect, TAlignment.taLeftJustify, TcxAlignmentVert.vaCenter, False, False);
      ADone := True;
    end;
    Exit;
  end;

  if (FHotTrackedRecordKeywordsList <> nil) and (AViewInfo.GridRecord = FHotTrackedRecordKeywordsList) and (AViewInfo.Item = tvcKeywordsDelete) then
  begin
    ImgInd := 4;
    _DrawIcon(ACanvas, AViewInfo, ImgInd, ilMain);
    ADone := True;
  end;
end;
  
procedure TfrmKeywordDispatcher.tvKeywordsDataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
begin
  Compare := VarCompare(V1, V2);
  if (AItemIndex = tvcKeywordsName.Index) then
  begin
    if (V1 <> null) and (pos('Введите', V1) > 0) then
      Compare := 0;
  end;
end;

procedure TfrmKeywordDispatcher.tvKeywordsEditKeyUp(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
var
  LValue: String;
begin
  if (Key = VK_RETURN) then
  begin
    if TcxGridTableController(tvKeywords.Controller).EditingController.Edit.EditingValue <> null then
    begin
      LValue := TcxGridTableController(tvKeywords.Controller).EditingController.Edit.EditingValue;
      dtmMain.AddNewKeywords(LValue);
      FInserting := False;
    end;
    dtmMain.LoadKeywords;
  end;
end;

procedure TfrmKeywordDispatcher.tvKeywordsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LSite: TcxGridSite;
  LHitTest: TcxCustomGridHitTest;
begin
  LSite := TcxGridSite(Sender);
  LHitTest := LSite.ViewInfo.GetHitTest(X, Y);
  if LHitTest is TcxGridRecordCellHitTest then
    with TcxGridRecordCellHitTest(LHitTest) do
      if GridRecord.RecordIndex = tvKeywords.DataController.RowCount - 1 then
      begin
        FInserting := True;
        TcxGridTableController(LSite.GridView.Controller).FocusedColumnIndex := 0;
        TcxGridTableController(LSite.GridView.Controller).EditingController.ShowEdit();
        TcxGridTableController(LSite.GridView.Controller).EditingController.Edit.Clear;
      end;
end;

procedure TfrmKeywordDispatcher.tvKeywordsMouseLeave(Sender: TObject);
begin
  FHotTrackedRecordKeywordsList := nil;
  TcxGridSite(Sender).GridView.Invalidate();
end;

procedure TfrmKeywordDispatcher.tvKeywordsMouseMove(Sender: TObject;  Shift: TShiftState; X, Y: Integer);
var
  LHitTest: TcxCustomGridHitTest;
  LOldTrackedRecord: TcxCustomGridRecord;
begin
  LOldTrackedRecord := FHotTrackedRecordKeywordsList;
  FHotTrackedRecordKeywordsList := nil;
  LHitTest := TcxGridSite(Sender).ViewInfo.GetHitTest(X, Y);
  if LHitTest is TcxGridRecordHitTest then
    FHotTrackedRecordKeywordsList := TcxGridRecordHitTest(LHitTest).GridRecord;
  if (LOldTrackedRecord <> FHotTrackedRecordKeywordsList) then
  begin
    if LOldTrackedRecord <> nil then
      LOldTrackedRecord.Invalidate();
    if FHotTrackedRecordKeywordsList <> nil then
      FHotTrackedRecordKeywordsList.Invalidate();
  end;
end;
{$ENDREGION}

end.
