program test20;
var
   a, b, ret : real;

(*function definition *)
function max(num1, num2: real): real;
var
   (* local variable declaration *)
   result: real;

begin
   if (num1 > num2) then
      result := num1
   
   else
      result := num2;
   max := result;
end;

procedure findMin(x, y, z: real); 
(* Finds the minimum of the 3 values *)

begin
   if x < y then
      x := 10
   else
      x := y;
   
   if z < y then
      x := z;
end; { end of procedure findMin }  

begin
   a := 100;
   b := 200;
   (* calling a function to get max value *)
   ret := max(a, b);
   
   writeln( 'Max value is : ', ret );
end.