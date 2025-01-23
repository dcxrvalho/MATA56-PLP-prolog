:- dynamic datashows_disponiveis/1, datashows_alocados/1.

datashows_disponiveis([datashow1, datashow2, datashow3]).

datashows_alocados([]).

disponivel(Datashow) :-
    datashows_disponiveis(Disponiveis),
    member(Datashow, Disponiveis).

alocar(Datashow) :-
    disponivel(Datashow),
    retract(datashows_disponiveis(Disponiveis)),
    select(Datashow, Disponiveis, NovoDisponiveis), 
    assertz(datashows_disponiveis(NovoDisponiveis)),
    datashows_alocados(Alocados),
    append([Datashow], Alocados, NovosAlocados),
    retract(datashows_alocados(Alocados)),
    assertz(datashows_alocados(NovosAlocados)),
    write(Datashow), write(' alocado com sucesso.').

desalocar(Datashow) :-
    datashows_alocados(Alocados),
    member(Datashow, Alocados),
    retract(datashows_alocados(Alocados)),
    select(Datashow, Alocados, NovoAlocados),
    assertz(datashows_alocados(NovoAlocados)),
    datashows_disponiveis(Disponiveis),
    append([Datashow], Disponiveis, NovosDisponiveis),
    retract(datashows_disponiveis(Disponiveis)),
    assertz(datashows_disponiveis(NovosDisponiveis)),
    write(Datashow), write(' desalocado com sucesso.').

listar_disponiveis :-
    datashows_disponiveis(Disponiveis),
    write('Datashows disponíveis: '), writeln(Disponiveis).

listar_alocados :-
    datashows_alocados(Alocados),
    write('Datashows alocados: '), writeln(Alocados).

?- listar_disponiveis.
?- alocar(datashow1).
?- listar_disponiveis.
?- listar_alocados.
?- desalocar(datashow1).
?- listar_disponiveis.
?- listar_alocados.
