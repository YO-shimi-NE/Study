# Maps, Keywords, Sets and Structs

Dicionario é um tipo que possui chave com valor

# Structs

É um wrap que possui um map limitado, um map que a key é uma atom e nao tem as capacidades de um dicionario. 
***defstruct*** define os membros da struct, o nome do modulo e o nome da struct, os membros sao acessados por **.** ou ***pattern matching***

```%struct_name{membros}```


```elixir
defmodule Model do           
defstruct field: "", type: ""
def instance(f, t), do: %Model{field: f, type: t}
def to_string(model = %Model{field: _, type: _}), do: "#{model.field} #{model.type}"
end

iex(2)> model = Model.instance(:base, :string)
%Model{field: :base, type: :string}
iex(3)> model
%Model{field: :base, type: :string}
iex(4)> model = %{model | field: :name} ```[^1]```
%Model{field: :name, type: :string}
iex(5)> model
%Model{field: :name, type: :string}
iex(6)> 
```

[^1]: A alteracao dos valores são feitas utilizando o operardor ***|***
