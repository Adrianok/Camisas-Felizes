unit uCadastroModeloRegra;

interface

uses
  System.SysUtils, uCadastroModeloDto,
  uCadastroModeloForm, uCadastroModeloModel;

type
  TCadastroModeloRegra = class
  private
  public
    function Novo:Integer;
    function Salvar(var oDtoModelo: TCadastroModeloDto): boolean;
  end;

var
  oCadastroModeloRegra: TCadastroModeloRegra;

implementation

{ TCadastroModeloRegra }

function TCadastroModeloRegra.Novo: Integer;
begin
  Result := oCadastroModeloModel.Novo;
end;

function TCadastroModeloRegra.Salvar(var oDtoModelo: TCadastroModeloDto): boolean;
begin

//  if (oDtoModelo.Modelo = EmptyStr) then
//  begin
//    oCadastroModeloForm.edtModelo.SetFocus;
//    raise Exception.Create('O campo: ' + oCadastroModeloForm.edtModelo.EditLabel.Caption+ '   é obrigatório');
//    exit
//  end;
//  if (oDtoModelo.Preco = 0) then
//  begin
//    oCadastroModeloForm.edtPreco.SetFocus;
//    raise Exception.Create('O campo: ' + oCadastroModeloForm.edtModelo.EditLabel.Caption+ '   é obrigatório');
//  end;
//  if (oDtoModelo.Preco = 0) then
//  begin
//    oCadastroModeloForm.edtPreco.SetFocus;
//    raise Exception.Create('O campo: ' + oCadastroModeloForm.edtModelo.EditLabel.Caption+ '   é obrigatório');
//  end;

end;

end.
