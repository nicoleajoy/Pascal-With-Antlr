(* Output:
value of a: 10.0
value of a: 11.0
value of a: 12.0
value of a: 13.0
value of a: 14.0
value of a: 15.0
value of a: 16.0
value of a: 17.0
value of a: 18.0
value of a: 19.0
*)

program Test18;
var
   a: real;

begin
   a := 10;
   while  a < 20  do
   
   begin
      writeln('value of a: ', a);
      a := a + 1;
   end;
end.