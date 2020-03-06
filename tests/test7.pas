program Test7;
var a: real;

begin
   a := 10;
   while  a < 20 do
   
   begin
      writeln('value of a: ', a);
      a := a + 1;
      
      if (a > 15) then
      break;
   end;
end.