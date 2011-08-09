unit ProcessListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ActnList, Menus, ToolWin, StdCtrls;

type
  TFormProcessList = class(TForm)
    ImageListSort: TImageList;
    ImageListTools: TImageList;
    ActionListTools: TActionList;
    ActionCopyFileName: TAction;
    PopupMenuTools: TPopupMenu;
    ToolBarSelect: TToolBar;
    ToolButtonCopyFileName: TToolButton;
    GroupBoxProcessList: TGroupBox;
    ListViewProcess: TListView;
    ImageListProcess: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ListViewProcessDblClick(Sender: TObject);
    procedure ListViewProcessColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure ListViewProcessCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure ActionCopyFileNameExecute(Sender: TObject);
    procedure ActionListToolsUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure GetCurrentProcessList;
    function GetSelected: THandle;
  public
    { Public declarations }
    property Selected: THandle read GetSelected;
  end;

//var//
//  FormProcessList: TFormProcessList;//

implementation

{$R *.dfm}

uses TlHelp32, PsAPI, Clipbrd, IniFiles, ShellAPI, CommCtrl, ControlFunctions51,
  StringFunctions51;

procedure TFormProcessList.GetCurrentProcessList;
var
  vSnapshot: THandle;
  vProcessEntry32: TProcessEntry32;
  vProcess: THandle;
  vBuffer: array[0..MAX_PATH] of Char;
  L: Integer;
  vHandle: THandle;
begin
  vSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  vProcessEntry32.dwSize := SizeOf(TProcessEntry32);
  Process32First(vSnapshot, vProcessEntry32);
  repeat
    if vProcessEntry32.th32ProcessID <> 0 then
      with ListViewProcess.Items.Add do
      begin
        vProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,
          False, vProcessEntry32.th32ProcessID);
        try
          L := GetModuleFileNameEx(vProcess, 0, vBuffer, SizeOf(vBuffer));
          Data := Pointer(vProcessEntry32.th32ProcessID);
          Caption := vProcessEntry32.szExeFile;
          SubItems.Add(Format('%0:d($%0:x)', [vProcessEntry32.th32ProcessID]));
          SubItems.Add(Format('%0:d($%0:x)', [vProcessEntry32.th32ParentProcessID]));
          vHandle := ExtractIcon(HInstance, vBuffer, 0);
          if vHandle <> 0 then
          begin
            ImageList_AddIcon(
              ImageListProcess.Handle,
              vHandle
            );
            DestroyIcon(vHandle);
            ImageIndex := ImageListProcess.Count - 1;
          end else ImageIndex := 0;

          if L <> 0 then
            SubItems.Add(vBuffer)
          else SubItems.Add(vProcessEntry32.szExeFile);
        finally
          CloseHandle(vProcess);
        end;
      end;
  until not Process32Next(vSnapshot, vProcessEntry32);
  CloseHandle(vSnapshot);
end;

procedure TFormProcessList.FormCreate(Sender: TObject);
begin
  GetCurrentProcessList;
  ListViewHeaderImages(ListViewProcess, ImageListSort);

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
  finally
    Free;
  end;
end;

procedure TFormProcessList.ListViewProcessDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

function TFormProcessList.GetSelected: THandle;
begin
  Result := 0;
  if not Assigned(ListViewProcess.Selected) then Exit;
  Result := Integer(ListViewProcess.Selected.Data);
end;

procedure TFormProcessList.ListViewProcessColumnClick(Sender: TObject;
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
end;

procedure TFormProcessList.ListViewProcessCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  I: Integer;
  A, B: string;
  vDataA, vDataB: Extended;
begin
  I := TListView(Sender).Tag;
  if I = 0 then Exit;
  if Abs(I) = 1 then begin
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
  if (Pos('(', A) > 0) and (Pos('(', B) > 0) then
  begin
    A := StrLeft(A, '(');
    B := StrLeft(B, '(');
  end;
  if TryStrToFloat(A, vDataA) and TryStrToFloat(B, vDataB) then
    Compare := Trunc(I * vDataA - I * vDataB)
  else Compare := CompareText(A, B) * I;
end;

procedure TFormProcessList.ActionCopyFileNameExecute(Sender: TObject);
begin
  if not Assigned(ListViewProcess.Selected) then Exit;
  Clipboard.AsText := ListViewProcess.Selected.SubItems[1]
end;

procedure TFormProcessList.ActionListToolsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  ActionCopyFileName.Enabled := Assigned(ListViewProcess.Selected);
end;

procedure TFormProcessList.FormDestroy(Sender: TObject);
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

end.
