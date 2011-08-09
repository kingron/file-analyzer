//2006-11-17 ZswangY37 No.1 修改 鼠标点击的时候没有触发OnSelectionChange事件
//2007-01-02 ZswangY37 No.1 完善 处理没有MouseDown的MouseMove事件（双击文件对话框的时候会出现）

unit LovelyHex20;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, Forms;

type
  TWMImeChar = packed record
    Msg: Cardinal;
    case Integer of
      0:
      (
        CharCode: Word;
        KeyData: Longint;
        Result: Longint
      );
      1:
      (
        CharCode1: Byte;
        CharCode2: Byte
      );
  end;

type
  TMouseObject = (moNone, moAddress, moHex, moChar);

type
  TLovelyHex20 = class(TCustomControl)
  private
    { Private declarations }
    FMemoryStream: TMemoryStream;
    FBaseAddress: Integer;
    FLineCount: Integer;
    FVisibleChars: Integer;
    FTopLine: Integer;
    FLeftLine: Integer;
    FRowIndex: Integer;
    FVisibleLines: Integer;
    FItemHeight: Integer;
    FItemWidth: Integer;
    FColIndex: Integer;
    FColType: TMouseObject;
    FReadOnly: Boolean;
    FSelLength: Integer;
    FSelStart: Integer;
    FAnchorStart: Integer;
    FAnchorOffset: Integer;
    FHexChar: Char;
    FOnSelectionChange: TNotifyEvent;
    FChangeDataSize: Boolean;
    FMouseDown: Boolean;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMHScroll(var Message: TWMHScroll); message WM_HSCROLL;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure AdjustScrollBars;

    procedure SetRowIndex(Value: Integer);
    procedure SetColIndex(Value: Integer);
    procedure SetLeftLine(Value: Integer);
    procedure SetTopLine(Value: Integer);

    procedure SetBaseAddress(const Value: Integer);
    function LineViewText(mLineIndex: Integer): string;
    function SelectionViewText(mColType: TMouseObject; mLineIndex: Integer; mStart, mEnd: Integer): string;
    property TopLine: Integer read FTopLine write SetTopLine;
    property LeftLine: Integer read FLeftLine write SetLeftLine;
    function MouseObject(mPoint: TPoint; var nCoordinate: TPoint): TMouseObject;
    function CoordinateToPoint(mMouseObject: TMouseObject; mCoordinate: TPoint): TPoint;
    function PositionToCoordinate(mPosition: Integer): TPoint;
    function CoordinatePosition(mCoordinate: TPoint): Integer;
    function ColToChar(mColType: TMouseObject; mCol: Integer): Integer;
    procedure SetColType(const Value: TMouseObject);
    function RowMaxIndex(mRowIndex: Integer): Integer;
    procedure SetReadOnly(const Value: Boolean);
    procedure SetSelLength(const Value: Integer);
    procedure SetSelStart(Value: Integer);
    procedure SetAnchorOffset(Value: Integer);
    procedure WMIMECHAR(var Msg: TWMImeChar); message WM_IME_CHAR;
    procedure WMCHAR(var Msg: TWMChar); message WM_CHAR;
  protected
    { Protected declarations }
    function GetSelText: string; virtual;
    procedure SetSelText(const Value: string); virtual;
    procedure DoChange; virtual;
    procedure SelectionChange; virtual;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
    procedure DoExit; override;
    procedure DoEnter; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromBuffer(const mBuffer; mSize: Integer);
    procedure LoadFromStream(mStream: TStream);
    procedure LoadFromFile(mFileName: TFileName);
    procedure SaveToStream(mStream: TStream);
    procedure SaveToFile(mFileName: TFileName);
    procedure SaveToBuffer(var nBuffer; mSize: Integer);
    property MemoryStream: TMemoryStream read FMemoryStream;
    property BaseAddress: Integer read FBaseAddress write SetBaseAddress; //基地址
    property RowIndex: Integer read FRowIndex write SetRowIndex; //当前行数
    property ColIndex: Integer read FColIndex write SetColIndex; //当前列数
    property ColType: TMouseObject read FColType write SetColType; //当前列是否十六进制
    property SelStart: Integer read FSelStart write SetSelStart; //选择文本的开始位置
    property SelLength: Integer read FSelLength write SetSelLength; //选择文本的长度
    property SelText: string read GetSelText write SetSelText; //选中的文本
    property AnchorOffset: Integer read FAnchorOffset write SetAnchorOffset;
    function ScrollIntoView: Boolean;
    procedure UpdateCaret;
  published
    { Published declarations }
    property Align;
    property Anchors;
    property Enabled;
    property Font;
    property Color;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False; //是否只读
    property ChangeDataSize: Boolean read FChangeDataSize write FChangeDataSize default True; //是否能改变大小
    property ParentFont;
    property ParentColor;
    property PopupMenu;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange; //选这点改变
  end;

procedure Register;

implementation

uses Math, CommonFunctions51;

procedure Register;
begin
  RegisterComponents('Lovely20', [TLovelyHex20]);
end;

{ TLovelyHex20 }

procedure TLovelyHex20.AdjustScrollBars;
var
  vScrollInfo: TScrollInfo;
begin
  SetScrollRange(Handle, SB_VERT, 0, FLineCount, True);
  SetScrollRange(Handle, SB_HORZ, 0, 76, True);
  vScrollInfo.fMask := SIF_PAGE;
  vScrollInfo.nPage := FVisibleLines;
  SetScrollInfo(Handle, SB_VERT, vScrollInfo, True);

  vScrollInfo.fMask := SIF_PAGE;
  vScrollInfo.nPage := FVisibleChars;
  SetScrollInfo(Handle, SB_HORZ, vScrollInfo, True);
end;

procedure TLovelyHex20.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Canvas.Font := Self.Font;
  DoChange;
end;

