{ Note! Some fixes to SynEdit.pas:

  ---------------  Fix 1  ---------------
  Following change must be done to SynEdit.pas to get the enter working correctly.

  (*if SpaceCount2 > 0 then
  begin
  SpaceBuffer := Copy(Lines[BackCounter], 1, SpaceCount2);
  InternalCaretXY := BufferCoord(1, CaretY +1);
  for i := 1 to Length(SpaceBuffer) do
  if SpaceBuffer[i] = #9 then
  CommandProcessor(ecTab, #0, nil)
  else
  CommandProcessor(ecChar, SpaceBuffer[i], nil);
  end;*)

  =>

  if SpaceCount2 > 0 then
  Lines[CaretY] := Copy(Lines[BackCounter], 1, SpaceCount2);
  InternalCaretXY := BufferCoord(SpaceCount2 +1, CaretY +1);

  ---------------  Fix 2  ---------------
  This must be commented: SynHighlighterPas, 1231: //ReadDelphiSetting(iVersionTag, tmpCommentAttri,'Comment') and

  ---------------  Fix 4  ---------------
  Added SynHighlighterWebData: Line 116: TSynWebHtmlVersion - shvUndefined (last)
  138: 'Undefined'

  ---------------  Fix 5  ---------------
  Note!!! Scands are not working with highlighting unless following change:

  SynEditHighlighter: function TSynCustomHighlighter.IsIdentChar(AChar: WideChar): Boolean;
   add -> , '�', '�', '�', '�', '�', '�'
}
unit Document;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ImgList,
  JvExComCtrls, JvComCtrls, Vcl.Menus, BCPageControl, BCButtonedEdit, Directory, Vcl.Buttons,
  SynHighlighterCS, SynHighlighterCpp, SynHighlighterCSS, SynHighlighterJava, SynHighlighterJScript,
  SynHighlighterBat, SynHighlighterPas, SynHighlighterPerl, SynHighlighterPHP, SynHighlighterPython,
  SynHighlighterRuby, SynHighlighterSQL, SynHighlighterTclTk, SynHighlighterTeX, SynHighlighterXML,
  SynHighlighterUNIXShellScript, SynHighlighterVB, SynHighlighterAsm, SynEditHighlighter,
  SynHighlighterHtml, SynEditPrint, SynEditMiscClasses, SynEditSearch, SynEditTypes,
  SynHighlighterWeb, SynHighlighterWebData, SynEditPlugins, Vcl.StdCtrls, Vcl.ActnList, BCCheckBox,
  JvExControls, JvExExtCtrls, JvExtComponent, JvFooter, JvExStdCtrls, JvEdit, BCEdit,
  BCImageList, SynHighlighterRC, SynHighlighterDOT, SynHighlighterLDraw, SynHighlighterHaskell,
  SynHighlighterCPM, SynHighlighterIDL, SynHighlighterMsg, SynHighlighterProgress,
  SynHighlighterGalaxy, SynHighlighterBaan, SynHighlighterInno, SynHighlighterIni,
  SynHighlighterSml, SynHighlighterModelica, SynHighlighterDml, SynHighlighterST,
  SynHighlighterHP48, SynHighlighterHC11, SynHighlighterADSP21xx, SynHighlighterSDD,
  SynHighlighterFoxpro, SynHighlighterCache, SynHighlighterCAC, SynHighlighterGWS,
  SynHighlighterKix, SynHighlighterAWK, SynHighlighterVrml97, SynHighlighterVBScript,
  SynHighlighterCobol, SynHighlighterM3, SynHighlighterFortran, SynHighlighterEiffel,
  PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, BCPopupMenu, SynMacroRecorder, SynEditKeyCmds,
  Vcl.Themes, SynHighlighterDWS;

type
  TUTF8EncodingWithoutBOM = class(TUTF8Encoding)
  public
    function GetPreamble: TBytes; override;
  end;

  TBCSynEdit = class(TSynEdit)
  private
    //FColumnMode: Boolean;
    FDocumentName: string;
    FFileDateTime: TDateTime;
    FHtmlVersion: TSynWebHtmlVersion;
    FSynMacroRecorder: TSynMacroRecorder;
    FEncoding: TEncoding;
    //FModified: Boolean;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoOnProcessCommand(var Command: TSynEditorCommand;
      var AChar: WideChar; Data: pointer); override;
  public
    destructor Destroy; override;
   // procedure Paint; override;
    procedure LoadFromFile(const FileName: String);
    procedure SaveToFile(const FileName: String);
    property DocumentName: string read FDocumentName write FDocumentName;
    property FileDateTime: TDateTime read FFileDateTime write FFileDateTime;
    property HtmlVersion: TSynWebHtmlVersion read FHtmlVersion write FHtmlVersion;
    property SynMacroRecorder: TSynMacroRecorder read FSynMacroRecorder write FSynMacroRecorder;
    property Encoding: TEncoding read FEncoding write FEncoding;
    //property Modified: Boolean read FModified write FModified;
  end;

  TDocumentFrame = class(TFrame)
    ImageList: TBCImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    SynAsmSyn: TSynAsmSyn;
    SynVBSyn: TSynVBSyn;
    SynUNIXShellScriptSyn: TSynUNIXShellScriptSyn;
    SynTeXSyn: TSynTeXSyn;
    SynTclTkSyn: TSynTclTkSyn;
    SynSQLSyn: TSynSQLSyn;
    SynRubySyn: TSynRubySyn;
    SynPerlSyn: TSynPerlSyn;
    ClassicPasSyn: TSynPasSyn;
    SynBatSyn: TSynBatSyn;
    SynJScriptSyn: TSynJScriptSyn;
    SynJavaSyn: TSynJavaSyn;
    ClassicCppSyn: TSynCppSyn;
    ClassicCSSyn: TSynCSSyn;
    PrintDialog: TPrintDialog;
    SynEditPrint: TSynEditPrint;
    SynEditSearch: TSynEditSearch;
    SynWebHtmlSyn: TSynWebHtmlSyn;
    SynWebEngine: TSynWebEngine;
    SynPythonSyn: TSynPythonSyn;
    SearchPanel: TPanel;
    SearchActionList: TActionList;
    SearchCloseAction: TAction;
    SearchFindNextAction: TAction;
    SearchFindPreviousAction: TAction;
    DocumentPanel: TPanel;
    PageControl: TBCPageControl;
    DefaultCSSyn: TSynCSSyn;
    DefaultPasSyn: TSynPasSyn;
    DefaultCppSyn: TSynCppSyn;
    SynEiffelSyn: TSynEiffelSyn;
    SynFortranSyn: TSynFortranSyn;
    SynM3Syn: TSynM3Syn;
    SynCobolSyn: TSynCobolSyn;
    SynVBScriptSyn: TSynVBScriptSyn;
    SynVrml97Syn: TSynVrml97Syn;
    SynAWKSyn: TSynAWKSyn;
    SynKixSyn: TSynKixSyn;
    SynGWScriptSyn: TSynGWScriptSyn;
    SynCACSyn: TSynCACSyn;
    SynCacheSyn: TSynCacheSyn;
    SynFoxproSyn: TSynFoxproSyn;
    SynSDDSyn: TSynSDDSyn;
    SynADSP21xxSyn: TSynADSP21xxSyn;
    SynHC11Syn: TSynHC11Syn;
    SynHP48Syn: TSynHP48Syn;
    SynSTSyn: TSynSTSyn;
    SynDmlSyn: TSynDmlSyn;
    SynModelicaSyn: TSynModelicaSyn;
    SynSMLSyn: TSynSMLSyn;
    SynIniSyn: TSynIniSyn;
    SynInnoSyn: TSynInnoSyn;
    SynBaanSyn: TSynBaanSyn;
    SynGalaxySyn: TSynGalaxySyn;
    SynProgressSyn: TSynProgressSyn;
    SynMsgSyn: TSynMsgSyn;
    SynIdlSyn: TSynIdlSyn;
    SynCPMSyn: TSynCPMSyn;
    SynHaskellSyn: TSynHaskellSyn;
    SynLDRSyn: TSynLDRSyn;
    SynDOTSyn: TSynDOTSyn;
    SynRCSyn: TSynRCSyn;
    BookmarkImagesList: TBCImageList;
    EditorPopupMenu: TBCPopupMenu;
    CutMenuItem: TMenuItem;
    CopyMenuItem: TMenuItem;
    PasteMenuItem: TMenuItem;
    SelectAllMenuItem: TMenuItem;
    Separator1MenuItem: TMenuItem;
    UndoMenuItem: TMenuItem;
    RedoMenuItem: TMenuItem;
    Separator3MenuItem: TMenuItem;
    IncreaseIndentMenuItem: TMenuItem;
    DecreaseIndentMenuItem: TMenuItem;
    Separator5MenuItem: TMenuItem;
    SortAscendingMenuItem: TMenuItem;
    SortDescendingMenuItem: TMenuItem;
    Separator6MenuItem: TMenuItem;
    ToggleCaseMenuItem: TMenuItem;
    Separator2MenuItem: TMenuItem;
    oggleBookmarksMenuItem: TMenuItem;
    GotoBookmarksMenuItem: TMenuItem;
    ClearBookmarksMenuItem: TMenuItem;
    ToggleBookmark1MenuItem: TMenuItem;
    ToggleBookmark2MenuItem: TMenuItem;
    ToggleBookmark0MenuItem: TMenuItem;
    ToggleBookmark3MenuItem: TMenuItem;
    ToggleBookmark4MenuItem: TMenuItem;
    ToggleBookmark5MenuItem: TMenuItem;
    ToggleBookmark6MenuItem: TMenuItem;
    ToggleBookmark7MenuItem: TMenuItem;
    ToggleBookmark8MenuItem: TMenuItem;
    ToggleBookmark9MenuItem: TMenuItem;
    GotoBookmark0MenuItem: TMenuItem;
    GotoBookmark1MenuItem: TMenuItem;
    GotoBookmark2MenuItem: TMenuItem;
    GotoBookmark3MenuItem: TMenuItem;
    GotoBookmark4MenuItem: TMenuItem;
    GotoBookmark5MenuItem: TMenuItem;
    GotoBookmark6MenuItem: TMenuItem;
    GotoBookmark7MenuItem: TMenuItem;
    GotoBookmark8MenuItem: TMenuItem;
    GotoBookmark9MenuItem: TMenuItem;
    InsertLineMenuItem: TMenuItem;
    DeleteWordMenuItem: TMenuItem;
    DeleteLineMenuItem: TMenuItem;
    DeleteEOLMenuItem: TMenuItem;
    Separator4MenuItem: TMenuItem;
    SynMacroRecorder: TSynMacroRecorder;
    SearchClearAction: TAction;
    SynWebCssSyn: TSynWebCssSyn;
    SynWebXmlSyn: TSynWebXmlSyn;
    TwilightCSSyn: TSynCSSyn;
    TwilightPasSyn: TSynPasSyn;
    TwilightCppSyn: TSynCppSyn;
    ToggleBookmarkMenuItem: TMenuItem;
    SearchPanel1: TPanel;
    JvSpeedButton1: TSpeedButton;
    SearchPanel2: TPanel;
    SearchForLabel: TLabel;
    SearchPanel3: TPanel;
    SearchForEdit: TBCEdit;
    SearchPanel4: TPanel;
    JvSpeedButton2: TSpeedButton;
    SearchPanel5: TPanel;
    SpeedButton1: TSpeedButton;
    SearchPanel6: TPanel;
    SpeedButton2: TSpeedButton;
    SearchPanel7: TPanel;
    CaseSensitiveCheckBox: TBCCheckBox;
    SearchPanel8: TPanel;
    WholeWordsCheckBox: TBCCheckBox;
    ImageList25: TBCImageList;
    ImageList50: TBCImageList;
    SynDWSSyn: TSynDWSSyn;
    procedure SynEditChange(Sender: TObject);
    procedure SynEditSplitChange(Sender: TObject);
    procedure SynEditEnter(Sender: TObject);
    procedure SynEditorReplaceText(Sender: TObject; const ASearch,
      AReplace: UnicodeString; Line, Column: Integer;
      var Action: TSynReplaceAction);
    procedure PageControlChange(Sender: TObject);
    procedure SearchCloseActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure ToggleBookmark0MenuItemClick(Sender: TObject);
    procedure GotoBookmark0MenuItemClick(Sender: TObject);
    procedure SearchClearActionExecute(Sender: TObject);
    procedure SynEditSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean;
      var FG, BG: TColor);
    procedure SearchForEditChange(Sender: TObject);
  private
    { Private declarations }
    FCompareImageIndex, FNewImageIndex: Integer;
    FNumberOfNewDocument: Integer;
    FDefaultPath: string;
    FHTMLErrorList: TList;
    FHTMLDocumentChanged: Boolean;
    FSynEditsList: TList;
    //FSystemImageList: TImageList;
    function CreateNewTabSheet(FileName: string = ''): TBCSynEdit;
    function GetActiveTabSheetCaption: string;
    function GetActiveDocumentName: string;
    function GetActiveDocumentFound: Boolean;
    function GetSynEdit(TabSheet: TTabSheet): TBCSynEdit;
    function GetSplitSynEdit(TabSheet: TTabSheet): TBCSynEdit;
    function GetActivePageCaption: string;
    function GetPanel: TPanel;
