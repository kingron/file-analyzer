(*//
标题:控件操作的函数
说明:针对控件处理的函数进行封装
日期:2004-06-16
支持:wjhu111@21cn.com
设计:Zswang
//*)

//2006-11-21 ZswangY37 No.1 添加 GetComboBoxText，GetTridentCmboBxText

unit ControlFunctions51;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ActnList, Menus, ComObj, CommCtrl, ActiveX,
  ShDocVw, OleCtrls, MSHTML;

function ListColumnFromPoint( //根据横坐标查找ListView列的实例
  mListView: TListView; //源ListView
  mX: Integer //横坐标
): TListColumn; //如果成功返回ListView列的实例，否则返回nil

function ListColumnImageIndex( //设置ListView列的图片序号
  mColumn: TListColumn; //源ListColumn
  mImageIndex: Integer; //图片序号
  mRight: Boolean = True //是否居右显示
): Boolean; //返回设置是否成功

function ListViewHeaderImages( //设置ListView页眉的图标集
  mListView: TListView; //源ListView
  mImages: TImageList //源图标集
): Boolean; //返回设置是否成功

function WebBrowserLoadFromString( //从字符串载入显示到浏览器中
  mWebBrowser: TWebBrowser; //目标浏览器
  const mHTML: string //HTML字符串
): Boolean; //是否处理成功

function WebBrowserLoadFromStream( //从流载入显示到浏览器中
  mWebBrowser: TWebBrowser; //目标浏览器
  mStream: TStream //HTML流
): Boolean; //是否处理成功
  
function LoadPersistStream( //载入持久性流
  mPersistStream: IPersistStream; //持久性流接口
  mStream: TStream //输入流
): Boolean; //返回载入是否成功

function SavePersistStream( //保存持久性流
  mPersistStream: IPersistStream; //持久性流接口
  mStream: TStream //输出流
): Boolean; //返回保存是否成功

function LoadDispatchStream( //载入分派器的流
  mDispatch: IDispatch; //分派器
  mStream: TStream //输入流
): Boolean; //返回载入是否成功

function SaveDispatchStream( //保存分派器的流
  mDispatch: IDispatch; //分派器
  mStream: TStream //输出流
): Boolean; //返回保存是否成功

function LoadOleControlStream( //载入OLE控件流
  mOleControl: TOleControl; //OLE控件
  mStream: TStream //输入流
): Boolean; //返回载入是否成功

function SaveOleControlStream( //保存OLE控件流
  mOleControl: TOleControl;//OLE控件
  mStream: TStream //输出流
): Boolean; //返回保存是否成功

function DocumentFromHWND( //通过Internet Explorer_Server窗体,得到IHTMLDocument2对象
  mHandle: HWND; //窗体句柄
  var nDocument: IHTMLDocument2 //返回IHTMLDocument2对象
): HRESULT; //返回是否成功

function GetListViewText( // 取得其他进程中ListView的内容
  mHandle: THandle; // ListView句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功

function GetListBoxText( // 取得其他进程中ListBox的内容
  mHandle: THandle; // ListBox句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功

function GetComboBoxText( // 取得其他进程中ComboBox的内容
  mHandle: THandle; // ComboBox句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功

function GetTreeViewText( // 取得其他进程中TreeView的内容
  mHandle: THandle; // TreeView句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功

function GetTridentCmboBxText( // 获取其他进程IE中ComboBox的内容
  mHandle: THandle; // ComboBox句柄
  mStrings: TStrings // 输出列表
): Boolean; // 返回获取数据是否成功

function TreeNodePath( // 获得树节点的路径
  mTreeNode: TTreeNode; // 树节点
  mDelimiter: string = '\' // 分隔符
): string; // 返回树节点的路径

function SystemImageList( // 获得系统图标列表
  mImageList: TImageList // 图标列表
): Boolean; // 返回系统图标到图形列表中是否成功

function PathIconIndex( // 获得路径的图标序号
  mPath: string // 路径
): Integer; // 返回文件或路径所对应的图标序号

implementation

uses ShellAPI, Math;

function SystemImageList( // 获得系统图标列表
  mImageList: TImageList // 图标列表
): Boolean; // 返回系统图标到图形列表中是否成功
var
  vHandle: THandle;
  vSHFileInfo: TSHFileInfo;
begin
  FillChar(vSHFileInfo, SizeOf(vSHFileInfo), 0);
  vHandle := SHGetFileInfo('', 0, vSHFileInfo, SizeOf(vSHFileInfo),
    SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  Result := vHandle <> 0;
  mImageList.Handle := vHandle;
  mImageList.ShareImages := True;
end; { GetSystemImageList }

function PathIconIndex( // 获得路径的图标序号
  mPath: string // 路径
): Integer; // 返回文件或路径所对应的图标序号
var
  vSHFileInfo: TSHFileInfo;
begin
  FillChar(vSHFileInfo, SizeOf(vSHFileInfo), 0);
  SHGetFileInfo(PChar(mPath), 0, vSHFileInfo, SizeOf(vSHFileInfo),
    SHGFI_SYSICONINDEX);
  Result := vSHFileInfo.iIcon;
end; { GetIconIndex }

function TreeNodePath( // 获得树节点的路径
  mTreeNode: TTreeNode; // 树节点
  mDelimiter: string = '\' // 分隔符
): string; // 返回树节点的路径
begin
  Result := '';
  while Assigned(mTreeNode) do
  begin
    Result := mTreeNode.Text + mDelimiter + Result;
    mTreeNode := mTreeNode.Parent;
  end;
  Delete(Result, Length(Result) - Length(mDelimiter), Length(mDelimiter));
end; { TreeNodePath }

function GetTridentCmboBxText( // 获取其他进程IE中ComboBox的内容
  mHandle: THandle; // ComboBox句柄
  mStrings: TStrings // 输出列表
): Boolean; // 返回获取数据是否成功
var
  I: Integer;
  vItemCount: Integer;
  vAddress: array[0..4] of Char;
  vProcessID: THandle;
  vProcess: THandle;
  vNumberOfBytesRead: DWORD;
  W: WideString;
begin
  Result := False;
  if not Assigned(mStrings) then Exit;
  GetWindowThreadProcessId(mHandle, vProcessID);
  SetLength(W, 256);
  mStrings.BeginUpdate;
  vProcess := OpenProcess(PROCESS_VM_READ, False, vProcessID);
  try
    mStrings.Clear;
    vItemCount := SendMessage(mHandle, CB_GETCOUNT, 0, 0);
    for I := 0 to vItemCount - 1 do
    begin
      FillChar(vAddress, SizeOf(vAddress), 0);
      SendMessage(mHandle, CB_GETLBTEXT, I, Integer(@vAddress));
      ReadProcessMemory(vProcess, Pointer(PInteger(@vAddress)^), @W[1],
        512, vNumberOfBytesRead);
      mStrings.Add(W);
    end;
    SetLength(W, 0);
  finally
    mStrings.EndUpdate;
  end;
  Result := True;
end; { GetTridentCmboBxText }

function GetListViewText( // 取得其他进程中ListView的内容
  mHandle: THandle; // ListView句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功
var
  vColumnCount: Integer;
  vItemCount: Integer;
  I, J: Integer;
  vBuffer: array[0..255] of Char;
  vProcessId: DWORD;
  vProcess: THandle;
  vPointer: Pointer;
  vNumberOfBytesRead: Cardinal;
  S: string;
  vItem: TLVItem;
  vLVColumn: TLVColumn;
begin
  Result := False;
  if not Assigned(mStrings) then Exit;
  vItemCount := ListView_GetItemCount(mHandle);
  if vItemCount <= 0 then Exit;
  Delete(S, 1, 1);
  GetWindowThreadProcessId(mHandle, @vProcessId);
  vProcess := OpenProcess(PROCESS_VM_OPERATION or PROCESS_VM_READ or
    PROCESS_VM_WRITE, False, vProcessId);
  vPointer := VirtualAllocEx(vProcess, nil, 4096, MEM_RESERVE or MEM_COMMIT,
    PAGE_READWRITE);
  mStrings.BeginUpdate;
  try
    mStrings.Clear;
    ///////Begin 计算分栏
    S := '';
    vColumnCount := 0;
    vLVColumn.mask := LVCF_TEXT;
    vLVColumn.pszText := Pointer(Cardinal(vPointer) + SizeOf(vLVColumn));
    vLVColumn.cchTextMax := SizeOf(vBuffer);
    WriteProcessMemory(vProcess, vPointer, @vLVColumn,
      SizeOf(vLVColumn), vNumberOfBytesRead);
    while BOOL(SendMessage(mHandle, LVM_GETCOLUMN,
      vColumnCount, Longint(vPointer))) do
    begin
      ReadProcessMemory(vProcess, vLVColumn.pszText,
        @vBuffer[0], SizeOf(vBuffer), vNumberOfBytesRead);
      S := S + #9 + vBuffer;
      Inc(vColumnCount);
    end;
    vColumnCount := Max(vColumnCount, 1);
    ///////End 计算分栏
    Delete(S, 1, 1);
    if S <> '' then mStrings.Add(S);
    for I := 0 to vItemCount - 1 do begin
      S := '';
      for J := 0 to vColumnCount - 1 do begin
        with vItem do begin
          mask := LVIF_TEXT;
          iItem := I;
          iSubItem := J;
          cchTextMax := SizeOf(vBuffer);
          pszText := Pointer(Cardinal(vPointer) + SizeOf(vItem));
        end;
        WriteProcessMemory(vProcess, vPointer, @vItem,
          SizeOf(TLVItem), vNumberOfBytesRead);
        SendMessage(mHandle, LVM_GETITEM, I, lparam(vPointer));
        ReadProcessMemory(vProcess, vItem.pszText,
          @vBuffer[0], SizeOf(vBuffer), vNumberOfBytesRead);
        S := S + #9 + vBuffer;
      end;
      Delete(S, 1, 1);
      mStrings.Add(S);
    end;
  finally
    VirtualFreeEx(vProcess, vPointer, 0, MEM_RELEASE);
    CloseHandle(vProcess);
    mStrings.EndUpdate;
  end;
  Result := True;
end; { GetListViewText }

function GetListBoxText( // 取得其他进程中ListBox的内容
  mHandle: THandle; // ListBox句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功
var
  vItemCount: Integer;
  I: Integer;
  S: string;
begin
  Result := False;
  if not Assigned(mStrings) then Exit;
  mStrings.BeginUpdate;
  try
    mStrings.Clear;
    vItemCount := SendMessage(mHandle, LB_GETCOUNT, 0, 0);
    for I := 0 to vItemCount - 1 do begin
      SetLength(S, SendMessage(mHandle, LB_GETTEXTLEN, I, 0));
      SendMessage(mHandle, LB_GETTEXT, I, Integer(@S[1]));
      mStrings.Add(S);
    end;
    SetLength(S, 0);
  finally
    mStrings.EndUpdate;
  end;
  Result := True;
end; { GetListBoxText }

function GetComboBoxText( // 取得其他进程中ComboBox的内容
  mHandle: THandle; // ComboBox句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功
var
  vItemCount: Integer;
  I: Integer;
  S: string;
  vClassName: array[0..255] of Char;
begin
  Result := False;
  if not IsWindow(mHandle) then Exit;
  GetClassName(mHandle, vClassName, SizeOf(vClassName));
  if SameText(vClassName, 'Internet Explorer_TridentCmboBx') then
  begin
    Result := GetTridentCmboBxText(mHandle, mStrings);
    Exit;
  end;
  if not Assigned(mStrings) then Exit;
  mStrings.BeginUpdate;
  try
    mStrings.Clear;
    vItemCount := SendMessage(mHandle, CB_GETCOUNT, 0, 0);
    for I := 0 to vItemCount - 1 do begin
      SetLength(S, SendMessage(mHandle, CB_GETLBTEXTLEN, I, 0));
      SendMessage(mHandle, CB_GETLBTEXT, I, Integer(@S[1]));
      mStrings.Add(S);
    end;
    SetLength(S, 0);
  finally
    mStrings.EndUpdate;
  end;
  Result := True;
end; { GetComboBoxText }

function TreeNodeGetNext(
  mHandle: THandle;
  mTreeItem: HTreeItem
): HTreeItem;
var
  vParentID: HTreeItem;
begin
  Result := nil;
  if (mHandle <> 0) and (mTreeItem <> nil) then begin
    Result := TreeView_GetChild(mHandle, mTreeItem);
    if Result = nil then
      Result := TreeView_GetNextSibling(mHandle, mTreeItem);
    vParentID := mTreeItem;
    while (Result = nil) and (vParentID <> nil) do begin
      vParentID := TreeView_GetParent(mHandle, vParentID);
      Result := TreeView_GetNextSibling(mHandle, vParentID);
    end;
  end;
end;  { TreeNodeGetNext }

function TreeNodeGetLevel(
  mHandle: THandle;
  mTreeItem: HTreeItem
): Integer;
var
  vParentID: HTreeItem;
begin
  Result := -1;
  if (mHandle <> 0) and (mTreeItem <> nil) then begin
    vParentID := mTreeItem;
    repeat
      Inc(Result);
      vParentID := TreeView_GetParent(mHandle, vParentID);
    until vParentID = nil;
  end;
end; { TreeNodeGetLevel }

function GetTreeViewText( // 取得其他进程中TreeView的内容
  mHandle: THandle; // TreeView句柄
  mStrings: TStrings // 输出的字符串集对象
): Boolean; // 返回获取是否成功
var
  vItemCount: Integer;
  vBuffer: array[0..255] of Char;
  vProcessId: DWORD;
  vProcess: THandle;
  vPointer: Pointer;
  vNumberOfBytesRead: Cardinal;
  I: Integer;
  vItem: TTVItem;
  vTreeItem: HTreeItem;
begin
  Result := False;
  if not Assigned(mStrings) then Exit;
  GetWindowThreadProcessId(mHandle, @vProcessId);
  vProcess := OpenProcess(PROCESS_VM_OPERATION or PROCESS_VM_READ or
    PROCESS_VM_WRITE, False, vProcessId);
  vPointer := VirtualAllocEx(vProcess, nil, 4096, MEM_RESERVE or MEM_COMMIT,
    PAGE_READWRITE);

  mStrings.BeginUpdate;
  try
    mStrings.Clear;
    vItemCount := TreeView_GetCount(mHandle);
    vTreeItem := TreeView_GetRoot(mHandle);
    for I := 0 to vItemCount - 1 do begin
      with vItem do begin
        mask := TVIF_TEXT;
        cchTextMax := SizeOf(vBuffer);
        pszText := Pointer(Cardinal(vPointer) + SizeOf(vItem));
        hItem := vTreeItem;
      end;

      WriteProcessMemory(vProcess, vPointer, @vItem,
        SizeOf(vItem), vNumberOfBytesRead);
      SendMessage(mHandle, TVM_GETITEM, 0, lparam(vPointer));
      ReadProcessMemory(vProcess, Pointer(Cardinal(vPointer) + SizeOf(TLVItem)),
        @vBuffer[0], SizeOf(vBuffer), vNumberOfBytesRead);
      mStrings.Add(StringOfChar(#9, TreeNodeGetLevel(mHandle, vTreeItem)) + vBuffer);
      vTreeItem := TreeNodeGetNext(mHandle, vTreeItem);
    end;
  finally
    VirtualFreeEx(vProcess, vPointer, 0, MEM_RELEASE);
    CloseHandle(vProcess);
    mStrings.EndUpdate;
  end;
  Result := True;
end; { GetTreeViewText }

type
  TObjectFromLResult = function(LRESULT: lResult; const IID: TIID; WPARAM: wParam; out pObject): HRESULT; stdcall;

function DocumentFromHWND( //通过Internet Explorer_Server窗体,得到IHTMLDocument2对象
  mHandle: HWND; //窗体句柄
  var nDocument: IHTMLDocument2 //返回IHTMLDocument2对象
): HRESULT; //返回是否成功
var
  vLibraryHandle: HWND;
  vResult: Cardinal;
  WM_HTML_GETOBJECT: Integer;
  ObjectFromLresult: TObjectFromLresult;
begin
  vLibraryHandle := LoadLibrary('Oleacc.dll');
  @ObjectFromLresult := GetProcAddress(vLibraryHandle, 'ObjectFromLresult');
  Result := S_FALSE;
  if @ObjectFromLresult <> nil then
  begin
    try
      WM_HTML_GETOBJECT := RegisterWindowMessage('WM_HTML_GETOBJECT');
      SendMessageTimeOut(mHandle,
        WM_HTML_GETOBJECT, 0, 0, SMTO_ABORTIFHUNG, 1000, vResult);
      Result := ObjectFromLresult(vResult, IHTMLDocument2, 0, nDocument);
    finally
      FreeLibrary(vLibraryHandle);
    end;
  end;
end; { DocumentFromHWND }

function LoadPersistStream( //载入持久性流
  mPersistStream: IPersistStream; //持久性流接口
  mStream: TStream //输入流
): Boolean; //返回载入是否成功
var
  vStream: IStream;
  vHandle: HGLOBAL;
  vBuffer: PChar;
begin
  Result := False;
  if not Assigned(mPersistStream) or not Assigned(mStream) then Exit;
  vHandle := GlobalAlloc(GHND, mStream.Size);
  if vHandle = 0 then Exit;
  try
    vBuffer := GlobalLock(vHandle);
    if not Assigned(vBuffer) then Exit;
    try
      mStream.Read(vBuffer^, mStream.Size);
    finally
      GlobalUnlock(vHandle);
    end;
    if CreateStreamOnHGlobal(vHandle, False, vStream) <> S_OK then Exit;
    (mPersistStream as IPersistStreamInit).InitNew;
    mPersistStream.Load(vStream);
  finally
    GlobalFree(vHandle);
  end;
  Result := True;
end; { LoadPersistStream }

function SavePersistStream( //保存持久性流
  mPersistStream: IPersistStream; //持久性流接口
  mStream: TStream //输出流
): Boolean; //返回保存是否成功
var
  vStream: IStream;
  vHandle: HGLOBAL;
  vBuffer: PChar;
begin
  Result := False;
  if not Assigned(mPersistStream) or not Assigned(mStream) then Exit;

  vHandle := GlobalAlloc(GMEM_MOVEABLE, 0);
  if vHandle = 0 then Exit;
  try
    if CreateStreamOnHGlobal(vHandle, False, vStream) <> S_OK then Exit;
    mPersistStream.Save(vStream, True);
    vBuffer := GlobalLock(vHandle);
    try
      mStream.Write(vBuffer^, GlobalSize(vHandle));
    finally
      GlobalUnlock(vHandle);
    end;
  finally
    GlobalFree(vHandle);
  end;
  Result := True;
end; { SavePersistStream }

function LoadDispatchStream( //载入分派器的流
  mDispatch: IDispatch; //分派器
  mStream: TStream //输入流
): Boolean; //返回载入是否成功
var
  vPersistStream: IPersistStream;
begin
  Result := False;
  if not Assigned(mDispatch) or not Assigned(mStream) then Exit;
  mDispatch.QueryInterface(IPersistStreamInit,
    vPersistStream);
  Result := LoadPersistStream(vPersistStream, mStream);
end; { LoadDispatchStream }

function SaveDispatchStream( //保存分派器的流
  mDispatch: IDispatch; //分派器
  mStream: TStream //输出流
): Boolean; //返回保存是否成功
var
  vPersistStream: IPersistStream;
begin
  Result := False;
  if not Assigned(mDispatch) or not Assigned(mStream) then Exit;
  mDispatch.QueryInterface(IPersistStreamInit,
    vPersistStream);
  Result := SavePersistStream(vPersistStream, mStream);
end; { SaveDispatchStream }

function LoadOleControlStream( //载入OLE控件流
  mOleControl: TOleControl; //OLE控件
  mStream: TStream //输入流
): Boolean; //返回载入是否成功
begin
  Result := False;
  if not Assigned(mOleControl) or not Assigned(mStream) then Exit;
  Result := LoadDispatchStream(mOleControl.DefaultDispatch, mStream);
end; { LoadOleControlStream }

function SaveOleControlStream( //保存OLE控件流
  mOleControl: TOleControl;//OLE控件
  mStream: TStream //输出流
): Boolean; //返回保存是否成功
begin
  Result := False;
  if not Assigned(mOleControl) or not Assigned(mStream) then Exit;
  Result := SaveDispatchStream(mOleControl.DefaultDispatch, mStream);
end; { SaveOleControlStream }

function ListViewHeaderImages( //设置ListView页眉的图标集
  mListView: TListView; //源ListView
  mImages: TImageList //源图标集
): Boolean; //返回设置是否成功
var
  vHandle: THandle;
begin
  Result := False;
  if not Assigned(mListView) then Exit;
  vHandle := ListView_GetHeader(mListView.Handle);
  if Assigned(mImages) then
    Header_SetImageList(vHandle, mImages.Handle)
  else Header_SetImageList(vHandle, 0);
  Result := True;
end; { ListViewHeaderImages }

function ListColumnImageIndex( //设置ListView列的图片序号
  mColumn: TListColumn; //源ListColumn
  mImageIndex: Integer; //图片序号
  mRight: Boolean = True //是否居右显示
): Boolean; //返回设置是否成功
var
  vHandle: THandle;
  vHDItem: THDItem;
begin
  Result := False;
  if not Assigned(mColumn) then Exit;
  vHandle := ListView_GetHeader(TListView(mColumn.Collection.Owner).Handle);
  FillChar(vHDItem, SizeOf(vHDItem), 0);
  Header_GetItem(vHandle, mColumn.Index, vHDItem);
  if mImageIndex < 0 then begin
    vHDItem.Mask := HDI_FORMAT;
    vHDItem.fmt := HDF_STRING;
  end else begin
    vHDItem.Mask := HDI_IMAGE or HDI_FORMAT;
    vHDItem.iImage := mImageIndex;
    vHDItem.fmt := HDF_STRING or HDF_IMAGE or
      (HDF_BITMAP_ON_RIGHT * Ord(mRight));
  end;
  Header_SetItem(vHandle, mColumn.Index, vHDItem);
end; { ListColumnImageIndex }

function ListColumnFromPoint( //根据横坐标查找ListView列的实例
  mListView: TListView; //源ListView
  mX: Integer //横坐标
): TListColumn; //如果成功返回ListView列的实例，否则返回nil
var
  I: Integer;
  vRect: TRect;
  vHandle: THandle;
  vLeft: Integer;
begin
  Result := nil;
  if not Assigned(mListView) then Exit;
  vHandle := ListView_GetHeader(mListView.Handle);
  GetWindowRect(vHandle, vRect);
  vLeft := mListView.ScreenToClient(vRect.TopLeft).X;
  for I := 0 to Header_GetItemCount(vHandle) - 1 do begin
    Header_GetItemRect(vHandle, I, @vRect);
    if PtInRect(vRect, Point(mX - vLeft, 1)) then begin
      Result := mListView.Columns[I];
      Break;
    end;
  end;
end; { ListViewColumnFromPoint }

function WebBrowserLoadFromString( //从字符串载入显示到浏览器中
  mWebBrowser: TWebBrowser; //目标浏览器
  const mHTML: string //HTML字符串
): Boolean; //是否处理成功
var
  vStringStream: TStringStream;
begin
  Result := False;
  if not (Assigned(mWebBrowser) and Assigned(mWebBrowser.Document)) then Exit;
  vStringStream := TStringStream.Create(mHTML);
  try
    Result := LoadDispatchStream(mWebBrowser.Document, vStringStream);
  finally
    vStringStream.Free;
  end;
end; { WebBrowserLoadFromString }

function WebBrowserLoadFromStream( //从流载入显示到浏览器中
  mWebBrowser: TWebBrowser; //目标浏览器
  mStream: TStream //HTML流
): Boolean; //是否处理成功
begin
  Result := False;
  if not (Assigned(mWebBrowser) and Assigned(mWebBrowser.Document)) then Exit;
  Result := LoadDispatchStream(mWebBrowser.Document, mStream);
end; { WebBrowserLoadFromStream }

end.
