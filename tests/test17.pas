program test16;
var
   grade: real;
begin
   grade := 1.0;

   case grade of
      1.0 : writeln('Excellent!');
      2.1 : writeln('Well done');
      3.0 : writeln('You passed');
      4.0 : writeln('Better try again');
   end;
   
   writeln('Your grade is', grade);
end.