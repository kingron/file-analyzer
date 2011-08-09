(*//
项目:LovelyComponents.DasmFunctions
版本:5.01
标题:反汇编
说明:将机器代码编译成汇编语言
日期:2004-07-03
支持:jihu.wang#gmail.com
设计:ZswangY37
//*)

//*******Begin 修改日志*******//
//2004-07-03 No.1 ZswangY37 建立
//----------------------------------------------------------------------5.01.001
//2006-08-29 No.1 ZswangY37 升级 1.00->5.01
//----------------------------------------------------------------------5.01.002
//2006-12-30 No.1 ZswangY37 优化 分析SAR、SAL指令 
//*******End 修改日志*******//

unit DasmFunctions51;

interface

uses Classes, SysUtils, Math;

function DasmToStrings( //将机器代码反编译
  mAddress: Integer; //代码所在的内存地址
  mLanguage: string; //机器代码
  mStrings: TStrings; //输出列表
  mDisplay: Boolean = False; //是否显示字符
  mReturn: Boolean = False; //是否返回
  mFunctions: TStringList = nil //函数列表
): Integer; //如果没有错误则返回0否则为错误地址

function DasmToHtml( //将汇编代码处理是HTML
  mInputStrings: TStrings; //输入字符集
  mOutputStrings: TStrings; //输出字符集
  mDisplay: Boolean = False //是否显示字符
  ): Boolean; //返回处理是否成功
  
implementation

uses StringFunctions51;

const
  cCommand_IN = 'IN';
  cCommand_OUT = 'OUT';
  cCommand_FCOMP = 'FCOMP';
  cCommand_FSUBR = 'FSUBR';
  cCommand_FSUB = 'FSUB';
  cCommand_FDIV = 'FDIV';
  cCommand_FDIVR = 'FDIVR';
  cCommand_FMUL = 'FMUL';
  cCommand_FCLEX = 'FCLEX';
  cCommand_FCMOVNB = 'FCMOVNB';
  cCommand_FCMOVNE = 'FCMOVNE';
  cCommand_FUCOMI = 'FUCOMI';
  cCommand_FCMOVNBE = 'FCMOVNBE';
  cCommand_FCMOVNU = 'FCMOVNU';
  cCommand_FNINIT = 'FNINIT';
  cCommand_FLD = 'FLD';
  cCommand_FSTP = 'FSTP';
  cCommand_FST = 'FST';
  cCommand_FRSTOR = 'FRSTOR';
  cCommand_FSAVE = 'FSAVE';
  cCommand_FCOMI = 'FCOMI';
  cCommand_SLDT = 'SLDT';
  cCommand_LLDT = 'LLDT';

  cCommand_BOUND = 'BOUND';
  cCommand_TEST = 'TEST';
  cCommand_XCHG = 'XCHG';
  cCommand_MOV = 'MOV';
  cCommand_ADD = 'ADD';
  cCommand_ADC = 'ADC';
  cCommand_AND = 'AND';
  cCommand_OR = 'OR';
  cCommand_XOR = 'XOR';
  cCommand_SUB = 'SUB';
  cCommand_SBB = 'SBB';
  cCommand_CMP = 'CMP';
  cCommand_LDS = 'LDS';
  cCommand_LES = 'LES';
  cCommand_LEA = 'LEA';
  cCommand_ARPL = 'ARPL';
  cCommand_AAM = 'AAM';
  cCommand_AAD = 'AAD';

  cCommand_LOCK = 'LOCK';
  cCommand_REPNZ = 'REPNZ';
  cCommand_REP = 'REP';
  cCommand_CMC = 'CMC';

  cCommand_IMUL = 'IMUL';
  cCommand_INT = 'INT';

  cCommand_DEC = 'DEC';
  cCommand_INC = 'INC';
  cCommand_PUSH = 'PUSH';
  cCommand_POP = 'POP';
  cCommand_PUSHFD = 'PUSHFD';
  cCommand_POPFD = 'POPFD';
  cCommand_CALL = 'CALL';
  cCommand_JMP = 'JMP';
  cCommand_BTS = 'BTS';
  cCommand_IDIV = 'IDIV';

  cCommand_CMPXCHG = 'CMPXCHG';

  cCommand_INVD = 'INVD';
  cCommand_WBINVD = 'WBINVD';
  cCommand_FEMMS = 'FEMMS';
  cCommand_EMMS = 'EMMS';
  cCommand_CVTTPS2PI = 'CVTTPS2PI';
  cCommand_CVTPS2PI = 'CVTPS2PI';
  cCommand_UCOMISS = 'UCOMISS';
  cCommand_COMISS = 'COMISS';
  cCommand_LFENCE = 'LFENCE';
  cCommand_SFENCE = 'SFENCE';
  cCommand_MFENCE = 'MFENCE';
  cCommand_SYSEXIT = 'SYSEXIT';
  cCommand_CPUID = 'CPUID';
  cCommand_RDPMC = 'RDPMC';
  cCommand_WRMSR = 'WRMSR';
  cCommand_PSRLW = 'PSRLW';
  cCommand_PSRLD = 'PSRLD';
  cCommand_PSRLQ = 'PSRLQ';
  cCommand_PMULLW = 'PMULLW';
  cCommand_PUNPCKLBW = 'PUNPCKLBW';
  cCommand_PUNPCKLWD = 'PUNPCKLWD';

  cCommand_CVTPI2PS = 'CVTPI2PS';
  cCommand_MOVAPS = 'MOVAPS';
  cCommand_MOVNTPS = 'MOVNTPS';
  
  cCommand_SETO = 'SETO';
  cCommand_SETNO = 'SETNO';
  cCommand_SETC = 'SETC';
  cCommand_SETNC = 'SETNC';
  cCommand_SETZ = 'SETZ';
  cCommand_SETNZ = 'SETNZ';
  cCommand_SETBE = 'SETBE';
  cCommand_SETA = 'SETA';
  cCommand_SETS = 'SETS';
  cCommand_SETNS = 'SETNS';
  cCommand_SETPE = 'SETPE';
  cCommand_SETPO = 'SETPO';
  cCommand_SETL = 'SETL';
  cCommand_SETGE = 'SETGE';
  cCommand_SETLE = 'SETLE';
  cCommand_SETG = 'SETG';
  
  cCommand_PUNPCKLDQ = 'PUNPCKLDQ';
  cCommand_PACKSSWB = 'PACKSSWB';
  cCommand_PCMPGTB = 'PCMPGTB';
  cCommand_PCMPGTW = 'PCMPGTW';
  cCommand_PCMPGTD = 'PCMPGTD';
  cCommand_PACKUSWB = 'PACKUSWB';
  cCommand_PUNPCKHBW = 'PUNPCKHBW';
  cCommand_PUNPCKHWD = 'PUNPCKHWD';
  cCommand_PUNPCKHDQ = 'PUNPCKHDQ';
  cCommand_PACKSSDW = 'PACKSSDW';

  cCommand_PCMPEQB = 'PCMPEQB';
  cCommand_PCMPEQW = 'PCMPEQW';
  cCommand_PCMPEQD = 'PCMPEQD';
  cCommand_FSTSW = 'FSTSW';
  cCommand_RDTSC = 'RDTSC';
  cCommand_RDMSR = 'RDMSR';
  cCommand_CLTS = 'CLTS';
  cCommand_INSW = 'INSW';
  cCommand_OUTSW = 'OUTSW';
  cCommand_FILD = 'FILD';
  cCommand_FBSTP = 'FBSTP';
  cCommand_FIST = 'FIST';
  cCommand_FISTP = 'FISTP';
  cCommand_FUCOMIP = 'FUCOMIP';
  cCommand_FCOMIP = 'FCOMIP';

  cCommand_BT = 'BT';
  cCommand_SHLD = 'SHLD';
  cCommand_SHRD = 'SHRD';

  cCommand_PMADDWD = 'PMADDWD';
  cCommand_PADDUSB = 'PADDUSB';
  cCommand_PFCMPGE = 'PFCMPGE';

  cCommand_MOVD = 'MOVD';
  cCommand_MOVQ = 'MOVQ';
  cCommand_NEG = 'NEG';
  cCommand_NOT = 'NOT';

  cCommand_SAL = 'SAL';
  cCommand_SAR = 'SAR';
  cCommand_ROL = 'ROL';
  cCommand_ROR = 'ROR';
  cCommand_RCL = 'RCL';
  cCommand_RCR = 'RCR';
  cCommand_SHL = 'SHL';
  cCommand_SHR = 'SHR';

  cCommand_PUSHAD = 'PUSHAD';
  cCommand_FCOMPP = 'FCOMPP';
  cCommand_FSUBRP = 'FSUBRP';
  cCommand_FSUBP = 'FSUBP';
  cCommand_FCMOVB = 'FCMOVB';
  cCommand_FCMOVBE = 'FCMOVBE';
  cCommand_FCMOVU = 'FCMOVU';
  cCommand_FADDP = 'FADDP';
  cCommand_FMULP = 'FMULP';
  cCommand_FDIVP = 'FDIVP';
  cCommand_FDIVRP ='FDIVRP';
  cCommand_FSCALE = 'FSCALE';
  cCommand_FSIN = 'FSIN';
  cCommand_FCOS = 'FCOS';
  cCommand_FICOM = 'FICOM';
  cCommand_FICOMP = 'FICOMP';
  cCommand_FISUBR = 'FISUBR';
  cCommand_FIDIV = 'FIDIV';

  cCommand_FIADD = 'FIADD';
  cCommand_FIMUL = 'FIMUL';
  cCommand_FISUB = 'FISUB';
  cCommand_FUCOMP = 'FUCOMP';
  cCommand_FUCOM = 'FUCOM';
  cCommand_FADD = 'FADD';
  cCommand_FDECSTP = 'FDECSTP';
  cCommand_FUCOMPP = 'FUCOMPP';
  cCommand_FXTRACT = 'FXTRACT';
  cCommand_FPREM1 = 'FPREM1';
  cCommand_FCOM = 'FCOM';
  cCommand_FABS = 'FABS';
  cCommand_FTST = 'FTST';
  cCommand_FXAM = 'FXAM';
  cCommand_FXCH = 'FXCH';
  cCommand_FCHS = 'FCHS';
  cCommand_FNOP = 'FNOP';
  cCommand_FPATAN = 'FPATAN';

  cCommand_NOP = 'NOP';
  cCommand_INTO = 'INTO';
  cCommand_SCASB = 'SCASB';
  cCommand_LEAVE = 'LEAVE'; 
  cCommand_OUTSB = 'OUTSB';
  cCommand_OUTSD = 'OUTSD';
  cCommand_POPA = 'POPA';
  cCommand_PUSHA = 'PUSHA';
  cCommand_INSB = 'INSB';
  cCommand_INSD = 'INSD';
  cCommand_FLD1 = 'FLD1';
  cCommand_FLDL2T = 'FLDL2T';
  cCommand_FLDL2E = 'FLDL2E';
  cCommand_FLDPI = 'FLDPI';
  cCommand_FLDLG2 = 'FLDLG2';
  cCommand_FLDLN2 = 'FLDLN2';
  cCommand_FLDZ = 'FLDZ';
  cCommand_F2XM1 = 'F2XM1';
  cCommand_FYL2X = 'FYL2X';
  cCommand_FPTAN = 'FPTAN';
  cCommand_FSINCOS = 'FSINCOS';
  cCommand_FRNDINT = 'FRNDINT';
  cCommand_FINCSTP = 'FINCSTP';
  cCommand_FPREM = 'FPREM';
  cCommand_FYL2XP1 = 'FYL2XP1';
  cCommand_FSQRT = 'FSQRT';
  cCommand_SYSENTER = 'SYSENTER';
  cCommand_ENTER = 'ENTER';

  cCommand_CLC = 'CLC';
  cCommand_STC = 'STC';
  cCommand_CLD = 'CLD';
  cCommand_STD = 'STD';
  cCommand_CLI = 'CLI';
  cCommand_STI = 'STI';
  cCommand_RET = 'RET';
  cCommand_RSM = 'RSM';
  cCommand_UD2 = 'UD2';
  cCommand_UD1 = 'UD1';

  cCommand_RETF = 'RETF';
  cCommand_IRET = 'IRET';
  cCommand_MOVSW = 'MOVSW';
  cCommand_CMPSW = 'CMPSW';
  cCommand_STOSW = 'STOSW';
  cCommand_LODSW = 'LODSW';
  cCommand_SCASW = 'SCASW';
  cCommand_CBW = 'CBW';
  cCommand_CWD = 'CWD';
  cCommand_PUSHF = 'PUSHF';
  cCommand_POPF = 'POPF';
  cCommand_DAA = 'DAA';
  cCommand_DAS = 'DAS';
  cCommand_AAA = 'AAA';
  cCommand_AAS = 'AAS';
  cCommand_LAHF = 'LAHF';
  cCommand_SAHF = 'SAHF';
  cCommand_POPAD = 'POPAD';
  cCommand_IRETD = 'IRETD';
  cCommand_SCASD = 'SCASD';
  cCommand_XLATB = 'XLATB';
  cCommand_CDQ = 'CDQ';
  cCommand_FWAIT = 'FWAIT';
  cCommand_MOVSB = 'MOVSB';
  cCommand_LODSB = 'LODSB';
  cCommand_LODSD = 'LODSD';
  cCommand_MOVSD = 'MOVSD';
  cCommand_CMPSB = 'CMPSB';
  cCommand_CMPSD = 'CMPSD';
  cCommand_STOSB = 'STOSB';
  cCommand_STOSD = 'STOSD';
  cCommand_HLT = 'HLT';
  cCommand_CWDE = 'CWDE';
  cCommand_PUNPCKLQDQ = 'PUNPCKLQDQ';
  cCommand_BSWAP = 'BSWAP';

  cCommand_MOVZX = 'MOVZX';
  cCommand_XADD = 'XADD';

  cCommand_JO = 'JO';
  cCommand_JNO = 'JNO';
  cCommand_JB = 'JB'; {JC,JNAE}
  cCommand_JNB = 'JNB'; {JNC,JAE}
  cCommand_JZ = 'JZ'; {JE}
  cCommand_JNZ = 'JNZ'; {JNE}
  cCommand_JBE = 'JBE'; {JNA}
  cCommand_JNBE = 'JNBE'; {JA}
  cCommand_JS = 'JS';
  cCommand_JNS = 'JNS';
  cCommand_JP = 'JP'; {JPE}
  cCommand_JNP = 'JNP';
  cCommand_JL = 'JL';
  cCommand_JNL = 'JNL';
  cCommand_JLE = 'JLE'; {JNG}
  cCommand_JNLE = 'JNLE'; {JG}

  cRegister_EAX = 'EAX';
  cRegister_EBX = 'EBX';
  cRegister_ECX = 'ECX';
  cRegister_EDX = 'EDX';
  cRegister_ESI = 'ESI';
  cRegister_EDI = 'EDI';
  cRegister_EBP = 'EBP';
  cRegister_ESP = 'ESP';

  cRegister_AL = 'AL';
  cRegister_BL = 'BL';
  cRegister_CL = 'CL';
  cRegister_DL = 'DL';
  cRegister_AH = 'AH';
  cRegister_BH = 'BH';
  cRegister_CH = 'CH';
  cRegister_DH = 'DH';

  cRegister_AX = 'AX';
  cRegister_BX = 'BX';
  cRegister_CX = 'CX';
  cRegister_DX = 'DX';
  cRegister_SI = 'SI';
  cRegister_DI = 'DI';
  cRegister_BP = 'BP';
  cRegister_SP = 'SP';
  
  cRegister_CS = 'CS';
  cRegister_DS = 'DS';
  cRegister_ES = 'ES';
  cRegister_FS = 'FS';
  cRegister_GS = 'GS';
  cRegister_SS = 'SS';

  cRegister_CR0 = 'CR0';
  cRegister_CR2 = 'CR2';
  cRegister_CR3 = 'CR3';
  cRegister_CR4 = 'CR4';

  cRegister_DR0 = 'DR0';
  cRegister_DR1 = 'DR1';
  cRegister_DR2 = 'DR2';
  cRegister_DR3 = 'DR3';
  cRegister_DR6 = 'DR6';
  cRegister_DR7 = 'DR7';

  cRegister_MM0 = 'MM0';
  cRegister_MM1 = 'MM1';
  cRegister_MM2 = 'MM2';
  cRegister_MM3 = 'MM3';
  cRegister_MM4 = 'MM4';
  cRegister_MM5 = 'MM5';
  cRegister_MM6 = 'MM6';
  cRegister_MM7 = 'MM7';

  cRegister_XMM0 = 'XMM0';
  cRegister_XMM1 = 'XMM1';
  cRegister_XMM2 = 'XMM2';
  cRegister_XMM3 = 'XMM3';
  cRegister_XMM4 = 'XMM4';
  cRegister_XMM5 = 'XMM5';
  cRegister_XMM6 = 'XMM6';
  cRegister_XMM7 = 'XMM7';

  cIndex16s: array[0..7] of string =
('BX+DI', 'BX+SI', 'BP+SI', 'BP+DI', 'SI', 'DI', 'BP', 'BX');
  cRegister32s: array[0..7] of string =
('EAX', 'ECX', 'EDX', 'EBX', 'ESP', 'EBP', 'ESI', 'EDI');
  cRegister16s: array[0..7] of string =
('AX', 'CX', 'DX', 'BX', 'SP', 'BP', 'SI', 'DI');
  cRegister8s: array [0..7] of string =
('AL', 'CL', 'DL', 'BL', 'AH', 'CH', 'DH', 'BH');
  cRegisterSegs: array [0..7] of string =
('ES', 'CS', 'SS', 'DS', 'FS', 'GS', '', '');

const
  cSignChar: array[-1..+1] of string = ('-', '+', '+');

function DasmToStrings( //将机器代码反编译
  mAddress: Integer; //代码所在的内存地址
  mLanguage: string; //机器代码
  mStrings: TStrings; //输出列表
  mDisplay: Boolean = False; //是否显示字符
  mReturn: Boolean = False; //是否返回
  mFunctions: TStringList = nil //函数列表
): Integer; //如果没有错误则返回0否则为错误地址

  function fChatToCommandA(mChar: Char): string;
  begin
    case mChar of
      #$85: Result := cCommand_TEST;
      #$C5: Result := cCommand_LDS;
      #$C4: Result := cCommand_LES;
      #$89, #$8A, #$8B, #$8E: Result := cCommand_MOV;
      #$01, #$02, #$03: Result := cCommand_ADD;
      #$10, #$11, #$12, #$13: Result := cCommand_ADC;
      #$21, #$22, #$23: Result := cCommand_AND;
      #$09, #$0A, #$0B: Result := cCommand_OR;
      #$31, #$32, #$33: Result := cCommand_XOR;
      #$29, #$2A, #$2B: Result := cCommand_SUB;
      #$19, #$1A, #$1B: Result := cCommand_SBB;
      #$39, #$3A, #$3B: Result := cCommand_CMP;
      #$8D: Result := cCommand_LEA;
    end;
  end;

  function fChatToRegisters32A(mChar: Char): string;
  begin
    case mChar of
      #$C0..#$FF: Result := cRegister32s[Ord(mChar) and $07];
      #$00..#$BF: Result := '[' + cRegister32s[Ord(mChar) and $07] + ']';
    end;
  end;

  function fChatToRegisters32B(mChar: Char): string;
  begin
    Result := cRegister32s[Ord(mChar) shr 3 and $07];
  end;

  function fChatToRegisters8A(mChar: Char): string;
  begin
    Result := cRegister8s[Ord(mChar) shr 3 and $07];
  end;

  function fChatToRegisters8B(mChar: Char): string;
  begin
    Result := cRegister8s[Ord(mChar) and $07];
  end;

  function fChatToRegisters16A(mChar: Char): string;
  begin
    Result := cRegister16s[Ord(mChar) and $07];
  end;

  function fChatToRegisters16B(mChar: Char): string;
  begin
    Result := cRegister16s[Ord(mChar) shr 3 and $07];
  end;

  function fChatToRegisters16C(mChar: Char): string;
  begin
    Result := cRegisterSegs[Ord(mChar) shr 3 and $07];
  end;

  function fChatToPrefix(mChar: Char): string;
  begin
    case mChar of
      #$2E: Result := cRegister_CS;
      #$3E: Result := cRegister_DS;
      #$26: Result := cRegister_ES;
      #$64: Result := cRegister_FS;
      #$65: Result := cRegister_GS;
      #$36: Result := cRegister_SS;
    end;
  end;

  function fShortIntParam(mShortInt: ShortInt): string;
  begin
    Result := Format('%s$%.2x', [cSignChar[Sign(mShortInt)], Abs(mShortInt)]);
  end;

  function fSmallintParam(mSmallint: Smallint): string;
  begin
    Result := Format('%s$%.4x', [cSignChar[Sign(mSmallint)], mSmallint]);
  end;

  function fIntegerParam(mInteger: Integer): string;
  begin
    Result := Format('%s$%.8x', [cSignChar[Sign(mInteger)], Abs(mInteger)]);
  end;

  function fByteParam(mByte: ShortInt): string;
  begin
    Result := Format('$%.2x', [PByte(@mByte)^]);
  end;

  function fWordParam(mWord: Smallint): string;
  begin
    Result := Format('$%.4x', [PWord(@mWord)^]);
  end;

  function fLongWordParam(mLongWord: Integer): string;
  begin
    Result := Format('$%.8x', [PLongWord(@mLongWord)^]);
  end;

  function fChatToRegisters32D(mChar: Char): string;
  begin
    Result := cRegister32s[Ord(mChar) and $07];
  end;

  function fChatToRegisters32E(mCharA: Char; mCharB: Char): string;
  begin
    Result := '';
    case mCharA of
      #$20:
      begin
        case mCharB of
          #$C4, #$C5, #$C7, #$C6, #$C2, #$C1, #$C3, #$C0: Result := cRegister_CR0;
          #$D4, #$D5, #$D7, #$D6, #$D2, #$D1, #$D3, #$D0: Result := cRegister_CR2;
          #$DC, #$DD, #$DF, #$DE, #$DA, #$D9, #$DB, #$D8: Result := cRegister_CR3;
          #$E4, #$E5, #$E7, #$E6, #$E2, #$E1, #$E3, #$E0: Result := cRegister_CR4;
        end;
      end;
      #$21:
      begin
        case mCharB of
          #$C4, #$C5, #$C7, #$C6, #$C2, #$C1, #$C3, #$C0: Result := cRegister_DR0;
          #$CC, #$CD, #$CF, #$CE, #$CA, #$C9, #$CB, #$C8: Result := cRegister_DR1;
          #$D4, #$D5, #$D7, #$D6, #$D2, #$D1, #$D3, #$D0: Result := cRegister_DR2;
          #$DC, #$DD, #$DF, #$DE, #$DA, #$D9, #$DB, #$D8: Result := cRegister_DR3;
          #$F4, #$F5, #$F7, #$F6, #$F2, #$F1, #$F3, #$F0: Result := cRegister_DR6;
          #$FC, #$FD, #$FF, #$FE, #$FA, #$F9, #$FB, #$F8: Result := cRegister_DR7;
        end;
      end;
    end;
  end;

  function fChatToRegistersMMA(mChar: Char): string;
  begin
    Result := Format('MM%d', [Ord(mChar) shr 3 and $07]);
  end;

  function fChatToRegistersMMB(mChar: Char): string;
  begin
    Result := Format('MM%d', [Ord(mChar) and $07]);
  end;

  function fChatToRegistersXMMA(mChar: Char): string;
  begin
    Result := Format('XMM%d', [Ord(mChar) shr 3 and $07]);
  end;

  function fChatToRegistersXMMB(mChar: Char): string;
  begin
    Result := Format('XMM%d', [Ord(mChar) and $07]);
  end;

  function fReadByte(mLanguage: string; var nSize: Integer): string;
  var
    vShortInt: ShortInt;
  begin
    Result := '';
    if nSize + SizeOf(vShortInt) > Length(mLanguage) then Exit;
    nSize := nSize + SizeOf(vShortInt);
    Move(mLanguage[nSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
    Result := fByteParam(vShortInt);
  end;

  function fReadWord(mLanguage: string; var nSize: Integer): string;
  var
    vSmallint: Smallint;
  begin
    Result := '';
    if nSize + SizeOf(vSmallint) > Length(mLanguage) then Exit;
    nSize := nSize + SizeOf(vSmallint);
    Move(mLanguage[nSize - SizeOf(vSmallint) + 1], vSmallint, SizeOf(vSmallint));
    Result := fWordParam(vSmallint);
  end;

  function fReadLongWord(mLanguage: string; var nSize: Integer): string;
  var
    vInteger: Integer;
  begin
    Result := '';
    if nSize + SizeOf(vInteger) > Length(mLanguage) then Exit;
    nSize := nSize + SizeOf(vInteger);
    Move(mLanguage[nSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
    Result := fLongWordParam(vInteger);
  end;

  function fDataAddress32(mLanguage: string; var nSize: Integer;
    mPrefix: string; mRegisters: Byte = 32): string;
  var
    vInteger: Integer;
    vShortInt: ShortInt;
    I: Integer;
  begin
    Result := '';
    if nSize > Length(mLanguage) then Exit;
    Result := fChatToRegisters32A(mLanguage[nSize]);
    case mLanguage[nSize] of
      #$25, #$05, #$0D, #$35, #$1D, #$2D, #$3D, #$15:
      begin
        if nSize + SizeOf(vInteger) > Length(mLanguage) then Exit;
        nSize := nSize + SizeOf(vInteger);
        Move(mLanguage[nSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
        if Assigned(mFunctions) then
        begin
          I := mFunctions.IndexOfObject(Pointer(vInteger));
          if I >= 0 then
            Result := Format('[%s](%s)', [fLongWordParam(vInteger), mFunctions[I]])
          else Result := Format('[%s]', [fLongWordParam(vInteger)]);
        end else Result := Format('[%s]', [fLongWordParam(vInteger)]);
      end;
      #$04, #$1C, #$0C, #$14, #$34, #$3C, #$2C, #$24:
      begin
        if nSize + 1 > Length(mLanguage) then Exit;
        nSize := nSize + 1;
        case mLanguage[nSize] of
          #$45, #$5D, #$4D, #$55, #$75, #$7D, #$6D, #$65:
          begin
            if nSize + 4 > Length(mLanguage) then Exit;
            nSize := nSize + 4;
            Move(mLanguage[nSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
            Result := Format('[%s*2+$%.8x]', [fChatToRegisters32B(mLanguage[nSize - 4]), vInteger]);
          end;
          #$85, #$9D, #$8D, #$95, #$A5, #$BD, #$AD, #$B5:
          begin
            if nSize + 4 > Length(mLanguage) then Exit;
            nSize := nSize + 4;
            Move(mLanguage[nSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
            Result := Format('[%s*4+$%.8x]', [fChatToRegisters32B(mLanguage[nSize - 4]), vInteger]);
          end;
          #$C5, #$DD, #$CD, #$D5, #$F5, #$FD, #$ED, #$E5:
          begin
            if nSize + 4 > Length(mLanguage) then Exit;
            nSize := nSize + 4;
            Move(mLanguage[nSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
            Result := Format('[%s*8+$%.8x]', [fChatToRegisters32B(mLanguage[nSize - 4]), vInteger]);
          end;
          #$44, #$5C, #$4C, #$54, #$74, #$7C, #$6C,
          #$41, #$59, #$49, #$51, #$71, #$79, #$69,
          #$42, #$5A, #$4A, #$52, #$72, #$7A, #$6A,
          #$46, #$5E, #$4E, #$56, #$76, #$7E, #$6E,
          #$40, #$58, #$48, #$50, #$70, #$78, #$68,
          #$43, #$5B, #$4B, #$53, #$73, #$7B, #$6B:
          begin
            Result := StringReplace(fChatToRegisters32A(mLanguage[nSize]), '[',
              Format('[%s*2+', [fChatToRegisters32B(mLanguage[nSize])]), []);
          end;
          #$24: ;
          #$23: Result := fChatToRegisters32A(mLanguage[nSize]);
        else
          begin
            Result := StringReplace(fChatToRegisters32A(mLanguage[nSize]), '[',
              Format('[%s+', [fChatToRegisters32B(mLanguage[nSize])]), []);
          end;
        end;
      end;
      #$10, #$13, #$11, #$12, #$16, #$17: ;
      #$84, #$85, #$87, #$86, #$82, #$81, #$83, #$80,
      #$9C, #$9D, #$9F, #$9E, #$9A, #$99, #$9B, #$98,
      #$8C, #$8D, #$8F, #$8E, #$8A, #$89, #$8B, #$88,
      #$94, #$95, #$97, #$96, #$92, #$91, #$93, #$90,
      #$B4, #$B5, #$B7, #$B6, #$B2, #$B1, #$B3, #$B0,
      #$BC, #$BD, #$BF, #$BE, #$BA, #$B9, #$BB, #$B8,
      #$AC, #$AD, #$AF, #$AE, #$AA, #$A9, #$AB, #$A8,
      #$A4, #$A5, #$A7, #$A6, #$A2, #$A1, #$A3, #$A0:
      begin
        if nSize + 4 > Length(mLanguage) then Exit;
        case mLanguage[nSize] of
          #$84, #$9C, #$8C, #$94, #$B4, #$BC, #$AC, #$A4:
          begin
            if nSize + 1 > Length(mLanguage) then Exit;
            nSize := nSize + 1;
            case mLanguage[nSize] of
              #$24: ;
              #$40, #$58, #$48, #$50, #$70, #$78, #$68, #$60,
              #$43, #$5B, #$4B, #$53, #$73, #$7B, #$6B, #$63,
              #$41, #$59, #$49, #$51, #$71, #$79, #$69, #$61,
              #$42, #$5A, #$4A, #$52, #$72, #$7A, #$6A, #$62,
              #$46, #$5E, #$4E, #$56, #$76, #$7E, #$6E, #$66,
              #$47, #$5F, #$4F, #$57, #$77, #$7F, #$6F, #$67,
              #$45, #$5D, #$4D, #$55, #$75, #$7D, #$6D, #$65,
              #$44, #$5C, #$4C, #$54, #$74, #$7C, #$6C, #$64:
              begin
                Result := fChatToRegisters32A(mLanguage[nSize]);
                if Pos('[', Result) = 0 then Result := Format('[%s]', [Result]);
                Result := StringReplace(Result, ']', Format('+%s*2]', [fChatToRegisters32B(mLanguage[nSize])]), []);
              end;
              #$38, #$30, #$10, #$08, #$18, #$28, #$00,
              #$3B, #$33, #$13, #$0B, #$1B, #$2B, #$03,
              #$39, #$31, #$11, #$09, #$19, #$29, #$01,
              #$3A, #$32, #$12, #$0A, #$1A, #$2A, #$02,
              #$3E, #$36, #$16, #$0E, #$1E, #$2E, #$06,
              #$3F, #$37, #$17, #$0F, #$1F, #$2F, #$07,
              #$3D, #$35, #$15, #$0D, #$1D, #$2D, #$05,
              #$3C, #$34, #$14, #$0C, #$1C, #$2C, #$04:
              begin
                Result := fChatToRegisters32A(mLanguage[nSize]);
                if Pos('[', Result) = 0 then Result := Format('[%s]', [Result]);
                Result := StringReplace(Result, ']', Format('+%s]', [fChatToRegisters32B(mLanguage[nSize])]), []);
              end;
            end;
          end;
        end;
        nSize := nSize + SizeOf(vInteger);
        Move(mLanguage[nSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
        Result := StringReplace(Result, ']', Format('%s]', [fIntegerParam(vInteger)]), []);
      end;
      #$40..#$7F:
      begin
        if nSize + 1 > Length(mLanguage) then Exit;
        case mLanguage[nSize] of
          #$4C, #$44, #$5C, #$54, #$74, #$7C, #$6C, #$64:
          begin
            if nSize + 1 > Length(mLanguage) then Exit;
            nSize := nSize + 1;
            case mLanguage[nSize] of
              #$80..#$BF:
              begin
                Result := fChatToRegisters32A(mLanguage[nSize]);
                if Pos('[', Result) = 0 then Result := Format('[%s]', [Result]);
                Result := StringReplace(Result, ']', Format('+%s*4]', [fChatToRegisters32B(mLanguage[nSize])]), []);
              end;
              #$C0..#$FF:
              begin
                Result := fChatToRegisters32A(mLanguage[nSize]);
                if Pos('[', Result) = 0 then Result := Format('[%s]', [Result]);
                Result := StringReplace(Result, ']', Format('+%s*8]', [fChatToRegisters32B(mLanguage[nSize])]), []);
              end;
              #$40..#$7F:
              begin
                Result := fChatToRegisters32A(mLanguage[nSize]);
                if Pos('[', Result) = 0 then Result := Format('[%s]', [Result]);
                Result := StringReplace(Result, ']', Format('+%s*2]', [fChatToRegisters32B(mLanguage[nSize])]), []);
              end;
              #$18, #$03, #$00, #$01, #$02, #$06, #$07, #$28, #$04,
              #$1B, #$19, #$1A, #$1E, #$1F, #$2B, #$1C,
              #$09, #$0A, #$0E, #$0F, #$29, #$0C,
              #$12, #$16, #$17, #$2A, #$14,
              #$36, #$37, #$2E, #$34,
              #$3F, #$2F, #$3C,
              #$2D, #$2C:
              begin
                Result := fChatToRegisters32A(mLanguage[nSize]);
                if Pos('[', Result) = 0 then Result := Format('[%s]', [Result]);
                Result := StringReplace(Result, ']', Format('+%s]', [fChatToRegisters32B(mLanguage[3])]), []);
              end;
              #$24: ;
            end;
          end;
        end;
        nSize := nSize + 1;
        Move(mLanguage[nSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
        Result := StringReplace(Result, ']', Format('%s]', [fShortIntParam(vShortInt)]), []);
      end;
    end;
    if mPrefix <> '' then
      Result := StringReplace(Result, '[', Format('%s:[', [mPrefix]), []);
    if Pos('[', Result) <= 0 then
    begin
      case mRegisters of
        16: Result := fChatToRegisters16A(mLanguage[nSize]);
        8: Result := fChatToRegisters8B(mLanguage[nSize]);
      end;
    end else
    begin
      case mRegisters of
        32: Result := StringReplace(Result, '[', 'DWORD PTR [', [rfReplaceAll]);
        16: Result := StringReplace(Result, '[', 'WORD PTR [', [rfReplaceAll]);
        08: Result := StringReplace(Result, '[', 'BYTE PTR [', [rfReplaceAll]);
      end;
    end;
  end;

  function fDataIndex16(mLanguage: string; var nSize: Integer;
    mPrefix: string): string;
  var
    vShortInt: ShortInt;
    vSmallint: Smallint;
  begin
    Result := '';
    case mLanguage[nSize] of
      #$40..#$7D:
      begin
        if nSize + SizeOf(vShortInt) > Length(mLanguage) then Exit;
        Result := Format('[%s]', [cIndex16s[Ord(mLanguage[nSize]) mod 8]]);
        nSize := nSize + SizeOf(vShortInt);
        Move(mLanguage[nSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
        Result := StringReplace(Result, ']', Format('%s]', [fShortIntParam(vShortInt)]), []);
      end;
      #$80..#$BD:
      begin
        if nSize + SizeOf(vSmallint) > Length(mLanguage) then Exit;
        Result := Format('[%s]', [cIndex16s[Ord(mLanguage[nSize]) mod 8]]);
        nSize := nSize + SizeOf(vSmallint);
        Move(mLanguage[nSize - SizeOf(vSmallint) + 1], vSmallint, SizeOf(vSmallint));
        Result := StringReplace(Result, ']', Format('%s]', [fSmallintParam(vSmallint)]), []);
      end;
      #$00..#$3D:
      begin
        Result := Format('[%s]', [cIndex16s[Ord(mLanguage[nSize]) mod 8]]);
      end;
    else Exit;
    end;
    if mPrefix <> '' then
      Result := StringReplace(Result, '[', Format('%s:[', [mPrefix]), []);
    Result := 'WORD PTR ' + Result;
  end;


label lError;
var
  I: Integer;
  vHex: string; //十六进制
  vSize: Integer; //指令所占的大小
  vCommand: string; //指令
  vDataA, vDataB: string; //操作数
  vNote: string; //注释
  vLock: string; //是否有锁
  vPrefix: string; //是否有前缀
  vDBCount: Integer; //数据字符数
  vInteger: Integer;
  vSmallint: Smallint;
  vShortInt: ShortInt;
  vSwapData: Boolean;

  procedure pSwapData;
  var
    T: string;
  begin
    T := vDataA;
    vDataA := vDataB;
    vDataB := T;
  end;

begin
  Result := -1;
  if not Assigned(mStrings) then Exit;
  Result := mAddress;
  mStrings.Clear;
  mStrings.BeginUpdate;
  try
    vLock := '';
    vPrefix := '';
    vHex := '';
    vDBCount := 0;
    while mLanguage <> '' do
    begin
      ///////Begin 开头
      vSwapData := False;
      vSize := 1;
      vCommand := '';
      vDataA := '';
      vDataB := '';
      vNote := '';
      ///////End 开头
      case mLanguage[1] of
        {1}#$D0, {1}#$D1, {1}#$D2, {1}#$D3:
        begin
          if 2 > Length(mLanguage) then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$00..#$07, #$40..#$47, #$80..#$87, #$C0..#$C7: vCommand := cCommand_ROL;
            #$08..#$0F, #$48..#$4F, #$88..#$8F, #$C8..#$CF: vCommand := cCommand_ROR;
            #$10..#$17, #$50..#$57, #$90..#$97, #$D0..#$D7: vCommand := cCommand_RCL;
            #$18..#$1F, #$58..#$5F, #$98..#$9F, #$D8..#$DF: vCommand := cCommand_RCR;
            #$20..#$27, #$60..#$67, #$A0..#$A7, #$E0..#$E7: vCommand := cCommand_SHL;
            #$28..#$2F, #$68..#$6F, #$A8..#$AF, #$E8..#$EF: vCommand := cCommand_SHR;
            #$30..#$37, #$70..#$77, #$B0..#$B7, #$F0..#$F7: vCommand := cCommand_SAL;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF, #$F8..#$FF: vCommand := cCommand_SAR;
          end;
          case mLanguage[1] of
            #$D0:
            begin
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
              vDataB := '1';
            end;
            #$D1:
            begin
              vDataB := '1';
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 32);
            end;
            #$D2:
            begin
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
              vDataB := 'CL';
            end;
            #$D3:
            begin
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 32);
              vDataB := 'CL';
            end;
          end;
        end;
        {1}#$D8:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vSize := vSize + 1;
          case mLanguage[vSize] of
            #$38..#$3F, #$78..#$7F, #$B8..#$BF:
            begin
              vCommand := cCommand_FDIVR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$20..#$27, #$60..#$67, #$A0..#$A7:
            begin
              vCommand := cCommand_FSUB;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$28..#$2F, #$68..#$6F, #$A8..#$AF:
            begin
              vCommand := cCommand_FSUBR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$18..#$1F, #$58..#$5F, #$98..#$9F:
            begin
              vCommand := cCommand_FCOMP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$30..#$37, #$70..#$77, #$B0..#$B7:
            begin
              vCommand := cCommand_FDIV;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$08..#$0F, #$48..#$4F, #$88..#$8F:
            begin
              vCommand := cCommand_FMUL;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$D0..#$D7:
            begin
              vCommand := cCommand_FCOM;
              vDataA := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$E0..#$E7:
            begin
              vCommand := cCommand_FSUB;
              vDataA := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
              vDataB := 'ST';
            end;
            #$E8..#$EF:
            begin
              vCommand := cCommand_FSUBR;
              vDataA := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
              vDataB := 'ST';
            end;
            #$F0..#$F7:
            begin
              vCommand := cCommand_FDIV;
              vDataA := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
              vDataB := 'ST';
            end;
            #$F8..#$FF:
            begin
              vCommand := cCommand_FDIVR;
              vDataA := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
              vDataB := 'ST';
            end;
            #$C8..#$CF:
            begin
              vCommand := cCommand_FMUL;
              vDataA := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
              vDataB := 'ST';
            end;
            #$D8..#$DF:
            begin
              vCommand := cCommand_FCOMP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$C0..#$C7:
            begin
              vCommand := cCommand_FADD;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
          end;
        end;
        {1}#$DB:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vSize := vSize + 1;
          case mLanguage[vSize] of
            #$C0..#$C7:
            begin
              vCommand := cCommand_FCMOVNB;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$D0..#$D7:
            begin
              vCommand := cCommand_FCMOVNBE;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$D8..#$DF:
            begin
              vCommand := cCommand_FCMOVNU;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$C8..#$CF:
            begin
              vCommand := cCommand_FCMOVNE;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$E8..#$EF:
            begin
              vCommand := cCommand_FUCOMI;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$28..#$2F, #$68..#$6F, #$A8..#$AF:
            begin
              vCommand := cCommand_FLD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF:
            begin
              vCommand := cCommand_FSTP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$00..#$07, #$40..#$47, #$80..#$87:
            begin
              vCommand := cCommand_FILD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$10..#$17, #$50..#$57, #$90..#$97:
            begin
              vCommand := cCommand_FIST;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$18..#$1F, #$58..#$5F, #$98..#$9F:
            begin
              vCommand := cCommand_FISTP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$F0..#$F7:
            begin
              vCommand := cCommand_FCOMI;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[vSize]) and $07]);
            end;
            #$E2: vCommand := cCommand_FCLEX;
            #$E3: vCommand := cCommand_FNINIT;
          end;
        end;
(*
        {1}#$D5:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vCommand := '!'; //cCommand_ADF;
          vSize := 2;
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataA := fByteParam(vShortInt);
        end;
*)
        {1}#$E7:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_OUT;
          vDataA := cRegister_EAX;
          //vDataB := fReadByte(mLanguage, vSize)
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataB := fByteParam(vShortInt);
        end;
        {1}#$25:
        begin
          if Length(mLanguage) < 5 then goto lError;
          vSize := 5;
          vDataA := cRegister_EAX;
          vCommand := cCommand_AND;
          Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
          vDataB := fLongWordParam(vInteger);
        end;
        {1}#$F6:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$C0..#$C7:
            begin
              vCommand := cCommand_TEST;
              vDataA := fChatToRegisters8A(mLanguage[2]);
              Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
              vDataB := fByteParam(vShortInt);
            end;
            #$D0..#$D7:
            begin
              vCommand := cCommand_NOT;
              vDataA := fChatToRegisters8A(mLanguage[2]);
            end;
            #$00..#$07, #$40..#$47, #$80..#$87:
            begin
              vCommand := cCommand_TEST;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
              vDataB := fReadByte(mLanguage, vSize);
            end;
          end;
        end;
        {1}#$C0:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vSize := vSize + 1;
          case mLanguage[vSize] of
            #$00..#$07, #$40..#$47, #$80..#$87, #$C0..#$C7: vCommand := cCommand_ROL;
            #$08..#$0F, #$48..#$4F, #$88..#$8F, #$C8..#$CF: vCommand := cCommand_ROR;
            #$10..#$17, #$50..#$57, #$90..#$97, #$D0..#$D7: vCommand := cCommand_RCL;
            #$18..#$1F, #$58..#$5F, #$98..#$9F, #$D8..#$DF: vCommand := cCommand_RCR;
            #$20..#$27, #$60..#$67, #$A0..#$A7, #$E0..#$E7: vCommand := cCommand_SHL;
            #$28..#$2F, #$68..#$6F, #$A8..#$AF, #$E8..#$EF: vCommand := cCommand_SHR;
            #$30..#$37, #$70..#$77, #$B0..#$B7, #$F0..#$F7: vCommand := cCommand_SAL;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF, #$F8..#$FF: vCommand := cCommand_SAR;
          end;
          case mLanguage[vSize] of
            #$00..#$3F: vDataA := fChatToRegisters8A(mLanguage[vSize]);
          else vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
          end;
          vDataB := fReadByte(mLanguage, vSize);
        end;
        {1}#$68:
        begin
          if Length(mLanguage) < 5 then goto lError;
          vSize := 5;
          vCommand := cCommand_PUSH;
          Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
          vDataA := fLongWordParam(vInteger);
        end;
        {1}#$69:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_IMUL;
          case mLanguage[2] of
            #$C0, #$DB, #$C9, #$D2, #$F6, #$FF, #$ED, #$E4: 
            begin
              if Length(mLanguage) < 6 then goto lError;
              vSize := 6;
              Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
              vDataA := fChatToRegisters32A(mLanguage[2]);
              vDataB := fLongWordParam(vInteger);
            end;
            #$00..#$6F:
            begin
              vDataA := fChatToRegisters32B(mLanguage[2]);
              vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
              vSize := vSize + SizeOf(vInteger);
              Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(Integer));
              vDataB := Format('%s,%s', [vDataB, fLongWordParam(vInteger)]);
            end;
          end;
        end;
        {1}#$CD:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_INT;
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataA := fByteParam(vShortInt);
        end;
        {1}#$6B:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_IMUL;
          vDataA := fChatToRegisters32A(mLanguage[2]);
          case mLanguage[2] of
            #$C0, #$DB, #$C9, #$D2, #$F6, #$FF, #$ED, #$E4:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
              vDataB := fByteParam(vShortInt);
            end;
          end;
        end;
        {1}#$A3:
        begin
          if Length(mLanguage) < 5 then goto lError;
          vSize := 5;
          vCommand := cCommand_MOV;
          Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(Integer));
          vDataA := Format('[%s]', [fLongWordParam(vInteger)]);
          vDataB := cRegister_EAX;
        end;
        {1}#$A0:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vCommand := cCommand_MOV;
          vDataA := cRegister_AL;
          vDataB := Format('[%s]', [fReadLongWord(mLanguage, vSize)]);
        end;
        {1}#$A1:
        begin
          if Length(mLanguage) < 5 then goto lError;
          vSize := 5;
          vCommand := cCommand_MOV;
          vDataA := cRegister_EAX;
          Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(Integer));
          vDataB := fLongWordParam(vInteger);
        end;
        {1}#$DF:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$70..#$77, #$30..#$38:
            begin
              vCommand := cCommand_FBSTP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$80..#$87, #$40..#$47,
            #$C0..#$C7, #$00..#$07:
            begin
              vCommand := cCommand_FILD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$10..#$17, #$50..#$57,
            #$90..#$97, #$D0..#$D7:
            begin
              vCommand := cCommand_FIST;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$18..#$1F, #$58..#$5F:
            begin
              vCommand := cCommand_FISTP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$E0..#$E7:
            begin
              vCommand := cCommand_FSTSW;
              vDataA := fChatToRegisters16A(mLanguage[2]);
            end;
            #$E8..#$EF:
            begin
              vCommand := cCommand_FUCOMIP;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$F0..#$F7:
            begin
              vCommand := cCommand_FCOMIP;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
          end;
        end;
        {1}#$9A, {1}#$EA:
        begin
          if Length(mLanguage) < 7 then goto lError;
          case mLanguage[1] of
            #$9A: vCommand := cCommand_CALL;
            #$EA: vCommand := cCommand_JP;
          end;
          vSize := vSize + SizeOf(vSmallint);
          Move(mLanguage[vSize - SizeOf(vSmallint) + 1], vSmallint, SizeOf(vSmallint));
          vSize := vSize + SizeOf(vInteger);
          Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
          vDataA := Format('$%.2x:%.8x', [vSmallint, vInteger]);
        end;
        {1}#$C8:
        begin
          if Length(mLanguage) < 4 then goto lError;
          vCommand := cCommand_ENTER;
          vSize := vSize + SizeOf(vSmallint);
          Move(mLanguage[vSize - SizeOf(vSmallint) + 1], vSmallint, SizeOf(vSmallint));
          vSize := vSize + SizeOf(vShortInt);
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataA := Format('$%.2x,$%.1x', [vSmallint, vShortInt]);
        end;
        {1}#$0F:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$C8..#$CF:
            begin
              vCommand := cCommand_BSWAP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$30: vCommand := cCommand_WRMSR;
            #$31: vCommand := cCommand_RDTSC;
            #$32: vCommand := cCommand_RDMSR;
            #$33: vCommand := cCommand_RDPMC;
            #$34: vCommand := cCommand_SYSENTER;
            #$35: vCommand := cCommand_SYSEXIT;
            #$A2: vCommand := cCommand_CPUID;
            #$AA: vCommand := cCommand_RSM;
            #$B9: vCommand := cCommand_UD1;
            #$06: vCommand := cCommand_CLTS;
            #$08: vCommand := cCommand_INVD;
            #$09: vCommand := cCommand_WBINVD;
            #$0B: vCommand := cCommand_UD2;
            #$0E: vCommand := cCommand_FEMMS;
            #$77: vCommand := cCommand_EMMS;
            #$B7:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              vCommand := cCommand_MOVZX;
              vDataA := cRegister_EAX;
              vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$2E, #$2F:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              case mLanguage[vSize] of
                #$2E: vCommand := cCommand_UCOMISS;
                #$2F: vCommand := cCommand_COMISS;
              end;
              vSize := vSize + 1;
              vDataA := fChatToRegistersXMMA(mLanguage[vSize]);
              vDataB := fChatToRegistersXMMB(mLanguage[vSize]);
            end;
            #$2C, #$2D:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              case mLanguage[vSize] of
                #$2C: vCommand := cCommand_CVTTPS2PI;
                #$2D: vCommand := cCommand_CVTPS2PI;
              end;
              vSize := vSize + 1;
              vDataA := fChatToRegistersMMA(mLanguage[vSize]);
              vDataB := fChatToRegistersXMMB(mLanguage[vSize]);
            end;
            #$28, #$29, #$2A, #$2B:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSwapData := mLanguage[vSize] in [#$29];
              case mLanguage[vSize] of
                #$29, #$28: vCommand := cCommand_MOVAPS;
                #$2A: vCommand := cCommand_CVTPI2PS;
                #$2B: vCommand := cCommand_MOVNTPS;
              end;
              vSize := vSize + 1;
              vDataB := fChatToRegistersXMMA(mLanguage[vSize]);
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$90..#$9F:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              case mLanguage[vSize] of
                #$90: vCommand := cCommand_SETO;
                #$91: vCommand := cCommand_SETNO;
                #$92: vCommand := cCommand_SETC;
                #$93: vCommand := cCommand_SETNC;
                #$94: vCommand := cCommand_SETZ;
                #$95: vCommand := cCommand_SETNZ;
                #$96: vCommand := cCommand_SETBE;
                #$97: vCommand := cCommand_SETA;
                #$98: vCommand := cCommand_SETS;
                #$99: vCommand := cCommand_SETNS;
                #$9A: vCommand := cCommand_SETPE;
                #$9B: vCommand := cCommand_SETPO;
                #$9C: vCommand := cCommand_SETL;
                #$9D: vCommand := cCommand_SETGE;
                #$9E: vCommand := cCommand_SETLE;
                #$9F: vCommand := cCommand_SETG;
              end;
              vSize := vSize + 1;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$00:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$47: vCommand := cCommand_SLDT;
                #$57: vCommand := cCommand_LLDT;
              end;
              vSize := vSize + 1;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$AE:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              case mLanguage[3] of
                #$F0: vCommand := cCommand_MFENCE;
                #$E8: vCommand := cCommand_LFENCE;
                #$F8: vCommand := cCommand_SFENCE;
              end;
            end;
            #$A0:
            begin
              vCommand := cCommand_PUSH;
              vDataA := cRegister_ES;
            end;
            #$A1:
            begin
              vCommand := cCommand_POP;
              vDataA := cRegister_FS;
            end;
            #$A8:
            begin
              vCommand := cCommand_PUSH;
              vDataA := cRegister_GS;
            end;
            #$A9:
            begin
              vCommand := cCommand_POP;
              vDataA := cRegister_GS;
            end;
            #$7E, #$7F, #$6E, #$6F:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSwapData := mLanguage[vSize] in [#$7E, #$7F];
              case mLanguage[vSize] of
                #$6E, #$7E: vCommand := cCommand_MOVD;
                #$6F, #$7F: vCommand := cCommand_MOVQ;
              end;
              vSize := vSize + 1;
              vDataA := fChatToRegistersMMA(mLanguage[vSize]);
              vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$60..#$6B, #$F5, #$DC, #$0F, #$D1, #$D2, #$D3, #$D5, #$74..#$76:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              case mLanguage[2] of
                #$F5: vCommand := cCommand_PMADDWD;
                #$DC: vCommand := cCommand_PADDUSB;
                #$0F: vCommand := cCommand_PFCMPGE;
                #$D1: vCommand := cCommand_PSRLW;
                #$D2: vCommand := cCommand_PSRLD;
                #$D3: vCommand := cCommand_PSRLQ;
                #$D5: vCommand := cCommand_PMULLW;
                #$60: vCommand := cCommand_PUNPCKLBW;
                #$61: vCommand := cCommand_PUNPCKLWD;
                #$62: vCommand := cCommand_PUNPCKLDQ;
                #$63: vCommand := cCommand_PACKSSWB;
                #$64: vCommand := cCommand_PCMPGTB;
                #$65: vCommand := cCommand_PCMPGTW;
                #$66: vCommand := cCommand_PCMPGTD;
                #$67: vCommand := cCommand_PACKUSWB;
                #$68: vCommand := cCommand_PUNPCKHBW;
                #$69: vCommand := cCommand_PUNPCKHWD;
                #$6A: vCommand := cCommand_PUNPCKHDQ;
                #$6B: vCommand := cCommand_PACKSSDW;
                #$74: vCommand := cCommand_PCMPEQB;
                #$75: vCommand := cCommand_PCMPEQW;
                #$76: vCommand := cCommand_PCMPEQD;
              end;
              vDataA := fChatToRegistersMMA(mLanguage[3]);
              vDataB := fChatToRegistersMMB(mLanguage[3]);
            end;
            #$AC, #$A4:
            begin
              if Length(mLanguage) < 3 then goto lError;
              case mLanguage[2] of
                #$AC: vCommand := cCommand_SHLD;
                #$A4: vCommand := cCommand_SHRD;
              end;
              vSize := 3;
              vDataA := fChatToRegisters32B(mLanguage[vSize]);
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix) + ',' + vDataA;
              vSize := vSize + SizeOf(vShortInt);
              Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
              vDataB := fByteParam(vShortInt);
            end;
            #$A5, #$AD:
            begin
              if Length(mLanguage) < 3 then goto lError;
              case mLanguage[2] of
                #$A5: vCommand := cCommand_SHLD;
                #$AD: vCommand := cCommand_SHRD;
              end;
              vSize := 3;
              vDataA := fChatToRegisters32B(mLanguage[vSize]);
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix) + ',' + vDataA;
              vDataB := cRegister_CL;
            end;
            #$BA:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              vCommand := cCommand_BT;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
              vSize := vSize + SizeOf(vShortInt);
              Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
              vDataB := fByteParam(vShortInt);
            end;
            #$B1:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              vCommand := cCommand_CMPXCHG;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
              vDataB := fChatToRegisters32B(mLanguage[3]);
            end;
            #$AB:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              vCommand := cCommand_BTS;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
              vDataB := fChatToRegisters32B(mLanguage[3]);
            end;
            #$B6:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              vCommand := cCommand_MOVZX;
              vDataA := fChatToRegisters32B(mLanguage[3]);
              vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$C1:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              vCommand := cCommand_XADD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
              vDataB := fChatToRegisters32B(mLanguage[3]);
            end;
            #$80..#$8F:
            begin
              if Length(mLanguage) < 6 then goto lError;
              vSize := 6;
              case mLanguage[2] of
                #$80: vCommand := cCommand_JO;
                #$81: vCommand := cCommand_JNO;
                #$82: vCommand := cCommand_JB;
                #$83: vCommand := cCommand_JNB;
                #$84: vCommand := cCommand_JZ;
                #$85: vCommand := cCommand_JNZ;
                #$86: vCommand := cCommand_JBE;
                #$87: vCommand := cCommand_JNBE;
                #$88: vCommand := cCommand_JS;
                #$89: vCommand := cCommand_JNS;
                #$8A: vCommand := cCommand_JP;
                #$8B: vCommand := cCommand_JNP;
                #$8C: vCommand := cCommand_JL;
                #$8D: vCommand := cCommand_JNL;
                #$8E: vCommand := cCommand_JLE;
                #$8F: vCommand := cCommand_JNLE;
              end;
              Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(Integer));
              vDataA := Format('[%s]', [fLongWordParam(Result + vSize + vInteger)]);
              vNote := fIntegerParam(vInteger);
            end;
          else
            begin
              vSize := 3;
              vCommand := cCommand_MOV;
              vDataA := fChatToRegisters32D(mLanguage[3]);
              vDataB := fChatToRegisters32E(mLanguage[2], mLanguage[3]);
            end;
          end;
        end;
        {1}#$86:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_XCHG;
          vDataA := fChatToRegisters8A(mLanguage[2]);
          vDataB := fChatToRegisters8B(mLanguage[2]);
        end;
        {1}#$C6:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_MOV;
          vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
          vSize := vSize + SizeOf(vShortInt);
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataB := fByteParam(vShortInt);
        end;
        {1}#$2E, {1}#$3E, {1}#$26, {1}#$64, {1}#$65, {1}#$36:
        begin
          vPrefix := fChatToPrefix(mLanguage[1]);
          vHex := vHex + StrToHex(Copy(mLanguage, 1, vSize), False);
          Delete(mLanguage, 1, vSize);
          Inc(Result, vSize);
          Continue;
        end;
        {1}#$6A:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_PUSH;
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataA := fByteParam(vShortInt);
        end;
        {1}#$6D: vCommand := cCommand_INSD;
        {1}#$6F: vCommand := cCommand_OUTSD;
        {1}#$17:
        begin
          vCommand := cCommand_POP;
          vDataA := cRegister_SS;
        end;
        {1}#$07:
        begin
          vCommand := cCommand_POP;
          vDataA := cRegister_ES;
        end;
        {1}#$1F:
        begin
          vCommand := cCommand_POP;
          vDataA := cRegister_DS;
        end;
        {1}#$06:
        begin
          vCommand := cCommand_PUSH;
          vDataA := cRegister_ES;
        end;
        {1}#$16:
        begin
          vCommand := cCommand_PUSH;
          vDataA := cRegister_SS;
        end;
        {1}#$1E:
        begin
          vCommand := cCommand_PUSH;
          vDataA := cRegister_DS;
        end;
        {1}#$0E:
        begin
          vCommand := cCommand_PUSH;
          vDataA := cRegister_CS;
        end;
        {1}#$14, {1}#$04, {1}#$34, {1}#$2C, {1}#$1C, {1}#$3C, {1}#$0C, {1}#$A8,
        {1}#$24:
        begin
          if Length(mLanguage) < 2 then goto lError;
          case mLanguage[1] of
            #$14: vCommand := cCommand_ADC;
            #$04: vCommand := cCommand_ADD;
            #$24: vCommand := cCommand_AND;
            #$2C: vCommand := cCommand_SUB;
            #$1C: vCommand := cCommand_SBB;
            #$3C: vCommand := cCommand_CMP;
            #$0C: vCommand := cCommand_OR;
            #$34: vCommand := cCommand_XOR;
            #$A8: vCommand := cCommand_TEST;
          end;
          vDataA := cRegister_AL;
          Move(mLanguage[2], vShortInt, SizeOf(vShortInt));
          vDataB := fByteParam(vShortInt);
          vSize := 2;
        end;
        {1}#$66:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vSize := vSize + 1;
          case mLanguage[vSize] of
            #$F0: vLock := cCommand_LOCK;
            #$F2: vLock := cCommand_REPNZ;
            #$F3: vLock := cCommand_REP;
          end;
          if mLanguage[vSize] in [#$F0, #$F2, #$F3] then vSize := vSize + 1;
          case mLanguage[vSize] of
            #$2E, #$3E, #$26, #$64, #$65, #$36:
            begin
              vPrefix := fChatToPrefix(mLanguage[2]);
              vSize := vSize + 1;
            end;
          end;
          case mLanguage[vSize] of
            #$87:
            begin
              vSize := vSize + 1;
              vCommand := cCommand_XCHG;
              vDataA := fChatToRegisters16B(mLanguage[3]);
              vDataB := fChatToRegisters16A(mLanguage[3]);
            end;
            #$90..#$97:
            begin
              vCommand := cCommand_XCHG;
              vDataA := cRegister16s[0];
              vDataB := fChatToRegisters16A(mLanguage[2]);
            end;
            #$60: vCommand := cCommand_PUSHA;
            #$61: vCommand := cCommand_POPA;
            #$6D: vCommand := cCommand_INSW;
            #$6F: vCommand := cCommand_OUTSW;
            #$CF: vCommand := cCommand_IRET;
            #$A5: vCommand := cCommand_MOVSW;
            #$A7: vCommand := cCommand_CMPSW;
            #$AB: vCommand := cCommand_STOSW;
            #$AD: vCommand := cCommand_LODSW;
            #$AF: vCommand := cCommand_SCASW;
            #$98: vCommand := cCommand_CBW;
            #$99: vCommand := cCommand_CWD;
            #$9C: vCommand := cCommand_PUSHF;
            #$9D: vCommand := cCommand_POPF;
            #$D0, #$D1, #$D2, #$D3:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$00..#$07, #$40..#$47, #$80..#$87, #$C0..#$C7: vCommand := cCommand_ROL;
                #$08..#$0F, #$48..#$4F, #$88..#$8F, #$C8..#$CF: vCommand := cCommand_ROR;
                #$10..#$17, #$50..#$57, #$90..#$97, #$D0..#$D7: vCommand := cCommand_RCL;
                #$18..#$1F, #$58..#$5F, #$98..#$9F, #$D8..#$DF: vCommand := cCommand_RCR;
                #$20..#$27, #$60..#$67, #$A0..#$A7, #$E0..#$E7: vCommand := cCommand_SHL;
                #$28..#$2F, #$68..#$6F, #$A8..#$AF, #$E8..#$EF: vCommand := cCommand_SHR;
                #$30..#$37, #$70..#$77, #$B0..#$B7, #$F0..#$F7: vCommand := cCommand_SAL;
                #$38..#$3F, #$78..#$7F, #$B8..#$BF, #$F8..#$FF: vCommand := cCommand_SAR;
              end;
          case mLanguage[2] of
            #$D0:
            begin
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
              vDataB := '1';
            end;
            #$D1:
            begin
              vDataB := '1';
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$D2:
            begin
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
              vDataB := 'CL';
            end;
            #$D3:
            begin
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
              vDataB := 'CL';
            end;
          end;
(*
              case mLanguage[2] of
                #$D0, #$D1:
                begin
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                  vDataB := '1';
                end;
                #$D2, #$D3:
                begin
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                  vDataB := 'CL';
                end;
              end;
*)
            end;
            #$0F:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              vCommand := cCommand_PCMPEQB;
              vSize := vSize + 1;
              vDataA := fChatToRegistersXMMA(mLanguage[vSize]);
              vDataB := fChatToRegistersXMMB(mLanguage[vSize]);
            end;
            #$81:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$30..#$37, #$70..#$77, #$B0..#$B7:
                begin
                  vCommand := cCommand_XOR;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$18..#$1F, #$58..#$5F, #$98..#$9F:
                begin
                  vCommand := cCommand_SBB;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$28..#$2F, #$68..#$6F, #$A8..#$AF:
                begin
                  vCommand := cCommand_SUB;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$20..#$27, #$60..#$67, #$A0..#$A7:
                begin
                  vCommand := cCommand_AND;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$00..#$07, #$40..#$47, #$80..#$87:
                begin
                  vCommand := cCommand_ADD;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$10..#$17, #$50..#$57, #$90..#$97:
                begin
                  vCommand := cCommand_ADC;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$08..#$0F, #$48..#$4F, #$88..#$8F:
                begin
                  vCommand := cCommand_OR;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$38..#$3F, #$78..#$7F, #$B8..#$BF:
                begin
                  vCommand := cCommand_CMP;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$F7..#$FF:
                begin
                  vCommand := cCommand_CMP;
                  vDataA := fChatToRegisters16A(mLanguage[vSize]);
                end;
              end;
              vDataB := fReadWord(mLanguage, vSize);
            end;
            #$83:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$30..#$37, #$70..#$77, #$B0..#$B7:
                begin
                  vCommand := cCommand_XOR;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$18..#$1F, #$58..#$5F, #$98..#$9F:
                begin
                  vCommand := cCommand_SBB;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$28..#$2F, #$68..#$6F, #$A8..#$AF:
                begin
                  vCommand := cCommand_SUB;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$20..#$27, #$60..#$67, #$A0..#$A7:
                begin
                  vCommand := cCommand_AND;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$10..#$17, #$50..#$57, #$90..#$97:
                begin
                  vCommand := cCommand_ADC;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$00..#$07, #$40..#$47, #$80..#$87:
                begin
                  vCommand := cCommand_ADD;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$08..#$0F, #$48..#$4F, #$88..#$8F:
                begin
                  vCommand := cCommand_OR;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$38..#$3F, #$78..#$7F, #$B8..#$BF:
                begin
                  vCommand := cCommand_CMP;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
              end;
              vDataB := fReadByte(mLanguage, vSize);
            end;
            #$A1:
            begin
              if vSize + SizeOf(vInteger) > Length(mLanguage) then goto lError;
              vCommand := cCommand_MOV;
              vDataA := cRegister_AX;
              vDataB := Format('[%s]', [fReadLongWord(mLanguage, vSize)]);
              if vPrefix <> '' then
                vDataB := StringReplace(vDataB, '[', Format('%s:[', [vPrefix]), []);
            end;
            #$A3:
            begin
              if vSize + SizeOf(Integer) > Length(mLanguage) then goto lError;
              vCommand := cCommand_MOV;
              vDataA := Format('[%s]', [fReadLongWord(mLanguage, vSize)]);
              vDataB := cRegister_EAX;
            end;
            #$FF:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$00..#$07, #$40..#$47, #$80..#$87:
                begin
                  vCommand := cCommand_INC;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$10..#$17, #$50..#$57, #$90..#$97:
                begin
                  vCommand := cCommand_CALL;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$08..#$0f, #$48..#$4F, #$88..#$8F:
                begin
                  vCommand := cCommand_DEC;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
                #$30..#$37, #$70..#$77, #$B0..#$B7:
                begin
                  vCommand := cCommand_PUSH;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
              end;
            end;
            #$C7:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vCommand := cCommand_MOV;
              vSize := vSize + 1;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
              vSize := vSize + SizeOf(vSmallint);
              Move(mLanguage[vSize - SizeOf(vSmallint) + 1], vSmallint, SizeOf(vSmallint));
              vDataB := fWordParam(vSmallint);
            end;
            #$E5:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              vCommand := cCommand_IN;
              Move(mLanguage[3], vShortInt, SizeOf(vShortInt));
              vDataA := cRegister_AX;
              vDataB := fByteParam(vShortInt);
            end;
            #$E7:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              vCommand := cCommand_OUT;
              Move(mLanguage[3], vShortInt, SizeOf(vShortInt));
              vDataA := cRegister_AX;
              vDataB := fByteParam(vShortInt);
            end;
            #$F7:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$D0..#$D7:
                begin
                  vCommand := cCommand_NOT;
                  vDataA := fChatToRegisters16A(mLanguage[vSize]);
                end;
                #$00..#$CF:
                begin
                  vCommand := cCommand_TEST;
                  vSize := vSize;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                  vDataB := fReadWord(mLanguage, vSize);
                end;
              end;
            end;
            #$48..#$4F:
            begin
              vCommand := cCommand_DEC;
              vDataA := fChatToRegisters16B(mLanguage[2]);
            end;
            #$8F:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := 3;
              case mLanguage[3] of
                #$00..#$07, #$40..#$47, #$80..#$87:
                begin
                  vCommand := cCommand_POP;
                  vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
                end;
              end;
            end;
            #$40..#$47:
            begin
              vCommand := cCommand_INC;
              vDataA := fChatToRegisters16B(mLanguage[2]);
            end;
            #$50..#$57:
            begin
              vCommand := cCommand_PUSH;
              vDataA := fChatToRegisters16B(mLanguage[2]);
            end;
            #$58..#$5F:
            begin
              vCommand := cCommand_POP;
              vDataA := fChatToRegisters16B(mLanguage[2]);
            end;
            #$B8..#$BF:
            begin
              if Length(mLanguage) < 4 then goto lError;
              vCommand := cCommand_MOV;
              vDataA := fChatToRegisters16A(mLanguage[2]);
              Move(mLanguage[3], vSmallint, SizeOf(vSmallint));
              vDataB := fWordParam(vSmallint);
              vSize := 4;
            end;
            {2}#$8B, {2}#$85, {2}#$89, {2}#$01, {2}#$11, {2}#$21, {2}#$09,
            {2}#$31, {2}#$29, {2}#$19, {2}#$39, {2}#$3B, {2}#$33, {2}#$0B,
            {2}#$2B, {2}#$1B, {2}#$23, {2}#$13, {2}#$03:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSwapData := mLanguage[vSize] in [#$89, #$85, #$29, #$31,
                #$09, #$91, #$01, #$19, #$21, #$39, #$11, #$32];
              vCommand := fChatToCommandA(mLanguage[vSize]);
              vSize := vSize + 1;
              vDataA := fChatToRegisters16B(mLanguage[vSize]);
              vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
              if Pos('[', vDataB) = 0 then Delete(vDataB, 1, 1);
            end;
            {2}#$8E:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vCommand := fChatToCommandA(mLanguage[2]);
              vDataA := fChatToRegisters16C(mLanguage[3]);
              vDataB := fChatToRegisters16A(mLanguage[3]);
              vSize := 3;
            end;
            #$C1:
            begin
              if Length(mLanguage) < 4 then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$00..#$07, #$40..#$47, #$80..#$87, #$C0..#$C7: vCommand := cCommand_ROL;
                #$08..#$0F, #$48..#$4F, #$88..#$8F, #$C8..#$CF: vCommand := cCommand_ROR;
                #$10..#$17, #$50..#$57, #$90..#$97, #$D0..#$D7: vCommand := cCommand_RCL;
                #$18..#$1F, #$58..#$5F, #$98..#$9F, #$D8..#$DF: vCommand := cCommand_RCR;
                #$20..#$27, #$60..#$67, #$A0..#$A7, #$E0..#$E7: vCommand := cCommand_SHL;
                #$28..#$2F, #$68..#$6F, #$A8..#$AF, #$E8..#$EF: vCommand := cCommand_SHR;
                #$30..#$37, #$70..#$77, #$B0..#$B7, #$F0..#$F7: vCommand := cCommand_SAL;
                #$38..#$3F, #$78..#$7F, #$B8..#$BF, #$F8..#$FF: vCommand := cCommand_SAR;
              end;
              case mLanguage[vSize] of
                #$00..#$3F: vDataA := fChatToRegisters16A(mLanguage[vSize]);
              else vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
              end;
              vDataB := fReadByte(mLanguage, vSize);
            end;
          end;
        end;
        {1}#$80:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vSize := vSize + 1;
          case mLanguage[vSize] of
            #$C0..#$FF:
            begin
              case mLanguage[vSize] of
                #$E0..#$E7: vCommand := cCommand_AND;
                #$D0..#$D7: vCommand := cCommand_ADC;
                #$C0..#$C7: vCommand := cCommand_ADD;
                #$E8..#$EF: vCommand := cCommand_SUB;
                #$D8..#$DE: vCommand := cCommand_SBB;
                #$F8..#$FE: vCommand := cCommand_CMP;
                #$C8..#$CE: vCommand := cCommand_OR;
                #$F0..#$F7: vCommand := cCommand_XOR;
              end;
              vDataA := fChatToRegisters8A(mLanguage[vSize]);
            end;
            #$30..#$37, #$70..#$77, #$B0..#$B7:
            begin
              vCommand := cCommand_XOR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$18..#$1F, #$58..#$5F, #$98..#$9F:
            begin
              vCommand := cCommand_SBB;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$28..#$2F, #$68..#$6F, #$A8..#$AF:
            begin
              vCommand := cCommand_SUB;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$20..#$27, #$60..#$67, #$A0..#$A7:
            begin
              vCommand := cCommand_AND;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$00..#$07, #$40..#$47, #$80..#$87:
            begin
              vCommand := cCommand_ADD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$10..#$17, #$50..#$57, #$90..#$97:
            begin
              vCommand := cCommand_ADC;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$08..#$0F, #$48..#$4F, #$88..#$8F:
            begin
              vCommand := cCommand_OR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF:
            begin
              vCommand := cCommand_CMP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 8);
            end;
          else goto lError;
          end;
          vSize := vSize + SizeOf(vShortInt);
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataB := fByteParam(vShortInt);
        end;
        {1}#$C1:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vSize := vSize + 1;
          case mLanguage[vSize] of
            #$00..#$07, #$40..#$47, #$80..#$87, #$C0..#$C7: vCommand := cCommand_ROL;
            #$08..#$0F, #$48..#$4F, #$88..#$8F, #$C8..#$CF: vCommand := cCommand_ROR;
            #$10..#$17, #$50..#$57, #$90..#$97, #$D0..#$D7: vCommand := cCommand_RCL;
            #$18..#$1F, #$58..#$5F, #$98..#$9F, #$D8..#$DF: vCommand := cCommand_RCR;
            #$20..#$27, #$60..#$67, #$A0..#$A7, #$E0..#$E7: vCommand := cCommand_SHL;
            #$28..#$2F, #$68..#$6F, #$A8..#$AF, #$E8..#$EF: vCommand := cCommand_SHR;
            #$30..#$37, #$70..#$77, #$B0..#$B7, #$F0..#$F7: vCommand := cCommand_SAL;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF, #$F8..#$FF: vCommand := cCommand_SAR;
          end;
          case mLanguage[vSize] of
            #$00..#$3F: vDataA := fChatToRegisters8A(mLanguage[vSize]);
          else vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
          end;
          vDataB := fReadByte(mLanguage, vSize);
        end;
        {1}#$E5:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vCommand := cCommand_IN;
          vSize := 2;
          Move(mLanguage[2], vShortInt, SizeOf(vShortInt));
          vDataA := cRegister_EAX;
          vDataB := fByteParam(vShortInt);
        end;
        {1}#$E4, {1}#$E6:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          Move(mLanguage[2], vShortInt, SizeOf(vShortInt));
          vDataA := cRegister_AL;
          vDataB := fByteParam(vShortInt);
        end;
        {1}#$EB:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vCommand := cCommand_JMP;
          vSize := 2;
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
          vDataA := Format('[%s]', [fLongWordParam(Result + vSize + vShortInt)]);
          vNote := fShortIntParam(vShortInt);
        end;
        {1}#$E8, {1}#$E9:
        begin
          if Length(mLanguage) < 5 then goto lError;
          vSize := 5;
          case mLanguage[1] of
            {1}#$E9: vCommand := cCommand_JMP;
            {1}#$E8: vCommand := cCommand_CALL;
          end;
          Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));

          vInteger := Result + vSize + vInteger;
          if Assigned(mFunctions) then
          begin
            I := mFunctions.IndexOfObject(Pointer(vInteger));
            if I >= 0 then
              vDataA := Format('[%s](%s)', [fLongWordParam(vInteger), mFunctions[I]])
            else vDataA := Format('[%s]', [fLongWordParam(vInteger)]);
          end else vDataA := Format('[%s]', [fLongWordParam(vInteger)]);
          vNote := fIntegerParam(vInteger - Result - vSize);
        end;
        {1}#$FE, {1}#$FF, {1}#$8F, {1}#$F7:
        begin
          if vSize + 1 > Length(mLanguage) then goto lError;
          vSize := vSize + 1;
          case mLanguage[vSize] of
            #$18..#$1F, #$58..#$5F, #$98..#$9F, #$D8..#$DF: vCommand := cCommand_NEG;
            #$20..#$27, #$60..#$67, #$A0..#$A7, #$E0..#$E7: vCommand := cCommand_JMP;
            #$10..#$17, #$50..#$57, #$90..#$97, #$D0..#$D7:
            begin
              case mLanguage[1] of
                #$F7: vCommand := cCommand_NOT;
                #$FF: vCommand := cCommand_CALL;
              end;
            end;
            #$80..#$87, #$40..#$47, #$C0..#$C7, #$00..#$07:
            begin
              case mLanguage[1] of
                #$FF: vCommand := cCommand_INC;
                #$8F: vCommand := cCommand_POP;
                #$FE: vCommand := cCommand_INC;
                #$F7: vCommand := cCommand_TEST;
              end;
            end;
            #$88..#$8F, #$48..#$4F, #$C8..#$CF, #$08..#$0F: vCommand := cCommand_DEC;
            #$30..#$37, #$70..#$77, #$B0..#$B7, #$F0..#$F7: vCommand := cCommand_PUSH;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF, #$F8..#$FF: vCommand := cCommand_IDIV;
          else goto lError;
          end;
          if mLanguage[1] in [#$FE] then
            vDataA := fChatToRegisters8A(mLanguage[2])
          else vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
          if vCommand = cCommand_TEST then
            vDataB := fReadLongWord(mLanguage, vSize);
        end;
        {1}#$F0, {1}#$F2, {1}#$F3:
        begin
          case mLanguage[1] of
            {1}#$F0: vLock := cCommand_LOCK;
            {1}#$F2: vLock := cCommand_REPNZ;
            {1}#$F3: vLock := cCommand_REP;
          end;
          vHex := vHex + StrToHex(Copy(mLanguage, 1, vSize), False);
          Delete(mLanguage, 1, vSize);
          Inc(Result, vSize);
          Continue;
        end;
        {1}#$EC, {1}#$EE:
        begin
          vDataA := 'AL';
          vDataB := 'DX';
          if mLanguage[1] in [{1}#$EE] then pSwapData;
        end;
        {1}#$2D, {1}#$1D, {1}#$A9, {1}#$0D, {1}#$35, {1}#$05, {1}#$3D, {1}#$15,
        {1}#$B8, {1}#$BB, {1}#$B9, {1}#$BA, {1}#$BF, {1}#$BE, {1}#$BD, {1}#$BC:
        begin
          if Length(mLanguage) < 5 then goto lError;
          vSize := 5;

          Move(mLanguage[2], vInteger, SizeOf(vInteger));
          vDataB := Format('$%.8x', [vInteger]);
          case mLanguage[1] of
            {1}#$A9: vCommand := cCommand_TEST;
            {1}#$1D: vCommand := cCommand_SBB;
            {1}#$2D: vCommand := cCommand_SUB;
            {1}#$0D: vCommand := cCommand_OR;
            {1}#$35: vCommand := cCommand_XOR;
            {1}#$05: vCommand := cCommand_ADD;
            {1}#$15: vCommand := cCommand_ADC;
            {1}#$3D: vCommand := cCommand_CMP;
          else vCommand := cCommand_MOV;
          end;
        end;
        {1}#$63:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_ARPL;
          vDataB := fChatToRegisters16B(mLanguage[vSize]);
          vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
        end;
        {1}#$01, {1}#$85, {1}#$8B, {1}#$89, {1}#$33, {1}#$31, {1}#$09, {1}#$19,
        {1}#$21, {1}#$23, {1}#$11, {1}#$29, {1}#$39, {1}#$62, {1}#$8D:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
          vDataB := fChatToRegisters32B(mLanguage[2]);
          vSwapData := mLanguage[1] in [#$8B, #$62, #$8D, #$33];
        end;
        {1}#$67:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$2E, #$3E, #$26, #$64, #$65, #$36:
            begin
              vPrefix := fChatToPrefix(mLanguage[2]);
              vSize := vSize + 1;
            end;
          end;
          case mLanguage[vSize] of
            #$D1, #$C1:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              case mLanguage[vSize + 1] of
                #$40..#$47, #$80..#$87, #$00..#$07: vCommand := cCommand_ROL;
                #$48..#$4F, #$88..#$8F, #$08..#$0F: vCommand := cCommand_ROR;
                #$90..#$97, #$50..#$57, #$10..#$17: vCommand := cCommand_RCL;
                #$98..#$9F, #$58..#$5F, #$18..#$1F: vCommand := cCommand_RCR;
                #$60..#$67, #$A0..#$A7, #$20..#$27: vCommand := cCommand_SHL;
                #$68..#$6F, #$A8..#$AF, #$28..#$2F: vCommand := cCommand_SHR;
              else goto lError;
              end;
            end;
            #$A1, #$C7, #$64, #$8E, #$8C: vCommand := cCommand_MOV;
            #$87: vCommand := cCommand_XCHG;
            #$00, #$01, #$02, #$03: vCommand := cCommand_ADD;
            #$10, #$11, #$12, #$13: vCommand := cCommand_ADC;
            #$20, #$21, #$22, #$23: vCommand := cCommand_AND;
            #$30, #$31, #$32, #$33: vCommand := cCommand_XOR;
            #$19, #$1B, #$1A, #$5A, #$9A, #$18: vCommand := cCommand_SBB;
            #$28, #$29, #$2A, #$2B: vCommand := cCommand_SUB;
            #$38, #$39, #$3A, #$3B: vCommand := cCommand_CMP;
            #$09, #$0B, #$0A, #$4A: vCommand := cCommand_OR;
            #$88, #$89, #$8A, #$8B, #$A2, #$A0: vCommand := cCommand_MOV;
            #$84, #$85, #$A8: vCommand := cCommand_TEST;
            #$8F: vCommand := cCommand_POP;
            #$5F:
            begin
              vCommand := cCommand_POP;
              vDataA := fChatToRegisters32A(mLanguage[vSize]);
            end;
            #$FF:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              case mLanguage[vSize + 1] of
                #$00..#$07, #$40..#$47, #$80..#$87: vCommand := cCommand_INC;
                #$08..#$0F, #$48..#$4F, #$88..#$8F: vCommand := cCommand_DEC;
                #$10..#$17, #$50..#$57, #$90..#$97: vCommand := cCommand_CALL;
                #$20..#$27, #$60..#$67, #$A0..#$A7: vCommand := cCommand_JMP;
                #$30..#$37, #$70..#$77, #$B0..#$B7: vCommand := cCommand_PUSH;
              else goto lError;
              end;
            end;
            #$81, #$83:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              case mLanguage[vSize + 1] of
                #$00..#$07, #$40..#$47, #$80..#$87: vCommand := cCommand_ADD;
                #$10..#$17, #$50..#$57, #$90..#$97: vCommand := cCommand_ADC;
                #$20..#$27, #$60..#$67, #$A0..#$A7: vCommand := cCommand_AND;
                #$30..#$37, #$70..#$77, #$B0, #$B7: vCommand := cCommand_XOR;
                #$18..#$1F, #$58..#$5F, #$98..#$9F: vCommand := cCommand_SBB;
                #$28..#$2F, #$68..#$6F, #$A8..#$AF: vCommand := cCommand_SUB;
                #$38..#$3F, #$78..#$7F, #$B8, #$BF: vCommand := cCommand_CMP;
                #$08..#$0F, #$48..#$4F, #$88..#$8F: vCommand := cCommand_OR;
              else goto lError;
              end;
            end;
          end;
          case mLanguage[vSize] of
            #$A8:
            begin
              vDataA := cRegister_AL;
              vSwapData := mLanguage[vSize] in [#$A2];
              vDataB := Format('%s', [fReadByte(mLanguage, vSize)]);
            end;
            #$A2, #$A0:
            begin
              vDataA := cRegister_AL;
              vSwapData := mLanguage[vSize] in [#$A2];
              vDataB := Format('[%s]', [fReadLongWord(mLanguage, vSize)]);
              if vPrefix <> '' then
                vDataB := StringReplace(vDataB, '[', Format('%s:[', [vPrefix]), []);
            end;
            #$A4: vCommand := cCommand_MOVSB;
            #$A5: vCommand := cCommand_MOVSD;
            #$A6: vCommand := cCommand_CMPSB;
            #$A7: vCommand := cCommand_CMPSD;
            #$AA: vCommand := cCommand_STOSB;
            #$AB: vCommand := cCommand_STOSD;
            #$AC: vCommand := cCommand_LODSB;
            #$AD: vCommand := cCommand_LODSD;
            #$AE: vCommand := cCommand_SCASB;
            #$AF: vCommand := cCommand_SCASD;
            #$A1:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vDataA := cRegister_EAX;
              vDataB := Format('[%s]', [fReadWord(mLanguage, vSize)]);
              if vPrefix <> '' then
                vDataB := StringReplace(vDataB, '[', Format('%s:[', [vPrefix]), []);
            end;
            #$8F, #$FF:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              vDataA := 'DWORD PTR ' + fDataIndex16(mLanguage, vSize, vPrefix);
            end;
            #$00, #$10, #$12, #$22, #$20, #$02, #$0A, #$32, #$18, #$1A, #$08,
            #$30, #$28, #$2A, #$38, #$3A, #$88, #$8A, #$84:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSwapData := mLanguage[vSize] in
                [#$18, #$28, #$38, #$88, #$30, #$20, #$10, #$00];
              vSize := vSize + 1;
              vDataA := fChatToRegisters8A(mLanguage[vSize]);
              vDataB := 'DWORD PTR ' + fDataIndex16(mLanguage, vSize, vPrefix);
            end;
            #$D1:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              vDataA := 'DWORD PTR ' + fDataIndex16(mLanguage, vSize, vPrefix);
              vDataB := fByteParam(1);
            end;
            #$C1, #$83:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              vDataA := 'DWORD PTR ' + fDataIndex16(mLanguage, vSize, vPrefix);
              vSize := vSize + SizeOf(vShortInt);
              Move(mLanguage[vSize - SizeOf(vShortInt) + 1], vShortInt, SizeOf(vShortInt));
              vDataB := fByteParam(vShortInt);
            end;
            #$F7:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              case mLanguage[vSize] of
                #$00..#$07, #$40..#$47, #$80..#$87:
                begin
                  vCommand := cCommand_TEST;
                  vDataA := fDataIndex16(mLanguage, vSize, vPrefix);
                  vDataB := fReadLongWord(mLanguage, vSize);
                end;
                #$10..#$17:
                begin
                  vCommand := cCommand_NOT;
                  vDataA := fDataIndex16(mLanguage, vSize, vPrefix);
                end;
              end;
            end;
            #$C7, #$81:
            begin
              if vSize + 1 > Length(mLanguage) then goto lError;
              vSize := vSize + 1;
              vDataA := fDataIndex16(mLanguage, vSize, vPrefix);
              vDataB := fReadLongWord(mLanguage, vSize);
            end;
            #$8E, #$8C:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSwapData := mLanguage[vSize] in [#$8E];
              vSize := vSize + 1;
              vDataA := fDataIndex16(mLanguage, vSize, vPrefix);
              vDataB := fChatToRegisters16C(mLanguage[vSize]);
            end;
            #$13, #$11, #$21, #$23, #$09, #$0B, #$31, #$33,
            #$29, #$2B, #$19, #$1B, #$39, #$3B,
            #$85, #$87, #$89, #$8B, #$01, #$03:
            begin
              if Length(mLanguage) < 3 then goto lError;
              vSize := vSize + 1;
              vDataB := fChatToRegisters32B(mLanguage[vSize]);
              vDataA := fDataIndex16(mLanguage, vSize, vPrefix);
              if mLanguage[2] in [#$23, #$33, #$2B, #$1B, #$3B, #$03,
                #$8B, #$0B, #$13, #$64] then pSwapData;
            end;
          end;
        end;
        {1}#$2B, {1}#$03, {1}#$0B, {1}#$1B, {1}#$3B,
        {1}#$C5, {1}#$C4, {1}#$13, {1}#$22, {1}#$20:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$C0..#$FF:
            begin
              vDataA := fChatToRegisters8A(mLanguage[2]);
              vDataB := fChatToRegisters8B(mLanguage[2]);
            end;
            #$00..#$BF:
            begin
              vDataB := fChatToRegisters32B(mLanguage[vSize]);
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
          end;
          case mLanguage[1] of
            {1}#$8A: vCommand := cCommand_MOV;
            {1}#$02: vCommand := cCommand_ADD;
            {1}#$0A: vCommand := cCommand_OR;
            {1}#$32, {1}#$30: vCommand := cCommand_XOR;
            {1}#$22, {1}#$20: vCommand := cCommand_AND;
            {1}#$1A: vCommand := cCommand_SBB;
            {1}#$28: vCommand := cCommand_SUB;
            {1}#$3A: vCommand := cCommand_CMP;
            {1}#$10: vCommand := cCommand_ADC;
            {1}#$18: vCommand := cCommand_SBB;
          end;
          vSwapData := mLanguage[1] in [{1}#$1B, {1}#$22, {1}#$89, {1}#$85,
            {1}#$29, {1}#$31, {1}#$09, {1}#$23, {1}#$91, {1}#$01, {1}#$39,
            {1}#$11, {1}#$32];
        end;
        {1}#$84:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_TEST;
          vDataA := fChatToRegisters8B(mLanguage[vSize]);
          vDataB := fChatToRegisters8A(mLanguage[vSize]);
        end;
        {1}#$C7, {1}#$81, {1}#$83, {1}#$87:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[1] of
            #$81, #$83:
            begin
              case mLanguage[2] of
                #$60..#$67, #$20..#$27, #$A0..#$A7, #$E0..#$E7: vCommand := cCommand_AND;
                #$F0..#$F7, #$B0..#$B7, #$70..#$77, #$30..#$37: vCommand := cCommand_XOR;
                #$E8..#$EF, #$68..#$6F, #$28..#$2F, #$A8..#$AF: vCommand := cCommand_SUB;
                #$D8..#$DF, #$18..#$1F, #$58..#$5F, #$98..#$9F: vCommand := cCommand_SBB;
                #$F8..#$FF, #$B8..#$BF, #$78..#$7F, #$38..#$3F: vCommand := cCommand_CMP;
                #$08..#$0F, #$C8..#$CF, #$48..#$4F, #$88..#$8F: vCommand := cCommand_OR;
                #$C0..#$C7, #$00..#$07, #$40..#$47, #$80..#$87: vCommand := cCommand_ADD;
                #$D0..#$D7, #$90..#$97, #$50..#$57, #$10..#$17: vCommand := cCommand_ADC;
              else goto lError;
              end;
            end;
            #$C7: vCommand := cCommand_MOV;
            #$F7: vCommand := cCommand_TEST;
            #$87: vCommand := cCommand_XCHG;
          end;
          case mLanguage[1] of
            #$87:
            begin
              vDataA := fChatToRegisters32B(mLanguage[vSize]);
              vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
              vSwapData := True;
            end;
            #$83:
            begin
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
              if vSize + SizeOf(vShortInt) > Length(mLanguage) then goto lError;
              vDataB := fReadByte(mLanguage, vSize);
            end;
          else
            begin
              if vSize + SizeOf(vInteger) > Length(mLanguage) then goto lError;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
              vSize := vSize + SizeOf(vInteger);
              Move(mLanguage[vSize - SizeOf(vInteger) + 1], vInteger, SizeOf(vInteger));
              vDataB := fLongWordParam(vInteger);
            end;
          end;
        end;
        {1}#$8E, {1}#$8C:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vCommand := cCommand_MOV;
          vDataA := fChatToRegisters16C(mLanguage[2]);
          vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
          if mLanguage[1] in [{1}#$8C] then pSwapData;
        end;
        {1}#$58, {1}#$40, {1}#$50, {1}#$48: vDataA := 'EAX';
        {1}#$5B, {1}#$43, {1}#$53, {1}#$4B: vDataA := 'EBX';
        {1}#$59, {1}#$41, {1}#$51, {1}#$49: vDataA := 'ECX';
        {1}#$5A, {1}#$42, {1}#$52, {1}#$4A: vDataA := 'EDX';
        {1}#$5E, {1}#$46, {1}#$56, {1}#$4E: vDataA := 'ESI';
        {1}#$5F, {1}#$47, {1}#$57, {1}#$4F: vDataA := 'EDI';
        {1}#$5D, {1}#$45, {1}#$55, {1}#$4D: vDataA := 'EBP';
        {1}#$5C, {1}#$44, {1}#$54, {1}#$4C: vDataA := 'ESP';
        {1}#$88, {1}#$8A,
        {1}#$10, {1}#$12,
        {1}#$00, {1}#$02, 
        {1}#$30, {1}#$32,
        {1}#$0A, {1}#$08,
        {1}#$1A, {1}#$18,
        {1}#$3A, {1}#$38,
        {1}#$2A, {1}#$28:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          vDataA := fChatToRegisters8A(mLanguage[vSize]);
          case mLanguage[vSize] of
            #$C0..#$FF:
            begin
              vDataB := fChatToRegisters8B(mLanguage[vSize]);
              vSwapData := mLanguage[1] in [#$10, #$20, #$00, #$88, #$28, #$18, #$30, #$08];
            end;
            #$00..#$BF:
            begin
              vDataB := fDataAddress32(mLanguage, vSize, vPrefix);
              vSwapData := mLanguage[1] in [#$10, #$20, #$00, #$88, #$28, #$18, #$30, #$08];
            end;
          end;
        end;
      end;
      case mLanguage[1] of
        {1}#$CC:
        begin
          vCommand := cCommand_INT;
          vDataA := '3';
        end;
        {1}#$48, {1}#$4B, {1}#$49, {1}#$4A, {1}#$4E, {1}#$4F, {1}#$4D, {1}#$4C: vCommand := cCommand_DEC;
        {1}#$50, {1}#$53, {1}#$51, {1}#$52, {1}#$56, {1}#$57, {1}#$55, {1}#$54: vCommand := cCommand_PUSH;
        {1}#$40, {1}#$43, {1}#$41, {1}#$42, {1}#$46, {1}#$47, {1}#$45, {1}#$44: vCommand := cCommand_INC;
        {1}#$58, {1}#$5B, {1}#$59, {1}#$5A, {1}#$5E, {1}#$5F, {1}#$5D, {1}#$5C: vCommand := cCommand_POP;
        {1}#$8D: vCommand := cCommand_LEA;
        {1}#$89, {1}#$8B: vCommand := cCommand_MOV;
        {1}#$10, {1}#$12: vCommand := cCommand_ADC;
        {1}#$3B, {1}#$39: vCommand := cCommand_CMP;
        {1}#$1B, {1}#$19: vCommand := cCommand_SBB;
        {1}#$02: vCommand := cCommand_ADD;
        {1}#$70, {1}#$71,{1}#$72, {1}#$73, {1}#$74, {1}#$75, {1}#$76, {1}#$77,
        {1}#$78, {1}#$79,{1}#$7A, {1}#$7B, {1}#$7C, {1}#$7D, {1}#$7E, {1}#$7F:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          Move(mLanguage[2], vShortInt, SizeOf(vShortInt));
          vDataA := fLongWordParam(Result + vShortInt + vSize);
          vNote := fShortIntParam(vShortInt);
          case mLanguage[1] of
            {2}#$70: vCommand := cCommand_JO;
            {2}#$71: vCommand := cCommand_JNO;
            {2}#$72: vCommand := cCommand_JB;
            {2}#$73: vCommand := cCommand_JNB;
            {2}#$74: vCommand := cCommand_JZ;
            {2}#$75: vCommand := cCommand_JNZ;
            {2}#$76: vCommand := cCommand_JBE;
            {2}#$77: vCommand := cCommand_JNBE;
            {2}#$78: vCommand := cCommand_JS;
            {2}#$79: vCommand := cCommand_JNS;
            {2}#$7A: vCommand := cCommand_JP;
            {2}#$7B: vCommand := cCommand_JNP;
            {2}#$7C: vCommand := cCommand_JL;
            {2}#$7D: vCommand := cCommand_JNL;
            {2}#$7E: vCommand := cCommand_JLE;
            {2}#$7F: vCommand := cCommand_JNLE;
          end;
        end;
        {1}#$B0, {1}#$B3, {1}#$B1, {1}#$B2, {1}#$B4, {1}#$B7, {1}#$B5, {1}#$B6:
        begin
          vDataA := fChatToRegisters8B(mLanguage[1]);
          Move(mLanguage[2], vShortInt, SizeOf(vShortInt));
          vDataB := fByteParam(vShortInt);
          vCommand := cCommand_MOV;
          vSize := 2;
        end;
        {1}#$EC, {1}#$E4: vCommand := cCommand_IN;
        {1}#$EE, {1}#$E6: vCommand := cCommand_OUT;
        {1}#$C5: vCommand := cCommand_LDS;
        {1}#$C4: vCommand := cCommand_LES;
        {1}#$29, {1}#$2B: vCommand := cCommand_SUB;
        {1}#$33, {1}#$31: vCommand := cCommand_XOR;
        {1}#$09, {1}#$0B: vCommand := cCommand_OR;
        {1}#$21, {1}#$23: vCommand := cCommand_AND;
        {1}#$62: vCommand := cCommand_BOUND;
        {1}#$00, {1}#$01, {1}#$03: vCommand := cCommand_ADD;
        {1}#$11, {1}#$13: vCommand := cCommand_ADC;
        {1}#$85: vCommand := cCommand_TEST;
        {1}#$B8, {1}#$0D, {1}#$35, {1}#$A9,
        {1}#$1D, {1}#$2D, {1}#$05, {1}#$15, {1}#$3D: vDataA := cRegister_EAX;
        {1}#$BB: vDataA := cRegister_EBX;
        {1}#$B9: vDataA := cRegister_ECX;
        {1}#$BA: vDataA := cRegister_EDX;
        {1}#$BE: vDataA := cRegister_ESI;
        {1}#$BF: vDataA := cRegister_EDI;
        {1}#$BD: vDataA := cRegister_EBP;
        {1}#$BC: vDataA := cRegister_ESP;
        #$91, #$92, #$96, #$97, #$95, #$94, #$93:
        begin
          vCommand := cCommand_XCHG;
          vDataA := cRegister_EAX;
          case mLanguage[1] of
            #$91: vDataB := cRegister_EBX;
            #$92: vDataB := cRegister_ECX;
            #$96: vDataB := cRegister_EDX;
            #$97: vDataB := cRegister_ESI;
            #$95: vDataB := cRegister_EDI;
            #$94: vDataB := cRegister_EBP;
            #$93: vDataB := cRegister_ESP;
          end;
        end;
        {1}#$32, {1}#$30: vCommand := cCommand_XOR;
        {1}#$22: vCommand := cCommand_AND;
        {1}#$8A, {1}#$88: vCommand := cCommand_MOV;
        {1}#$0A, {1}#$08: vCommand := cCommand_OR;
        {1}#$1A, {1}#$18: vCommand := cCommand_SBB;
        {1}#$2A, {1}#$28: vCommand := cCommand_SUB;
        {1}#$3A, {1}#$38: vCommand := cCommand_CMP;
        {1}#$27: vCommand := cCommand_DAA;
        {1}#$2F: vCommand := cCommand_DAS;
        {1}#$3F: vCommand := cCommand_AAS;
        {1}#$37: vCommand := cCommand_AAA;
        {1}#$C3: vCommand := cCommand_RET;
        {1}#$CB: vCommand := cCommand_RETF;
        {1}#$CF: vCommand := cCommand_IRETD;
        {1}#$CE: vCommand := cCommand_INTO;
        {1}#$C9: vCommand := cCommand_LEAVE;
        {1}#$90: vCommand := cCommand_NOP;
        {1}#$99: vCommand := cCommand_CDQ;
        {1}#$9B: vCommand := cCommand_FWAIT;
        {1}#$9C: vCommand := cCommand_PUSHFD;
        {1}#$9D: vCommand := cCommand_POPFD;
        {1}#$9E: vCommand := cCommand_SAHF;
        {1}#$9F: vCommand := cCommand_LAHF;
        {1}#$61: vCommand := cCommand_POPAD;
        {1}#$6C: vCommand := cCommand_INSB;
        {1}#$6E: vCommand := cCommand_OUTSB;
        {1}#$A4: vCommand := cCommand_MOVSB;
        {1}#$A5: vCommand := cCommand_MOVSD;
        {1}#$A6: vCommand := cCommand_CMPSB;
        {1}#$A7: vCommand := cCommand_CMPSD;
        {1}#$AA: vCommand := cCommand_STOSB;
        {1}#$AB: vCommand := cCommand_STOSD;
        {1}#$AC: vCommand := cCommand_LODSB;
        {1}#$AD: vCommand := cCommand_LODSD;
        {1}#$AE: vCommand := cCommand_SCASB;
        {1}#$AF: vCommand := cCommand_SCASD;
        {1}#$D7: vCommand := cCommand_XLATB;
        {1}#$F4: vCommand := cCommand_HLT;
        {1}#$F5: vCommand := cCommand_CMC;
        {1}#$F8: vCommand := cCommand_CLC;
        {1}#$F9: vCommand := cCommand_STC;
        {1}#$FA: vCommand := cCommand_CLI;
        {1}#$FB: vCommand := cCommand_STI;
        {1}#$FC: vCommand := cCommand_CLD;
        {1}#$FD: vCommand := cCommand_STD;
        {1}#$C2:
        begin
          if vSize + SizeOf(Word) > Length(mLanguage) then goto lError;
          vCommand := cCommand_RET;
          vDataA := fReadWord(mLanguage, vSize);
        end;
        {1}#$D4, {1}#$D5:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[1] of
            {1}#$D4: vCommand := cCommand_AAM;
            {1}#$D5: vCommand := cCommand_AAD;
          end;
          Move(mLanguage[vSize - SizeOf(vShortInt) + 1],
            vShortInt, SizeOf(vShortInt));
          vDataA := fShortIntParam(vShortInt);
        end;
        {1}#$98: vCommand := cCommand_CWDE;
        {1}#$F3:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vCommand := 'REP';
          vSize := 2;
          case mLanguage[2] of
            {2}#$66:
            begin
              if Length(mLanguage) < 3 then goto lError;
              case mLanguage[3] of
                {3}#$AB: vDataA := 'STOSW';
                {3}#$AD: vDataA := 'LODSW';
              else goto lError;
              end;
              vSize := 3;
            end;
            {2}#$AA: vDataA := 'STOSB';
            {2}#$AB: vDataA := 'STOSD';
            {2}#$AC: vDataA := 'LODSB';
            {2}#$AD: vDataA := 'LODSD';
          else goto lError;
          end;
        end;
        {1}#$60: vCommand := cCommand_PUSHAD;
        {1}#$DE:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$00..#$07, #$40..#$47, #$80..#$87:
            begin
              vCommand := cCommand_FIADD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$10..#$17, #$50..#$57, #$90..#$97:
            begin
              vCommand := cCommand_FICOM;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$18..#$1F, #$58..#$5F, #$98..#$9F:
            begin
              vCommand := cCommand_FICOMP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix, 16);
            end;
            #$F0..#$F7:
            begin
              vCommand := cCommand_FDIVRP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$F8..#$FF:
            begin
              vCommand := cCommand_FDIVP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$E8..#$EF:
            begin
              vCommand := cCommand_FDIVP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$C0..#$C7:
            begin
              vCommand := cCommand_FADDP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$C8..#$CF:
            begin
              vCommand := cCommand_FMULP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$D8..#$DF: begin
              vCommand := cCommand_FCOMPP;
              if Ord(mLanguage[2]) and $07 = 1 then
                vNote := Format('ST(%d)', [Ord(mLanguage[2]) and $07])
              else vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$E0..#$E7:
            begin
              vCommand := cCommand_FSUBRP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
          end;
        end;
        {1}#$DA:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$00..#$07, #$40..#$47, #$80..#$87:
            begin
              vCommand := cCommand_FIADD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$08..#$0F, #$48..#$4F, #$88..#$8F:
            begin
              vCommand := cCommand_FIMUL;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$20..#$27, #$60..#$67, #$A0..#$A7:
            begin
              vCommand := cCommand_FISUB;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$28..#$2F, #$68..#$6F, #$A8..#$AF:
            begin
              vCommand := cCommand_FISUBR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$30..#$37, #$70..#$77, #$B0..#$B7:
            begin
              vCommand := cCommand_FIDIV;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF:
            begin
              vCommand := cCommand_FISUBR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$10..#$17, #$50..#$57, #$90..#$97:
            begin
              vCommand := cCommand_FICOMP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$C0..#$C7:
            begin
              vCommand := cCommand_FCMOVB;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$D0..#$D7:
            begin
              vCommand := cCommand_FCMOVBE;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$D8..#$DF:
            begin
              vCommand := cCommand_FCMOVU;
              vDataA := 'ST';
              vDataB := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$E8..#$EF:
            begin
              vCommand := cCommand_FUCOMPP;
              if Ord(mLanguage[2]) and $07 = 1 then
                vNote := Format('ST(%d)', [Ord(mLanguage[2]) and $07])
              else vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
          end;
        end;
        {1}#$D9:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$20, #$27, #$60..#$67, #$A0..#$A7:
            begin
              vCommand := cCommand_FRSTOR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$18..#$1F, #$58..#$5F, #$98..#$9F:
            begin
              vCommand := cCommand_FSTP;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$10..#$17, #$50..#$57, #$90..#$97:
            begin
              vCommand := cCommand_FST;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$00..#$07, #$40..#$47, #$80..#$87:
            begin
              vCommand := cCommand_FLD;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$C0..#$C7:
            begin
              vCommand := cCommand_FLD;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$C8..#$CF:
            begin
              vCommand := cCommand_FXCH;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            {2}#$D0: vCommand := cCommand_FNOP;
            {2}#$E0: vCommand := cCommand_FCHS;
            {2}#$E1: vCommand := cCommand_FABS;
            {2}#$E4: vCommand := cCommand_FTST;
            {2}#$E5: vCommand := cCommand_FXAM;
            {2}#$E8: vCommand := cCommand_FLD1;
            {2}#$E9: vCommand := cCommand_FLDL2T;
            {2}#$EA: vCommand := cCommand_FLDL2E;
            {2}#$EB: vCommand := cCommand_FLDPI;
            {2}#$EC: vCommand := cCommand_FLDLG2;
            {2}#$ED: vCommand := cCommand_FLDLN2;
            {2}#$EE: vCommand := cCommand_FLDZ;
            {2}#$F0: vCommand := cCommand_F2XM1;
            {2}#$F1: vCommand := cCommand_FYL2X;
            {2}#$F2: vCommand := cCommand_FPTAN;
            {2}#$F3: vCommand := cCommand_FPATAN;
            {2}#$F4: vCommand := cCommand_FXTRACT;
            {2}#$F5: vCommand := cCommand_FPREM1;
            {2}#$F6: vCommand := cCommand_FDECSTP;
            {2}#$F7: vCommand := cCommand_FINCSTP;
            {2}#$F8: vCommand := cCommand_FPREM;
            {2}#$F9: vCommand := cCommand_FYL2XP1;
            {2}#$FA: vCommand := cCommand_FSQRT;
            {2}#$FB: vCommand := cCommand_FSINCOS;
            {2}#$FC: vCommand := cCommand_FRNDINT;
            {2}#$FD: vCommand := cCommand_FSCALE;
            {2}#$FE: vCommand := cCommand_FSIN;
            {2}#$FF: vCommand := cCommand_FCOS;
          end;
        end;
        {1}#$DC:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$F0..#$F7:
            begin
              vCommand := cCommand_FDIVR;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST'; 
            end;
            #$F8..#$FF:
            begin
              vCommand := cCommand_FDIV;
              if Ord(mLanguage[2]) and $07 = 1 then
                vNote := Format('ST(%d)', [Ord(mLanguage[2]) and $07])
              else vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$C0..#$C7:
            begin
              vCommand := cCommand_FADD;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$C8..#$CF:
            begin
              vCommand := cCommand_FMUL;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$D8..#$DF: begin
              vCommand := cCommand_FCOMP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$E0..#$E7:
            begin
              vCommand := cCommand_FSUBR;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
            #$E8..#$EF:
            begin
              vCommand := cCommand_FSUB;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
              vDataB := 'ST';
            end;
          end;
        end;
        {1}#$DD:
        begin
          if Length(mLanguage) < 2 then goto lError;
          vSize := 2;
          case mLanguage[2] of
            #$18..#$1F, #$58..#$5F, #$98..#$9F:
            begin
              vCommand := cCommand_FSTP;
              vDataA := 'QWORD PTR ' + fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$38..#$3F, #$78..#$7F, #$B8..#$BF:
            begin
              vCommand := cCommand_FSTSW;
              vDataA := 'WORD PTR ' + fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$30..#$37, #$70..#$77, #$B0..#$B7:
            begin
              vCommand := cCommand_FSAVE;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$20..#$27, #$60..#$67, #$A0..#$A7:
            begin
              vCommand := cCommand_FRSTOR;
              vDataA := fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$10..#$17, #$50..#$57, #$90..#$97:
            begin
              vCommand := cCommand_FST;
              vDataA := 'DWORD PTR ' + fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$00..#$07, #$40..#$47:
            begin
              vCommand := cCommand_FLD;
              vDataA := 'DWORD PTR ' + fDataAddress32(mLanguage, vSize, vPrefix);
            end;
            #$D8..#$DF:
            begin
              vCommand := cCommand_FUCOM;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$E0..#$E7:
            begin
              vCommand := cCommand_FUCOM;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
            #$E8..#$EF:
            begin
              vCommand := cCommand_FUCOMP;
              vDataA := Format('ST(%d)', [Ord(mLanguage[2]) and $07]);
            end;
          end;
        end;
      end;
      ///////Begin 收尾
      if vCommand = '' then
      begin
lError:      
        Inc(vDBCount);
        vHex := vHex + StrToHex(Copy(mLanguage, 1, 1), False);
        Delete(mLanguage, 1, 1);
        Inc(Result, 1);
        vSize := 1;
        Continue;
      end;
      if vLock <> '' then vCommand := vLock + #32 +  vCommand;
      vInteger := Length(vHex) div 2;
      if vDBCount > 0 then
      begin
        if mDisplay then
          vHex := vHex + StringOfChar(#32, 28 - Length(vHex))
        else vHex := '';
        mStrings.AddObject(Format('{ $%.8x:%s } DB %d', [Result - vInteger, vHex, vInteger]), TObject(Result - vInteger));
        vInteger := 0;
        vHex := '';
      end;
      if mDisplay then
      begin
        vHex := vHex + StrToHex(Copy(mLanguage, 1, vSize), False);
        vHex := vHex + StringOfChar(#32, 28 - Length(vHex));
      end else vHex := '';
      vCommand := Format('{ $%.8x:%s } %s', [Result - vInteger, vHex, vCommand]);
      if vSwapData then pSwapData;
      if vDataA <> '' then
      begin
        vCommand := Format('%s %s', [vCommand, vDataA]);
        if vDataB <> '' then
          vCommand := Format('%s,%s', [vCommand, vDataB]);
      end;
      if vNote <> '' then
        vCommand := Format('%s //%s', [vCommand, vNote]);
      vLock := '';
      vPrefix := '';
      vHex := '';
      vDBCount := 0;
      mStrings.AddObject(vCommand, TObject(Result - vInteger));
      if mReturn and (mLanguage[1] in [#$C2, #$C3]) then Exit;
      Delete(mLanguage, 1, vSize);
      Inc(Result, vSize);
      ///////End 收尾
    end;
  finally
    mStrings.EndUpdate;
  end;
  Result := 0;
end; { DasmToStrings }

function DasmToHtml( //将汇编代码处理是HTML
  mInputStrings: TStrings; //输入字符集
  mOutputStrings: TStrings; //输出字符集
  mDisplay: Boolean = False //是否显示字符
  ): Boolean; //返回处理是否成功
var
  I: Integer;
  S: string;
  T: string;
  vAddress: string;
  vLength: Integer;
begin
  Result := False;
  if not Assigned(mInputStrings) then Exit;
  if not Assigned(mOutputStrings) then Exit;
  mOutputStrings.BeginUpdate;
  try
    mOutputStrings.Clear;
    mOutputStrings.Add('<html>');
    mOutputStrings.Add('<script language="javascript">');
    mOutputStrings.Add('function ChangeColor(mSender, mAddress, mColor)');
    mOutputStrings.Add('{');
    mOutputStrings.Add('  mSender = document.all.item(mSender);');
    mOutputStrings.Add('  if (mSender) {mSender.color = mColor;}');
    mOutputStrings.Add('  mAddress = document.all.item(mAddress);');
    mOutputStrings.Add('  if (mAddress) {mAddress.color = mColor;}');
    mOutputStrings.Add('}');
    mOutputStrings.Add('</script>');
    mOutputStrings.Add('<p style="font:10.0pt;color:black;">');
    mOutputStrings.Add('<font face="Courier New">');
    for I := 0 to mInputStrings.Count - 1 do
    begin
      S := mInputStrings[I];
      vLength := Length(StrLeft(StrRight(S, ':'), ' ')) div 2;
      S := StringReplace(S, ' ', '&nbsp;', [rfReplaceAll]) + '<br>';
      vAddress := StrLeft(StrRight(S, '{&nbsp;'), ':');
      S := StringReplace(S, '{&nbsp;' + vAddress + ':',
        Format('<font id="%0:s">{&nbsp;<a href="addr:%0:s,%d">%0:s</a>:',
        [vAddress, vLength]), [rfReplaceAll]);
      S := S + '</font>';
      if Pos('CALL&nbsp;[$', S) > 0 then
      begin
        T := StrLeft(StrRight(S, 'CALL&nbsp;['), ']');
        S := StringReplace(S, 'CALL&nbsp;[' + T + ']',
          Format('CALL&nbsp;<a href="goto:%0:s">[%0:s]</a>', [T]), [rfReplaceAll]);
      end;
      if Pos('}&nbsp;J', S) > 0 then
      begin
        T := '$' + StrLeft(StrRight(S, '&nbsp;$'), '&nbsp;//');
        S := StringReplace(S, '&nbsp;' + T + '&nbsp;//',
          Format('&nbsp;<font id="%0:s_%1:s" onmouseover=' +
'"ChangeColor(''%0:s_%1:s'',''%0:s'',''#ff0000'');" onmouseout=' +
'"ChangeColor(''%0:s_%1:s'',''%0:s'',''#000000'')">%0:s</font>&nbsp;//',
            [T, vAddress]), [rfReplaceAll]);
      end;
      mOutputStrings.Add(S);
    end;
    mOutputStrings.Add('</font></p>');
    mOutputStrings.Add('</html>');
  finally
    mOutputStrings.EndUpdate;
  end;
  Result := True;
end; { DasmToHtml }

end.