//    function ActiveSynEdit: TBCSynEdit;
    function Save(TabSheet: TTabSheet; ShowDialog: Boolean = False): string;
      overload;
    procedure InitializeSynEditPrint;
    procedure SelectHighLighter(SynEdit: TBCSynEdit; FileName: string);
    function GetOpenTabSheets: Boolean;
    function GetOpenTabSheetCount: Integer;
    function GetSelectionFound: Boolean;
    function GetCanUndo: Boolean;
    function GetCanRedo: Boolean;
    function CanFindNextPrevious: Boolean;
    function SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
    function FindOpenFile(FileName: string): TBCSynEdit;
    procedure SynEditHTMLPaintTransient(Sender: TObject; Canvas: TCanvas;
      TransientType: TTransientType);
    procedure SynEditPASPaintTransient(Sender: TObject; Canvas: TCanvas;
      TransientType: TTransientType);
    procedure SynEditHTMLOnChange(Sender: TObject);
    procedure DestroyHTMLErrorListItems;
    procedure CheckHTMLErrors;
    function FindHtmlVersion(FileName: string): TSynWebHtmlVersion;
    procedure SetBookmarks(SynEdit: TBCSynEdit; Bookmarks: TStrings);
    procedure DoSearch;
    function GetFileDateTime(FileName: string): TDateTime;
    function GetActiveDocumentModified: Boolean;
    procedure SetMainHighlighterCombo(SynEdit: TBCSynEdit);
    procedure SetMainEncodingCombo(SynEdit: TBCSynEdit);
    procedure UpdateGutter(SynEdit: TBCSynEdit);
    function GetSelectionModeChecked: Boolean;
    function GetSplitChecked: Boolean;
    procedure PageControlRepaint;
    procedure UpdateHighlighterColors;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure New;
    procedure Open(FileName: string = ''; Bookmarks: TStrings = nil;
      Ln: Integer = 0; Ch: Integer = 0);
    procedure Close;
    procedure CloseAll(CloseDocuments: Boolean = True);
    procedure CloseAllOtherPages;
    procedure Save; overload;
    function SaveAs: string;
    procedure SaveAll;
    procedure Undo;
    procedure Redo;
    procedure Cut;
    procedure Copy;
    procedure Paste;
    procedure Print;
    procedure PrintPreview;
    procedure Search;
    procedure FindNext;
    procedure FindPrevious;
    procedure Replace;
    function Preferences: Boolean;
    procedure ToggleBookMark;
    function GetHTMLErrors: TList;
    procedure ReadIniFile;
    function ReadIniOpenFiles: Boolean;
    procedure WriteIniFile;
    procedure NextPage;
    procedure PreviousPage;
    procedure CheckFileDateTimes;
    procedure Refresh(Page: Integer);
    function ToggleWordWrap: Boolean;
    function ToggleLineNumbers: Boolean;
    function ToggleSpecialChars: Boolean;
    procedure ToggleSelectionMode;
    procedure ToggleSplit;
    procedure CompareFiles(FileName: string = '');
    procedure SelectForCompare;
    function ActiveSynEdit: TBCSynEdit;
    function ActiveSplitSynEdit: TBCSynEdit;
    function GetCaretInfo: string;
    function GetModifiedInfo: string;
    function ModifiedDocuments(CheckActive: Boolean = True): Boolean;
    procedure DecreaseIndent;
    procedure IncreaseIndent;
    procedure SelectAll;
    procedure ToggleCase;
    procedure SortAsc;
    procedure SortDesc;
    procedure ClearBookmarks;
    procedure InsertLine;
    procedure DeleteWord;
    procedure DeleteLine;
    procedure DeleteEOL;
    procedure ShowWordCount;
    procedure RecordMacro;
    procedure PlaybackMacro;
    procedure StopMacro;
    procedure LoadMacro;
    procedure SaveMacro;
    procedure UpdateGutterAndControls;
    procedure SetActiveHighlighter(Value: Integer);
    procedure SetActiveEncoding(Value: Integer);
    function GetMacroRecordPauseImageIndex: Integer;
    function IsRecordingMacro: Boolean;
    function IsMacroStopped: Boolean;
    function IsCompareFilesActivePage: Boolean;
    property ActiveTabSheetCaption: string read GetActiveTabSheetCaption;
    property ActiveDocumentName: string read GetActiveDocumentName;
    property ActiveDocumentFound: Boolean read GetActiveDocumentFound;
    property ActiveDocumentModified: Boolean read GetActiveDocumentModified;
    property OpenTabSheets: Boolean read GetOpenTabSheets;
    property OpenTabSheetCount: Integer read GetOpenTabSheetCount;
    property SelectionFound: Boolean read GetSelectionFound;
    property CanUndo: Boolean read GetCanUndo;
    property CanRedo: Boolean read GetCanRedo;
    property DefaultPath: string read FDefaultPath write FDefaultPath;
    property SelectionModeChecked: Boolean read GetSelectionModeChecked;
    property SplitChecked: Boolean read GetSplitChecked;
  end;

implementation

{$R *.dfm}

uses
  PrintPreview, Replace, ConfirmReplace, Common, Lib, Preferences, StyleHooks,
  SynTokenMatch, SynHighlighterWebMisc, Compare, System.Types, Winapi.ShellAPI, System.WideStrings,
  Main, BigIni, Vcl.GraphUtil, SynUnicode;

const
  DEFAULT_FILENAME = 'Document';

var
  FUTF8EncodingWithoutBOM: TEncoding;

{ TUTF8EncodingWithoutBOM }

function TUTF8EncodingWithoutBOM.GetPreamble: TBytes;
begin
  SetLength(Result, 0);
end;

function GetUTF8WithoutBOM: TEncoding;
var
  LEncoding: TEncoding;
begin
  if FUTF8EncodingWithoutBOM = nil then
  begin
    LEncoding := TUTF8EncodingWithoutBOM.Create;
    if InterlockedCompareExchangePointer(Pointer(FUTF8EncodingWithoutBOM), LEncoding, nil) <> nil then
      LEncoding.Free;
  end;
  Result := FUTF8EncodingWithoutBOM;
end;

{ TBCSynEdit }

destructor TBCSynEdit.Destroy;
begin
  if Assigned(FSynMacroRecorder) then
    FSynMacroRecorder.Free;
  inherited;
end;

procedure TBCSynEdit.LoadFromFile(const FileName: String);
var
  LFileStream: TFileStream;
  LBuffer: TBytes;
  WithBom: Boolean;
begin
  FEncoding := nil;
  LFileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    // Identify encoding
    if IsUTF8(LFileStream, WithBom) then
    begin
      if WithBom then
        FEncoding := TEncoding.UTF8
      else
        FEncoding := GetUTF8WithoutBOM;
    end
    else
    begin
      // Read file into buffer
      SetLength(LBuffer, LFileStream.Size);
      LFileStream.ReadBuffer(Pointer(LBuffer)^, Length(LBuffer));
      TEncoding.GetBufferEncoding(LBuffer, FEncoding);
    end;
  finally
    LFileStream.Free;
  end;
  Lines.LoadFromFile(FileName, FEncoding);
end;

procedure TBCSynEdit.SaveToFile(const FileName: String);
begin
  Lines.SaveToFile(FileName, FEncoding);
end;

{ TDocumentFrame }

constructor TDocumentFrame.Create(AOwner: TComponent);
var
  SysImageList: THandle;
  SHFileInfo: TSHFileInfo;
  PathInfo: String;
  Icon: TIcon;
