unit HexEditorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LovelyHex20, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls,
  Menus;

type
  TFormHexEditor = class(TForm)
    ToolBarTools: TToolBar;
    ToolButtonSave: TToolButton;
    ImageListTools: TImageList;
    ActionListOne: TActionList;
    ActionOk: TAction;
    ActionPageUp: TAction;
    ActionPageDown: TAction;
    ToolButtonPageUp: TToolButton;
    ToolButtonPageDown: TToolButton;
    ToolButtonSeparator: TToolButton;
    TimerButton: TTimer;
    ActionCopy: TAction;
    ToolButtonCope: TToolButton;
    PopupMenuOne: TPopupMenu;
    MenuItemCopy: TMenuItem;
    MenuItemOk: TMenuItem;
    MenuItemPageDown: TMenuItem;
    MenuItemPageUp: TMenuItem;
    StatusBarOne: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure ActionPageUpExecute(Sender: TObject);
    procedure ActionPageDownExecute(Sender: TObject);
    procedure TimerButtonTimer(Sender: TObject);
    procedure ToolButtonPageUpMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ToolButtonPageUpMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionCopyExecute(Sender: TObject);
    procedure ActionListOneUpdate(Action: TBasicAction;
      var Handled: Boolean);
  private
    { Private declarations }
    FLovelyHex20: TLovelyHex20;
    FAutoFree: Boolean;
    FAddress: Integer;
    FProcessFileName: string;
    FFileSize: Longword;
    FChanging: Boolean;
    FDownButton: TControl;
    FDownTickCount: DWORD;
    FActionRefurbish: TAction;
    procedure LovelyHex20SelectionChange(Sender: TObject);
  public
    { Public declarations }
    property AutoFree: Boolean read FAutoFree write FAutoFree;
    property Address: Integer read FAddress write FAddress;
    property ProcessFileName: string read FProcessFileName write FProcessFileName;
    property ActionRefurbish: TAction read FActionRefurbish write FActionRefurbish;
    procedure GotoAddress(mAddress: Integer; mLength: Integer);
    procedure LoadConfig;
    procedure SaveConfig;
  end;

var
  FormHexEditor: TFormHexEditor;

implementation

{$R *.dfm}

uses IniFiles, Clipbrd, CommonFunctions51;

procedure TFormHexEditor.FormCreate(Sender: TObject);
begin
  Font.Name := 'FixedSys';
  FLovelyHex20 := TLovelyHex20.Create(Self);
  FLovelyHex20.Parent := Self;
  FLovelyHex20.Align := alClient;
  FLovelyHex20.ChangeDataSize := False;
  FLovelyHex20.OnSelectionChange := LovelyHex20SelectionChange;
  FLovelyHex20.PopupMenu := PopupMenuOne;
  LoadConfig;
end;

procedure TFormHexEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WindowState := wsNormal;
  if AutoFree then Action := caFree;
end;

procedure TFormHexEditor.GotoAddress(mAddress: Integer; mLength: Integer);
var
  S: string;
begin
  if mAddress < 0 then Exit;
  if not FileExists(FProcessFileName) then Exit;
  with TFileStream.Create(FProcessFileName, fmShareDenyNone) do try
    FFileSize := Size;
  finally
    Free;
  end;
  if Longword(mAddress) >= FFileSize then Exit;

  S := File_Read(FProcessFileName, mAddress div $1000 * $1000, $1000);
  if S = '' then Exit;
  FLovelyHex20.BaseAddress := mAddress div $1000 * $1000;
  FLovelyHex20.LoadFromBuffer(S[1], Length(S));
  FLovelyHex20.SelStart := mAddress - FLovelyHex20.BaseAddress;
  FLovelyHex20.SelLength := mLength;
//  FLovelyHex20.UpdateCaret;
  FLovelyHex20.ScrollIntoView;
  if FLovelyHex20.CanFocus then FLovelyHex20.SetFocus;
end;

procedure TFormHexEditor.LoadConfig;
begin
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do try
    Font.Name := ReadString(Self.ClassName, 'Font.Name', Font.Name);
    Font.Size := ReadInteger(Self.ClassName, 'Font.Size', Font.Size);
    try
      Font.Color := StringToColor(ReadString(Self.ClassName, 'Font.Color', ColorToString(Font.Color)));
    except
    end;
    Left := ReadInteger(Self.ClassName, 'Left', Left);
    Top := ReadInteger(Self.ClassName, 'Top', Top);
    Height := ReadInteger(Self.ClassName, 'Height', Height);
    Width := ReadInteger(Self.ClassName, 'Width', Width);
  finally
    Free;
  end;
end;

procedure TFormHexEditor.SaveConfig;
begin
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do try
    WriteInteger(Self.ClassName, 'Left', Left);
    WriteInteger(Self.ClassName, 'Top', Top);
    WriteInteger(Self.ClassName, 'Height', Height);
    WriteInteger(Self.ClassName, 'Width', Width);
  finally
    Free;
  end;
end;

procedure TFormHexEditor.FormDestroy(Sender: TObject);
begin
  SaveConfig;
end;

procedure TFormHexEditor.ActionOkExecute(Sender: TObject);
var
  S: string;
begin
  if FLovelyHex20.MemoryStream.Size <= 0 then Exit;
  SetLength(S, FLovelyHex20.MemoryStream.Size);
  FLovelyHex20.SaveToBuffer(S[1], Length(S));
  File_Write(FProcessFileName, FLovelyHex20.BaseAddress, S);
  if Assigned(FActionRefurbish) then FActionRefurbish.Execute;
  Close;
end;

procedure TFormHexEditor.ActionPageUpExecute(Sender: TObject);
begin
  if FLovelyHex20.BaseAddress - $1000 < 0 then Exit;
  GotoAddress(FLovelyHex20.BaseAddress - $1000, 0);
end;

procedure TFormHexEditor.ActionPageDownExecute(Sender: TObject);
begin
  if Longword(FLovelyHex20.BaseAddress + $1000) >= FFileSize then Exit;
  GotoAddress(FLovelyHex20.BaseAddress + $1000, 0);
end;

procedure TFormHexEditor.TimerButtonTimer(Sender: TObject);
begin
  if FChanging then Exit;
  if not Assigned(FDownButton) then Exit;
  if GetTickCount - FDownTickCount < 1000 then Exit;
  FChanging := True;
  try
    TToolButton(FDownButton).Click;
  finally
    FChanging := False;
  end;
end;

procedure TFormHexEditor.ToolButtonPageUpMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDownButton := TControl(Sender);
  FDownTickCount := GetTickCount;
  TimerButton.Enabled := True;
end;

procedure TFormHexEditor.ToolButtonPageUpMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TimerButton.Enabled := False;
end;

procedure TFormHexEditor.ActionCopyExecute(Sender: TObject);
begin
  Clipboard.AsText := FLovelyHex20.SelText;
end;

procedure TFormHexEditor.ActionListOneUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  ActionCopy.Enabled := FLovelyHex20.SelLength > 0;
end;

procedure TFormHexEditor.LovelyHex20SelectionChange(Sender: TObject);
begin
  StatusBarOne.Panels[0].Text :=
    Format('SelStart: %d($%0:.8x)', [TLovelyHex20(Sender).BaseAddress +
      TLovelyHex20(Sender).SelStart]);
  StatusBarOne.Panels[1].Text :=
    Format('SelLength: %d', [TLovelyHex20(Sender).SelLength]);
end;

end.
