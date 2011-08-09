unit DasmBrowerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, OleCtrls, SHDocVw, StdCtrls, StdActns,
  ActnList, ImgList, ActiveX;

type
  TAddressEvent = procedure (Sender: TObject; mAddress: Integer;
    mLength: Integer) of object;

type
  TFormDasmBrower = class(TForm)
    GroupBoxDasm: TGroupBox;
    WebBrowserDasm: TWebBrowser;
    ToolBarTools: TToolBar;
    ToolButtonSaveToFile: TToolButton;
    ComboBoxAddress: TComboBox;
    ImageListTools: TImageList;
    ActionListTools: TActionList;
    ActionSaveToFile: TAction;
    SaveDialogOne: TSaveDialog;
    ToolButtonSeparator: TToolButton;
    ActionBack: TAction;
    ActionForward: TAction;
    ToolButtonBack: TToolButton;
    ToolButtonForward: TToolButton;
    StatusBarOne: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WebBrowserDasmBeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure ActionSaveToFileExecute(Sender: TObject);
    procedure ComboBoxAddressSelect(Sender: TObject);
    procedure ActionListToolsUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure ActionBackExecute(Sender: TObject);
    procedure ActionForwardExecute(Sender: TObject);
    procedure WebBrowserDasmDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
    { Private declarations }
    FAutoFree: Boolean;
    FAddress: Integer;
    FFunctionList: TStringList;
    FDasmStrings: TStringList;
    FHTMLStrings: TStringList;
    FLoadComplete: Boolean;
    FAlreadyWarning: string;
    FProcessFileName: string;
    FOnClickAddr: TAddressEvent;
  public
    { Public declarations }
    property AutoFree: Boolean read FAutoFree write FAutoFree;
    property Address: Integer read FAddress write FAddress;
    property ProcessFileName: string read FProcessFileName write FProcessFileName;
    property FunctionList: TStringList read FFunctionList write FFunctionList;
    property OnClickAddr: TAddressEvent read FOnClickAddr write FOnClickAddr;
    procedure GotoAddress(mAddress: Integer; mRecord: Boolean = True);
    procedure LoadConfig;
    procedure SaveConfig;
  end;

//var//
//  FormDasmBrower: TFormDasmBrower;//

implementation

uses CommonFunctions51, ControlFunctions51, DasmFunctions51, StringFunctions51,
  Math, IniFiles;

{$R *.dfm}

procedure TFormDasmBrower.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WindowState := wsNormal;
  if AutoFree then Action := caFree;
end;

procedure TFormDasmBrower.FormCreate(Sender: TObject);
begin
  FDasmStrings := TStringList.Create;
  FHTMLStrings := TStringList.Create;
  WebBrowserDasm.Navigate('about:blank');
  FAlreadyWarning := '"%s" already exists. Do you want to replace it?';
  LoadConfig;
end;

procedure TFormDasmBrower.GotoAddress(mAddress: Integer;
  mRecord: Boolean = True);
var
  S: string;
  vSize: Integer;
  I: Integer;
begin
  if mRecord then
    ComboBoxAddress.Items.AddObject(Format('$%.8x', [mAddress]), Pointer(mAddress));
  vSize := $1000;
  if Assigned(FFunctionList) then
    for I := 0 to FFunctionList.Count - 1 do
    begin
      if mAddress < Integer(FFunctionList.Objects[I]) then
      begin
        vSize := Integer(FFunctionList.Objects[I]) - vSize;
        Break;
      end;
    end;
  vSize := Min(vSize, $1000);
  S := File_Read(FProcessFileName, mAddress, vSize);
  if S = '' then Exit;
  DasmToStrings(mAddress, S, FDasmStrings, True, True, FFunctionList);
  DasmToHTML(FDasmStrings, FHTMLStrings, True);
  FLoadComplete := WebBrowserLoadFromString(WebBrowserDasm, FHTMLStrings.Text);
  if mRecord then
  begin
    for I := ComboBoxAddress.Items.Count - 1 downto
      ComboBoxAddress.ItemIndex + 2 do
      ComboBoxAddress.Items.Delete(I);
    ComboBoxAddress.ItemIndex := ComboBoxAddress.Items.Count - 1;
  end;
end;

procedure TFormDasmBrower.FormDestroy(Sender: TObject);
begin
  FDasmStrings.Free;
  FHTMLStrings.Free;
  SaveConfig;
end;

procedure TFormDasmBrower.WebBrowserDasmBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  vAddress: Integer;
  vLength: Integer;
begin
  if URL = 'about:blank' then Exit;
  Cancel := True; //取消打开
  if Pos('goto:', URL) = 1 then
  begin
    vAddress := StrToIntDef(StrRight(URL, 'goto:'), 0);
    GotoAddress(vAddress);
  end else if Pos('addr:', URL) = 1 then
  begin
    vAddress := StrToIntDef(StrLeft(StrRight(URL, 'addr:'), ','), 0);
    vLength := StrToIntDef(StrRight(StrRight(URL, 'addr:'), ','), 0);
    if Assigned(OnClickAddr) then OnClickAddr(Self, vAddress, vLength);
  end;
end;

procedure TFormDasmBrower.ActionSaveToFileExecute(Sender: TObject);
begin
  with SaveDialogOne do begin
    FileName := ComboBoxAddress.Text;
    if not Execute then Exit;
    if ExtractFileExt(FileName) = '' then
      FileName := ChangeFileExt(FileName, DefaultExt);
    if FileExists(FileName) and
      (MessageDlg(Format(FAlreadyWarning,
      [FileName]), mtWarning, [mbYes, mbNo], 0) <> mrYes) then Exit;
     FDasmStrings.SaveToFile(FileName);
  end;
end;

procedure TFormDasmBrower.LoadConfig;
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

    FAlreadyWarning := ReadString('ResourceString', 'AlreadyWarning', FAlreadyWarning);
    ActionSaveToFile.Caption := ReadString('ResourceString', 'SaveToFileCaption', ActionSaveToFile.Caption);
    ActionSaveToFile.Hint := ReadString('ResourceString', 'SaveToFileHint', ActionSaveToFile.Hint);
  finally
    Free;
  end;
end;

procedure TFormDasmBrower.SaveConfig;
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

procedure TFormDasmBrower.ComboBoxAddressSelect(Sender: TObject);
begin
  GotoAddress(Integer(TComboBox(Sender).Items.Objects[
    TComboBox(Sender).ItemIndex]), False);
end;

procedure TFormDasmBrower.ActionListToolsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  ActionBack.Enabled := ComboBoxAddress.ItemIndex > 0;
  ActionForward.Enabled :=
    ComboBoxAddress.ItemIndex < ComboBoxAddress.Items.Count - 1;
end;

procedure TFormDasmBrower.ActionBackExecute(Sender: TObject);
begin
  ComboBoxAddress.ItemIndex := ComboBoxAddress.ItemIndex - 1;
  ComboBoxAddressSelect(ComboBoxAddress);
end;

procedure TFormDasmBrower.ActionForwardExecute(Sender: TObject);
begin
  ComboBoxAddress.ItemIndex := ComboBoxAddress.ItemIndex + 1;
  ComboBoxAddressSelect(ComboBoxAddress);
end;

procedure TFormDasmBrower.WebBrowserDasmDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if FLoadComplete then Exit;
  FLoadComplete := WebBrowserLoadFromString(WebBrowserDasm, FHTMLStrings.Text);
end;

initialization
  OleInitialize(nil);

finalization
  OleUninitialize;
  
end.