function TLovelyHex20.CoordinateToPoint(mMouseObject: TMouseObject;
  mCoordinate: TPoint): TPoint;
begin
  case mMouseObject of
    moChar, moHex:
    begin
      Result.Y := mCoordinate.Y * FItemHeight;
      Result.X := ColToChar(mMouseObject, mCoordinate.X) * FItemWidth;
    end;
    moAddress:
    begin
      Result.Y := mCoordinate.Y * FItemHeight;
      Result.X := 0;
    end;
  else Result := Point(-1, -1);
  end;
  Result.X := Result.X - FLeftLine * FItemWidth;
  Result.Y := Result.Y - FTopLine * FItemHeight;
end;

constructor TLovelyHex20.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := [csFramed, csCaptureMouse];
  Width := 300;
  Height := 200;
  ParentColor := False;
  Color := clWindow;
  FMemoryStream := TMemoryStream.Create;
  DoubleBuffered := True;
  FChangeDataSize := True;
  FColType := moHex;
end;

procedure TLovelyHex20.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_VSCROLL or WS_HSCROLL;
  end;
end;

destructor TLovelyHex20.Destroy;
begin
  FMemoryStream.Free;
  inherited;
end;

procedure TLovelyHex20.DoChange;
begin
  FItemHeight := Canvas.TextHeight('A');
  FItemWidth := Canvas.TextWidth('D');
  FLineCount := (FMemoryStream.Size div 16) + 1;
  FVisibleChars := (ClientWidth div Canvas.TextWidth('D')) + 1;
  FVisibleLines := (ClientHeight div FItemHeight) + 1;
  LeftLine := Min(LeftLine, 76 - FVisibleChars + 1);
  TopLine := Min(TopLine, FLineCount - FVisibleLines + 1);

  AdjustScrollBars;
  UpdateCaret;
  Invalidate;
  ScrollIntoView;
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
end;

