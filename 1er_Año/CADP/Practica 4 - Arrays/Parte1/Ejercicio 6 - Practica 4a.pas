{ 6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones. }

procedure MaxyMin (vec: vector; dimF: integer; var posMin, posMax: integer);
var 
    nMin, nMax: integer;
    
begin
    nMin := 9999;
    nMax := -9999;
    
    for i := 1 to dimF do 
    begin
        if (vec[i] > nMax) then 
        begin
            nMax := vec[i];
            posMax := i;
        end
        else if (vec[i] < nMin) then 
        begin
            nMin := vec[i];
            posMin := i;
        end;
    end;
end;