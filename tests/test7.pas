program test7;

var 
    a, b, c : real;
    d : real = 10;
    e : boolean = false;
    f : boolean = true;

begin
    a := (-6.5 / 3.25);
    writeln(a);
    b := (2.0 + -5) + (3 - 1.0);
    writeln(b);
    c := a + b;
    writeln(c);
    d := sqrt(d);
    writeln(d);

    writeln('a: ' , a , ' | b: ' , b , ' | c: ', c , ' | d: ' , d);
    
	d := sin(30);
	d := cos(45);
	d := ln(1);
	d := ln(exp(1));
    writeln('d: ', d);

    writeln(e);
    writeln(f);
end.