(* Output:
comparing a and b
b < a
*)

program Test21;

procedure high(num1, num2:  real);
var
   num1, num2, num:  real;
begin
   num1 := a;
   num2 := b;
   if (num1 > num2) then
      writeln('a > b')
   else 
      writeln('b < a');
end;

var
   a, b : real;
begin
   a := 100;
   b := 200;
   writeln('comparing a and b');
   high(a, b);
end.