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

% Predicado para ordenar os caminhos pelo menor ao maior
solve_order(X, Y, Caminho) :-
    bagof([P, N], solve(X, Y, P, N ), TodosCaminhos),        % Predicado que irá pegar todas as soluções possíveis
    paths(TodosCaminhos, Caminho).                          % Predico auxiliar que será usado para pegar todas soluções possíveis, 
                                                            % ordená-las e colocar na variável TodosCaminhos
  
paths(Caminho, CaminhosOrd) :-
    map_list_to_pairs(length_path, Caminho, Pares),           % Predicado que irá mapear a lista de pares (chaves-valor) e guardalas em Pares
    sort(Pares, ParesOrd),                                    % Predicado que irá ordenar os pares do menor elemento ao maior elemento
    pairs_values(ParesOrd, CaminhosOrd).                      % Predicado que irá extrair os resultados ordenados

length_path([_, N], N).
                                                              % Predicado que irá imprimir na tela os valores