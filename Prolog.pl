% Predicado caso eles já estejam conectados e vice-versa
connected(X, Y, N) :- pway(X, Y, N).
connected(X, Y, N) :- pway(Y, X, N).

solve(Y, X, P, N) :- solve2(X, Y, [X], 0, P, N).
solve2(X, X, Visitado, Tamanho, Visitado, Tamanho). % Caso base
solve2(X, Y, Visitado, Tamanho, P, N) :-
    connected(X, A, Distancia),                     % Encontra uma passagem de X para A com determinada Distancia
    \+ member(A, Visitado),                         % O member faz a pesquisa evitando se o A já foi visitado
    TamanhoTotal is Tamanho + Distancia,            % Aumenta o comprimento acumulado
    solve2(A, Y, [A|Visitado], TamanhoTotal, P, N). % Chame recursivamente solve com A fazendo a prox busca

% Encontrar todos os caminhos ordenados por comprimento
solve_all(X, Y, Paths) :-
    bagof([P, N], solve(X, Y, P, N), AllPaths),
    sort_paths(AllPaths, Paths).
  
  sort_paths(Paths, SortedPaths) :-
    map_list_to_pairs(length_of_path, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, SortedPaths).
  
  length_of_path([_, N], N).