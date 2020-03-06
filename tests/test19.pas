program Test19;
var
   a: real;

begin

   writeln('FOR:TO STATEMENT');
   for a := 10 to 20 do
   begin
      writeln('value of a: ', a);
   end;

   writeln();

   writeln('FOR:DOWNTO STATEMENT');
   for a := 20 downto 10 do
   begin
      writeln('value of a: ', a);
   end;
end.