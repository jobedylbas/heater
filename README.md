# Aquecedor 🔥

Este projeto é um exemplo de _lex_ e _yacc_ para a questão 2 da recuperação da
cadeira de Compiladores 2020/2.

A ideia é construir uma linguagem de simples para interagir um aquecedor.

## Requisitos

- _lex_
- _yacc_
- gcc

## Compilando

Para compilar o projeto basta utilizar o comando:

```make```

## Interagindo

Para interagir execute o programa _aquecedor_ da seguinte maneira:

```./aquecedor```

Agora você poderá utilizar algumas sentenças como:

- ```aquecedor ligar```
- ```aquecedor setar temperatura 35```
- ```aquecedor ver temperatura```
- ```aquecedor ajuda```

Para saber mais, veja o uso abaixo:

```
Uso: aquecedor [comandos] [argumento]
Comandos:
    ligar
    desligar
    setar temperatura INTEIRO
    está ligado?
    ver temperatura
    conte uma piada
    ajuda
```
