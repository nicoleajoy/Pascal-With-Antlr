(* Output:
100
Perfect
Your grade is 100.0
*)

program Test17;
var
   grade: real;
begin
   writeln('Enter a multiple of 10 from 0 - 100');
   readln(grade);

   case grade of
      100 : writeln('Perfect');
      90 : writeln('A');
      80 : writeln('B');
      70 : writeln('C');
      60 : writeln('D');
      50 : writeln('Fail');
      40 : writeln('Fail');
      30 : writeln('Fail');
      20 : writeln('Fail');
      10 : writeln('Fail');
      0 : writeln('Fail');

   end;
   
   writeln('Your grade is ', grade);
end.