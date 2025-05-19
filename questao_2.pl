% Definindo as probabilidades das variáveis
0.97::b.  % Probabilidade de a lâmpada estar ok (b)
0.90::k.  % Probabilidade de o cabo estar ok (k)

% Definindo as probabilidades condicionais para a luz ligada (li)
0.99::li :- v, b, k.         
0.01::li :- v, b, \+k.        
0.01::li :- v, \+b, k.         
0.001::li :- v, \+b, \+k.        
0.3::li :- \+v, b, k.      
0.005::li :- \+v, b, \+k.     
0.005::li :- \+v, \+b, k.   
0.0::li :- \+v, \+b, \+k.    

% A variável str (condição da rua) pode ter três estados:
% dry (seca), wet (molhada) ou snow_covered (coberta de neve)
0.85::str(dry).            
0.10::str(wet).             
0.05::str(snow_covered).  

% A variável flw indica se o volante do dínamo está desgastado ou não
0.10::flw. % A probabilidade complementar (0.90) é implícita

% Definição das probabilidades condicionais para a variável r (dínamo deslizante)
% Dada a condição da rua (str) e o estado do volante (flw)
0.10::r :- str(dry), flw.           
0.01::r :- str(dry), \+flw.           
0.55::r :- str(wet), flw.     
0.20::r :- str(wet), \+flw.        
0.80::r :- str(snow_covered), flw.  
0.60::r :- str(snow_covered), \+flw. 

% Definição das probabilidades condicionais para a variável v (voltagem)
% Dada a condição do dínamo deslizante (r)
0.80::v :- r.        
0.20::v :- \+r.    

% Evidência observada: A condição da rua é "snow_covered"
evidence(str(snow_covered)).

% Consulta para calcular a probabilidade de v (voltagem)
query(v). 

% Resultado esperado: A probabilidade de v, dado que a rua está coberta de neve
