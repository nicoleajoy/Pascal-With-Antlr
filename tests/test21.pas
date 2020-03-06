(* Output:
old a : 100.0
old b : 200.0
new a = 30.0
new b = 250.0
*)

program Test21;

procedure high(num1, num2:  real);
var
   num1, num2, num:  real;
begin
   num1 := 9;
   num2 := 2;
   a := 30;
   b := 250;
   writeln('new a = ', a);
   writeln('new b = ', b);
end;

var
   a, b, ret : real;
begin
   a := 100;
   b := 200;
   writeln('old a : ', a);
   writeln('old b : ', b);
   high(a, b);
end.