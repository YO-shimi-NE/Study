# =
_match operator_ o ```=``` se trata de um match operator e nao um operador de atribuicao de valor, e bem sucedido se o elixir encontrar uma maneira de deixar o lado esquerdo do sinal igual ao lado direito.

Se o lado esquerdo pode ser vinculado ao lado direito o ```match``` e bem sucedido.
Se o _=_ fosse de atribuicao o codigo seguinte retornaria erro, mas nao e o que acontece. Portanto, o elixir consegue fazer o match caso os simbolos tenham o mesmo _significado/valor_

```elixir
value = 10
10 = value
```
## match complexos
Em casos complexos o Elixir tenta vincular as valores, caso possuam a mesma estrutura, ou cada literal do lado esquerdo possa ser vinculado a um valor do lado direito. Caso deseje usar um *coringa* pode-se utilizar o *_*, que pode ser vinculado a qualquer valor, mas seu valor sera descartado.
```
list = [1, 2, 3]
[a, b, c] = list
# a=1
# b=2
# c=3
nestedList = [1, 2, [1,2,3]]
[x, y, z] = nestedList
# x=1
# y=2
# z=[1,2,3]
[1, _, 3] = [1, 10, 3]
```

Uma vez feito o match, o elixir, pode reatribuir um novo match a um literal desde que ele nao participe da operacao
```
[a, a] = [1, 1] #True
[a,a] = [1, 2] #False, os valores atribuidos sao diferentes
a = 3 #True pois o literal nao participa do lado direito
```
Caso nao deseje que o elixir faca um novo bind ao literal pode-se usar o _pin-operator_ _^_ esse operador nao deixa o elixir fazer um novo bind caso ja exista um.