//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("dragdropC4.res");
USEUNIT("DragDrop.pas");
USEUNIT("DragDropFile.pas");
USERES("DragDropFile.dcr");
USEUNIT("DragDropFormats.pas");
USEUNIT("DragDropGraphics.pas");
USERES("DragDropGraphics.dcr");
USEUNIT("DragDropPIDL.pas");
USERES("DragDropPIDL.dcr");
USEUNIT("DragDropText.pas");
USERES("DragDropText.dcr");
USEUNIT("DragDropURL.pas");
USERES("DragDropURL.dcr");
USEUNIT("DropMultiTarget.pas");
USERES("DropMultiTarget.dcr");
USEUNIT("DropSource.pas");
USERES("DropSource.dcr");
USEUNIT("DropTarget.pas");
USERES("DropTarget.dcr");
USEPACKAGE("vcl50.bpi");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
	return 1;
}
//---------------------------------------------------------------------------
