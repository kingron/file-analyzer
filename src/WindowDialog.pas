(*//
标题:窗体选择框
说明:利用不规则窗体实现
设计:Zswang
日期:2004-02-25
//*)

//2007-12-29 Zswang No.1 修正 鼠标停留在本身窗体上不选中

unit WindowDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, ExtCtrls, Graphics, Forms,
  Controls;

type
  TWindowDialog = class(TCommonDialog)
  private
    { Private declarations }
    FTimer: TTimer;
    FColor: TColor;
    FForm: TForm;
    FSelected: THandle;
    FReturn: Boolean;

    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; override;
    property Selected: THandle read FSelected write FSelected;
  published
    { Published declarations }
    property Color: TColor read FColor write FColor default clBlue;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Zswang', [TWindowDialog]);
end;

{ TWindowDialog }

constructor TWindowDialog.Create(AOwner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := TimerTimer;
  FTimer.Enabled := False;
end;

destructor TWindowDialog.Destroy;
begin
  FTimer.Free;
  inherited;
end;

function TWindowDialog.Execute: Boolean;
begin
  FForm := TForm.Create(nil);
  try
    FReturn := True;
    FForm.Color := FColor;
    FForm.BorderStyle := bsNone;
    FForm.FormStyle := fsStayOnTop;
    FForm.Width := 1;
    FForm.Height := 1;
    FForm.OnShow := FormShow;
    FForm.OnKeyDown := FormKeyDown;
    FForm.ShowModal;
    Result := FReturn;
    FTimer.Enabled := False;
  finally
    FForm.Free;
    FForm := nil;
  end;
end;

procedure TWindowDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: TForm(Sender).Close;
    VK_ESCAPE:
    begin
      FSelected := 0;
      FReturn := False;
      TForm(Sender).Close;
    end;
  end;
end;

procedure TWindowDialog.FormShow(Sender: TObject);
begin
  FTimer.Enabled := True;
  FTimer.Interval := 500;
end;

procedure TWindowDialog.TimerTimer(Sender: TObject);
const
  cWidth = 3;
var
  vRect: TRect;
  vHandle: THandle;
  vBoxHandle: THandle;
begin
  if not Assigned(FForm) then Exit;
  if GetForegroundWindow <> FForm.Handle then
  begin
    FForm.Close;
    Exit;
  end;

  if Color = clWindow then
    Color := clBlue
  else Color := clWindow;

  vHandle := WindowFromPoint(Mouse.CursorPos);
  if vHandle = FSelected then Exit;
  if vHandle = FForm.Handle then Exit;                                          //2007-12-29 Zswang No.1
  FSelected := vHandle;
  FForm.Show;
  GetWindowRect(vHandle, vRect);
  FForm.Left := vRect.Left;
  FForm.Top := vRect.Top;
  FForm.Width := vRect.Right - vRect.Left;
  FForm.Height := vRect.Bottom - vRect.Top;

  vRect := FForm.BoundsRect;
  vHandle := CreateRectRgn(0, 0, FForm.Width, FForm.Height);
  vBoxHandle := CreateRectRgn(cWidth, cWidth, FForm.Width - cWidth, FForm.Height - cWidth);
  try
    CombineRgn(vHandle, vHandle, vBoxHandle, RGN_XOR);
    SetWindowRgn(FForm.Handle, vHandle, True);
  finally
    DeleteObject(vHandle);
    DeleteObject(vBoxHandle);
  end;
end;

end.
