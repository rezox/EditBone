unit Lib;

interface

uses
  SynHighlighterSQL, Vcl.ActnMenus;

type
  TCPASHighlighter = (hClassic, hDefault, hTwilight);

  POutputRec = ^TOutputRec;
  TOutputRec = packed record
    Level: Byte;
    Filename: string;
    Ln: LongWord;
    Ch: LongWord;
    TextCh: LongWord;
    Text: WideString;
    SearchString: WideString;
  end;

const
  IMAGEINDEX_RECORD = 68;
  IMAGEINDEX_PAUSE = 69;

  TSQLDialectStr: array[Low(TSQLDialect)..High(TSQLDialect)] of String =
    ('Standard', 'Interbase 6', 'MSSQL 7', 'MySQL', 'Oracle', 'Sybase', 'Ingres', 'MSSQL 2K', 'Postgres', 'Nexus');

implementation

end.
