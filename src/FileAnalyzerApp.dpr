program FileAnalyzerApp;

uses
  Dialogs,
  Forms,
  FileAnalyzerUnit in 'FileAnalyzerUnit.pas' {FormFileAnalyzer},
  MemoUnit in 'MemoUnit.pas' {FormMemo},
  DasmBrowerUnit in 'DasmBrowerUnit.pas' {FormDasmBrower},
  HexEditorUnit in 'HexEditorUnit.pas' {FormHexEditor},
  ProcessListUnit in 'ProcessListUnit.pas' {FormProcessList},
  WindowDialog in 'WindowDialog.pas',
  CommonFunctions51 in 'CommonFunctions51.pas',
  ControlFunctions51 in 'ControlFunctions51.pas',
  DasmFunctions51 in 'DasmFunctions51.pas',
  StringFunctions51 in 'StringFunctions51.pas',
  LovelyHex20 in 'LovelyHex20.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormFileAnalyzer, FormFileAnalyzer);
  Application.Run;
end.
