(*//
��Ŀ:LovelyComponents.CommonFunctions
�汾:5.01
����:ͨ�õ�Ԫ
˵��:����ͨ�ú��������ǲ���׼ȷ����ĺ���
����:2004-06-16
֧��:jihu.wang#gmail.com
���:ZswangY37
//*)

//*******Begin �޸���־*******//
//----------------------------------------------------------------------5.01.001
//2006-08-10 ZswangY37 No.1 ���� unit CommonFunctions50->unit CommonFunctions51
//2006-08-10 ZswangY37 No.2 ��� Stream_Insert(),Stream_Delete()����ɾ���Ͳ���
//----------------------------------------------------------------------5.01.002
//2006-08-19 ZswangY37 No.1 ��� ReverseFile()�����ڴ澵���ļ������ٵߵ��ļ�
//----------------------------------------------------------------------5.01.003
//2006-08-21 ZswangY37 No.1 ��� ZoomRect(),function MoveRect()��������ź��ƶ�
//----------------------------------------------------------------------5.01.004
//2006-09-05 ZswangY37 No.1 ��� ParentPath()ȡ���ϼ�·���ĺ���
//----------------------------------------------------------------------5.01.005
//2006-09-23 ZswangY37 No.1 ��� ProcessFileName()ȡ�ý��̵��ļ���
//2006-09-23 ZswangY37 No.2 ��� ProcessPrivilege()���ý��̵�Ȩ��
//2006-09-23 ZswangY37 No.3 ��� ProcessExists() �жϽ����Ƿ����
//----------------------------------------------------------------------5.01.006
//2006-09-25 ZswangY37 No.1 �޸� �ж��ļ�����ռ���������������쳣
//----------------------------------------------------------------------5.01.007
//2006-10-13 ZswangY37 No.1 ���� �жϴ����Ƿ���С��
//----------------------------------------------------------------------5.01.008
//2006-12-26 ZswangY37 No.1 ���� �����ļ�·���г���"\??\"�����
//----------------------------------------------------------------------5.01.009
//2007-01-28 ZswangY37 No.1 ��� SetDefaultPrinter()����Ĭ�ϴ�ӡ��
//----------------------------------------------------------------------5.01.010
//2007-02-01 ZswangY37 No.1 ��� GetSpecialFolderPath()���ϵͳ·���ĺ���
//----------------------------------------------------------------------5.01.011
//2007-02-03 ZswangY37 No.1 ��� DirectorySize()���Ŀ¼��С�ĺ���
//----------------------------------------------------------------------5.01.011
//2007-03-02 ZswangY37 No.1 ��� TrackerWindow()��������
//2007-04-02 ZswangY37 No.1 ��� ������洢�ĺ���
//----------------------------------------------------------------------5.01.012
//2007-05-07 ZswangY37 No.1 ��� ControlFromPoint()����
//2007-06-29 ZswangY37 No.1 ��� CompareStream()��CompareFile()�Ƚ������ļ��ĺ���
//2007-07-18 ZswangY37 No.1 ��� SymmetryColor()����ȡ�öԳ�ɫ
//2007-07-26 ZswangY37 No.1 ���� DeletePath()������ɾ�������ļ�
//2007-08-01 ZswangY37 No.1 ��� DoubleLineIntersect()�������ֱ�ߵĽ��㺯��
//2007-08-02 ZswangY37 No.1 ��� LineEllipseIntersect()���ֱ�ߺ���Բ�Ľ��㺯��
//2007-08-02 ZswangY37 No.2 ��� LineArcIntersect()���ֱ�ߺ������ߵĽ��㺯��
//2007-08-02 ZswangY37 No.3 ��� LineChordIntersect()���ֱ�ߺ�������Ľ��㺯��
//2007-08-02 ZswangY37 No.4 ��� AngleInRange()�жϽǶ��Ƿ���һ����Χ�ĺ���
//2007-08-13 ZswangY37 No.1 ���� ����̫���������������쳣
//2007-08-17 ZswangY37 No.1 ��� PtByRound()�ж������Ƿ���Բ�Ǿ�����
//2007-08-17 ZswangY37 No.2 ��� RectInRound()�жϾ����Ƿ���Բ�Ǿ�����
//2007-08-17 ZswangY37 No.3 ��� RectByRound()�жϾ����Ƿ��Բ�Ǿ����ཻ
//2007-08-21 ZswangY37 No.1 ���� �ж϶���εĶ˵��Ƿ��ھ�����ʱ��û�д�����ת
//2007-08-22 ZswangY37 No.1 ��� PtInBezier()��RectByBezier()������������
//*******End �޸���־*******//

{$DEFINE Unit_CommonFunctions51}
{$WARN SYMBOL_PLATFORM OFF}

unit CommonFunctions51;

interface

uses Windows, Messages, SysUtils, Classes, Forms, ShellAPI, Controls, Graphics;

type
  TFileVersionInfomation = record // �ļ��汾��Ϣ
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

{ �����Ű���ֵ }
  VK_SEMICOLON = 186; // ";"�ֺ�
  VK_EQUAL = 187; // "="�Ⱥ�
  VK_COMMA = 188; // ","����
  VK_MINUS = 189; // "-"����
  VK_PERIOD = 190; // "."���
  VK_SLASH = 191; // "/" б��
  VK_BACKQUOTE = 192; // "`" ���˷�
  VK_LEFTBRACKET = 219; // "[" ������
  VK_BACKSLASH = 220; // "\" ��б��
  VK_RIGHTBRACKET = 221; //"]" ������
  VK_QUOTE = 222; // "'" ����
     
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

function GetFileVersionInfomation( // ��ȡ�ļ��İ汾��Ϣ
  mFileName: string; // Ŀ���ļ���
  var nFileVersionInfomation: TFileVersionInfomation; // �ļ���Ϣ�ṹ
  mDefineName: string = '' // �Զ����ֶ���
): Boolean; // �����Ƿ��ȡ�ɹ�

function Iif( // ����ȡֵ
  mBool: Boolean; // �Ƿ�ȡ��һ��ֵ
  mDataA, mDataB: Variant // �г�����ֵ
): Variant; overload; // ���mBoolΪTrue����mDataA�����򷵻�mDataB
function Iif( // ����ȡֵ
  mBool: Boolean; // �г�����ֵ
  mDataA, mDataB: TObject // �г�����ֵ
): TObject; overload; // ���mBoolΪTrue����mDataA�����򷵻�mDataB

function ExePath: string; // ���ص�ǰӦ�ó����·��
function SysPath: string; // ����ϵͳ���ڵ�·��
function TempPath: string; // ������ʱ·��
function WinPath: string; // ����Windows���ڵ�·��

function File_SearchString( // ���ļ��������ַ���
  mFileName: string; // �ļ���
  mStr: string; // �ַ���
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����ַ������ڵ�λ��

function File_SearchMark( // ���ļ�������������
  mFileName: string; // �ļ���
  mMark: string; // ������
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����������ڽ����еĵ�ַ

function Stream_SearchString( // �����������ַ���
  mStream: TStream; // Ŀ����
  mStr: string; // �ַ���
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����ַ������ڵ�λ��

function Stream_Read( // ����ȡ
  mStream: TStream; // Ŀ����
  mBaseAddress: Integer; // ����ַ
  mLength: Integer // ����
): string;  // �����ַ�������

function Stream_Write( // ��д��
  mStream: TStream; // Ŀ����
  mBaseAddress: Integer; // ����ַ
  mStr: string // ����
): Boolean; // ����д���Ƿ�ɹ�

function Stream_Insert( // ������
  mStream: TStream; // ��
  mIndex: Integer; // ��ʼλ��
  const mBuffer; // ���������
  mLength: Integer // ���ݵĳ���
): Boolean; // ���ز����Ƿ�ɹ�

function Stream_Delete( // ɾ�����Ĳ���
  mStream: TStream; // ��
  mIndex: Integer; // ��ʼλ��
  mLength: Integer // ���ݵĳ���
): Boolean; // ����ɾ���Ƿ�ɹ�

function Stream_SearchMark( // ����������������
  mStream: TStream; // Ŀ����
  mMark: string; // ������
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����������ڽ����еĵ�ַ

function File_Read( // �ļ���ȡ
  mFileName: string; // �ļ���
  mBaseAddress: Integer; // ����ַ
  mLength: Integer // ����
): string; // ���ض�ȡ��������

function File_Write( // �ļ�д��
  mFileName: string; // �ļ���
  mBaseAddress: Integer; // ����ַ
  mStr: string // ����
): Boolean; // ����д���Ƿ�ɹ�

function CompareStream( // �Ƚ��������Ƿ����
  mStream1, mStream2: TStream // ������
): Boolean; // �����������Ƿ����

function CompareFile( // �Ƚ������ļ��Ƿ����
  mFileName1, mFileName2: string // �����ļ�
): Boolean; // ���������ļ��Ƿ����

function IsFocusd( // �жϴ����Ƿ���н���
  mHandle: THandle // ������
): Boolean; // ���ش����Ƿ���н���

function SignNumber( // �����ŵ�����
  mNumber: Integer // Դ����
): string; // ���ش����ŵ������ַ���

function SendPlaySound( // ��������
  mFileName: string;  // �����ļ���
  mAlias: string = 'MM' // ����
): Boolean; // ���ز����Ƿ�ɹ�

function ResourceExists( // ��Դ�Ƿ����
  mInstance: THandle; // ʵ�����
  mResName: string; // ��Դ��
  mResType: PChar // ��Դ����
): Boolean; // ������Դ�Ƿ����

function ReverseFile( // �ߵ��ļ�������
  mFileName: string // �ļ���
): Boolean; // ���ص��ļ��Ƿ�ɹ�

function ZoomRect( // ��������
  mRect: TRect; // ����
  mZoom: Integer // ���ŵĴ�С
): TRect; overload; // �������ź������

function ZoomRect( // ��������
  mRect: TRect; // ����
  mZoom: TPoint // ���ŵĴ�С
): TRect; overload; // �������ź������

function MoveRect( // �ƶ�����
  mRect: TRect; // ����
  mOffset: TPoint // ƫ��
): TRect; // �����ƶ��������

function ParentPath( // ȡ���ϼ�·��
  mPath: string // Դ·��
): string; // �����ϼ�·��

function ProcessFileName( // ��ȡ���̵��ļ���
  mProcessID: THandle // ����ID
): string; // ���ؽ��̵��ļ���

function ProcessPrivilege( // ���ý��̵�Ȩ��
  mProcess: THandle; // ���̾��
  mPrivilegeName: string; // Ȩ������
  mEnabled: Boolean // �Ƿ񼤻�
): Boolean; // ���������Ƿ�ɹ�

function ProcessExists( // �жϽ����Ƿ����
  mProcessID: THandle // ����ID
): Boolean; // ���ؽ����Ƿ����

function ForceForegroundWindow( // ����������Ϊ��ǰ��,����ý���
  mHandle: THandle // ������
): Boolean; // ���������Ƿ�ɹ�

const
  OPF_PRINTERNAME = $01; // ��ӡ��
  OPF_PATHNAME    = $02; // ·��

{$WARNINGS OFF}
function SHObjectProperties(
  Owner: HWND; // ���õĴ�����
  Flags: UINT; // �����Ķ�������
  ObjectName: PWideChar; // ��������
  InitialTabName: PWideChar // ��ʼҲ����
): LongBool; stdcall; external shell32 Index 178;
{$WARNINGS ON}

function AddrToNumber( //Ip��ַת��Ϊ��ֵ
  mAddr: string // Ip��ַ�ַ��� x.x.x.x
): Integer; // ����Ip��ַ����ֵ

function SetToStr( // ��������ת��Ϊ�ַ���
  mTypeInfo: Pointer; // ����������Ϣָ��
  mValue: Integer; // ������ֵ
  mBrackets: Boolean = False // �Ƿ��������
): string; // ����ת������ַ���

function StrToSet( // �ַ���ת��Ϊ����
  mTypeInfo: Pointer; // ����������Ϣָ��
  mValue: string // �����ַ����ʽ
): Integer; // ���ؼ�����ֵ

function ReviseRect( // ��������
  mRect: TRect // ���β���
): TRect; // ����������ľ���

function PointToPoint( // ����㵽��ľ���
  mPointA, mPointB: TPoint // �����������
): Double; // ���ص�����ľ���

function PointToLine( // ����㵽ֱ�ߵľ���
  mPoint: TPoint; // �������
  mLineA, mLineB: TPoint // �߶ε�����
): Double; // ���ص㵽ֱ�ߵľ���

function PtInLine( // �жϵ��Ƿ���һ���߶���
  mPoint: TPoint; // �������
  mLineA, mLineB: TPoint; // �߶�����
  mPenWidth: Integer // ������ϸ
): Boolean; // ���ص��Ƿ����߶���

function PtInEllipse( // �жϵ��Ƿ�����Բ��
  mPoint: TPoint; // �������
  mEllipse: TRect // ��Բ����
): Boolean; // ���ص��Ƿ�����Բ��

function Equation12( //��һԪ���η���
  A, B, C: Double; //A * Sqr(X) + B * X + C = 0
  var nReturnA, nReturnB: Double // ����X������ֵ
): Integer; // ���صõ�X�ĸ��� //0��ʾû�н��

function InitXFrom( // ��ת����
  mCenter: TPoint; // ��������
  mAngle: Double // ��ת�Ƕ�
): TXForm; // ������һ�ε���ֵ

function MovePoint( // ƫ��һ����
  mPoint: TPoint; // ������
  DX, DY: Integer // ƫ�Ƶ�λ��
): TPoint; // ����ƫ�Ƶĵ�λ��

function RotatePoint( // ��תһ��������
  mPoint: TPoint; // ԭʼ��
  mCenter: TPoint; // ���ĵ�����
  mAngle: Double // ��ת�Ƕ�
): TPoint; // ������ת��ĵ�����

function PointToAngle( // ��������ĽǶ�
  mOrigin: TPoint; // ԭ����
  mPoint: TPoint; // ��������
  mEccentricity: Double = 1 // ������ a / b // ������Բ�ĽǶ�
): Double; // ���ظ��������ԭ����ĽǶ� // PiΪ��λ

function RectInRect( // �жϾ���A�Ƿ��ھ���B��
  mRectA, mRectB: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ���A�Ƿ��ھ���B��

function LineByRect( // �ж�ֱ���Ƿ�;����ཻ
  mLineA, mLineB: TPoint; //ֱ��
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // �ж�ֱ���Ƿ�;����ཻ

function RectByRect( // �жϾ���A�Ƿ�;���B�ཻ
  mRectA, mRectB: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ���A�Ƿ��ھ���B��

function RectByEllipse( // �жϾ����Ƿ����Բ�ཻ
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ����Բ�ཻ

function RectInChord( // �жϾ����Ƿ���������
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ���������

function EllipseInRect( // �ж�һ����Բ�Ƿ��ھ�����
  mEllipse: TRect; // ��Բ
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ����һ����Բ�Ƿ��ھ�����

function ChordInRect( // �ж������Ƿ��ھ�����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���������Ƿ��ھ�����

function RectInEllipse( // �жϾ�������Բ��
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ�������Բ��

function RectByChord( // �жϾ����Ƿ����Բ���ཻ
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ��κ���Բ���ཻ

function RectByArc( // �жϾ����Ƿ���������ཻ
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ���������ཻ

function RectByPolygon( // �жϾ����Ƿ�Ͷ�����ཻ
  mRect: TRect; // ����
  mPoints: array of TPoint; // ���������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // �����жϾ����Ƿ�Ͷ�����ཻ

function Angle8Point( // �õ�����ƫ��İ˸���λ������
  mOrigin: TPoint; // ԭ��
  mPoint: TPoint // �����
): TPoint; // �˸���λ����

function Angle8Index( // �õ�����ƫ��İ˸���λ�����
  mOrigin: TPoint; // ԭ��
  mAngle: Double // �Ƕ�
): Integer; // �˸���λ���

function PtInPolygon( // �жϵ��Ƿ��ڶ������
  mPoint: TPoint; // ��
  mPoints: array of TPoint // ���������
): Boolean; // ���ص��Ƿ��ڶ������

function RectInPolygon( // �жϾ����Ƿ��ڶ������
  mRect: TRect; // ����
  mPoints: array of TPoint; // ���������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ��ڶ������

function BezierPoints( // ��ñ����������
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // ��������������
  var mPoints: array of TPoint // ���ؼ��������
): Boolean; // ���ؼ����Ƿ�ɹ�

function PtInBezier( // �жϵ��Ƿ��ڱ�����������
  mPoint: TPoint; // ������
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // ��������������
  mPenWidth: Integer // �������
): Boolean; // ���ص��Ƿ��ڱ�����������

function PtInHollowPolygon( // �жϵ��Ƿ��ڿ��Ķ������
  mPoint: TPoint; // ������
  mPoints: array of TPoint; // ��������
  mPenWidth: Integer // �������
): Boolean; // ���ص��Ƿ��ڿ��Ķ������

function PtInPolyline( // �жϵ��Ƿ���������
  mPoint: TPoint; // ������
  mPoints: array of TPoint; // ��������
  mPenWidth: Integer // �������
): Boolean; // ���ص��Ƿ���������

function RectByBezier( // �жϾ����Ƿ�ͱ����������ཻ
  mRect: TRect; // ����
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // ��������������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ�ͱ����������ཻ

function RectByPolyline( // �жϾ����Ƿ�������ཻ
  mRect: TRect; // ����
  mPoints: array of TPoint; // ���������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ�������ཻ

function PtInChord( // �ж�һ�����Ƿ���������
  mPoint: TPoint; // ��֪��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint // �����뾶����
): Boolean; // ���ص��Ƿ��ڻ�����

function DoubleLineIntersect( // ���������߶εĽ�������
  mLine1A, mLine1B: TPoint; // �߶�1
  mLine2A, mLine2B: TPoint; // �߶�2
  var nPoint: TPoint // ���ؽ�������
): Boolean; // ��������ֱ���Ƿ���ڽ���

function LineEllipseIntersect( // �����߶κ���Բ�Ľ���
  mLineA, mLineB: TPoint; // �߶�
  mEllipse: TRect; // ��Բ
  var nPointA: TPoint; // ���ؽ�������
  var nPointB: TPoint // ���ؽ�������
): Integer; // ���ؽ���ĸ���

function AngleInRange( // �жϽǶ��Ƿ���һ����Χ��
  mAngle: Double; // ���ԽǶ�
  mAngleBegin: Double; // ��ʼ�Ƕ�
  mAngleEnd: Double // ��ֹ�Ƕ�
): Boolean; // ���ؽǶ��Ƿ���һ����Χ��

function LineArcIntersect( // ����߶κ�����Ľ���
  mLineA, mLineB: TPoint; // ֱ��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  var nPointA: TPoint; // ���ؽ�������
  var nPointB: TPoint // ���ؽ�������
): Integer; // ���ؽ���ĸ���

function LineChordIntersect( // ����߶κ�����Ľ���
  mLineA, mLineB: TPoint; // ֱ��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  var nPointA: TPoint; // ���ؽ�������
  var nPointB: TPoint // ���ؽ�������
): Integer; // ���ؽ���ĸ���

function PtInChordLine( // �ж�һ�����Ƿ�������Ľڵ�������
  mPoint: TPoint; // ��֪��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mPenWidth: Integer // �������
): Boolean; // ����һ�����Ƿ�������Ľڵ�������

function PointInRect( // �жϵ��Ƿ��ھ�����
  mPoint: TPoint; // ������
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ص��Ƿ��ھ�����

function PtInRound( // �жϵ������Ƿ���Բ�Ǿ�����
  mPoint: TPoint; // ����
  mRound: TRect; // ����
  mRadial: TPoint // Բ�Ǹ߿�
): Boolean; // ���ص��Ƿ���Բ�Ǿ�����

function RectByRound( // �жϾ��κ�Բ�Ǿ����Ƿ��ཻ
  mRect: TRect; // ����
  mRound: TRect; // Բ�Ǿ���
  mRadial: TPoint; // Բ�Ǹ߿�
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ��κ�Բ�Ǿ����Ƿ��ཻ

function RectInRound( // �жϾ����Ƿ���Բ�Ǿ�����
  mRect: TRect; // ����
  mRound: TRect; // Բ�Ǿ���
  mRadial: TPoint; // Բ�Ǹ߿�
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ���Բ�Ǿ�����

function SetDefaultPrinter( // ����Ĭ�ϴ�ӡ��
  mPrinterIndex: Integer // Ĭ�ϴ�ӡ�����
): Boolean; // ���������Ƿ�ɹ�

function GetSpecialFolderPath( // ���ػ�ȡϵͳ�ļ���ϵͳĿ¼
  mFolder: Integer // Ŀ¼��ʶ // ShlObj // CSIDL_...
): string; // ���ػ�ȡ����Ŀ¼��

function DirectoryInfo( // ���Ŀ¼�Ĵ�С���ļ�������Ŀ¼����
  mDirectory: string; // Ŀ¼��
  var nFileSize: Integer; // �ܴ�С
  var nFileCount: Integer; // �ļ�����
  var nDirectoryCount: Integer // Ŀ¼����
): Boolean; // ����Ŀ¼�Ĵ�С

{$IFDEF USES_COMPRESSION}
function FileCompression( // ���ļ�ѹ��������
  mFileName: string; // �ļ���
  mStream: TStream // Ŀ��
): Integer; // ����ѹ����Ĵ�С

function FileDecompression( // �����н�ѹ�ļ�
  mFileName: string; // Ŀ���ļ���
  mStream: TStream // ��Դ
): Integer; // ���ؽ�ѹ��Ĵ�С

function DirectoryCompression( // ��Ŀ¼ѹ�����ļ�
  mDirectory: string; // Ŀ¼��
  mFileName: string // ѹ������ļ���
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����

function DirectoryCompression( // ��Ŀ¼ѹ������
  mDirectory: string; // Ŀ¼��
  mStream: TStream // ѹ�������
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����

type
  TDirectoryDecompressionProgress = function( // ��ѹ����
    mFileCount: Integer; // �ļ��ܸ���
    mFileIndex: Integer; // ��ǰ��ѹ�ļ����
    mPackSize: Integer; // �ļ�ѹ����С
    mFileName: string; // ��ǰ��ѹ�ļ���
    mFileSize: Integer; // ��ǰ��ѹ�ļ���С
    mParam: Integer // ���Ӳ���
  ): Boolean; // �����Ƿ������ѹ

function DirectoryDecompression( // ���ļ��н�ѹĿ¼
  mDirectory: string; // Ŀ¼��
  mFileName: string; // ѹ���ļ���
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ��ĸ���

function DirectoryDecompression( // �����н�ѹĿ¼
  mDirectory: string; // ָ��Ŀ¼��
  mStream: TStream; // ѹ����
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ���ļ�����
{$ENDIF}

function TrackerWindow( // ��ɫ��ʾ�����������ѡȡ������
  AHandle: THandle // ������
): Boolean; // ���ش����Ƿ�ɹ�

function ClipboardSaveToStream( // ������������ݱ��浽����
  mStream: TStream // ������
): Boolean; // ���ش����Ƿ�ɹ�

function ClipboardLoadFromStream( // �����е��������뵽��������
  mStream: TStream // ������
): Boolean; // ���ش����Ƿ�ɹ�

function ClipboardSize: Integer; // ���ؼ����������ݵ��ܴ�С

function ControlFromPoint( // �����������Ӧλ�ö�Ӧ�Ŀؼ�
  mParent: TWinControl; // ����
  mPoint: TPoint // ����
): TControl; // ������������Ӧλ�ö�Ӧ�Ŀؼ�

function InitTriVertex( // ��ʼ��TriVertex�ṹ
  mPoint: TPoint; // ����
  mColor: TColor // ��ɫ
): TTriVertex; // ���س�ʼ����Ľṹ

function FileSize( // ����ļ��Ĵ�С
  AFileName: string // �ļ���
): Integer; // �����ļ��Ĵ�С

function SymmetryColor( // Ѱ�ҶԳƵ���ɫ
  mColor: TColor // ԭɫ
): TColor; // ���ضԳ���ɫ

function DeletePath( // ɾ��ָ��Ŀ¼
  mDirName: string; // Ŀ¼��
  mPrefix: string; // ǰ׺
  mChangeAttrib: Boolean // �Ƿ��޸������Ա�ɾ��
): Boolean; // ����ɾ��ָ��Ŀ¼�Ƿ�ɹ�

function FileTimeToDateTime( // ���ļ�ʱ�䴦��ΪTDateTime
  mFileTime: TFileTime // �ļ�ʱ��
): TDateTime; // ���ش����Ľ��

implementation

uses TypInfo, Types, Math, MMSystem, TlHelp32, PsAPI, Printers, ShlObj, Clipbrd,
  StringFunctions51{$IFDEF USES_COMPRESSION}, ZLib20{$ENDIF};

function FileTimeToDateTime( // ���ļ�ʱ�䴦��ΪTDateTime
  mFileTime: TFileTime // �ļ�ʱ��
): TDateTime; // ���ش����Ľ��
var
  vSystemTime: TSystemTime;
  vLocalFileTime: TFileTime;
begin
  FileTimeToLocalFileTime(mFileTime, vLocalFileTime);
  FileTimeToSystemTime(vLocalFileTime, vSystemTime);
  Result := SystemTimeToDateTime(vSystemTime);
end; { FileTimeToDateTime }

function DeletePath( // ɾ��ָ��Ŀ¼
  mDirName: string; // Ŀ¼��
  mPrefix: string; // ǰ׺
  mChangeAttrib: Boolean // �Ƿ��޸������Ա�ɾ��
): Boolean; // ����ɾ��ָ��Ŀ¼�Ƿ�ɹ�
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

function SymmetryColor( // Ѱ�ҶԳƵ���ɫ
  mColor: TColor // ԭɫ
): TColor; // ���ضԳ���ɫ
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

function FileSize( // ����ļ��Ĵ�С
  AFileName: string // �ļ���
): Integer; // �����ļ��Ĵ�С
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

function InitTriVertex( // ��ʼ��TriVertex�ṹ
  mPoint: TPoint; // ����
  mColor: TColor // ��ɫ
): TTriVertex; // ���س�ʼ����Ľṹ
begin
  Result.x := mPoint.X;
  Result.y := mPoint.Y;
  Result.Alpha := 0;
  mColor := ColorToRGB(mColor);
  Result.Red := GetRValue(mColor) shl 8;
  Result.Green := GetGValue(mColor) shl 8;
  Result.Blue := GetBValue(mColor) shl 8;
end; { InitTriVertex }

function ControlFromPoint( // �����������Ӧλ�ö�Ӧ�Ŀؼ�
  mParent: TWinControl; // ����
  mPoint: TPoint // ����
): TControl; // ������������Ӧλ�ö�Ӧ�Ŀؼ�
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

function ClipboardSaveToStream( // ������������ݱ��浽����                     //2007-04-02 ZswangY37 No.1 
  mStream: TStream // ������
): Boolean; // ���ش����Ƿ�ɹ�
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

function ClipboardLoadFromStream( // �����е��������뵽��������
  mStream: TStream // ������
): Boolean; // ���ش����Ƿ�ɹ�
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

function ClipboardSize: Integer; // ���ؼ����������ݵ��ܴ�С
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

function TrackerWindow( // ��ɫ��ʾ�����������ѡȡ������
  AHandle: THandle // ������
): Boolean; // ���ش����Ƿ�ɹ�
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
    rIdent: array[0..2] of Char; //��ʶ
    rVersion: Byte; //�汾
  end;

const
  cIdent = 'zsf';
  cVersion = $01;

function FileCompression( // ���ļ�ѹ��������
  mFileName: string; // �ļ���
  mStream: TStream // Ŀ��
): Integer; // ����ѹ����Ĵ�С
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
  Result := mStream.Size - vPosition; //����
end; { FileCompression }

function FileDecompression( // �����н�ѹ�ļ�
  mFileName: string; // Ŀ���ļ���
  mStream: TStream // ��Դ
): Integer; overload; // ���ؽ�ѹ��Ĵ�С
var
  vFileStream: TFileStream;
  vFileHandle: THandle;
  vBuffer: array[0..cBufferSize]of Char;
  I: Integer;
begin
  Result := -1;
  if not Assigned(mStream) then Exit;
  ForceDirectories(ExtractFilePath(mFileName)); //����Ŀ¼
  { TODO : �ж��ļ��Ƿ���Դ��� }
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

function DirectoryCompression( // ѹ��Ŀ¼
  mDirectory: string; // Ŀ¼��
  mFileName: string // ѹ������ļ���
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����
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

function DirectoryCompression( // ��Ŀ¼ѹ������
  mDirectory: string; // Ŀ¼��
  mStream: TStream // ѹ�������
): Integer; overload; // ����ѹ����Ĵ�С //���Ϊ�������ʶ����
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

    { DONE -oZswang -c��� : д��ͷ�ļ���Ϣ }
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

function DirectoryDecompression( // ���ļ��н�ѹĿ¼
  mDirectory: string; // Ŀ¼��
  mFileName: string; // ѹ���ļ���
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ���ļ�����
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

function DirectoryDecompression( // �����н�ѹĿ¼
  mDirectory: string; // ָ��Ŀ¼��
  mStream: TStream; // ѹ����
  mProgress: TDirectoryDecompressionProgress = nil; // ���ȴ���
  mParam: Integer = 0 // ���Ӳ���
): Integer; overload; // ���ؽ�ѹ���ļ�����
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
    { DONE -oZswang -c��� : ��ȡͷ�ļ���Ϣ }
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

function DirectoryInfo( // ���Ŀ¼�Ĵ�С���ļ�������Ŀ¼����
  mDirectory: string; // Ŀ¼��
  var nFileSize: Integer; // �ܴ�С
  var nFileCount: Integer; // �ļ�����
  var nDirectoryCount: Integer // Ŀ¼����
): Boolean; // ����Ŀ¼�Ĵ�С
var
  vSearchRec: TSearchRec;
  vFileSize: Integer; // �ܴ�С
  vFileCount: Integer; // �ļ�����
  vDirectoryCount: Integer; // Ŀ¼����
begin
  Result := False;
  if not DirectoryExists(mDirectory) then Exit; // Ŀ¼������
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

function GetSpecialFolderPath( // ���ػ�ȡϵͳ�ļ���ϵͳĿ¼
  mFolder: Integer // Ŀ¼��ʶ // ShlObj // CSIDL_...
): string; // ���ػ�ȡ����Ŀ¼��
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  SHGetSpecialFolderPath(0, vBuffer, mFolder, True);
  Result := vBuffer;
end; { GetSpecialFolderPath }

function SetDefaultPrinter( // ����Ĭ�ϴ�ӡ��
  mPrinterIndex: Integer // Ĭ�ϴ�ӡ�����
): Boolean; // ���������Ƿ�ɹ�
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

function DoubleLineIntersect( // ���������߶εĽ�������
  mLine1A, mLine1B: TPoint; // �߶�1
  mLine2A, mLine2B: TPoint; // �߶�2
  var nPoint: TPoint // ���ؽ�������
): Boolean; // ��������ֱ���Ƿ���ڽ���
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
  Result := // ʹ��Sign�����������
    (Sign(nPoint.X - mLine1A.X) * Sign(nPoint.X - mLine1B.X) <= 0) and
    (Sign(nPoint.X - mLine2A.X) * Sign(nPoint.X - mLine2B.X) <= 0) and
    (Sign(nPoint.Y - mLine1A.Y) * Sign(nPoint.Y - mLine1B.Y) <= 0) and
    (Sign(nPoint.Y - mLine2A.Y) * Sign(nPoint.Y - mLine2B.Y) <= 0);
end; { DoubleLineIntersect }

function LineEllipseIntersect( // �����߶κ���Բ�Ľ���
  mLineA, mLineB: TPoint; // �߶�
  mEllipse: TRect; // ��Բ
  var nPointA: TPoint; // ���ؽ�������
  var nPointB: TPoint // ���ؽ�������
): Integer; // ���ؽ���ĸ���
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

function AngleInRange( // �жϽǶ��Ƿ���һ����Χ��
  mAngle: Double; // ���ԽǶ�
  mAngleBegin: Double; // ��ʼ�Ƕ�
  mAngleEnd: Double // ��ֹ�Ƕ�
): Boolean; // ���ؽǶ��Ƿ���һ����Χ��
begin
  Result := (((mAngle <= mAngleBegin) and (mAngle >= mAngleEnd)) or
    ((mAngle >= mAngleBegin) and (mAngle <= mAngleEnd))) xor
    (mAngleBegin < mAngleEnd);
end; { AngleInRange }

function LineArcIntersect( // ����߶κ�����Ľ���
  mLineA, mLineB: TPoint; // ֱ��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  var nPointA: TPoint; // ���ؽ�������
  var nPointB: TPoint // ���ؽ�������
): Integer; // ���ؽ���ĸ���
var
  vCenter: TPoint; // Բ������
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
  ///////Begin ���������뾶�������Բ�Ľ���
  vAngleA := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  vAngleB := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  ///////End ���������뾶�������Բ�Ľ���
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

function LineChordIntersect( // ����߶κ�����Ľ���
  mLineA, mLineB: TPoint; // ֱ��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  var nPointA: TPoint; // ���ؽ�������
  var nPointB: TPoint // ���ؽ�������
): Integer; // ���ؽ���ĸ���
var
  vCenter: TPoint; // Բ������
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
  ///////Begin ���������뾶�������Բ�Ľ���
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End ���������뾶�������Բ�Ľ���
  if DoubleLineIntersect(
    mLineA, mLineB, mRadialBegin, mRadialEnd, nPointB) then
  begin
    Inc(Result);
    if Result = 1 then nPointA := nPointB;
  end;
end; { LineChordIntersect }

function PointInRect( // �жϵ��Ƿ��ھ�����
  mPoint: TPoint; // ������
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ص��Ƿ��ھ�����
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

function PtInRound( // �жϵ������Ƿ���Բ�Ǿ�����
  mPoint: TPoint; // ����
  mRound: TRect; // ����
  mRadial: TPoint // Բ�Ǹ߿�
): Boolean; // ���ص��Ƿ���Բ�Ǿ�����
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

function RectByRound( // �жϾ��κ�Բ�Ǿ����Ƿ��ཻ
  mRect: TRect; // ����
  mRound: TRect; // Բ�Ǿ���
  mRadial: TPoint; // Բ�Ǹ߿�
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ��κ�Բ�Ǿ����Ƿ��ཻ
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

function RectInRound( // �жϾ����Ƿ���Բ�Ǿ�����
  mRect: TRect; // ����
  mRound: TRect; // Բ�Ǿ���
  mRadial: TPoint; // Բ�Ǹ߿�
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ���Բ�Ǿ�����
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

function PtInChordLine( // �ж�һ�����Ƿ�������Ľڵ�������
  mPoint: TPoint; // ��֪��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mPenWidth: Integer // �������
): Boolean; // ����һ�����Ƿ�������Ľڵ�������
var
  vCenter: TPoint; // Բ������
  vAngle: Double;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := PtInEllipse(mPoint, mEllipse); // ��������԰��
  if not Result then Exit;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;

  ///////Begin ���������뾶�������Բ�Ľ���
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End ���������뾶�������Բ�Ľ���

  Result := PtInLine(mPoint, mRadialBegin, mRadialEnd, mPenWidth);
end;

function PtInChord( // �ж�һ�����Ƿ���������
  mPoint: TPoint; // ��֪��
  mEllipse: TRect; // ��Բ����
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint // �����뾶����
): Boolean; // ���ص��Ƿ��ڻ�����
var
  vCenter: TPoint; // Բ������
  vAngle: Double;
  vPointA, vPointB, vPointC, vPointD: TPoint;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := PtInEllipse(mPoint, mEllipse); // ��������԰��
  if not Result then Exit;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;

  ///////Begin ���������뾶�������Բ�Ľ���
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End ���������뾶�������Բ�Ľ���

  ///////Begin ���ݰ뾶����Բ�Ľ��㣬�õ��㹻��ľ�������
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
  ///////End ���ݰ뾶����Բ�Ľ��㣬�õ��㹻��ľ�������

  Result := PtInPolygon(mPoint, [vPointA, vPointB, vPointD, vPointC]); // �жϸõ��Ƿ��ڴ˾�����
end; { PtInChord }

function PtInPolygon( // �жϵ��Ƿ��ڶ������
  mPoint: TPoint; // ��
  mPoints: array of TPoint // ���������
): Boolean; // ���ص��Ƿ��ڶ������
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

function RectInPolygon( // �жϾ����Ƿ��ڶ������
  mRect: TRect; // ����
  mPoints: array of TPoint; // ���������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ��ڶ������
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

function BezierPoints( // ��ñ����������
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // ��������������
  var mPoints: array of TPoint // ���ؼ��������
): Boolean; // ���ؼ����Ƿ�ɹ�
var
  AX, BX, CX: Double;
  AY, BY, CY: Double;
  vSquared, vCubed: Double;
  T: Double;
  I: Integer;
begin
  Result := False;
  if Length(mPoints) <= 0 then Exit;
  (* �������ʽϵ�� *)
  CX := 3.0 * (mStartHelper.X - mStart.X);
  BX := 3.0 * (mEndHelper.X - mStartHelper.X) - CX;
  AX := mEnd.x - mStart.X - CX - BX;

  CY := 3.0 * (mStartHelper.Y - mStart.y);
  BY := 3.0 * (mEndHelper.Y - mStartHelper.y) - CY;
  AY := mEnd.Y - mStart.Y - CY - BY;

  (* ����λ�ڲ���ֵ t �����ߵ� *)
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

function PtInBezier( // �жϵ��Ƿ��ڱ�����������
  mPoint: TPoint; // ������
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // ��������������
  mPenWidth: Integer // �������
): Boolean; // ���ص��Ƿ��ڱ�����������
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
  (* �������ʽϵ�� *)
  CX := 3.0 * (mStartHelper.X - mStart.X);
  BX := 3.0 * (mEndHelper.X - mStartHelper.X) - CX;
  AX := mEnd.x - mStart.X - CX - BX;

  CY := 3.0 * (mStartHelper.Y - mStart.y);
  BY := 3.0 * (mEndHelper.Y - mStartHelper.y) - CY;
  AY := mEnd.Y - mStart.Y - CY - BY;
  vPoint1 := mStart;
  (* ����λ�ڲ���ֵ t �����ߵ� *)
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

function PtInHollowPolygon( // �жϵ��Ƿ��ڿ��Ķ������
  mPoint: TPoint; // ������
  mPoints: array of TPoint; // ��������
  mPenWidth: Integer // �������
): Boolean; // ���ص��Ƿ��ڿ��Ķ������
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

function PtInPolyline( // �жϵ��Ƿ���������
  mPoint: TPoint; // ������
  mPoints: array of TPoint; // ��������
  mPenWidth: Integer // �������
): Boolean; // ���ص��Ƿ���������
var
  I: Integer;
begin
  Result := True;
  for I := Low(mPoints) + 1 to High(mPoints) do
    if PtInLine(mPoint, mPoints[I - 1], mPoints[I], mPenWidth) then Exit;
  Result := False;
end; { PtInPolyline }

function RectByBezier( // �жϾ����Ƿ�ͱ����������ཻ
  mRect: TRect; // ����
  mStart, mStartHelper, mEndHelper, mEnd: TPoint; // ��������������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ�ͱ����������ཻ
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
  if PointInRect(mStart, mRect, mCenter, mAngle) then Exit; // ��ǰ���ھ�����
  if PointInRect(mEnd, mRect, mCenter, mAngle) then Exit; // ��ǰ���ھ�����
  
  (* �������ʽϵ�� *)
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
      if PointInRect(vPoint2, mRect, mCenter, mAngle) then Exit; // ��ǰ���ھ�����
      ///////Begin �����ĳ�ߺ;��α��ཻ
      if DoubleLineIntersect(A, B, vPoint1, vPoint2, vPoint) then Exit; // TOP
      if DoubleLineIntersect(B, D, vPoint1, vPoint2, vPoint) then Exit; // LEFT
      if DoubleLineIntersect(C, D, vPoint1, vPoint2, vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(A, C, vPoint1, vPoint2, vPoint) then Exit; // RIGHT
      ///////End �����ĳ�ߺ;��α��ཻ
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
      if PtInRect(mRect, vPoint2) then Exit; // ��ǰ���ھ�����

      ///////Begin �����ĳ�ߺ;��α��ཻ
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Right, mRect.Top), vPoint1, vPoint2, vPoint) then Exit; // TOP
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Left, mRect.Bottom), vPoint1, vPoint2, vPoint) then Exit; // LEFT
      if DoubleLineIntersect(Point(mRect.Left, mRect.Bottom),
        Point(mRect.Right, mRect.Bottom), vPoint1, vPoint2, vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(Point(mRect.Right, mRect.Top),
        Point(mRect.Right, mRect.Bottom), vPoint1, vPoint2, vPoint) then Exit; // RIGHT
      ///////End �����ĳ�ߺ;��α��ཻ
      vPoint1 := vPoint2;
    end;
  end;
  Result := False;
end; { RectByBezier } 

function RectByPolyline( // �жϾ����Ƿ�������ཻ
  mRect: TRect; // ����
  mPoints: array of TPoint; // ���������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ�������ཻ
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
    if PointInRect(mPoints[Low(mPoints)], mRect, mCenter, mAngle) then Exit; // ��ǰ���ھ�����
    for I := Low(mPoints) + 1 to High(mPoints) do
    begin
      if PointInRect(mPoints[I], mRect, mCenter, mAngle) then                   //2007-08-21 ZswangY37 No.1
        Exit; // ��ǰ���ھ�����

      ///////Begin �����ĳ�ߺ;��α��ཻ
      if DoubleLineIntersect(A, B, mPoints[I], mPoints[I - 1], vPoint) then Exit; // TOP
      if DoubleLineIntersect(B, D, mPoints[I], mPoints[I - 1], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(C, D, mPoints[I], mPoints[I - 1], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(A, C, mPoints[I], mPoints[I - 1], vPoint) then Exit; // RIGHT
      ///////End �����ĳ�ߺ;��α��ཻ
    end;
  end else
  begin
      if PtInRect(mRect, mPoints[Low(mPoints)]) then Exit; // ��ǰ���ھ�����
    for I := Low(mPoints) + 1 to High(mPoints) do
    begin
      if PtInRect(mRect, mPoints[I]) then Exit; // ��ǰ���ھ�����

      ///////Begin �����ĳ�ߺ;��α��ཻ
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Right, mRect.Top), mPoints[I], mPoints[I - 1], vPoint) then Exit; // TOP
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Left, mRect.Bottom), mPoints[I], mPoints[I - 1], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(Point(mRect.Left, mRect.Bottom),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[I - 1], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(Point(mRect.Right, mRect.Top),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[I - 1], vPoint) then Exit; // RIGHT
      ///////End �����ĳ�ߺ;��α��ཻ
    end;
  end;
  Result := False;
end; { RectByPolyline } 

function RectByPolygon( // �жϾ����Ƿ�Ͷ�����ཻ
  mRect: TRect; // ����
  mPoints: array of TPoint; // ���������
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // �����жϾ����Ƿ�Ͷ�����ཻ
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
        Exit; // ��ǰ���ھ�����

      if I = High(mPoints) then J := Low(mPoints) else J := Succ(I);
      ///////Begin �����ĳ�ߺ;��α��ཻ
      if DoubleLineIntersect(A, B, mPoints[I], mPoints[J], vPoint) then Exit; // TOP
      if DoubleLineIntersect(B, D, mPoints[I], mPoints[J], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(C, D, mPoints[I], mPoints[J], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(A, C, mPoints[I], mPoints[J], vPoint) then Exit; // RIGHT
      ///////End �����ĳ�ߺ;��α��ཻ
    end;
  end else
  begin
    for I := Low(mPoints) to High(mPoints) do
    begin
      if PtInRect(mRect, mPoints[I]) then Exit; // ��ǰ���ھ�����
      if I = High(mPoints) then J := Low(mPoints) else J := Succ(I);
      ///////Begin �����ĳ�ߺ;��α��ཻ
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Right, mRect.Top), mPoints[I], mPoints[J], vPoint) then Exit; // TOP
      if DoubleLineIntersect(Point(mRect.Left, mRect.Top),
        Point(mRect.Left, mRect.Bottom), mPoints[I], mPoints[J], vPoint) then Exit; // LEFT
      if DoubleLineIntersect(Point(mRect.Left, mRect.Bottom),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[J], vPoint) then Exit; // BOTTOM
      if DoubleLineIntersect(Point(mRect.Right, mRect.Top),
        Point(mRect.Right, mRect.Bottom), mPoints[I], mPoints[J], vPoint) then Exit; // RIGHT
      ///////End �����ĳ�ߺ;��α��ཻ
    end;
  end;
  Result := False;
end; { RectByPolygon }

function Angle8Index( // �õ�����ƫ��İ˸���λ�����
  mOrigin: TPoint; // ԭ��
  mAngle: Double // �Ƕ�
): Integer; // �˸���λ���
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

function Angle8Point( // �õ�����ƫ��İ˸���λ������
  mOrigin: TPoint; // ԭ��
  mPoint: TPoint // �����
): TPoint; // �˸���λ����
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

function RectInRect( // �жϾ���A�Ƿ��ھ���B��
  mRectA, mRectB: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ���A�Ƿ��ھ���B��
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

function RectByRect( // �жϾ���A�Ƿ�;���B�ཻ
  mRectA, mRectB: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ���A�Ƿ��ھ���B��
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

function LineByRect( // �ж�ֱ���Ƿ�;����ཻ
  mLineA, mLineB: TPoint; //ֱ��
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // �ж�ֱ���Ƿ�;����ཻ
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

function RectInEllipse( // �жϾ�������Բ��
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ�������Բ��
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

function EllipseInRect( // �ж�һ����Բ�Ƿ��ھ�����
  mEllipse: TRect; // ��Բ
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ����һ����Բ�Ƿ��ھ�����
var
  A, B, C, D: TPoint;
  vOrigin: TPoint;
  vPointA, vPointB: TPoint;
begin
  if Assigned(mCenter) then
  begin
    Result := False;
    vOrigin := CenterPoint(mEllipse); // Բ��
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    if not PtInPolygon(vOrigin, [A, B, D, C]) then Exit; // Բ�Ĳ��ھ�����
    ///////Begin ��һ����Բ����
    if PtInEllipse(A, mEllipse) then Exit;
    if PtInEllipse(B, mEllipse) then Exit;
    if PtInEllipse(C, mEllipse) then Exit;
    if PtInEllipse(D, mEllipse) then Exit;
    ///////End ��һ����Բ����
    ///////Begin �����ıߺ���Բ�ཻ
    if LineEllipseIntersect(A, B, mEllipse, vPointA, vPointB) > 0 then Exit; // TOP
    if LineEllipseIntersect(B, D, mEllipse, vPointA, vPointB) > 0 then Exit; // LEFT
    if LineEllipseIntersect(C, D, mEllipse, vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineEllipseIntersect(A, C, mEllipse, vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End �����ıߺ���Բ�ཻ
    Result := True;
  end else Result := RectInRect(mEllipse, mRect, mCenter, mAngle);
end; { EllipseInRect }

function RectByEllipse( // �жϾ����Ƿ����Բ�ཻ
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ����Բ�ཻ
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
    ///////Begin �����ıߺ���Բ�ཻ
    if LineEllipseIntersect(A, B, mEllipse, vPointA, vPointB) > 0 then Exit; // TOP
    if LineEllipseIntersect(B, D, mEllipse, vPointA, vPointB) > 0 then Exit; // LEFT
    if LineEllipseIntersect(C, D, mEllipse, vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineEllipseIntersect(A, C, mEllipse, vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End �����ıߺ���Բ�ཻ
  end else
  begin
    ///////Begin �����ıߺ���Բ�ཻ
    if LineEllipseIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Right, mRect.Top), mEllipse, vPointA, vPointB) > 0 then Exit; // TOP
    if LineEllipseIntersect(Point(mRect.Left, mRect.Top),
      Point(mRect.Left, mRect.Bottom), mEllipse, vPointA, vPointB) > 0 then Exit; // LEFT
    if LineEllipseIntersect(Point(mRect.Left, mRect.Bottom),
      Point(mRect.Right, mRect.Bottom), mEllipse, vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineEllipseIntersect(Point(mRect.Right, mRect.Top),
      Point(mRect.Right, mRect.Bottom), mEllipse, vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End �����ıߺ���Բ�ཻ
  end;
  Result := False;
end; { RectByEllipse }

function RectInChord( // �жϾ����Ƿ���������
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ���������
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

function ChordInRect( // �ж������Ƿ��ھ�����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mRect: TRect; // ����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���������Ƿ��ھ�����
var
  vCenter: TPoint; // Բ������
  vAngle: Double;
  vLengthX: Integer;
  vLengthY: Integer;
begin
  Result := False;
  vCenter := CenterPoint(mEllipse);
  vLengthX := Abs(mEllipse.Right - mEllipse.Left) div 2;
  vLengthY := Abs(mEllipse.Bottom - mEllipse.Top) div 2;
  if (vLengthY = 0) or (vLengthX = 0) then Exit;
  ///////Begin ���������뾶�������Բ�Ľ���
  vAngle := PointToAngle(vCenter, mRadialBegin, vLengthX / vLengthY);
  mRadialBegin.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialBegin.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);

  vAngle := PointToAngle(vCenter, mRadialEnd, vLengthX / vLengthY);
  mRadialEnd.X := vCenter.X + Trunc(Cos(vAngle) * vLengthX);
  mRadialEnd.Y := vCenter.Y + Trunc(Sin(vAngle) * vLengthY);
  ///////End ���������뾶�������Բ�Ľ���
  Result := PointInRect(mRadialBegin, mRect, mCenter, mAngle) and
    PointInRect(mRadialEnd, mRect, mCenter, mAngle);
end; { ChordInRect }

function RectByChord( // �жϾ����Ƿ����Բ���ཻ
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ��κ���Բ���ཻ
var
  vPointA, vPointB: TPoint;
  A, B, C, D: TPoint;
begin
  Result := RectByRect(mEllipse, mRect, mCenter, mAngle);
  if not Result then Exit;
  if EllipseInRect(mEllipse, mRect) then Exit; // ��Բ�ھ�����
  mRect := ReviseRect(mRect);
  mEllipse := ReviseRect(mEllipse);
  
  if Assigned(mCenter) then
  begin
    A := RotatePoint(Point(mRect.Left, mRect.Top), mCenter^, mAngle);
    B := RotatePoint(Point(mRect.Left, mRect.Bottom), mCenter^, mAngle);
    C := RotatePoint(Point(mRect.Right, mRect.Top), mCenter^, mAngle);
    D := RotatePoint(Point(mRect.Right, mRect.Bottom), mCenter^, mAngle);
    ///////Begin ���ζ�������Բ��
    if PtInChord(A, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(B, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(C, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(D, mEllipse, mRadialBegin, mRadialEnd) then Exit;
    ///////End ���ζ�������Բ��

    ///////Begin �����ıߺ���Բ�ཻ
    if LineChordIntersect(A, B, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // TOP
    if LineChordIntersect(B, D, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // LEFT
    if LineChordIntersect(C, D, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // BOTTOM
    if LineChordIntersect(A, C, mEllipse, mRadialBegin, mRadialEnd,
      vPointA, vPointB) > 0 then Exit; // RIGHT
    ///////End �����ıߺ���Բ�ཻ
  end else
  begin
    ///////Begin ���ζ�������Բ��
    if PtInChord(Point(mRect.Left, mRect.Top), mEllipse,
      mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(Point(mRect.Left, mRect.Bottom),
      mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(Point(mRect.Right, mRect.Top),
      mEllipse, mRadialBegin, mRadialEnd) then Exit;
    if PtInChord(Point(mRect.Right, mRect.Bottom),
      mEllipse, mRadialBegin, mRadialEnd) then Exit;
    ///////End ���ζ�������Բ��

    ///////Begin �����ıߺ���Բ�ཻ
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
    ///////End �����ıߺ���Բ�ཻ
  end;
  Result := False;
end; { RectByChord }

function RectByArc( // �жϾ����Ƿ���������ཻ
  mRect: TRect; // ����
  mEllipse: TRect; // ��Բ
  mRadialBegin: TPoint; // ��ʼ�뾶����
  mRadialEnd: TPoint; // �����뾶����
  mCenter: PPoint = nil; // ��������
  mAngle: Double = 0 // ��ת����
): Boolean; // ���ؾ����Ƿ���������ཻ
var
  vPointA, vPointB: TPoint;
begin
  Result := RectByRect(mRect, mEllipse);
  if not Result then Exit;
  if RectInRect(mEllipse, mRect) then Exit; // ��Բ�ھ�����
  mRect := ReviseRect(mRect);
  mEllipse := ReviseRect(mEllipse);

  ///////Begin �����ıߺ���Բ�ཻ
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
  ///////End �����ıߺ���Բ�ཻ
  Result := False;
end; { RectByArc }

function RotatePoint( // ��תһ��������
  mPoint: TPoint; // ԭʼ��
  mCenter: TPoint; // ���ĵ�����
  mAngle: Double // ��ת�Ƕ�
): TPoint; // ������ת��ĵ�����
var
  vRadius: Double;
begin
  vRadius := PointToPoint(mCenter, mPoint);
  mAngle := PointToAngle(mCenter, mPoint) + mAngle;
  Result.X := Round(mCenter.X + Cos(mAngle) * vRadius);
  Result.Y := Round(mCenter.Y + Sin(mAngle) * vRadius);
end; { RotatePoint }

function PointToAngle( // ��������ĽǶ�
  mOrigin: TPoint; // ԭ����
  mPoint: TPoint; // ��������
  mEccentricity: Double = 1 // ������ a/ b
): Double; // ���ظ��������ԭ����ĽǶ� // PiΪ��λ
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

function PointToPoint( // ����㵽��ľ���
  mPointA, mPointB: TPoint // �����������
): Double; // ���ص�����ľ���
begin
  Result := Sqrt(Sqr(mPointA.X - mPointB.X) + Sqr(mPointA.Y - mPointB.Y));
end; { PointDistance }

function PointToLine( // ����㵽ֱ�ߵľ���
  mPoint: TPoint; // �������
  mLineA, mLineB: TPoint // �߶ε�����
): Double; // ���ص㵽ֱ�ߵľ���
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

function PtInLine( // �жϵ��Ƿ���һ���߶���
  mPoint: TPoint; // �������
  mLineA, mLineB: TPoint; // �߶�����
  mPenWidth: Integer // ������ϸ
): Boolean; // ���ص��Ƿ����߶���
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

function PtInEllipse( // �жϵ��Ƿ�����Բ��
  mPoint: TPoint; // �������
  mEllipse: TRect // ��Բ����
): Boolean; // ���ص��Ƿ�����Բ��
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

function Equation12( //��һԪ���η���
  A, B, C: Double; //A * Sqr(X) + B * X + C = 0
  var nReturnA, nReturnB: Double // ����X������ֵ
): Integer; // ���صõ�X�ĸ��� //0��ʾû�н��
var
  vDelta: Double;
begin
  Result := 0;
  if A <> 0 then
  begin
    vDelta := Sqr(B) - 4 * A * C;
    if vDelta = 0 then // ������ȵĸ�
    begin
      nReturnA := -1 * B / (2 * A);
      nReturnB := nReturnA;
      Result := 1;
    end else if vDelta > 0 then //��������ȵĸ�
    begin
      nReturnA := (-1 * B + Sqrt(vDelta)) / (2 * A);
      nReturnB := (-1 * B - Sqrt(vDelta)) / (2 * A);
      Result := 2;
    end;
  end;
end; { Equation12 }

function InitXFrom( // ��ת����
  mCenter: TPoint; // ��������
  mAngle: Double // ��ת�Ƕ�
): TXForm; // ������һ�ε���ֵ
begin
  Result.eM11 := Cos(mAngle);
  Result.eM12 := Sin(mAngle);
  Result.eM21 := -Result.eM12;
  Result.eM22 := Result.eM11;
  Result.eDx := mCenter.X;
  Result.eDy := mCenter.Y;
end; { InitXFrom }

function MovePoint( // ƫ��һ����
  mPoint: TPoint; // ������
  DX, DY: Integer // ƫ�Ƶ�λ��
): TPoint; // ����ƫ�Ƶĵ�λ��
begin
  Result.X := mPoint.X + DX;
  Result.Y := mPoint.Y + DY;
end; { MovePoint }

function ReviseRect( // ��������
  mRect: TRect // ���β���
): TRect; // ����������ľ���
begin
  Result.Left := Min(mRect.Left, mRect.Right);
  Result.Right := Max(mRect.Left, mRect.Right);
  Result.Top := Min(mRect.Top, mRect.Bottom);
  Result.Bottom := Max(mRect.Top, mRect.Bottom);
end; { ReviseRect }

function SetToStr( // ��������ת��Ϊ�ַ���
  mTypeInfo: Pointer; // ����������Ϣָ��
  mValue: Integer; // ������ֵ
  mBrackets: Boolean = False // �Ƿ��������
): string; // ����ת������ַ���
var
  vPropInfo: TPropInfo;
  vTypeInfo: PTypeInfo;
begin
  vTypeInfo := mTypeInfo;
  vPropInfo.PropType := @vTypeInfo; // ����PropInfo�ṹ
  Result := SetToString(@vPropInfo, mValue, mBrackets)
end; { SetToStr }

function StrToSet( // �ַ���ת��Ϊ����
  mTypeInfo: Pointer; // ����������Ϣָ��
  mValue: string // �����ַ����ʽ
): Integer; // ���ؼ�����ֵ
var
  vPropInfo: TPropInfo;
  vTypeInfo: PTypeInfo;
begin
  vTypeInfo := mTypeInfo;
  vPropInfo.PropType := @vTypeInfo; // ����PropInfo�ṹ
  Result := StringToSet(@vPropInfo, mValue)
end; { StringToSet }

function AddrToNumber( //Ip��ַת��Ϊ��ֵ
  mAddr: string // Ip��ַ�ַ��� x.x.x.x
): Integer; // ����Ip��ַ����ֵ
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

function ForceForegroundWindow( // ����������Ϊ��ǰ��,����ý���
  mHandle: THandle // ������
): Boolean; // ���������Ƿ�ɹ�
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

function ProcessExists( // �жϽ����Ƿ����
  mProcessID: THandle // ����ID
): Boolean; // ���ؽ����Ƿ����
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

function ProcessPrivilege( // ���ý��̵�Ȩ��
  mProcess: THandle; // ���̾��
  mPrivilegeName: string; // Ȩ������
  mEnabled: Boolean // �Ƿ񼤻�
): Boolean; // ���������Ƿ�ɹ�
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

function ProcessFileName( // ��ȡ���̵��ļ���
  mProcessID: THandle // ����ID
): string; // ���ؽ��̵��ļ���
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

function ParentPath( // ȡ���ϼ�·��
  mPath: string // Դ·��
): string; // �����ϼ�·��
begin
  Result := ExtractFilePath(ExcludeTrailingPathDelimiter(mPath));
end; { ParentPath }

function ZoomRect( // ��������
  mRect: TRect; // ����
  mZoom: Integer // ���ŵĴ�С
): TRect; overload; // �������ź������
begin
  Result.Left := mRect.Left - mZoom;
  Result.Right := mRect.Right + mZoom;
  Result.Top := mRect.Top - mZoom;
  Result.Bottom := mRect.Bottom + mZoom;
end; { ZoomRect }

function ZoomRect( // ��������
  mRect: TRect; // ����
  mZoom: TPoint // ���ŵĴ�С
): TRect; overload; // �������ź������
begin
  Result := mRect;
  InflateRect(Result, mZoom.X, mZoom.Y);
end; { ZoomRect }

function MoveRect( // �ƶ�����
  mRect: TRect; // ����
  mOffset: TPoint // ƫ��
): TRect; // �����ƶ��������
begin
  Result := mRect;
  Types.OffsetRect(Result, mOffset.X, mOffset.Y);
end; { MoveRect }

function ReverseFile( // �ߵ��ļ�������
  mFileName: string // �ļ���
): Boolean; // ���ص��ļ��Ƿ�ɹ�
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

function ResourceExists( // ��Դ�Ƿ����
  mInstance: THandle; // ʵ�����
  mResName: string; // ��Դ��
  mResType: PChar // ��Դ����
): Boolean; // ������Դ�Ƿ����
begin
  Result := FindResource(mInstance, PChar(mResName), mResType) <> 0;
end; { ResourceExists }

function SendPlaySound( // ��������
  mFileName: string;  // �����ļ���
  mAlias: string = 'MM' // ����
): Boolean; // ���ز����Ƿ�ɹ�
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

function SignNumber( // �����ŵ�����
  mNumber: Integer // Դ����
): string; // ���ش����ŵ������ַ���
begin
  Result := Copy('+', 1, Ord(mNumber > 0)) + IntToStr(mNumber);
end; { SignNumber }

function IsFocusd( // �жϴ����Ƿ���н���
  mHandle: THandle // ������
): Boolean; // ���ش����Ƿ���н���
var
  vHandle: THandle;
begin
  vHandle := GetFocus;
  while (mHandle <> vHandle) and (vHandle <> 0) do
    vHandle := GetParent(vHandle);
  Result := mHandle = vHandle;
end; { IsFocusd }

function Stream_Read( // ����ȡ
  mStream: TStream; // Ŀ����
  mBaseAddress: Integer; // ����ַ
  mLength: Integer // ����
): string;  // �����ַ�������
begin
  Result := '';
  if not Assigned(mStream) then Exit;
  if mLength <= 0 then Exit;
  mStream.Position := mBaseAddress;
  SetLength(Result, mLength);
  SetLength(Result, mStream.Read(Result[1], mLength));
end; { Stream_Read }

function Stream_Write( // ��д��
  mStream: TStream; // Ŀ����
  mBaseAddress: Integer; // ����ַ
  mStr: string // ����
): Boolean; // ����д���Ƿ�ɹ�
begin
  Result := False;
  if not Assigned(mStream) then Exit;
  if mStr = '' then Exit;
  mStream.Position := mBaseAddress;
  mStream.Write(mStr[1], Length(mStr));
  Result := True;
end; { Stream_Write }

function Stream_Insert( // ������
  mStream: TStream; // ��
  mIndex: Integer; // ��ʼλ��
  const mBuffer; // ���������
  mLength: Integer // ���ݵĳ���
): Boolean; // ���ز����Ƿ�ɹ�
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

function Stream_Delete( // ɾ�����Ĳ���
  mStream: TStream; // ��
  mIndex: Integer; // ��ʼλ��
  mLength: Integer // ���ݵĳ���
): Boolean; // ����ɾ���Ƿ�ɹ�
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

function File_Read( // �ļ���ȡ
  mFileName: string; // �ļ���
  mBaseAddress: Integer; // ����ַ
  mLength: Integer // ����
): string; // ���ض�ȡ��������
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

function File_Write( // �ļ�д��
  mFileName: string; // �ļ���
  mBaseAddress: Integer; // ����ַ
  mStr: string // ����
): Boolean; // ����д���Ƿ�ɹ�
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

function File_SearchMark( // ���ļ�������������
  mFileName: string; // �ļ���
  mMark: string; // ������
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����������ڽ����еĵ�ַ
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

function Stream_SearchMark( // ����������������
  mStream: TStream; // Ŀ����
  mMark: string; // ������
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����������ڽ����еĵ�ַ
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

function File_SearchString( // ���ļ��������ַ���
  mFileName: string; // �ļ���
  mStr: string; // �ַ���
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����ַ������ڵ�λ��
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

function Stream_SearchString( // �����������ַ���
  mStream: TStream; // Ŀ����
  mStr: string; // �ַ���
  mStartAddress: Integer = 0; // ��ʼ��ַ
  mEndAddress: Integer = MaxInt; // ��ֹ��ַ
  mIgnoreCase: Boolean = False // �Ƿ���Դ�Сд
): Integer; // �����ַ������ڵ�λ��
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

function CompareStream( // �Ƚ��������Ƿ����
  mStream1, mStream2: TStream // ������
): Boolean; // �����������Ƿ����
var
  vBuffer1, vBuffer2: array[0..$1000 - 1] of Char;
  vLength1, vLength2: Integer;
begin
  Result := mStream1 = mStream2;
  if Result then Exit;
  if not Assigned(mStream1) or not Assigned(mStream2) then Exit; // ����һ��Ϊ��
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

function CompareFile( // �Ƚ������ļ��Ƿ����
  mFileName1, mFileName2: string // �����ļ�
): Boolean; // ���������ļ��Ƿ����
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

function Iif( // ����ȡֵ
  mBool: Boolean; // �Ƿ�ȡ��һ��ֵ
  mDataA, mDataB: Variant // �г�����ֵ
): Variant; overload; // ���mBoolΪTrue����mDataA�����򷵻�mDataB
begin
  if mBool then
    Result := mDataA
  else Result := mDataB;
end; { Iif }

function Iif( // ����ȡֵ
  mBool: Boolean; // �г�����ֵ
  mDataA, mDataB: TObject // �г�����ֵ
): TObject; overload; // ���mBoolΪTrue����mDataA�����򷵻�mDataB
begin
  if mBool then
    Result := mDataA
  else Result := mDataB;
end; { Iif }

function ExePath: string; // ���ص�ǰӦ�ó����·��
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end; { ExePath }

function SysPath: string; // ����ϵͳ���ڵ�·��
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetSystemDirectory(vBuffer, MAX_PATH);
  Result := IncludeTrailingPathDelimiter(vBuffer);
end; { SysPath }

function TempPath: string; // ������ʱ·��
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, vBuffer);
  Result := IncludeTrailingPathDelimiter(vBuffer);
end; { TempPath }

function WinPath: string; // ����Windows���ڵ�·��
var
  vBuffer: array[0..MAX_PATH] of Char;
begin
  GetWindowsDirectory(vBuffer, MAX_PATH);
  Result := IncludeTrailingPathDelimiter(vBuffer);
end; { WinPath }

function GetFileVersionInfomation( // ��ȡ�ļ��İ汾��Ϣ
  mFileName: string; // Ŀ���ļ���
  var nFileVersionInfomation: TFileVersionInfomation; // �ļ���Ϣ�ṹ
  mDefineName: string = '' // �Զ����ֶ���
): Boolean; // �����Ƿ��ȡ�ɹ�
var
  vHandle: Cardinal;
  vInfoSize: Cardinal;
  vVersionInfo: Pointer;
  vTranslation: Pointer;
  vVersionValue: string;
  vInfoPointer: Pointer;
begin
  Result := False;
  vInfoSize := GetFileVersionInfoSize(PChar(mFileName), vHandle); // ȡ���ļ��汾��Ϣ�ռ估��Դ���
  FillChar(nFileVersionInfomation, SizeOf(nFileVersionInfomation), 0); // ��ʼ��������Ϣ
  if vInfoSize <= 0 then Exit; // ��ȫ���

  GetMem(vVersionInfo, vInfoSize); // ������Դ
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
  GetModuleFileName(HInstance, vBuffer, SizeOf(vBuffer)); // ��ȡģ�������ļ�
  GetFileVersionInfomation(vBuffer, vModuleVersionInfomation); // ��ȡģ��汾��Ϣ

finalization
{$ENDIF}

end.
