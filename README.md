# Sistema-Especialista

 ## Descrição do Exercício
 <p>
Você deve escrever um programa simples em Prolog para encontrar um caminho através de um labirinto. A entrada consistirá em fatos no seguinte formato:

pway(a, b, 10).



indicando que há uma passagem da interseção a para a interseção b com comprimento de 10 metros. Você deve escrever uma regra

solve(X, Y, P, N) :- ... 

que encontrará um caminho P de comprimento N (se existir) da interseção X para a interseção Y. A intenção é que o usuário invoque solve como uma consulta, especificando X e Y como constantes e P e N como variáveis. 

Aqui está um exemplo concreto. Suponha que o banco de dados contenha as seguintes regras:

pway(a, b, 10).
pway(b, c, 15).
pway(d, c, 5).
pway(d, b, 10).


Se o usuário digitar 

solve(a, d, P, N) 

o interpretador Prolog poderá responder com 

P = [a, b, c, d] 
N = 30 

Se neste ponto o usuário digitar um ponto e vírgula, o interpretador deve responder com 

P = [a, b, d] 
N = 20 

Mais um ponto e vírgula deve produzir 
no 

Não há mais caminhos. 

Observações 
1. Observe que as passagens são bidirecionais; se você pode caminhar 10 metros de a para b, também pode caminhar 10 metros de b para a. 
2. A maioria dos labirintos terá ciclos. Seu código deve lidar com eles. Não faz sentido passar pela mesma interseção mais de uma vez, e certamente você não quer que o interpretador entre em uma regressão infinita ao fazê-lo. 
3. Observe que a bidirecionalidade das passagens cria um grande número de ciclos triviais: você vai querer evitar caminhar de a para b e voltar de b para a novamente. 


Pontos Extras
Como pontos extras, você pode apresentar os caminhos em ordem crescente de comprimento. No exemplo acima, por exemplo, [a, b, d] deve aparecer antes de [a, b, c, d]. Observação: recomendo que você se preocupe com a ordenação apenas após implementar e depurar a versão original do seu programa.



Dicas 

1. Você não deve precisar usar recursos imperativos do Prolog (cut, fail ou ordenação de banco de dados) para a tarefa básica. Na verdade, você nem precisará usar not, embora provavelmente queira usar \= ("não igual" numérico). Existe uma solução para a tarefa que consiste apenas de sete regras! 
2. Você vai querer usar os comandos consult e reconsult. Coloque seu programa em um arquivo e cada labirinto de exemplo em outro. Leia o programa no interpretador usando consult. Leia o primeiro labirinto da mesma forma. Se você alterar seu programa, leia-o novamente usando "reconsult" (isso substituirá as definições anteriores das suas regras). Se você quiser tentar um labirinto diferente, leia-o usando "reconsult" (isso substituirá todos os fatos pway anteriores).
3. Você vai querer adicionar distâncias. Lembre-se de que você deve usar o predicado "is" para forçar o cálculo aritmético. 
4. Você pode resolver o extra credit gerando todas as soluções possíveis, ordenando-as e depois produzindo-as uma a uma sob demanda. Outras abordagens podem ser mais fáceis, no entanto. Você pode precisar usar o cut e fail para a parte do extra credit da tarefa.
