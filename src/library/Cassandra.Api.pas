unit Cassandra.Api;

interface

type
  CassCluster = Pointer;

var
  cass_cluster_new : function: CassCluster; cdecl = nil;

implementation

uses
  Windows,
  SysUtils;

const
  CASSANDRA_LIBRARY = 'cassandra.dll';

var
  CassandraHandle: HMODULE;

function LoadLib(const ALibFile: String): HMODULE;
begin
  Result := LoadLibrary(PChar(ALibFile));
  if (Result = 0) then
    raise Exception.CreateFmt('load %s failed', [ALibFile]);
end;

function FreeLib(ALibModule: HMODULE): Boolean;
begin
  Result := FreeLibrary(ALibModule);
end;

function GetProc(AModule: HMODULE; const AProcName: String): Pointer;
begin
  Result := GetProcAddress(AModule, PChar(AProcName));
  if (Result = nil) then
    raise Exception.CreateFmt('%s not found', [AProcName]);
end;

initialization

finalization

end.
