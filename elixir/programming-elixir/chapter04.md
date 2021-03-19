# Elixir Basics
---

## Types
1. Tipos de valor: Inteiros [^1], floats[^2], _Atom_[^3], _Ranges_ [^4], _Regex_[^5]
2. Tipos de sistema[^6]: _PID_, _References_
3. Tipos de colecoes: _Tuple_, _List_, _Maps_, _Binaries_
4. Funcoes

Tipos como ```strings```, sao "montadas" a partir dos tipos basicos

### PID e Ports

*PID* e uma referencia local ou remota de um processo, ja as *PORTS* e referente a um recurso normalmente externo a aplicacao que voce vai ler ou escrever.

### Tuples

Sao escritas utilizando ```{value, value}```, sao colecoes de valores ordenados e nao podem ser modificadas
Tuplas podem ser utilizadas em pattern matching
Sao muito utilizadas em retorno de funcao e o primeiro elemento retorna o status da operacao ```:ok``` caso seja efetuada com sucesso, por exemplo.

### List
Estrutura de dados linkada, devido a lista implementada se uma lista linkada ela e unidirecional e pega o enesimo elemento significa percorrer n-1 elementos.
Apesar de elixir ser imutavel, quando uma lista e modificada o elixir faz um rebind para o elemento que se deseja, caso o head seja removido o rebind aponta para o tail
> ```[n, n+1, ..., n+n]``` 
> #### Operadores
> _++_ Concatena
> _ --_ Diferenca
> x in list verifica de x pertence a list

### Keyword list
O para montar uma lista de chave valor o elixir utiliza um atalho para 
> [{:nome, "valor"}, {:nome, "valor"}, {:nome, "valor"}]
podendo ser utilizado da seguinte form
>[nome: "valor", nome: "valor", nome: "valor"]
_Se o a keyword list for o ultimo parametro da fn pode-se omitir as []_

[^1]: Inteiros podem ser escritos com decimais, hexadecimais ```0xcafe```, octal ```0o123``` e binario ```0b10101```.

> Decimais podem conter ```_``` e frequentemente utilizado para separar grupos de milhares.

[^2]: Pode-se utilizar a notacao exponencial para representar os floats

[^3]: Atoms sao constantes que representam o proprio nome, sua declaracao e iniciada com ```:```, apos os : pode conter letras (UTF-8) ou sinais de operadores, sinais, numeros, @, _ pode ser finalizada com ```. ! ?```. Podem ser inseridas entre aspas.

[^4]: Ranges sao representados por ```inicio..fim```

[^5]: Expressoes regulares respeitam o seguinte padrao:
> ~r{regex} ou ~r{regex}opts

[^6]: Sao recursos da Erlang VM
