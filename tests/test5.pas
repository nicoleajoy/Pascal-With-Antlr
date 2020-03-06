(* Output:
a is -2.0
b is -1.0
c is -3.0
d is 100.0
*)

program Test5;
var 
    a, b, c : real;
    d : real = 100;
begin
    a := (-6.5 / 3.25);
    writeln('a is ', a);
    b := (2.0 + -5) + (3 - 1.0);
    writeln('b is ', b);
    c := a + b;
    writeln('c is ', c);
    writeln('d is ', d);
end.