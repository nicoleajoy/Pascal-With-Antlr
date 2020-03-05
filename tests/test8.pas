program test8;

var
    a, b, c: boolean;

begin
    a := true;
    b := false;
    
    c := a and b;
    writeln('a and b = ', c);

    c := a or b;
    writeln('a or b = ' , c);
    
    a := false;
    b := true;
    
    c := (a or b) and b;
    writeln('(a or b) and b = ' , c);
end.