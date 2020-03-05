program test9;
var
a, b: real;

begin
   
   writeln('Enter two floats:');
   readln(a, b);

   writeln('A: ', a);
   writeln('B: ', b);
   writeln('Addition (A+B): ', (a+b));
   writeln('Subtraction (A-B): ', (a-b));
   writeln('Multiplying (A*B): ', (a*b));
   writeln('Dividing (A/B): ', (a/b));
end.