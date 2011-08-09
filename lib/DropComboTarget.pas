unit DropComboTarget;

// -----------------------------------------------------------------------------
// Project:         Drag and Drop Component Suite
// Module:          DropComboTarget
// Description:     Implements a swiss-army-knife drop target component.
// Version:         4.0
// Date:            18-MAY-2001
// Target:          Win32, Delphi 5-6
// Authors:         Anders Melander, anders@melander.dk, http://www.melander.dk
// Copyright        � 1997-2001 Angus Johnson & Anders Melander
// -----------------------------------------------------------------------------

interface

uses
  DragDrop,
  DropTarget,
  DragDropFormats,
  DragDropInternet,
  DragDropGraphics,
  DragDropFile,
  DragDropText,
  Classes,
  Graphics,
  ActiveX;

type
  // Note: mfCustom is used to support DataFormatAdapters.
  TComboFormatType = (mfText, mfFile, mfURL, mfBitmap, mfMetaFile, mfData, mfCustom);
  TComboFormatTypes = set of TComboFormatType;

const
  AllComboFormats = [mfText, mfFile, mfURL, mfBitmap, mfMetaFile, mfData];

type
////////////////////////////////////////////////////////////////////////////////
//
//		TDropComboTarget
//
////////////////////////////////////////////////////////////////////////////////
  TDropComboTarget = class(TCustomDropMultiTarget)
  private
    FFileFormat         : TFileDataFormat;
    FFileMapFormat      : TFileMapDataFormat;
    FURLFormat          : TURLDataFormat;
    FBitmapFormat       : TBitmapDataFormat;
    FMetaFileFormat     : TMetaFileDataFormat;
    FTextFormat         : TTextDataFormat;
    FDataFormat         : TDataStreamDataFormat;
    FFormats            : TComboFormatTypes;
  protected
    procedure DoAcceptFormat(const DataFormat: TCustomDataFormat;
      var Accept: boolean); override;
    function GetFiles: TStrings;
    function GetTitle: string;
    function GetURL: string;
    function GetBitmap: TBitmap;
    function GetMetaFile: TMetaFile;
    function GetText: string;
    function GetFileMaps: TStrings;
    function GetStreams: TStreamList;
  public
    constructor Create(AOwner: TComponent); override;
    property Files: TStrings read GetFiles;
    property FileMaps: TStrings read GetFileMaps;
    property URL: string read GetURL;
    property Title: string read GetTitle;
    property Bitmap: TBitmap read GetBitmap;
    property MetaFile: TMetaFile read GetMetaFile;
    property Text: string read GetText;
    property Data: TStreamList read GetStreams;
  published
    property OnAcceptFormat;
    property Formats: TComboFormatTypes read FFormats write FFormats default AllComboFormats;
  end;

  (*
  **   *** WARNING ***
  **
  ** The TDropMultiTarget component has been renamed to TDropComboTarget and
  ** will be removed shortly. See the readme.txt file for instruction on how to
  ** replace TDropMultiTarget with TDropComboTarget.
  *)
  TDropMultiTarget = class(TDropComboTarget);

////////////////////////////////////////////////////////////////////////////////
//
//		Component registration
//
////////////////////////////////////////////////////////////////////////////////
  procedure Register;

implementation

////////////////////////////////////////////////////////////////////////////////
//
//		Component registration
//
////////////////////////////////////////////////////////////////////////////////
procedure Register;
begin
  RegisterComponents(DragDropComponentPalettePage, [TDropComboTarget]);
  RegisterNoIcon([TDropMultiTarget]);
end;


////////////////////////////////////////////////////////////////////////////////
//
//		TDropComboTarget
//
////////////////////////////////////////////////////////////////////////////////
constructor TDropComboTarget.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFileFormat := TFileDataFormat.Create(Self);
  FURLFormat := TURLDataFormat.Create(Self);
  FBitmapFormat := TBitmapDataFormat.Create(Self);
  FMetaFileFormat := TMetaFileDataFormat.Create(Self);
  FTextFormat := TTextDataFormat.Create(Self);
  FFileMapFormat := TFileMapDataFormat.Create(Self);
  FDataFormat := TDataStreamDataFormat.Create(Self);
  FFormats := AllComboFormats;
end;

procedure TDropComboTarget.DoAcceptFormat(const DataFormat: TCustomDataFormat;
  var Accept: boolean);
begin
  if (Accept) then
  begin
    if (DataFormat is TFileDataFormat) or (DataFormat is TFileMapDataFormat) then
      Accept := (mfFile in FFormats)
    else if (DataFormat is TURLDataFormat) then
      Accept := (mfURL in FFormats)
    else if (DataFormat is TBitmapDataFormat) then
      Accept := (mfBitmap in FFormats)
    else if (DataFormat is TMetaFileDataFormat) then
      Accept := (mfMetaFile in FFormats)
    else if (DataFormat is TTextDataFormat) then
      Accept := (mfText in FFormats)
    else if (DataFormat is TDataStreamDataFormat) then
      Accept := (mfData in FFormats)
    else
      Accept := (mfCustom in FFormats)
  end;

  if (Accept) then
    inherited DoAcceptFormat(DataFormat, Accept);

end;

function TDropComboTarget.GetBitmap: TBitmap;
begin
  Result := FBitmapFormat.Bitmap;
end;

function TDropComboTarget.GetFileMaps: TStrings;
begin
  Result := FFileMapFormat.FileMaps;
end;

function TDropComboTarget.GetFiles: TStrings;
begin
  Result := FFileFormat.Files;
end;

function TDropComboTarget.GetMetaFile: TMetaFile;
begin
  Result := FMetaFileFormat.MetaFile;
end;

function TDropComboTarget.GetStreams: TStreamList;
begin
  Result := FDataFormat.Streams;
end;

function TDropComboTarget.GetText: string;
begin
  Result := FTextFormat.Text;
end;

function TDropComboTarget.GetTitle: string;
begin
  Result := FURLFormat.Title;
end;

function TDropComboTarget.GetURL: string;
begin
  Result := FURLFormat.URL;
end;

end.
