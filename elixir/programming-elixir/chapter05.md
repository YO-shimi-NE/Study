# Anonymous Functions
```elixir
fn 
    (parameters...) -> body
    (parameters...) -> body
 end
```
fn Keyword utilizada na criacao de uma funcao anonima. os parametros da funcao e o corpo sao separados por ```->```.
_uma funcao anonima nao precisa de parenteses, ou seja opcional, a fn pode ser atribuida a uma variavel_

```elixir
add = fn (a, b) -> a + b end
add.(1, 2)
```

O ponto significa a chamada de uma funcao anonima. Apesa da passagem de argumento parece uma atribuicao o que o ocorre na verdade e o match pattern
Pode se aplicar padroes complexos de matchs.

```elixir
swap = fn {a, b} => {b, a} end
swap.({2, 3})
```
## Uma funcao, varios corpos
Uma funcao pode ter implementacoes variadas conforme os parametros passados, pattern matching, entretanto todas devem ter o mesmo numero de parametros.


---
> Para chamar um arquivo de elixir dento do IEx, podemos utilizar: c "arquivo.exs"
---

## Function
Elixir tem funcoes como cidadao de primeira ordem, portanto, podem ser passadas como parametro, ser utilizadas em binds  e retornar outra funcao.
Elixir tambem possui clousure.

O operador ```^``` pode ser usado em pattern matching como parametro de funcao
```elixir
for_names = fn name, greeting -> fn
    ^name -> "#{greeting} #{name}"
    _ -> "I don`t know you"
    end 
end

elixir = for_names.("Elixir", "Greating")
elixir.("Elixir")
```
---

# The & Notation

```&``` e um atalho para criacao de funcao, esse atalho e convertido para uma funcao por exemplo, _Operador de captura de funcao_
```elixir
add_one = &(&1 + 1)
add_one = fn value -> value + 1 end
```
Cada &n dentro da &() e um argumento que foi passado
> Se utilizado da seguinte forma ```&{}``` retornara uma tupla, ```&[]``` retorna uma lista ou  ```&"text #{&1}" retorna uma string.
> Pode ser usado com a aridade da funcao _&IO.puts/1_ e o equivalente a _&(IO.puts(&1))_ sugar syntax
