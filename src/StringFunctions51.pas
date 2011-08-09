(*//
��Ŀ:LovelyComponents.StringFunctions
�汾:2.0
����:�ַ�������Ԫ
˵��:����ַ�����ĺ������з�װ
����:2004-07-03
֧��:jihu.wang#gmail.com
���:ZswangY37
//*)

//*******Begin �޸���־*******//
//2004-07-03 No.1 Zswang ����
//------------------------------------------------------------------------------
//2004-07-10 No.1 ZswangY37 ��� FileToString()��StringToFile()
//2004-07-19 No.1 ZswangY37 ��� Simplified2Traditional()��Traditional2Simplified()
//------------------------------------------------------------------------------
//2004-08-02 No.1 ZswangY37 ��� SameMark()��MarkPosition()������ıȽ�
//------------------------------------------------------------------------------
//2005-02-24 No.1 ZswangY37 �޸� FileToString()���Զ�ȡ�������е��ļ�
//----------------------------------------------------------------------5.01.001
//2006-08-10 No.1 ZswangY37 ���� unit StringFunctions50->unit StringFunctions51
//2006-08-10 No.2 ZswangY37 ���� function ListChange->function ListReplace
//2006-08-10 No.3 ZswangY37 ���� BinToHex����8��λ
//----------------------------------------------------------------------5.01.002
//2006-08-17 No.1 ZswangY37 ��� URLToString()��StringToURL()
//----------------------------------------------------------------------5.01.003
//2006-09-14 No.1 ZswangY37 ��� C�����ַ�������ExpressionToString()��StringToExpression()
//2006-09-14 No.2 Zswangy37 ��� IP��ַ������AddressToNumber()
//----------------------------------------------------------------------5.01.003
//2006-09-22 No.1 Zswangy37 ���� ����C�����ַ���\xNN��������ַ������
//*******End �޸���־*******//

{$DEFINE Unit_StringFunctions51}
//{$DEFINE USES_COMPRESSION} //�Ƿ�ʹ��ѹ������

unit StringFunctions51;

interface

uses Windows, SysUtils, Classes;

function HexToStr( //ʮ�������ַ���������ַ���
  mHex: string //ʮ�������ַ���
): string; //���ش������ַ���

function StrToHex( //�ַ��������ʮ�������ַ���
  mStr: string; //�ַ���
  mSpace: Boolean = False//�Ƿ��ÿո�ֿ�
): string; //���ش�����ʮ�������ַ���

function StrLeft( //ȡ��ߵ��ַ���
  mStr: string; //ԭ�ַ���
  mDelimiter: string; //�ָ���
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): string; //���ص�һ���ָ�����ߵ��ַ���

function StrRight( //ȡ�ұߵ��ַ���
  mStr: string; //ԭ�ַ���
  mDelimiter: string; //�ָ���
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): string; //���ص�һ���ָ����ұߵ��ַ���

function StringInvert( //�ַ������
  mStr: string; //Դ�ַ���
  mKey: string //��Կ
): string; //��������Ľ��

function RandomString( //����ַ���
  mChars: string; //�ַ�����,���������ظ����ַ�������Ƶ��
  mLength: Integer //�����ַ��ĳ���
): string; //���س���ΪmLength������ַ���

function StringSort( //�ַ�������
  mStr: string; //Դ�ַ���
  mDesc: Boolean = True //�Ƿ��������У����򰴽���
): string; //�����������ַ���

function BufferToString( //�����崦����ַ���
  const mBuffer; //��������
  mLen: Integer //�����С
): string; //���ػ�����ַ���ʽ

function StringToDisplay( //�ַ���������﷨��ʽ
  mString: string //Դ�ַ���
): string; //�����ַ������﷨��ʽ

function DisplayToString( //��ԭ�﷨��ʽ�����ַ���
  mDisplay: string //�ַ����ʽ
): string; //�����ַ����ʽ�������ַ���

function SubStrCount( //�������ַ����ĸ���
  mStr: string; //Դ�ַ���
  mSub: string; //�Ӵ�
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): Integer; //�������ַ������ֵĴ���

function StringFilter( //�ַ�������
  mStr: string; //Դ�ַ���
  mChars: TSysCharSet //�ܱ����µ��ַ�����
): string; //���ع��˺���ַ���

function Combination( //ȫ���
  mStrings: TStrings; //������õ��ַ��б�
  mStr: string; //Դ�ַ�
  mLen: Integer //Ԫ�ظ���
): Boolean; //���ش����Ƿ�ɹ�

function Collocate( //ȫ����
  mStrings: TStrings; //������õ��ַ��б�
  mStr: string //Դ�ַ���
): Boolean; //���ش����Ƿ�ɹ�

function StringToCharSet( //�ַ�������
  mString: string //Դ�ַ���
): TSysCharSet; //�����ַ����а����ļ���

function StringShuffle( //��������ַ���
  S: string //Դ�ַ���
): string; //�������к���ַ���

function StrSetExists( //�ж��Ӵ��Ƿ���ڣ��������е�˳��
  mStr: string; //Դ�ַ���
  mSubStr: string //�Ӵ�
): Boolean; //�����Ӵ��Ƿ����

function StrSetExclude( //���Ӵ��ų����������е�˳��
  mStr: string; //Դ�ַ���
  mSubStr: string //�Ӵ�
): string; //�����ų�����ַ���

function StringToFile( //�ַ�����Ϊ�ļ�
  mString: string; //Դ�ַ���
  mFileName: TFileName //�ļ���
): Boolean; //�����ַ������浽�ļ��Ƿ�ɹ�

function FileToString( //�ļ���Ϊ�ַ���
  mFileName: TFileName //�ļ���
): string; //���ش��ļ������ַ���

function BinToHex( //������ת����ʮ������
  mBin: string; //�������ַ�
  mSpace: Boolean = False //�Ƿ���Ͽո�
): string; //����ʮ�������ַ�

function HexToBin( //ʮ������ת���ɶ�����
  mHex: string; //ʮ�������ַ���
  mSpace: Boolean = False //�Ƿ���Ͽո�
): string; //���ض������ַ���

function Simplified2Traditional( //���庺��ת���ɷ��庺��
  mSimplified: string //�����ַ���
): string; //���ط����ַ��� //Win98����Ч

function Traditional2Simplified( //���庺��ת���ɼ��庺��
  mTraditional: string //�����ַ���
): string; //���ط����ַ��� //Win98����Ч

function SameMark( //�Ƚ��ַ����Ƿ����������
  mStr: string; //Դ�ַ���
  mMark: string //������
): Boolean; //�����Ƿ����������

function UpperMark( //�����봦��ɴ�д
  mMark: string //������
): string; //���ش�д��������

function MarkPosition( //�������λ��
  mStr: string; //Դ�ַ���
  mMark: string //������
): Integer; //�������������ڵ�λ��

function IntegerToBuffer( //ȡ���������ַ��洢��ʽ
  mInteger: Integer //����
): string; //�����������ַ��洢��ʽ

function BufferToInteger( //�ַ��洢��ʽ��ԭ������
  mBuffer: string //�ַ��洢��ʽ
): Integer; //�����ַ����������

function Int64ToBuffer( //ȡ��64λ�������ַ��洢��ʽ
  mInt64: Int64 //64λ����
): string; //����64λ�������ַ��洢��ʽ

function BufferToInt64( //�ַ��洢��ʽ��ԭ��64λ����
  mBuffer: string //�ַ��洢��ʽ
): Int64; //�����ַ������64λ����

function SingleToBuffer( //ȡ�õ����ȵ��ַ��洢��ʽ
  mSingle: Single //������
): string; //���ص����ȵ��ַ��洢��ʽ

function BufferToSingle( //�ַ��洢��ʽ��ԭ�ɵ�����
  mBuffer: string //�ַ��洢��ʽ
): Single; //�����ַ�����ĵ�����

function DoubleToBuffer( //ȡ��˫���ȵ��ַ��洢��ʽ
  mDouble: Double //˫����
): string; //����˫���ȵ��ַ��洢��ʽ

function BufferToDouble( //�ַ��洢��ʽ��ԭ��˫����
  mBuffer: string //�ַ��洢��ʽ
): Double; //�����ַ������˫����

function SmallintToBuffer( //ȡ��8λ�������ַ��洢��ʽ
  mSmallint: Smallint //8λ����
): string; //����8λ�������ַ��洢��ʽ

function BufferToSmallint( //�ַ��洢��ʽ��ԭ��8λ����
  mBuffer: string //�ַ��洢��ʽ
): Smallint; //�����ַ������8λ����

function GUIDToBuffer( //ȡ��GUID���ַ��洢��ʽ
  mGUID: TGUID //GUID
): string; //����GUID���ַ��洢��ʽ

function BufferToGUID( //�ַ��洢��ʽ��ԭ��GUID
  mBuffer: string //�ַ��洢��ʽ
): TGUID; //�����ַ������GUID

function WideStringToBuffer( //ȡ�ö��ֽ��ַ����ַ��洢��ʽ
  mWideString: WideString //���ֽ��ַ�
): string;  //���ض��ֽ��ַ����ַ��洢��ʽ

function BufferToWideString( //�ַ��洢��ʽ��ԭ�ɶ��ֽ��ַ�
  mBuffer: string //�ַ��洢��ʽ
): WideString; //�����ַ�����Ķ��ֽ��ַ�

function URLToString( //��ԭURL�����ַ���
  mURL: string //URL�����ַ���
): string; //���ػ�ԭ����ַ���

function StringToURL( //����ͨ�ַ��������URL��ʽ
  mStr: string //��ͨ�ַ���
): string; overload; //���ر������ַ���

function StringToURL( //��Unicode�ַ��������URL��ʽ
  mStr: WideString //Unicode�ַ���
): string; overload; //���ر������ַ���

function LeftBeeline( // ����߿�ʼֱ������ָ���ַ�����ȡ
  mStr: string; // �ַ���
  mSysCharSet: TSysCharSet // �ַ���
): string; // ������߽�ȡ�õ����ַ���

function RightBeeline( // ���ұ߿�ʼֱ������ָ���ַ�����ȡ
  mStr: string; // �ַ���
  mSysCharSet: TSysCharSet // �ַ���
): string; // �����ұ߽�ȡ�õ����ַ���

procedure SplitBracket( // ��������ַ���
  mText: string; // �ַ���
  var nLeft: string; // ��������ַ���
  var nCenter: string; // �����м��ַ���
  var nRight: string // �����ұ��ַ���
);

function FirstSpace( // ȡǰ���հ��ַ�
  mStr: string; // �ַ���
  mSpaceChar: TSysCharSet = [#9, #32] // �ַ���
): string; // ����ǰ���հ��ַ�

function StringRandom( //ȡ��ָ�����ȵ�����ַ���
  mLength: Integer; //ָ������
  mChars: string = '' //ָ���ַ�����,���Ϊ''���ʾȫ���ַ�
): string; //����ָ�����ȵ�����ַ���

{$IFDEF USES_COMPRESSION}
function StreamCompression( //����ѹ��
  mInputStream: TStream; //������ʵ��
  mOutputStream: TStream //�����ʵ��
): Integer; //����ѹ���������С

function StreamDecompression( //���Ľ�ѹ
  mInputStream: TStream; //������ʵ��
  mOutputStream: TStream //�����ʵ��
): Integer; //���ؽ�ѹ�������С

function StringCompression( //�ַ���ѹ��
  mSource: string //Դ�ַ���
): string; //����ѹ������ַ���

function StringDecompression( //�ַ�����ѹ
  mSource: string //Դ�ַ���
): string; //���ؽ�ѹ����ַ���
{$ENDIF}

function ListCount( //�õ��б��ַ����ĸ���
  mList: string; //�б��ַ���
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): Integer; //���صõ��ĸ���

function ListValue( //�õ��б��ַ�����ָ��λ�õ�ֵ
  mList: string; //Ԫ�����
  mIndex: Integer; //Ԫ��λ��
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //�����б��ַ�����ָ��λ�õ�ֵ

function ListReplace( //�滻�б��ַ�����ֵ
  mList: string; //�б��ַ���
  mIndex: Integer; //�滻��Ԫ�����
  mValue: string; //��Ҫ�滻��ֵ
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //�����滻��Ľ��

function ListInsert( //���б��ַ�������Ԫ��
  mList: string; //�б��ַ���
  mIndex: Integer; //�����Ԫ�����
  mValue: string; //�����ֵ
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //���ز����Ľ��

function ListDelete( //ɾ���б��ַ�����Ԫ��
  mList: string; //�б��ַ���
  mIndex: Integer; //ɾ����Ԫ�����
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //����ɾ����Ľ��

function ListCopy( //��ȡ�б��ַ�����һ��
  mList: string; //�б��ַ���
  mIndex: Integer; //��ʼ��Ԫ�����
  mLength: Integer; //��ȡ�ĸ���
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //���ؽ�ȡ�Ľ��

function UnicodeToMBCS( //��Unicode�����ַ���ת���ɶ��ֽ��ַ���
  mCodePage: UINT; //���ձ�ҳ��
  mUnicode: WideString //Unicode�����ַ���
): string; //���ش������ַ���

function MBCSToUnicode( //�����ֽ��ַ���ת����Unicode�����ַ���
  mCodePage: UINT; //���ձ�ҳ��
  mMBCS: string //���ֽ��ַ���
): WideString; //���ش������ַ���

function UnicodeToGB2312( //��Unicode�����ַ���ת����GB2312�ֱ������
  mUnicode: string //Unicode�������
): WideString; //���ش������ַ���

function GB2312ToUnicode( //��GB2312�����ַ���ת������Unicode�������
  mGB2312: string //GB2312�����ַ���
): WideString; //���ش������ַ���

function UnicodeToBIG5( //��Unicode�����ַ���ת����BIG5�ֱ������
  mUnicode: WideString //Unicode�����ַ���
): string; //���ش������ַ���

function BIG5ToUnicode( //��BIG5�����ַ���ת������Unicode�������
  mBIG5: string //BIG5�����ַ���
): WideString; //���ش������ַ���

function AddressToNumber( // IP��ַ���ʽת��Ϊ��ֵ
  mAddress: string  // IP��ַ���ʽ
): Longword; // ����IP��ַת�������ֵ

function IntToOct( // ����ת��Ϊ�˽����ַ���
  mInt: Integer // ����
): string; // ����ת������ַ���

function OctToIntDef( // �˽���ת��Ϊ����
  mOct: string; // �˽����ַ���
  mDefault: Integer // ���ת�����ִ����򷵻ظ�Ĭ����
): Integer; // ���ذ˽���ת��������

function ExpressionToString( // C�����ַ����ʽת��Ϊ��ͨ�ַ���
  mExpression: string // C�����ַ����ʽ
): string; // ����ת�������ͨ�ַ���

function StringToExpression( // ���ַ���ת��ΪC�����ַ����ʽ
  mStr: string // ��ͨ�ַ���
): string; // ����ת�����C�����ַ����ʽ

function ExtractFileName( // ��ȡ�ļ���
  mFileName: string // �����ļ���
): string; // �����ļ�������

implementation

uses Math{$IFDEF USES_COMPRESSION}, ZLib20{$ENDIF};

function ExtractFileName( // ��ȡ�ļ���
  mFileName: string // �����ļ���
): string; // �����ļ�������
var
  I: Integer;
begin
  I := LastDelimiter('/' + PathDelim + DriveDelim, mFileName);
  Result := Copy(mFileName, I + 1, MaxInt);
end; { ExtractFileName }

function IntToOct( // ����ת��Ϊ�˽����ַ���
  mInt: Integer // ����
): string; // ����ת������ַ���
begin
  if mInt = 0 then
    Result := '0'
  else Result := '';
  while Longword(mInt) > 0 do
  begin
    Result := IntToStr(Longword(mInt) mod 8) + Result;
    Longword(mInt) := Longword(mInt) div 8;
  end;
end; { IntToOct }

{$Q-,R-}
function OctToIntDef( // �˽���ת��Ϊ����
  mOct: string; // �˽����ַ���
  mDefault: Integer // ���ת�����ִ����򷵻ظ�Ĭ����
): Integer; // ���ذ˽���ת��������
var
  I: Integer;
begin
  if mOct = '' then
  begin
    Result := mDefault;
    Exit;
  end;
  Result := 0;
  for I := 1 to Length(mOct) do
    case mOct[I] of
      '0'..'7':
        Result := Result * 8 + (Ord(mOct[I]) - Ord('0'));
    else
      begin
        Result := mDefault;
        Exit;
      end;
    end;
end; { OctToIntDef }
{$Q+,R+}

function ExpressionToString( // C�����ַ����ʽת��Ϊ��ͨ�ַ���
  mExpression: string // C�����ַ����ʽ
): string; // ����ת�������ͨ�ַ���
var
  I, J, L: Integer;
  C: Char;
  T: string;
begin
  Result := '';
  if Copy(mExpression, 1, 1) <> '"' then Exit;
  I := 2;
  L := Length(mExpression);
  while I <= L do
  begin
    case mExpression[I] of
      '"': Exit;
      '\':
      begin
        C:= (Copy(mExpression, I + 1, 1) + '\')[1];
        case C of
          'a': Result := Result + #7;
          'b': Result := Result + #8;
          't': Result := Result + #9;
          'n': Result := Result + #10;
          'v': Result := Result + #11;
          'f': Result := Result + #12;
          'r': Result := Result + #13;
          '"': Result := Result + '"';
          'x':
          begin // ʮ������
            T := '';
            for J := I + 2 to L do
              case mExpression[J] of
                '0'..'9', 'a'..'f', 'A'..'F': T := T + mExpression[J];
              else Break;
              end;
            Result := Result + Char(StrToIntDef('$' + T, 0));
            Inc(I, Length(T));
          end;
          '0'..'7': // �˽���
          begin
            T := '';
            for J := I + 1 to L do
              case mExpression[J] of
                '0'..'7': T := T + mExpression[J];
              else Break;
              end;
            Result := Result + Char(OctToIntDef(T, 0));
            Inc(I, Length(T) - 1);
          end;
        else Result := Result + C;
        end;
        Inc(I, 2);
      end else
      begin
        Result := Result + Copy(mExpression, I, 1);
        Inc(I);
      end;
    end;
  end;
end; { ExpressionToString }

function StringToExpression( // ���ַ���ת��ΪC�����ַ����ʽ                   //2006-09-22 No.1 ZswangY37
  mStr: string // ��ͨ�ַ���
): string; // ����ת�����C�����ַ����ʽ
var
  I: Integer;
  vHex: Boolean; // ǰ���Ƿ���ֹ�ʮ������
begin
  Result := '"';
  vHex := False;
  for I := 1 to Length(mStr) do
  begin
    case mStr[I] of
      #7: Result := Result + '\a';
      #8: Result := Result + '\b';
      #9: Result := Result + '\t';
      #10: Result := Result + '\n';
      #11: Result := Result + '\v';
      #12: Result := Result + '\f';
      #13: Result := Result + '\r';
      '"': Result := Result + '\"';
      #35..#127:
      begin
        if vHex then
          case mStr[I] of
            '0'..'9', 'a'..'f', 'A'..'F':
            begin
              Result := Result + Format('\x%.2x', [Ord(mStr[I])]);
              Continue;
            end;
          end;
        Result := Result + mStr[I];
      end
    else
      begin
        vHex := True;
        Result := Result + Format('\x%.2x', [Ord(mStr[I])]);
        Continue;
      end;
    end;
    vHex := False;
  end;
  Result := Result + '"';
end; { StringToExpression }

function AddressToNumber( // IP��ַ���ʽת��Ϊ��ֵ
  mAddress: string  // IP��ַ���ʽ
): Longword; // ����IP��ַת�������ֵ
var
  I, J: Integer;
begin
  mAddress := mAddress + '.';
  for I := 0 to 3 do
  begin
    J := Pos('.', mAddress);
    PChar(@Result)[I] := Chr(StrToIntDef(Copy(mAddress, 1, J - 1), 0));
    Delete(mAddress, 1, J);
  end;
end; { AddressToNumber }

function UnicodeToMBCS( //��Unicode�����ַ���ת���ɶ��ֽ��ַ���
  mCodePage: UINT; //���ձ�ҳ��
  mUnicode: WideString //Unicode�����ַ���
): string; //���ش������ַ���
var
  L: Integer;
begin
  L := WideCharToMultiByte(
    mCodePage, 0, PWideChar(mUnicode), -1, nil, 0, nil, nil);
  SetLength(Result, L);
  if L <= 0 then Exit;
  WideCharToMultiByte(mCodePage, 0,
    PWideChar(mUnicode), -1, @Result[1], L, nil, nil);
end; { UnicodeToMBCS }

function UnicodeToGB2312( //��Unicode�����ַ���ת����GB2312�ֱ������
  mUnicode: string //Unicode�������
): WideString; //���ش������ַ���
begin
  Result := UnicodeToMBCS(936, mUnicode);
end; { UnicodeToGB2312 }

function UnicodeToBIG5( //��Unicode�����ַ���ת����BIG5�ֱ������
  mUnicode: WideString //Unicode�����ַ���
): string; //���ش������ַ���
begin
  Result := UnicodeToMBCS(950, mUnicode);
end; { UnicodeToBIG5 }

function MBCSToUnicode( //�����ֽ��ַ���ת����Unicode�����ַ���
  mCodePage: UINT; //���ձ�ҳ��
  mMBCS: string //���ֽ��ַ���
): WideString; //���ش������ַ���
var
  L: Integer;
begin
  L := MultiByteToWideChar(mCodePage, 0, PChar(mMBCS), -1, nil, 0);
  SetLength(Result, L);
  if L <= 0 then Exit;
  MultiByteToWideChar(mCodePage, 0, PChar(mMBCS), -1, @Result[1], L);
end; { MBCSToUnicode }

function GB2312ToUnicode( //��GB2312�����ַ���ת������Unicode�������
  mGB2312: string //GB2312�����ַ���
): WideString; //���ش������ַ���
begin
  Result := MBCSToUnicode(936, mGB2312);
end; { GB2312ToUnicode }

function BIG5ToUnicode( //��BIG5�����ַ���ת������Unicode�������
  mBIG5: string //BIG5�����ַ���
): WideString; //���ش������ַ���
begin
  Result := MBCSToUnicode(950, mBIG5);
end; { BIG5ToUnicode }

function ListCount( //�õ��б��ַ����ĸ���
  mList: string; //�б��ַ���
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): Integer; //���صõ��ĸ���
var
  I, L: Integer;
begin
  Result := 0;
  if mList = '' then Exit;
  L := Length(mList);
  I := Pos(mDelimiter, mList);
  while I > 0 do
  begin
    mList := Copy(mList, I + Length(mDelimiter), L);
    I := Pos(mDelimiter, mList);
    Inc(Result);
  end;
  Inc(Result);
end; { ListCount }

function ListValue( //�õ��б��ַ�����ָ��λ�õ�ֵ
  mList: string; //Ԫ�����
  mIndex: Integer; //Ԫ��λ��
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //�����б��ַ�����ָ��λ�õ�ֵ
var
  I, L, K: Integer;
begin
  L := Length(mList);
  I := Pos(mDelimiter, mList);
  K := 0;
  Result := '';
  while (I > 0) and (K <> mIndex) do
  begin
    mList := Copy(mList, I + Length(mDelimiter), L);
    I := Pos(mDelimiter, mList);
    Inc(K);
  end;
  if K = mIndex then Result := StrLeft(mList + mDelimiter, mDelimiter);
end; { ListValue }

function ListCopy( //��ȡ�б��ַ�����һ��
  mList: string; //�б��ַ���
  mIndex: Integer; //��ʼ��Ԫ�����
  mLength: Integer; //��ȡ�ĸ���
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //���ؽ�ȡ�Ľ��
var
  I: Integer;
begin
  Result := '';
  if mLength = MaxInt then mLength := mLength - mIndex;
  for I := mIndex to Min(mIndex + mLength, ListCount(mList, mDelimiter)) - 1 do
    Result := Result + mDelimiter + ListValue(mList, I, mDelimiter);
  Delete(Result, 1, Length(mDelimiter));
end; { ListCopy }

function ListReplace( //�滻�б��ַ�����ֵ
  mList: string; //�б��ַ���
  mIndex: Integer; //�滻��Ԫ�����
  mValue: string; //��Ҫ�滻��ֵ
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //�����滻��Ľ��
var
  I: Integer;
begin
  Result := '';
  for I := 0 to ListCount(mList, mDelimiter) - 1 do 
    if I = mIndex then
      Result := Result + mDelimiter + mValue
    else Result := Result + mDelimiter + ListValue(mList, I, mDelimiter);
  Delete(Result, 1, Length(mDelimiter));
end; { ListReplace }

function ListInsert( //���б��ַ�������Ԫ��
  mList: string; //�б��ַ���
  mIndex: Integer; //�����Ԫ�����
  mValue: string; //�����ֵ
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //���ز����Ľ��
var
  I: Integer;
begin
  Result := '';
  for I := 0 to ListCount(mList, mDelimiter) - 1 do
  begin
    if I = mIndex then Result := Result + mDelimiter + mValue;
    Result := Result + mDelimiter + ListValue(mList, I, mDelimiter);
  end;
  Delete(Result, 1, Length(mDelimiter));
end; { ListInsert }

function ListDelete( //ɾ���б��ַ�����Ԫ��
  mList: string; //�б��ַ���
  mIndex: Integer; //ɾ����Ԫ�����
  mDelimiter: string = ',' //Ԫ�ؼ�ļ������
): string; //����ɾ����Ľ��
var
  I: Integer;
begin
  Result := '';
  for I := 0 to ListCount(mList, mDelimiter) - 1 do
    if I <> mIndex then
      Result := Result + mDelimiter + ListValue(mList, I, mDelimiter);
  Delete(Result, 1, Length(mDelimiter));
end; { ListDelete }

{$IFDEF USES_COMPRESSION}
const cBufferSize = $4096;

function StreamCompression( //����ѹ��
  mInputStream: TStream; //������ʵ��
  mOutputStream: TStream //�����ʵ��
): Integer; //����ѹ���������С
var
  I: Integer;
  vBuffer: array[0..cBufferSize]of Char;
begin
  Result := -1;
  if not (Assigned(mInputStream) and Assigned(mOutputStream)) then Exit;
  with TCompressionStream.Create(clMax, mOutputStream) do try
    for I := 1 to mInputStream.Size div cBufferSize do
    begin
      mInputStream.Read(vBuffer, cBufferSize);
      Write(vBuffer, cBufferSize);
    end;
    I := mInputStream.Size mod cBufferSize;
    if I > 0 then
    begin
      mInputStream.Read(vBuffer, I);
      Write(vBuffer, I);
    end;
  finally
    Free;
  end;
end; { StreamCompression }

function StreamDecompression( //���Ľ�ѹ
  mInputStream: TStream; //������ʵ��
  mOutputStream: TStream //�����ʵ��
): Integer; //���ؽ�ѹ�������С
var
  vBuffer: array[0..cBufferSize]of Char;
  I: Integer;
begin
  Result := -1;
  if not (Assigned(mInputStream) and Assigned(mOutputStream)) then Exit;
  with TDecompressionStream.Create(mInputStream) do try
    repeat
      I := Read(vBuffer, cBufferSize);
      mOutputStream.Write(vBuffer, I);
    until I = 0;
    Result := mOutputStream.Size;
  finally
    Free;
  end;
end; { StreamDecompression }

function StringCompression( //�ַ���ѹ��
  mSource: string //Դ�ַ���
): string; //����ѹ������ַ���
var
  vInputStream: TStringStream;
  vOutputStream: TStringStream;
begin
  vInputStream := TStringStream.Create(mSource);
  vOutputStream := TStringStream.Create('');
  try
    StreamCompression(vInputStream, vOutputStream);
    vOutputStream.Position := 0;
    SetLength(Result, vOutputStream.Size);
    vOutputStream.Read(Result[1], vOutputStream.Size);
  finally
    vInputStream.Free;
    vOutputStream.Free;
  end;
end; { StringCompression }

function StringDecompression( //�ַ�����ѹ
  mSource: string //Դ�ַ���
): string; //���ؽ�ѹ����ַ���
var
  vInputStream: TStringStream;
  vOutputStream: TStringStream;
begin
  vInputStream := TStringStream.Create(mSource);
  vOutputStream := TStringStream.Create('');
  try
    StreamDecompression(vInputStream, vOutputStream);
    vOutputStream.Position := 0;
    SetLength(Result, vOutputStream.Size);
    vOutputStream.Read(Result[1], vOutputStream.Size);
  finally
    vInputStream.Free;
    vOutputStream.Free;
  end;
end; { StringDecompression }
{$ENDIF}

function StringRandom( //ȡ��ָ�����ȵ�����ַ���
  mLength: Integer; //ָ������
  mChars: string = '' //ָ���ַ�����
): string; //����ָ�����ȵ�����ַ���
var
  I: Integer;
  L: Integer;
begin
  Result := '';
  L := Length(mChars);
  if L <= 0 then
    for I := 1 to mLength do Result := Result + Char(Random(256))
  else for I := 1 to mLength do Result := Result + mChars[Random(L) + 1];
end; { StringRandom }

function HexToStr( //ʮ�������ַ���������ַ���
  mHex: string //ʮ�������ַ���
): string; //���ش������ַ���
var
  I: Integer;
begin
  Result := '';
  mHex := StringFilter(mHex, ['0'..'9', 'a'..'z', 'A'..'Z']);
  for I := 1 to Length(mHex) div 2 do
    Result := Result + Chr(StrToIntDef('$' + Copy(mHex, I * 2 - 1, 2), 0));
end; { HexToStr }

function StrToHex( //�ַ��������ʮ�������ַ���
  mStr: string; //�ַ���
  mSpace: Boolean = False //�Ƿ��ÿո�ֿ�
): string; //���ش�����ʮ�������ַ���
const
  cSpaceStr: array[Boolean] of string = ('', #32);
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    Result := Format('%s%s%.2x', [Result, cSpaceStr[mSpace], Ord(mStr[I])]);
  if mSpace then Delete(Result, 1, 1);
end; { StrToHex }

function StrLeft( //ȡ��ߵ��ַ���
  mStr: string; //ԭ�ַ���
  mDelimiter: string; //�ָ���
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): string; //���ص�һ���ָ�����ߵ��ַ���
begin
  if mIgnoreCase then
    Result := Copy(mStr, 1, Pos(UpperCase(mDelimiter), UpperCase(mStr)) - 1)
  else Result := Copy(mStr, 1, Pos(mDelimiter, mStr) - 1);
end; { StrLeft }

function StrRight( //ȡ�ұߵ��ַ���
  mStr: string; //ԭ�ַ���
  mDelimiter: string; //�ָ���
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): string; //���ص�һ���ָ����ұߵ��ַ���
begin
  if mIgnoreCase then
  begin
    if Pos(UpperCase(mDelimiter), UpperCase(mStr)) > 0 then
      Result := Copy(mStr, Pos(UpperCase(mDelimiter), UpperCase(mStr)) +
        Length(mDelimiter), MaxInt)
    else Result := '';
  end else
  begin
    if Pos(mDelimiter, mStr) > 0 then
      Result := Copy(mStr, Pos(mDelimiter, mStr) + Length(mDelimiter), MaxInt)
    else Result := '';
  end;
end; { StrRight }

function StringInvert( //�ַ������
  mStr: string; //Դ�ַ���
  mKey: string //��Կ
): string; //��������Ľ��
var
  I, J: Integer;
begin
  J := 1;
  if mKey = '' then
  begin
    Result := mStr;
    Exit;
  end else Result := '';
  for I := 1 to Length(mStr) do
  begin
    Result := Result + Char(Ord(mStr[I]) xor Ord(mKey[J]));
    if J + 1 <= Length(mKey) then
      Inc(J)
    else J := 1;
  end;
end; { StringInvert }

function RandomString( //����ַ���
  mChars: string; //�ַ�����,���������ظ����ַ�������Ƶ��
  mLength: Integer //�����ַ��ĳ���
): string; //���س���ΪmLength������ַ���
var
  I: Integer;
begin
  Result := '';
  if mChars = '' then Exit;
  for I := 1 to mLength do
    Result := Result + mChars[Random(Length(mChars)) + 1];
end; { RandomString }

function StringSort( //�ַ�������
  mStr: string; //Դ�ַ���
  mDesc: Boolean = True //�Ƿ��������У����򰴽���
): string; //�����������ַ���
var
  I, J: Integer;
  T: Char;
begin
  for I := 1 to Length(mStr) - 1 do
    for J := I + 1 to Length(mStr) do
      if (mDesc and (mStr[I] > mStr[J])) or
        (not mDesc and (mStr[I] < mStr[J])) then
      begin
        T := mStr[I];
        mStr[I] := mStr[J];
        mStr[J] := T;
      end;
  Result := mStr;
end; { StringSort }

function BufferToString( //�����崦����ַ���
  const mBuffer; //��������
  mLen: Integer //�����С
): string; //���ػ�����ַ���ʽ
begin
  SetLength(Result, mLen);
  Move(mBuffer, Result[1], mLen);
end; { BufferToString }

function StringToDisplay( //�ַ���������﷨��ʽ
  mString: string //Դ�ַ���
): string; //�����ַ������﷨��ʽ
var
  I: Integer;
  S: string;
begin
  Result := '';
  S := '';
  for I := 1 to Length(mString) do
    if mString[I] in [#32..#127] then
      S := S + mString[I]
    else
    begin
      if S <> '' then
      begin
        Result := Result + QuotedStr(S);
        S := '';
      end;
      Result := Result + Format('#$%x', [Ord(mString[I])]);
    end;
  if S <> '' then Result := Result + QuotedStr(S);
  if Result = '' then Result := QuotedStr('');
end; { StringToDisplay }

function DisplayToString( //��ԭ�﷨��ʽ�����ַ���
  mDisplay: string //�ַ����ʽ
): string; //�����ַ����ʽ�������ַ���
var
  I: Integer;
  S: string;
  B: Boolean;
begin
  Result := '';
  B := False;
  mDisplay := mDisplay;
  for I := 1 to Length(mDisplay) do
    if B then
      case mDisplay[I] of
        '''':
        begin
          if S <> '' then
            Result := Result + StringReplace(S, '''''', '''', [rfReplaceAll]);
          if Copy(mDisplay, I + 1, 1) = '''' then
            Result := Result + '''';
          S := '';
          B := False;
        end;
      else S := S + mDisplay[I];
      end
    else
      case mDisplay[I] of
        '#', '''':
        begin
          if S <> '' then Result := Result + Chr(StrToIntDef(S, 0));
          S := '';
          B := mDisplay[I] = '''';
        end;
        '$', '0'..'9', 'a'..'f', 'A'..'F': S := S + mDisplay[I];
      end;
  if not B and (S <> '') then
    Result := Result + Chr(StrToIntDef(S, 0));
end; { DisplayToString }

function SubStrCount( //�������ַ����ĸ���
  mStr: string; //Դ�ַ���
  mSub: string; //�Ӵ�
  mIgnoreCase: Boolean = False //�Ƿ���Դ�Сд
): Integer; //�������ַ������ֵĴ���
var
  vReplaceFlags: TReplaceFlags;
begin
  vReplaceFlags := [rfReplaceAll];
  if mIgnoreCase then Include(vReplaceFlags, rfIgnoreCase);
  Result := (Length(mStr) - Length(
    StringReplace(mStr, mSub, '', vReplaceFlags))) div Length(mSub);
end; { SubStrCount }

function StringFilter( //�ַ�������
  mStr: string; //Դ�ַ���
  mChars: TSysCharSet //�ܱ����µ��ַ�����
): string; //���ع��˺���ַ���
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    if mStr[I] in mChars then
      Result := Result + mStr[I];
end; { StringFilter }

function Combination( //ȫ���
  mStrings: TStrings; //������õ��ַ��б�
  mStr: string; //Դ�ַ�
  mLen: Integer //Ԫ�ظ���
): Boolean; //���ش����Ƿ�ɹ�
  procedure pCombination( //ȫ����ӹ���
    mLeft: string; //���е���ߵ��ַ�
    mRight: string //���е��ұߵ��ַ�
  );
  var
    I: Integer;
  begin
    if Length(mLeft) >= mLen then
      mStrings.Add(mLeft)
    else for I := 1 to Length(mRight) do
      pCombination(mLeft + Copy(mRight, I, 1), Copy(mRight, I + 1, MaxInt));
  end;
begin
  Result := False;
  if not Assigned(mStrings) then Exit;
  mStrings.BeginUpdate;
  try
    mStrings.Clear;
    pCombination('', mStr);
  finally
    mStrings.EndUpdate;
  end;
  Result := True;
end; { Combination }

function Collocate( //ȫ����
  mStrings: TStrings; //������õ��ַ��б�
  mStr: string //Դ�ַ���
): Boolean; //���ش����Ƿ�ɹ�
  procedure pCollocate( //ȫ�����ӹ���
    mLeft: string; //���е���ߵ��ַ�
    mRight: string //���е��ұߵ��ַ�
  );
  var
    I, L: Integer;
  begin
    L := Length(mLeft);
    if L = 0 then
      mStrings.Add(mRight)
    else
      for I := 1 to L do
        pCollocate(
          Copy(mLeft, 1, I - 1) + Copy(mLeft, I + 1, MaxInt),
          mRight + mLeft[I]
        );
  end;
begin
  Result := False;
  if not Assigned(mStrings) then Exit;
  mStrings.BeginUpdate;
  try
    mStrings.Clear;
    pCollocate(mStr, '');
  finally
    mStrings.EndUpdate;
  end;
  Result := True;
end; { Collocate }

function StringToCharSet( //�ַ�������
  mString: string //Դ�ַ���
): TSysCharSet; //�����ַ����а����ļ���
var
  I: Integer;
begin
  Result := [];
  for I := 1 to Length(mString) do Include(Result, mString[I]);
end; { StringToCharSet }

function StringShuffle( //��������ַ���
  S: string //Դ�ַ���
): string; //�������к���ַ���
var
  I: Integer;
begin
  Result := '';
  while S <> '' do
  begin
    I := Random(Length(S)) + 1;
    Result := Result + S[I];
    Delete(S, I, 1);
  end;
end; { StringShuffle }

function StrSetExists( //�ж��Ӵ��Ƿ���ڣ��������е�˳��
  mStr: string; //Դ�ַ���
  mSubStr: string //�Ӵ�
): Boolean; //�����Ӵ��Ƿ����
//'aa','aca'=True
//'ab','acb'=True
//'aa','acb'=False
var
  I, J: Integer;
begin
  Result := False;
  for I := 1 to Length(mSubStr) do begin
    J := Pos(mSubStr[I], mStr);
    if J <= 0 then Exit;
    Delete(mStr, J, 1);
  end;
  Result := True;
end; { StrSetExists }

function StrSetExclude( //���Ӵ��ų����������е�˳��
  mStr: string; //Դ�ַ���
  mSubStr: string //�Ӵ�
): string; //�����ų�����ַ���
var
  I, J: Integer;
begin
  Result := mStr;
  for I := 1 to Length(mSubStr) do begin
    J := Pos(mSubStr[I], Result);
    if J <= 0 then Continue;
    Delete(Result, J, 1);
  end;
end; { StrSetExclude }

function StringToFile( //�ַ�����Ϊ�ļ�
  mString: string; //Դ�ַ���
  mFileName: TFileName //�ļ���
): Boolean; //�����ַ������浽�ļ��Ƿ�ɹ�
begin
  Result := True;
  try
    if mString <> '' then
      with TFileStream.Create(mFileName, fmCreate) do try
        Write(mString[1], Length(mString));
      finally
        Free;
      end;
  except
    Result := False;
  end;
end; { StringToFile }

function FileToString( //�ļ���Ϊ�ַ���
  mFileName: TFileName //�ļ���
): string; //���ش��ļ������ַ���
begin
  Result := '';
  try
    if FileExists(mFileName) then
      with TFileStream.Create(mFileName, fmShareDenyNone) do try                //2005-02-24 Zswang No.1
        SetLength(Result, Size);
        Read(Result[1], Size);
      finally
        Free;
      end;
  except
    Result := '';
  end;
end; { FileToString }

const
  cHexBinStrings: array[0..15] of string = //ʮ�����ƺͶ����ƶ��ձ�
(
'0000', '0001', '0010', '0011',
'0100', '0101', '0110', '0111',
'1000', '1001', '1010', '1011',
'1100', '1101', '1110', '1111'
);

function BinToHex( //������ת����ʮ������
  mBin: string; //�������ַ�
  mSpace: Boolean = False //�Ƿ���Ͽո�
): string; //����ʮ�������ַ�
var
  I, L: Integer;
  S: string;
  B: Boolean;
begin
  Result := '';
  mBin := StringFilter(mBin, ['0', '1']);
  if mBin = '' then Exit;
  if Length(mBin) mod 8 > 0 then
    mBin := StringOfChar('0', 8 - Length(mBin) mod 8) + mBin;
  L := Length(mBin);
  B := True;
  while L >= 4 do
  begin
    S := Copy(mBin, L - 3, MaxInt);
    Delete(mBin, L - 3, MaxInt);
    for I := Low(cHexBinStrings) to High(cHexBinStrings) do
      if S = cHexBinStrings[I] then
      begin
        if mSpace then
        begin
          if B then Result := #32 + Result;
          B := not B;
        end;
        Result := IntToHex(I, 1) + Result;
        Break;
      end;
    L := Length(mBin);
  end;
  if mSpace and B then Delete(Result, Length(Result), 1);
end; { BinToHex }

function HexToBin( //ʮ������ת���ɶ�����
  mHex: string; //ʮ�������ַ���
  mSpace: Boolean = False //�Ƿ���Ͽո�
): string; //���ض������ַ���
var
  I: Integer;
  B: Boolean;
begin
  Result := '';
  mHex := StringFilter(mHex, ['0'..'9', 'a'..'f', 'A'..'F']);
  B := True;
  for I := 1 to Length(mHex) do
  begin
    if mSpace then
    begin
      if B then Result := Result + #32;
      B := not B;
    end;
    Result := Result + cHexBinStrings[StrToIntDef('$' + mHex[I], 0)];
  end;
  if mSpace and B then Delete(Result, 1, 1);
end; { HexToBin }

function Simplified2Traditional( //���庺��ת���ɷ��庺��
  mSimplified: string //�����ַ���
): string; //���ط����ַ��� //Win98����Ч
var
  L: Integer;
begin
  L := Length(mSimplified);
  SetLength(Result, L);
  LCMapString(GetUserDefaultLCID,
    LCMAP_TRADITIONAL_CHINESE, PChar(mSimplified), L, @Result[1], L);
end; { Simplified2Traditional }

function Traditional2Simplified( //���庺��ת���ɼ��庺��
  mTraditional: string //�����ַ���
): string; //���ط����ַ��� //Win98����Ч
var
  L: Integer;
begin
  L := Length(mTraditional);
  SetLength(Result, L);
  LCMapString(GetUserDefaultLCID,
    LCMAP_SIMPLIFIED_CHINESE, PChar(mTraditional), L, @Result[1], L);
end; { Traditional2Simplified }

function SameMark( //�Ƚ��ַ����Ƿ����������
  mStr: string; //Դ�ַ���
  mMark: string //������
): Boolean; //�����Ƿ����������
var
  I: Integer;
begin
  Result := False;
  mMark := StringReplace(mMark, #32, '', [rfReplaceAll]);
  if Length(mStr) <> Length(mMark) div 2 then Exit;
  I := Pos('%%', mMark);
  while I > 0 do
  begin
    Delete(mMark, I, 2);
    Delete(mStr, I div 2 + 1, 1);
    I := Pos('%%', mMark);
  end;
  Result := mStr = HexToStr(mMark);
end; { SameMark }

function UpperMark( //�����봦��ɴ�д
  mMark: string //������
): string; //���ش�д��������
var
  I: Integer;
begin
  I := Pos('%%', mMark);
  while I > 0 do
  begin
    Result := Result + StrToHex(UpperCase(
      HexToStr(Copy(mMark, 1, I - 1)))) + '%%';
    Delete(mMark, 1, I + 1);
    I := Pos('%%', mMark);
  end;
  Result := Result + StrToHex(UpperCase(HexToStr(mMark)));
end; { UpperMark }

function MarkPosition( //�������λ��
  mStr: string; //Դ�ַ���
  mMark: string //������
): Integer; //�������������ڵ�λ��
var
  I, J, L: Integer;
  vLongMarks: string;
  vLongPos: Integer;
begin
  mMark := StringReplace(mMark, #32, '', [rfReplaceAll]);
  L := Length(mMark) div 2;
  if Pos('%%', mMark) <= 0 then //���û������
  begin
    Result := Pos(HexToStr(mMark), mStr);
    Exit;
  end;
  if StringReplace(mMark, '%', '', [rfReplaceAll]) = '' then
  begin
    Result := 1;
    Exit;
  end;
  ///////Begin ɨ�����һ��������
  Result := 0;
  J := 0;
  vLongPos := 0;
  vLongMarks := '';
  with TStringList.Create do try
    Delimiter := '%';
    DelimitedText := StringReplace(mMark, '%%', '%', [rfReplaceAll]);
    for I := 0 to Count - 1 do
    begin
      if Length(vLongMarks) < Length(Strings[I]) div 2 then
      begin
        vLongMarks := HexToStr(Strings[I]);
        vLongPos := J;
      end;
      Inc(J, Length(Strings[I]) div 2 + 1);
    end;
  finally
    Free;
  end;
  ///////End ɨ�����һ��������

  ///////Begin ��������������Ƚ�
  J := 0;
  I := Pos(vLongMarks, mStr);
  while I - vLongPos > 0 do
  begin
    if SameMark(Copy(mStr, I - vLongPos, L), mMark) then
    begin
      Result := I - vLongPos + J;
      Break;
    end;
    Delete(mStr, 1, I - vLongPos + L);
    Inc(J, I - vLongPos + L);
    I := Pos(vLongMarks, mStr);
  end;
  ///////End ��������������Ƚ�
end; { MarkPosition }

function IntegerToBuffer( //ȡ���������ַ��洢��ʽ
  mInteger: Integer //����
): string; //�����������ַ��洢��ʽ
begin
  SetLength(Result, SizeOf(mInteger));
  Move(mInteger, Result[1], SizeOf(mInteger));
end; { IntegerToBuffer }

function BufferToInteger( //�ַ��洢��ʽ��ԭ������
  mBuffer: string //�ַ��洢��ʽ
): Integer; //�����ַ����������
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToInteger }

function Int64ToBuffer( //ȡ��64λ�������ַ��洢��ʽ
  mInt64: Int64 //64λ����
): string; //����64λ�������ַ��洢��ʽ
begin
  SetLength(Result, SizeOf(mInt64));
  Move(mInt64, Result[1], SizeOf(mInt64));
end; { Int64ToBuffer }

function BufferToInt64( //�ַ��洢��ʽ��ԭ��64λ����
  mBuffer: string //�ַ��洢��ʽ
): Int64; //�����ַ������64λ����
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToInt64 }

function SingleToBuffer( //ȡ�õ����ȵ��ַ��洢��ʽ
  mSingle: Single //������
): string; //���ص����ȵ��ַ��洢��ʽ
begin
  SetLength(Result, SizeOf(mSingle));
  Move(mSingle, Result[1], SizeOf(mSingle));
end; { SingleToBuffer }

function BufferToSingle( //�ַ��洢��ʽ��ԭ�ɵ�����
  mBuffer: string //�ַ��洢��ʽ
): Single; //�����ַ�����ĵ�����
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToSingle }

function DoubleToBuffer( //ȡ��˫���ȵ��ַ��洢��ʽ
  mDouble: Double //˫����
): string; //����˫���ȵ��ַ��洢��ʽ
begin
  SetLength(Result, SizeOf(mDouble));
  Move(mDouble, Result[1], SizeOf(mDouble));
end; { DoubleToBuffer }

function BufferToDouble( //�ַ��洢��ʽ��ԭ��˫����
  mBuffer: string //�ַ��洢��ʽ
): Double; //�����ַ������˫����
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToDouble }

function SmallintToBuffer( //ȡ��8λ�������ַ��洢��ʽ
  mSmallint: Smallint //8λ����
): string; //����8λ�������ַ��洢��ʽ
begin
  SetLength(Result, SizeOf(mSmallint));
  Move(mSmallint, Result[1], SizeOf(mSmallint));
end; { SmallintToBuffer }

function BufferToSmallint( //�ַ��洢��ʽ��ԭ��8λ����
  mBuffer: string //�ַ��洢��ʽ
): Smallint; //�����ַ������8λ����
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToSmallint }

function GUIDToBuffer( //ȡ��GUID���ַ��洢��ʽ
  mGUID: TGUID //GUID
): string; //����GUID���ַ��洢��ʽ
begin
  SetLength(Result, SizeOf(mGUID));
  Move(mGUID, Result[1], SizeOf(mGUID));
end; { GUIDToBuffer }

function BufferToGUID( //�ַ��洢��ʽ��ԭ��GUID
  mBuffer: string //�ַ��洢��ʽ
): TGUID; //�����ַ������GUID
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToGUID }

function WideStringToBuffer( //ȡ�ö��ֽ��ַ����ַ��洢��ʽ
  mWideString: WideString //���ֽ��ַ�
): string;  //���ض��ֽ��ַ����ַ��洢��ʽ
begin
  Result := '';
  if mWideString = '' then Exit;
  SetLength(Result, Length(mWideString) * SizeOf(WideChar));
  Move(mWideString[1], Result[1], Length(mWideString) * SizeOf(WideChar));
end; { WideStringToBuffer }

function BufferToWideString( //�ַ��洢��ʽ��ԭ�ɶ��ֽ��ַ�
  mBuffer: string //�ַ��洢��ʽ
): WideString; //�����ַ�����Ķ��ֽ��ַ�
begin
  Result := '';
  if mBuffer = '' then Exit;
  SetLength(Result, Length(mBuffer) div 2);
  Move(mBuffer[1], Result[1], Length(mBuffer));
end; { BufferToWideString }

function URLToString( //��ԭURL�����ַ���
  mURL: string //URL�����ַ���
): string; //���ػ�ԭ����ַ���
var
  I: Integer;
  J: Integer;
begin
  Result := '';
  I := 1;
  while I <= Length(mURL) do
  begin
    if SameText(Copy(mURL, I, 1), '+') then
    begin
      Result := Result + ' ';
      Inc(I);
    end else if SameText(Copy(mURL, I, 1), '%') then
    begin
      if SameText(Copy(mURL, I, 2), '%u') then
      begin
        J := StrToIntDef('$' + Copy(mURL, I + 2, 4), -1);
        if J >= 0 then Result := Result + WideChar(J);
        Inc(I, 6);
      end else
      begin
        J := StrToIntDef('$' + Copy(mURL, I + 1, 2), -1);
        if J >= 0 then Result := Result + string(Char(J));
        Inc(I, 3);
      end;
    end else
    begin
      Result := Result + mURL[I];
      Inc(I);
    end;
  end;
end; { URLToString }

function StringToURL( //����ͨ�ַ��������URL��ʽ
  mStr: string //��ͨ�ַ���
): string; overload; //���ر������ַ���
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    case mStr[I] of
      '0'..'9', 'a'..'z', 'A'..'Z': Result := Result + mStr[I];
    else Result := Result + Format('%%%.2x', [Ord(mStr[I])])
    end;
end; { StringToURL }

function StringToURL( //��Unicode�ַ��������URL��ʽ
  mStr: WideString //Unicode�ַ���
): string; overload; //���ر������ַ���
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    case mStr[I] of
      '0'..'9', 'a'..'z', 'A'..'Z': Result := Result + mStr[I];
    else Result := Result + Format('%%u%.4x', [Ord(mStr[I])])
    end;
end; { StringToURL }

function LeftBeeline( // ����߿�ʼֱ������ָ���ַ�����ȡ
  mStr: string; // �ַ���
  mSysCharSet: TSysCharSet // �ַ���
): string; // ������߽�ȡ�õ����ַ���
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    if not (mStr[I] in mSysCharSet) then begin
      Result := Copy(mStr, 1, I - 1);
      Break;
    end;
end; { LeftBeeline }

function RightBeeline( // ���ұ߿�ʼֱ������ָ���ַ�����ȡ
  mStr: string; // �ַ���
  mSysCharSet: TSysCharSet // �ַ���
): string; // �����ұ߽�ȡ�õ����ַ���
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    if not (mStr[I] in mSysCharSet) then begin
      Result := Copy(mStr, I, MaxInt);
      Break;
    end;
end; { RightBeeline }

procedure SplitBracket( // ��������ַ���
  mText: string; // �ַ���
  var nLeft: string; // ��������ַ���
  var nCenter: string; // �����м��ַ���
  var nRight: string // �����ұ��ַ���
);
var
  L, R: Integer;
  I: Integer;
  B: Boolean;
begin
  nLeft := '';
  nCenter := '';
  nRight := '';
  B := True;
  L := 0;
  R := 0;
  for I := 1 to Length(mText) do
    if B then
    begin
      if mText[I] = '(' then
        Inc(L)
      else if mText[I] = ')' then
        Inc(R);
      if L = 0 then
        nLeft := nLeft + mText[I]
      else if L > R then
        nCenter := nCenter + mText[I]
      else B := False;
    end else nRight := nRight + mText[I];
  Delete(nCenter, 1, 1);
end; { SplitBracket }

function FirstSpace( // ȡǰ���հ��ַ�
  mStr: string; // �ַ���
  mSpaceChar: TSysCharSet = [#9, #32] // �ַ���
): string; // ����ǰ���հ��ַ�
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    if not (mStr[I] in mSpaceChar) then
    begin
      Result := Copy(mStr, 1, I - 1);
      Break;
    end;
end; { FirstSpace }

end.

