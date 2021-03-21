# Install

1. git clone repositorio
2. git checkout nightly

## Limpar cache e instalacao anterior

> deletar as pastar _.deps_ e _build_

Instalar cmake

# Instalar as dependencias
Passos necessarios para que o cmake use o compilardor do VS
Abrir ***Developer PowerShell for VS 2019*** ou ***Developer Command Prompt for VS 2019***

```
mkdir .deps
cd .deps
cmake -G "Visual Studio 16 2019" ../third-party
cmake --build .
```

# Instalar o neovim
> cd ..
> mkdir build
> cd build
> cmake -G "Visual Studio 16 2019" -DCMAKE_INSTALL_PREFIX[^1]=D:\nvim -DCMAKE_BUILD_TYPE[^2]=RelWithDebInfo ..
> cmake --build .


[^1]: define a pasta onde vai ser instalado
[^2]: define o tipo de compilacao, se vai ser relase ou debug