begin
  inherited;
  FNumberOfNewDocument := 0;
  FHTMLErrorList := TList.Create;
  FSynEditsList := TList.Create;

  PageControl.MultiLine := OptionsContainer.MultiLine;

  { IDE can lose these, if the main form is not open }
  EditorPopupMenu.Images := MainForm.ImageList;
  CutMenuItem.Action := MainForm.EditCutAction;
  CopyMenuItem.Action := MainForm.EditCopyAction;
  PasteMenuItem.Action := MainForm.EditPasteAction;
  SelectAllMenuItem.Action := MainForm.EditSelectAllAction;
  UndoMenuItem.Action := MainForm.EditUndoAction;
  RedoMenuItem.Action := MainForm.EditRedoAction;
  InsertLineMenuItem.Action := MainForm.EditInsertLineAction;
  DeleteWordMenuItem.Action := MainForm.EditDeleteWordAction;
  DeleteLineMenuItem.Action := MainForm.EditDeleteLineAction;
  DeleteEOLMenuItem.Action := MainForm.EditDeleteEOLAction;
  IncreaseIndentMenuItem.Action := MainForm.EditIncreaseIndentAction;
  DecreaseIndentMenuItem.Action := MainForm.EditDecreaseIndentAction;
  SortAscendingMenuItem.Action := MainForm.EditSortAscAction;
  SortDescendingMenuItem.Action := MainForm.EditSortDescAction;
  ToggleCaseMenuItem.Action := MainForm.EditToggleCaseAction;
  ClearBookmarksMenuItem.Action := MainForm.ClearBookmarksAction;
  ToggleBookmarkMenuItem.Action := MainForm.ToggleBookmarkAction;

  PageControl.Images := TBCImageList.Create(Self);

  SysImageList := SHGetFileInfo(PChar(PathInfo), 0, SHFileInfo, SizeOf(TSHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  if SysImageList <> 0 then
  begin
    PageControl.Images.Handle := SysImageList;
    PageControl.Images.BkColor := ClNone;
    PageControl.Images.ShareImages := True;
  end;

  { compare and new image index }
  Icon := TIcon.Create;
  try
    { windows font size causing problems here!
      Icon size will be smaller than PageControl.Images size }
    try
      { smaller }
      ImageList.GetIcon(0, Icon);
      FCompareImageIndex := PageControl.Images.AddIcon(Icon);
      ImageList.GetIcon(1, Icon);
      FNewImageIndex := PageControl.Images.AddIcon(Icon);
    except
      try
        { medium }
        ImageList25.GetIcon(0, Icon);
        FCompareImageIndex := PageControl.Images.AddIcon(Icon);
        ImageList25.GetIcon(1, Icon);
        FNewImageIndex := PageControl.Images.AddIcon(Icon);
      except
        try
          { larger }
          ImageList50.GetIcon(0, Icon);
          FCompareImageIndex := PageControl.Images.AddIcon(Icon);
          ImageList50.GetIcon(1, Icon);
          FNewImageIndex := PageControl.Images.AddIcon(Icon);
        except

        end;
      end;
    end;
  finally
    Icon.Free;
  end;
end;

destructor TDocumentFrame.Destroy;
begin
  if Assigned(FHTMLErrorList) then
  begin
    DestroyHTMLErrorListItems;
    FreeAndNil(FHTMLErrorList);
  end;
  if Assigned(FSynEditsList) then
    FreeAndNil(FSynEditsList);
  if Assigned(PageControl.Images) then
    PageControl.Images.Free;

  inherited Destroy;
end;

function TDocumentFrame.FindHtmlVersion(FileName: string): TSynWebHtmlVersion;
var
  Ln: Integer;
  SynEdit: TBCSynEdit;
  S: string;
begin
  Result := OptionsContainer.HtmlVersion; { Default }

  SynEdit := TBCSynEdit.Create(nil);
  SynEdit.LoadFromFile(FileName);

  try
    try
      for Ln := 0 to SynEdit.Lines.Count - 1 do
      begin
        S := SynEdit.Lines[Ln];

        if Pos(UpperCase('<!DOCTYPE html>'), UpperCase(S)) <> 0 then
        begin
          Result := shvHtml5;
          Exit;
        end;
        if Pos(UpperCase('DTD HTML 4.01 Transitional'), UpperCase(S)) <> 0 then
        begin
          Result := shvHtml401Transitional;
          Exit;
        end;
        if Pos(UpperCase('DTD HTML 4.01 Frameset'), UpperCase(S)) <> 0 then
        begin
          Result := shvHtml401Frameset;
          Exit;
        end;
        if Pos(UpperCase('DTD XHTML 1.0 Strict'), UpperCase(S)) <> 0 then
        begin
          Result := shvXHtml10Strict;
          Exit;
        end;
        if Pos(UpperCase('DTD XHTML 1.0 Transitional'), UpperCase(S)) <> 0 then
        begin
          Result := shvXHtml10Transitional;
          Exit;
        end;
        if Pos(UpperCase('DTD XHTML 1.0 Frameset'), UpperCase(S)) <> 0 then
        begin
          Result := shvXHtml10Frameset;
          Exit;
        end;
      end;
    finally
      SynEdit.Free;
    end;
  except

  end;
end;

procedure TDocumentFrame.DestroyHTMLErrorListItems;
var
  i: Integer;
  OutputObject: POutputRec;
begin
  for i := FHTMLErrorList.Count - 1 downto 0 do
  begin
    OutputObject := FHTMLErrorList.Items[i];
    if Assigned(OutputObject) then
    begin
      OutputObject^.Level := 0;
      OutputObject^.Filename := '';
      OutputObject^.Ln := 0;
      OutputObject^.Ch := 0;
      OutputObject^.TextCh := 0;
      OutputObject^.Text := '';
      OutputObject^.SearchString := '';
    end;
    //Finalize(OutputObject^);
  end;
  FHTMLErrorList.Clear;
end;

procedure TDocumentFrame.SelectHighLighter(SynEdit: TBCSynEdit;
  FileName: string);
var
  FileExt: string;
begin
  FileExt := UpperCase(ExtractFileExt(FileName));
  with SynEdit do
  begin
    Color := clWhite;
    ActiveLineColor := clSkyBlue;
    OnPaintTransient := nil;
   // OnChange := nil;
    FHTMLDocumentChanged := False;
    HtmlVersion := shvUndefined;
    SynWebEngine.Options.HtmlVersion := shvUndefined;

    if Pos(FileExt, OptionsContainer.FileType(ftHC11)) <> 0 then
      Highlighter := SynHC11Syn
    else
    if Pos(FileExt, OptionsContainer.FileType(ftAWK)) <> 0 then
      Highlighter := SynAWKSyn
    else
    if Pos(FileExt, OptionsContainer.FileType(ftBaan)) <> 0 then
      Highlighter := SynBaanSyn
    else
    if Pos(FileExt, OptionsContainer.FileType(ftCS)) <> 0 then
    begin
      if OptionsContainer.CPASHighlighter = hClassic then
      begin
        Highlighter := ClassicCSSyn;
        Color := clNavy;
        ActiveLineColor := clBlue;
      end
      else
      if OptionsContainer.CPASHighlighter = hDefault then
      begin
        Highlighter := DefaultCSSyn;
        ActiveLineColor := $E6FFFA;
      end
      else
      begin
        Highlighter := TwilightCSSyn;
        Color := clBlack;
        ActiveLineColor := clGray;
      end
    end
    else if Pos(FileExt, OptionsContainer.FileType(ftCPP)) <> 0 then
    begin
      if OptionsContainer.CPASHighlighter = hClassic then
      begin
        Highlighter := ClassicCppSyn;
        Color := clNavy;
        ActiveLineColor := clBlue;
      end
      else
      if OptionsContainer.CPASHighlighter = hDefault then
      begin
        Highlighter := DefaultCppSyn;
        ActiveLineColor := $E6FFFA;
      end
      else
      begin
        Highlighter := TwilightCppSyn;
        Color := clBlack;
        ActiveLineColor := clGray;
      end
    end
    else if Pos(FileExt, OptionsContainer.FileType(ftCAC)) <> 0 then
      Highlighter := SynCACSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftCache)) <> 0 then
      Highlighter := SynCacheSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftCss)) <> 0 then
      Highlighter := SynWebCssSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftCobol)) <> 0 then
      Highlighter := SynCobolSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftIdl)) <> 0 then
      Highlighter := SynIdlSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftCPM)) <> 0 then
      Highlighter := SynCPMSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftDOT)) <> 0 then
      Highlighter := SynDOTSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftADSP21xx)) <> 0 then
      Highlighter := SynADSP21xxSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftDWScript)) <> 0 then
      Highlighter := SynDWSSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftEiffel)) <> 0 then
      Highlighter := SynEiffelSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftFortran)) <> 0 then
      Highlighter := SynFortranSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftFoxpro)) <> 0 then
      Highlighter := SynFoxproSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftGalaxy)) <> 0 then
      Highlighter := SynGalaxySyn
    else if Pos(FileExt, OptionsContainer.FileType(ftDml)) <> 0 then
      Highlighter := SynDmlSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftGWScript)) <> 0 then
      Highlighter := SynGWScriptSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftHaskell)) <> 0 then
      Highlighter := SynHaskellSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftHP48)) <> 0 then
      Highlighter := SynHP48Syn
    else if (Pos(FileExt, OptionsContainer.FileType(ftHTML)) <> 0) or
      (Pos(FileExt, OptionsContainer.FileType(ftPHP)) <> 0) then
    begin
      Highlighter := SynWebHtmlSyn;
      OnPaintTransient := SynEditHTMLPaintTransient;
      OnChange := SynEditHTMLOnChange;
      FHTMLDocumentChanged := True;
      HtmlVersion := FindHtmlVersion(FileName);
      SynWebEngine.Options.HtmlVersion := HtmlVersion;
    end
    else if Pos(FileExt, OptionsContainer.FileType(ftIni)) <> 0 then
      Highlighter := SynIniSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftInno)) <> 0 then
      Highlighter := SynInnoSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftJava)) <> 0 then
      Highlighter := SynJavaSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftJScript)) <> 0 then
      Highlighter := SynJScriptSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftKix)) <> 0 then
      Highlighter := SynKixSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftLDR)) <> 0 then
      Highlighter := SynLDRSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftModelica)) <> 0 then
      Highlighter := SynModelicaSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftM3)) <> 0 then
      Highlighter := SynM3Syn
    else if Pos(FileExt, OptionsContainer.FileType(ftMsg)) <> 0 then
      Highlighter := SynMsgSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftBat)) <> 0 then
      Highlighter := SynBatSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftPas)) <> 0 then
    begin
      if OptionsContainer.CPASHighlighter = hClassic then
      begin
        Highlighter := ClassicPasSyn;
        Color := clNavy;
        ActiveLineColor := clBlue;
        OnPaintTransient := SynEditPASPaintTransient;
      end
      else
      if OptionsContainer.CPASHighlighter = hDefault then
      begin
        Highlighter := DefaultPasSyn;
        ActiveLineColor := $E6FFFA;
      end
      else
      begin
        Highlighter := TwilightPasSyn;
        Color := clBlack;
        ActiveLineColor := clGray;
        OnPaintTransient := SynEditPASPaintTransient;
      end
    end
    else if Pos(FileExt, OptionsContainer.FileType(ftPerl)) <> 0 then
      Highlighter := SynPerlSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftProgress)) <> 0 then
      Highlighter := SynProgressSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftPython)) <> 0 then
      Highlighter := SynPythonSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftRC)) <> 0 then
      Highlighter := SynRCSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftRuby)) <> 0 then
      Highlighter := SynRubySyn
    else if Pos(FileExt, OptionsContainer.FileType(ftSDD)) <> 0 then
      Highlighter := SynSDDSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftSQL)) <> 0 then
    begin
      Highlighter := SynSQLSyn;
      SynSQLSyn.SQLDialect := OptionsContainer.SQLDialect;
    end
    else if Pos(FileExt, OptionsContainer.FileType(ftSML)) <> 0 then
      Highlighter := SynSMLSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftST)) <> 0 then
      Highlighter := SynSTSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftTclTk)) <> 0 then
      Highlighter := SynTclTkSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftTeX)) <> 0 then
      Highlighter := SynTeXSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftUNIXShellScript)) <> 0 then
      Highlighter := SynUNIXShellScriptSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftVB)) <> 0 then
      Highlighter := SynVBSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftVBScript)) <> 0 then
      Highlighter := SynVBScriptSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftVrml97)) <> 0 then
      Highlighter := SynVrml97Syn
    else if Pos(FileExt, OptionsContainer.FileType(ftAsm)) <> 0 then
      Highlighter := SynAsmSyn
    else if Pos(FileExt, OptionsContainer.FileType(ftXML)) <> 0 then
      Highlighter := SynWebXMLSyn
    else
      HighLighter := nil;
  end;
end;

function GetIconIndex(Name: string; Flags: Cardinal): Integer;
var
  SFI: TSHFileInfo;
begin
  if SHGetFileInfo(PChar(Name), 0, SFI, SizeOf(TSHFileInfo), Flags) = 0 then
    Result := -1
  else
    Result := SFI.iIcon;
end;

function GetImageIndex(Path: string): integer;
begin
  Result := GetIconIndex(Path, SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
end;

function TDocumentFrame.CreateNewTabSheet(FileName: string = ''): TBCSynEdit;
var
  TabSheet: TTabSheet;
  Panel: TPanel;
  SynEdit: TBCSynEdit;
begin
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;

  if FileName <> '' then
    TabSheet.ImageIndex := GetImageIndex(FileName) // SAVED_IMAGEINDEX;
  else
    TabSheet.ImageIndex := FNewImageIndex;
  // TabSheet.DoubleBuffered := True;
  { set the Caption property }
  if FileName = '' then
    TabSheet.Caption := DEFAULT_FILENAME + IntToStr(FNumberOfNewDocument)
  else
    TabSheet.Caption := ExtractFileName(FileName);
  PageControl.ActivePage := TabSheet;
  { create a Panel }
  Panel := TPanel.Create(TabSheet);
  with Panel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Caption := '';
    DoubleBuffered := False;
    Padding.Left := 1;
    Padding.Top := 1;
    if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
      Padding.Right := 3
    else
      Padding.Right := 1;
    Padding.Bottom := 2;
    ParentColor := True;
    ParentDoubleBuffered := False;
  end;

  { create a SynEdit }
  SynEdit := TBCSynEdit.Create(Panel);
  with SynEdit do
  begin
    Visible := False;
    Parent := Panel;
    DocumentName := FileName;
    FileDateTime := GetFileDateTime(FileName);
    Align := alClient;
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -13;
    Font.Name := 'Courier New';
    Font.Style := [];
    Gutter.AutoSize := True;
    Gutter.Font.Charset := DEFAULT_CHARSET;
    Gutter.Font.Color := clWindowText;
    Gutter.Font.Height := -11;
    Gutter.Font.Name := 'Courier New';
    Gutter.Font.Style := [];
    Gutter.ShowLineNumbers := True;
    Gutter.Gradient := False; //True;
    WantTabs := True;
    Options := [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo,
      eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces,
      eoTrimTrailingSpaces, eoScrollPastEol, eoSpecialLineDefaultFg];
    OnChange := SynEditChange;
    OnSpecialLineColors := SynEditSpecialLineColors;
    OnEnter := SynEditEnter;
    OnReplaceText := SynEditorReplaceText;
    SearchEngine := SynEditSearch;
    ActiveLineColor := clSkyBlue;
    PopupMenu := EditorPopupMenu;
    BookMarkOptions.BookmarkImages := BookmarkImagesList;
    Padding.Left := 8;
  end;

  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TSynEditStyleHook); //TMemoStyleHook);
  FSynEditsList.Add(SynEdit);

  OptionsContainer.AssignTo(SynEdit);
  SynWebEngine.Options.HtmlVersion := shvUndefined;

  if Filename <> '' then
  begin
    SynEdit.LoadFromFile(FileName);
    SelectHighLighter(SynEdit, FileName);
  end;
  UpdateGutter(SynEdit);
  Application.ProcessMessages;
  SynEdit.Visible := True;
  if SynEdit.CanFocus then
    SynEdit.SetFocus;
  SetMainHighlighterCombo(SynEdit);
  SetMainEncodingCombo(SynEdit);
  Result := SynEdit;
end;

procedure TDocumentFrame.UpdateHighlighterColors;
var
  LStyles: TCustomStyleServices;
  WhiteBackground: Boolean;
begin
  LStyles := StyleServices;
  if Assigned(LStyles) then
  begin
    WhiteBackground := (TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS) or (LStyles.GetStyleColor(scEdit) = clWhite);

    UpdateAWKSynColors(SynAWKSyn, WhiteBackground);
    UpdateCobolSynColors(SynCobolSyn, WhiteBackground);
    UpdateIdlSynColors(SynIdlSyn, WhiteBackground);
    UpdateCPMSynColors(SynCPMSyn, WhiteBackground);
    UpdateDOTSynColors(SynDOTSyn, WhiteBackground);
    UpdateADSP21xxSynColors(SynADSP21xxSyn, WhiteBackground);
    UpdateDWSSynColors(SynDWSSyn, WhiteBackground);
    UpdateEiffelSynColors(SynEiffelSyn, WhiteBackground);
    UpdateIniSynColors(SynIniSyn, WhiteBackground);
    UpdateInnoSynColors(SynInnoSyn, WhiteBackground);
    UpdateJavaSynColors(SynJavaSyn, WhiteBackground);
    UpdateJScriptSynColors(SynJScriptSyn, WhiteBackground);
    UpdateLDRSynColors(SynLDRSyn, WhiteBackground);
    UpdateMsgSynColors(SynMsgSyn, WhiteBackground);
    UpdateBatSynColors(SynBatSyn, WhiteBackground);
    UpdatePerlSynColors(SynPerlSyn, WhiteBackground);
    UpdateProgressSynColors(SynProgressSyn, WhiteBackground);
    UpdatePythonSynColors(SynPythonSyn, WhiteBackground);
    UpdateRubySynColors(SynRubySyn, WhiteBackground);
    UpdateSDDSynColors(SynSDDSyn, WhiteBackground);
    UpdateSQLSynColors(SynSQLSyn, WhiteBackground);
    UpdateSMLSynColors(SynSMLSyn, WhiteBackground);
    UpdateTclTkSynColors(SynTclTkSyn, WhiteBackground);
    UpdateTexSynColors(SynTexSyn, WhiteBackground);
    UpdateUNIXShellScriptSynColors(SynUNIXShellScriptSyn, WhiteBackground);
    UpdateVBSynColors(SynVBSyn, WhiteBackground);
    UpdateASMSynColors(SynASMSyn, WhiteBackground);
    UpdateWebEngineColors(SynWebEngine, WhiteBackground);
  end;
end;

