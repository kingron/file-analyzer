(*//
项目:LovelyComponents.CommonFunctions
版本:5.01
标题:通用单元
说明:搜索通用函数或者是不能准确分类的函数
日期:2004-06-16
支持:jihu.wang#gmail.com
设计:ZswangY37
//*)

//*******Begin 修改日志*******//
//----------------------------------------------------------------------5.01.001
//2006-08-10 ZswangY37 No.1 更名 unit CommonFunctions50->unit CommonFunctions51
//2006-08-10 ZswangY37 No.2 添加 Stream_Insert(),Stream_Delete()流的删除和插入
//----------------------------------------------------------------------5.01.002
//2006-08-19 ZswangY37 No.1 添加 ReverseFile()利用内存镜像文件，快速颠倒文件
//----------------------------------------------------------------------5.01.003
//2006-08-21 ZswangY37 No.1 添加 ZoomRect(),function MoveRect()区域的缩放和移动
//----------------------------------------------------------------------5.01.004
//2006-09-05 ZswangY37 No.1 添加 ParentPath()取得上级路径的函数
//----------------------------------------------------------------------5.01.005
//2006-09-23 ZswangY37 No.1 添加 ProcessFileName()取得进程的文件名
//2006-09-23 ZswangY37 No.2 添加 ProcessPrivilege()设置进程的权限
//2006-09-23 ZswangY37 No.3 添加 ProcessExists() 判断进程是否存在
//----------------------------------------------------------------------5.01.006
//2006-09-25 ZswangY37 No.1 修改 判断文件被独占的情况，避免出现异常
//----------------------------------------------------------------------5.01.007
//2006-10-13 ZswangY37 No.1 完善 判断窗体是否最小化
//----------------------------------------------------------------------5.01.008
//2006-12-26 ZswangY37 No.1 完善 考虑文件路径中出现"\??\"的情况
//----------------------------------------------------------------------5.01.009
//2007-01-28 ZswangY37 No.1 添加 SetDefaultPrinter()设置默认打印机
//----------------------------------------------------------------------5.01.010
//2007-02-01 ZswangY37 No.1 添加 GetSpecialFolderPath()获得系统路径的函数
//----------------------------------------------------------------------5.01.011
//2007-02-03 ZswangY37 No.1 添加 DirectorySize()获得目录大小的函数
//----------------------------------------------------------------------5.01.011
//2007-03-02 ZswangY37 No.1 添加 TrackerWindow()高亮窗体
//2007-04-02 ZswangY37 No.1 添加 剪贴板存储的函数
//----------------------------------------------------------------------5.01.012
//2007-05-07 ZswangY37 No.1 添加 ControlFromPoint()函数
//2007-06-29 ZswangY37 No.1 添加 CompareStream()、CompareFile()比较流和文件的函数
//2007-07-18 ZswangY37 No.1 添加 SymmetryColor()函数取得对称色
//2007-07-26 ZswangY37 No.1 完善 DeletePath()避免误删除其他文件
//2007-08-01 ZswangY37 No.1 添加 DoubleLineIntersect()获得两条直线的交点函数
//2007-08-02 ZswangY37 No.1 添加 LineEllipseIntersect()获得直线和椭圆的交点函数
//2007-08-02 ZswangY37 No.2 添加 LineArcIntersect()获得直线和椭曲线的交点函数
//2007-08-02 ZswangY37 No.3 添加 LineChordIntersect()获得直线和椭曲面的交点函数
//2007-08-02 ZswangY37 No.4 添加 AngleInRange()判断角度是否在一定范围的函数
//2007-08-13 ZswangY37 No.1 修正 长宽太大，造成整数溢出的异常
//2007-08-17 ZswangY37 No.1 添加 PtByRound()判断坐标是否在圆角矩形中
//2007-08-17 ZswangY37 No.2 添加 RectInRound()判断矩形是否在圆角矩形中
//2007-08-17 ZswangY37 No.3 添加 RectByRound()判断矩形是否和圆角矩形相交
//2007-08-21 ZswangY37 No.1 修正 判断多边形的端点是否在矩形中时，没有处理旋转
//2007-08-22 ZswangY37 No.1 添加 PtInBezier()、RectByBezier()处理贝塞尔曲线
//*******End 修改日志*******//

{$DEFINE Unit_CommonFunctions51}
{$WARN SYMBOL_PLATFORM OFF}

unit CommonFunctions51;

interface

uses Windows, Messages, SysUtils, Classes, Forms, ShellAPI, Controls, Graphics;

type
  TFileVersionInfomation = record // 文件版本信息
    rCommpanyName: string;
    rFileDescription: string;
    rFileVersion: string;
    rInternalName: string;
    rLegalCopyright: string;
    rLegalTrademarks: string;
    rOriginalFileName: string;
    rProductName: string;
    rProductVersion: string;
    rComments: string;
    rVsFixedFileInfo: VS_FIXEDFILEINFO;
    rDefineValue: string;
  end;

{$IFDEF DEF_VERSIONINFO}
var
  vModuleVersionInfomation: TFileVersionInfomation;
{$ENDIF}

const
{ VK_0 thru VK_9 are the same as ASCII '0' thru '9' ($30 - $39) }
  VK_0 = $30;  VK_1 = $31;  VK_2 = $32;  VK_3 = $33;  VK_4 = $34;
  VK_5 = $35;  VK_6 = $36;  VK_7 = $37;  VK_8 = $38;  VK_9 = $39;

{ VK_A thru VK_Z are the same as ASCII 'A' thru 'Z' ($41 - $5A) }
  VK_A = $41;  VK_B = $42;  VK_C = $43;  VK_D = $44;
  VK_E = $45;  VK_F = $46;  VK_G = $47;  VK_H = $48;
  VK_I = $49;  VK_J = $4A;  VK_K = $4B;  VK_L = $4C;  VK_M = $4D;  VK_N = $4E;
  VK_O = $4F;  VK_P = $50;  VK_Q = $51;  VK_R = $52;  VK_S = $53;  VK_T = $54;
  VK_U = $55;  VK_V = $56;  VK_W = $57;  VK_X = $58;  VK_Y = $59;  VK_Z = $5A;

{ 标点符号按键值 }
  VK_SEMICOLON = 186; // ";"分号
  VK_EQUAL = 187; // "="等号
  VK_COMMA = 188; // ","逗号
  VK_MINUS = 189; // "-"减号
  VK_PERIOD = 190; // "."句号
  VK_SLASH = 191; // "/" 斜线
  VK_BACKQUOTE = 192; // "`" 后退符
  VK_LEFTBRACKET = 219; // "[" 左括号
  VK_BACKSLASH = 220; // "\" 反斜线
  VK_RIGHTBRACKET = 221; //"]" 右括号
  VK_QUOTE = 222; // "'" 引号
     
const
  CAPTUREBLT = $40000000;
  
type
  COLOR16 = Word;

  PTriVertex = ^TTriVertex;
  _TRIVERTEX = packed record
    x: Longint;
    y: Longint;
    Red: COLOR16;
    Green: COLOR16;
    Blue: COLOR16;
    Alpha: COLOR16;
  end;
  TTriVertex = _TRIVERTEX;
  TRIVERTEX = _TRIVERTEX;

function GradientFill(DC: HDC; Vertex: PTriVertex; NumVertex: ULONG;
  Mesh: Pointer; NumMesh, Mode: ULONG): BOOL; stdcall;
  external msimg32 name 'GradientFill';

function GetFileVersionInfomation( // 读取文件的版本信息
  mFileName: string; // 目标文件名
  var nFileVersionInfomation: TFileVersionInfomation; // 文件信息结构
  mDefineName: string = '' // 自定义字段名
): Boolean; // 返回是否读取成功

function Iif( // 条件取值
  mBool: Boolean; // 是否取第一个值
  mDataA, mDataB: Variant // 列出两个值
): Variant; overload; // 如果mBool为True返回mDataA，否则返回mDataB
function Iif( // 条件取值
  mBool: Boolean; // 列出两个值
  mDataA, mDataB: TObject // 列出两个值
): TObject; overload; // 如果mBool为True返回mDataA，否则返回mDataB

function ExePath: string; // 返回当前应用程序的路径
function SysPath: string; // 返回系统所在的路径
function TempPath: string; // 返回临时路径
function WinPath: string; // 返回Windows所在的路径

function File_SearchString( // 在文件中搜索字符串
  mFileName: string; // 文件名
  mStr: string; // 字符串
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回字符串所在的位置

function File_SearchMark( // 在文件中搜索特征码
  mFileName: string; // 文件名
  mMark: string; // 特征码
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回特征码在进程中的地址

function Stream_SearchString( // 在流中搜索字符串
  mStream: TStream; // 目标流
  mStr: string; // 字符串
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回字符串所在的位置

function Stream_Read( // 流读取
  mStream: TStream; // 目标流
  mBaseAddress: Integer; // 基地址
  mLength: Integer // 长度
): string;  // 读成字符串返回

function Stream_Write( // 流写入
  mStream: TStream; // 目标流
  mBaseAddress: Integer; // 基地址
  mStr: string // 数据
): Boolean; // 返回写入是否成功

function Stream_Insert( // 流插入
  mStream: TStream; // 流
  mIndex: Integer; // 起始位置
  const mBuffer; // 插入的数据
  mLength: Integer // 数据的长度
): Boolean; // 返回插入是否成功

function Stream_Delete( // 删除流的部分
  mStream: TStream; // 流
  mIndex: Integer; // 起始位置
  mLength: Integer // 数据的长度
): Boolean; // 返回删除是否成功

function Stream_SearchMark( // 在流中搜索特征码
  mStream: TStream; // 目标流
  mMark: string; // 特征码
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回特征码在进程中的地址

function File_Read( // 文件读取
  mFileName: string; // 文件名
  mBaseAddress: Integer; // 基地址
  mLength: Integer // 长度
): string; // 返回读取到的数据

function File_Write( // 文件写入
  mFileName: string; // 文件名
  mBaseAddress: Integer; // 基地址
  mStr: string // 数据
): Boolean; // 返回写入是否成功

function CompareStream( // 比较两个流是否相等
  mStream1, mStream2: TStream // 两个流
): Boolean; // 返回两个流是否相等

function CompareFile( // 比较两个文件是否相等
  mFileName1, mFileName2: string // 两个文件
): Boolean; // 返回两个文件是否相等

function IsFocusd( // 判断窗体是否具有焦点
  mHandle: THandle // 窗体句柄
): Boolean; // 返回窗体是否具有焦点

function SignNumber( // 带符号的数字
  mNumber: Integer // 源数字
): string; // 返回带符号的数字字符串

function SendPlaySound( // 播放声音
  mFileName: string;  // 声音文件名
  mAlias: string = 'MM' // 别名
): Boolean; // 返回播放是否成功

function ResourceExists( // 资源是否存在
  mInstance: THandle; // 实例句柄
  mResName: string; // 资源名
  mResType: PChar // 资源类名
): Boolean; // 返回资源是否存在

function ReverseFile( // 颠倒文件的内容
  mFileName: string // 文件名
): Boolean; // 返回颠文件是否成功

function ZoomRect( // 缩放区域
  mRect: TRect; // 区域
  mZoom: Integer // 缩放的大小
): TRect; overload; // 返回缩放后的区域

function ZoomRect( // 缩放区域
  mRect: TRect; // 区域
  mZoom: TPoint // 缩放的大小
): TRect; overload; // 返回缩放后的区域

function MoveRect( // 移动区域
  mRect: TRect; // 区域
  mOffset: TPoint // 偏移
): TRect; // 返回移动后的区域

function ParentPath( // 取得上级路径
  mPath: string // 源路经
): string; // 返回上级路径

function ProcessFileName( // 获取进程的文件名
  mProcessID: THandle // 进程ID
): string; // 返回进程的文件名

function ProcessPrivilege( // 设置进程的权限
  mProcess: THandle; // 进程句柄
  mPrivilegeName: string; // 权限名称
  mEnabled: Boolean // 是否激活
): Boolean; // 返回设置是否成功

function ProcessExists( // 判断进程是否存在
  mProcessID: THandle // 进程ID
): Boolean; // 返回进程是否存在

function ForceForegroundWindow( // 将窗体设置为最前端,并获得焦点
  mHandle: THandle // 窗体句柄
): Boolean; // 返回设置是否成功

const
  OPF_PRINTERNAME = $01; // 打印机
  OPF_PATHNAME    = $02; // 路径

{$WARNINGS OFF}
function SHObjectProperties(
  Owner: HWND; // 调用的窗体句柄
  Flags: UINT; // 参数的对象类型
  ObjectName: PWideChar; // 对象名称
  InitialTabName: PWideChar // 初始也名称
): LongBool; stdcall; external shell32 Index 178;
{$WARNINGS ON}

function AddrToNumber( //Ip地址转换为数值
  mAddr: string // Ip地址字符串 x.x.x.x
): Integer; // 返回Ip地址的数值

function SetToStr( // 集合类型转换为字符串
  mTypeInfo: Pointer; // 集合类型信息指针
  mValue: Integer; // 集合数值
  mBrackets: Boolean = False // 是否加上括号
): string; // 返回转换后的字符串

function StrToSet( // 字符串转化为集合
  mTypeInfo: Pointer; // 集合类新信息指针
  mValue: string // 集合字符表达式
): Integer; // 返回集合数值

function ReviseRect( // 修正矩形
  mRect: TRect // 矩形参数
): TRect; // 返回修正后的矩形

function PointToPoint( // 计算点到点的距离
  mPointA, mPointB: TPoint // 两个点的坐标
): Double; // 返回点与点间的距离

function PointToLine( // 计算点到直线的距离
  mPoint: TPoint; // 点的坐标
  mLineA, mLineB: TPoint // 线段的坐标
): Double; // 返回点到直线的距离

function PtInLine( // 判断点是否在一个线段中
  mPoint: TPoint; // 点的坐标
  mLineA, mLineB: TPoint; // 线段坐标
  mPenWidth: Integer // 线条粗细
): Boolean; // 返回点是否在线段中

function PtInEllipse( // 判断点是否在椭圆中
  mPoint: TPoint; // 点的坐标
  mEllipse: TRect // 椭圆坐标
): Boolean; // 返回点是否在椭圆中

function Equation12( //解一元二次方程
  A, B, C: Double; //A * Sqr(X) + B * X + C = 0
  var nReturnA, nReturnB: Double // 返回X的两个值
): Integer; // 返回得到X的个数 //0表示没有结果

function InitXFrom( // 旋转画布
  mCenter: TPoint; // 中心坐标
  mAngle: Double // 旋转角度
): TXForm; // 返回上一次的数值

function MovePoint( // 偏移一个点
  mPoint: TPoint; // 点坐标
  DX, DY: Integer // 偏移的位置
): TPoint; // 返回偏移的点位置

function RotatePoint( // 旋转一个点坐标
  mPoint: TPoint; // 原始点
  mCenter: TPoint; // 中心点坐标
  mAngle: Double // 旋转角度
): TPoint; // 返回旋转后的点坐标

function PointToAngle( // 计算坐标的角度
  mOrigin: TPoint; // 原坐标
  mPoint: TPoint; // 计算坐标
  mEccentricity: Double = 1 // 离心率 a / b // 计算椭圆的角度
): Double; // 返回该坐标相对原坐标的角度 // Pi为单位

function RectInRect( // 判断矩形A是否在矩形B中
  mRectA, mRectB: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形A是否在矩形B中

function LineByRect( // 判断直线是否和矩形相交
  mLineA, mLineB: TPoint; //直线
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 判断直线是否和矩形相交

function RectByRect( // 判断矩形A是否和矩形B相交
  mRectA, mRectB: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形A是否在矩形B中

function RectByEllipse( // 判断矩形是否和椭圆相交
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和椭圆相交

function RectInChord( // 判断矩形是否在椭面上
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否在椭面上

function EllipseInRect( // 判断一个椭圆是否在矩形中
  mEllipse: TRect; // 椭圆
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回一个椭圆是否在矩形中

function ChordInRect( // 判断椭面是否在矩形中
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回椭面是否在矩形中

function RectInEllipse( // 判断矩形在椭圆中
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形在椭圆中

function RectByChord( // 判断矩形是否和椭圆面相交
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形和椭圆面相交

function RectByArc( // 判断矩形是否和椭曲线相交
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和椭曲线相交

function RectByPolygon( // 判断矩形是否和多边形相交
  mRect: TRect; // 矩形
  mPoints: array of TPoint; // 多边形坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回判断矩形是否和多边形相交

function Angle8Point( // 得到坐标偏向的八个方位的坐标
  mOrigin: TPoint; // 原点
  mPoint: TPoint // 坐标点
): TPoint; // 八个方位坐标

function Angle8Index( // 得到坐标偏向的八个方位的序号
  mOrigin: TPoint; // 原点
  mAngle: Double // 角度
): Integer; // 八个方位序号

function PtInPolygon( // 判断点是否在多边形上
  mPoint: TPoint; // 点
  mPoints: array of TPoint // 多边形坐标
): Boolean; // 返回点是否在多边形上

function RectInPolygon( // 判断矩形是否在多边形中
  mRect: TRect; // 矩形
  mPoints: array of TPoint; // 多边形坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否在多边形中

function BezierPoints( // 获得贝塞尔坐标点
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // 贝塞尔曲线坐标
  var mPoints: array of TPoint // 返回计算的坐标
): Boolean; // 返回计算是否成功

function PtInBezier( // 判断点是否在贝塞尔曲线上
  mPoint: TPoint; // 点坐标
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // 贝塞尔曲线坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回点是否在贝塞尔曲线上

function PtInHollowPolygon( // 判断点是否在空心多边形上
  mPoint: TPoint; // 点坐标
  mPoints: array of TPoint; // 折线坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回点是否在空心多边形上

function PtInPolyline( // 判断点是否在折线上
  mPoint: TPoint; // 点坐标
  mPoints: array of TPoint; // 折线坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回点是否在折线上

function RectByBezier( // 判断矩形是否和贝塞尔曲线相交
  mRect: TRect; // 矩形
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // 贝塞尔曲线坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和贝塞尔曲线相交

function RectByPolyline( // 判断矩形是否和折线相交
  mRect: TRect; // 矩形
  mPoints: array of TPoint; // 多边形坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和折线相交

function PtInChord( // 判断一个点是否在椭面上
  mPoint: TPoint; // 已知点
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint // 结束半径坐标
): Boolean; // 返回点是否在弧线上

function DoubleLineIntersect( // 计算两条线段的交点坐标
  mLine1A, mLine1B: TPoint; // 线段1
  mLine2A, mLine2B: TPoint; // 线段2
  var nPoint: TPoint // 返回交点坐标
): Boolean; // 返回两条直线是否存在交点

function LineEllipseIntersect( // 计算线段和椭圆的交点
  mLineA, mLineB: TPoint; // 线段
  mEllipse: TRect; // 椭圆
  var nPointA: TPoint; // 返回交点坐标
  var nPointB: TPoint // 返回交点坐标
): Integer; // 返回交点的个数

function AngleInRange( // 判断角度是否在一定范围内
  mAngle: Double; // 测试角度
  mAngleBegin: Double; // 开始角度
  mAngleEnd: Double // 终止角度
): Boolean; // 返回角度是否在一定范围内

function LineArcIntersect( // 获得线段和椭面的交点
  mLineA, mLineB: TPoint; // 直线
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  var nPointA: TPoint; // 返回交点坐标
  var nPointB: TPoint // 返回交点坐标
): Integer; // 返回交点的个数

function LineChordIntersect( // 获得线段和椭面的交点
  mLineA, mLineB: TPoint; // 直线
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  var nPointA: TPoint; // 返回交点坐标
  var nPointB: TPoint // 返回交点坐标
): Integer; // 返回交点的个数

function PtInChordLine( // 判断一个点是否在椭面的节点连线上
  mPoint: TPoint; // 已知点
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回一个点是否在椭面的节点连线上

function PointInRect( // 判断点是否在矩形中
  mPoint: TPoint; // 点坐标
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回点是否在矩形中

function PtInRound( // 判断点坐标是否在圆角矩形中
  mPoint: TPoint; // 坐标
  mRound: TRect; // 矩形
  mRadial: TPoint // 圆角高宽
): Boolean; // 返回点是否在圆角矩形中

function RectByRound( // 判断矩形和圆角矩形是否相交
  mRect: TRect; // 矩形
  mRound: TRect; // 圆角矩形
  mRadial: TPoint; // 圆角高宽
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形和圆角矩形是否相交

function RectInRound( // 判断矩形是否在圆角矩形中
  mRect: TRect; // 矩形
  mRound: TRect; // 圆角矩形
  mRadial: TPoint; // 圆角高宽
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否在圆角矩形中

function SetDefaultPrinter( // 设置默认打印机
  mPrinterIndex: Integer // 默认打印机序号
): Boolean; // 返回设置是否成功

function GetSpecialFolderPath( // 返回获取系统文件或系统目录
  mFolder: Integer // 目录标识 // ShlObj // CSIDL_...
): string; // 返回获取到的目录名

function DirectoryInfo( // 获得目录的大小、文件个数、目录个数
  mDirectory: string; // 目录名
  var nFileSize: Integer; // 总大小
  var nFileCount: Integer; // 文件个数
  var nDirectoryCount: Integer // 目录个数
): Boolean; // 返回目录的大小

{$IFDEF USES_COMPRESSION}
function FileCompression( // 将文件压缩到流中
  mFileName: string; // 文件名
  mStream: TStream // 目标
): Integer; // 返回压缩后的大小

function FileDecompression( // 从流中解压文件
  mFileName: string; // 目标文件名
  mStream: TStream // 来源
): Integer; // 返回解压后的大小

function DirectoryCompression( // 将目录压缩成文件
  mDirectory: string; // 目录名
  mFileName: string // 压缩后的文件名
): Integer; overload; // 返回压缩后的大小 //如果为负数则标识错误

function DirectoryCompression( // 将目录压缩成流
  mDirectory: string; // 目录名
  mStream: TStream // 压缩后的流
): Integer; overload; // 返回压缩后的大小 //如果为负数则标识错误

type
  TDirectoryDecompressionProgress = function( // 解压进度
    mFileCount: Integer; // 文件总个数
    mFileIndex: Integer; // 当前解压文件序号
    mPackSize: Integer; // 文件压缩大小
    mFileName: string; // 当前解压文件名
    mFileSize: Integer; // 当前解压文件大小
    mParam: Integer // 附加参数
  ): Boolean; // 返回是否继续解压

function DirectoryDecompression( // 从文件中解压目录
  mDirectory: string; // 目录名
  mFileName: string; // 压缩文件名
  mProgress: TDirectoryDecompressionProgress = nil; // 进度处理
  mParam: Integer = 0 // 附加参数
): Integer; overload; // 返回解压后的个数

function DirectoryDecompression( // 从流中解压目录
  mDirectory: string; // 指定目录名
  mStream: TStream; // 压缩流
  mProgress: TDirectoryDecompressionProgress = nil; // 进度处理
  mParam: Integer = 0 // 附加参数
): Integer; overload; // 返回解压的文件个数
{$ENDIF}

function TrackerWindow( // 反色显示窗体外框，用来选取窗体用
  AHandle: THandle // 窗体句柄
): Boolean; // 返回处理是否成功

function ClipboardSaveToStream( // 将剪贴板的数据保存到流中
  mStream: TStream // 数据流
): Boolean; // 返回处理是否成功

function ClipboardLoadFromStream( // 将流中的数据载入到剪贴板中
  mStream: TStream // 数据流
): Boolean; // 返回处理是否成功

function ClipboardSize: Integer; // 返回剪贴板中数据的总大小

function ControlFromPoint( // 获得容器中相应位置对应的控件
  mParent: TWinControl; // 容器
  mPoint: TPoint // 坐标
): TControl; // 返回容器中相应位置对应的控件

function InitTriVertex( // 初始化TriVertex结构
  mPoint: TPoint; // 坐标
  mColor: TColor // 颜色
): TTriVertex; // 返回初始化后的结构

function FileSize( // 获得文件的大小
  AFileName: string // 文件名
): Integer; // 返回文件的大小

function SymmetryColor( // 寻找对称的颜色
  mColor: TColor // 原色
): TColor; // 返回对称颜色

function DeletePath( // 删除指定目录
  mDirName: string; // 目录名
  mPrefix: string; // 前缀
  mChangeAttrib: Boolean // 是否修改属性以便删除
): Boolean; // 返回删除指定目录是否成功

function FileTimeToDateTime( // 将文件时间处理为TDateTime
  mFileTime: TFileTime // 文件时间
): TDateTime; // 返回处理后的结果

implementation

uses TypInfo, Types, Math, MMSystem, TlHelp32, PsAPI, Printers, ShlObj, Clipbrd,
  StringFunctions51{$IFDEF USES_COMPRESSION}, ZLib20{$ENDIF};

function FileTimeToDateTime( // 将文件时间处理为TDateTime
  mFileTime: TFileTime // 文件时间
): TDateTime; // 返回处理后的结果
var
  vSystemTime: TSystemTime;
  vLocalFileTime: TFileTime;
begin
  FileTimeToLocalFileTime(mFileTime, vLocalFileTime);
  FileTimeToSystemTime(vLocalFileTime, vSystemTime);
  Result := SystemTimeToDateTime(vSystemTime);
end; { FileTimeToDateTime }

function DeletePath( // 删除指定目录
  mDirName: string; // 目录名
  mPrefix: string; // 前缀
  mChangeAttrib: Boolean // 是否修改属性以便删除
): Boolean; // 返回删除指定目录是否成功
var
  vSearchRec: TSearchRec;
  vPathName: string;
  K: Integer;
begin
  Result := True;
  if mDirName = '' then Exit;
  vPathName := mDirName + '\*.*';
  K := FindFirst(vPathName, faAnyFile, vSearchRec);
  while K = 0 do begin
    if (vSearchRec.Attr and faDirectory > 0) and
      (Pos(vSearchRec.Name, '..') = 0) then
    begin
      if mChangeAttrib then
        FileSetAttr(mDirName + '\' + vSearchRec.Name, faDirectory);
      if (mPrefix = '') or (Pos(mPrefix, vSearchRec.Name) = 1) then
        Result := DeletePath(mDirName + '\' + vSearchRec.Name, mPrefix, mChangeAttrib);
    end else if Pos(vSearchRec.Name, '..') = 0 then
    begin
      if mChangeAttrib then
        FileSetAttr(mDirName + '\' + vSearchRec.Name, 0);
      if (mPrefix = '') or (Pos(mPrefix, vSearchRec.Name) = 1) then
        Result := DeleteFile(PChar(mDirName + '\' + vSearchRec.Name));
    end;
    if not Result then Break;
    K := FindNext(vSearchRec);
  end;
  FindClose(vSearchRec);
  Result := RemoveDir(mDirName);
end; { DeletePath }

function SymmetryColor( // 寻找对称的颜色
  mColor: TColor // 原色
): TColor; // 返回对称颜色
var
  R, G, B: Byte;
begin
  mColor := ColorToRGB(mColor);
  R := GetRValue(mColor);
  G := GetGValue(mColor);
  B := GetBValue(mColor);
  if R + 126 < 256 then R := R + 126
  else R := R - 126;
  if G + 126 < 256 then G := G + 126
  else G := G - 126;
  if B + 126 < 256 then B := B + 126
  else B := B - 126;
  Result := RGB(R, G, B);
end; { SymmetryColor }

function FileSize( // 获得文件的大小
  AFileName: string // 文件名
): Integer; // 返回文件的大小
var
  vHandle: THandle;
  vFindData: TWin32FindData;
begin
  Result := -1;
  vHandle := FindFirstFile(PChar(AFileName), vFindData);
  if vHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(vHandle);
    if (vFindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
      Result := vFindData.nFileSizeLow;
  end;
end; { FileSize }

function InitTriVertex( // 初始化TriVertex结构
  mPoint: TPoint; // 坐标
  mColor: TColor // 颜色
): TTriVertex; // 返回初始化后的结构
begin
  Result.x := mPoint.X;
  Result.y := mPoint.Y;
  Result.Alpha := 0;
  mColor := ColorToRGB(mColor);
  Result.Red := GetRValue(mColor) shl 8;
  Result.Green := GetGValue(mColor) shl 8;
  Result.Blue := GetBValue(mColor) shl 8;
end; { InitTriVertex }

function ControlFromPoint( // 获得容器中相应位置对应的控件
  mParent: TWinControl; // 容器
  mPoint: TPoint // 坐标
): TControl; // 返回容器中相应位置对应的控件
var
  I: Integer;
begin
  Result := nil;
  if not Assigned(mParent) then Exit;
  for I := 0 to mParent.ControlCount - 1 do begin
    if not mParent.Controls[I].Visible then Continue;
    if PtInRect(mParent.Controls[I].BoundsRect, mPoint) then begin
      if mParent.Controls[I] is TWinControl then
        Result := ControlFromPoint(TWinControl(mParent.Controls[I]),
          Point(mPoint.X - mParent.Controls[I].Left,
            mPoint.Y - mParent.Controls[I].Top));
      if not Assigned(Result) then Result := mParent.Controls[I];
    end;
  end;
end; { ControlFromPoint }

type
  TDataIdnet = array[0..2] of Char;

  TClipboardFileHead = packed record
    rIdent: TDataIdnet;
    rCount: Word;
  end;

  TClipboardFileItem = packed record
    rFormat: Word;
    rSize: Longword;
    rData: Pointer;
  end;

const
  rDataIdnet: TDataIdnet = 'cbf';

function ClipboardSaveToStream( // 将剪贴板的数据保存到流中                     //2007-04-02 ZswangY37 No.1 
  mStream: TStream // 数据流
): Boolean; // 返回处理是否成功
var
  vClipboardFileHead: TClipboardFileHead;
  vClipboardFileItem: TClipboardFileItem;
  I: Integer;

  vData: THandle;
begin
  Result := False;
  if not Assigned(mStream) then Exit;
  vClipboardFileHead.rIdent := rDataIdnet;
  vClipboardFileHead.rCount := Clipboard.FormatCount;
  mStream.Write(vClipboardFileHead, SizeOf(vClipboardFileHead));
  try
    Clipboard.Open;
    for I := 0 to Clipboard.FormatCount - 1 do
    begin
      vData := GetClipboardData(Clipboard.Formats[I]);

      vClipboardFileItem.rFormat := Clipboard.Formats[I];
      vClipboardFileItem.rSize := GlobalSize(vData);

      vClipboardFileItem.rData := GlobalLock(vData);
      try
        mStream.Write(vClipboardFileItem, SizeOf(vClipboardFileItem) -
          SizeOf(vClipboardFileItem.rData));
        mStream.Write(vClipboardFileItem.rData^, vClipboardFileItem.rSize);
      finally
        GlobalUnlock(vData);
      end;
    end;
  finally
    Clipboard.Close;
  end;
  Result := True;
end; { ClipboardSaveToStream }

function ClipboardLoadFromStream( // 将流中的数据载入到剪贴板中
  mStream: TStream // 数据流
): Boolean; // 返回处理是否成功
var
  vClipboardFileHead: TClipboardFileHead;
  vClipboardFileItem: TClipboardFileItem;

  I: Integer;
  vData: THandle;
begin
  Result := False;
  if not Assigned(mStream) then Exit;
  if mStream.Size <= SizeOf(vClipboardFileHead) then Exit;
  mStream.Read(vClipboardFileHead, SizeOf(vClipboardFileHead));
  if vClipboardFileHead.rIdent <> rDataIdnet then Exit;
  Clipboard.Clear;
  Clipboard.Open;
  try
    for I := 0 to vClipboardFileHead.rCount - 1 do
    begin
      mStream.Read(vClipboardFileItem, SizeOf(vClipboardFileItem) -
        SizeOf(vClipboardFileItem.rData));
      vData := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE,
        vClipboardFileItem.rSize);
      vClipboardFileItem.rData := GlobalLock(vData);
      try
        mStream.Read(vClipboardFileItem.rData^, vClipboardFileItem.rSize);
        SetClipboardData(vClipboardFileItem.rFormat, vData);
      finally
        GlobalUnlock(vData);
      end;
    end;
  finally
    Clipboard.Close;
  end;
  Result := True;
end; { ClipboardLoadFromStream }

function ClipboardSize: Integer; // 返回剪贴板中数据的总大小
var
  I: Integer;
begin
  Result := 0;
  Clipboard.Open;
  try
    for I := 0 to Clipboard.FormatCount - 1 do
      Inc(Result, GlobalSize(GetClipboardData(Clipboard.Formats[I])));
  finally
    Clipboard.Close;
  end;
end; { ClipboardSize }

const
  cBufferSize = $1000;

function TrackerWindow( // 反色显示窗体外框，用来选取窗体用
  AHandle: THandle // 窗体句柄
): Boolean; // 返回处理是否成功
var
  vDC: HDC;
  vRect: TRect;
begin
  Result := False;
  if not IsWindow(AHandle) then Exit;
  GetWindowRect(AHandle, vRect);
  OffsetRect(vRect, -vRect.Left, -vRect.Top);
  if IsRectEmpty(vRect) then Exit;
  vDC := GetWindowDC(AHandle);
  try
    PatBlt(vDC, vRect.Left, vRect.Top, vRect.Right - vRect.Left,
      vRect.Bottom - vRect.Top, DSTINVERT);
    PatBlt(vDC, vRect.Left + 4, vRect.Top + 4, vRect.Right - vRect.Left - 4 * 2,
      vRect.Bottom - vRect.Top - 4 * 2, DSTINVERT);
  finally
    ReleaseDC(AHandle, vDC);
  end;
  Result := True;
end; { TrackerWindow }

{$IFDEF USES_COMPRESSION}
type
  TFileHead = packed record
    rIdent: array[0..2] of Char; //标识
    rVersion: Byte; //版本
  end;

const
  cIdent = 'zsf';
  cVersion = $01;

function FileCompression( // 将文件压缩到流中
  mFileName: string; // 文件名
  mStream: TStream // 目标
): Integer; // 返回压缩后的大小
var
  vFileStream: TFileStream;
  vBuffer: array[0..cBufferSize]of Char;
  vPosition: Integer;
  I: Integer;
begin
  Result := -1;
  if not FileExists(mFileName) then Exit;
  if not Assigned(mStream) then Exit;
  vPosition := mStream.Position;
  vFileStream := TFileStream.Create(mFileName, fmOpenRead or fmShareDenyNone);
  with TCompressionStream.Create(clMax, mStream) do try
    for I := 1 to vFileStream.Size div cBufferSize do
    begin
      vFileStream.Read(vBuffer, cBufferSize);
      Write(vBuffer, cBufferSize);
    end;
    I := vFileStream.Size mod cBufferSize;
    if I > 0 then
    begin
      vFileStream.Read(vBuffer, I);
      Write(vBuffer, I);
    end;
  finally
    Free;
    vFileStream.Free;
  end;
  Result := mStream.Size - vPosition; //增量
end; { FileCompression }

function FileDecompression( // 从流中解压文件
  mFileName: string; // 目标文件名
  mStream: TStream // 来源
): Integer; overload; // 返回解压后的大小
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
  vBuffer: array[0..cBufferSize]of Char;
  I: Integer;
begin
  Result := -1;
  if not Assigned(mStream) then Exit;
  ForceDirectories(ExtractFilePath(mFileName)); //创建目录
  { TODO : 判断文件是否可以创建 }
  vFileHandle := FileCreate(mFileName);                                         //2006-09-25 ZswangY37 No.1 
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  with TDecompressionStream.Create(mStream) do try
    repeat
      I := Read(vBuffer, cBufferSize);
      vFileStream.Write(vBuffer, I);
    until I = 0;
    Result := vFileStream.Size;
  finally
    Free;
    vFileStream.Free;
  end;
end; { FileDecompression }

function DirectoryCompression( // 压缩目录
  mDirectory: string; // 目录名
  mFileName: string // 压缩后的文件名
): Integer; overload; // 返回压缩后的大小 //如果为负数则标识错误
var
  vFileStream: TFileStream;
begin
  vFileStream := TFileStream.Create(mFileName, fmCreate or fmShareDenyWrite);
  try
    Result := DirectoryCompression(mDirectory, vFileStream);
  finally
    vFileStream.Free;
  end;
end; { DirectoryCompression }

function DirectoryCompression( // 将目录压缩成流
  mDirectory: string; // 目录名
  mStream: TStream // 压缩后的流
): Integer; overload; // 返回压缩后的大小 //如果为负数则标识错误
var
  vFileInfo: TStrings;
  vFileInfoSize: Integer;
  vFileInfoBuffer: PChar;
  vFileHead: TFileHead;

  vMemoryStream: TMemoryStream;

  procedure pAppendFile(mSubFile: string);
  begin
    vFileInfo.Append(Format('%s|%d',
      [StringReplace(mSubFile, mDirectory + '\', '', [rfReplaceAll, rfIgnoreCase]),
        FileCompression(mSubFile, vMemoryStream)]));
    Inc(Result);
  end; { pAppendFile }

  procedure pSearchFile(mPath: string);
  var
    vSearchRec: TSearchRec;
    K: Integer;
  begin
    K := FindFirst(mPath + '\*.*', faAnyFile and not faHidden, vSearchRec);
    while K = 0 do
    begin
      if (vSearchRec.Attr and faDirectory > 0) and
        (Pos(vSearchRec.Name, '..') = 0) then
        pSearchFile(mPath + '\' + vSearchRec.Name)
      else if Pos(vSearchRec.Name, '..') = 0 then
        pAppendFile(mPath + '\' + vSearchRec.Name);
      K := FindNext(vSearchRec);
    end;
    FindClose(vSearchRec);
  end; { pSearchFile }
begin
  Result := 0;
  if not Assigned(mStream) then Exit;
  if not DirectoryExists(mDirectory) then Exit;
  vFileInfo := TStringList.Create;
  vMemoryStream := TMemoryStream.Create;
  mDirectory := ExcludeTrailingPathDelimiter(mDirectory);

  try
    pSearchFile(mDirectory);
    vFileInfoBuffer := vFileInfo.GetText;
    vFileInfoSize := StrLen(vFileInfoBuffer);

    { DONE -oZswang -c添加 : 写入头文件信息 }
    vFileHead.rIdent := cIdent;
    vFileHead.rVersion := cVersion;
    mStream.Write(vFileHead, SizeOf(vFileHead));

    mStream.Write(vFileInfoSize, SizeOf(vFileInfoSize));
    mStream.Write(vFileInfoBuffer^, vFileInfoSize);
    vMemoryStream.Position := 0;
    mStream.CopyFrom(vMemoryStream, vMemoryStream.Size);
  finally
    vFileInfo.Free;
    vMemoryStream.Free;
  end;
end;

function DirectoryDecompression( // 从文件中解压目录
  mDirectory: string; // 目录名
  mFileName: string; // 压缩文件名
  mProgress: TDirectoryDecompressionProgress = nil; // 进度处理
  mParam: Integer = 0 // 附加参数
): Integer; overload; // 返回解压的文件个数
var
  vFileStream: TFileStream;
begin
  vFileStream := TFileStream.Create(mFileName, fmOpenRead or fmShareDenyNone);
  try
    Result := DirectoryDecompression(
      mDirectory, vFileStream, mProgress, mParam);
  finally
    vFileStream.Free;
  end;
end; { DirectoryDeompression }

function DirectoryDecompression( // 从流中解压目录
  mDirectory: string; // 指定目录名
  mStream: TStream; // 压缩流
  mProgress: TDirectoryDecompressionProgress = nil; // 进度处理
  mParam: Integer = 0 // 附加参数
): Integer; overload; // 返回解压的文件个数
var
  vFileInfo: TStrings;
  vFileInfoSize: Integer;
  vFileHead: TFileHead;
  vFileCount: Integer;
  vFileName: string;
  vFileSize: Integer;
  vPackSize: Integer;
  
  vMemoryStream: TMemoryStream;
  I: Integer;
begin
  Result := 0;
  if not Assigned(mStream) then Exit;
  vFileInfo := TStringList.Create;
  vMemoryStream := TMemoryStream.Create;
  mDirectory := ExcludeTrailingPathDelimiter(mDirectory);
  try
    mStream.Position := 0;
    if mStream.Size < SizeOf(vFileHead) then Exit;
    { DONE -oZswang -c添加 : 读取头文件信息 }
    mStream.Read(vFileHead, SizeOf(vFileHead));
    if vFileHead.rIdent <> cIdent then Result := -1;
    if vFileHead.rVersion <> cVersion then Result := -2;
    if Result <> 0 then Exit;

    mStream.Read(vFileInfoSize, SizeOf(vFileInfoSize));
    vMemoryStream.CopyFrom(mStream, vFileInfoSize);
    vMemoryStream.Position := 0;
    vFileInfo.LoadFromStream(vMemoryStream);
    vFileCount := vFileInfo.Count;
    for I := 0 to vFileCount - 1 do
    begin
      vFileName := mDirectory + '\' + StrLeft(vFileInfo[I], '|');
      vPackSize := StrToIntDef(StrRight(vFileInfo[I], '|'), 0);

      vMemoryStream.Clear;
      vMemoryStream.CopyFrom(mStream, vPackSize);
      vMemoryStream.Position := 0;
      vFileSize := FileDecompression(vFileName, vMemoryStream);
      if Assigned(mProgress) then
        if not mProgress(vFileCount, I,
          vPackSize, vFileName, vFileSize, mParam) then Break;
    end;
    Result := vFileInfo.Count;
  finally
    vFileInfo.Free;
    vMemoryStream.Free;
  end;
end; { DirectoryDeompression }
{$ENDIF}

function DirectoryInfo( // 获得目录的大小、文件个数、目录个数
  mDirectory: string; // 目录名
  var nFileSize: Integer; // 总大小
  var nFileCount: Integer; // 文件个数
  var nDirectoryCount: Integer // 目录个数
): Boolean; // 返回目录的大小
var
  vSearchRec: TSearchRec;
  vFileSize: Integer; // 总大小
  vFileCount: Integer; // 文件个数
  vDirectoryCount: Integer; // 目录个数
begin
  Result := False;
  if not DirectoryExists(mDirectory) then Exit; // 目录不存在
  nFileSize := 0; 
  nFileCount := 0;
  nDirectoryCount := 0;
  mDirectory := IncludeTrailingPathDelimiter(mDirectory);
  if FindFirst(mDirectory + '*.*',
    faAnyFile and not faHidden, vSearchRec) = NO_ERROR then
  begin
    repeat
      if vSearchRec.Attr and faDirectory = faDirectory then
      begin
        if Pos('.', vSearchRec.Name) <> 1 then
        begin
          Inc(nDirectoryCount);
          DirectoryInfo(mDirectory + vSearchRec.Name,
            vFileSize, vFileCount, vDirectoryCount);
          Inc(nFileSize, vFileSize);
          Inc(nFileCount, vFileCount);
          Inc(nDirectoryCount, vDirectoryCount);
        end;
      end else
      begin
        Inc(nFileCount);
        Inc(nFileSize, vSearchRec.Size);
      end;
    until FindNext(vSearchRec) <> NO_ERROR;
    FindClose(vSearchRec);
  end;
  Result := True;
end; { DirectoryInfo }

function GetSpecialFolderPath( // 返回获取系统文件或系统目录
  mFolder: Integer // 目录标识 // ShlObj // CSIDL_...
): string; // 返回获取到的目录名
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  SHGetSpecialFolderPath(0, vBuffer, mFolder, True);
  Result := vBuffer;
end; { GetSpecialFolderPath }

function SetDefaultPrinter( // 设置默认打印机
  mPrinterIndex: Integer // 默认打印机序号
): Boolean; // 返回设置是否成功
var
  vDevice: array[0..255] of Char;
  vDriver: array[0..255] of Char;
  vPort: array[0..255] of Char;
  S: string;
  vDeviceMode: THandle;
begin
  Result := False;
  if mPrinterIndex < 0 then Exit;
  if mPrinterIndex >= Printer.Printers.Count then Exit;
  Printer.PrinterIndex := mPrinterIndex;
  Printer.GetPrinter(vDevice, vDriver, vPort, vDeviceMode);
  S := Format('%s,%s,%s', [vDevice, vDriver, vPort]);
  WriteProfileString('Windows', 'Device', PChar(S));
  S := 'Windows';
  SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@S));
end; { SetDefaultPrinter }

function DoubleLineIntersect( // 计算两条线段的交点坐标
  mLine1A, mLine1B: TPoint; // 线段1
  mLine2A, mLine2B: TPoint; // 线段2
  var nPoint: TPoint // 返回交点坐标
): Boolean; // 返回两条直线是否存在交点
var
  D: Double;
begin
  D := (mLine1B.Y - mLine1A.Y) * (mLine2B.X - mLine2A.X) -
    (mLine2B.Y - mLine2A.Y) * (mLine1B.X - mLine1A.X);
  Result := False;
  if D = 0 then Exit;
  nPoint.X := Round((                                                           //2007-08-13 ZswangY37 No.1
    1.0 * (mLine1B.X - mLine1A.X) * (mLine2B.X - mLine2A.X) * (mLine2A.Y - mLine1A.Y) +
    1.0 * (mLine1B.Y - mLine1A.Y) * (mLine2B.X - mLine2A.X) * mLine1A.X -
    1.0 * (mLine2B.Y - mLine2A.Y) * (mLine1B.X - mLine1A.X) * mLine2A.X) / D);
  nPoint.Y := Round((
    1.0 * (mLine1B.Y - mLine1A.Y) * (mLine2B.Y - mLine2A.Y) * (mLine2A.X - mLine1A.X) +
    1.0 * (mLine1B.X - mLine1A.X) * (mLine2B.Y - mLine2A.Y) * mLine1A.Y -
    1.0 * (mLine2B.X - mLine2A.X) * (mLine1B.Y - mLine1A.Y) * mLine2A.Y) / -D);
  Result := // 使用Sign避免整数溢出
    (Sign(nPoint.X - mLine1A.X) * Sign(nPoint.X - mLine1B.X) <= 0) and
    (Sign(nPoint.X - mLine2A.X) * Sign(nPoint.X - mLine2B.X) <= 0) and
    (Sign(nPoint.Y - mLine1A.Y) * Sign(nPoint.Y - mLine1B.Y) <= 0) and
    (Sign(nPoint.Y - mLine2A.Y) * Sign(nPoint.Y - mLine2B.Y) <= 0);
end; { DoubleLineIntersect }

function LineEllipseIntersect( // 计算线段和椭圆的交点
  mLineA, mLineB: TPoint; // 线段
  mEllipse: TRect; // 椭圆
  var nPointA: TPoint; // 返回交点坐标
  var nPointB: TPoint // 返回交点坐标
): Integer; // 返回交点的个数
var
  A, B, C, T1, T2: Double;
  vEllipseO: TPoint;
begin
  Result := 0;
  if (mEllipse.Right = mEllipse.Left) and
    (mEllipse.Bottom = mEllipse.Top) then Exit;
  if mEllipse.Right = mEllipse.Left then
  begin
    if not DoubleLineIntersect(
      Point(mEllipse.Right, mEllipse.Top),
      Point(mEllipse.Right, mEllipse.Bottom),
      mLineA, mLineB, nPointA) then Exit;
    Result := 1;
    nPointB := nPointA;
    Exit;
  end else if mEllipse.Top = mEllipse.Bottom then
  begin
    if not DoubleLineIntersect(
      Point(mEllipse.Left, mEllipse.Bottom),
      Point(mEllipse.Right, mEllipse.Bottom),
      mLineA, mLineB, nPointA) then Exit;
    nPointB := nPointA;
    Result := 1;
    Exit;
  end;
  T1 := Abs(mEllipse.Right - mEllipse.Left) / 2;
  T2 := Abs(mEllipse.Bottom - mEllipse.Top) / 2;
  vEllipseO := CenterPoint(mEllipse);
  A := Sqr(T2) * Sqr((mLineA.x - mLineB.x)) +
    Sqr(T1) * Sqr((mLineA.y - mLineB.y));
  if A <= 0 then Exit;
  B := 2 * Sqr(T2) * (mLineB.x - mLineA.x) * (mLineA.x - vEllipseO.x) +
    2 * Sqr(T1) * (mLineB.y - mLineA.y) * (mLineA.y - vEllipseO.y);
  C := Sqr(T2) * Sqr(mLineA.x - vEllipseO.x) +
    Sqr(T1) * Sqr(mLineA.y - vEllipseO.y) -
    Sqr(T1) * Sqr(T2);
  if Equation12(A, B, C, T1, T2) <= 0 then Exit;
  nPointA.X := Round(mLineA.x + T1 * (mLineB.x - mLineA.x));
  nPointA.Y := Round(mLineA.y + T1 * (mLineB.y - mLineA.y));
  nPointB.X := Round(mLineA.x + T2 * (mLineB.x - mLineA.x));
  nPointB.Y := Round(mLineA.y + T2 * (mLineB.y - mLineA.y));
  Result := 2;
  if not ((Sign(nPointA.X - mLineA.X) * Sign(nPointA.X - mLineB.X) <= 0) and
    (Sign(nPointA.Y - mLineA.Y) * Sign(nPointA.Y - mLineB.Y) <= 0)) then
  begin
    nPointA := nPointB;
    Dec(Result);
  end;
  if not ((Sign(nPointB.X - mLineA.X) * Sign(nPointB.X - mLineB.X) <= 0) and
    (Sign(nPointB.Y - mLineA.Y) * Sign(nPointB.Y - mLineB.Y) <= 0)) then
    Dec(Result);
end; { LineEllipseIntersect }

function AngleInRange( // 判断角度是否在一定范围内
  mAngle: Double; // 测试角度
  mAngleBegin: Double; // 开始角度
  mAngleEnd: Double // 终止角度
): Boolean; // 返回角度是否在一定范围内
begin
  Result := (((mAngle <= mAngleBegin) and (mAngle >= mAngleEnd)) or
    ((mAngle >= mAngleBegin) and (mAngle <= mAngleEnd))) xor
    (mAngleBegin < mAngleEnd);
end; { AngleInRange }

function LineArcIntersect( // 获得线段和椭面的交点
  mLineA, mLineB: TPoint; // 直线
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  var nPointA: TPoint; // 返回交点坐标
  var nPointB: TPoint // 返回交点坐标
): Integer; // 返回交点的个数
var
  vCenter: TPoint; // 圆心坐标
  vAngleA, vAngleB, vAngleC: Double;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := LineEllipseIntersect(mLineA, mLineB, mEllipse, nPointA, nPointB);
  if Result <= 0 then Exit;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;
  ///////Begin 计算两个半径坐标和椭圆的交点
  vAngleA := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  vAngleB := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  ///////End 计算两个半径坐标和椭圆的交点
  vAngleC := PointToAngle(vCenter, nPointA, vLengthX / vLengthY);
  if not AngleInRange(vAngleC, vAngleA, vAngleB) then
  begin
    nPointA := nPointB;
    Dec(Result);
    if Result <= 0 then Exit;
  end else if Result <= 1 then Exit;
  vAngleC := PointToAngle(vCenter, nPointB, vLengthX / vLengthY);
  if not AngleInRange(vAngleC, vAngleA, vAngleB) then
    Dec(Result);
end; { LineArcIntersect }

function LineChordIntersect( // 获得线段和椭面的交点
  mLineA, mLineB: TPoint; // 直线
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  var nPointA: TPoint; // 返回交点坐标
  var nPointB: TPoint // 返回交点坐标
): Integer; // 返回交点的个数
var
  vCenter: TPoint; // 圆心坐标
  vAngle: Double;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := LineArcIntersect(mLineA, mLineB, mEllipse, mRadialBegin,  mRadialEnd,
    nPointA, nPointB);
  if Result >= 2 then Exit;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;
  ///////Begin 计算两个半径坐标和椭圆的交点
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End 计算两个半径坐标和椭圆的交点
  if DoubleLineIntersect(
    mLineA, mLineB, mRadialBegin, mRadialEnd, nPointB) then
  begin
    Inc(Result);
    if Result = 1 then nPointA := nPointB;
  end;
end; { LineChordIntersect }

function PointInRect( // 判断点是否在矩形中
  mPoint: TPoint; // 点坐标
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回点是否在矩形中
var
  A, B, C, D: TPoint;
begin
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    Result := PtInPolygon(mPoint, [A, B, D, C]);
  end else Result := PtInRect(mRect, mPoint);
end; { PtInRect }

function PtInRound( // 判断点坐标是否在圆角矩形中
  mPoint: TPoint; // 坐标
  mRound: TRect; // 矩形
  mRadial: TPoint // 圆角高宽
): Boolean; // 返回点是否在圆角矩形中
begin
  mRound := ReviseRect(mRound);
  Result := PtInRect(mRound, mPoint);
  if not Result or (mRadial.X = 0) or (mRadial.Y = 0) then Exit;
  if mRound.Right - mRound.Left <= mRadial.X then
  begin
    if mRound.Bottom - mRound.Top <= mRadial.Y then
    begin
      Result := PtInEllipse(mPoint, mRound)
    end else
    begin
      Result := PtInRect(Rect(mRound.Left, mRound.Top + mRadial.Y div 2,
        mRound.Right, mRound.Bottom - mRadial.Y div 2), mPoint) or
        PtInEllipse(mPoint, Rect(mRound.Left, mRound.Top,
        mRound.Right, mRound.Top + mRadial.Y)) or
        PtInEllipse(mPoint, Rect(mRound.Left, mRound.Bottom - mRadial.Y,
        mRound.Right, mRound.Bottom));
    end
  end else
  begin
    if mRound.Bottom - mRound.Top <= mRadial.Y then
    begin
      Result := PtInRect(Rect(mRound.Left + mRadial.X div 2, mRound.Top,
        mRound.Right - mRadial.X div 2, mRound.Bottom), mPoint) or
        PtInEllipse(mPoint, Rect(mRound.Left, mRound.Top,
        mRound.Left + mRadial.X, mRound.Bottom)) or
        PtInEllipse(mPoint, Rect(mRound.Right - mRadial.X, mRound.Top,
        mRound.Right, mRound.Bottom));
    end else
    begin
      Result := PtInRect(Rect(mRound.Left + mRadial.X div 2,
        mRound.Top, mRound.Right - mRadial.X div 2, mRound.Bottom), mPoint) or
        PtInRect(Rect(mRound.Left, mRound.Top + mRadial.Y div 2, mRound.Right,
        mRound.Bottom - mRadial.Y div 2), mPoint) or
        PtInEllipse(mPoint, Rect(mRound.Left, mRound.Top,
        mRound.Left + mRadial.X, mRound.Top + mRadial.Y)) or
        PtInEllipse(mPoint, Rect(mRound.Right - mRadial.X, mRound.Top,
        mRound.Right, mRound.Top + mRadial.Y)) or
        PtInEllipse(mPoint, Rect(mRound.Left, mRound.Bottom - mRadial.Y,
        mRound.Left + mRadial.X, mRound.Bottom)) or PtInEllipse(mPoint,
        Rect(mRound.Right - mRadial.X, mRound.Bottom - mRadial.Y,
        mRound.Right, mRound.Bottom));
    end;
  end;
end; { PtInRound }

function RectByRound( // 判断矩形和圆角矩形是否相交
  mRect: TRect; // 矩形
  mRound: TRect; // 圆角矩形
  mRadial: TPoint; // 圆角高宽
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形和圆角矩形是否相交
begin
  Result := RectByRect(mRound, mRect, mCenter, mAngle);
  if not Result or (mRadial.X = 0) or (mRadial.Y = 0) then Exit;
  if mRound.Right - mRound.Left <= mRadial.X then
  begin
    if mRound.Bottom - mRound.Top <= mRadial.Y then
    begin
      Result := RectByEllipse(mRect, mRound, mCenter, mAngle);
    end else
    begin
      Result := RectByRect(Rect(mRound.Left, mRound.Top + mRadial.Y div 2,
        mRound.Right, mRound.Bottom - mRadial.Y div 2), mRect, mCenter, mAngle) or
        RectByEllipse(mRect, Rect(mRound.Left, mRound.Top,
        mRound.Right, mRound.Top + mRadial.Y), mCenter, mAngle) or
        RectByEllipse(mRect, Rect(mRound.Left, mRound.Bottom - mRadial.Y,
        mRound.Right, mRound.Bottom), mCenter, mAngle);
    end
  end else
  begin
    if mRound.Bottom - mRound.Top <= mRadial.Y then
    begin
      Result := RectByRect(Rect(mRound.Left + mRadial.X div 2, mRound.Top,
        mRound.Right - mRadial.X div 2, mRound.Bottom), mRect, mCenter, mAngle) or
        RectByChord(mRect, Rect(mRound.Left, mRound.Top,
        mRound.Left + mRadial.X, mRound.Bottom),
        Point(mRound.Left + mRadial.X div 2, mRound.Top),
        Point(mRound.Left + mRadial.X div 2, mRound.Bottom), mCenter, mAngle) or
        RectByChord(mRect, Rect(mRound.Right - mRadial.X, mRound.Top,
        mRound.Right, mRound.Bottom),
        Point(mRound.Right - mRadial.X div 2, mRound.Bottom),
        Point(mRound.Right - mRadial.X div 2, mRound.Top), mCenter, mAngle);
    end else
    begin
      Result := RectByRect(Rect(mRound.Left + mRadial.X div 2,
        mRound.Top, mRound.Right - mRadial.X div 2, mRound.Bottom),
        mRect, mCenter, mAngle) or
        RectByRect(Rect(mRound.Left, mRound.Top + mRadial.Y div 2, mRound.Right,
        mRound.Bottom - mRadial.Y div 2), mRect, mCenter, mAngle) or
        RectByEllipse(Rect(mRound.Left, mRound.Top,
        mRound.Left + mRadial.X, mRound.Top + mRadial.Y), mRect, mCenter, mAngle) or
        RectByEllipse(Rect(mRound.Right - mRadial.X, mRound.Top,
        mRound.Right, mRound.Top + mRadial.Y), mRect, mCenter, mAngle) or
        RectByEllipse(Rect(mRound.Left, mRound.Bottom - mRadial.Y,
        mRound.Left + mRadial.X, mRound.Bottom), mRect, mCenter, mAngle) or
        RectByEllipse(Rect(mRound.Right - mRadial.X, mRound.Bottom - mRadial.Y,
        mRound.Right, mRound.Bottom), mRect, mCenter, mAngle);
    end;
  end;
end; { RectByRound }

function RectInRound( // 判断矩形是否在圆角矩形中
  mRect: TRect; // 矩形
  mRound: TRect; // 圆角矩形
  mRadial: TPoint; // 圆角高宽
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否在圆角矩形中
var
  A, B, C, D: TPoint;
begin
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    Result :=
      PtInRound(A, mRound, mRadial) and
      PtInRound(B, mRound, mRadial) and
      PtInRound(C, mRound, mRadial) and
      PtInRound(D, mRound, mRadial);
  end else Result :=
    PtInRound(Point(mRect.Left, mRect.Top), mRound, mRadial) and
    PtInRound(Point(mRect.Left, mRect.Bottom), mRound, mRadial) and
    PtInRound(Point(mRect.Right, mRect.Top), mRound, mRadial) and
    PtInRound(Point(mRect.Right, mRect.Bottom), mRound, mRadial);
end; { RectInRound }

function PtInChordLine( // 判断一个点是否在椭面的节点连线上
  mPoint: TPoint; // 已知点
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回一个点是否在椭面的节点连线上
var
  vCenter: TPoint; // 圆心坐标
  vAngle: Double;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := PtInEllipse(mPoint, mEllipse); // 必须先在园中
  if not Result then Exit;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;

  ///////Begin 计算两个半径坐标和椭圆的交点
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End 计算两个半径坐标和椭圆的交点

  Result := PtInLine(mPoint, mRadialBegin, mRadialEnd, mPenWidth);
end;

function PtInChord( // 判断一个点是否在椭面上
  mPoint: TPoint; // 已知点
  mEllipse: TRect; // 椭圆坐标
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint // 结束半径坐标
): Boolean; // 返回点是否在弧线上
var
  vCenter: TPoint; // 圆心坐标
  vAngle: Double;
  vPointA, vPointB, vPointC, vPointD: TPoint;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := PtInEllipse(mPoint, mEllipse); // 必须先在园中
  if not Result then Exit;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;

  ///////Begin 计算两个半径坐标和椭圆的交点
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End 计算两个半径坐标和椭圆的交点

  ///////Begin 根据半径与椭圆的交点，得到足够大的矩形区域
  vLengthX := Max(vLengthX, vLengthY) * 2;
  vAngle := PointToAngle(mRadialBegin, mRadialEnd);
  vPointA.X := mRadialBegin.X + Trunc(Cos(vAngle) * vLengthX);
  vPointA.Y := mRadialBegin.Y + Trunc(Sin(vAngle) * vLengthX);
  vAngle := vAngle + 0.5 * Pi;
  vPointC.X := vPointA.X + Trunc(Cos(vAngle) * vLengthX);
  vPointC.Y := vPointA.Y + Trunc(Sin(vAngle) * vLengthX);

  vAngle := PointToAngle(mRadialEnd, mRadialBegin);
  vPointB.X := mRadialEnd.X + Trunc(Cos(vAngle) * vLengthX);
  vPointB.Y := mRadialEnd.Y + Trunc(Sin(vAngle) * vLengthX);
  vAngle := vAngle - 0.5 * Pi;
  vPointD.X := vPointB.X + Trunc(Cos(vAngle) * vLengthX);
  vPointD.Y := vPointB.Y + Trunc(Sin(vAngle) * vLengthX);
  ///////End 根据半径与椭圆的交点，得到足够大的矩形区域

  Result := PtInPolygon(mPoint, [vPointA, vPointB, vPointD, vPointC]); // 判断该点是否在此矩形中
end; { PtInChord }

function PtInPolygon( // 判断点是否在多边形上
  mPoint: TPoint; // 点
  mPoints: array of TPoint // 多边形坐标
): Boolean; // 返回点是否在多边形上
var
  I, J: integer;
begin
  Result := False;
  for I := Low(mPoints) to High(mPoints) do
  begin
    if I = High(mPoints) then J := Low(mPoints) else J := Succ(I);
    if ((((mPoint.Y >= mPoints[I].Y) and (mPoint.Y < mPoints[J].Y)) or
      ((mPoint.Y >= mPoints[J].Y) and (mPoint.Y < mPoints[I].Y))) and
      (mPoint.X < (mPoints[J].X - mPoints[I].X) * (mPoint.Y - mPoints[I].Y) /
      (mPoints[J].Y - mPoints[I].Y) + mPoints[I].X)) then Result := not Result;
  end;
end; { PtInPolygon }

function RectInPolygon( // 判断矩形是否在多边形中
  mRect: TRect; // 矩形
  mPoints: array of TPoint; // 多边形坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否在多边形中
var
  A, B, C, D: TPoint;
begin
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    Result := PtInPolygon(A, mPoints) and PtInPolygon(B, mPoints) and
      PtInPolygon(C, mPoints) and PtInPolygon(D, mPoints);
  end else Result :=
    PtInPolygon(Point(mRect.Left, mRect.Top), mPoints) and
    PtInPolygon(Point(mRect.Left, mRect.Bottom), mPoints) and
    PtInPolygon(Point(mRect.Right, mRect.Top), mPoints) and
    PtInPolygon(Point(mRect.Right, mRect.Bottom), mPoints);
end; { RectInPolygon }

function BezierPoints( // 获得贝塞尔坐标点
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // 贝塞尔曲线坐标
  var mPoints: array of TPoint // 返回计算的坐标
): Boolean; // 返回计算是否成功
var
  AX, BX, CX: Double;
  AY, BY, CY: Double;
  vSquared, vCubed: Double;
  T: Double;
  I: Integer;
begin
  Result := False;
  if Length(mPoints) <= 0 then Exit;
  (* 计算多项式系数 *)
  CX := 3.0 * (mStartHelper.X - mStart.X);
  BX := 3.0 * (mEndHelper.X - mStartHelper.X) - CX;
  AX := mEnd.x - mStart.X - CX - BX;

  CY := 3.0 * (mStartHelper.Y - mStart.y);
  BY := 3.0 * (mEndHelper.Y - mStartHelper.y) - CY;
  AY := mEnd.Y - mStart.Y - CY - BY;

  (* 计算位于参数值 t 的曲线点 *)
  for I := 0 to Length(mPoints) - 1 do
  begin
    T := I / Length(mPoints);
    vSquared := T * T;
    vCubed := vSquared * T;
    mPoints[I].X := Round((AX * vCubed) + (BX * vSquared) + CX * T + mStart.X);
    mPoints[I].Y := Round((AY * vCubed) + (BY * vSquared) + CY * T + mStart.Y);
  end;
  Result := True;
end; { BezierPoints }

function PtInBezier( // 判断点是否在贝塞尔曲线上
  mPoint: TPoint; // 点坐标
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // 贝塞尔曲线坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回点是否在贝塞尔曲线上
const
  cPoints = 256;
var
  AX, BX, CX: Double;
  AY, BY, CY: Double;
  vSquared, vCubed: Double;
  vPoint1, vPoint2: TPoint;
  T: Double;
  I: Integer;
begin
  Result := True;
  (* 计算多项式系数 *)
  CX := 3.0 * (mStartHelper.X - mStart.X);
  BX := 3.0 * (mEndHelper.X - mStartHelper.X) - CX;
  AX := mEnd.x - mStart.X - CX - BX;

  CY := 3.0 * (mStartHelper.Y - mStart.y);
  BY := 3.0 * (mEndHelper.Y - mStartHelper.y) - CY;
  AY := mEnd.Y - mStart.Y - CY - BY;
  vPoint1 := mStart;
  (* 计算位于参数值 t 的曲线点 *)
  for I := 1 to cPoints do
  begin
    T := I / cPoints;
    vSquared := T * T;
    vCubed := vSquared * T;
    vPoint2.X := Round((AX * vCubed) + (BX * vSquared) + CX * T + mStart.X);
    vPoint2.Y := Round((AY * vCubed) + (BY * vSquared) + CY * T + mStart.Y);
    if PtInLine(mPoint, vPoint1, vPoint2, mPenWidth) then Exit;
    vPoint1 := vPoint2;
  end;
  Result := False;
end; { PtInBezier }

function PtInHollowPolygon( // 判断点是否在空心多边形上
  mPoint: TPoint; // 点坐标
  mPoints: array of TPoint; // 折线坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回点是否在空心多边形上
var
  I, J: Integer;
begin
  Result := True;
  for I := Low(mPoints) to High(mPoints) do
  begin
    if I = Low(mPoints) then J := High(mPoints) else J := Pred(I);
    if PtInLine(mPoint, mPoints[J], mPoints[I], mPenWidth) then Exit;
  end;
  Result := False;
end; { PtInHollowPolygon }

function PtInPolyline( // 判断点是否在折线上
  mPoint: TPoint; // 点坐标
  mPoints: array of TPoint; // 折线坐标
  mPenWidth: Integer // 线条宽度
): Boolean; // 返回点是否在折线上
var
  I: Integer;
begin
  Result := True;
  for I := Low(mPoints) + 1 to High(mPoints) do
    if PtInLine(mPoint, mPoints[I - 1], mPoints[I], mPenWidth) then Exit;
  Result := False;
end; { PtInPolyline }

function RectByBezier( // 判断矩形是否和贝塞尔曲线相交
  mRect: TRect; // 矩形
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // 贝塞尔曲线坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和贝塞尔曲线相交
const
  cPoints = 256;
var
  I: Integer;
  vPoint: TPoint;
  A, B, C, D: TPoint;
  AX, BX, CX: Double;
  AY, BY, CY: Double;
  vSquared, vCubed: Double;
  vPoint1, vPoint2: TPoint;
  T: Double;
begin
  Result := True;
  if PointInRect(mStart, mRect, mCenter, mAngle) then Exit; // 当前点在矩形中
  if PointInRect(mEnd, mRect, mCenter, mAngle) then Exit; // 当前点在矩形中
  
  (* 计算多项式系数 *)
  CX := 3.0 * (mStartHelper.X - mStart.X);
  BX := 3.0 * (mEndHelper.X - mStartHelper.X) - CX;
  AX := mEnd.x - mStart.X - CX - BX;

  CY := 3.0 * (mStartHelper.Y - mStart.y);
  BY := 3.0 * (mEndHelper.Y - mStartHelper.y) - CY;
  AY := mEnd.Y - mStart.Y - CY - BY;
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    vPoint1 := mStart;
    for I := 1 to cPoints do
    begin
      T := I / cPoints;
      vSquared := T * T;
      vCubed := vSquared * T;
      vPoint2.X := Round((AX * vCubed) + (BX * vSquared) + CX * T + mStart.X);
      vPoint2.Y := Round((AY * vCubed) + (BY * vSquared) + CY * T + mStart.Y);
      if PointInRect(vPoint2, mRect, mCenter, mAngle) then Exit; // 当前点在矩形中
      ///////Begin 多边形某边和矩形边相交
      if DoubleLineIntersect(A, B, vPoint1, vPoint2, vPoint) then Exit; // TOP
      if DoubleLineIntersect(B, D, vPoint1, vPoint2, vPoint) then Exit; // LEFT
      if DoubleLineIntersect(C, D, vPoint1, vPoint2, vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(A, C, vPoint1, vPoint2, vPoint) then Exit; // RIGHT
      ///////End 多边形某边和矩形边相交
      vPoint1 := vPoint2;
    end;
  end else
  begin
    vPoint1 := mStart;
    for I := 1 to cPoints do
    begin
      T := I / cPoints;
      vSquared := T * T;
      vCubed := vSquared * T;
      vPoint2.X := Round((AX * vCubed) + (BX * vSquared) + CX * T + mStart.X);
      vPoint2.Y := Round((AY * vCubed) + (BY * vSquared) + CY * T + mStart.Y);
      if PtInRect(mRect, vPoint2) then Exit; // 当前点在矩形中

      ///////Begin 多边形某边和矩形边相交
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Right, mRect.Top), vPoint1, vPoint2, vPoint) then Exit; // TOP
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Left, mRect.Bottom), vPoint1, vPoint2, vPoint) then Exit; // LEFT
      if DoubleLineIntersect(Point(mRect.Left, mRect.Bottom),
        Point(mRect.Right, mRect.Bottom), vPoint1, vPoint2, vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(Point(mRect.Right, mRect.Top),
        Point(mRect.Right, mRect.Bottom), vPoint1, vPoint2, vPoint) then Exit; // RIGHT
      ///////End 多边形某边和矩形边相交
      vPoint1 := vPoint2;
    end;
  end;
  Result := False;
end; { RectByBezier } 

function RectByPolyline( // 判断矩形是否和折线相交
  mRect: TRect; // 矩形
  mPoints: array of TPoint; // 多边形坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和折线相交
var
  I: Integer;
  vPoint: TPoint;
  A, B, C, D: TPoint;
begin
  Result := True;
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    if PointInRect(mPoints[Low(mPoints)], mRect, mCenter, mAngle) then Exit; // 当前点在矩形中
    for I := Low(mPoints) + 1 to High(mPoints) do
    begin
      if PointInRect(mPoints[I], mRect, mCenter, mAngle) then                   //2007-08-21 ZswangY37 No.1
        Exit; // 当前点在矩形中

      ///////Begin 多边形某边和矩形边相交
      if DoubleLineIntersect(A, B, mPoints[I], mPoints[I - 1], vPoint) then Exit; // TOP
      if DoubleLineIntersect(B, D, mPoints[I], mPoints[I - 1], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(C, D, mPoints[I], mPoints[I - 1], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(A, C, mPoints[I], mPoints[I - 1], vPoint) then Exit; // RIGHT
      ///////End 多边形某边和矩形边相交
    end;
  end else
  begin
      if PtInRect(mRect, mPoints[Low(mPoints)]) then Exit; // 当前点在矩形中
    for I := Low(mPoints) + 1 to High(mPoints) do
    begin
      if PtInRect(mRect, mPoints[I]) then Exit; // 当前点在矩形中

      ///////Begin 多边形某边和矩形边相交
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Right, mRect.Top), mPoints[I], mPoints[I - 1], vPoint) then Exit; // TOP
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Left, mRect.Bottom), mPoints[I], mPoints[I - 1], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(Point(mRect.Left, mRect.Bottom),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[I - 1], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(Point(mRect.Right, mRect.Top),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[I - 1], vPoint) then Exit; // RIGHT
      ///////End 多边形某边和矩形边相交
    end;
  end;
  Result := False;
end; { RectByPolyline } 

function RectByPolygon( // 判断矩形是否和多边形相交
  mRect: TRect; // 矩形
  mPoints: array of TPoint; // 多边形坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回判断矩形是否和多边形相交
var
  I, J: Integer;
  vPoint: TPoint;
  A, B, C, D: TPoint;
begin
  Result := True;
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);

    for I := Low(mPoints) to High(mPoints) do
    begin
      if PointInRect(mPoints[I], mRect, mCenter, mAngle) then                   //2007-08-21 ZswangY37 No.1
        Exit; // 当前点在矩形中

      if I = High(mPoints) then J := Low(mPoints) else J := Succ(I);
      ///////Begin 多边形某边和矩形边相交
      if DoubleLineIntersect(A, B, mPoints[I], mPoints[J], vPoint) then Exit; // TOP
      if DoubleLineIntersect(B, D, mPoints[I], mPoints[J], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(C, D, mPoints[I], mPoints[J], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(A, C, mPoints[I], mPoints[J], vPoint) then Exit; // RIGHT
      ///////End 多边形某边和矩形边相交
    end;
  end else
  begin
    for I := Low(mPoints) to High(mPoints) do
    begin
      if PtInRect(mRect, mPoints[I]) then Exit; // 当前点在矩形中
      if I = High(mPoints) then J := Low(mPoints) else J := Succ(I);
      ///////Begin 多边形某边和矩形边相交
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Right, mRect.Top), mPoints[I], mPoints[J], vPoint) then Exit; // TOP
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Left, mRect.Bottom), mPoints[I], mPoints[J], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(Point(mRect.Left, mRect.Bottom),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[J], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(Point(mRect.Right, mRect.Top),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[J], vPoint) then Exit; // RIGHT
      ///////End 多边形某边和矩形边相交
    end;
  end;
  Result := False;
end; { RectByPolygon }

function Angle8Index( // 得到坐标偏向的八个方位的序号
  mOrigin: TPoint; // 原点
  mAngle: Double // 角度
): Integer; // 八个方位序号
begin
  Result := -1;
  while mAngle < 0 do mAngle := mAngle + 2 * PI;
  while mAngle > 2 * PI do mAngle := mAngle - 2 * PI;
  if (mAngle < ((1 / 8) * Pi)) or (mAngle >= (15 / 8) * Pi) then
    Result := 0
  else if (mAngle < ((3 / 8) * Pi)) and (mAngle >= (1 / 8) * Pi) then
    Result := 1
  else if (mAngle < ((5 / 8) * Pi)) and (mAngle >= (3 / 8) * Pi) then
    Result := 2
  else if (mAngle < ((7 / 8) * Pi)) and (mAngle >= (5 / 8) * Pi) then
    Result := 3
  else if (mAngle < ((9 / 8) * Pi)) and (mAngle >= (7 / 8) * Pi) then
    Result := 4
  else if (mAngle < ((11 / 8) * Pi)) and (mAngle >= (9 / 8) * Pi) then
    Result := 5
  else if (mAngle < ((13 / 8) * Pi)) and (mAngle >= (11 / 8) * Pi) then
    Result := 6
  else if (mAngle < ((15 / 8) * Pi)) and (mAngle >= (13 / 8) * Pi) then
    Result := 7;
end; { Angle8Index }

function Angle8Point( // 得到坐标偏向的八个方位的坐标
  mOrigin: TPoint; // 原点
  mPoint: TPoint // 坐标点
): TPoint; // 八个方位坐标
var
  vAngle: Double;
  vLength: Double;
begin
  vAngle := PointToAngle(mOrigin, mPoint);
  if (vAngle < ((1 / 8) * Pi)) or (vAngle >= (15 / 8) * Pi) then
    vAngle := 0
  else if (vAngle < ((3 / 8) * Pi)) and (vAngle >= (1 / 8) * Pi) then
    vAngle := (2 / 8) * Pi
  else if (vAngle < ((5 / 8) * Pi)) and (vAngle >= (3 / 8) * Pi) then
    vAngle := (4 / 8) * Pi
  else if (vAngle < ((7 / 8) * Pi)) and (vAngle >= (5 / 8) * Pi) then
    vAngle := (6 / 8) * Pi
  else if (vAngle < ((9 / 8) * Pi)) and (vAngle >= (7 / 8) * Pi) then
    vAngle := (8 / 8) * Pi
  else if (vAngle < ((11 / 8) * Pi)) and (vAngle >= (9 / 8) * Pi) then
    vAngle := (10 / 8) * Pi
  else if (vAngle < ((13 / 8) * Pi)) and (vAngle >= (11 / 8) * Pi) then
    vAngle := (12 / 8) * Pi
  else if (vAngle < ((15 / 8) * Pi)) and (vAngle >= (13 / 8) * Pi) then
    vAngle := (14 / 8) * Pi;
  vLength := PointToPoint(mOrigin,  mPoint);
  Result.X := mOrigin.X + Trunc(Cos(vAngle) * vLength);
  Result.Y := mOrigin.Y + Trunc(Sin(vAngle) * vLength);
end; { Angle8Point }

function RectInRect( // 判断矩形A是否在矩形B中
  mRectA, mRectB: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形A是否在矩形B中
var
  A, B, C, D: TPoint;
begin
  mRectA := ReviseRect(mRectA);
  mRectB := ReviseRect(mRectB);
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRectB.Left, mRectB.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRectB.Left, mRectB.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRectB.Right, mRectB.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRectB.Right, mRectB.Bottom), mCenter^, mAngle);
    Result := RectInPolygon(mRectA, [A, B, D, C]);
  end else Result := (mRectA.Left >= mRectB.Left) and (mRectA.Top >= mRectB.Top) and
    (mRectA.Right <= mRectB.Right) and (mRectA.Bottom <= mRectB.Bottom);
end; { RectInRect }

function RectByRect( // 判断矩形A是否和矩形B相交
  mRectA, mRectB: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形A是否在矩形B中
var
  A, B, C, D: TPoint;
begin
  mRectA := ReviseRect(mRectA);
  mRectB := ReviseRect(mRectB);
  if Assigned(mCenter) then
  begin
    Result := True;
    A := RotatePoint(Point(mRectB.Left, mRectB.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRectB.Left, mRectB.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRectB.Right, mRectB.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRectB.Right, mRectB.Bottom), mCenter^, mAngle);
    if RectByPolygon(mRectA, [A, B, D, C]) then Exit;
    if RectInPolygon(mRectA, [A, B, D, C]) then Exit;
    Result := False;
  end else Result := IntersectRect(mRectA, mRectA, mRectB);
end; { RectByRect }

function LineByRect( // 判断直线是否和矩形相交
  mLineA, mLineB: TPoint; //直线
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 判断直线是否和矩形相交
var
  A, B, C, D: TPoint;
  vPoint: TPoint;
begin
  Result := True;
  mRect := ReviseRect(mRect);
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    if PtInPolygon(mLineA, [A, B, D, C]) then Exit;
    if PtInPolygon(mLineB, [A, B, D, C]) then Exit;
    if DoubleLineIntersect(A, B, mLineA, mLineB, vPoint) then Exit; // TOP
    if DoubleLineIntersect(B, D, mLineA, mLineB, vPoint) then Exit; // LEFT
    if DoubleLineIntersect(D, C, mLineA, mLineB, vPoint) then Exit; // BOTTOM
    if DoubleLineIntersect(A, C, mLineA, mLineB, vPoint) then Exit; // RIGHT
  end else
  begin
    if PtInRect(mRect, mLineA) then Exit;
    if PtInRect(mRect, mLineB) then Exit;
    if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Right, mRect.Top), mLineA, mLineB, vPoint) then Exit; // TOP
    if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Left, mRect.Bottom), mLineA, mLineB, vPoint) then Exit; // LEFT
    if DoubleLineIntersect(Point(mRect.Left, mRect.Bottom),
      Point(mRect.Right, mRect.Bottom), mLineA, mLineB, vPoint) then Exit; // BOTTOM
    if DoubleLineIntersect(Point(mRect.Right, mRect.Top),
      Point(mRect.Right, mRect.Bottom), mLineA, mLineB, vPoint) then Exit; // RIGHT
  end;
  Result := False;
end; { LineByRect }

function RectInEllipse( // 判断矩形在椭圆中
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形在椭圆中
var
  A, B, C, D: TPoint;
begin
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    Result :=
      PtInEllipse(A, mEllipse) and PtInEllipse(B, mEllipse) and
      PtInEllipse(C, mEllipse) and PtInEllipse(D, mEllipse);
  end else Result :=
    PtInEllipse(Point(mRect.Left, mRect.Top), mEllipse) and
    PtInEllipse(Point(mRect.Left, mRect.Bottom), mEllipse) and
    PtInEllipse(Point(mRect.Right, mRect.Top), mEllipse) and
    PtInEllipse(Point(mRect.Right, mRect.Bottom), mEllipse);
end; { RectInEllipse }

function EllipseInRect( // 判断一个椭圆是否在矩形中
  mEllipse: TRect; // 椭圆
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回一个椭圆是否在矩形中
var
  A, B, C, D: TPoint;
  vOrigin: TPoint;
  vPointA, vPointB: TPoint;
begin
  if Assigned(mCenter) then
  begin
    Result := False;
    vOrigin := CenterPoint(mEllipse); // 圆心
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    if not PtInPolygon(vOrigin, [A, B, D, C]) then Exit; // 圆心不在矩形中
    ///////Begin 有一点在圆形中
    if PtInEllipse(A, mEllipse) then Exit;
    if PtInEllipse(B, mEllipse) then Exit;
    if PtInEllipse(C, mEllipse) then Exit;
    if PtInEllipse(D, mEllipse) then Exit;
    ///////End 有一点在圆形中
    ///////Begin 矩形四边和椭圆相交
    if LineEllipseIntersect(A, B, mEllipse, vPointA, vPointB) > 0 then Exit; // TOP
    if LineEllipseIntersect(B, D, mEllipse, vPointA, vPointB) > 0 then Exit; // LEFT
    if LineEllipseIntersect(C, D, mEllipse, vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineEllipseIntersect(A, C, mEllipse, vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End 矩形四边和椭圆相交
    Result := True;
  end else Result := RectInRect(mEllipse, mRect, mCenter, mAngle);
end; { EllipseInRect }

function RectByEllipse( // 判断矩形是否和椭圆相交
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和椭圆相交
var
  vPointA, vPointB: TPoint;
  A, B, C, D: TPoint;
begin
  Result := True;
  mRect := ReviseRect(mRect);
  mEllipse := ReviseRect(mEllipse);
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    ///////Begin 矩形四边和椭圆相交
    if LineEllipseIntersect(A, B, mEllipse, vPointA, vPointB) > 0 then Exit; // TOP
    if LineEllipseIntersect(B, D, mEllipse, vPointA, vPointB) > 0 then Exit; // LEFT
    if LineEllipseIntersect(C, D, mEllipse, vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineEllipseIntersect(A, C, mEllipse, vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End 矩形四边和椭圆相交
  end else
  begin
    ///////Begin 矩形四边和椭圆相交
    if LineEllipseIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Right, mRect.Top), mEllipse, vPointA, vPointB) > 0 then Exit; // TOP
    if LineEllipseIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Left, mRect.Bottom), mEllipse, vPointA, vPointB) > 0 then Exit; // LEFT
    if LineEllipseIntersect(Point(mRect.Left, mRect.Bottom),
      Point(mRect.Right, mRect.Bottom), mEllipse, vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineEllipseIntersect(Point(mRect.Right, mRect.Top),
      Point(mRect.Right, mRect.Bottom), mEllipse, vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End 矩形四边和椭圆相交
  end;
  Result := False;
end; { RectByEllipse }

function RectInChord( // 判断矩形是否在椭面上
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否在椭面上
var
  A, B, C, D: TPoint;
begin
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    Result :=
      PtInChord(A, mEllipse, mRadialBegin, mRadialEnd) and
      PtInChord(B, mEllipse, mRadialBegin, mRadialEnd) and
      PtInChord(C, mEllipse, mRadialBegin, mRadialEnd) and
      PtInChord(D, mEllipse, mRadialBegin, mRadialEnd);
  end else Result :=
    PtInChord(Point(mRect.Left, mRect.Top), mEllipse, mRadialBegin, mRadialEnd) and
    PtInChord(Point(mRect.Right, mRect.Top), mEllipse, mRadialBegin, mRadialEnd) and
    PtInChord(Point(mRect.Right, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd) and
    PtInChord(Point(mRect.Left, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd);
end; { RectInChord }

function ChordInRect( // 判断椭面是否在矩形中
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mRect: TRect; // 矩形
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回椭面是否在矩形中
var
  vCenter: TPoint; // 圆心坐标
  vAngle: Double;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := False;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;
  ///////Begin 计算两个半径坐标和椭圆的交点
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End 计算两个半径坐标和椭圆的交点
  Result := PointInRect(mRadialBegin, mRect, mCenter, mAngle) and
    PointInRect(mRadialEnd, mRect, mCenter, mAngle);
end; { ChordInRect }

function RectByChord( // 判断矩形是否和椭圆面相交
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形和椭圆面相交
var
  vPointA, vPointB: TPoint;
  A, B, C, D: TPoint;
begin
  Result := RectByRect(mEllipse, mRect, mCenter, mAngle);
  if not Result then Exit;
  if EllipseInRect(mEllipse, mRect) then Exit; // 椭圆在矩形中
  mRect := ReviseRect(mRect);
  mEllipse := ReviseRect(mEllipse);
  
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    ///////Begin 矩形顶点在椭圆中
    if PtInChord(A, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(B, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(C, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(D, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    ///////End 矩形顶点在椭圆中

    ///////Begin 矩形四边和椭圆相交
    if LineChordIntersect(A, B, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // TOP
    if LineChordIntersect(B, D, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // LEFT
    if LineChordIntersect(C, D, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineChordIntersect(A, C, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End 矩形四边和椭圆相交
  end else
  begin
    ///////Begin 矩形顶点在椭圆中
    if PtInChord(Point(mRect.Left, mRect.Top), mEllipse,
      mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(Point(mRect.Left, mRect.Bottom),
      mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(Point(mRect.Right, mRect.Top),
      mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(Point(mRect.Right, mRect.Bottom),
      mEllipse, mRadialBegin, mRadialEnd) then Exit;
    ///////End 矩形顶点在椭圆中

    ///////Begin 矩形四边和椭圆相交
    if LineChordIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Right, mRect.Top), mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // TOP
    if LineChordIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Left, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // LEFT
    if LineChordIntersect(Point(mRect.Left, mRect.Bottom),
      Point(mRect.Right, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineChordIntersect(Point(mRect.Right, mRect.Top),
      Point(mRect.Right, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End 矩形四边和椭圆相交
  end;
  Result := False;
end; { RectByChord }

function RectByArc( // 判断矩形是否和椭曲线相交
  mRect: TRect; // 矩形
  mEllipse: TRect; // 椭圆
  mRadialBegin: TPoint; // 开始半径坐标
  mRadialEnd: TPoint; // 结束半径坐标
  mCenter: PPoint = nil; // 中心坐标
  mAngle: Double = 0 // 旋转坐标
): Boolean; // 返回矩形是否和椭曲线相交
var
  vPointA, vPointB: TPoint;
begin
  Result := RectByRect(mRect, mEllipse);
  if not Result then Exit;
  if RectInRect(mEllipse, mRect) then Exit; // 椭圆在矩形中
  mRect := ReviseRect(mRect);
  mEllipse := ReviseRect(mEllipse);

  ///////Begin 矩形四边和椭圆相交
  if LineArcIntersect(Point(mRect.Left, mRect.Top),
    Point(mRect.Right, mRect.Top), mEllipse, mRadialBegin, mRadialEnd,
    vPointA, vPointB) > 0 then Exit; // TOP
  if LineArcIntersect(Point(mRect.Left, mRect.Top),
    Point(mRect.Left, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd,
    vPointA, vPointB) > 0 then Exit; // LEFT
  if LineArcIntersect(Point(mRect.Left, mRect.Bottom),
    Point(mRect.Right, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd,
    vPointA, vPointB) > 0 then Exit; // BOTTOM
  if LineArcIntersect(Point(mRect.Right, mRect.Top),
    Point(mRect.Right, mRect.Bottom), mEllipse, mRadialBegin, mRadialEnd,
    vPointA, vPointB) > 0 then Exit; // RIGHT
  ///////End 矩形四边和椭圆相交
  Result := False;
end; { RectByArc }

function RotatePoint( // 旋转一个点坐标
  mPoint: TPoint; // 原始点
  mCenter: TPoint; // 中心点坐标
  mAngle: Double // 旋转角度
): TPoint; // 返回旋转后的点坐标
var
  vRadius: Double;
begin
  vRadius := PointToPoint(mCenter, mPoint);
  mAngle := PointToAngle(mCenter, mPoint) + mAngle;
  Result.X := Round(mCenter.X + Cos(mAngle) * vRadius);
  Result.Y := Round(mCenter.Y + Sin(mAngle) * vRadius);
end; { RotatePoint }

function PointToAngle( // 计算坐标的角度
  mOrigin: TPoint; // 原坐标
  mPoint: TPoint; // 计算坐标
  mEccentricity: Double = 1 // 离心率 a/ b
): Double; // 返回该坐标相对原坐标的角度 // Pi为单位
begin
  if mPoint.X = mOrigin.X then
    if mPoint.Y > mOrigin.Y then
      Result := Pi * 0.5
    else Result := Pi * 1.5
  else if mPoint.Y = mOrigin.Y then
    if mPoint.X > mOrigin.X then
      Result := 0
    else Result := Pi
  else
  begin
    Result := ArcTan((mOrigin.Y - mPoint.Y) / (mOrigin.X - mPoint.X) * mEccentricity);
    if (mPoint.X < mOrigin.X) and (mPoint.Y > mOrigin.Y) then
      Result := Result + Pi
    else if (mPoint.X < mOrigin.X) and (mPoint.Y < mOrigin.Y) then
      Result := Result + Pi
    else if (mPoint.X > mOrigin.X) and (mPoint.Y < mOrigin.Y) then
      Result := Result + 2 * Pi;
  end;
end; { PointToAngle }

function PointToPoint( // 计算点到点的距离
  mPointA, mPointB: TPoint // 两个点的坐标
): Double; // 返回点与点间的距离
begin
  Result := Sqrt(Sqr(mPointA.X - mPointB.X) + Sqr(mPointA.Y - mPointB.Y));
end; { PointDistance }

function PointToLine( // 计算点到直线的距离
  mPoint: TPoint; // 点的坐标
  mLineA, mLineB: TPoint // 线段的坐标
): Double; // 返回点到直线的距离
var
  T, X, Y: Double;
begin
  Result := 0;
  if (mLineA.X = mLineB.X) and (mLineA.Y = mLineB.Y) then Exit;
  T := ((mLineA.X - mLineB.X) * (mLineA.X - mPoint.X) +
    (mLineA.Y - mLineB.Y) * (mLineA.Y - mPoint.Y)) /
    ((mLineA.X - mLineB.X) * (mLineA.X - mLineB.X) +
    (mLineA.Y - mLineB.Y) * (mLineA.Y - mLineB.Y));
  if T > 1 then
    T := 1.0
  else if T < 0 then T := 0.0;
  X := mLineA.X + T * (mLineB.X - mLineA.X);
  Y := mLineA.Y + T * (mLineB.Y - mLineA.Y);
  Result := Sqrt((X - mPoint.X) * (X - mPoint.X) +
    (Y - mPoint.Y) * (Y - mPoint.Y));
end; { PointToLine }

function PtInLine( // 判断点是否在一个线段中
  mPoint: TPoint; // 点的坐标
  mLineA, mLineB: TPoint; // 线段坐标
  mPenWidth: Integer // 线条粗细
): Boolean; // 返回点是否在线段中
var
  vRect: TRect;
begin
  Result := False;
  vRect.TopLeft := mLineA;
  vRect.BottomRight := mLineB;
  vRect := ZoomRect(ReviseRect(vRect), mPenWidth div 2);
  if not PtInRect(vRect, mPoint) then Exit;
  Result := PointToLine(mPoint, mLineA, mLineB) <= mPenWidth div 2;
end; { PtInLine }

function PtInEllipse( // 判断点是否在椭圆中
  mPoint: TPoint; // 点的坐标
  mEllipse: TRect // 椭圆坐标
): Boolean; // 返回点是否在椭圆中
var
  A, B, C, D: Double;
begin
  Result := False;
  if mEllipse.Left = mEllipse.Right then Exit;
  if mEllipse.Top = mEllipse.Bottom then Exit;
  A := Sqr((mEllipse.Left - mEllipse.Right) / 2);
  B := Sqr((mEllipse.Top - mEllipse.Bottom) / 2);
  C := (mEllipse.Left + mEllipse.Right) / 2;
  D := (mEllipse.Top + mEllipse.Bottom) / 2;
  Result := Sqr(mPoint.X - C) / A + Sqr(mPoint.Y - D) / B <= 1;
end; { PtInEllipse }

function Equation12( //解一元二次方程
  A, B, C: Double; //A * Sqr(X) + B * X + C = 0
  var nReturnA, nReturnB: Double // 返回X的两个值
): Integer; // 返回得到X的个数 //0表示没有结果
var
  vDelta: Double;
begin
  Result := 0;
  if A <> 0 then
  begin
    vDelta := Sqr(B) - 4 * A * C;
    if vDelta = 0 then // 两个相等的根
    begin
      nReturnA := -1 * B / (2 * A);
      nReturnB := nReturnA;
      Result := 1;
    end else if vDelta > 0 then //两个不相等的根
    begin
      nReturnA := (-1 * B + Sqrt(vDelta)) / (2 * A);
      nReturnB := (-1 * B - Sqrt(vDelta)) / (2 * A);
      Result := 2;
    end;
  end;
end; { Equation12 }

function InitXFrom( // 旋转画布
  mCenter: TPoint; // 中心坐标
  mAngle: Double // 旋转角度
): TXForm; // 返回上一次的数值
begin
  Result.eM11 := Cos(mAngle);
  Result.eM12 := Sin(mAngle);
  Result.eM21 := -Result.eM12;
  Result.eM22 := Result.eM11;
  Result.eDx := mCenter.X;
  Result.eDy := mCenter.Y;
end; { InitXFrom }

function MovePoint( // 偏移一个点
  mPoint: TPoint; // 点坐标
  DX, DY: Integer // 偏移的位置
): TPoint; // 返回偏移的点位置
begin
  Result.X := mPoint.X + DX;
  Result.Y := mPoint.Y + DY;
end; { MovePoint }

function ReviseRect( // 修正矩形
  mRect: TRect // 矩形参数
): TRect; // 返回修正后的矩形
begin
  Result.Left := Min(mRect.Left, mRect.Right);
  Result.Right := Max(mRect.Left, mRect.Right);
  Result.Top := Min(mRect.Top, mRect.Bottom);
  Result.Bottom := Max(mRect.Top, mRect.Bottom);
end; { ReviseRect }

function SetToStr( // 集合类型转换为字符串
  mTypeInfo: Pointer; // 集合类型信息指针
  mValue: Integer; // 集合数值
  mBrackets: Boolean = False // 是否加上括号
): string; // 返回转换后的字符串
var
  vPropInfo: TPropInfo;
  vTypeInfo: PTypeInfo;
begin
  vTypeInfo := mTypeInfo;
  vPropInfo.PropType := @vTypeInfo; // 构造PropInfo结构
  Result := SetToString(@vPropInfo, mValue, mBrackets)
end; { SetToStr }

function StrToSet( // 字符串转化为集合
  mTypeInfo: Pointer; // 集合类新信息指针
  mValue: string // 集合字符表达式
): Integer; // 返回集合数值
var
  vPropInfo: TPropInfo;
  vTypeInfo: PTypeInfo;
begin
  vTypeInfo := mTypeInfo;
  vPropInfo.PropType := @vTypeInfo; // 构造PropInfo结构
  Result := StringToSet(@vPropInfo, mValue)
end; { StringToSet }

function AddrToNumber( //Ip地址转换为数值
  mAddr: string // Ip地址字符串 x.x.x.x
): Integer; // 返回Ip地址的数值
begin
  Result := 0;
  mAddr := mAddr + '.';
  Result := Result or (StrToIntDef(StrLeft(mAddr, '.'), 0) shl 24);
  mAddr := StrRight(mAddr, '.');
  Result := Result or (StrToIntDef(StrLeft(mAddr, '.'), 0) shl 16);
  mAddr := StrRight(mAddr, '.');
  Result := Result or (StrToIntDef(StrLeft(mAddr, '.'), 0) shl 8);
  mAddr := StrRight(mAddr, '.');
  Result := Result or (StrToIntDef(StrLeft(mAddr, '.'), 0) shl 0);
end; { AddrToNumber }

function ForceForegroundWindow( // 将窗体设置为最前端,并获得焦点
  mHandle: THandle // 窗体句柄
): Boolean; // 返回设置是否成功
var
  vHandle: THandle;
  vResult: Longword;
begin
  if IsIconic(mHandle) then
    SendMessageTimeOut(mHandle, WM_SYSCOMMAND, SC_RESTORE, 0, SMTO_NORMAL,
      1000, vResult)
  else                                                                          //2006-10-13 ZswangY37 No.1
  begin
    vHandle := GetWindow(mHandle, GW_OWNER);
    if IsIconic(vHandle) then
      SendMessageTimeOut(vHandle, WM_SYSCOMMAND, SC_RESTORE, 0, SMTO_NORMAL,
        1000, vResult);
  end;
  vHandle := GetForegroundWindow;
  AttachThreadInput(GetWindowThreadProcessId(vHandle, nil),
    GetCurrentThreadId, True);
  Result := SetForegroundWindow(mHandle);
  AttachThreadInput(GetWindowThreadProcessId(vHandle, nil),
    GetCurrentThreadId, False);
end; { ForceForegroundWindow }

function ProcessExists( // 判断进程是否存在
  mProcessID: THandle // 进程ID
): Boolean; // 返回进程是否存在
var
  vSnapshot: THandle;
  vProcessEntry32: TProcessEntry32;
begin
  Result := False;
  vSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  vProcessEntry32.dwSize := SizeOf(TProcessEntry32);
  if Process32First(vSnapshot, vProcessEntry32) then
    repeat
      if vProcessEntry32.th32ProcessID = mProcessID then
      begin
        Result := True;
        Break;
      end;
    until not Process32Next(vSnapshot, vProcessEntry32);
  CloseHandle(vSnapshot);
end; { ProcessExists }

function ProcessPrivilege( // 设置进程的权限
  mProcess: THandle; // 进程句柄
  mPrivilegeName: string; // 权限名称
  mEnabled: Boolean // 是否激活
): Boolean; // 返回设置是否成功
var
  vTokenPrivileges: TTokenPrivileges;
  vDummy: THandle;
  vToken: THandle;
begin
  OpenProcessToken(mProcess, TOKEN_ADJUST_PRIVILEGES, vToken);
  try
    vTokenPrivileges.PrivilegeCount := 1;
    LookupPrivilegeValue(nil, PChar(mPrivilegeName),
      vTokenPrivileges.Privileges[0].Luid);
    vTokenPrivileges.Privileges[0].Attributes :=
      SE_PRIVILEGE_ENABLED * Ord(mEnabled);
    Result := AdjustTokenPrivileges(vToken, False, vTokenPrivileges,
      SizeOf(vTokenPrivileges), nil, vDummy);
  finally
    CloseHandle(vToken);
  end;
end; { ProcessPrivilege }

function ProcessFileName( // 获取进程的文件名
  mProcessID: THandle // 进程ID
): string; // 返回进程的文件名
var
  vSnapshot: THandle;
  vProcessEntry32: TProcessEntry32;
  vProcess: THandle;
  vBuffer: array[0..MAX_PATH] of Char;
  L: Integer;
begin
  vSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  vProcessEntry32.dwSize := SizeOf(TProcessEntry32);
  if Process32First(vSnapshot, vProcessEntry32) then
    repeat
      if vProcessEntry32.th32ProcessID = mProcessID then
      begin
        vProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,
          False, vProcessEntry32.th32ProcessID);
        try
          L := GetModuleFileNameEx(vProcess, 0, vBuffer, SizeOf(vBuffer));
          if L = 0 then
            Result := vProcessEntry32.szExeFile
          else Result := vBuffer;
        finally
          CloseHandle(vProcess);
        end;
      end;
    until not Process32Next(vSnapshot, vProcessEntry32);
  CloseHandle(vSnapshot);
  Result := StringReplace(Result, '\??\', '', [rfReplaceAll]);                  //2006-12-26 ZswangY37 No.1
end; { ProcessFileName }

function ParentPath( // 取得上级路径
  mPath: string // 源路经
): string; // 返回上级路径
begin
  Result := ExtractFilePath(ExcludeTrailingPathDelimiter(mPath));
end; { ParentPath }

function ZoomRect( // 缩放区域
  mRect: TRect; // 区域
  mZoom: Integer // 缩放的大小
): TRect; overload; // 返回缩放后的区域
begin
  Result.Left := mRect.Left - mZoom;
  Result.Right := mRect.Right + mZoom;
  Result.Top := mRect.Top - mZoom;
  Result.Bottom := mRect.Bottom + mZoom;
end; { ZoomRect }

function ZoomRect( // 缩放区域
  mRect: TRect; // 区域
  mZoom: TPoint // 缩放的大小
): TRect; overload; // 返回缩放后的区域
begin
  Result := mRect;
  InflateRect(Result, mZoom.X, mZoom.Y);
end; { ZoomRect }

function MoveRect( // 移动区域
  mRect: TRect; // 区域
  mOffset: TPoint // 偏移
): TRect; // 返回移动后的区域
begin
  Result := mRect;
  Types.OffsetRect(Result, mOffset.X, mOffset.Y);
end; { MoveRect }

function ReverseFile( // 颠倒文件的内容
  mFileName: string // 文件名
): Boolean; // 返回颠文件是否成功
var
  vFileHandle: THandle;
  vMappingHandle: THandle;
  vOFStruct: TOFStruct;
  vSize: Longword;
  vHead, vLeft, vRight: PChar;
  C: Char;
  I: Integer;
begin
  Result := False;
  if not FileExists(mFileName) then Exit;
  vFileHandle := OpenFile(PChar(mFileName), vOFStruct, OF_READWRITE);
  vSize := GetFileSize(vFileHandle, nil);
  if vFileHandle = 0 then Exit;
  try
    vMappingHandle := CreateFileMapping(
      vFileHandle, nil, PAGE_READWRITE, 0, 0, '~ReverseFile');
    if vMappingHandle = 0 then Exit;
    try
      vHead := MapViewOfFile(vMappingHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      if not Assigned(vHead) then Exit;
      vLeft := vHead;
      vRight := vHead;
      Inc(vRight, vSize - 1);
      try
        for I := 1 to vSize div 2 do
        begin
          C := vRight^;
          vRight^ := vLeft^;
          vLeft^ := C;
          Inc(vLeft);
          Dec(vRight);
        end;
      finally
        UnmapViewOfFile(vHead);
      end;
    finally
      CloseHandle(vMappingHandle);
    end;
  finally
    CloseHandle(vFileHandle);
  end;
  Result := True;
end; { ReverseFile }

function ResourceExists( // 资源是否存在
  mInstance: THandle; // 实例句柄
  mResName: string; // 资源名
  mResType: PChar // 资源类名
): Boolean; // 返回资源是否存在
begin
  Result := FindResource(mInstance, PChar(mResName), mResType) <> 0;
end; { ResourceExists }

function SendPlaySound( // 播放声音
  mFileName: string;  // 声音文件名
  mAlias: string = 'MM' // 别名
): Boolean; // 返回播放是否成功
begin
 Result := False;
 if not FileExists(mFileName) then Exit;
 try
   mciSendString(PChar(Format('close %s', [mAlias])), nil, 0, 0);
   mciSendString(
     PChar(Format('open "%s" alias %s', [mFileName, mAlias])), nil, 0, 0);
   mciSendString(PChar(Format('play %s', [mAlias])), nil, 0, 0);
 except
 end;
 Result := True;
end; { SendPlaySound }

function SignNumber( // 带符号的数字
  mNumber: Integer // 源数字
): string; // 返回带符号的数字字符串
begin
  Result := Copy('+', 1, Ord(mNumber > 0)) + IntToStr(mNumber);
end; { SignNumber }

function IsFocusd( // 判断窗体是否具有焦点
  mHandle: THandle // 窗体句柄
): Boolean; // 返回窗体是否具有焦点
var
  vHandle: THandle;
begin
  vHandle := GetFocus;
  while (mHandle <> vHandle) and (vHandle <> 0) do
    vHandle := GetParent(vHandle);
  Result := mHandle = vHandle;
end; { IsFocusd }

function Stream_Read( // 流读取
  mStream: TStream; // 目标流
  mBaseAddress: Integer; // 基地址
  mLength: Integer // 长度
): string;  // 读成字符串返回
begin
  Result := '';
  if not Assigned(mStream) then Exit;
  if mLength <= 0 then Exit;
  mStream.Position := mBaseAddress;
  SetLength(Result, mLength);
  SetLength(Result, mStream.Read(Result[1], mLength));
end; { Stream_Read }

function Stream_Write( // 流写入
  mStream: TStream; // 目标流
  mBaseAddress: Integer; // 基地址
  mStr: string // 数据
): Boolean; // 返回写入是否成功
begin
  Result := False;
  if not Assigned(mStream) then Exit;
  if mStr = '' then Exit;
  mStream.Position := mBaseAddress;
  mStream.Write(mStr[1], Length(mStr));
  Result := True;
end; { Stream_Write }

function Stream_Insert( // 流插入
  mStream: TStream; // 流
  mIndex: Integer; // 起始位置
  const mBuffer; // 插入的数据
  mLength: Integer // 数据的长度
): Boolean; // 返回插入是否成功
var
  vBuffer: array[0..$1000-1] of Char;
  I, L: Integer;
begin
  Result := False;
  if not Assigned(mStream) then Exit;
  if mLength <= 0 then Exit;
  if mIndex >= mStream.Size then Exit;
  if mIndex < 0 then Exit;
  I := mStream.Size;
  mStream.Size := mStream.Size + mLength;
  repeat
    if mIndex + mLength <= I - SizeOf(vBuffer) then
      L := SizeOf(vBuffer)
    else L := I - mIndex;
    mStream.Position := I - L;
    mStream.Read(vBuffer, L);
    mStream.Position := I - L + mLength;
    mStream.Write(vBuffer, L);
    I := I - L + mLength;
  until L < SizeOf(vBuffer);
  mStream.Position := mIndex;
  mStream.Write(mBuffer, mLength);
end; { Stream_Insert }

function Stream_Delete( // 删除流的部分
  mStream: TStream; // 流
  mIndex: Integer; // 起始位置
  mLength: Integer // 数据的长度
): Boolean; // 返回删除是否成功
var
  vBuffer: array[0..$1000-1] of Char;
  I, L: Integer;
begin
  Result := False;
  if not Assigned(mStream) then Exit;
  if mLength <= 0 then Exit;
  if mIndex >= mStream.Size then Exit;
  if mIndex < 0 then Exit;
  if mIndex + mLength >= mStream.Size then
    mStream.Size := mIndex
  else
  begin
    I := mIndex;
    repeat
      mStream.Position := I + mLength;
      L := mStream.Read(vBuffer, SizeOf(vBuffer));
      mStream.Position := I;
      mStream.Write(vBuffer, L);
      Inc(I, L);
    until L < SizeOf(vBuffer);
    mStream.Size := mStream.Size - mLength;
  end;
  Result := True;
end; { Stream_Delete }

function File_Read( // 文件读取
  mFileName: string; // 文件名
  mBaseAddress: Integer; // 基地址
  mLength: Integer // 长度
): string; // 返回读取到的数据
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
begin
  Result := '';
  if not FileExists(mFileName) then Exit;
  vFileHandle := _lopen(PChar(mFileName), OF_READ or OF_SHARE_DENY_NONE);       //2006-09-25 ZswangY37 No.1 
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  try
    Result := Stream_Read(vFileStream, mBaseAddress, mLength);
  finally
    vFileStream.Free;
  end;
end; { File_Read }

function File_Write( // 文件写入
  mFileName: string; // 文件名
  mBaseAddress: Integer; // 基地址
  mStr: string // 数据
): Boolean; // 返回写入是否成功
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
begin
  Result := False;
  if not FileExists(mFileName) then Exit;
  vFileHandle := _lopen(PChar(mFileName), OF_READWRITE or OF_SHARE_DENY_NONE);  //2006-09-25 ZswangY37 No.1 
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  try
    Result := Stream_Write(vFileStream, mBaseAddress, mStr);
  finally
    vFileStream.Free;
  end;
end; { File_Write }

function File_SearchMark( // 在文件中搜索特征码
  mFileName: string; // 文件名
  mMark: string; // 特征码
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回特征码在进程中的地址
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
begin
  Result := -1;
  if not FileExists(mFileName) then Exit;
  vFileHandle := _lopen(PChar(mFileName), OF_READ or OF_SHARE_DENY_NONE);       //2006-09-25 ZswangY37 No.1 
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  try
    Result := Stream_SearchMark(vFileStream, mMark,
      mStartAddress, mEndAddress, mIgnoreCase);
  finally
    vFileStream.Free;
  end;
end; { File_SearchMark }

function Stream_SearchMark( // 在流中搜索特征码
  mStream: TStream; // 目标流
  mMark: string; // 特征码
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回特征码在进程中的地址
var
  S: string;
  T: string;
  I: Integer;
  J: Integer;
  L: Integer;
begin
  Result := -1;
  if not Assigned(mStream) then Exit;
  if mMark = '' then Exit;
  mMark := StringReplace(mMark, #32, '', [rfReplaceAll]);
  if mIgnoreCase then mMark := UpperMark(mMark);
  L := Length(mMark) div 2;
  mStream.Position := mStartAddress;
  T := '';
  J := mStartAddress;
  while mStream.Position <= mEndAddress do
  begin
    SetLength(S, cBufferSize);
    I := mStream.Read(S[1], cBufferSize);
    SetLength(S, I);
    if S = '' then Exit;
    if mIgnoreCase then S := UpperCase(S);
    Result := MarkPosition(T + S, mMark) - 1;
    if Result >= 0 then
    begin
      Result := Result + J - Length(T);
      Exit;
    end;
    T := Copy(S, cBufferSize - L, MaxInt);
    Inc(J, I);
  end;
end; { Stream_SearchMark }

function File_SearchString( // 在文件中搜索字符串
  mFileName: string; // 文件名
  mStr: string; // 字符串
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回字符串所在的位置
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
begin
  Result := -1;
  if not FileExists(mFileName) then Exit;
  vFileHandle := _lopen(PChar(mFileName), OF_READ or OF_SHARE_DENY_NONE);       //2006-09-25 ZswangY37 No.1 
  if Integer(vFileHandle) <= 0 then Exit;
  vFileStream := TFileStream.Create(vFileHandle);
  try
    Result := Stream_SearchString(vFileStream, mStr,
      mStartAddress, mEndAddress, mIgnoreCase);
  finally
    vFileStream.Free;
  end;
end; { File_SearchString }

function Stream_SearchString( // 在流中搜索字符串
  mStream: TStream; // 目标流
  mStr: string; // 字符串
  mStartAddress: Integer = 0; // 起始地址
  mEndAddress: Integer = MaxInt; // 终止地址
  mIgnoreCase: Boolean = False // 是否忽略大小写
): Integer; // 返回字符串所在的位置
var
  S: string;
  T: string;
  I: Integer;
  J: Integer;
  L: Integer;
begin
  Result := -1;
  if not Assigned(mStream) then Exit;
  if mStr = '' then Exit;
  L := Length(mStr);
  mStream.Position := mStartAddress;
  if mIgnoreCase then mStr := UpperCase(mStr);
  T := '';
  J := mStartAddress;
  while mStream.Position <= mEndAddress do
  begin
    SetLength(S, cBufferSize);
    I := mStream.Read(S[1], cBufferSize);
    SetLength(S, I);
    if S = '' then Exit;
    if mIgnoreCase then S := UpperCase(S);
    Result := Pos(mStr, T + S) - 1;
    if Result >= 0 then
    begin
      Result := Result + J - Length(T);
      Exit;
    end;
    T := Copy(S, cBufferSize - L, MaxInt);
    Inc(J, I);
  end;
end; { Stream_SearchString }

function CompareStream( // 比较两个流是否相等
  mStream1, mStream2: TStream // 两个流
): Boolean; // 返回两个流是否相等
var
  vBuffer1, vBuffer2: array[0..$1000 - 1] of Char;
  vLength1, vLength2: Integer;
begin
  Result := mStream1 = mStream2;
  if Result then Exit;
  if not Assigned(mStream1) or not Assigned(mStream2) then Exit; // 其中一个为空
  while True do
  begin
    vLength1 := mStream1.Read(vBuffer1, SizeOf(vBuffer1));
    vLength2 := mStream2.Read(vBuffer2, SizeOf(vBuffer2));
    if vLength1 <> vLength2 then Exit;
    if vLength1 = 0 then Break;
    if not CompareMem(@vBuffer1[0], @vBuffer2[0], vLength1) then Exit;
  end;
  Result := True;
end; { CompareStream }

function CompareFile( // 比较两个文件是否相等
  mFileName1, mFileName2: string // 两个文件
): Boolean; // 返回两个文件是否相等
var
  vFileHandle1, vFileHandle2: THandle;
  vFileStream1, vFileStream2: TFileStream;

  vShortPath1, vShortPath2: array[0..MAX_PATH] of Char;
begin
  Result := False;
  if not FileExists(mFileName1) or not FileExists(mFileName2) then Exit;
  GetShortPathName(PChar(mFileName1), vShortPath1, SizeOf(vShortPath1));
  GetShortPathName(PChar(mFileName2), vShortPath2, SizeOf(vShortPath2));
  Result := SameText(vShortPath1, vShortPath2);
  if Result then Exit;
  vFileHandle1 := _lopen(PChar(mFileName1), OF_READ or OF_SHARE_DENY_NONE);
  if Integer(vFileHandle1) <= 0 then Exit;
  vFileHandle2 := _lopen(PChar(mFileName2), OF_READ or OF_SHARE_DENY_NONE);
  if Integer(vFileHandle2) <= 0 then
  begin
    _lclose(vFileHandle1);
    Exit;
  end;
  vFileStream1 := TFileStream.Create(vFileHandle1);
  vFileStream2 := TFileStream.Create(vFileHandle2);
  try
    Result := CompareStream(vFileStream1, vFileStream2);
  finally
    vFileStream1.Free;
    vFileStream2.Free;
  end;
end; { CompareFile }

function Iif( // 条件取值
  mBool: Boolean; // 是否取第一个值
  mDataA, mDataB: Variant // 列出两个值
): Variant; overload; // 如果mBool为True返回mDataA，否则返回mDataB
begin
  if mBool then
    Result := mDataA
  else Result := mDataB;
end; { Iif }

function Iif( // 条件取值
  mBool: Boolean; // 列出两个值
  mDataA, mDataB: TObject // 列出两个值
): TObject; overload; // 如果mBool为True返回mDataA，否则返回mDataB
begin
  if mBool then
    Result := mDataA
  else Result := mDataB;
end; { Iif }

function ExePath: string; // 返回当前应用程序的路径
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end; { ExePath }

function SysPath: string; // 返回系统所在的路径
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetSystemDirectory(vBuffer, MAX_PATH);
  Result := IncludeTrailingPathDelimiter(vBuffer);
end; { SysPath }

function TempPath: string; // 返回临时路径
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, vBuffer);
  Result := IncludeTrailingPathDelimiter(vBuffer);
end; { TempPath }

function WinPath: string; // 返回Windows所在的路径
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetWindowsDirectory(vBuffer, MAX_PATH);
  Result := IncludeTrailingPathDelimiter(vBuffer);
end; { WinPath }

function GetFileVersionInfomation( // 读取文件的版本信息
  mFileName: string; // 目标文件名
  var nFileVersionInfomation: TFileVersionInfomation; // 文件信息结构
  mDefineName: string = '' // 自定义字段名
): Boolean; // 返回是否读取成功
var
  vHandle: Cardinal;
  vInfoSize: Cardinal;
  vVersionInfo: Pointer;
  vTranslation: Pointer;
  vVersionValue: string;
  vInfoPointer: Pointer;
begin
  Result := False;
  vInfoSize := GetFileVersionInfoSize(PChar(mFileName), vHandle); // 取得文件版本信息空间及资源句柄
  FillChar(nFileVersionInfomation, SizeOf(nFileVersionInfomation), 0); // 初始化返回信息
  if vInfoSize <= 0 then Exit; // 安全检查

  GetMem(vVersionInfo, vInfoSize); // 分配资源
  with nFileVersionInfomation do try
    if not GetFileVersionInfo(PChar(mFileName),
      vHandle, vInfoSize, vVersionInfo) then Exit;
    CloseHandle(vHandle);
    VerQueryValue(vVersionInfo, '\VarFileInfo\Translation',
      vTranslation, vInfoSize);
    if not Assigned(vTranslation) then Exit;
    vVersionValue := Format('\StringFileInfo\%.4x%.4x\',
      [LOWORD(Longint(vTranslation^)), HIWORD(Longint(vTranslation^))]);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'CompanyName'),
      vInfoPointer, vInfoSize);
    rCommpanyName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'FileDescription'),
      vInfoPointer, vInfoSize);
    rFileDescription := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'FileVersion'),
      vInfoPointer, vInfoSize);
    rFileVersion := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'InternalName'),
      vInfoPointer, vInfoSize);
    rInternalName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'LegalCopyright'),
      vInfoPointer, vInfoSize);
    rLegalCopyright := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'LegalTrademarks'),
      vInfoPointer, vInfoSize);
    rLegalTrademarks := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'OriginalFileName'),
      vInfoPointer, vInfoSize);
    rOriginalFileName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'ProductName'),
      vInfoPointer, vInfoSize);
    rProductName := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'ProductVersion'),
      vInfoPointer, vInfoSize);
    rProductVersion := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, PChar(vVersionValue + 'Comments'),
      vInfoPointer, vInfoSize);
    rComments := PChar(vInfoPointer);
    VerQueryValue(vVersionInfo, '\', vInfoPointer, vInfoSize);
    rVsFixedFileInfo := TVSFixedFileInfo(vInfoPointer^);
    if mDefineName <> '' then begin
      VerQueryValue(vVersionInfo, PChar(vVersionValue + mDefineName),
        vInfoPointer, vInfoSize);
      rDefineValue := PChar(vInfoPointer);
    end else rDefineValue := '';
  finally
    FreeMem(vVersionInfo, vInfoSize);
  end;
  Result := True;
end; { GetFileVersionInfomation }

{$IFDEF DEF_VERSIONINFO}
var
  vBuffer: array[0..MAX_PATH] of Char;

initialization
  GetModuleFileName(HInstance, vBuffer, SizeOf(vBuffer)); // 读取模块所在文件
  GetFileVersionInfomation(vBuffer, vModuleVersionInfomation); // 读取模块版本信息

finalization
{$ENDIF}

end.
