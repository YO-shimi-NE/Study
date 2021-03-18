# Immutability

Em elixir todos valores sao imutaveis, portanto nao corre o risco de ser passado por referencia e ser alterado em outro trecho, caso um valor seja alterado e criado um novo elemento, uma copia do anterior e e feito o rebind.

Para extruturas complexa o elixir, sabendo que os valores sao imutaveis, pode alterar a referencia do tail ou head e reaproveitar valores ao invez de copia-los toda vez.

O elixir cria _processos_ para executar as instrucoes e cada processo possui o seu proprio _heap_ isso facilita o trabalho do *garbage collector*, caso um processo encerre nao e necessario um *GC* para descartar os valores.