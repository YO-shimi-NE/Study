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

# \\ default params
Caso o parametro nao seja passado os default values serao usados de modo que todos os parametros sejam passados, por exemplo:
> def fn (param1, param2 \\ 2, param3), do [param1, param2, param3]
se passado so 2 argumento um fica com o primeiro e o outro com o terceiro e o segundo e usado o default.

```elixir
defmodule Params do
    def func(p1, p2 \\ 123) # adicionado para reduzir a confusao, quando passado so um parametro ela aplica a defaul e repassa para proxima funca
    def func(p1, p2) when is_list(p1) do
    "   You said #{p2} with a list"
    end
    def func(p1, p2) do
        "You passed in #{p1} and #{p2}"
    end
end
```

## defp
Define uma funcao privada, so existe dentro do modulo, nao se pode criar uma funcao com o mesmo nome que uma publica

# pipe operator |>
Pega o valor da esquerda e passa como primeiro argumento para a fn da direita.

```elixir
soma = fn a,b -> a + b end

soma.(2, 3) = 2 |> soma.(3)

#portanto
soma.(soma.(2,4), 4)
#seria equivalente a
soma.(2,4) |> soma.(4)
```
mais simples, elegante e facilita a leitura, da esquerda para a direita


# Modules

Prove um namespace para as coisas que vc definir dentro do modulo. se uma algo de dentro do modulo vai ser acessado por uma elemento de fora eh necessario qualificar com o nome do modulo, mas se a funcao ou objeto estiver dentro do modulo o nome do modulo pode ser omitido.

E possivel aninhar modulos e deve-se qualificar com o nome completo para acesasr algum elemento interno, entretanto...
> O aninhamento de modulo em sua essencia nao e seguido a linha, basicamento todo modulo e declarado no level mais alto. O aninhamento de modulo e somente uma forma de deixar os nomes mais legiveis mas no fim sera transformado para 2 modulos separados mas com a qualificacao do pai
> Pai.Filho.Modulo

# Diretivas para modulos

As 3 diretivas existentes possuem escopo lexico, portanto a partir do momento que sao executadas, existem ate o encerramento do escopo.

## Import
O import evita que vc fique repetindo o nome de um modulo repetidas vezes quando um ou varios itens do modulo sera muito utilizado

```elixir
defmodule Example do
    def func1 do
        List.flatten [1,[2,3],4]
    end
    def func2 do
        import List, only: [flatten: 1]
        flatten [5,[6,7],8]
    end
end
```

***Full syntax***

> ```import Module [, only:|except:]```
o que esta dento das ```[]``` sao opcionais e definem o que se deseja importar, o only busca somente o item especificado, o except ignora somente o item especificado. o item importados/ignorados podem ser chamados pela aridade ``` import Module only: [function: arity, function: arity]
> pode ser usando atoms para informar o que se deseja importar :function ou :macros


***Alias***
Cria um apelido.
> alias Modulo.Submodulo1.Submodulo2, as: Alias
ou
> alias Modulo.Submodulo1.Submodulo2

na segunda opcao o alias sera o nome do ultimo modulo. nessa opcao pode-se passar varios itens que se deseja adcionar apelido
> alias Modulo.Submodulo1.Submodulo2
> alias Modulo.Submodulo1.Submodulo3
pode-ser
> alias Modulo.Submodulo1.{Submodulo2, Submodulo3}

***Require***
Usado quando se deseja usar os macros definidos no modulo.


