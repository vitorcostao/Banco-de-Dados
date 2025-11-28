# Respostas Hands On 15

## Primeira pergunta

No escalonamento apresentado, há um deadlock entre T3 e T2 quando o sistema tenta realizar a operação r2(y), sendo necessário matar a transação dois que fora a mais recente. 
Posteriormente, há outro deadlock entre T1 e T3 quando o sistema tenta realizar a operação r3(x), sendo necessário matar a transação três que fora a mais recente.

Logo, o escalonamento final é:

      Sa = r1(x), w1(x), r1(y), r1(z)


## Segunda pergunta

No escalonamento apresentado, utilizando as técnicas de bloqueio com operações ternárias, há um deadlock entre T3 e T2, sendo que T2 é abortada. Posteriormente, não há mais deadlocks,
na verdade o que ocorre é que T3 espera pela execução de T1 que, após ser comitada, libera para que T3 opere.

Logo, tem-se:

<img width="1223" height="615" alt="image" src="https://github.com/user-attachments/assets/31eaa917-3ec8-4df9-9d36-33253bc41aab" />

