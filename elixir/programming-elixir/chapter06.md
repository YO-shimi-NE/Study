# Modules and named functions

Modules e funcoes nomeadas, podem quebrar o codigo e tornalo mais legiveis e organizados. A funcao nomeada deve ser criada dentro de um modulo.
um modulo e criado utilizando a _keyword_ ```defmodule nome do .... end```. e a funcao nomeada ```def nome(parametros) do ... end```
A o modulo de comecar com a primeira letra em maiusculo por definicao e as funcoes utilizando _snake camel case_
Uma funcao e identificada pelo seu nome e sua aridade.

O ```do ... end``` e um bloco e e uma maneira de agrupar expressoes e passar outro codigo
> def nome(parametros), do: expessao

caso deseje passar varias expressoes no corpo da funcao elas devem estar entre parenteses, essa e a forma final, o ```do ... end``` e so um  syntactic sugar
```elixir
defmodule Name, do:(
    def nome(parametros), do: (
        #.... corpo da funcao
    )
)
```

Quando usamos o match pattern em uma uma funcao nomeada na verdade ele esta criando varias funcoes anonimas dentro do bloco as funcoes sao chamadas de cima para baixo.

# Guard Clauses

Sao predicatos adicionados a funcao que testa o argumento passado utilixando a ```when```, caso o match seja verdadeiro e passado para validacao pela clausula _when_, a funcao so e executada caso o predicato retorne verdadeiro

```elixir
defmodule Guard do
    def what_is(x) when is_number(x) do
        IO.puts "#{x} is a number"
    end
    def what_is(x) when is_list(x) do
        IO.puts "#{inspect(x)} is a list"
    end
    def what_is(x) when is_atom(x) do
        IO.puts "#{x} is an atom"
    end
end
```