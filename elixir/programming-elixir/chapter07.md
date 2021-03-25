# List and Recursion

## Heads and Tails
O head contem um valor e o tail uma lista, ```[head | tail]```
O _join operator_ **|** separa o head e o tail e pode ser utilizado em pattern matching. Tudo que estiver na direita sera jogado para o tail
```elixir
[a, b, c, ...n | tail] = [a, b, c, ..n | ....]
```
Toda lista termina com um ultimo elemento que é uma lista vazia ```[]```

**E possivel passar um valor pela funcao e usar no pattern matching**

***E possivel utiliza pattern matching dentro de PM*** 
> for_location([ head = [_, target_loc, _, _ ] | tail], target_loc) head recebe o head caso o target location seja o mesmo target_loc passado no parametro da fn, resumindo, o pattern matching é recursivo, apesar de ignorar no primeiro matching *_* no segundo os valores serao salvos

> O tamanho de uma lista vazia é 0
> O tamanho de uma lista é o tamanho do tail + 1

```elixir
defmodule List do
    def length [], do: 1
    def length [_ | tail], do (
        1 + length(tail)
    )
end
```

>Write a mapsum function that takes a list and a function. It applies the
>function to each element of the list and the
>iex> MyList.mapsum [1, 2, 3], &(&1 * &1)


```elixir
defmodule ListExtensions do
    def mapsum([], func), do: 0
    def mapsum [head | tail], func do
        func.(head) + mapsum tail, func
    end

    def max2([v]), do: v
    defp max2(a, b) when a > b, do: a
    defp max2(a, b) when a <= b, do: b
    def max2([h | t]) do
        max2(h, max2(t))
    end

    def find([], _), do: nil
    def find([v | _], v), do: v
    def find([_ | tail], v), do: find(tail, v)

    def reverse([l]), do: [l]
    def reverse([h | t]), do: reverse(t) ++ [h]
    #def reverse(list), do: reverse(list, []) 
    #defp reverse([], reversed), do: reversed  
    #defp reverse([h | t], reversed), do: reverse t, [h | reversed] 
end
```
