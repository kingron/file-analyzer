(*//
标题:文件分析器
说明:提供全面的搜索功能和普通的编辑功能
日期:2004-09-30
支持:jihu.wang#gmail.com
设计:ZswangY37
//*)

//*******Begin 修改日志*******// 文件搜索器日志
//----------------------------------------------------------------------1.00.001
//2004-03-20 ZswangY37 No.1 新建 搜索流的函数 字符的转换 多种类型文件
//----------------------------------------------------------------------1.00.002
//2004-03-21 ZswangY37 No.1 添加 配置的存储
//2004-03-21 ZswangY37 No.2 添加 忽略大小写
//----------------------------------------------------------------------1.00.003
//2004-03-22 ZswangY37 No.1 添加 搜索结果追加
//2004-03-22 ZswangY37 No.2 添加 在搜索结果中搜索
//----------------------------------------------------------------------1.00.004
//2004-03-24 ZswangY37 No.1 修正 搜索结果追加后条数不应该显示为总条数
//2004-03-24 ZswangY37 No.2 修正 可以只搜索文件名
//----------------------------------------------------------------------1.00.005
//2004-03-25 ZswangY37 No.1 添加 保存搜索过的目录名
//2004-03-25 ZswangY37 No.2 修改 将选择目录的方式改成对话方式
//----------------------------------------------------------------------1.00.006
//2004-03-28 ZswangY37 No.1 修正 搜索在缓冲区边界时结尾字符没有处理包含情况
//2004-03-28 ZswangY37 No.2 修正 将DisplayToWideString()用DisplayToString()替换
//----------------------------------------------------------------------1.01.000
//2006-09-25 ZswangY37 No.1 升级 1.00->1.01提供更多的输入格式
//----------------------------------------------------------------------1.01.001
//2006-09-27 ZswangY37 No.1 添加 文件托拽到其他进程的功能
//*******End 修改日志*******//

//*******Begin 修改日志*******//
//2004-09-30 ZswangY37 No.1 建立
//----------------------------------------------------------------------1.01.001
//2006-09-15 ZswangY37 No.1 调整 将常用的搜索格式提前
//2006-09-15 ZswangY37 No.2 添加 C语言字符串表达式搜索
//----------------------------------------------------------------------1.01.002
//2006-09-16 ZswangY37 No.1 添加 托拽文件方式选择文件名
//----------------------------------------------------------------------1.01.003
//2006-09-18 ZswangY37 No.1 完善 避免ComboBox大小改变的时候出现选中状态错误显示
//2006-09-18 ZswangY37 No.2 添加 添加程序验证功能，避免程序文件被修改
//----------------------------------------------------------------------1.01.004
//2006-09-19 ZswangY37 No.1 完善 避免验证失败后覆盖原来的配置文件
//----------------------------------------------------------------------1.01.005
//2006-09-23 ZswangY37 No.1 添加 处理第二个命令行参数
//----------------------------------------------------------------------1.01.006
//2006-10-22 ZswangY37 No.1 合并 将文件搜索器合并
//2006-10-22 ZswangY37 No.2 完善 将文件搜索器的功能添加过来
//2006-10-22 ZswangY37 No.3 添加 整数输入框转换为16进制数值表达式
//----------------------------------------------------------------------1.01.007
//2006-10-23 ZswangY37 No.1 优化 汇编浏览器可以点击地址修改指令或数据
//----------------------------------------------------------------------1.01.008
//2006-11-17 ZswangY37 No.1 优化 拖拽选择窗体时，按下鼠标获取到文件后焦点置回本窗体
//----------------------------------------------------------------------1.01.009
//2008-01-18 ZswangY37 No.1 优化 清除无效的选项
//*******End 修改日志*******//

unit FileAnalyzerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, ComCtrls, ToolWin, StdCtrls, ImgList, ExtCtrls,
  DragDrop, DropTarget, DragDropFile, DropSource, Buttons;

type
  TFormFileAnalyzer = class(TForm)
    MainMenuOne: TMainMenu;
    MenuItemFile: TMenuItem;
    MenuItemSearch: TMenuItem;
    StatusBarOne: TStatusBar;
    LabelHttp: TLabel;
    ImageListDrag: TImageList;
    GroupBoxSearch: TGroupBox;
    PageControlSearch: TPageControl;
    TabSheetGeneral: TTabSheet;
    ComboBoxGeneral: TComboBox;
    TabSheetMark: TTabSheet;
    ComboBoxMark: TComboBox;
    TabSheetBin: TTabSheet;
    ComboBoxBin: TComboBox;
    TabSheetHex: TTabSheet;
    ComboBoxHex: TComboBox;
    TabSheetBase64: TTabSheet;
    ComboBoxBase64: TComboBox;
    TabSheetPascal: TTabSheet;
    ComboBoxPascal: TComboBox;
    TabSheetSmallint: TTabSheet;
    ComboBoxSmallint: TComboBox;
    TabSheetInteger: TTabSheet;
    ComboBoxInteger: TComboBox;
    TabSheetInt64: TTabSheet;
    ComboBoxInt64: TComboBox;
    TabSheetSingle: TTabSheet;
    ComboBoxSingle: TComboBox;
    TabSheetDouble: TTabSheet;
    ComboBoxDouble: TComboBox;
    TabSheetGUID: TTabSheet;
    ComboBoxGUID: TComboBox;
    GroupBoxRange: TGroupBox;
    CheckBoxIgnoreCase: TCheckBox;
    GroupBoxFileList: TGroupBox;
    ListViewFileList: TListView;
    ToolBarSelect: TToolBar;
    ToolButtonSelectFile: TToolButton;
    ToolButtonSeparatorSelect: TToolButton;
    ComboBoxSelect: TComboBox;
    ImageListSort: TImageList;
    ImageListTools: TImageList;
    ActionListTools: TActionList;
    ActionAddressInc: TAction;
    ActionAddressDec: TAction;
    ActionLengthInc: TAction;
    ActionLengthDec: TAction;
    ActionSearch: TAction;
    ActionSelectFile: TAction;
    ActionAddress1Byte: TAction;
    ActionAddress16Byte: TAction;
    ActionAddress32Byte: TAction;
    ActionAddress256Byte: TAction;
    ActionAddress1024Byte: TAction;
    ActionAddress4096Byte: TAction;
    ActionAddressCustom: TAction;
    ActionLength1Byte: TAction;
    ActionLength16Byte: TAction;
    ActionLength32Byte: TAction;
    ActionLengthCustom: TAction;
    ActionDelete: TAction;
    ActionClear: TAction;
    ActionEdit: TAction;
    ActionSave: TAction;
    ActionCopy: TAction;
    ActionHex: TAction;
    ActionRefurbish: TAction;
    ActionSelectAll: TAction;
    ActionInsert: TAction;
    ActionRemove: TAction;
    ToolBarMemoryList: TToolBar;
    ToolButtonAddressInc: TToolButton;
    ToolButtonAddressDec: TToolButton;
    ToolButtonSeparatorAddress: TToolButton;
    ToolButtonLengthInc: TToolButton;
    ToolButtonLengthDec: TToolButton;
    ToolButtonRemove: TToolButton;
    ToolButtonSeparatorLength: TToolButton;
    ToolButtonDelete: TToolButton;
    ToolButtonHex: TToolButton;
    ToolButtonCopy: TToolButton;
    ToolButtonSave: TToolButton;
    ToolButtonInsert: TToolButton;
    ToolButtonSeparatorEdit: TToolButton;
    ToolButtonRefurbish: TToolButton;
    ToolButtonEdit: TToolButton;
    ToolButtonSeparatorSearch: TToolButton;
    ToolButtonClear: TToolButton;
    ToolButtonSearch: TToolButton;
    ImageDrag: TImage;
    ToolButtonSelectWindow: TToolButton;
    ToolButtonHexEditor: TToolButton;
    ToolButtonAsmDisplay: TToolButton;
    ToolButtonEditor: TToolButton;
    MenuItemHelp: TMenuItem;
    ToolButtonSelectProcess: TToolButton;
    ComboBoxCode: TComboBox;
    PopupMenuLength: TPopupMenu;
    MenuItemLength1Byte: TMenuItem;
    MenuItemLength16Byte: TMenuItem;
    MenuItemLength32Byte: TMenuItem;
    MenuItemLengthCustom: TMenuItem;
    PopupMenuAddress: TPopupMenu;
    MenuItemAddress1Byte: TMenuItem;
    MenuItemAddress16Byte: TMenuItem;
    MenuItemAddress32Byte: TMenuItem;
    MenuItemAddress256Byte: TMenuItem;
    MenuItemAddress1024Byte: TMenuItem;
    MenuItemAddress4096Byte: TMenuItem;
    MenuItemAddressCustom: TMenuItem;
    MenuItemSelect: TMenuItem;
    MenuItemOption: TMenuItem;
    ActionHexEditor: TAction;
    ActionAsmDisplay: TAction;
    OpenDialogOne: TOpenDialog;
    PopupMenuCopy: TPopupMenu;
    MenuItemCopyNew: TMenuItem;
    MenuItemCopyOld: TMenuItem;
    MenuItemCopyAll: TMenuItem;
    MenuItemCopyAddress: TMenuItem;
    ActionCopyNew: TAction;
    ActionCopyOld: TAction;
    ActionCopyAddress: TAction;
    ActionCopyAll: TAction;
    SaveDialogOne: TSaveDialog;
    ActionSelectWindow: TAction;
    ActionSelectProcess: TAction;
    MenuItemSelectFile: TMenuItem;
    MenuItemSelectProcess: TMenuItem;
    MenuItemSelectWindow: TMenuItem;
    MenuItemAddress16ByteA: TMenuItem;
    MenuItemAddress1024ByteA: TMenuItem;
    MenuItemAddress1ByteA: TMenuItem;
    MenuItemAddress256ByteA: TMenuItem;
    MenuItemAddress4096ByteA: TMenuItem;
    MenuItemAddress: TMenuItem;
    MenuItemLength: TMenuItem;
    MenuItemLength16ByteA: TMenuItem;
    MenuItemLength1ByteA: TMenuItem;
    MenuItemLength32ByteA: TMenuItem;
    MenuItemLengthCustomA: TMenuItem;
    MenuItemAddressCustomA: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemCopyAddressA: TMenuItem;
    MenuItemCopyAllA: TMenuItem;
    MenuItemCopyNewA: TMenuItem;
    MenuItemCopyOldA: TMenuItem;
    MenuItemSearchA: TMenuItem;
    MenuItemInsert: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemAddressDec: TMenuItem;
    MenuItemLengthInc: TMenuItem;
    MenuItemLengthDec: TMenuItem;
    MenuItemAddressInc: TMenuItem;
    MenuItemDelete: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemHex: TMenuItem;
    MenuItemRefurbish: TMenuItem;
    MenuItemSave: TMenuItem;
    MenuItemAsmDisplay: TMenuItem;
    MenuItemHexEditor: TMenuItem;
    MenuItemRemove: TMenuItem;
    PopupMenuList: TPopupMenu;
    MenuItemRefurbishB: TMenuItem;
    MenuItemHexB: TMenuItem;
    MenuItemSearchB: TMenuItem;
    MenuItemDeleteB: TMenuItem;
    MenuItemClear: TMenuItem;
    MenuItemCopyB: TMenuItem;
    MenuItemSelected: TMenuItem;
    MenuItemSelectAllB: TMenuItem;
    MenuItemSelectNot: TMenuItem;
    MenuItemSelectChanged: TMenuItem;
    MenuItemSaveB: TMenuItem;
    MenuItemInsertB: TMenuItem;
    ActionSelectNot: TAction;
    ActionSelectChanged: TAction;
    TabSheetC: TTabSheet;
    ComboBoxC: TComboBox;
    TimerButton: TTimer;
    MenuItemSelectNotA: TMenuItem;
    MenuItemSelectChangedA: TMenuItem;
    MenuItemCopyA: TMenuItem;
    ActionAbout: TAction;
    MenuItemAbout: TMenuItem;
    ActionClose: TAction;
    ActionOpenDir: TAction;
    MenuItemOpenDir: TMenuItem;
    MenuItemClose: TMenuItem;
    ToolButtonOpenDir: TToolButton;
    ComboBoxFilter: TComboBox;
    SpeedButtonIntegerHex: TSpeedButton;
    ToolButtonSelectDir: TToolButton;
    ActionSelectDir: TAction;
    MenuItemSelectDir: TMenuItem;
    ActionHelp: TAction;
    MenuItemHelpA: TMenuItem;
    ActionCopyFileName: TAction;
    MenuItemCopyFileName: TMenuItem;
    MenuItemCopyFileNameA: TMenuItem;
    ActionDoubleGet: TAction;
    ActionDoubleHex: TAction;
    ActionDoubleDisplay: TAction;
    MenuItemCopyC: TMenuItem;
    MenuItemCopyAddressC: TMenuItem;
    MenuItemCopyAllC: TMenuItem;
    MenuItemCopyNewC: TMenuItem;
    MenuItemCopyOldC: TMenuItem;
    MenuItemCopyFileNameC: TMenuItem;
    MenuItemLineC: TMenuItem;
    MenuItemDoubleClick: TMenuItem;
    MenuItemDoubleDisplayC: TMenuItem;
    MenuItemDoubleGetC: TMenuItem;
    MenuItemDoubleHexC: TMenuItem;
    ActionGetNewValue: TAction;
    MenuItemGetNewValueC: TMenuItem;
    MenuItemDoubleClickA: TMenuItem;
    MenuItemDoubleDisplayA: TMenuItem;
    MenuItemDoubleHexA: TMenuItem;
    MenuItemDoubleGetA: TMenuItem;
    MenuItemGetNewValueA: TMenuItem;
    ActionBlog: TAction;
    MenuItemBlogA: TMenuItem;
    ActionLiveUpdate: TAction;
    MenuItemLiveUpdate: TMenuItem;
    N1: TMenuItem;
    ActionSysMenu: TAction;
    ActionDoubleExplorer: TAction;
    N2: TMenuItem;
    ActionCopyPathName: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ActionPopupSystem: TAction;
    ActionPopupInternal: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ImageDragMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageDragMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageDragMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StatusBarOneResize(Sender: TObject);
    procedure LabelHttpClick(Sender: TObject);
    procedure ToolBarSelectResize(Sender: TObject);
    procedure ComboBoxSelectChange(Sender: TObject);
    procedure PageControlSearchChange(Sender: TObject);
    procedure ComboBoxSelectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxChange(Sender: TObject);
    procedure ComboBoxCodeSelect(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionSelectFileExecute(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    procedure ActionCopyNewExecute(Sender: TObject);
    procedure ActionCopyExecute(Sender: TObject);
    procedure ListViewFileListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListViewFileListColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure ListViewFileListCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure ListViewFileListCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ActionOffsetExecute(Sender: TObject);
    procedure ActionNByteExecute(Sender: TObject);
    procedure ActionAddressCustomExecute(Sender: TObject);
    procedure ActionLengthCustomExecute(Sender: TObject);
    procedure ListViewFileListChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ActionRemoveExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionClearExecute(Sender: TObject);
    procedure ActionRefurbishExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionInsertExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionAsmDisplayExecute(Sender: TObject);
    procedure ActionHexEditorExecute(Sender: TObject);
    procedure ActionSelectProcessExecute(Sender: TObject);
    procedure ActionSelectWindowExecute(Sender: TObject);
    procedure ListViewFileListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButtonMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TimerButtonTimer(Sender: TObject);
    procedure ToolButtonAddressIncMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionSelectAllExecute(Sender: TObject);
    procedure ActionSelectNotExecute(Sender: TObject);
    procedure ActionSelectChangedExecute(Sender: TObject);
    procedure ActionAboutExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListViewFileListDblClick(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOpenDirExecute(Sender: TObject);
    procedure ListViewFileListMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButtonIntegerHexClick(Sender: TObject);
    procedure ActionSelectDirExecute(Sender: TObject);
    procedure ActionHelpExecute(Sender: TObject);
    procedure ActionDoubleGetExecute(Sender: TObject);
    procedure ActionGetNewValueExecute(Sender: TObject);
    procedure ActionBlogExecute(Sender: TObject);
    procedure ActionLiveUpdateExecute(Sender: TObject);
    procedure ActionSysMenuExecute(Sender: TObject);
    procedure ListViewFileListContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure ActionPopupSystemExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FMouseDown: Boolean;
    FContextMenuFunction: Integer;
    FProcessId: THandle;
    FWindowHandle: THandle;
    FChanging: Boolean;
    FSearchText: string;
    FFilterText: string;
    FSearching: Boolean;
    FDownButton: TControl;
    FDownTickCount: DWORD;
    DropFileTargetOne: TDropFileTarget;
    DropFileSourceOne: TDropFileSource;
    procedure DoChange;
    procedure ApplicationHint(Sender: TObject);
    procedure DropFileTargetOneDrop(Sender: TObject;
      ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
    procedure FormDasmBrowerClickAddr(Sender: TObject;
      mAddress: Integer; mLength: Integer);
  public
    { Public declarations }
  end;

var
  FormFileAnalyzer: TFormFileAnalyzer;

implementation

{$R *.dfm}
{$R CursorRes.res}

{$WARN UNIT_PLATFORM OFF}

uses TlHelp32, PsAPI, ShellAPI, EncdDecd, Math, Clipbrd, IniFiles,
  StringFunctions51, CommonFunctions51, ControlFunctions51, MemoUnit,
  DasmBrowerUnit, HexEditorUnit, ProcessListUnit, WindowDialog, FileCtrl;

const crFindWindow = 10;

type
  TDisplayStyle = (dsPascal, dsHex);
  TItemInfo = record
    rDisplayStyle: TDisplayStyle; //显示方式
    rAddress: Integer; //地址
    rSize: Integer; //大小
  end;
  PItemInfo = ^TItemInfo;

procedure TFormFileAnalyzer.FormCreate(Sender: TObject);
var
  I, J: Integer;
  vComboBoxSearch: TComboBox;
  S: string;
begin
  ProcessPrivilege(GetCurrentProcess, 'SeDebugPrivilege', True);
  DropFileTargetOne := TDropFileTarget.Create(Self);
  DropFileTargetOne.Target := Self;
  DropFileTargetOne.OnDrop := DropFileTargetOneDrop;
  DropFileSourceOne := TDropFileSource.Create(Self);

  Font.Assign(Screen.MenuFont);
  Screen.Cursors[crFindWindow] :=
    {//打开可以重文件载入}LoadCursor(HInstance, 'CursorFindWindow'); (*//
LoadCursorFromFile(PChar(ExtractFilePath(ParamStr(0)) + 'FindWindow2.cur'));//*)
  ImageListDrag.GetBitmap(Ord(FMouseDown), ImageDrag.Picture.Bitmap);

  LabelHttp.Font.Color := clBlue;
  LabelHttp.Font.Style := [fsUnderline];

  Application.OnHint := ApplicationHint;
  Application.Title := vModuleVersionInfomation.rProductName + ' - ' +
    vModuleVersionInfomation.rProductVersion;
  Application.HelpFile := 'FileAnalyzerApp.hlp';
  Caption := Application.Title;
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do try
    Font.Name := ReadString(Self.ClassName, 'Font.Name', Font.Name);
    Font.Size := ReadInteger(Self.ClassName, 'Font.Size', Font.Size);
    try
      Font.Color := StringToColor(ReadString(Self.ClassName, 'Font.Color',
        ColorToString(Font.Color)));
    except
    end;

    Left := ReadInteger(Self.ClassName, 'Left', Left);
    Top := ReadInteger(Self.ClassName, 'Top', Top);
    Height := ReadInteger(Self.ClassName, 'Height', Height);
    Width := ReadInteger(Self.ClassName, 'Width', Width);

    for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TComboBox then
        with TComboBox(Components[I]) do
        begin
          if Style = csDropDownList then
            ItemIndex := ReadInteger(Name, 'ItemIndex', ItemIndex)
          else                     
          begin
            Items.Text := DecodeString(ReadString(Name, 'Items.Text',
              EncodeString(Items.Text)));
            Text := ReadString(Name, 'Text', Text);
          end;
        end
      else if Components[I] is TPageControl then
        with TPageControl(Components[I]) do
          ActivePageIndex :=
            ReadInteger(Name, 'ActivePageIndex', ActivePageIndex)
      else if Components[I] is TCheckBox then
        with TCheckBox(Components[I]) do
          Checked := ReadBool(Name, 'Checked', Checked)
      else if Components[I] is TOpenDialog then
        with TOpenDialog(Components[I]) do
          FilterIndex := ReadInteger(Name, 'FilterIndex', FilterIndex)
      else if Components[I] is TListView then
        with TListView(Components[I]) do
          for J := 0 to Columns.Count - 1 do
            Columns[J].Width := ReadInteger(Name,
              Format('Columns[%d].Width', [J]), Columns[J].Width);
    end;
    PopupMenuAddress.Tag :=
      ReadInteger('Fields', 'AddressByte', PopupMenuAddress.Tag);
    PopupMenuLength.Tag :=
      ReadInteger('Fields', 'LengthByte', PopupMenuLength.Tag);
    PopupMenuCopy.Tag :=
      ReadInteger('Fields', 'CopyStyle', PopupMenuCopy.Tag);
    PopupMenuList.Tag :=
      ReadInteger('Fields', 'DoubleStyle', PopupMenuList.Tag);
    FContextMenuFunction := ReadInteger('Fields', 'ContextMenu', 1);
  finally
    Free;
  end;
  ///////Begin 清除无效的选项                                                   //2008-01-18 ZswangY37 No.1
  for I := ComboBoxSelect.Items.Count - 1 downto 0 do
  begin
    S := ComboBoxSelect.Items[I];
    if not FileExists(S) and not DirectoryExists(S) then
      ComboBoxSelect.Items.Delete(I);
  end;
  S := ComboBoxSelect.Text;
  if not FileExists(S) and not DirectoryExists(S) then
    ComboBoxSelect.Text := '';
  ///////End 清除无效的选项

  if ParamStr(1) <> '' then
  begin
    ComboBoxSelect.Text := ParamStr(1);
    ComboBoxSelectChange(ComboBoxSelect);
  end;
  if ParamStr(2) <> '' then                                                     //2006-09-23 No.1 ZswangY37
  begin
    FSearchText := HexToStr(ParamStr(2));
    PageControlSearchChange(PageControlSearch);
  end else
  begin
    vComboBoxSearch := nil;
    for I := 0 to PageControlSearch.ActivePage.ControlCount - 1 do
      if PageControlSearch.ActivePage.Controls[I] is TComboBox then
      begin
        vComboBoxSearch := TComboBox(PageControlSearch.ActivePage.Controls[I]);
        Break;
      end;
    if Assigned(vComboBoxSearch) then ComboBoxChange(vComboBoxSearch);
    ComboBoxSelectChange(ComboBoxSelect);
    ComboBoxCodeSelect(ComboBoxCode);
  end;
  case PopupMenuAddress.Tag of
    1: ActionAddress1Byte.Checked := True;
    16: ActionAddress16Byte.Checked := True;
    32: ActionAddress32Byte.Checked := True;
    256: ActionAddress256Byte.Checked := True;
    1024: ActionAddress1024Byte.Checked := True;
    4096: ActionAddress4096Byte.Checked := True;
  else
    begin
      ActionAddressCustom.Checked := True;
      ActionAddressCustom.Caption :=
        Format('自定义--%d字节', [PopupMenuAddress.Tag]);
    end;
  end;

  case PopupMenuLength.Tag of
    1: ActionLength1Byte.Checked := True;
    16: ActionLength16Byte.Checked := True;
    32: ActionLength32Byte.Checked := True;
  else
    begin
      ActionLengthCustom.Checked := True;
      ActionLengthCustom.Caption :=
        Format('自定义--%d字节', [PopupMenuLength.Tag]);
    end;
  end;
  case PopupMenuCopy.Tag of
    1: ActionCopyAll.Checked := True;
    2: ActionCopyNew.Checked := True;
    3: ActionCopyOld.Checked := True;
    4: ActionCopyAddress.Checked := True;
    5: ActionCopyFileName.Checked := True;
    6: ActionCopyPathName.Checked := True;
  else
    ActionCopyPathName.Checked := True;
  end;

  case PopupMenuList.Tag of
    1: ActionDoubleGet.Checked := True;
    2: ActionDoubleHex.Checked := True;
    3: ActionDoubleDisplay.Checked := True;
  else ActionDoubleExplorer.Checked := True;
  end;

  case FContextMenuFunction of
    1: ActionPopupSystem.Checked := True;
    2: ActionPopupInternal.Checked := True;
  else  ActionPopupSystem.Checked := True;
  end;
  ListViewHeaderImages(ListViewFileList, ImageListSort);
  DoChange;
end;

procedure TFormFileAnalyzer.ImageDragMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  vRect: TRect;
begin
  if Button <> mbLeft then Exit;
  FProcessId := 0;
  ComboBoxSelect.Text := '';
  FMouseDown := True;
  ImageListDrag.GetBitmap(Ord(FMouseDown), TImage(Sender).Picture.Bitmap);
  vRect := TImage(Sender).BoundsRect;
  InvalidateRect(TImage(Sender).Parent.Handle, @vRect, True);
  Screen.Cursor := crFindWindow;
end;

procedure TFormFileAnalyzer.ImageDragMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  vHandle: THandle;
  vProcessId: Longword;
begin
  if not FMouseDown then Exit;
  vHandle := WindowFromPoint(Mouse.CursorPos);
  if vHandle = FWindowHandle then Exit; // 窗体一样
  GetWindowThreadProcessId(vHandle, vProcessId);
  if vProcessId = GetCurrentProcessId then Exit;
  if FWindowHandle <> 0 then TrackerWindow(FWindowHandle);
  FWindowHandle := vHandle;
  TrackerWindow(FWindowHandle);
  if FProcessId = vProcessId then Exit;
  ComboBoxSelect.Text := ProcessFileName(vProcessId);
  ComboBoxSelectChange(ComboBoxSelect);
end;

procedure TFormFileAnalyzer.ImageDragMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  vRect: TRect;
begin
  if not FMouseDown then Exit;
  if FWindowHandle <> 0 then TrackerWindow(FWindowHandle);
  FMouseDown := False;
  ImageListDrag.GetBitmap(Ord(FMouseDown), TImage(Sender).Picture.Bitmap);
  vRect := TImage(Sender).BoundsRect;
  InvalidateRect(TImage(Sender).Parent.Handle, @vRect, True);
  Screen.Cursor := crDefault;
end;

procedure TFormFileAnalyzer.StatusBarOneResize(Sender: TObject);
begin
  LabelHttp.Left := (LabelHttp.Parent.Width - LabelHttp.Width) - 12;
end;

procedure TFormFileAnalyzer.LabelHttpClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(TLabel(Sender).Caption), nil, nil, SW_SHOW);
end;

procedure TFormFileAnalyzer.ToolBarSelectResize(Sender: TObject);
begin
  ComboBoxSelect.Width := TToolBar(Sender).Width - ComboBoxSelect.Left - 2;
end;

procedure TFormFileAnalyzer.ComboBoxSelectChange(Sender: TObject);
var
  vSelStart, vSelLength: Integer;
  vText: string;
begin
  vSelStart := TComboBox(Sender).SelStart;
  vSelLength := TComboBox(Sender).SelLength;
  vText := TComboBox(Sender).Text;
  if DirectoryExists(TComboBox(Sender).Text) or
    FileExists(TComboBox(Sender).Text) then
    TComboBox(Sender).Font.Color := clWindowText
  else TComboBox(Sender).Font.Color := clRed;
  TComboBox(Sender).Text := vText;
  TComboBox(Sender).SelStart := vSelStart;
  TComboBox(Sender).SelLength := vSelLength;
  DoChange;
end;

procedure TFormFileAnalyzer.PageControlSearchChange(Sender: TObject);
begin
  FChanging := True;
  try
    if TPageControl(Sender).ActivePage = TabSheetBin then
      ComboBoxBin.Text := HexToBin(StrToHex(FSearchText, False), True)
    else if TPageControl(Sender).ActivePage = TabSheetGeneral then
      case ComboBoxCode.ItemIndex of
        0: ComboBoxGeneral.Text := FSearchText;
        1: ComboBoxGeneral.Text := BufferToWideString(FSearchText);
        2: ComboBoxGeneral.Text := Utf8ToAnsi(FSearchText);
      end
    else if TPageControl(Sender).ActivePage = TabSheetHex then
      ComboBoxHex.Text := StrToHex(FSearchText, True)
    else if TPageControl(Sender).ActivePage = TabSheetBase64 then
      ComboBoxBase64.Text := EncodeString(FSearchText)
    else if TPageControl(Sender).ActivePage = TabSheetPascal then
      ComboBoxPascal.Text := StringToDisplay(FSearchText)
    else if TPageControl(Sender).ActivePage = TabSheetC then
      ComboBoxC.Text := StringToExpression(FSearchText)
    else if TPageControl(Sender).ActivePage = TabSheetInteger then
      ComboBoxInteger.Text := IntToStr(BufferToInteger(FSearchText))
    else if TPageControl(Sender).ActivePage = TabSheetInt64 then
      ComboBoxInt64.Text := IntToStr(BufferToInt64(FSearchText))
    else if TPageControl(Sender).ActivePage = TabSheetSingle then
      ComboBoxSingle.Text := FloatToStr(BufferToSingle(FSearchText))
    else if TPageControl(Sender).ActivePage = TabSheetDouble then
      ComboBoxDouble.Text := FloatToStr(BufferToDouble(FSearchText))
    else if TPageControl(Sender).ActivePage = TabSheetSmallint then
      ComboBoxSmallint.Text := IntToStr(BufferToSmallint(FSearchText))
    else if TPageControl(Sender).ActivePage = TabSheetGUID then
      ComboBoxGUID.Text := GUIDToString(BufferToGUID(FSearchText))
    else if TPageControl(Sender).ActivePage = TabSheetMark then
      ComboBoxMark.Text := StrToHex(FSearchText, True)
  finally
    FChanging := False;
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.ComboBoxSelectKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DELETE: if (ssCtrl in Shift) and (TComboBox(Sender).ItemIndex >= 0) then
    begin
      TComboBox(Sender).Items.Delete(TComboBox(Sender).ItemIndex);
      TComboBox(Sender).Text := '';
    end;
    VK_RETURN:
    begin
      ActionSearch.Execute;
    end;
  end;
end;

procedure TFormFileAnalyzer.ComboBoxChange(Sender: TObject);
begin
  if FChanging then Exit;
  if Sender = ComboBoxGeneral then
    case ComboBoxCode.ItemIndex of
      0: FSearchText := TComboBox(Sender).Text;
      1: FSearchText := WideStringToBuffer(TComboBox(Sender).Text);
      2: FSearchText := AnsiToUtf8(TComboBox(Sender).Text);
    end
  else if Sender = ComboBoxBin then
    FSearchText := HexToStr(BinToHex(ComboBoxBin.Text))
  else if Sender = ComboBoxHex then
    FSearchText := HexToStr(ComboBoxHex.Text)
  else if Sender = ComboBoxBase64 then
    try
      FSearchText := DecodeString(ComboBoxBase64.Text);
    except
    end
  else if Sender = ComboBoxC then
    FSearchText := ExpressionToString(ComboBoxC.Text)
  else if Sender = ComboBoxPascal then
    FSearchText := DisplayToString(ComboBoxPascal.Text)
  else if Sender = ComboBoxInteger then
    FSearchText := IntegerToBuffer(StrToIntDef(ComboBoxInteger.Text, 0))
  else if Sender = ComboBoxInt64 then
    FSearchText := Int64ToBuffer(StrToInt64Def(ComboBoxInt64.Text, 0))
  else if Sender = ComboBoxSingle then
    FSearchText := SingleToBuffer(StrToFloatDef(ComboBoxSingle.Text, 0))
  else if Sender = ComboBoxDouble then
    FSearchText := DoubleToBuffer(StrToFloatDef(ComboBoxDouble.Text, 0))
  else if Sender = ComboBoxSmallint then
    FSearchText := SmallintToBuffer(StrToIntDef(ComboBoxSmallint.Text, 0))
  else if Sender = ComboBoxGUID then
    try
      FSearchText := GUIDToBuffer(StringToGUID(ComboBoxGUID.Text))
    except
    end
  else if Sender = ComboBoxMark then
    FSearchText := HexToStr(ComboBoxMark.Text);
  DoChange;
end;

procedure TFormFileAnalyzer.ComboBoxCodeSelect(Sender: TObject);
begin
  if PageControlSearch.ActivePage = TabSheetGeneral then
    case ComboBoxCode.ItemIndex of
      0: FSearchText := ComboBoxGeneral.Text;
      1: FSearchText := WideStringToBuffer(ComboBoxGeneral.Text);
      2: FSearchText := AnsiToUtf8(ComboBoxGeneral.Text);
    end;
  DoChange;
end;

procedure TFormFileAnalyzer.ApplicationHint(Sender: TObject);
var
  vStatusBar: TStatusBar;
begin
  if not Assigned(Screen.ActiveForm) then Exit;
  TComponent(vStatusBar) := Screen.ActiveForm.FindComponent('StatusBarOne');
  if not Assigned(vStatusBar) then Exit;
  if Length(Application.Hint) > 0 then
  begin
    vStatusBar.SimplePanel := True;
    vStatusBar.SimpleText := Application.Hint;
  end else vStatusBar.SimplePanel := False;
end;

procedure TFormFileAnalyzer.FormDestroy(Sender: TObject);
var
  I, J: Integer;
  vItemInfo: PItemInfo;
begin
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do try
    WriteInteger(Self.ClassName, 'Left', Left);
    WriteInteger(Self.ClassName, 'Top', Top);
    WriteInteger(Self.ClassName, 'Height', Height);
    WriteInteger(Self.ClassName, 'Width', Width);

    for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TComboBox then
        with TComboBox(Components[I]) do
        begin
          if Style = csDropDownList then
            WriteInteger(Name, 'ItemIndex', ItemIndex)
          else
          begin
            WriteString(Name, 'Items.Text', EncodeString(Items.Text));
            WriteString(Name, 'Text', '"' + Text + '"');
          end;
        end
      else if Components[I] is TPageControl then
        with TPageControl(Components[I]) do
          WriteInteger(Name, 'ActivePageIndex', ActivePageIndex)
      else if Components[I] is TCheckBox then
        with TCheckBox(Components[I]) do
          WriteBool(Name, 'Checked', Checked)
      else if Components[I] is TOpenDialog then
        with TOpenDialog(Components[I]) do
          WriteInteger(Name, 'FilterIndex', FilterIndex)
      else if Components[I] is TListView then
        with TListView(Components[I]) do
          for J := 0 to Columns.Count - 1 do
            WriteInteger(Name, Format('Columns[%d].Width', [J]),
              Columns[J].Width);
    end;
    WriteInteger('Fields', 'AddressByte', PopupMenuAddress.Tag);
    WriteInteger('Fields', 'LengthByte', PopupMenuLength.Tag);
    WriteInteger('Fields', 'CopyStyle', PopupMenuCopy.Tag);
    WriteInteger('Fields', 'DoubleStyle', PopupMenuList.Tag);
    WriteInteger('Fields', 'ContextMenu', FContextMenuFunction);
  finally
    Free;
  end;
  for I := 0 to ListViewFileList.Items.Count - 1 do
  begin
    vItemInfo := ListViewFileList.Items[I].Data;
    ListViewFileList.Items[I].Data := nil;
    Dispose(vItemInfo);
  end;
end;

procedure TFormFileAnalyzer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) and FSearching then
  begin
    ToolButtonSearch.Click;
    key := #0;
  end;
end;

procedure TFormFileAnalyzer.ActionSelectFileExecute(Sender: TObject);
begin
  if OpenDialogOne.Execute then ComboBoxSelect.Text := OpenDialogOne.FileName;
  DoChange;
end;

procedure TFormFileAnalyzer.ActionSearchExecute(Sender: TObject);

  procedure fScanFile(mFileName: string; mMark: Boolean);
  var
    vFileStream: TFileStream;
    vFileHandle: THandle;
    vLength: Integer;
    vItemInfo: PItemInfo;
    I: Integer;
  begin
    if not FileExists(mFileName) then Exit;
    try
      vFileHandle := _lopen(PChar(mFileName),
        OF_READ or OF_SHARE_DENY_NONE);
      if Integer(vFileHandle) <= 0 then Exit;
      vFileStream := TFileStream.Create(vFileHandle);
    except
      Exit;
    end;
    if mMark then
    begin
      vLength := Length(HexToStr(StringReplace(ComboBoxMark.Text, '%', '0',
        [rfReplaceAll])));
      I := Stream_SearchMark(vFileStream, ComboBoxMark.Text,
        0, MaxInt, CheckBoxIgnoreCase.Checked)
    end
    else
    begin
      vLength := Length(FSearchText);
      I := Stream_SearchString(vFileStream, FSearchText,
        0, MaxInt, CheckBoxIgnoreCase.Checked);
    end;
    while I >= 0 do
    begin
      with ListViewFileList.Items.Add do
      begin
        New(vItemInfo);
        vItemInfo^.rDisplayStyle := dsPascal;
        vItemInfo^.rAddress := I;
        vItemInfo^.rSize := vLength;
        Data := vItemInfo;
        Caption := ExtractFileName(mFileName);
        SubItems.Add(ExtractFileDir(mFileName));
        SubItems.Add(Format('%d', [I]));
        SubItems.Add(
          StringToDisplay(Stream_Read(vFileStream, I, vLength)));
        SubItems.Add(SubItems[SubItems.Count - 1]);
      end;
      if mMark then
        I := Stream_SearchMark(vFileStream, ComboBoxMark.Text,
          I + vLength, MaxInt, CheckBoxIgnoreCase.Checked)
      else I := Stream_SearchString(vFileStream, FSearchText, I + vLength,
        MaxInt, CheckBoxIgnoreCase.Checked);
      Application.ProcessMessages;
      StatusBarOne.SimpleText := Format('%s:%d', [mFileName, I]);
      if not FSearching then Break;
    end;
    vFileStream.Free;
  end;

  procedure fScanDir(mPathName: string; mMark: Boolean);
  var
    vPathName: string;
    J, K: Integer;
    vSearchRec: TSearchRec;
  begin
    vPathName := mPathName + '\' + '*.*';
    K := FindFirst(vPathName, faDirectory, vSearchRec);
    while K = 0 do
    begin
      if (vSearchRec.Attr and faDirectory > 0) and
        (Pos(vSearchRec.Name, '..') = 0) then
        fScanDir(mPathName + '\' + vSearchRec.Name, mMark);
      K := FindNext(vSearchRec);
      Application.ProcessMessages;
      if not FSearching then Exit;
    end;
    FindClose(vSearchRec);
    for J := 0 to ListCount(FFilterText, ';') - 1 do
    begin
      if ListValue(FFilterText, J, ';') = '' then Continue;
      vPathName := mPathName + '\' + ListValue(FFilterText, J, ';');
      K := FindFirst(vPathName, faAnyFile and not faDirectory, vSearchRec);
      while K = 0 do
      begin
        if Pos(vSearchRec.Name, '..') = 0 then
        begin
          StatusBarOne.SimpleText := mPathName + '\' + vSearchRec.Name;
          fScanFile(mPathName + '\' + vSearchRec.Name, mMark);
        end;
        Application.ProcessMessages;
        if not FSearching then Exit;
        K := FindNext(vSearchRec);
      end;
      FindClose(vSearchRec);
    end;
  end;

var
  vTickCount: DWORD;
  vOldItemCount: Integer;
  vComboBoxSearch: TComboBox;
  I: Integer;
begin
  vTickCount := GetTickCount;
  FSearching := not FSearching;
  DoChange;
  if not FSearching then Exit;
  if FSearchText = '' then Exit;
  vComboBoxSearch := nil;
  for I := 0 to PageControlSearch.ActivePage.ControlCount - 1 do
    if PageControlSearch.ActivePage.Controls[I] is TComboBox then
    begin
      vComboBoxSearch := TComboBox(PageControlSearch.ActivePage.Controls[I]);
      Break;
    end;
  if not Assigned(vComboBoxSearch) then Exit;
  ComboBoxChange(vComboBoxSearch);
  with ComboBoxSelect do if Text <> '' then
  begin
    I := Items.IndexOf(Text);
    if I < 0 then
      Items.Insert(0, Text)
    else
    begin
      Items[I] := Text;
      Items.Move(I, 0);
    end;
    ItemIndex := 0;
  end;
  with vComboBoxSearch do if Text <> '' then
  begin
    I := Items.IndexOf(Text);
    if I < 0 then
      Items.Insert(0, Text)
    else
    begin
      Items[I] := Text;
      Items.Move(I, 0);
    end;
    ItemIndex := 0;
  end;
  with ComboBoxFilter do if Text <> '' then
  begin
    I := Items.IndexOf(Text);
    if I < 0 then
      Items.Insert(0, Text)
    else begin
      Items[I] := Text;
      Items.Move(I, 0);
      ItemIndex := 0;
    end;
  end;

  vOldItemCount := ListViewFileList.Items.Count;
  FFilterText := ComboBoxFilter.Text;
  if FileExists(ComboBoxSelect.Text) then
    fScanFile(ComboBoxSelect.Text, ComboBoxMark = vComboBoxSearch)
  else if DirectoryExists(ComboBoxSelect.Text) then
    fScanDir(ExcludeTrailingPathDelimiter(ComboBoxSelect.Text), ComboBoxMark = vComboBoxSearch);
  FSearching := False;
  StatusBarOne.SimpleText := Format('耗时:%d; 返回:%d',
    [GetTickCount - vTickCount, ListViewFileList.Items.Count - vOldItemCount]);
  DoChange;
end;

procedure TFormFileAnalyzer.DoChange;
begin
  ActionInsert.Enabled := FileExists(ComboBoxSelect.Text);
  ActionSearch.Enabled := FSearchText <> '';
  ActionClear.Enabled := ListViewFileList.Items.Count > 0;
  ActionSelectAll.Enabled := ListViewFileList.Items.Count > 0;
  ActionSelectNot.Enabled := ListViewFileList.Items.Count > 0;
  ActionSelectChanged.Enabled := ListViewFileList.Items.Count > 0;
  ActionGetNewValue.Enabled := ListViewFileList.SelCount = 1;
  ActionSave.Enabled := ListViewFileList.SelCount = 1;

  ActionDelete.Enabled := ListViewFileList.SelCount > 0;
  ActionCopy.Enabled := ListViewFileList.SelCount > 0;
  ActionHex.Enabled := ListViewFileList.SelCount > 0;
  ActionEdit.Enabled := ListViewFileList.SelCount > 0;
  ActionAddressInc.Enabled := ListViewFileList.SelCount > 0;
  ActionAddressDec.Enabled := ListViewFileList.SelCount > 0;
  ActionLengthInc.Enabled := ListViewFileList.SelCount > 0;
  ActionLengthDec.Enabled := ListViewFileList.SelCount > 0;
  ActionRefurbish.Enabled := ListViewFileList.SelCount > 0;
  ActionRemove.Enabled := ListViewFileList.SelCount = 2;
  ActionHexEditor.Enabled := ListViewFileList.SelCount = 1;
  ActionAsmDisplay.Enabled := ListViewFileList.SelCount = 1;
  ActionOpenDir.Enabled := (ListViewFileList.SelCount = 1) or
    ((ListViewFileList.SelCount = 0) and (
    FileExists(ComboBoxSelect.Text) or DirectoryExists(ComboBoxSelect.Text)));
  LabelHttp.Visible := not FSearching;
  LabelHttp.Caption := vModuleVersionInfomation.rComments;

  PageControlSearch.Enabled := not FSearching;
  GroupBoxRange.Enabled := not FSearching;
  if FSearching then
  begin
    ActionSearch.ImageIndex := 5;
    ActionSearch.Caption := '停止(&S)';
    ActionSearch.Hint := '停止';
  end else begin
    ActionSearch.ImageIndex := 4;
    ActionSearch.Caption := '搜索(&S)';
    ActionSearch.Hint := '搜索';
  end;
  StatusBarOne.Panels[0].Text := Format('总数：%d', [ListViewFileList.Items.Count]);
  StatusBarOne.Panels[1].Text := Format('数据大小：%d', [Length(FSearchText)]);
end;

procedure TFormFileAnalyzer.ActionCopyNewExecute(Sender: TObject);
begin
  TAction(Sender).Checked := True;
  PopupMenuCopy.Tag := TAction(Sender).Tag;
  ActionCopy.Execute;
end;

procedure TFormFileAnalyzer.ActionCopyExecute(Sender: TObject);
var
  I: Integer;
  S: string;
begin
  S := '';
  for I := 0 to ListViewFileList.Items.Count - 1 do
    with ListViewFileList.Items[I] do
      if Selected then
      begin
        if ActionCopyAll.Checked then
          S := S + #13#10 + Caption + #9 + SubItems[0] + #9 + SubItems[1] + #9 +
            SubItems[2] + SubItems[3]
        else if ActionCopyNew.Checked then
          S := S + #13#10 + SubItems[2]
        else if ActionCopyOld.Checked then
          S := S + #13#10 + SubItems[3]
        else if ActionCopyAddress.Checked then
          S := S + #13#10 + SubItems[1]
        else if ActionCopyFileName.Checked then
          S := S + #13#10 + Caption
        else if ActionCopyPathName.Checked then
          S := S + #13#10 + SubItems[0] + '\' + Caption
      end;
  Delete(S, 1, 2);
  Clipboard.AsText := S;
end;

procedure TFormFileAnalyzer.ListViewFileListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  DoChange;
end;

procedure TFormFileAnalyzer.ListViewFileListColumnClick(Sender: TObject;
  Column: TListColumn);
var
  I: Integer;
begin
  if Abs(TListView(Sender).Tag) = Column.Index + 1 then
    TListView(Sender).Tag := -TListView(Sender).Tag
  else TListView(Sender).Tag := Column.Index + 1;
  TListView(Sender).AlphaSort;

  for I := 0 to TListView(Sender).Columns.Count - 1 do
    ListColumnImageIndex(TListView(Sender).Columns[I], -1);
  ListColumnImageIndex(Column, Ord(TListView(Sender).Tag > 0));
  DoChange;
end;

procedure TFormFileAnalyzer.ListViewFileListCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  I: Integer;
  A, B: string;
  vDataA, vDataB: Extended;
begin
  I := TListView(Sender).Tag;
  if I = 0 then Exit;
  if Abs(I) = 1 then
  begin
    A := Item1.Caption;
    B := Item2.Caption;
  end else begin
    if Abs(I) - 2 < Item1.SubItems.Count then
      A := Item1.SubItems[Abs(I) - 2]
    else A := '';
    if Abs(I) - 2 < Item2.SubItems.Count then
      B := Item2.SubItems[Abs(I) - 2]
    else B := '';
  end;
  if TryStrToFloat(A, vDataA) and TryStrToFloat(B, vDataB) then
    Compare := Trunc(I * vDataA - I * vDataB)
  else Compare := CompareText(A, B) * I;
end;

procedure TFormFileAnalyzer.ListViewFileListContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  if ActionPopupSystem.Checked then
  begin
    ActionSysMenu.Execute;
    Handled := True;
  end;
end;

procedure TFormFileAnalyzer.ListViewFileListCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.SubItems[2] <> Item.SubItems[3] then
  begin
    Sender.Canvas.Font.Color := clRed;
    Sender.Canvas.Brush.Color := clMoneyGreen;
  end;
end;

procedure TFormFileAnalyzer.ActionOffsetExecute(Sender: TObject);
var
  J: Integer;
  vItemInfo: PItemInfo;
  vFileName: string;
begin
  ListViewFileList.Items.BeginUpdate;
  try
    for J := 0 to ListViewFileList.Items.Count - 1 do
      with ListViewFileList.Items[J] do
      begin
        if not Selected then Continue;
        if not Assigned(Data) then Break;
        vFileName := SubItems[0] + '\' + Caption;
        vItemInfo := Data;
        if Sender = ActionAddressInc then
          vItemInfo^.rAddress :=
            Min($70000000, vItemInfo^.rAddress + PopupMenuAddress.Tag)
        else if Sender = ActionAddressDec then
          vItemInfo^.rAddress :=
            Max($00000000, vItemInfo^.rAddress - PopupMenuAddress.Tag)
        else if Sender = ActionLengthInc then
          vItemInfo^.rSize := Min($100, vItemInfo^.rSize + PopupMenuLength.Tag)
        else if Sender = ActionLengthDec then
          vItemInfo^.rSize := Max($000, vItemInfo^.rSize - PopupMenuLength.Tag)
        else if Sender = ActionHex then
          vItemInfo^.rDisplayStyle :=
            TDisplayStyle((Ord(vItemInfo^.rDisplayStyle) + 1) mod 2);
        SubItems[1] := Format('%d', [vItemInfo^.rAddress]);
        case vItemInfo^.rDisplayStyle of
          dsPascal: SubItems[2] := StringToDisplay(
            File_Read(vFileName, vItemInfo^.rAddress, vItemInfo^.rSize));
        else SubItems[2] := StrToHex(
          File_Read(vFileName, vItemInfo^.rAddress, vItemInfo^.rSize));
        end;
        SubItems[3] := SubItems[2];
      end;
  finally
    ListViewFileList.Items.EndUpdate;
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.ActionNByteExecute(Sender: TObject);
begin
  TAction(Sender).Checked := True;
  if Pos('ActionAddress', TAction(Sender).Name) = 1 then
  begin
    PopupMenuAddress.Tag := TAction(Sender).Tag;
    ActionAddressCustom.Caption := '自定义';
  end else
  begin
    PopupMenuLength.Tag := TAction(Sender).Tag;
    ActionLengthCustom.Caption := '自定义';
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.ActionAddressCustomExecute(Sender: TObject);
var
  S: string;
begin
  S := IntToStr(PopupMenuAddress.Tag);
  if not InputQuery('地址偏移', '', S) then Exit;
  PopupMenuAddress.Tag := Max(StrToIntDef(S, PopupMenuAddress.Tag), 1);
  case PopupMenuAddress.Tag of
    1: ActionAddress1Byte.Checked := True;
    16: ActionAddress16Byte.Checked := True;
    32: ActionAddress32Byte.Checked := True;
    256: ActionAddress256Byte.Checked := True;
    1024: ActionAddress1024Byte.Checked := True;
    4096: ActionAddress4096Byte.Checked := True;
  else
    begin
      ActionAddressCustom.Checked := True;
      ActionAddressCustom.Caption :=
        Format('自定义--%d字节', [PopupMenuAddress.Tag]);
    end;
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.ActionLengthCustomExecute(Sender: TObject);
var
  S: string;
begin
  S := IntToStr(PopupMenuLength.Tag);
  if not InputQuery('长度偏移', '', S) then Exit;
  PopupMenuLength.Tag := Max(StrToIntDef(S, PopupMenuLength.Tag), 1);
  case PopupMenuLength.Tag of
    1: ActionLength1Byte.Checked := True;
    16: ActionLength16Byte.Checked := True;
    32: ActionLength32Byte.Checked := True;
  else
    begin
      ActionLengthCustom.Checked := True;
      ActionLengthCustom.Caption :=
        Format('自定义--%d字节', [PopupMenuLength.Tag]);
    end;
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.ListViewFileListChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  DoChange;
end;

procedure TFormFileAnalyzer.ActionRemoveExecute(Sender: TObject);
var
  I, J: Integer;
  vItemInfo: PItemInfo;
begin
  J := -1;
  for I := 0 to ListViewFileList.Items.Count - 1 do
  begin
    if ListViewFileList.Items[I].Selected then
    begin
      vItemInfo := ListViewFileList.Items[I].Data;
      if not Assigned(vItemInfo) then Exit;
      if J >= 0 then
      begin
        J := Abs(J - vItemInfo^.rAddress);
        Break;
      end;
      J := vItemInfo^.rAddress;
    end;
  end;
  if J < 0 then Exit;
  with TFormMemo.Create(Self) do try
    Caption := TAction(Sender).Caption;
    MemoText.Text := Format('%d($%.8x)', [J, J]);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFormFileAnalyzer.ActionDeleteExecute(Sender: TObject);
var
  I: Integer;
  vItemInfo: PItemInfo;
begin
  ListViewFileList.Items.BeginUpdate;
  try
    for I := ListViewFileList.Items.Count - 1 downto 0 do
      if ListViewFileList.Items[I].Selected then
      begin
        vItemInfo := ListViewFileList.Items[I].Data;
        Dispose(vItemInfo);
        ListViewFileList.Items[I].Delete;
      end;
  finally
    ListViewFileList.Items.EndUpdate;
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.ActionClearExecute(Sender: TObject);
var
  I: Integer;
  vItemInfo: PItemInfo;
begin
  for I := ListViewFileList.Items.Count - 1 downto 0 do
    begin
      vItemInfo := ListViewFileList.Items[I].Data;
      Dispose(vItemInfo);
    end;
  ListViewFileList.Items.Clear;
  DoChange;
end;

procedure TFormFileAnalyzer.ActionRefurbishExecute(Sender: TObject);
var
  J: Integer;
  vItemInfo: PItemInfo;
  vFileName: string;
begin
  ListViewFileList.Items.BeginUpdate;
  try
    for J := 0 to ListViewFileList.Items.Count - 1 do
      with ListViewFileList.Items[J] do
      begin
        vItemInfo := Data;
        if not Selected then Continue;
        if not Assigned(vItemInfo) then Break;
        vFileName := SubItems[0] + '\' + Caption;
        SubItems[3] := SubItems[2];
        case vItemInfo^.rDisplayStyle of
          dsPascal: SubItems[2] := StringToDisplay(
            File_Read(vFileName, vItemInfo^.rAddress, vItemInfo^.rSize));
        else SubItems[2] := StrToHex(
          File_Read(vFileName, vItemInfo^.rAddress, vItemInfo^.rSize));
        end;
      end;
  finally
    ListViewFileList.Items.EndUpdate;
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.ActionEditExecute(Sender: TObject);
var
  I: Integer;
  vComboBoxSearch: TComboBox;
  vItemInfo: PItemInfo;
  vFileName: string;
begin
  if MessageDlg('确定修改文件？', mtWarning, [mbYes, mbNo], 0) <> mrYes then Exit;
  vComboBoxSearch := nil;
  for I := 0 to PageControlSearch.ActivePage.ControlCount - 1 do
    if PageControlSearch.ActivePage.Controls[I] is TComboBox then
    begin
      vComboBoxSearch := TComboBox(PageControlSearch.ActivePage.Controls[I]);
      Break;
    end;
  if not Assigned(vComboBoxSearch) then Exit;
  ComboBoxChange(vComboBoxSearch);
  with vComboBoxSearch do if Text <> '' then
  begin
    I := Items.IndexOf(Text);
    if I < 0 then
      Items.Insert(0, Text)
    else Items.Move(I, 0);
    ItemIndex := 0;
  end else Exit;

  for I := ListViewFileList.Items.Count - 1 downto 0 do
    with ListViewFileList.Items[I] do
    begin
      vItemInfo := Data;
      if not Selected then Continue;
      if not Assigned(vItemInfo) then Break;
      vFileName := SubItems[0] + '\' + Caption;
      File_Write(vFileName, vItemInfo^.rAddress, FSearchText);
    end;
  ActionRefurbish.Execute;
end;

procedure TFormFileAnalyzer.ActionSaveExecute(Sender: TObject);
var
  S: string;
  L: Integer;
  vItemInfo: PItemInfo;
  vFileName: string;
begin
  if ListViewFileList.SelCount <> 1 then Exit;
  S := IntToStr(PopupMenuLength.Tag);
  if not InputQuery('数据长度', '', S) then Exit;
  L := StrToIntDef(S, 0);
  if L <= 0 then Exit;
  with ListViewFileList.Selected do
  begin
    vItemInfo := Data;
    if not Assigned(vItemInfo) then Exit;
    vFileName := SubItems[0] + '\' + Caption;
    S := File_Read(vFileName, vItemInfo^.rAddress, L);
  end;
  if not SaveDialogOne.Execute then Exit;
  if FileExists(SaveDialogOne.FileName) and
    (MessageDlg(Format('文件"%s"已经存在，是否覆盖？',
    [SaveDialogOne.FileName]), mtWarning, [mbYes, mbNo], 0) <> mrYes) then Exit;
  StringToFile(S, SaveDialogOne.FileName);
end;

procedure TFormFileAnalyzer.ActionInsertExecute(Sender: TObject);
var
  S: string;
  I: Integer;
  L: Integer;
  vItemInfo: PItemInfo;
begin
  if not FileExists(ComboBoxSelect.Text) then Exit;
  if Assigned(ListViewFileList.Selected) then
  begin
    vItemInfo := ListViewFileList.Selected.Data;
    if Assigned(vItemInfo) then S := Format('%d', [vItemInfo^.rAddress]);
  end else S := '0';
  if not InputQuery('输入首地址', '', S) then Exit;
  I := StrToIntDef(S, 0);
  if Assigned(ListViewFileList.Selected) then
  begin
    vItemInfo := ListViewFileList.Selected.Data;
    if Assigned(vItemInfo) then S := IntToStr(vItemInfo^.rSize);
  end else S := '1';
  if not InputQuery('输入长度', '', S) then Exit;
  L := StrToIntDef(S, 0);
  if L <= 0 then Exit;
  ListViewFileList.Selected := nil;
  ListViewFileList.ItemFocused := ListViewFileList.Items.Add;
  ListViewFileList.Selected := ListViewFileList.ItemFocused;
  with ListViewFileList.Selected do
  begin
    New(vItemInfo);
    vItemInfo^.rDisplayStyle := dsPascal;
    vItemInfo^.rAddress := I;
    vItemInfo^.rSize := L;
    Data := vItemInfo;

    Caption := ExtractFileName(ComboBoxSelect.Text);
    SubItems.Add(ExtractFileDir(ComboBoxSelect.Text));
    SubItems.Add(Format('%d', [I]));
    SubItems.Add(StringToDisplay(File_Read(ComboBoxSelect.Text, I, L)));
    SubItems.Add(SubItems[SubItems.Count - 1]);
    ListViewFileList.ItemIndex := Index;
    MakeVisible(True)
  end;
  DoChange;
end;

procedure TFormFileAnalyzer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WindowState := wsNormal;
end;

procedure TFormFileAnalyzer.ActionAsmDisplayExecute(Sender: TObject);
var
  vAddress: Integer;
  vItemInfo: PItemInfo;
  vProcessFileName: string;
  I: Integer;
begin
  if ListViewFileList.SelCount <> 1 then Exit;

  with ListViewFileList.Selected do
  begin
    vItemInfo := ListViewFileList.Selected.Data;
    if Assigned(vItemInfo) then
      vAddress := vItemInfo^.rAddress
    else vAddress := 0;
    vProcessFileName := SubItems[0] + '\' + Caption;
  end;

  for I := 0 to Screen.FormCount - 1 do
    if Screen.Forms[I] is TFormDasmBrower then
      if (TFormDasmBrower(Screen.Forms[I]).Address = vAddress) and
        (TFormDasmBrower(Screen.Forms[I]).ProcessFileName = vProcessFileName) then
      begin
        TFormDasmBrower(Screen.Forms[I]).Show;
        Exit;
      end;

  with TFormDasmBrower.Create(Self) do
  begin
    OnClickAddr := FormDasmBrowerClickAddr;
    AutoFree := True;
    Caption := Format('%s:(%d)', [vProcessFileName, vAddress]);
    ProcessFileName := vProcessFileName;
    Address := vAddress;
    GotoAddress(vAddress);
    Show;
  end;
end;

procedure TFormFileAnalyzer.ActionHexEditorExecute(Sender: TObject);
var
  vAddress: Integer;
  vLength: Integer;
  vItemInfo: PItemInfo;
  vProcessFileName: string;
  I: Integer;
begin
  if ListViewFileList.SelCount <> 1 then Exit;

  with ListViewFileList.Selected do
  begin
    vItemInfo := ListViewFileList.Selected.Data;
    if Assigned(vItemInfo) then
    begin
      vAddress := vItemInfo^.rAddress;
      vLength := vItemInfo^.rSize;
    end else
    begin
      vAddress := 0;
      vLength := 0;
    end;
    vProcessFileName := SubItems[0] + '\' + Caption;
  end;

  for I := 0 to Screen.FormCount - 1 do
    if Screen.Forms[I] is TFormHexEditor then
      if (TFormHexEditor(Screen.Forms[I]).Address = vAddress) and
        (TFormHexEditor(Screen.Forms[I]).ProcessFileName = vProcessFileName) then
      begin
        TFormHexEditor(Screen.Forms[I]).Show;
        Exit;
      end;

  with TFormHexEditor.Create(Self) do
  begin
    AutoFree := True;
    Caption := Format('%s:($%.8x)', [vProcessFileName, vAddress]);
    ProcessFileName := vProcessFileName;
    Address := vAddress;
    ActionRefurbish := Self.ActionRefurbish;
    Show;
    GotoAddress(vAddress, vLength);
  end;
end;

procedure TFormFileAnalyzer.ActionSelectProcessExecute(Sender: TObject);
begin
  with TFormProcessList.Create(nil) do try
    Caption := '选择进程';
    if ShowModal <> mrOK then Exit;
    FProcessId := Selected;
    ComboBoxSelect.Text := ProcessFileName(FProcessId);
    ComboBoxSelectChange(ComboBoxSelect);
  finally
    Free;
  end;
end;

procedure TFormFileAnalyzer.ActionSelectWindowExecute(Sender: TObject);
begin
  with TWindowDialog.Create(nil) do try
    Hide;
    if not Execute then Exit;
    GetWindowThreadProcessId(Selected, FProcessId);
    ComboBoxSelect.Text := ProcessFileName(FProcessId);
    ComboBoxSelectChange(ComboBoxSelect);
    ForceForegroundWindow(Self.Handle);                                         //2006-11-17 ZswangY37 No.1
  finally
    Show;
    Free;
  end;
end;

procedure TFormFileAnalyzer.ActionSysMenuExecute(Sender: TObject);
begin
  if ListViewFileList.Selected = nil then Exit;
  with ListViewFileList.Selected do
    DisplayContextMenu(Handle, IncludeTrailingPathDelimiter(SubItems[0]) + Caption, ScreenToClient(Mouse.CursorPos));
end;

procedure TFormFileAnalyzer.DropFileTargetOneDrop(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
begin
  if TDropFileTarget(Sender).Files.Count <= 0 then Exit;
  ComboBoxSelect.Text := TDropFileTarget(Sender).Files[0];
  ComboBoxSelectChange(ComboBoxSelect);
end;

procedure TFormFileAnalyzer.ListViewFileListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_EQUAL: ActionLengthInc.Execute;
    VK_MINUS: ActionLengthDec.Execute;
    VK_COMMA: ActionAddressInc.Execute;
    VK_PERIOD: ActionAddressDec.Execute;
    VK_A: if ssCtrl in Shift then ActionSelectAll.Execute;
    VK_C: if ssCtrl in Shift then ActionCopy.Execute;
    VK_S: if ssCtrl in Shift then ActionSave.Execute;
    VK_DELETE: if ssCtrl in Shift then ActionDelete.Execute;
  end;
end;

procedure TFormFileAnalyzer.ToolButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDownButton := TControl(Sender);
  FDownTickCount := GetTickCount;
  TimerButton.Enabled := True;
end;

procedure TFormFileAnalyzer.TimerButtonTimer(Sender: TObject);
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

procedure TFormFileAnalyzer.ToolButtonAddressIncMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TimerButton.Enabled := False;
end;

procedure TFormFileAnalyzer.ActionSelectAllExecute(Sender: TObject);
begin
  ListViewFileList.SelectAll;
end;

procedure TFormFileAnalyzer.ActionSelectNotExecute(Sender: TObject);
var
  I: Integer;
begin
  with ListViewFileList.Items do try
    BeginUpdate;
    for I := 0 to Count - 1 do
      Item[I].Selected := not Item[I].Selected;
  finally
    EndUpdate;
  end;
end;

procedure TFormFileAnalyzer.ActionSelectChangedExecute(Sender: TObject);
var
  I: Integer;
begin
  with ListViewFileList.Items do try
    BeginUpdate;
    for I := 0 to Count - 1 do
      Item[I].Selected := Item[I].SubItems[2] <> Item[I].SubItems[3];
  finally
    EndUpdate;
  end;
end;

procedure TFormFileAnalyzer.ActionAboutExecute(Sender: TObject);
begin
  MessageBox(Handle, PChar(Format(
'程序名称:%s'#13#10 +
'程序版本:%s'#13#10 +
'文件版本:%s'#13#10 +
'%s'#13#10 +
'设计:ZswangY37' +
'', [
    vModuleVersionInfomation.rProductName,
    vModuleVersionInfomation.rProductVersion,
    vModuleVersionInfomation.rFileVersion,
    vModuleVersionInfomation.rLegalCopyright
  ])), '关于', MB_OK or MB_ICONINFORMATION);
end;

procedure TFormFileAnalyzer.FormResize(Sender: TObject);                        //2006-09-18 No.1 ZswangY37
var
  I, J: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TComboBox then
      with TComboBox(Components[I]) do
      begin
        if Style = csDropDownList then Continue;
        J := Items.IndexOf(Text);
        if J >= 0 then SendMessage(Handle, CB_SETCURSEL, J, 0);
      end;
end;

procedure TFormFileAnalyzer.ListViewFileListDblClick(Sender: TObject);
begin
  if ActionDoubleGet.Checked then
    ActionGetNewValue.Execute
  else if ActionDoubleHex.Checked then
    ActionHexEditor.Execute
  else if ActionDoubleDisplay.Checked then
    ActionHex.Execute
  else if ActionDoubleExplorer.Checked then
    ActionOpenDir.Execute;
end;

procedure TFormFileAnalyzer.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormFileAnalyzer.ActionOpenDirExecute(Sender: TObject);
var
  vFileName: string;
begin
  if Assigned(ListViewFileList.Selected) then
  begin
    with ListViewFileList.Selected do
      vFileName := SubItems[0] + '\' + Caption;
  end else if FileExists(ComboBoxSelect.Text) or
    DirectoryExists(ComboBoxSelect.Text) then
    vFileName := ComboBoxSelect.Text
  else Exit;
  OpenfolderAndSelect(vFileName);
end;

procedure TFormFileAnalyzer.ActionPopupSystemExecute(Sender: TObject);
begin
  FContextMenuFunction := (Sender as TComponent).Tag;
  (Sender as TAction).Checked := True;
end;

procedure TFormFileAnalyzer.ListViewFileListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
begin
  if TListView(Sender).SelCount <= 0 then Exit;
  if Button <> mbLeft then Exit;
  if not DragDetectPlus(TWinControl(Sender).Handle, Point(X, Y)) then Exit;
  DropFileSourceOne.Files.Clear;
  for I := 0 to TListView(Sender).Items.Count - 1 do
    with TListView(Sender).Items[I] do
      if Selected then DropFileSourceOne.Files.Add(SubItems[0] + '\' + Caption);
  DropFileSourceOne.Execute;
end;

procedure TFormFileAnalyzer.SpeedButtonIntegerHexClick(Sender: TObject);
begin
  if Pos('$', ComboBoxInteger.Text) + Pos('0x', ComboBoxInteger.Text) > 0 then
    ComboBoxInteger.Text := IntToStr(StrToIntDef(ComboBoxInteger.Text, 0))
  else ComboBoxInteger.Text := Format('$%.8x', [StrToIntDef(ComboBoxInteger.Text, 0)]);
end;

procedure TFormFileAnalyzer.ActionSelectDirExecute(Sender: TObject);
var
  vDirectory: string;
begin
  if FileExists(ComboBoxSelect.Text) then
    vDirectory := ExtractFilePath(ComboBoxSelect.Text)
  else if DirectoryExists(ComboBoxSelect.Text) then
    vDirectory := ComboBoxSelect.Text
  else vDirectory := '';
  if not SelectDirectory('选择路径', '', vDirectory) then Exit;
  ComboBoxSelect.Text := vDirectory;
  ComboBoxSelectChange(ComboBoxSelect);
end;

procedure TFormFileAnalyzer.FormDasmBrowerClickAddr(Sender: TObject;
  mAddress, mLength: Integer);
var
  vItemInfo: PItemInfo;
begin
  ListViewFileList.Selected := nil;
  ListViewFileList.ItemFocused := ListViewFileList.Items.Add;
  ListViewFileList.Selected := ListViewFileList.ItemFocused;
  with ListViewFileList.Selected do
  begin
    New(vItemInfo);
    vItemInfo^.rDisplayStyle := dsHex;
    vItemInfo^.rAddress := mAddress;
    vItemInfo^.rSize := mLength;
    Data := vItemInfo;

    Caption := ExtractFileName(TFormDasmBrower(Sender).ProcessFileName);
    SubItems.Add(ExtractFileDir(TFormDasmBrower(Sender).ProcessFileName));
    SubItems.Add('$' + IntToHex(mAddress, 8));
    SubItems.Add(StrToHex(File_Read(TFormDasmBrower(Sender).ProcessFileName, mAddress, mLength)));
    SubItems.Add(SubItems[SubItems.Count - 1]);
    ListViewFileList.ItemIndex := Index;
    MakeVisible(True);
  end;
  ActionGetNewValue.Execute;
  ForceForegroundWindow(Handle);
  DoChange;
end;

procedure TFormFileAnalyzer.ActionHelpExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TFormFileAnalyzer.ActionDoubleGetExecute(Sender: TObject);
begin
  TAction(Sender).Checked := True;
  PopupMenuList.Tag := TAction(Sender).Tag;
end;

procedure TFormFileAnalyzer.ActionGetNewValueExecute(Sender: TObject);
var
  vItemInfo: PItemInfo;
begin
  if not Assigned(ListViewFileList.Selected) then Exit;
  with ListViewFileList.Selected do
  begin
    if SubItems.Count <= 1 then Exit;
    vItemInfo := Data;
    case vItemInfo^.rDisplayStyle of
      dsPascal: FSearchText := DisplayToString(SubItems[2]);
    else FSearchText := HexToStr(SubItems[2]);
    end;
  end;
  PageControlSearchChange(PageControlSearch);
end;

procedure TFormFileAnalyzer.ActionBlogExecute(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(TAction(Sender).Hint), nil, nil, SW_SHOW);
end;

procedure TFormFileAnalyzer.ActionLiveUpdateExecute(Sender: TObject);
begin
  WinExec(PChar(Format('"%s/LiveUpdate/LiveUpdateApp.exe" cmd=close&handle=%d&success=%s',
     [ExePath, Handle, StringToURL(ParamStr(0))])), SW_SHOWNORMAL);
end;

end.
