unit uConexaoSingleTon;

interface
uses
 System.SysUtils, uConexao;
Type
  TConexaoSigleton = class
  private
   class var oConexao : TConexao;
  public
    class function GetInstancia : TConexao;
  end;

implementation

{ TConexaoSigleton }

class function TConexaoSigleton.GetInstancia: TConexao;
begin
  if(not(assigned(oConexao)))then
    oConexao := TConexao.Create(nil);

  Result:= oConexao;
end;

initialization


finalization
  if(assigned(TConexaoSigleton.oConexao))then
      FreeAndNil(TConexaoSigleton.oConexao);



end.