procedure TDocumentFrame.UpdateGutterAndControls;
var
  i, j: Integer;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  for i := 0 to FSynEditsList.Count - 1 do
    UpdateGutter(TBCSynEdit(FSynEditsList.Items[i]));
  for i := 0 to PageControl.PageCount - 1 do
    for j := 0 to PageControl.Pages[i].ComponentCount - 1 do
      if PageControl.Pages[i].Components[j] is TPanel then
      begin
        if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 3
        else
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 1;
      end;
  UpdateHighlighterColors;
end;

procedure TDocumentFrame.SynEditSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
var
  LStyles: TCustomStyleServices;
begin
  if not TBCSynEdit(Sender).SelAvail then
    if TBCSynEdit(Sender).CaretY = Line then
    begin
      Special := True;
      LStyles := StyleServices;
      if LStyles.Enabled then
        BG := LightenColor(TBCSynEdit(Sender).Color);
    end;
end;

procedure TDocumentFrame.UpdateGutter(SynEdit: TBCSynEdit);
var
  LStyles: TCustomStyleServices;
begin
  LStyles := StyleServices;
  if LStyles.Enabled then
  begin
    SynEdit.Gutter.Font.Color := LStyles.GetStyleFontColor(sfHeaderSectionTextNormal);
    SynEdit.Gutter.BorderColor := LStyles.GetStyleColor(scEdit);
    SynEdit.Gutter.Color := LStyles.GetStyleColor(scPanel);
    SynEdit.RightEdgeColor := LStyles.GetStyleColor(scPanel);

    SynEdit.SelectedColor.Background := LStyles.GetSystemColor(clHighlight);
    SynEdit.SelectedColor.Foreground := LStyles.GetSystemColor(clHighlightText);

    if Assigned(SynEdit.Highlighter) and ( (SynEdit.Highlighter.Tag = 3) or (SynEdit.Highlighter.Tag = 4) or (SynEdit.Highlighter.Tag = 5) or
       (SynEdit.Highlighter.Tag = 6) or (SynEdit.Highlighter.Tag = 7) or (SynEdit.Highlighter.Tag = 8) or
       (SynEdit.Highlighter.Tag = 37) or (SynEdit.Highlighter.Tag = 38) or (SynEdit.Highlighter.Tag = 39) ) then
    begin
      case SynEdit.Highlighter.Tag of
        3, 6, 37: SynEdit.Color := clNavy;
        5, 8, 39: SynEdit.Color := clBlack;
      end;
      if SynEdit.Color = clBlack then
        SynEdit.Color := LStyles.GetStyleColor(scEdit);
    end
    else
    begin
      SynEdit.Font.Color := LStyles.GetStyleFontColor(sfEditBoxTextNormal);
      SynEdit.Color := LStyles.GetStyleColor(scEdit);
    end;
  end
  else
  begin
    SynEdit.Gutter.GradientStartColor := clWindow;
    SynEdit.Gutter.GradientEndColor := clBtnFace;
    SynEdit.Gutter.Font.Color := clWindowText;
    SynEdit.Gutter.BorderColor := clWindow;
    SynEdit.Gutter.Color := clBtnFace;
    SynEdit.Color := clWindow;
  end;
  SynEdit.ActiveLineColor := SynEdit.Color;
end;

procedure TDocumentFrame.SynEditEnter(Sender: TObject);
begin
  CheckFileDateTimes;
end;

procedure TDocumentFrame.CompareFiles(FileName: string);
var
  i: Integer;
  TabSheet: TTabSheet;
  Frame: TCompareFrame;
  TempList: TStringList;
  SynEdit: TBCSynEdit;
  Panel: TPanel;
begin
  { create list of open documents }
  TempList := TStringList.Create;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      TempList.Add(SynEdit.DocumentName);
  end;
  if Filename <> '' then
  begin
    { find compare tab }
    for i := 0 to PageControl.PageCount - 1 do
      if PageControl.Pages[i].ImageIndex = FCompareImageIndex then
      begin
        Frame := TCompareFrame(PageControl.Pages[i].Components[0].Components[0]);
        { if there already are two files to compare then continue }
        if Frame.ComparedFilesSet then
          Continue
        else
        begin
          { else set file and exit}
          PageControl.ActivePageIndex := i;
          Frame.SetCompareFile(Filename);
          Exit;
        end;
      end;
  end;
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := FCompareImageIndex;
  TabSheet.Caption := 'Compare Files';
  PageControl.ActivePage := TabSheet;
  Panel := TPanel.Create(TabSheet);
  with Panel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Caption := '';
    DoubleBuffered := False;
    Padding.Left := 1;
    Padding.Top := 1;
    Padding.Right := 3;
    Padding.Bottom := 2;
    ParentColor := True;
    ParentDoubleBuffered := False;
  end;
  { create a compare frame }
  Frame := TCompareFrame.Create(Panel);
  with Frame do
  begin
    Parent := Panel;
    Align := alClient;
    OpenDocumentsList := TempList;
    SetCompareFile(Filename);
  end;
  PageControlRepaint;
end;

procedure TDocumentFrame.PageControlRepaint;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.Repaint;
  if Assigned(PageControl.ActivePage) then
    PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TDocumentFrame.SelectForCompare;
begin
  CompareFiles(ActiveSynEdit.DocumentName);
end;

{ TBCSynEdit }

procedure TBCSynEdit.DoOnProcessCommand(var Command: TSynEditorCommand; var AChar: WideChar;
  Data: pointer);
begin
  inherited;
  if Assigned(FSynMacroRecorder) then
    if FSynMacroRecorder.State = msRecording then
      FSynMacroRecorder.AddEvent(Command, AChar, Data);
end;

procedure TBCSynEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssAlt] then
  begin
    if SelectionMode = smNormal then
      SelectionMode := smColumn
    else
      SelectionMode := smNormal;
  end;
end;

function TDocumentFrame.FindOpenFile(FileName: string): TBCSynEdit;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := nil;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      if CompareText(UpperCase(SynEdit.DocumentName), UpperCase(FileName)) = 0 then
      begin
        PageControl.ActivePage := PageControl.Pages[i];
        Result := SynEdit;
        Break;
      end;
  end;
end;

procedure TDocumentFrame.New;
begin
  Inc(FNumberOfNewDocument);
  CreateNewTabSheet;
end;

procedure TDocumentFrame.SetBookmarks(SynEdit: TBCSynEdit; Bookmarks: TStrings);
var
  i: Integer;
  Temp: string;
  BookmarkNumber, Ln, Ch: Integer;
begin
  if Assigned(Bookmarks) then
  begin
    for i := 0 to Bookmarks.Count - 1 do
    begin
      Temp := Bookmarks.Strings[i];
      if Pos(SynEdit.DocumentName, Temp) <> 0 then
      begin
        Temp := System.Copy(Temp, Pos('=', Temp) + 1, Length(Temp));
        BookmarkNumber := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ln := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ch := StrToInt(Temp);

        SynEdit.SetBookMark(BookmarkNumber, Ch, Ln);
      end;
    end;
  end;
end;

procedure TDocumentFrame.Open(FileName: string = ''; Bookmarks: TStrings = nil;
  Ln: Integer = 0; Ch: Integer = 0);
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  if FileName = '' then
  begin
    OpenDialog.InitialDir := DefaultPath;
    OpenDialog.Filter := OptionsContainer.Filters;
    if OpenDialog.Execute then
      for i := 0 to OpenDialog.Files.Count - 1 do
        Open(OpenDialog.Files[i])
  end
  else
  begin
    if FileExists(FileName) then
    begin
      SynEdit := FindOpenFile(FileName);
      if not Assigned(SynEdit) then
        SynEdit := CreateNewTabSheet(FileName);
      SynEdit.CaretXY := BufferCoord(Ch, Ln);
      SetBookmarks(SynEdit, Bookmarks);
      CheckHTMLErrors;
      try
        SetMainHighlighterCombo(SynEdit);
        SetMainEncodingCombo(SynEdit);
        PageControlRepaint;
        if SynEdit.CanFocus then
          SynEdit.SetFocus;
      except
        { It is not always possible to focus... }
      end;
    end;
  end;
end;

procedure TDocumentFrame.Close;
var
  Rslt, i: Integer;
  SynEdit: TBCSynEdit;
begin
  Rslt := mrNone;

  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Modified then
  begin
    Rslt := Common.SaveChanges;
    if Rslt = mrYes then
      Save;
  end;

  if Rslt <> mrCancel then
  begin
    i := FSynEditsList.IndexOf(SynEdit);
    if i <> -1 then
      FSynEditsList.Delete(i);
    if PageControl.PageCount > 0 then
      PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
    if PageControl.PageCount = 0 then
      FNumberOfNewDocument := 0;
  end;
  SetMainHighlighterCombo(ActiveSynEdit);
  SetMainEncodingCombo(ActiveSynEdit);
  CheckHTMLErrors;
  PageControlRepaint;
end;

procedure TDocumentFrame.CloseAll(CloseDocuments: Boolean);
var
  Rslt: Integer;
begin
  Rslt := mrNone;

  if ModifiedDocuments then
  begin
    Rslt := Common.SaveChanges(CloseDocuments);
    if Rslt = mrYes then
      SaveAll;
  end;
  if CloseDocuments and (Rslt <> mrCancel) then
  begin
    FSynEditsList.Clear;
    while PageControl.PageCount > 0 do
      PageControl.ActivePage.Destroy;
    FNumberOfNewDocument := 0;
  end;

  CheckHTMLErrors;
  PageControlRepaint;
end;

procedure TDocumentFrame.CloseAllOtherPages;
var
  i: Integer;
  Temp: Integer;
  Rslt: Integer;
  SynEdit: TBCSynEdit;
begin
  Temp := PageControl.ActivePageIndex;
  PageControl.ActivePage.Tag := 1;

  Rslt := mrNone;

  if ModifiedDocuments(False) then
  begin
    Rslt := Common.SaveChanges(True);

    if Rslt = mrYes then
      for i := 0 to PageControl.PageCount - 1 do
      begin
        PageControl.ActivePage := PageControl.Pages[i];
        SynEdit := ActiveSynEdit;
        if Assigned(SynEdit) and (SynEdit.Modified) and (i <> Temp) then
          Save(PageControl.Pages[i]);
      end;
  end;

  if Rslt <> mrCancel then
  begin
    PageControl.ActivePageIndex := 0;
    while PageControl.PageCount > 1 do
      if PageControl.ActivePage.Tag = 1 then
        PageControl.ActivePage := PageControl.Pages[PageControl.ActivePageIndex + 1]
      else
      begin
        SynEdit := ActiveSynEdit;
        if Assigned(SynEdit) then
          FSynEditsList.Delete(FSynEditsList.IndexOf(SynEdit));
        PageControl.ActivePage.Destroy;
      end;

    PageControl.ActivePage.Tag := 0; { important! }

    if ActiveSynEdit.DocumentName = '' then
      FNumberOfNewDocument := 1
    else
      FNumberOfNewDocument := 0
  end;

  CheckHTMLErrors;

end;

function TDocumentFrame.Save(TabSheet: TTabSheet; ShowDialog: Boolean): string;
var
  SynEdit: TBCSynEdit;
  AFileName: string;
begin
  Result := '';
  PageControl.ActivePage := TabSheet;
  SynEdit := GetSynEdit(TabSheet);
  if Assigned(SynEdit) then
  begin
    if (SynEdit.DocumentName = '') or ShowDialog then
    begin
      SaveDialog.InitialDir := DefaultPath;
      AFileName := TabSheet.Caption;
      if Pos('~', TabSheet.Caption) = Length(TabSheet.Caption) then
        AFileName := System.Copy(TabSheet.Caption, 0, Length(TabSheet.Caption) - 1);
      SaveDialog.FileName := AFileName;
      SaveDialog.Filter := OptionsContainer.Filters;
      if SaveDialog.Execute then
      begin
        PageControl.ActivePage.Caption := ExtractFileName(SaveDialog.FileName);
        SynEdit.DocumentName := SaveDialog.FileName;
        Result := SaveDialog.FileName;
      end
      else
        Exit;
    end;
    SynEdit.SaveToFile(SynEdit.DocumentName);
    SynEdit.UndoList.Clear;
    SynEdit.FileDateTime := GetFileDateTime(SynEdit.DocumentName);
    SynEdit.Modified := False;
    if Pos('~', TabSheet.Caption) = Length(TabSheet.Caption) then
      TabSheet.Caption := System.Copy(TabSheet.Caption, 0, Length(TabSheet.Caption) - 1);
    SelectHighLighter(SynEdit, SynEdit.DocumentName);
    UpdateGutter(SynEdit);
  end;
  PageControlRepaint;
end;

procedure TDocumentFrame.Save;
begin
  Save(PageControl.ActivePage);
end;

function TDocumentFrame.SaveAs: string;
begin
  Result := Save(PageControl.ActivePage, True);
end;

procedure TDocumentFrame.SaveAll;
var
  i: Integer;
  Temp: Integer;
  SynEdit: TBCSynEdit;
begin
  Temp := PageControl.ActivePageIndex;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    PageControl.ActivePage := PageControl.Pages[i];
    SynEdit := ActiveSynEdit;
    if Assigned(SynEdit) and SynEdit.Modified then
      Save(PageControl.Pages[i]);
  end;
  if Assigned(PageControl.Pages[Temp]) then
    PageControl.ActivePage := PageControl.Pages[Temp];
