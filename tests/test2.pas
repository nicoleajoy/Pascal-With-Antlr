(* Output:
Enter two numbers:
1
2
num1 = 1.0
num2 = 2.0
*)

program Test2;

var
    num1, num2 : real;
begin
  writeln ('Enter two numbers:');
  readln(num1, num2);
  writeln('num1 = ', num1);
  writeln('num2 = ', num2);
end.