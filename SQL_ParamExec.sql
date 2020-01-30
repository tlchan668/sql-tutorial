exec salesrangebycity;
exec salesrangebycity 'cincinnati';
exec salesrangebycity 'cincinnati', 40000, 60000;
--leave city but use paramenters change it, if use names parameters can put in any order
exec salesrangebycity @lowsales = 40000, @highsales = 70000;