(* Output:
a := (-6.5 / 3.25) := -2.0
b := (2.0 + -5) + (3 - 1.0) := -1.0
c := a + b := -3.0
d := sqrt(d):= 3.1622776601683795
d := sin(30):= -0.9880316240928618
d := cos(45):= 0.5253219888177297
d := ln(1):= 0.0
d := ln(exp(1)):= 1.0
*)

program Test6;

var 
    a, b, c : real;
    d : real = 10;

begin
    a := (-6.5 / 3.25); 
    writeln('a := (-6.5 / 3.25) := ', a);

    b := (2.0 + -5) + (3 - 1.0);
    writeln('b := (2.0 + -5) + (3 - 1.0) := ', b);

    c := a + b;
    writeln('c := a + b := ', c);

    d := sqrt(d);
    writeln('d := sqrt(d):= ', d);

	d := sin(30);
    writeln('d := sin(30):= ', d);

	d := cos(45);
    writeln('d := cos(45):= ', d);

	d := ln(1);
    writeln('d := ln(1):= ', d);

	d := ln(exp(1));
    writeln('d := ln(exp(1)):= ', d);
end.