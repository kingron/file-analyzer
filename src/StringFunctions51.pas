(*//
项目:LovelyComponents.StringFunctions
版本:2.0
标题:字符串处理单元
说明:针对字符处理的函数进行封装
日期:2004-07-03
支持:jihu.wang#gmail.com
设计:ZswangY37
//*)

//*******Begin 修改日志*******//
//2004-07-03 No.1 Zswang 建立
//------------------------------------------------------------------------------
//2004-07-10 No.1 ZswangY37 添加 FileToString()、StringToFile()
//2004-07-19 No.1 ZswangY37 添加 Simplified2Traditional()、Traditional2Simplified()
//------------------------------------------------------------------------------
//2004-08-02 No.1 ZswangY37 添加 SameMark()、MarkPosition()特征码的比较
//------------------------------------------------------------------------------
//2005-02-24 No.1 ZswangY37 修改 FileToString()可以读取正在运行的文件
//----------------------------------------------------------------------5.01.001
//2006-08-10 No.1 ZswangY37 更名 unit StringFunctions50->unit StringFunctions51
//2006-08-10 No.2 ZswangY37 更名 function ListChange->function ListReplace
//2006-08-10 No.3 ZswangY37 完善 BinToHex对齐8字位
//----------------------------------------------------------------------5.01.002
//2006-08-17 No.1 ZswangY37 添加 URLToString()、StringToURL()
//----------------------------------------------------------------------5.01.003
//2006-09-14 No.1 ZswangY37 添加 C语言字符串处理ExpressionToString()、StringToExpression()
//2006-09-14 No.2 Zswangy37 添加 IP地址处理函数AddressToNumber()
//----------------------------------------------------------------------5.01.003
//2006-09-22 No.1 Zswangy37 完善 处理C语言字符串\xNN后跟数字字符的情况
//*******End 修改日志*******//

{$DEFINE Unit_StringFunctions51}
//{$DEFINE USES_COMPRESSION} //是否使用压缩功能

unit StringFunctions51;

interface

uses Windows, SysUtils, Classes;

function HexToStr( //十六进制字符串处理成字符串
  mHex: string //十六进制字符串
): string; //返回处理后的字符串

function StrToHex( //字符串处理成十六进制字符串
  mStr: string; //字符串
  mSpace: Boolean = False//是否用空格分开
): string; //返回处理后的十六进制字符串

function StrLeft( //取左边的字符串
  mStr: string; //原字符串
  mDelimiter: string; //分隔符
  mIgnoreCase: Boolean = False //是否忽略大小写
): string; //返回第一个分隔符左边的字符串

function StrRight( //取右边的字符串
  mStr: string; //原字符串
  mDelimiter: string; //分隔符
  mIgnoreCase: Boolean = False //是否忽略大小写
): string; //返回第一个分隔符右边的字符串

function StringInvert( //字符串异或
  mStr: string; //源字符串
  mKey: string //密钥
): string; //返回异或后的结果

function RandomString( //随机字符串
  mChars: string; //字符集合,可以利用重复的字符来控制频率
  mLength: Integer //生成字符的长度
): string; //返回长度为mLength的随机字符串

function StringSort( //字符串排序
  mStr: string; //源字符串
  mDesc: Boolean = True //是否升序排列，否则按降序
): string; //返回排序后的字符串

function BufferToString( //将缓冲处理成字符串
  const mBuffer; //缓冲内容
  mLen: Integer //缓冲大小
): string; //返回缓冲的字符形式

function StringToDisplay( //字符串处理成语法格式
  mString: string //源字符串
): string; //返回字符串的语法格式

function DisplayToString( //还原语法格式表达的字符串
  mDisplay: string //字符表达式
): string; //返回字符表达式所表达的字符串

function SubStrCount( //计算子字符串的个数
  mStr: string; //源字符串
  mSub: string; //子串
  mIgnoreCase: Boolean = False //是否忽略大小写
): Integer; //返回子字符串出现的次数

function StringFilter( //字符串过滤
  mStr: string; //源字符串
  mChars: TSysCharSet //能保留下的字符集合
): string; //返回过滤后的字符串

function Combination( //全组合
  mStrings: TStrings; //做输出用的字符列表
  mStr: string; //源字符
  mLen: Integer //元素个数
): Boolean; //返回处理是否成功

function Collocate( //全排列
  mStrings: TStrings; //做输出用的字符列表
  mStr: string //源字符串
): Boolean; //返回处理是否成功

function StringToCharSet( //字符串集合
  mString: string //源字符串
): TSysCharSet; //返回字符串中包含的集合

function StringShuffle( //随机排列字符串
  S: string //源字符串
): string; //返回排列后的字符串

function StrSetExists( //判断子串是否存在，忽略排列的顺序
  mStr: string; //源字符串
  mSubStr: string //子串
): Boolean; //返回子串是否存在

function StrSetExclude( //将子串排除，忽略排列的顺序
  mStr: string; //源字符串
  mSubStr: string //子串
): string; //返回排除后的字符串

function StringToFile( //字符串存为文件
  mString: string; //源字符串
  mFileName: TFileName //文件名
): Boolean; //返回字符串保存到文件是否成功

function FileToString( //文件读为字符串
  mFileName: TFileName //文件名
): string; //返回从文件载入字符串

function BinToHex( //二进制转换成十六进制
  mBin: string; //二进制字符
  mSpace: Boolean = False //是否加上空格
): string; //返回十六进制字符

function HexToBin( //十六进制转换成二进制
  mHex: string; //十六进制字符串
  mSpace: Boolean = False //是否加上空格
): string; //返回二进制字符串

function Simplified2Traditional( //简体汉字转化成繁体汉字
  mSimplified: string //简体字符串
): string; //返回繁体字符串 //Win98下无效

function Traditional2Simplified( //繁体汉字转化成简体汉字
  mTraditional: string //简体字符串
): string; //返回繁体字符串 //Win98下无效

function SameMark( //比较字符串是否符合特征码
  mStr: string; //源字符串
  mMark: string //特征码
): Boolean; //返回是否符合特征码

function UpperMark( //特征码处理成大写
  mMark: string //特征码
): string; //返回大写的特征码

function MarkPosition( //特征码的位置
  mStr: string; //源字符串
  mMark: string //特征码
): Integer; //返回特征码所在的位置

function IntegerToBuffer( //取得整数的字符存储形式
  mInteger: Integer //整数
): string; //返回整数的字符存储形式

function BufferToInteger( //字符存储形式还原成整数
  mBuffer: string //字符存储形式
): Integer; //返回字符代表的整数

function Int64ToBuffer( //取得64位整数的字符存储形式
  mInt64: Int64 //64位整数
): string; //返回64位整数的字符存储形式

function BufferToInt64( //字符存储形式还原成64位整数
  mBuffer: string //字符存储形式
): Int64; //返回字符代表的64位整数

function SingleToBuffer( //取得单精度的字符存储形式
  mSingle: Single //单精度
): string; //返回单精度的字符存储形式

function BufferToSingle( //字符存储形式还原成单精度
  mBuffer: string //字符存储形式
): Single; //返回字符代表的单精度

function DoubleToBuffer( //取得双精度的字符存储形式
  mDouble: Double //双精度
): string; //返回双精度的字符存储形式

function BufferToDouble( //字符存储形式还原成双精度
  mBuffer: string //字符存储形式
): Double; //返回字符代表的双精度

function SmallintToBuffer( //取得8位整数的字符存储形式
  mSmallint: Smallint //8位整数
): string; //返回8位整数的字符存储形式

function BufferToSmallint( //字符存储形式还原成8位整数
  mBuffer: string //字符存储形式
): Smallint; //返回字符代表的8位整数

function GUIDToBuffer( //取得GUID的字符存储形式
  mGUID: TGUID //GUID
): string; //返回GUID的字符存储形式

function BufferToGUID( //字符存储形式还原成GUID
  mBuffer: string //字符存储形式
): TGUID; //返回字符代表的GUID

function WideStringToBuffer( //取得多字节字符的字符存储形式
  mWideString: WideString //多字节字符
): string;  //返回多字节字符的字符存储形式

function BufferToWideString( //字符存储形式还原成多字节字符
  mBuffer: string //字符存储形式
): WideString; //返回字符代表的多字节字符

function URLToString( //还原URL编码字符串
  mURL: string //URL编码字符串
): string; //返回还原后的字符串

function StringToURL( //将普通字符串编码成URL格式
  mStr: string //普通字符串
): string; overload; //返回编码后的字符串

function StringToURL( //将Unicode字符串编码成URL格式
  mStr: WideString //Unicode字符串
): string; overload; //返回编码后的字符串

function LeftBeeline( // 从左边开始直到碰到指定字符集截取
  mStr: string; // 字符串
  mSysCharSet: TSysCharSet // 字符集
): string; // 返回左边截取得到的字符串

function RightBeeline( // 从右边开始直到碰到指定字符集截取
  mStr: string; // 字符串
  mSysCharSet: TSysCharSet // 字符集
): string; // 返回右边截取得到的字符串

procedure SplitBracket( // 拆分括号字符串
  mText: string; // 字符串
  var nLeft: string; // 括号左边字符串
  var nCenter: string; // 括号中间字符串
  var nRight: string // 括号右边字符串
);

function FirstSpace( // 取前导空白字符
  mStr: string; // 字符串
  mSpaceChar: TSysCharSet = [#9, #32] // 字符集
): string; // 返回前导空白字符

function StringRandom( //取得指定长度的随机字符串
  mLength: Integer; //指定长度
  mChars: string = '' //指定字符集合,如果为''则表示全部字符
): string; //返回指定长度的随机字符串

{$IFDEF USES_COMPRESSION}
function StreamCompression( //流的压缩
  mInputStream: TStream; //输入流实例
  mOutputStream: TStream //输出流实例
): Integer; //返回压缩后的流大小

function StreamDecompression( //流的解压
  mInputStream: TStream; //输入流实例
  mOutputStream: TStream //输出流实例
): Integer; //返回解压后的流大小

function StringCompression( //字符串压缩
  mSource: string //源字符串
): string; //返回压缩后的字符串

function StringDecompression( //字符串解压
  mSource: string //源字符串
): string; //返回解压后的字符串
{$ENDIF}

function ListCount( //得到列表字符串的个数
  mList: string; //列表字符串
  mDelimiter: string = ',' //元素间的间隔符号
): Integer; //返回得到的个数

function ListValue( //得到列表字符串中指定位置的值
  mList: string; //元素序号
  mIndex: Integer; //元素位置
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回列表字符串中指定位置的值

function ListReplace( //替换列表字符串的值
  mList: string; //列表字符串
  mIndex: Integer; //替换的元素序号
  mValue: string; //所要替换的值
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回替换后的结果

function ListInsert( //向列表字符串插入元素
  mList: string; //列表字符串
  mIndex: Integer; //插入的元素序号
  mValue: string; //插入的值
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回插入后的结果

function ListDelete( //删除列表字符串的元素
  mList: string; //列表字符串
  mIndex: Integer; //删除的元素序号
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回删除后的结果

function ListCopy( //截取列表字符串的一段
  mList: string; //列表字符串
  mIndex: Integer; //起始的元素序号
  mLength: Integer; //截取的个数
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回截取的结果

function UnicodeToMBCS( //将Unicode编码字符串转换成多字节字符串
  mCodePage: UINT; //对照表页码
  mUnicode: WideString //Unicode编码字符串
): string; //返回处理后的字符串

function MBCSToUnicode( //将多字节字符串转换成Unicode编码字符串
  mCodePage: UINT; //对照表页码
  mMBCS: string //多字节字符串
): WideString; //返回处理后的字符串

function UnicodeToGB2312( //将Unicode编码字符串转换成GB2312字编码符串
  mUnicode: string //Unicode编码符串
): WideString; //返回处理后的字符串

function GB2312ToUnicode( //将GB2312编码字符串转换成字Unicode编码符串
  mGB2312: string //GB2312编码字符串
): WideString; //返回处理后的字符串

function UnicodeToBIG5( //将Unicode编码字符串转换成BIG5字编码符串
  mUnicode: WideString //Unicode编码字符串
): string; //返回处理后的字符串

function BIG5ToUnicode( //将BIG5编码字符串转换成字Unicode编码符串
  mBIG5: string //BIG5编码字符串
): WideString; //返回处理后的字符串

function AddressToNumber( // IP地址表达式转换为数值
  mAddress: string  // IP地址表达式
): Longword; // 返回IP地址转换后的数值

function IntToOct( // 整数转换为八进制字符串
  mInt: Integer // 整数
): string; // 返回转换后的字符串

function OctToIntDef( // 八进制转换为整数
  mOct: string; // 八进制字符串
  mDefault: Integer // 如果转换出现错误则返回该默认数
): Integer; // 返回八进制转换的整数

function ExpressionToString( // C语言字符表达式转换为普通字符串
  mExpression: string // C语言字符表达式
): string; // 返回转换后的普通字符串

function StringToExpression( // 将字符串转换为C语言字符表达式
  mStr: string // 普通字符串
): string; // 返回转换后的C语言字符表达式

function ExtractFileName( // 截取文件名
  mFileName: string // 完整文件名
): string; // 返回文件名部分

implementation

uses Math{$IFDEF USES_COMPRESSION}, ZLib20{$ENDIF};

function ExtractFileName( // 截取文件名
  mFileName: string // 完整文件名
): string; // 返回文件名部分
var
  I: Integer;
begin
  I := LastDelimiter('/' + PathDelim + DriveDelim, mFileName);
  Result := Copy(mFileName, I + 1, MaxInt);
end; { ExtractFileName }

function IntToOct( // 整数转换为八进制字符串
  mInt: Integer // 整数
): string; // 返回转换后的字符串
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
function OctToIntDef( // 八进制转换为整数
  mOct: string; // 八进制字符串
  mDefault: Integer // 如果转换出现错误则返回该默认数
): Integer; // 返回八进制转换的整数
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

function ExpressionToString( // C语言字符表达式转换为普通字符串
  mExpression: string // C语言字符表达式
): string; // 返回转换后的普通字符串
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
          begin // 十六进制
            T := '';
            for J := I + 2 to L do
              case mExpression[J] of
                '0'..'9', 'a'..'f', 'A'..'F': T := T + mExpression[J];
              else Break;
              end;
            Result := Result + Char(StrToIntDef('$' + T, 0));
            Inc(I, Length(T));
          end;
          '0'..'7': // 八进制
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

function StringToExpression( // 将字符串转换为C语言字符表达式                   //2006-09-22 No.1 ZswangY37
  mStr: string // 普通字符串
): string; // 返回转换后的C语言字符表达式
var
  I: Integer;
  vHex: Boolean; // 前面是否出现过十六进制
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

function AddressToNumber( // IP地址表达式转换为数值
  mAddress: string  // IP地址表达式
): Longword; // 返回IP地址转换后的数值
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

function UnicodeToMBCS( //将Unicode编码字符串转换成多字节字符串
  mCodePage: UINT; //对照表页码
  mUnicode: WideString //Unicode编码字符串
): string; //返回处理后的字符串
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

function UnicodeToGB2312( //将Unicode编码字符串转换成GB2312字编码符串
  mUnicode: string //Unicode编码符串
): WideString; //返回处理后的字符串
begin
  Result := UnicodeToMBCS(936, mUnicode);
end; { UnicodeToGB2312 }

function UnicodeToBIG5( //将Unicode编码字符串转换成BIG5字编码符串
  mUnicode: WideString //Unicode编码字符串
): string; //返回处理后的字符串
begin
  Result := UnicodeToMBCS(950, mUnicode);
end; { UnicodeToBIG5 }

function MBCSToUnicode( //将多字节字符串转换成Unicode编码字符串
  mCodePage: UINT; //对照表页码
  mMBCS: string //多字节字符串
): WideString; //返回处理后的字符串
var
  L: Integer;
begin
  L := MultiByteToWideChar(mCodePage, 0, PChar(mMBCS), -1, nil, 0);
  SetLength(Result, L);
  if L <= 0 then Exit;
  MultiByteToWideChar(mCodePage, 0, PChar(mMBCS), -1, @Result[1], L);
end; { MBCSToUnicode }

function GB2312ToUnicode( //将GB2312编码字符串转换成字Unicode编码符串
  mGB2312: string //GB2312编码字符串
): WideString; //返回处理后的字符串
begin
  Result := MBCSToUnicode(936, mGB2312);
end; { GB2312ToUnicode }

function BIG5ToUnicode( //将BIG5编码字符串转换成字Unicode编码符串
  mBIG5: string //BIG5编码字符串
): WideString; //返回处理后的字符串
begin
  Result := MBCSToUnicode(950, mBIG5);
end; { BIG5ToUnicode }

function ListCount( //得到列表字符串的个数
  mList: string; //列表字符串
  mDelimiter: string = ',' //元素间的间隔符号
): Integer; //返回得到的个数
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

function ListValue( //得到列表字符串中指定位置的值
  mList: string; //元素序号
  mIndex: Integer; //元素位置
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回列表字符串中指定位置的值
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

function ListCopy( //截取列表字符串的一段
  mList: string; //列表字符串
  mIndex: Integer; //起始的元素序号
  mLength: Integer; //截取的个数
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回截取的结果
var
  I: Integer;
begin
  Result := '';
  if mLength = MaxInt then mLength := mLength - mIndex;
  for I := mIndex to Min(mIndex + mLength, ListCount(mList, mDelimiter)) - 1 do
    Result := Result + mDelimiter + ListValue(mList, I, mDelimiter);
  Delete(Result, 1, Length(mDelimiter));
end; { ListCopy }

function ListReplace( //替换列表字符串的值
  mList: string; //列表字符串
  mIndex: Integer; //替换的元素序号
  mValue: string; //所要替换的值
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回替换后的结果
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

function ListInsert( //向列表字符串插入元素
  mList: string; //列表字符串
  mIndex: Integer; //插入的元素序号
  mValue: string; //插入的值
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回插入后的结果
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

function ListDelete( //删除列表字符串的元素
  mList: string; //列表字符串
  mIndex: Integer; //删除的元素序号
  mDelimiter: string = ',' //元素间的间隔符号
): string; //返回删除后的结果
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

function StreamCompression( //流的压缩
  mInputStream: TStream; //输入流实例
  mOutputStream: TStream //输出流实例
): Integer; //返回压缩后的流大小
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

function StreamDecompression( //流的解压
  mInputStream: TStream; //输入流实例
  mOutputStream: TStream //输出流实例
): Integer; //返回解压后的流大小
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

function StringCompression( //字符串压缩
  mSource: string //源字符串
): string; //返回压缩后的字符串
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

function StringDecompression( //字符串解压
  mSource: string //源字符串
): string; //返回解压后的字符串
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

function StringRandom( //取得指定长度的随机字符串
  mLength: Integer; //指定长度
  mChars: string = '' //指定字符集合
): string; //返回指定长度的随机字符串
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

function HexToStr( //十六进制字符串处理成字符串
  mHex: string //十六进制字符串
): string; //返回处理后的字符串
var
  I: Integer;
begin
  Result := '';
  mHex := StringFilter(mHex, ['0'..'9', 'a'..'z', 'A'..'Z']);
  for I := 1 to Length(mHex) div 2 do
    Result := Result + Chr(StrToIntDef('$' + Copy(mHex, I * 2 - 1, 2), 0));
end; { HexToStr }

function StrToHex( //字符串处理成十六进制字符串
  mStr: string; //字符串
  mSpace: Boolean = False //是否用空格分开
): string; //返回处理后的十六进制字符串
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

function StrLeft( //取左边的字符串
  mStr: string; //原字符串
  mDelimiter: string; //分隔符
  mIgnoreCase: Boolean = False //是否忽略大小写
): string; //返回第一个分隔符左边的字符串
begin
  if mIgnoreCase then
    Result := Copy(mStr, 1, Pos(UpperCase(mDelimiter), UpperCase(mStr)) - 1)
  else Result := Copy(mStr, 1, Pos(mDelimiter, mStr) - 1);
end; { StrLeft }

function StrRight( //取右边的字符串
  mStr: string; //原字符串
  mDelimiter: string; //分隔符
  mIgnoreCase: Boolean = False //是否忽略大小写
): string; //返回第一个分隔符右边的字符串
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

function StringInvert( //字符串异或
  mStr: string; //源字符串
  mKey: string //密钥
): string; //返回异或后的结果
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

function RandomString( //随机字符串
  mChars: string; //字符集合,可以利用重复的字符来控制频率
  mLength: Integer //生成字符的长度
): string; //返回长度为mLength的随机字符串
var
  I: Integer;
begin
  Result := '';
  if mChars = '' then Exit;
  for I := 1 to mLength do
    Result := Result + mChars[Random(Length(mChars)) + 1];
end; { RandomString }

function StringSort( //字符串排序
  mStr: string; //源字符串
  mDesc: Boolean = True //是否升序排列，否则按降序
): string; //返回排序后的字符串
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

function BufferToString( //将缓冲处理成字符串
  const mBuffer; //缓冲内容
  mLen: Integer //缓冲大小
): string; //返回缓冲的字符形式
begin
  SetLength(Result, mLen);
  Move(mBuffer, Result[1], mLen);
end; { BufferToString }

function StringToDisplay( //字符串处理成语法格式
  mString: string //源字符串
): string; //返回字符串的语法格式
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

function DisplayToString( //还原语法格式表达的字符串
  mDisplay: string //字符表达式
): string; //返回字符表达式所表达的字符串
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

function SubStrCount( //计算子字符串的个数
  mStr: string; //源字符串
  mSub: string; //子串
  mIgnoreCase: Boolean = False //是否忽略大小写
): Integer; //返回子字符串出现的次数
var
  vReplaceFlags: TReplaceFlags;
begin
  vReplaceFlags := [rfReplaceAll];
  if mIgnoreCase then Include(vReplaceFlags, rfIgnoreCase);
  Result := (Length(mStr) - Length(
    StringReplace(mStr, mSub, '', vReplaceFlags))) div Length(mSub);
end; { SubStrCount }

function StringFilter( //字符串过滤
  mStr: string; //源字符串
  mChars: TSysCharSet //能保留下的字符集合
): string; //返回过滤后的字符串
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(mStr) do
    if mStr[I] in mChars then
      Result := Result + mStr[I];
end; { StringFilter }

function Combination( //全组合
  mStrings: TStrings; //做输出用的字符列表
  mStr: string; //源字符
  mLen: Integer //元素个数
): Boolean; //返回处理是否成功
  procedure pCombination( //全组合子过程
    mLeft: string; //排列到左边的字符
    mRight: string //排列到右边的字符
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

function Collocate( //全排列
  mStrings: TStrings; //做输出用的字符列表
  mStr: string //源字符串
): Boolean; //返回处理是否成功
  procedure pCollocate( //全排列子过程
    mLeft: string; //排列到左边的字符
    mRight: string //排列到右边的字符
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

function StringToCharSet( //字符串集合
  mString: string //源字符串
): TSysCharSet; //返回字符串中包含的集合
var
  I: Integer;
begin
  Result := [];
  for I := 1 to Length(mString) do Include(Result, mString[I]);
end; { StringToCharSet }

function StringShuffle( //随机排列字符串
  S: string //源字符串
): string; //返回排列后的字符串
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

function StrSetExists( //判断子串是否存在，忽略排列的顺序
  mStr: string; //源字符串
  mSubStr: string //子串
): Boolean; //返回子串是否存在
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

function StrSetExclude( //将子串排除，忽略排列的顺序
  mStr: string; //源字符串
  mSubStr: string //子串
): string; //返回排除后的字符串
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

function StringToFile( //字符串存为文件
  mString: string; //源字符串
  mFileName: TFileName //文件名
): Boolean; //返回字符串保存到文件是否成功
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

function FileToString( //文件读为字符串
  mFileName: TFileName //文件名
): string; //返回从文件载入字符串
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
  cHexBinStrings: array[0..15] of string = //十六进制和二进制对照表
(
'0000', '0001', '0010', '0011',
'0100', '0101', '0110', '0111',
'1000', '1001', '1010', '1011',
'1100', '1101', '1110', '1111'
);

function BinToHex( //二进制转换成十六进制
  mBin: string; //二进制字符
  mSpace: Boolean = False //是否加上空格
): string; //返回十六进制字符
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

function HexToBin( //十六进制转换成二进制
  mHex: string; //十六进制字符串
  mSpace: Boolean = False //是否加上空格
): string; //返回二进制字符串
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

function Simplified2Traditional( //简体汉字转化成繁体汉字
  mSimplified: string //简体字符串
): string; //返回繁体字符串 //Win98下无效
var
  L: Integer;
begin
  L := Length(mSimplified);
  SetLength(Result, L);
  LCMapString(GetUserDefaultLCID,
    LCMAP_TRADITIONAL_CHINESE, PChar(mSimplified), L, @Result[1], L);
end; { Simplified2Traditional }

function Traditional2Simplified( //繁体汉字转化成简体汉字
  mTraditional: string //简体字符串
): string; //返回繁体字符串 //Win98下无效
var
  L: Integer;
begin
  L := Length(mTraditional);
  SetLength(Result, L);
  LCMapString(GetUserDefaultLCID,
    LCMAP_SIMPLIFIED_CHINESE, PChar(mTraditional), L, @Result[1], L);
end; { Traditional2Simplified }

function SameMark( //比较字符串是否符合特征码
  mStr: string; //源字符串
  mMark: string //特征码
): Boolean; //返回是否符合特征码
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

function UpperMark( //特征码处理成大写
  mMark: string //特征码
): string; //返回大写的特征码
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

function MarkPosition( //特征码的位置
  mStr: string; //源字符串
  mMark: string //特征码
): Integer; //返回特征码所在的位置
var
  I, J, L: Integer;
  vLongMarks: string;
  vLongPos: Integer;
begin
  mMark := StringReplace(mMark, #32, '', [rfReplaceAll]);
  L := Length(mMark) div 2;
  if Pos('%%', mMark) <= 0 then //如果没有掩码
  begin
    Result := Pos(HexToStr(mMark), mStr);
    Exit;
  end;
  if StringReplace(mMark, '%', '', [rfReplaceAll]) = '' then
  begin
    Result := 1;
    Exit;
  end;
  ///////Begin 扫描最长的一个特征码
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
  ///////End 扫描最长的一个特征码

  ///////Begin 用最长的特征码来比较
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
  ///////End 用最长的特征码来比较
end; { MarkPosition }

function IntegerToBuffer( //取得整数的字符存储形式
  mInteger: Integer //整数
): string; //返回整数的字符存储形式
begin
  SetLength(Result, SizeOf(mInteger));
  Move(mInteger, Result[1], SizeOf(mInteger));
end; { IntegerToBuffer }

function BufferToInteger( //字符存储形式还原成整数
  mBuffer: string //字符存储形式
): Integer; //返回字符代表的整数
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToInteger }

function Int64ToBuffer( //取得64位整数的字符存储形式
  mInt64: Int64 //64位整数
): string; //返回64位整数的字符存储形式
begin
  SetLength(Result, SizeOf(mInt64));
  Move(mInt64, Result[1], SizeOf(mInt64));
end; { Int64ToBuffer }

function BufferToInt64( //字符存储形式还原成64位整数
  mBuffer: string //字符存储形式
): Int64; //返回字符代表的64位整数
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToInt64 }

function SingleToBuffer( //取得单精度的字符存储形式
  mSingle: Single //单精度
): string; //返回单精度的字符存储形式
begin
  SetLength(Result, SizeOf(mSingle));
  Move(mSingle, Result[1], SizeOf(mSingle));
end; { SingleToBuffer }

function BufferToSingle( //字符存储形式还原成单精度
  mBuffer: string //字符存储形式
): Single; //返回字符代表的单精度
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToSingle }

function DoubleToBuffer( //取得双精度的字符存储形式
  mDouble: Double //双精度
): string; //返回双精度的字符存储形式
begin
  SetLength(Result, SizeOf(mDouble));
  Move(mDouble, Result[1], SizeOf(mDouble));
end; { DoubleToBuffer }

function BufferToDouble( //字符存储形式还原成双精度
  mBuffer: string //字符存储形式
): Double; //返回字符代表的双精度
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToDouble }

function SmallintToBuffer( //取得8位整数的字符存储形式
  mSmallint: Smallint //8位整数
): string; //返回8位整数的字符存储形式
begin
  SetLength(Result, SizeOf(mSmallint));
  Move(mSmallint, Result[1], SizeOf(mSmallint));
end; { SmallintToBuffer }

function BufferToSmallint( //字符存储形式还原成8位整数
  mBuffer: string //字符存储形式
): Smallint; //返回字符代表的8位整数
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToSmallint }

function GUIDToBuffer( //取得GUID的字符存储形式
  mGUID: TGUID //GUID
): string; //返回GUID的字符存储形式
begin
  SetLength(Result, SizeOf(mGUID));
  Move(mGUID, Result[1], SizeOf(mGUID));
end; { GUIDToBuffer }

function BufferToGUID( //字符存储形式还原成GUID
  mBuffer: string //字符存储形式
): TGUID; //返回字符代表的GUID
begin
  FillChar(Result, SizeOf(Result), 0);
  if mBuffer = '' then Exit;
  Move(mBuffer[1], Result, Min(Length(mBuffer), SizeOf(Result)));
end; { BufferToGUID }

function WideStringToBuffer( //取得多字节字符的字符存储形式
  mWideString: WideString //多字节字符
): string;  //返回多字节字符的字符存储形式
begin
  Result := '';
  if mWideString = '' then Exit;
  SetLength(Result, Length(mWideString) * SizeOf(WideChar));
  Move(mWideString[1], Result[1], Length(mWideString) * SizeOf(WideChar));
end; { WideStringToBuffer }

function BufferToWideString( //字符存储形式还原成多字节字符
  mBuffer: string //字符存储形式
): WideString; //返回字符代表的多字节字符
begin
  Result := '';
  if mBuffer = '' then Exit;
  SetLength(Result, Length(mBuffer) div 2);
  Move(mBuffer[1], Result[1], Length(mBuffer));
end; { BufferToWideString }

function URLToString( //还原URL编码字符串
  mURL: string //URL编码字符串
): string; //返回还原后的字符串
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

function StringToURL( //将普通字符串编码成URL格式
  mStr: string //普通字符串
): string; overload; //返回编码后的字符串
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

function StringToURL( //将Unicode字符串编码成URL格式
  mStr: WideString //Unicode字符串
): string; overload; //返回编码后的字符串
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

function LeftBeeline( // 从左边开始直到碰到指定字符集截取
  mStr: string; // 字符串
  mSysCharSet: TSysCharSet // 字符集
): string; // 返回左边截取得到的字符串
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

function RightBeeline( // 从右边开始直到碰到指定字符集截取
  mStr: string; // 字符串
  mSysCharSet: TSysCharSet // 字符集
): string; // 返回右边截取得到的字符串
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

procedure SplitBracket( // 拆分括号字符串
  mText: string; // 字符串
  var nLeft: string; // 括号左边字符串
  var nCenter: string; // 括号中间字符串
  var nRight: string // 括号右边字符串
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

function FirstSpace( // 取前导空白字符
  mStr: string; // 字符串
  mSpaceChar: TSysCharSet = [#9, #32] // 字符集
): string; // 返回前导空白字符
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

