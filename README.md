# DesafioRecepcionistaDeCinema


Algoritmo Recepcionista de Cinema
Inicio
1 - Solicitar ao cliente o bilhete do filme.
2 - Conferir a data e o horário do filme no bilhete.
Se data/hora atual > data/hora do filme + 30 minutos Então
3 - Informar ao cliente que o tempo limite para entrada foi excedido.
4 - Não permitir a entrada.
Senão Se data/hora atual < data/hora do filme - 30 minutos Então
5 - Informar ao cliente que a sala do filme ainda não foi liberada para entrada.
6 - Não permitir a entrada.
Senão
7 - Permitir a entrada.
8 - Indicar ao cliente onde fica a sala do filme.
Fim-Se
Fim
