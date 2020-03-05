program test17;
var
   grade: real;
begin
   grade := 80.0;

   case grade of
      100.0 : writeln('Excellent!');
      90.0 : writeln('Well done');
      80.0 : writeln('Nice');
      70.0 : writeln('You passed');
      60.0 : writeln('Better try again');
   end;
   
   writeln('Your grade is ', grade);
end.