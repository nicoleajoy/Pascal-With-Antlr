(* Output:
Enter two floats:
1.5
2.75
A: 1.5
B: 2.75
Addition (A+B): 4.25
Subtraction (A-B): -1.25
Multiplying (A*B): 4.125
Dividing (A/B): 0.5454545454545454
*)

program Test9;
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