{Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10}

program ejercicio3;
var
  num1, num2, num3: Integer;
begin
    Write('Ingrese el primer numero: ');
    ReadLn(num1);
    Write('Ingrese el segundo numero: ');
    ReadLn(num2);
    Write('Ingrese el tercer numero: ');
    ReadLn(num3);
    if (num1 > num2) and (num1 > num3) then
    begin
        Write(num1, ' ');
        if num2 > num3 then
        Write(num2, ' ', num3)
        else
        Write(num3, ' ', num2);
    end
    else if (num2 > num1) and (num2 > num3) then
    begin
        Write(num2, ' ');
        if num1 > num3 then
        Write(num1, ' ', num3)
        else
        Write(num3, ' ', num1);
    end
    else
    begin
        Write(num3, ' ');
        if num1 > num2 then
        Write(num1, ' ', num2)
        else
        Write(num2, ' ', num1);
    end;
    ReadLn;
end.
