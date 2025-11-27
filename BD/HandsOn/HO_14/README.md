# Respostas Hands On 14

## Primeira pergunta

O escalonamento Sa não é completo, pois por mais que haja todas as operações de T1, T2, e T3 e que tais operações sigam a ordem as quais aparecem em suas respectivas transações,
os conflitos entre T1, T2 e T3 não precedem ou sucedem uns aos outros.

| Conflito      | Ordem        |
|---------------|--------------|
| R2(x) - W1(x) |  T2 - T1     |
| R3(z) - W2(z) |  T3 - T2     |
| R2(y) - W3(y) |  T2 - T3     |



## Segunda pergunta

Um é escalonamento recuperável se após uma transação ser confirmada ela não precisar ser desfeita. Ou seja, neste escalonamento não pode haver leitura suja.
No escalonamento apresentado, tem-se apenas uma leitura suja:

| Leitura Suja   | Transações Envolvidas |
|----------------|-----------------------|
| r3(x) - w1(x)  |  T3 - T1              |

Logo, o escalonamento não é recuperável.



## Terceira pergunta

Para o escalonamento ser serializável, é preciso que não haja nenhum ciclo no grafo de precedência, que é este:


![8c667606-19b2-4f92-8eb1-3a2cddcb93bf](https://github.com/user-attachments/assets/bcbf1f67-6195-4a6c-88e8-0d5fa8f1800b)
> OBS: Devido a presença de ciclos, o escalonamento não é seriálizável


