# TP2 - Raciocínio Probabilistico

- **Disciplina**: Inteligência Artificial IEC034 - 2025/1
- **Curso**: Engenharia da Computação - Turmas CO01 

- **Aluno**:  Antonio Mileysson França Bragança - 21850963

---
## Descrição

Este trabalho  utiliza uma rede probabilística para modelar a probabilidade de uma lâmpada funcionar corretamente (voltagem) em um sistema de dínamo com base em várias variáveis. A solução considera probabilidades independentes e condicionais para as variáveis que afetam o funcionamento da lâmpada, como o estado da rua, o desgaste do volante do dínamo, o estado do cabo e da lâmpada, e a voltagem gerada pelo dínamo.

### Variáveis

1.  **Lâmpada (b):** A probabilidade da lâmpada estar funcionando corretamente.
    
    -   Probabilidade de `b` (lâmpada ok): **0.97**
        
2.  **Cabo (k):** A probabilidade de o cabo estar em bom estado.
    
    -   Probabilidade de `k` (cabo ok): **0.90**
        
3.  **Luz Ligada (li):** A probabilidade de a luz estar ligada, dada uma série de condições.
    
    -   A luz depende do estado da lâmpada, do cabo e da voltagem gerada.
        
4.  **Condição da Rua (str):** A rua pode ter três condições possíveis:
    
    -   **dry:** Seca com probabilidade **0.85**
        
    -   **wet:** Molhada com probabilidade **0.10**
        
    -   **snow_covered:** Coberta de neve com probabilidade **0.05**
        
5.  **Volante do Dínamo (flw):** Indica se o volante do dínamo está desgastado.
    
    -   Probabilidade de desgaste do volante (`flw`): **0.10**
        
6.  **Dínamo Deslizante R:** O estado do dínamo baseado na condição da rua e no desgaste do volante. Variável condicional.
    
    -   As probabilidades de `r` variam de acordo com o estado da rua (`str`) e o desgaste do volante (`flw`).
        
7.  **Voltagem (V):** A probabilidade de a voltagem ser suficiente para acender a lâmpada, dada a condição do dínamo (`r`).
    

### Probabilidades Condicionais

-   **Luz Ligada (li):**
    
    -   Se a voltagem está disponível e o cabo e a lâmpada estão em boas condições, a luz tem **99%** de chance de estar ligada.
        
    -   Existem várias probabilidades condicionais dependendo de qual combinação de estado da lâmpada (`b`), cabo (`k`), e voltagem (`v`) se aplicam.
        
-   **Dínamo Deslizante (r):**
    
    -   Dependendo da condição da rua e do desgaste do volante, a probabilidade de o dínamo estar funcionando varia. Por exemplo:
        
        -   Se a rua está seca e o volante está desgastado, a probabilidade de o dínamo funcionar é **10%**.
            
        -   Se a rua está coberta de neve e o volante está em bom estado, a probabilidade sobe para **80%**.
            
-   **Voltagem (v):**
    
    -   Se o dínamo está funcionando (`r`), a probabilidade de a voltagem ser adequada para acender a lâmpada é de **80%**.
        
    -   Se o dínamo não está funcionando, a probabilidade de a voltagem ser suficiente é apenas **20%**.
        

### Evidência Observada

No código, a evidência observada é que a condição da rua é **"snow_covered"** (coberta de neve). Isso serve como entrada para calcular a probabilidade de que a voltagem (`v`) seja suficiente para acender a lâmpada, levando em consideração todas as variáveis e probabilidades condicionais.

### Consulta

O código consulta a probabilidade da variável **v** (voltagem), dado que a rua está coberta de neve (`str(snow_covered)`). O objetivo é determinar a probabilidade de a lâmpada acender em condições específicas.

### Exemplo de Consulta

A consulta `query(v).` calcula a probabilidade de a voltagem ser suficiente, com base na condição observada da rua (`str(snow_covered)`).

----------

## Como Rodar

Este código está escrito em **ProbLog**, uma linguagem de programação baseada em lógica probabilística. Para rodar o código, você precisará de uma instalação do **ProbLog**.

### Passos:

1.  Instale o **ProbLog**.Siga as instruções oficiais no [site do ProbLog](https://dtai.cs.kuleuven.be/problog/).
    
2.  Salve o código em um arquivo com a extensão `.pl`.
    
3.  Execute o código no terminal com o comando:
    
    ```bash
    problog questao_2.pl
    
    ```
    
4.  O resultado será a probabilidade calculada de a voltagem (`v`) ser suficiente para acender a lâmpada, dado que a condição da rua é coberta de neve.
    

----------

## Conclusão

Este modelo probabilístico é uma simulação útil para entender como diferentes fatores, como a condição da rua, o estado do dínamo e o desgaste do volante, podem afetar a probabilidade de uma lâmpada estar funcionando. Ele pode ser estendido e ajustado para diferentes cenários ou utilizado para otimizar sistemas em que essas variáveis têm impacto direto no desempenho do equipamento.