end;

function TDocumentFrame.GetActivePageCaption: string;
begin
  Result := PageControl.ActivePage.Caption;
  if Pos('~', PageControl.ActivePage.Caption) = Length(PageControl.ActivePage.Caption) then
    Result := System.Copy(PageControl.ActivePage.Caption, 0, Length(PageControl.ActivePage.Caption) - 1);
end;

procedure TDocumentFrame.Undo;

  procedure Undo(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        SynEdit.Undo;
        if SynEdit.UndoList.ItemCount = 0 then
        begin
          SynEdit.Modified := False;
          PageControl.ActivePage.Caption := GetActivePageCaption;
        end;
      end;
  end;

begin
  Undo(ActiveSynEdit);
  Undo(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.Redo;

  procedure Redo(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.Redo;
  end;

begin
  Redo(ActiveSynEdit);
  Redo(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.Cut;

  procedure Cut(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.CutToClipboard;
  end;

begin
  Cut(ActiveSynEdit);
  Cut(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.Copy;

  procedure Copy(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.CopyToClipboard;
  end;

begin
  Copy(ActiveSynEdit);
  Copy(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.SetMainHighlighterCombo(SynEdit: TBCSynEdit);
begin
  if Assigned(SynEdit) then
  begin
    if Assigned(SynEdit.Highlighter) then
      MainForm.HighlighterComboIndex := SynEdit.Highlighter.Tag
    else
      MainForm.HighlighterComboIndex := 51; { text }
  end;
end;


procedure TDocumentFrame.SetMainEncodingCombo(SynEdit: TBCSynEdit);
begin
  if Assigned(SynEdit) then
  begin
    if SynEdit.Encoding = TEncoding.ASCII then
      MainForm.EncodingComboIndex := 0
    else
    if SynEdit.Encoding = TEncoding.ANSI then
      MainForm.EncodingComboIndex := 1
    else
    if SynEdit.Encoding = TEncoding.BigEndianUnicode then
      MainForm.EncodingComboIndex := 2
    else
    if SynEdit.Encoding = TEncoding.Unicode then
      MainForm.EncodingComboIndex := 3
    else
    if SynEdit.Encoding = TEncoding.UTF7 then
      MainForm.EncodingComboIndex := 4
    else
    if SynEdit.Encoding = TEncoding.UTF8 then
      MainForm.EncodingComboIndex := 5
    else
    if SynEdit.Encoding = GetUTF8WithoutBOM then
      MainForm.EncodingComboIndex := 6
    else
      MainForm.EncodingComboIndex := 1; { ANSI }
  end;
end;

procedure TDocumentFrame.PageControlChange(Sender: TObject);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    SynWebEngine.Options.HtmlVersion := SynEdit.HtmlVersion;
    SetMainHighlighterCombo(SynEdit);
    SetMainEncodingCombo(SynEdit);
  end;
  PageControlRepaint;
end;

procedure TDocumentFrame.Paste;
var
  SynEdit, SplitSynedit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  SplitSynedit := ActiveSplitSynEdit;
  if Assigned(SynEdit) and SynEdit.Focused then
    SynEdit.PasteFromClipboard
  else
  if Assigned(SplitSynedit) and SplitSynedit.Focused then
    SplitSynedit.PasteFromClipboard
  else
    SearchForEdit.PasteFromClipboard;
  PageControlRepaint;
end;

procedure TDocumentFrame.InitializeSynEditPrint;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  with SynEditPrint.Header do
  begin
    Clear;
    Add(SynEdit.DocumentName, nil, taLeftJustify, 1);
    Add(CommonDataModule.ConstantMultiStringHolder.StringsByName['PreviewDocumentPage'].Text, nil, taRightJustify, 1);
  end;
  with SynEditPrint.Footer do
  begin
    Clear;
    Add(Format(CommonDataModule.ConstantMultiStringHolder.StringsByName['PreviewDocumentPage'].Text, [Application.Title]), nil, taLeftJustify, 1);
    Add('$DATE$ $TIME$', nil, taRightJustify, 1);
  end;
  SynEditPrint.SynEdit := SynEdit;
  SynEditPrint.Title := ExtractFileName(SynEdit.DocumentName);
end;

procedure TDocumentFrame.Print;
begin
  if PrintDialog.Execute then
  begin
    InitializeSynEditPrint;
    SynEditPrint.Print;
  end;
end;

procedure TDocumentFrame.PrintPreview;
begin
  InitializeSynEditPrint;
  with PrintPreviewDialog do
  begin
    SynEditPrintPreview.SynEditPrint := SynEditPrint;
    ShowModal;
  end;
end;

function TDocumentFrame.SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
begin
  Result := [];
  if IncludeBackwards then
    Include(Result, ssoBackwards);
  if CaseSensitiveCheckBox.Checked then
    Include(Result, ssoMatchCase);
  if WholeWordsCheckBox.Checked then
    Include(Result, ssoWholeWord);
end;

procedure TDocumentFrame.Search;
begin
  SearchPanel.Visible := not SearchPanel.Visible;
  if SearchPanel.Visible then
  begin
    SearchPanel.Height := SearchForEdit.Height;
    if ActiveSynEdit.SelAvail then
      SearchForEdit.Text := ActiveSynEdit.SelText;
    SearchForEdit.SetFocus;
    ActiveSynEdit.CaretXY := BufferCoord(0, 0);
    DoSearch;
  end;
end;

procedure TDocumentFrame.DoSearch;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
begin
  if Trim(SearchForEdit.Text) = '' then
    Exit;

  SynEdit := ActiveSynEdit;
  SynSearchOptions := SearchOptions(False);

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TDocumentFrame.SearchClearActionExecute(Sender: TObject);
begin
  SearchForEdit.Clear;
end;

procedure TDocumentFrame.SearchCloseActionExecute(Sender: TObject);
begin
  SearchPanel.Hide;
end;

procedure TDocumentFrame.SearchFindNextActionExecute(Sender: TObject);
begin
  FindNext;
end;

procedure TDocumentFrame.SearchFindPreviousActionExecute(Sender: TObject);
begin
  FindPrevious;
end;

procedure TDocumentFrame.FindNext;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
begin
  if Trim(SearchForEdit.Text) = '' then
    Exit;
  SynSearchOptions := SearchOptions(False);
  SynEdit := ActiveSynEdit;

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
  // end;
end;

procedure TDocumentFrame.FindPrevious;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
begin
  if Trim(SearchForEdit.Text) = '' then
    Exit;
  SynSearchOptions := SearchOptions(True);
  SynEdit := ActiveSynEdit;
  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockEnd := SynEdit.BlockBegin;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TDocumentFrame.Replace;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
  i, page, MResult: Integer;
begin
  with ReplaceDialog do
  begin
    if ActiveSynEdit.SelAvail then
      SearchForComboBox.Text := ActiveSynEdit.SelText;
    MResult := ShowModal;
    if (MResult = mrOK) or (MResult = mrYes) then
    begin
      SynSearchOptions := SearchOptions(False);
      if MResult = mrOK then
        Include(SynSearchOptions, ssoPrompt);
      Include(SynSearchOptions, ssoReplace);
      Include(SynSearchOptions, ssoReplaceAll);
      if ReplaceInWholeFile then
      begin
        SynEdit := ActiveSynEdit;
        SynEdit.CaretXY := BufferCoord(0, 0);
        SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);
      end
      else
      begin
        page := PageControl.ActivePageIndex;
        for i := 0 to PageControl.PageCount - 1 do
        begin
          PageControl.ActivePageIndex := i;
          SynEdit := ActiveSynEdit;
          if Assigned(SynEdit) then
          begin
            SynEdit.CaretXY := BufferCoord(0, 0);
            SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);
          end;
        end;
        PageControl.ActivePageIndex := page;
      end;
    end;
  end;
  PageControlRepaint;
end;

procedure TDocumentFrame.ToggleBookmark0MenuItemClick(Sender: TObject);
var
  SynEdit: TBCSynEdit;
  Item: TMenuItem;
  SynEditorCommand: TSynEditorCommand;
begin
  Item := Sender as TMenuItem;
  SynEditorCommand := ecNone;
  case Item.Tag of
    0: SynEditorCommand := ecSetMarker0;
    1: SynEditorCommand := ecSetMarker1;
    2: SynEditorCommand := ecSetMarker2;
    3: SynEditorCommand := ecSetMarker3;
    4: SynEditorCommand := ecSetMarker4;
    5: SynEditorCommand := ecSetMarker5;
    6: SynEditorCommand := ecSetMarker6;
    7: SynEditorCommand := ecSetMarker7;
    8: SynEditorCommand := ecSetMarker8;
    9: SynEditorCommand := ecSetMarker9;
  end;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(Item.Tag), nil);
end;

procedure TDocumentFrame.SearchForEditChange(Sender: TObject);
begin
  ActiveSynEdit.CaretXY := BufferCoord(0, 0);
  SearchFindNextAction.Enabled := CanFindNextPrevious;
  SearchFindPreviousAction.Enabled := SearchFindNextAction.Enabled;
  DoSearch;
end;

function TDocumentFrame.CanFindNextPrevious: Boolean;
begin
  Result := SearchForEdit.Text <> '';
end;

function TDocumentFrame.ToggleWordWrap: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      SynEdit.WordWrap := not SynEdit.WordWrap;
      Result := SynEdit.WordWrap;
    end;
    SynEdit := GetSplitSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      SynEdit.WordWrap := not SynEdit.WordWrap;
  end;
  PageControlRepaint;
end;

function TDocumentFrame.ToggleSpecialChars: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      if eoShowSpecialChars in SynEdit.Options then
        SynEdit.Options := SynEdit.Options - [eoShowSpecialChars]
      else
        SynEdit.Options := SynEdit.Options + [eoShowSpecialChars];
      Result := eoShowSpecialChars in SynEdit.Options;
    end;
    SynEdit := GetSplitSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      if eoShowSpecialChars in SynEdit.Options then
        SynEdit.Options := SynEdit.Options - [eoShowSpecialChars]
      else
        SynEdit.Options := SynEdit.Options + [eoShowSpecialChars];
    end;
  end;
  PageControlRepaint;
end;

function TDocumentFrame.GetSelectionModeChecked: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelectionMode = smColumn;
end;

procedure TDocumentFrame.ToggleSelectionMode;
var
  i: Integer;

  procedure ToggleSelectionMode(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        if SynEdit.SelectionMode = smColumn then
          SynEdit.SelectionMode := smNormal
        else
          SynEdit.SelectionMode := smColumn;
      end;
  end;

begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    ToggleSelectionMode(GetSynEdit(PageControl.Pages[i]));
    ToggleSelectionMode(GetSplitSynEdit(PageControl.Pages[i]));
  end;
  PageControlRepaint;
end;

function TDocumentFrame.ToggleLineNumbers: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      SynEdit.Gutter.ShowLineNumbers := not SynEdit.Gutter.ShowLineNumbers;
      Result := SynEdit.Gutter.ShowLineNumbers;
    end;
    SynEdit := GetSplitSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      SynEdit.Gutter.ShowLineNumbers := not SynEdit.Gutter.ShowLineNumbers;
  end;
  PageControlRepaint;
end;

procedure TDocumentFrame.ReadIniFile;
var
  i: Integer;
  FileTypes: TStrings;
  Version: string;
begin
  FileTypes := TStringList.Create;
  with TBigIniFile.Create(ChangeFileExt(Application.EXEName, '.ini')) do
  try
    { Preferences }
    OptionsContainer.FontName := ReadString('Preferences', 'FontName',
      'Courier New');
    OptionsContainer.FontSize := StrToInt
      (ReadString('Preferences', 'FontSize', '10'));
    OptionsContainer.RightEdge := StrToInt
      (ReadString('Preferences', 'RightEdge', '80'));
    OptionsContainer.ExtraLineSpacing := StrToInt
      (ReadString('Preferences', 'ExtraLineSpacing', '0'));
    OptionsContainer.TabWidth := StrToInt
      (ReadString('Preferences', 'TabWidth', '8'));
    OptionsContainer.GutterVisible := ReadBool
      ('Preferences', 'GutterVisible', True);
    OptionsContainer.GutterLineNumbers := ReadBool('Preferences',
      'GutterLineNumbers', True);
    OptionsContainer.MultiLine := ReadBool('Preferences', 'MultiLine', False);
    OptionsContainer.HTMLErrorChecking := ReadBool('Preferences', 'HTMLErrorChecking', True);
    OptionsContainer.HtmlVersion := TSynWebHtmlVersion(StrToInt(ReadString('Preferences', 'HTMLVersion', '4'))); { default: HTML5 }
    { FileTypes }
    Version := ReadString(Application.Title, 'Version', '');
    if Version = '' then  { Version 1.4 has it }
      EraseSection('FileTypes')
    else
    begin
      ReadSectionValues('FileTypes', FileTypes);
      { todo: temporary fix, remove these lines later }
      // **********************************************
      if Pos('DWScript', FileTypes.Strings[13]) = 0 then
        FileTypes.Insert(13, '13=DWScript Files (*.dws)');
      if (FileTypes.Strings[13] = '13=DWScript Files (*.dws;*.pas;*.inc)') or
        (FileTypes.Strings[13] = '13=DWScript Files (*.dws)|*.dws') then
        FileTypes.Strings[13] := '13=DWScript Files (*.dws)';
      // **********************************************
      for i := 0 to FileTypes.Count - 1 do
        OptionsContainer.FileTypes.Strings[i] := System.Copy
          (FileTypes.Strings[i], Pos('=', FileTypes.Strings[i]) + 1, Length
            (FileTypes.Strings[i]));
    end;
    OptionsContainer.SQLDialect := TSQLDialect(StrToInt(ReadString('Preferences', 'SQLDialect', '0')));
    OptionsContainer.CPASHighlighter := TCPASHighlighter(StrToInt(ReadString('Preferences', 'CPASHighlighter', '0')));
  finally
    FileTypes.Free;
    Free;
  end;
end;

function TDocumentFrame.ReadIniOpenFiles: Boolean;
var
  i: Integer;
  FName: string;
  FileNames, Bookmarks: TStrings;
begin
  FileNames := TStringList.Create;
  Bookmarks := TStringList.Create;
  with TBigIniFile.Create(ChangeFileExt(Application.EXEName, '.ini')) do
  try
    PageControl.Visible := False;
    { Open Files }
    ReadSectionValues('OpenFiles', FileNames);
    for i := 0 to FileNames.Count - 1 do
    begin
      FName := System.Copy(FileNames.Strings[i], Pos('=', FileNames.Strings[i]) + 1, Length(FileNames.Strings[i]));
      ReadSectionValues('Bookmarks', Bookmarks);
      if FileExists(FName) then
        Open(FName, Bookmarks);
    end;

    i := ReadInteger('Preferences', 'ActivePageIndex', 0);
    if i < PageControl.PageCount then
    begin
      PageControl.ActivePageIndex := i;
      SetMainHighlighterCombo(ActiveSynEdit);
      SetMainEncodingCombo(ActiveSynEdit);
    end;

    Result := FileNames.Count > 0;
  finally
    FileNames.Free;
    Bookmarks.Free;
    Free;
    PageControl.Visible := True;
    PageControlRepaint
  end;
end;

procedure TDocumentFrame.WriteIniFile;
var
  i, j: Integer;
  SynEdit: TBCSynEdit;
begin
  with TBigIniFile.Create(ChangeFileExt(Application.EXEName, '.ini')) do
  try
    { Preferences }
    WriteString('Preferences', 'FontName', OptionsContainer.FontName);
    WriteString('Preferences', 'FontSize', IntToStr(OptionsContainer.FontSize)
      );
    WriteString('Preferences', 'RightEdge', IntToStr
        (OptionsContainer.RightEdge));
    WriteString('Preferences', 'ExtraLineSpacing', IntToStr
        (OptionsContainer.ExtraLineSpacing));
    WriteString('Preferences', 'TabWidth', IntToStr(OptionsContainer.TabWidth)
      );
    WriteBool('Preferences', 'GutterVisible', OptionsContainer.GutterVisible);
    WriteBool('Preferences', 'GutterLineNumbers',
      OptionsContainer.GutterLineNumbers);
    WriteBool('Preferences', 'MultiLine', OptionsContainer.MultiLine);
    WriteBool('Preferences', 'HTMLErrorChecking', OptionsContainer.HTMLErrorChecking);
    WriteString('Preferences', 'HTMLVersion', IntToStr(Ord(OptionsContainer.HtmlVersion)));
    EraseSection('OpenFiles');
    EraseSection('Bookmarks');
    { Open documents }
    for i := 0 to PageControl.PageCount - 1 do
    begin
      SynEdit := GetSynEdit(PageControl.Pages[i]);
      if Assigned(SynEdit) then
      begin
        if Trim(SynEdit.DocumentName) <> '' then
          WriteString('OpenFiles', IntToStr(i), SynEdit.DocumentName);
        for j := 0 to SynEdit.Marks.Count - 1 do
          WriteString('Bookmarks', Format('%s:%s', [SynEdit.DocumentName, IntToStr(j)]),
            Format('%s;%s;%s', [IntToStr(SynEdit.Marks.Items[j].BookmarkNumber),
            IntToStr(SynEdit.Marks.Items[j].Line), IntToStr(SynEdit.Marks.Items[j].Char)]));
      end;
    end;
    { Active document }
    WriteInteger('Preferences', 'ActivePageIndex', PageControl.ActivePageIndex);
    EraseSection('FileTypes');
    { FileTypes }
    for i := 0 to OptionsContainer.FileTypes.Count - 1 do
      WriteString('FileTypes', IntToStr(i),
        OptionsContainer.FileTypes.Strings[i]);
    WriteString('Preferences', 'SQLDialect', IntToStr(Ord(OptionsContainer.SQLDialect)));
    WriteString('Preferences', 'CPASHighlighter', IntToStr(Ord(OptionsContainer.CPASHighlighter)));
  finally
    Free;
  end;
end;

function TDocumentFrame.Preferences: Boolean;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := False;
  { assign container }
  // OptionsContainer.Assign(ActiveSynEdit);
  { open preferences }
  if PreferencesDialog(Self).Execute(OptionsContainer) then
  begin
    { assign to every synedit }
    for i := 0 to PageControl.PageCount - 1 do
    begin
      SynEdit := GetSynEdit(PageControl.Pages[i]);
      if Assigned(SynEdit) then
      begin
        OptionsContainer.AssignTo(SynEdit);
        SelectHighLighter(SynEdit, SynEdit.DocumentName);
        UpdateGutter(SynEdit);
        UpdateHighlighterColors;
      end;
    end;
    PageControl.MultiLine := OptionsContainer.MultiLine;
    WriteIniFile;
    Result := True;
  end;
end;

function TDocumentFrame.GetSynEdit(TabSheet: TTabSheet): TBCSynEdit;
var
  Panel: TPanel;
begin
  Result := nil;
  if TabSheet.ComponentCount <> 0 then
  begin
    if TabSheet.Components[0] is TPanel then
    begin
      Panel := TPanel(TabSheet.Components[0]);
      if Panel.ComponentCount <> 0 then
        if Panel.Components[0] is TBCSynEdit then
          Result := TBCSynEdit(Panel.Components[0]);
    end;
  end;
end;

procedure TDocumentFrame.GotoBookmark0MenuItemClick(Sender: TObject);
var
  SynEdit: TBCSynEdit;
  Item: TMenuItem;
  SynEditorCommand: TSynEditorCommand;
begin
  Item := Sender as TMenuItem;
  SynEditorCommand := ecNone;
  case Item.Tag of
    0: SynEditorCommand := ecGotoMarker0;
    1: SynEditorCommand := ecGotoMarker1;
    2: SynEditorCommand := ecGotoMarker2;
    3: SynEditorCommand := ecGotoMarker3;
    4: SynEditorCommand := ecGotoMarker4;
    5: SynEditorCommand := ecGotoMarker5;
    6: SynEditorCommand := ecGotoMarker6;
    7: SynEditorCommand := ecGotoMarker7;
    8: SynEditorCommand := ecGotoMarker8;
    9: SynEditorCommand := ecGotoMarker9;
  end;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(Item.Tag), nil);
end;

function TDocumentFrame.ActiveSplitSynEdit: TBCSynEdit;
begin
  if Assigned(PageControl.ActivePage) then
    Result := GetSplitSynEdit(PageControl.ActivePage)
  else
    Result := nil;
end;

function TDocumentFrame.ActiveSynEdit: TBCSynEdit;
begin
  if Assigned(PageControl.ActivePage) then
    Result := GetSynEdit(PageControl.ActivePage)
  else
    Result := nil;
end;

procedure TDocumentFrame.SynEditChange(Sender: TObject);
var
  i: Integer;
  SynEdit, SplitSynEdit: TBCSynEdit;
begin
  inherited;
  Application.ProcessMessages;
  SynEdit := ActiveSynEdit;
  SynEdit.Modified := True;
  if Pos('~', PageControl.ActivePage.Caption) = 0 then
  begin
    PageControl.ActivePage.Caption := Format('%s~', [PageControl.ActivePage.Caption]);
    PageControlRepaint;
  end;
  SplitSynEdit := ActiveSplitSynEdit;
  if Assigned(SplitSynEdit) then
  begin
    SplitSynEdit.BeginUpdate;

    for i := 0 to SplitSynEdit.Lines.Count - 1 do
      if SynEdit.Lines[i] <> SplitSynEdit.Lines[i] then
        SplitSynEdit.Lines[i] := SynEdit.Lines[i];
    for i := SplitSynEdit.Lines.Count to SynEdit.Lines.Count - 1 do
      SplitSynEdit.Lines.Add(SynEdit.Lines[i]);
    while SplitSynEdit.Lines.Count > SynEdit.Lines.Count do
      SplitSynEdit.Lines.Delete(SplitSynEdit.Lines.Count);
    SplitSynEdit.EndUpdate;
    SplitSynEdit.Repaint;
  end;
end;

function TDocumentFrame.GetSplitSynEdit(TabSheet: TTabSheet): TBCSynEdit;
var
  Panel: TPanel;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
    begin
      if TabSheet.Components[0] is TPanel then
      begin
        Panel := TPanel(TabSheet.Components[0]);
        if Panel.ComponentCount > 1 then
          if Panel.Components[1] is TBCSynEdit then
            Result := TBCSynEdit(Panel.Components[1]);
      end;
    end;
end;

procedure TDocumentFrame.SynEditSplitChange(Sender: TObject);
var
  i: Integer;
  LinesChanged: Boolean;
  SynEdit, SplitSynEdit: TBCSynEdit;
begin
  inherited;
  Application.ProcessMessages;
  LinesChanged := False;
  SynEdit := ActiveSynEdit;
  SynEdit.BeginUpdate;
  SplitSynEdit := ActiveSplitSynEdit;
  if Assigned(SplitSynEdit) then
  begin
    for i := 0 to SynEdit.Lines.Count - 1 do
      if SynEdit.Lines[i] <> SplitSynEdit.Lines[i] then
      begin
        LinesChanged := True;
        SynEdit.Lines[i] := SplitSynEdit.Lines[i];
      end;
    for i := SynEdit.Lines.Count to SplitSynEdit.Lines.Count - 1 do
      SynEdit.Lines.Add(SplitSynEdit.Lines[i]);
    while SynEdit.Lines.Count > SplitSynEdit.Lines.Count do
      SynEdit.Lines.Delete(SynEdit.Lines.Count);
  end;
  SynEdit.EndUpdate;
  SynEdit.Repaint;
  if LinesChanged then
    SynEdit.OnChange(Sender);
end;

function TDocumentFrame.GetActiveTabSheetCaption: string;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
    Result := PageControl.ActivePage.Caption;
end;

function TDocumentFrame.GetActiveDocumentFound: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;

  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := ActiveSynEdit;
    if Assigned(SynEdit) then
      Result := True;
  end;
end;

function TDocumentFrame.GetActiveDocumentName: string;
var
  SynEdit: TBCSynEdit;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := ActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.DocumentName <> '' then
      begin
        Result := SynEdit.DocumentName;
        if SynEdit.Modified then // PageControl.ActivePage.ImageIndex = CHANGED_IMAGEINDEX then
          Result := Format('%s~', [Result]);
      end
  end;
end;

function TDocumentFrame.GetOpenTabSheets: Boolean;
begin
  Result := PageControl.PageCount > 0;
end;

function TDocumentFrame.GetOpenTabSheetCount: Integer;
begin
  Result := PageControl.PageCount;
end;

function TDocumentFrame.ModifiedDocuments(CheckActive: Boolean): Boolean;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := False;
  //Temp := PageControl.ActivePageIndex;

  SynEdit := ActiveSynEdit;
  for i := 0 to FSynEditsList.Count - 1 do
    if Assigned(FSynEditsList.Items[i]) and ( ((TBCSynEdit(FSynEditsList.Items[i]) <> SynEdit) and not CheckActive) or CheckActive) then
      if TBCSynEdit(FSynEditsList.Items[i]).Modified then
      begin
        Result := True;
        Exit;
      end;

{  for i := 0 to PageControl.PageCount - 1 do
    if ((i <> Temp) and not CheckActive) or CheckActive then
    begin
      PageControl.ActivePage := PageControl.Pages[i];
      if ActiveSynEdit.Modified then // PageControl.Pages[i].ImageIndex = CHANGED_IMAGEINDEX then
        Exit;
    end; }
end;

function TDocumentFrame.GetSelectionFound: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelAvail;

  SynEdit := ActiveSplitSynEdit;
  if Assigned(SynEdit) then
    Result := Result or SynEdit.SelAvail;
end;

function TDocumentFrame.GetCanUndo: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.UndoList.ItemCount > 0;

  SynEdit := ActiveSplitSynEdit;
  if Assigned(SynEdit) then
    Result := Result or (SynEdit.UndoList.ItemCount > 0);
end;

function TDocumentFrame.GetCanRedo: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.RedoList.ItemCount > 0;

  SynEdit := ActiveSplitSynEdit;
  if Assigned(SynEdit) then
    Result := Result or (SynEdit.RedoList.ItemCount > 0);
end;

procedure TDocumentFrame.SynEditorReplaceText(Sender: TObject; const ASearch,
  AReplace: UnicodeString; Line, Column: Integer;
  var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
  SynEdit: TBCSynEdit;
begin
  if ASearch = AReplace then
    Action := raSkip
  else
  begin
    SynEdit := ActiveSynEdit;
    APos := SynEdit.ClientToScreen(SynEdit.RowColumnToPixels
        (SynEdit.BufferToDisplayPos(BufferCoord(Column, Line))));

    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    ConfirmReplaceDialog.PrepareShow(EditRect, APos.X, APos.Y, APos.Y + SynEdit.LineHeight,
      ASearch);
    try
      case ConfirmReplaceDialog.ShowModal of
        mrYes:
          Action := raReplace;
        mrYesToAll:
          Action := raReplaceAll;
        mrNo:
          Action := raSkip;
      else
        Action := raCancel;
      end;
    finally
      ConfirmReplaceDialog.Release;
    end;
  end;
end;

procedure TDocumentFrame.SynEditHTMLPaintTransient
  (Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
const
  Tokens: array [0 .. 15] of TSynTokenMatch =
    ((OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '<'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<'; CloseToken: '/>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '</'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<!'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<![cdata['; CloseToken: ']]>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<?'; CloseToken: '?>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<%'; CloseToken: '%>'; TokenKind: Integer(stkMLTag)));
var
  Editor: TSynEdit;
  Pix: TPoint;
  Match: TSynTokenMatched;
  i: Integer;
  LStyles: TCustomStyleServices;

  function CharToPixels(P: TBufferCoord): TPoint;
  begin
    Result := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(P));
  end;

  function TryMatch: Integer;
  begin
    Result := SynEditGetMatchingTagEx(Editor, Editor.CaretXY, Match);
    if Result = 0 then
      Result := SynEditGetMatchingTokenEx
        (Editor, Editor.CaretXY, Tokens, Match);
  end;

begin
  LStyles := StyleServices;
  // if FPaintUpdating then
  // Exit;
  Editor := TSynEdit(Sender);
  if TransientType = ttBefore then
  begin
    i := TryMatch;
    if i = 0 then
      Exit;
    // FPaintUpdating := True;
    if i <> -1 then
      Editor.InvalidateLines(Match.OpenTokenPos.Line, Match.OpenTokenPos.Line);
    if i <> 1 then
      Editor.InvalidateLines(Match.CloseTokenPos.Line,
        Match.CloseTokenPos.Line);
    // FPaintUpdating := False;
    Exit;
  end;
  if Editor.SelAvail then
    Exit;
  i := TryMatch;
  if i = 0 then
    Exit;
  Canvas.Brush.Style := bsSolid;
  if Abs(i) = 2 then
    Canvas.Brush.Color := clAqua // matched color
  else
    Canvas.Brush.Color := clYellow; // unmatched color
  if i <> -1 then
  begin
    Pix := CharToPixels(Match.OpenTokenPos);
    if LStyles.GetStyleColor(scEdit) <> clWhite then
      Canvas.Font.Color := clBlack
    else
      Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.OpenToken);
  end;
  if i <> 1 then
  begin
    Pix := CharToPixels(Match.CloseTokenPos);
    if LStyles.GetStyleColor(scEdit) <> clWhite then
      Canvas.Font.Color := clBlack
    else
      Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.CloseToken);
  end;
end;

procedure TDocumentFrame.SynEditPASPaintTransient
  (Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);

const
  PasTokens: array [0 .. 14] of TSynTokenMatch =
    ((OpenToken: '('; CloseToken: ')'; TokenKind: Integer
        (SynHighlighterPas.tkSymbol)), (OpenToken: '['; CloseToken: ']';
      TokenKind: Integer(SynHighlighterPas.tkSymbol)), (OpenToken: 'begin';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'class'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'interface';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'record'; CloseToken: 'end'; TokenKind: Integer
        (SynHighlighterPas.tkKey)), (OpenToken: 'case'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'asm';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'try'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'implementation'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'package';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'for'; CloseToken: 'do';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'repeat';
      CloseToken: 'until'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'while'; CloseToken: 'do';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'if';
      CloseToken: 'then'; TokenKind: Integer(SynHighlighterPas.tkKey)));

var
  Editor: TSynEdit;
  Pix: TPoint;
  Match: TSynTokenMatched;
  i: Integer;

  function CharToPixels(P: TBufferCoord): TPoint;
  begin
    Result := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(P));
  end;

begin
  Editor := TSynEdit(Sender);
  if TransientType = ttBefore then
  begin
    i := SynEditGetMatchingTokenEx(Editor, Editor.CaretXY, PasTokens, Match);
    if i = 0 then
      Exit;
    if i <> -1 then
      Editor.InvalidateLines(Match.OpenTokenPos.Line, Match.OpenTokenPos.Line);
    if i <> 1 then
      Editor.InvalidateLines(Match.CloseTokenPos.Line,
        Match.CloseTokenPos.Line);
    Exit;
  end;
  if Editor.SelAvail then
    Exit;
  i := SynEditGetMatchingTokenEx(Editor, Editor.CaretXY, PasTokens, Match);
  if i = 0 then
    Exit;
  Canvas.Brush.Style := bsSolid;
  if Abs(i) = 2 then
    Canvas.Brush.Color := clAqua // matched color
  else
    Canvas.Brush.Color := clYellow; // unmatched color
  if i <> -1 then
  begin
    Pix := CharToPixels(Match.OpenTokenPos);
    Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.OpenToken);
  end;
  if i <> 1 then
  begin
    Pix := CharToPixels(Match.CloseTokenPos);
    Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.CloseToken);
  end;
end;

function TDocumentFrame.GetHTMLErrors: TList;
{var
  i: Integer;
  OutputObject: TOutputObject; }
begin
  Result := nil;
  if FHTMLDocumentChanged then
  begin
    FHTMLDocumentChanged := False;
    Result := FHTMLErrorList;
    {ErrorFrame.ErrortListBox.Items.BeginUpdate;
    ErrorFrame.Clear;
    for i := 0 to FHTMLErrorList.Count - 1 do
    begin
      OutputObject := FHTMLErrorList.Items[i];
      ErrorFrame.Add(OutputObject.FileName, OutputObject.Ln, OutputObject.Ch,
        OutputObject.Text);
    end;
    ErrorFrame.ErrortListBox.Items.EndUpdate; }
  end;
end;

procedure TDocumentFrame.CheckHTMLErrors;
var
  i: Integer;
  hl: TSynWebBase;
  e: TBCSynEdit;
 // TempVersion: TSynWebHtmlVersion;

  procedure AddError(S: WideString);
  var
    OutputObject: POutputRec;
  begin
    S := Format(S, [hl.GetToken]);

   // OutputObject := TOutputObject.Create;
    System.New(OutputObject);
    OutputObject.FileName := e.FDocumentName;
    OutputObject.Ln := i + 1;
    OutputObject.Ch := hl.GetTokenPos + 1;
    OutputObject.Text := ShortString(S);

    FHTMLErrorList.Add(OutputObject);
  end;

begin
  if not OptionsContainer.HTMLErrorChecking then
    Exit;
  e := ActiveSynEdit;
  if not Assigned(e) then
    Exit;

//  TempVersion := shvUndefined;
  DestroyHTMLErrorListItems;
  //if Assigned(PageControl.ActivePage) then
 //   TempVersion := ActiveSynEdit.HtmlVersion;
  //for j := 0 to PageControl.PageCount - 1 do
  //begin
  //  e := GetSynEdit(PageControl.Pages[j]);
  //  if Assigned(e) then
  //  begin
      SynWebEngine.Options.HtmlVersion := e.HtmlVersion;
      if e.Highlighter is TSynWebBase then
      begin
        hl := TSynWebBase(e.Highlighter);
        hl.ResetRange;
        i := 0;
        while i < e.Lines.Count do
        begin
          hl.SetLine(e.Lines[i], i + 1);
          while not hl.GetEol do
          begin
            case hl.GetTokenID of
              stkMLTagNameUndef:
                AddError('Invalid HTML tag "%s"');
              stkMLTagKeyUndef:
                AddError('Invalid HTML attribute "%s"');
              stkMLError:
                AddError('Invalid HTML token "%s"');

              stkCssSelectorUndef:
                AddError('Invalid CSS selector "%s"');
              stkCssPropUndef:
                AddError('Invalid CSS property "%s"');
              stkCssValUndef:
                AddError('Invalid CSS value "%s"');
              stkCssError:
                AddError('Invalid CSS token "%s"');

              stkEsError:
                AddError('Invalid JS token "%s"');

              stkPhpError:
                AddError('Invalid PHP token "%s"');
            end;
            hl.Next;
          end;
          Inc(i);
        end;
      end;
  //  end;
  //end;
//  if Assigned(PageControl.ActivePage) then
//    SynWebEngine.Options.HtmlVersion := TempVersion;
end;

procedure TDocumentFrame.SynEditHTMLOnChange(Sender: TObject);
begin
  inherited;
  ActiveSynEdit.Modified := True;
  if Pos('~', PageControl.ActivePage.Caption) = 0 then
  begin
    PageControl.ActivePage.Caption := Format('%s~', [PageControl.ActivePage.Caption]);
    PageControlRepaint;
  end;
  // PageControl.ActivePage.ImageIndex := CHANGED_IMAGEINDEX;
  FHTMLDocumentChanged := True;
  CheckHTMLErrors;
end;

function TDocumentFrame.GetCaretInfo: string;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  Result := Format('%d: %d', [SynEdit.CaretY, SynEdit.CaretX]);
end;

function TDocumentFrame.GetModifiedInfo: string;
var
  SynEdit: TBCSynEdit;
begin
  Result := '';
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Modified then
    Result := 'Modified';
end;

function TDocumentFrame.GetActiveDocumentModified: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  Result := Assigned(SynEdit) and SynEdit.Modified;
end;

procedure TDocumentFrame.ToggleBookMark;
var
  i: Integer;
  SynEdit: TBCSynEdit;
  CaretX, CaretY: Integer;
begin
  SynEdit := ActiveSynEdit;
  for i := 0 to SynEdit.Marks.Count - 1 do
    if SynEdit.CaretY = SynEdit.Marks[i].Line then
    begin
      SynEdit.ClearBookmark(SynEdit.Marks[i].BookmarkNumber);
      Exit;
    end;
  CaretX := SynEdit.CaretX;
  CaretY := SynEdit.CaretY;
  for i := 0 to 9 do
    if not SynEdit.GetBookMark(i, CaretX, CaretY) then
    begin
      SynEdit.SetBookMark(i, SynEdit.CaretX, SynEdit.CaretY);
      Exit;
    end;
end;

procedure TDocumentFrame.NextPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex + 1;
    if i >= PageControl.PageCount then
      i := 0;
    PageControl.ActivePage := PageControl.Pages[i];
  end;
end;

procedure TDocumentFrame.PreviousPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex - 1;
    if i < 0 then
      i := PageControl.PageCount - 1;
    PageControl.ActivePage := PageControl.Pages[i];
  end;
end;

procedure TDocumentFrame.CheckFileDateTimes;
var
  i: Integer;
  SynEdit: TBCSynEdit;
  FileDateTime: TDateTime;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      if SynEdit.DocumentName <> '' then
      begin
        FileDateTime := GetFileDateTime(SynEdit.DocumentName);
        if (FileDateTime <> 0) and (FileDateTime <> SynEdit.FileDateTime) then
        begin
          if FileExists(SynEdit.DocumentName) then
          begin
            if Common.AskYesOrNo(Format(CommonDataModule.YesOrNoMultiStringHolder.StringsByName['DocumentTimeChanged'].Text, [SynEdit.DocumentName])) then
            begin
              Refresh(i);
              PageControlRepaint;
            end;
          end
          else
          begin
            SynEdit.Modified := True; //  PageControl.Pages[i].ImageIndex := CHANGED_IMAGEINDEX
            if Pos('~', PageControl.Pages[i].Caption) = 0 then
            begin
              PageControl.Pages[i].Caption := Format('%s~', [PageControl.Pages[i].Caption]);
              PageControlRepaint;
            end;
          end;
        end;
      end;
  end;
end;

function TDocumentFrame.GetFileDateTime(FileName: string): TDateTime;
var
  SearchRec: TSearchRec;
begin
  FindFirst(FileName, faAnyFile, SearchRec);
  Result := SearchRec.TimeStamp;
end;

procedure TDocumentFrame.Refresh(Page: Integer);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetSynEdit(PageControl.Pages[Page]);
  if Assigned(SynEdit) then
  begin
    SynEdit.LoadFromFile(SynEdit.DocumentName);
    SynEdit.FileDateTime := GetFileDateTime(SynEdit.DocumentName);
  end;
end;

procedure TDocumentFrame.DecreaseIndent;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockUnindent, 'U', nil);
end;

