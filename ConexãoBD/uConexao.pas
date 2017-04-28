unit uConexao;

interface

uses
  System.Classes, System.SysUtils,
  FireDAC.Comp.Client, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Stan.Def;

Type
  TConexao = class(TFDConnection)
  private
    oWaitCursor: TFDGUIxWaitCursor;
    oDriverLink: TFDPhysMySQLDriverLink;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{ TConexao }

constructor TConexao.Create(AOwner: TComponent);
begin
  inherited;
  Params.DriverID := 'MySql';
  LoginPrompt := False;
  Params.Values['Database'] := 'ajudinha';
  Params.Values['User_Name'] := 'root';
  Params.Values['Password'] := '';
  Params.Values['Port'] := '3306';
  Params.Values['Server'] := '127.0.0.1';
  Connected := True;

  oWaitCursor := TFDGUIxWaitCursor.Create(nil);
  oDriverLink := TFDPhysMySQLDriverLink.Create(nil);

end;

destructor TConexao.Destroy;
begin

  Connected := False;

  if (Assigned(oWaitCursor)) then
    FreeAndNil(oWaitCursor);

  if (Assigned(oDriverLink)) then
    FreeAndNil(oDriverLink);

  inherited;
end;

end.