function TLovelyHex20.DoMouseWheelDown(Shift: TShiftState;
  MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheelDown(Shift, MousePos);
  Perform(WM_VSCROLL, MakeWParam(SB_PAGEDOWN, 0), 0);
end;

function TLovelyHex20.DoMouseWheelUp(Shift: TShiftState;
  MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheelUp(Shift, MousePos);
  Perform(WM_VSCROLL, MakeWParam(SB_PAGEUP, 0), 0);
end;

procedure TLovelyHex20.KeyDown(var Key: Word; Shift: TShiftState);
var
  vCaretPoint: TPoint;
begin
  inherited;
  case Key of
    VK_BACK:
    begin
      if not FChangeDataSize then Exit;
      if FSelLength <= 0 then 
      begin
        if FSelStart <= 0 then Exit;
        Dec(FSelStart);
        if Stream_Delete(FMemoryStream, FSelStart, 1) then
        begin
          vCaretPoint := PositionToCoordinate(FSelStart);
          FColIndex := vCaretPoint.X;
          FRowIndex := vCaretPoint.Y;
          DoChange;
        end;
      end
      else begin
        if Stream_Delete(FMemoryStream, FSelStart, FSelLength) then
        begin
          FSelLength := 0;
          vCaretPoint := PositionToCoordinate(FSelStart + FSelLength);
          FColIndex := vCaretPoint.X;
          FRowIndex := vCaretPoint.Y;
          DoChange;
        end;
      end;
    end;
    VK_DELETE:
    begin
      if not FChangeDataSize then Exit;
      if FSelLength <= 0 then
      begin
        if Stream_Delete(FMemoryStream, FSelStart, 1) then DoChange;
      end
      else begin
        if Stream_Delete(FMemoryStream, FSelStart, FSelLength) then
        begin
          FSelLength := 0;
          vCaretPoint := PositionToCoordinate(FSelStart + FSelLength);
          FColIndex := vCaretPoint.X;
          FRowIndex := vCaretPoint.Y;
          DoChange;
        end;
      end;
    end;
    VK_SHIFT:
    begin
      if FSelLength <= 0 then
      begin
        FAnchorStart := FSelStart;
        FAnchorOffset := 0;
        FHexChar := #0;
      end;
    end;
    VK_DOWN:
    begin
      if ssShift in Shift then
        AnchorOffset := AnchorOffset + 16
      else
      begin
        RowIndex := RowIndex + 1;
        SelectionChange;
      end;
    end;
    VK_UP:
    begin
      if ssShift in Shift then
        AnchorOffset := AnchorOffset - 16
      else
      begin
        RowIndex := RowIndex - 1;
        SelectionChange;
      end;
    end;
    VK_NEXT:
    begin
      RowIndex := RowIndex + FVisibleLines;
      if ssShift in Shift then
      else SelectionChange;
    end;
    VK_PRIOR:
    begin
      RowIndex := RowIndex - FVisibleLines;
      if ssShift in Shift then
      else SelectionChange;
    end;
    VK_HOME:
    begin
      ColIndex := 0;
      if ssCtrl in Shift then RowIndex := 0;
      if ssShift in Shift then
      else SelectionChange;
    end;
    VK_END:
    begin
      ColIndex := 15;
      if ssCtrl in Shift then RowIndex := FLineCount - 1;
      if ssShift in Shift then
      else SelectionChange;
    end;
    VK_LEFT:
    begin
      if ssShift in Shift then
        AnchorOffset := AnchorOffset - 1
      else
      begin
        if ColIndex > 0 then
          ColIndex := ColIndex - 1
        else if RowIndex > 0 then
        begin
          RowIndex := RowIndex - 1;
          ColIndex := RowMaxIndex(RowIndex);
        end;
        SelectionChange;
      end;
    end;
    VK_RIGHT:
    begin
      if ssShift in Shift then
        AnchorOffset := AnchorOffset + 1
      else
      begin
        if ColIndex < 15 then
          ColIndex := ColIndex + 1
        else if RowIndex < FLineCount - 1 then
        begin
          ColIndex := 0;
          RowIndex := RowIndex + 1;
        end;
        SelectionChange;
      end;
    end;
    VK_TAB: if ColType = moHex then ColType := moChar else ColType := moHex;
  end;
end;

function TLovelyHex20.LineViewText(mLineIndex: Integer): string;
const
  cHexDigits : array[0..15] of Char = '0123456789ABCDEF';
var
  I, L: Integer;
  vBytes: array[0..15] of Byte;
  S: string;
begin
  Result := ''; //StringOfChar(' ', 76);
  if mLineIndex < 0 then Exit;
  FMemoryStream.Position := mLineIndex * 16;
  L := FMemoryStream.Read(vBytes, 16);
  Result := Format('%.8x  ', [FBaseAddress + mLineIndex * 16]);
  S := '';
  for I := 0 to 15 do
  begin
    if I = 8 then Result := Result + ' ';
    if I < L then
    begin
      if vBytes[I] in [32..126] then
        S := S + Chr(vBytes[I])
      else S := S + '.';
      Result := Result + cHexDigits[vBytes[I] shr $04] +
        cHexDigits[vBytes[I] and $0F] + ' '
    end else
    begin
      Result := Result + '   ';
      S := S + ' ';
    end;
  end;
  Result := Result + ' ' + S;
end;

procedure TLovelyHex20.LoadFromFile(mFileName: TFileName);
begin
  if FileExists(mFileName) then
    FMemoryStream.LoadFromFile(mFileName)
  else FMemoryStream.Clear;
  FSelLength := 0;
  FSelStart := 0;
  FColIndex := 0;
  FRowIndex := 0;
  DoChange;
end;

procedure TLovelyHex20.LoadFromStream(mStream: TStream);
begin
  FMemoryStream.Clear;
  FMemoryStream.LoadFromStream(mStream);
  FSelLength := 0;
  FSelStart := 0;
  FColIndex := 0;
  FRowIndex := 0;
  DoChange;
end;

procedure TLovelyHex20.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  vCoordinate: TPoint;
begin
  inherited;
  FMouseDown := True;
  if not Focused then SetFocus;
  if Button = mbRight then Exit;
  case MouseObject(Point(X, Y), vCoordinate) of
    moAddress: ;
    moHex:
    begin
      FColIndex := vCoordinate.X;
      FColType := moHex;
      FRowIndex := vCoordinate.Y;
      FSelStart := Max(Min(CoordinatePosition(vCoordinate), FMemoryStream.Size), 0);
      vCoordinate := PositionToCoordinate(FSelStart);
      FColIndex := vCoordinate.X;
      FRowIndex := vCoordinate.Y;
      FAnchorStart := FSelStart;
      FAnchorOffset := 0;
      FHexChar := #0;
      SelLength := 0;
      UpdateCaret;
      SelectionChange;
    end;
    moChar:
    begin
      FColIndex := vCoordinate.X;
      FColType := moChar;
      RowIndex := vCoordinate.Y;
      FSelStart := Max(Min(CoordinatePosition(vCoordinate), FMemoryStream.Size), 0);
      vCoordinate := PositionToCoordinate(FSelStart);
      FColIndex := vCoordinate.X;
      FRowIndex := vCoordinate.Y;
      FAnchorStart := FSelStart;
      FAnchorOffset := 0;
      FHexChar := #0;
      SelLength := 0;
      UpdateCaret;
      SelectionChange;                                                          //2006-11-17 ZswangY37 No.1
    end;
    moNone:;
  end;
end;

procedure TLovelyHex20.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  vCoordinate: TPoint;
  vAnchorType: TMouseObject;
begin
  inherited;
  if not Focused then Exit;
  { TODO -c2006.11.17 -oZswangY37 : 考虑拖拽移动内容 }
  if FMouseDown and (ssLeft in Shift) then                                      //2007-01-02 ZswangY37 No.1
  begin
    vCoordinate := CoordinateToPoint(FColType, Point(15, 0));
    if X >= vCoordinate.X + FItemWidth then
    begin
      vCoordinate := CoordinateToPoint(FColType, Point(0, 0));
      X := vCoordinate.X;
      Y := Y + FItemHeight;
    end;

    vCoordinate := CoordinateToPoint(FColType, Point(0, 0));
    X := Max(vCoordinate.X, X);
    vCoordinate := CoordinateToPoint(FColType, Point(15, 0));
    X := Min(vCoordinate.X, X);

    vAnchorType := MouseObject(Point(X, Y), vCoordinate);
    if vAnchorType <> FColType then Exit;
    AnchorOffset := CoordinatePosition(vCoordinate) - FAnchorStart;
  end;

  case MouseObject(Point(X, Y), vCoordinate) of
    moAddress: Cursor := crDefault;
    moHex: Cursor := crIBeam;
    moChar: Cursor := crIBeam;
    moNone: Cursor := crDefault;
  end;
end;

function TLovelyHex20.MouseObject(mPoint: TPoint;
  var nCoordinate: TPoint): TMouseObject;
var
  vRow, vCol: Integer;
begin
  vRow := (mPoint.Y + FItemHeight * FTopLine) div FItemHeight;
  vCol := (mPoint.X + FItemWidth * FLeftLine + FItemWidth div 2) div FItemWidth;
  case vCol of
    0..9:
    begin
      Result := moAddress;
      nCoordinate.X := vRow;
      nCoordinate.Y := vRow;
    end;
    10..58:
    begin
      Result := moHex;
      case vCol of
        10..33: nCoordinate.X := (vCol - 10) div 3;
        34..35: nCoordinate.X := 8;
        36..58:
        begin
          nCoordinate.X := (vCol - 11) div 3;
        end;
      else nCoordinate.X := vCol;
      end;
      nCoordinate.Y := vRow;
    end;
    60..76:
    begin
      Result := moChar;
      nCoordinate.X := Min(vCol - 60, 15);
      nCoordinate.Y := vRow;
    end;
  else Result := moNone;
  end;
end;

procedure TLovelyHex20.Paint;
var
  I: Integer;
  vSelStart, vSelEnd: TPoint;
  vCurrLine: Integer;
  vPoint: TPoint;
  vRect: TRect;
  vUnColType: TMouseObject;
begin
  inherited;
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Assign(Font);

  if FSelLength > 0 then
  begin
    vSelStart := PositionToCoordinate(FSelStart);
    vSelEnd := PositionToCoordinate(FSelStart + FSelLength - 1);
  end;
  for I := 0 to FVisibleLines - 1 do
  begin
    vCurrLine := I + FTopLine;
    if vCurrLine >= FLineCount then Break;
    Canvas.TextOut(
      -FItemWidth * FLeftLine, I * FItemHeight, LineViewText(vCurrLine));
    ///////Begin 绘制选中区域
    if (FSelLength > 0) and
      (vCurrLine >= vSelStart.Y) and (vCurrLine <= vSelEnd.Y) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
      if (vCurrLine = vSelStart.Y) and (vCurrLine = vSelEnd.Y) then
      begin
        vPoint := CoordinateToPoint(FColType, Point(vSelStart.X, vCurrLine));
        Canvas.TextOut(
          vPoint.X, vPoint.Y, SelectionViewText(FColType, vCurrLine, vSelStart.X, vSelEnd.X));
      end else if vCurrLine = vSelStart.Y then
      begin
        vPoint := CoordinateToPoint(FColType, Point(vSelStart.X, vCurrLine));
        Canvas.TextOut(
          vPoint.X, vPoint.Y, SelectionViewText(FColType, vCurrLine, vSelStart.X, 15));
      end else if vCurrLine = vSelEnd.Y then
      begin
        vPoint := CoordinateToPoint(FColType, Point(0, vCurrLine));
        Canvas.TextOut(
          vPoint.X, vPoint.Y, SelectionViewText(FColType, vCurrLine, 0, vSelEnd.X))
      end else if (vCurrLine > vSelStart.Y) and (vCurrLine < vSelEnd.Y) then
      begin
        vPoint := CoordinateToPoint(FColType, Point(0, vCurrLine));
        Canvas.TextOut(
          vPoint.X, vPoint.Y, SelectionViewText(FColType, vCurrLine, 0, 15))
      end;

      Canvas.Brush.Style := bsClear;
      if FColType = moChar then
        vUnColType := moHex
      else vUnColType := moChar;
      if (vCurrLine = vSelStart.Y) and (vCurrLine = vSelEnd.Y) then
      begin
        vRect.TopLeft := CoordinateToPoint(vUnColType, Point(vSelStart.X, vCurrLine));
        vRect.BottomRight := CoordinateToPoint(vUnColType, Point(vSelEnd.X, vCurrLine));
        vRect.BottomRight.X := vRect.BottomRight.X + FItemWidth *(1 + Ord(vUnColType = moHex));
        vRect.BottomRight.Y := vRect.BottomRight.Y + FItemHeight;
        Canvas.Rectangle(vRect);
      end else if vCurrLine = vSelStart.Y then
      begin
        vRect.TopLeft := CoordinateToPoint(vUnColType, Point(vSelStart.X, vCurrLine));
        vRect.BottomRight := CoordinateToPoint(vUnColType, Point(15, vCurrLine));
        vRect.BottomRight.X := vRect.BottomRight.X + FItemWidth *(1 + Ord(vUnColType = moHex));
        vRect.BottomRight.Y := vRect.BottomRight.Y + FItemHeight;

        Canvas.MoveTo(vRect.TopLeft.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.TopLeft.X, vRect.BottomRight.Y);
        Canvas.MoveTo(vRect.BottomRight.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.BottomRight.X, vRect.BottomRight.Y);

        Canvas.MoveTo(vRect.TopLeft.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.BottomRight.X, vRect.TopLeft.Y);

        vRect.BottomRight := CoordinateToPoint(vUnColType, Point(0, vCurrLine));
        vRect.BottomRight.Y := vRect.BottomRight.Y + FItemHeight;
        Canvas.MoveTo(vRect.TopLeft.X, vRect.BottomRight.Y);
        Canvas.LineTo(vRect.BottomRight.X, vRect.BottomRight.Y);
      end else if vCurrLine = vSelEnd.Y then
      begin
        vRect.TopLeft := CoordinateToPoint(vUnColType, Point(0, vCurrLine));
        vRect.BottomRight := CoordinateToPoint(vUnColType, Point(vSelEnd.X, vCurrLine));
        vRect.BottomRight.X := vRect.BottomRight.X + FItemWidth *(1 + Ord(vUnColType = moHex));
        vRect.BottomRight.Y := vRect.BottomRight.Y + FItemHeight;
        Canvas.MoveTo(vRect.TopLeft.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.TopLeft.X, vRect.BottomRight.Y);
        Canvas.MoveTo(vRect.BottomRight.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.BottomRight.X, vRect.BottomRight.Y);

        Canvas.MoveTo(vRect.TopLeft.X, vRect.BottomRight.Y);
        Canvas.LineTo(vRect.BottomRight.X, vRect.BottomRight.Y);

        vRect.TopLeft := CoordinateToPoint(vUnColType, Point(vSelEnd.X, vCurrLine));
        vRect.TopLeft.X := vRect.TopLeft.X + FItemWidth *(1 + Ord(vUnColType = moHex));
        vRect.BottomRight := CoordinateToPoint(vUnColType, Point(15, vCurrLine));
        vRect.BottomRight.X := vRect.BottomRight.X + FItemWidth *(1 + Ord(vUnColType = moHex));
        Canvas.MoveTo(vRect.TopLeft.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.BottomRight.X, vRect.TopLeft.Y);
      end else if (vCurrLine > vSelStart.Y) and (vCurrLine < vSelEnd.Y) then
      begin
        vRect.TopLeft := CoordinateToPoint(vUnColType, Point(0, vCurrLine));
        vRect.BottomRight := CoordinateToPoint(vUnColType, Point(15, vCurrLine));
        vRect.BottomRight.X := vRect.BottomRight.X + FItemWidth *(1 + Ord(vUnColType = moHex));
        vRect.BottomRight.Y := vRect.BottomRight.Y + FItemHeight;
        Canvas.MoveTo(vRect.TopLeft.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.TopLeft.X, vRect.BottomRight.Y);
        Canvas.MoveTo(vRect.BottomRight.X, vRect.TopLeft.Y);
        Canvas.LineTo(vRect.BottomRight.X, vRect.BottomRight.Y);
      end;
      Canvas.Font.Assign(Font);
    end;
    ///////End 绘制选中区域
  end;
end;

procedure TLovelyHex20.SaveToFile(mFileName: TFileName);
begin
  FMemoryStream.SaveToFile(mFileName);
end;

procedure TLovelyHex20.SaveToStream(mStream: TStream);
begin
  FMemoryStream.SaveToStream(mStream);
end;

function TLovelyHex20.ScrollIntoView: Boolean;
var
  vCharIndex: Integer;
begin
  Result := False;
  if FRowIndex < FTopLine then
  begin
    Result := True;
    TopLine := FRowIndex;
  end
  else if FRowIndex >= (FTopLine + FVisibleLines) - 1 then
  begin
    TopLine := FRowIndex - (FVisibleLines - 2);
    Result := True;
  end;

  vCharIndex := ColToChar(FColType, FColIndex);
  if vCharIndex < FLeftLine then
  begin
    Result := True;
    LeftLine := vCharIndex;
  end
  else if vCharIndex >= (FLeftLine + FVisibleChars) - 1 then
  begin
    Result := True;
    LeftLine := vCharIndex - (FVisibleChars - 2);
  end;
  AdjustScrollBars;
end;

procedure TLovelyHex20.SetBaseAddress(const Value: Integer);
begin
  FBaseAddress := Value;
  Invalidate;
end;

procedure TLovelyHex20.SetRowIndex(Value: Integer);
var
  R: TRect;
begin
  if Value <> FRowIndex then
  begin
    if Value < 0 then Value := 0;
    if Value >= FLineCount then Value := FLineCount - 1;

    if (FRowIndex >= FTopLine) and (FRowIndex < FTopLine + FVisibleLines - 1) then
    begin
      R := Bounds(0, 0, 1, FItemHeight);
      OffsetRect(R, 0, (FRowIndex - FTopLine) * FItemHeight);
      Windows.InvalidateRect(Handle, @R, True);
    end;
    FRowIndex := Value;

    R := Bounds(0, 0, 1, FItemHeight);
    OffsetRect(R, 0, (FRowIndex - FTopLine) * FItemHeight);
    Windows.InvalidateRect(Handle, @R, True);

    if FRowIndex = FLineCount - 1 then
    begin
      ColIndex := Min(ColIndex, RowMaxIndex(FRowIndex));
      ScrollIntoView;
      UpdateCaret;
      Exit;
    end;
    ScrollIntoView;
    UpdateCaret;
  end;
end;

procedure TLovelyHex20.SetLeftLine(Value: Integer);
var
  LinesMoved: Integer;
  vRect: TRect;
begin
  if Value <> FLeftLine then
  begin
    if Value < 0 then Value := 0;
    if Value >= 76 then Value := 76 - 1;
    LinesMoved := FLeftLine - Value;
    FLeftLine := Value;
    SetScrollPos(Handle, SB_HORZ, FLeftLine, True);
    if Abs(LinesMoved) = 1 then
    begin
      vRect := Bounds(1, 0, ClientWidth - FItemWidth, ClientHeight);
      if LinesMoved = 1 then OffsetRect(vRect, FItemWidth, 0);
      ScrollWindow(Handle, FItemWidth * LinesMoved, 0, @vRect, nil);
      if LinesMoved = -1 then
      begin
        vRect.Left := ClientWidth - FItemWidth;
        vRect.Right := ClientWidth;
      end
      else
      begin
        vRect.Left := 0;
        vRect.Right := FItemWidth;
      end;
      InvalidateRect(Handle, @vRect, False);
    end else Invalidate;
    UpdateCaret;
  end;
end;

procedure TLovelyHex20.SetTopLine(Value: Integer);
var
  LinesMoved: Integer;
  vRect: TRect;
begin
  if Value <> FTopLine then
  begin
    if Value < 0 then Value := 0;
    if Value >= FLineCount then Value := FLineCount - 1;
    LinesMoved := FTopLine - Value;
    FTopLine := Value;
    SetScrollPos(Handle, SB_VERT, FTopLine, True);
    if Abs(LinesMoved) = 1 then
    begin
      vRect := Bounds(1, 0, ClientWidth, ClientHeight - FItemHeight);
      if LinesMoved = 1 then OffsetRect(vRect, 0, FItemHeight);
      ScrollWindow(Handle, 0, FItemHeight * LinesMoved, @vRect, nil);
      if LinesMoved = -1 then
      begin
        vRect.Top := ClientHeight - FItemHeight;
        vRect.Bottom := ClientHeight;
      end
      else
      begin
        vRect.Top := 0;
        vRect.Bottom := FItemHeight;
      end;
      InvalidateRect(Handle, @vRect, False);
    end else Invalidate;
    UpdateCaret;
  end;
end;

procedure TLovelyHex20.UpdateCaret;
var
  vPos: TPoint;
begin
  DestroyCaret;
  if not Focused then Exit;
  if FSelLength > 0 then Exit;
  CreateCaret(Handle, 0, 2, Canvas.TextHeight('|'));
  ShowCaret(Handle);

  vPos := CoordinateToPoint(FColType, Point(FColIndex, FRowIndex));
  if (FColType = moHex) and (FHexChar <> #0) then
    vPos.X := vPos.X + FItemWidth * 2;
  SetCaretPos(vPos.X, vPos.Y);
end;

procedure TLovelyHex20.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS or DLGC_WANTTAB;
end;

procedure TLovelyHex20.WMHScroll(var Message: TWMHScroll);
var
  NewLeftLine: Integer;
  LinesMoved: Integer;
  vRect: TRect;
begin
  inherited;
  if not Focused then SetFocus; 
  NewLeftLine := FLeftLine;
  case Message.ScrollCode of
    SB_LINEDOWN: Inc(NewLeftLine);
    SB_LINEUP: Dec(NewLeftLine);
    SB_PAGEDOWN: Inc(NewLeftLine, FVisibleLines - 1);
    SB_PAGEUP: Dec(NewLeftLine, FVisibleLines - 1);
    SB_THUMBPOSITION, SB_THUMBTRACK: NewLeftLine := Message.Pos;
  end;

  if NewLeftLine >= 76 - FVisibleChars + 1 then
    NewLeftLine := 76 - FVisibleChars + 1;
  if NewLeftLine < 0 then NewLeftLine := 0;

  if NewLeftLine <> FLeftLine then
  begin
    LinesMoved := FLeftLine - NewLeftLine;
    FLeftLine := NewLeftLine;
    SetScrollPos(Handle, SB_HORZ, FLeftLine, True);
    if Abs(LinesMoved) = 1 then
    begin
      vRect := Bounds(0, 0, ClientWidth - FItemWidth, ClientHeight);
      if LinesMoved = 1 then OffsetRect(vRect, FItemWidth, 0);
      ScrollWindow(Handle, FItemWidth * LinesMoved, 0, @vRect, nil);
      if LinesMoved = -1 then
      begin
        vRect.Left := ClientWidth;
        vRect.Right := ClientWidth - FItemWidth;
      end else
      begin
        vRect.Left := 0;
        vRect.Right := FItemWidth;
      end;
      Windows.InvalidateRect(Handle, @vRect, False);
    end else Invalidate;
    UpdateCaret;
  end;
end;

procedure TLovelyHex20.WMSize(var Message: TWMSize);
begin
  inherited;
  DoChange;
end;

procedure TLovelyHex20.WMVScroll(var Message: TWMVScroll);
{$J+}
const
  vPos: Integer = 0;
  vTracking: Boolean = False;
  vMouseY: Integer = 0;
{$J-}
var
  NewTopLine: Integer;
  LinesMoved: Integer;
  I: Integer;
  vRect: TRect;
begin
  inherited;
  if not Focused then SetFocus;
  NewTopLine := FTopLine;
  case Message.ScrollCode of
    SB_LINEDOWN: Inc(NewTopLine);
    SB_LINEUP: Dec(NewTopLine);
    SB_PAGEDOWN: Inc(NewTopLine, FVisibleLines div 2);
    SB_PAGEUP: Dec(NewTopLine, FVisibleLines div 2);
    SB_THUMBPOSITION: vTracking := False;
    SB_THUMBTRACK:
    begin
      if not vTracking then
      begin
        vPos := Message.Pos;
        vMouseY := Mouse.CursorPos.Y;
      end;
      vTracking := True;
      I := Message.Pos - vPos;
      if (I > 0) and (vMouseY > Mouse.CursorPos.Y) then
        I := (Message.Pos) - (High(Smallint) * 2 + vPos);
      if (I < 0) and (vMouseY < Mouse.CursorPos.Y) then
        I := (High(Smallint) * 2 + Message.Pos) - vPos;
      NewTopLine := GetScrollPos(Handle, SB_VERT) + I;
      vPos := Message.Pos;
      vMouseY := Mouse.CursorPos.Y;
    end;
  end;
  if NewTopLine >= FLineCount - FVisibleLines + 1 then
    NewTopLine := FLineCount - FVisibleLines + 1;
  if NewTopLine < 0 then NewTopLine := 0;

  if NewTopLine <> FTopLine then
  begin
    LinesMoved := FTopLine - NewTopLine;
    FTopLine := NewTopLine;
    SetScrollPos(Handle, SB_VERT, FTopLine, True);
    if Abs(LinesMoved) = 1 then
    begin
      vRect := Bounds(0, 0, ClientWidth, ClientHeight - FItemHeight);
      if LinesMoved = 1 then OffsetRect(vRect, 0, FItemHeight);
      ScrollWindow(Handle, 0, FItemHeight * LinesMoved, @vRect, nil);
      if LinesMoved = -1 then
      begin
        vRect.Top := ClientHeight - FItemHeight;
        vRect.Bottom := ClientHeight;
      end else
      begin
        vRect.Top := 0;
        vRect.Bottom := FItemHeight;
      end;
      Windows.InvalidateRect(Handle, @vRect, False);
    end else Invalidate;
    UpdateCaret;
  end;
end;

procedure TLovelyHex20.SetColIndex(Value: Integer);
var
  R: TRect;
  vCharIndex: Integer;
begin
  if Value <> FColIndex then
  begin
    if Value < 0 then Value := 0;
    if Value > RowMaxIndex(FRowIndex) then Value := RowMaxIndex(FRowIndex);
    FColIndex := Value;
    vCharIndex := ColToChar(FColType, FColIndex);

    if (vCharIndex >= FLeftLine) and (vCharIndex < FLeftLine + 76 - 1) then
    begin
      R := Bounds(0, 0, 1, FItemHeight);
      OffsetRect(R, (vCharIndex - FLeftLine) * FItemWidth, 0);
      Windows.InvalidateRect(Handle, @R, True);
    end;
    FColIndex := Value;

    vCharIndex := ColToChar(FColType, FColIndex);
    R := Bounds(0, 0, 1, FItemHeight);
    OffsetRect(R, (vCharIndex - FLeftLine) * FItemWidth, 0);
    Windows.InvalidateRect(Handle, @R, True);

    ScrollIntoView;
    UpdateCaret;
  end;
end;

procedure TLovelyHex20.SetColType(const Value: TMouseObject);
begin
  if FColType = Value then Exit;
  FColType := Value;
  ScrollIntoView;
  UpdateCaret;
  Invalidate;
end;

function TLovelyHex20.RowMaxIndex(mRowIndex: Integer): Integer;
begin
  if mRowIndex < 0 then
    Result := 0
  else if mRowIndex >= FLineCount then
    Result := 0
  else if mRowIndex = FLineCount - 1 then
    Result := FMemoryStream.Size mod 16
  else Result := 15;
end;

function TLovelyHex20.ColToChar(mColType: TMouseObject;
  mCol: Integer): Integer;
begin
  Result := 0;
  case mColType of
    moChar: Result := 60 + mCol;
    moHex:
    begin
      case mCol  of
        0..7: Result := 10 + mCol * 3;
        8..15: Result := 11 + mCol * 3;
      end;
    end;
  end;
end;

procedure TLovelyHex20.SetReadOnly(const Value: Boolean);
begin
  if FReadOnly = Value then Exit;
  FReadOnly := Value;
  if FReadOnly then Cursor := crDefault;
end;

procedure TLovelyHex20.SetSelLength(const Value: Integer);
var
  vCaretPoint: TPoint;
begin
  if FSelLength = Value then Exit;
  FSelLength := Max(Min(Value, FMemoryStream.Size - FSelStart), 0);
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
  vCaretPoint := PositionToCoordinate(FSelStart + FSelLength);
  FColIndex := vCaretPoint.X;
  FRowIndex := vCaretPoint.Y;
  Invalidate;
end;

procedure TLovelyHex20.SetSelStart(Value: Integer);
var
  vCaretPoint: TPoint;
begin
  if FSelStart = Value then Exit;
  FSelStart := Max(Min(Value, FMemoryStream.Size), 0);
  FSelLength := Max(Min(FSelLength, FMemoryStream.Size - FSelStart), 0);
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
  vCaretPoint := PositionToCoordinate(FSelStart + FSelLength);
  FColIndex := vCaretPoint.X;
  FRowIndex := vCaretPoint.Y;
  Invalidate;
end;

procedure TLovelyHex20.SelectionChange;
var
  vSelLength: Integer;
begin
  vSelLength := FSelLength;

  FSelStart := Max(Min(FRowIndex * 16 + FColIndex, FMemoryStream.Size), 0);
  FSelLength := 0;
  FHexChar := #0;
  if vSelLength > 0 then Invalidate;
  UpdateCaret;
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
//  TForm(Parent).Caption := Format('SelStart:%d SelLength:%d', [FSelStart, FSelLength]);
end;

function TLovelyHex20.PositionToCoordinate(mPosition: Integer): TPoint;
begin
  Result := Point(-1, -1);
  if mPosition < 0 then Exit;
  if mPosition > FMemoryStream.Size then Exit;
  Result.X := mPosition mod 16;
  Result.Y := mPosition div 16;
end;

function TLovelyHex20.SelectionViewText(mColType: TMouseObject;
  mLineIndex: Integer; mStart, mEnd: Integer): string;
const
  cHexDigits : array[0..15] of Char = '0123456789ABCDEF';
var
  I, L: Integer;
  vBytes: array[0..15] of Byte;
  S: string;
begin
  Result := ''; 
  if mLineIndex < 0 then Exit;
  FMemoryStream.Position := mLineIndex * 16;
  L := FMemoryStream.Read(vBytes, 16);
  S := '';
  for I := Max(0, mStart) to Min(15, mEnd) do
  begin
    case mColType of
      moHex: if I = 8 then Result := Result + ' ';
      moChar: ;
    end;
    if I < L then
    begin
      case mColType of
        moHex:
          Result := Result + cHexDigits[vBytes[I] shr $04] +
            cHexDigits[vBytes[I] and $0F] + ' ';
        moChar:
          if vBytes[I] in [32..126] then
            Result := Result + Chr(vBytes[I])
          else Result := Result + '.';
      end;
    end;
  end;
  if mColType = moHex then Result := Trim(Result);
end;

procedure TLovelyHex20.SetAnchorOffset(Value: Integer);
var
  vCaretPoint: TPoint;
begin
  if FAnchorStart = Value then Exit;
  if FAnchorStart + Value < 0 then Exit;
  if FAnchorStart + Value > FMemoryStream.Size then Exit;
  FAnchorOffset := Value;
  FSelLength := Abs(FAnchorOffset);

  if FAnchorOffset < 0 then
  begin
    FSelStart := FAnchorStart + FAnchorOffset;
    vCaretPoint := PositionToCoordinate(FSelStart);
  end else
  begin
    FSelStart := FAnchorStart;
    vCaretPoint := PositionToCoordinate(FSelStart + FSelLength);
  end;
  FColIndex := vCaretPoint.X;
  FRowIndex := vCaretPoint.Y;
  ScrollIntoView;
  UpdateCaret;
  Invalidate;
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
//  TForm(Parent).Caption := Format('SelStart:%d SelLength:%d', [FSelStart, FSelLength]);
end;

procedure TLovelyHex20.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  vCoordinate: TPoint;
begin
  inherited;
  FMouseDown := False;
  case MouseObject(Point(X, Y), vCoordinate) of
    moAddress: Cursor := crDefault;
    moHex: Cursor := crIBeam;
    moChar: Cursor := crIBeam;
    moNone: Cursor := crDefault;
  end;
end;

function TLovelyHex20.CoordinatePosition(mCoordinate: TPoint): Integer;
begin
  Result :=
    Max(Min(mCoordinate.Y * 16 + mCoordinate.X, FMemoryStream.Size), 0);
end;

procedure TLovelyHex20.WMCHAR(var Msg: TWMChar);
var
  vChar: Char;
  vCoordinate: TPoint;
  vRect: TRect;
  vSelStart: Integer;
begin
  inherited;
  if FReadOnly then Exit;
  if not FChangeDataSize and (FSelStart >= FMemoryStream.Size) then Exit;
  case Msg.CharCode of
    0..27, 128..255: Exit;
  end;

  FMemoryStream.Position := FSelStart;
  vSelStart := FSelStart;
  if FColType = moHex then
  begin
    case Msg.CharCode of
      Ord('0')..Ord('9'): ;
      Ord('A')..Ord('F'): ;
      Ord('a')..Ord('f'): ;
    else Exit;
    end;
    if FHexChar = #0 then
    begin
      FHexChar := Char(Msg.CharCode);
      vChar := Char(StrToIntDef('$' + FHexChar, 0));
    end else
    begin
      vChar := Char(StrToIntDef('$' + FHexChar + Char(Msg.CharCode), 0));
      FSelStart := FSelStart + 1;
      FHexChar := #0;
    end;
  end else if FColType = moChar then
  begin
    vChar := Char(Msg.CharCode);
    FSelStart := FSelStart + 1;
  end;
  { TODO -c2006.11.17 -oZswangY37 : 考虑采用插入模式输入 }
//  Stream_Insert(FMemoryStream, FSelStart - 1, vChar, 1);
  FMemoryStream.Position := vSelStart;
  FMemoryStream.Write(vChar, SizeOf(vChar));
  vCoordinate := PositionToCoordinate(FSelStart);
  FRowIndex := vCoordinate.Y;
  FColIndex := vCoordinate.X;
  if FSelStart = FMemoryStream.Size then
    DoChange;
  if FSelLength > 0 then
  begin
    FSelLength := 0;
    Invalidate;
  end else
  begin
    vCoordinate := PositionToCoordinate(vSelStart);
    vRect.TopLeft := CoordinateToPoint(moChar, vCoordinate);
    vRect.BottomRight.X := vRect.TopLeft.X + FItemWidth;
    vRect.BottomRight.Y := vRect.TopLeft.Y + FItemHeight;
    Windows.InvalidateRect(Handle, @vRect, True);

    vRect.TopLeft := CoordinateToPoint(moHex, vCoordinate);
    vRect.BottomRight.X := vRect.TopLeft.X + FItemWidth * 3;
    vRect.BottomRight.Y := vRect.TopLeft.Y + FItemHeight;
    Windows.InvalidateRect(Handle, @vRect, True);
  end;
  UpdateCaret;
end;

procedure TLovelyHex20.WMIMECHAR(var Msg: TWMImeChar);
var
  vCoordinate: TPoint;
  vRect: TRect;
begin
  inherited;
  if FReadOnly then Exit;
  FMemoryStream.Position := FSelStart;
  if FColType = moChar then
  begin
    { TODO -c2006.11.17 -oZswangY37 : 考虑采用插入模式输入 }
    FMemoryStream.Write(Msg.CharCode, 2);
    FSelStart := FSelStart + 2;
    vCoordinate := PositionToCoordinate(FSelStart);
    FRowIndex := vCoordinate.Y;
    FColIndex := vCoordinate.X;
    if FSelStart = FMemoryStream.Size then
      DoChange;
    if FSelLength > 0 then
    begin
      FSelLength := 0;
      Invalidate;
    end else
    begin
      vCoordinate := PositionToCoordinate(FSelStart - 2);
      vRect.TopLeft := CoordinateToPoint(moChar, vCoordinate);
      vRect.BottomRight.X := vRect.TopLeft.X + FItemWidth * 2;
      vRect.BottomRight.Y := vRect.TopLeft.Y + FItemHeight;
      Windows.InvalidateRect(Handle, @vRect, True);

      vRect.TopLeft := CoordinateToPoint(moHex, vCoordinate);
      vRect.BottomRight.X := vRect.TopLeft.X + FItemWidth * 4 * 2;
      vRect.BottomRight.Y := vRect.TopLeft.Y + FItemHeight;
      Windows.InvalidateRect(Handle, @vRect, True);
    end;
    UpdateCaret;
  end;
end;

function TLovelyHex20.GetSelText: string;
begin
  Result := '';
  if FSelLength <= 0 then Exit;
  SetLength(Result, FSelLength);
  FMemoryStream.Position := FSelStart;
  FMemoryStream.Read(Result[1], FSelLength);
end;

procedure TLovelyHex20.SetSelText(const Value: string);
var
  vCaretPoint: TPoint;
  L: Integer;
begin
  L := Length(Value);
  if (L <= 0) and (FSelLength <= 0) then Exit;
  if FSelLength > 0 then
    Stream_Delete(FMemoryStream, FSelStart, FSelLength);
  if L > 0 then
    Stream_Insert(FMemoryStream, FSelStart, Value[1], L);
  FSelLength := 0;
  FSelStart := FSelStart + L;
  vCaretPoint := PositionToCoordinate(FSelStart + FSelLength);
  FColIndex := vCaretPoint.X;
  FRowIndex := vCaretPoint.Y;
  DoChange;
end;

procedure TLovelyHex20.DoEnter;
begin
  inherited;
  UpdateCaret;
end;

procedure TLovelyHex20.DoExit;
begin
  inherited;
  UpdateCaret;
end;

procedure TLovelyHex20.LoadFromBuffer(const mBuffer; mSize: Integer);
begin
  FMemoryStream.Clear;
  FMemoryStream.Write(mBuffer, mSize);
  FSelLength := 0;
  FSelStart := 0;
  FColIndex := 0;
  FRowIndex := 0;
  DoChange;
end;

procedure TLovelyHex20.SaveToBuffer(var nBuffer; mSize: Integer);
begin
  FMemoryStream.Position := 0;
  FMemoryStream.Read(nBuffer, mSize);
end;

end.