procedure TDocumentFrame.IncreaseIndent;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockIndent, 'I', nil);
end;

procedure TDocumentFrame.SelectAll;

  procedure SelectAll(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.SelectAll;
  end;

begin
  SelectAll(ActiveSynEdit);
  SelectAll(ActiveSplitSynEdit);
end;

procedure TDocumentFrame.ToggleCase;

  procedure ToggleCase(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecToggleCaseBlock, 'C', nil);
  end;

begin
  ToggleCase(ActiveSynEdit);
  ToggleCase(ActiveSplitSynEdit);
end;

procedure TDocumentFrame.SortAsc;

  procedure SortAsc(SynEdit: TBCSynedit);
  var
    Strings: TWideStringList;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := SynEdit.SelText;
        Strings.Sort;
        SynEdit.SelText := Trim(Strings.Text);
        Strings.Free;
      end;
  end;

begin
  SortAsc(ActiveSynEdit);
  SortAsc(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.SortDesc;

  procedure SortDesc(SynEdit: TBCSynEdit);
  var
    i: Integer;
    s: WideString;
    Strings: TWideStringList;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := SynEdit.SelText;
        Strings.Sort;
        for i := Strings.Count - 1 downto 0 do
          s := s + Strings.Strings[i] + Chr(13) + Chr(10);
        SynEdit.SelText := Trim(s);
        Strings.Free;
      end;
  end;

begin
  SortDesc(ActiveSynEdit);
  SortDesc(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.ClearBookmarks;

  procedure ClearBookmarks(SynEdit: TBCSynEdit);
  var
    i: Integer;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      for i := 0 to 9 do
        SynEdit.ClearBookMark(i);
  end;

begin
  ClearBookmarks(ActiveSynEdit);
  ClearBookmarks(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.InsertLine;

  procedure InsertLine(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecInsertLine, 'N', nil);
  end;

begin
  InsertLine(ActiveSynEdit);
  InsertLine(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.DeleteWord;

  procedure DeleteWord(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecDeleteWord, 'T', nil);
  end;

begin
  DeleteWord(ActiveSynEdit);
  DeleteWord(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.DeleteLine;

  procedure DeleteLine(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecDeleteLine, 'Y', nil);
  end;

begin
  DeleteLine(ActiveSynEdit);
  DeleteLine(ActiveSplitSynEdit);
  PageControlRepaint;
end;

procedure TDocumentFrame.DeleteEOL;

  procedure DeleteEOL(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecDeleteEOL, 'Y', nil);
  end;

begin
  DeleteEOL(ActiveSynEdit);
  DeleteEOL(ActiveSplitSynEdit);
  PageControlRepaint;
end;

function LengthWithoutWhiteSpaces(Str: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Str) do
    if Trim(Str[i]) <> '' then
      Inc(Result);
end;

procedure TDocumentFrame.ShowWordCount;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Common.ShowMessage(Format(CommonDataModule.MessageMultiStringHolder.StringsByName['DocumentStatistics'].Text, [SynEdit.Lines.Count, CHR_ENTER, Common.WordCount(SynEdit.Text), CHR_ENTER, LengthWithoutWhiteSpaces(SynEdit.Text)]));
end;

function TDocumentFrame.GetMacroRecordPauseImageIndex: Integer;
var
  SynEdit: TBCSynEdit;
begin
  Result := Lib.IMAGEINDEX_RECORD;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
       if SynEdit.SynMacroRecorder.State = msRecording then
         Result := Lib.IMAGEINDEX_PAUSE
end;

function TDocumentFrame.IsRecordingMacro: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
      Result := SynEdit.SynMacroRecorder.State = msRecording
end;

function TDocumentFrame.IsMacroStopped: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
      Result := SynEdit.SynMacroRecorder.State = msStopped
end;

procedure TDocumentFrame.RecordMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    if not Assigned(SynEdit.SynMacroRecorder) then
    begin
      SynEdit.SynMacroRecorder := TSynMacroRecorder.Create(SynEdit);
      SynEdit.SynMacroRecorder.RecordMacro(SynEdit);
    end
    else
    if SynEdit.SynMacroRecorder.State = msStopped then
    begin
      if Common.AskYesOrNo(CommonDataModule.YesOrNoMultiStringHolder.StringsByName['RecordMacro'].Text) then
      begin
        SynEdit.SynMacroRecorder.Clear;
        SynEdit.SynMacroRecorder.RecordMacro(SynEdit);
      end;
    end
    else
    if SynEdit.SynMacroRecorder.State = msRecording then
      SynEdit.SynMacroRecorder.Pause
    else
    if SynEdit.SynMacroRecorder.State = msPaused then
      SynEdit.SynMacroRecorder.Resume
  end;
end;

procedure TDocumentFrame.StopMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    if Assigned(SynEdit.SynMacroRecorder) then
      SynEdit.SynMacroRecorder.Stop;
  end;
end;

procedure TDocumentFrame.PlaybackMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    if Assigned(SynEdit.SynMacroRecorder) then
      SynEdit.SynMacroRecorder.PlaybackMacro(SynEdit);
  end;
end;

procedure TDocumentFrame.SaveMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
    with TSaveDialog.Create(nil) do
    try
      Title := 'Save As';
      Filter := 'Macro files (*.mcr)|*.mcr';
      DefaultExt := '.mcr';
      if Execute then
        SynEdit.SynMacroRecorder.SaveToFile(FileName);
    finally
      Free;
    end;
end;

procedure TDocumentFrame.LoadMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    with TOpenDialog.Create(nil) do
    try
      Title := 'Open';
      Filter := 'Macro files (*.mcr)|*.mcr';
      DefaultExt := '.mcr';
      if Execute then
      begin
        if not Assigned(SynEdit.SynMacroRecorder) then
          SynEdit.SynMacroRecorder := TSynMacroRecorder.Create(SynEdit);
        SynEdit.SynMacroRecorder.LoadFromFile(FileName);
      end;
    finally
      Free;
    end;
end;

procedure TDocumentFrame.SetActiveEncoding(Value: Integer);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  with SynEdit do
  begin
    case Value of
      0: Encoding := TEncoding.ASCII;
      1: Encoding := TEncoding.ANSI;
      2: Encoding := TEncoding.BigEndianUnicode;
      3: Encoding := TEncoding.Unicode;
      4: Encoding := TEncoding.UTF7;
      5: Encoding := TEncoding.UTF8;
      6: Encoding := GetUTF8WithoutBOM;
    end;
  end;
end;

procedure TDocumentFrame.SetActiveHighlighter(Value: Integer);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  with SynEdit do
  begin
    Color := clWhite;
    ActiveLineColor := clSkyBlue;
    OnPaintTransient := nil;
    HtmlVersion := shvUndefined;
    SynWebEngine.Options.HtmlVersion := shvUndefined;
    case Value of
      0: Highlighter := SynHC11Syn;
      1: Highlighter := SynAWKSyn;
      2: Highlighter := SynBaanSyn;
      3: begin
           Highlighter := ClassicCSSyn;
           Color := clNavy;
           ActiveLineColor := clBlue;
         end;
      4: begin
           Highlighter := DefaultCSSyn;
           ActiveLineColor := $E6FFFA;
         end;
      5: begin
           Highlighter := TwilightCSSyn;
           Color := clBlack;
           ActiveLineColor := clGray;
         end;
      6: begin
           Highlighter := ClassicCppSyn;
           Color := clNavy;
           ActiveLineColor := clBlue;
         end;
      7: begin
           Highlighter := DefaultCppSyn;
           ActiveLineColor := $E6FFFA;
         end;
      8: begin
           Highlighter := TwilightCppSyn;
           Color := clBlack;
           ActiveLineColor := clGray;
         end;
      9: Highlighter := SynCACSyn;
      10: Highlighter := SynCacheSyn;
      11: Highlighter := SynWebCssSyn;
      12: Highlighter := SynCobolSyn;
      13: Highlighter := SynIdlSyn;
      14: Highlighter := SynCPMSyn;
      15: Highlighter := SynDOTSyn;
      16: Highlighter := SynADSP21xxSyn;
      17: Highlighter := SynDWSSyn;
      18: Highlighter := SynEiffelSyn;
      19: Highlighter := SynFortranSyn;
      20: Highlighter := SynFoxproSyn;
      21: Highlighter := SynGalaxySyn;
      22: Highlighter := SynDmlSyn;
      23: Highlighter := SynGWScriptSyn;
      24: Highlighter := SynHaskellSyn;
      25: Highlighter := SynHP48Syn;
      26: begin
            Highlighter := SynWebHtmlSyn;
            OnPaintTransient := SynEditHTMLPaintTransient;
            OnChange := SynEditHTMLOnChange;
            FHTMLDocumentChanged := True;
            HtmlVersion := OptionsContainer.HTMLVersion;
            SynWebEngine.Options.HtmlVersion := HtmlVersion;
          end;
      27: Highlighter := SynIniSyn;
      28: Highlighter := SynInnoSyn;
      29: Highlighter := SynJavaSyn;
      30: Highlighter := SynJScriptSyn;
      31: Highlighter := SynKixSyn;
      32: Highlighter := SynLDRSyn;
      33: Highlighter := SynModelicaSyn;
      34: Highlighter := SynM3Syn;
      35: Highlighter := SynMsgSyn;
      36: Highlighter := SynBatSyn;
      37: begin
            Highlighter := ClassicPasSyn;
            Color := clNavy;
            ActiveLineColor := clBlue;
            OnPaintTransient := SynEditPASPaintTransient;
          end;
      38: begin
            Highlighter := DefaultPasSyn;
            ActiveLineColor := $E6FFFA;
          end;
      39: begin
            Highlighter := TwilightPasSyn;
            Color := clBlack;
            ActiveLineColor := clGray;
            OnPaintTransient := SynEditPASPaintTransient;
          end;
      40: Highlighter := SynPerlSyn;
      41: Highlighter := SynProgressSyn;
      42: Highlighter := SynPythonSyn;
      43: Highlighter := SynRCSyn;
      44: Highlighter := SynRubySyn;
      45: Highlighter := SynSDDSyn;
      46: begin
            Highlighter := SynSQLSyn;
            SynSQLSyn.SQLDialect := OptionsContainer.SQLDialect;
          end;
      47: Highlighter := SynSMLSyn;
      48: Highlighter := SynSTSyn;
      49: Highlighter := SynTclTkSyn;
      50: Highlighter := SynTeXSyn;
      52: Highlighter := SynUNIXShellScriptSyn;
      53: Highlighter := SynVBSyn;
      54: Highlighter := SynVBScriptSyn;
      55: Highlighter := SynVrml97Syn;
      56: Highlighter := SynAsmSyn;
      57: Highlighter := SynWebXmlSyn;
    end;
  end;
end;

function TDocumentFrame.GetSplitChecked: Boolean;
var
  Panel: TPanel;
begin
  Panel := GetPanel;
  Result := Assigned(Panel) and (Panel.ComponentCount > 1);
end;

function TDocumentFrame.GetPanel: TPanel;
var
  TabSheet: TTabSheet;
begin
  Result := nil;
  TabSheet := PageControl.ActivePage;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TPanel then
        Result := TPanel(TabSheet.Components[0]);
end;

procedure TDocumentFrame.ToggleSplit;
var
  FileName: string;
  SynEdit: TBCSynEdit;
  Panel: TPanel;
  Splitter: TSplitter;
begin
  SynEdit := ActiveSynEdit;
  FileName := SynEdit.DocumentName;
  Panel := GetPanel;
  if Assigned(Panel) then
  begin
    if Panel.ComponentCount > 1 then
    begin
      Panel.Components[1].Free; { splitter and synedit }
      Panel.Components[1].Free
    end
    else
    begin
      SynEdit := TBCSynEdit.Create(Panel);
      with SynEdit do
      begin
        Visible := False;
        Parent := Panel;
        DocumentName := FileName;
        FileDateTime := GetFileDateTime(FileName);
        Align := alBottom;
        Font.Charset := DEFAULT_CHARSET;
        Font.Color := clWindowText;
        Font.Height := -13;
        Font.Name := 'Courier New';
        Font.Style := [];
        Gutter.AutoSize := True;
        Gutter.Font.Charset := DEFAULT_CHARSET;
        Gutter.Font.Color := clWindowText;
        Gutter.Font.Height := -11;
        Gutter.Font.Name := 'Courier New';
        Gutter.Font.Style := [];
        Gutter.ShowLineNumbers := True;
        Gutter.Gradient := False; //True;
        WantTabs := True;
        Options := [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo,
          eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces,
          eoTrimTrailingSpaces, eoScrollPastEol, eoSpecialLineDefaultFg];
        OnChange := SynEditSplitChange;
        OnSpecialLineColors := SynEditSpecialLineColors;
        OnEnter := SynEditEnter;
        OnReplaceText := SynEditorReplaceText;
        SearchEngine := SynEditSearch;
        ActiveLineColor := clSkyBlue;
        PopupMenu := EditorPopupMenu;
        BookMarkOptions.BookmarkImages := BookmarkImagesList;
        Padding.Left := 8;
        Height := Panel.Height div 2;
      end;
      OptionsContainer.AssignTo(SynEdit);
      if Filename <> '' then
      begin
        SynEdit.Text := ActiveSynEdit.Text;
        SelectHighLighter(SynEdit, FileName);
      end;
      UpdateGutter(SynEdit);
      Application.ProcessMessages;
      SynEdit.Visible := True;

      Splitter := TSplitter.Create(Panel);
      with Splitter do
      begin
        Parent := Panel;
        Align := alBottom;
        Height := 3;
        Cursor := crVSplit;
        AutoSnap := False;
      end;
    end;
  end;
end;

function TDocumentFrame.IsCompareFilesActivePage: Boolean;
begin
  Result := Assigned(PageControl.ActivePage) and (PageControl.ActivePage.ImageIndex = FCompareImageIndex);
end;

end.
