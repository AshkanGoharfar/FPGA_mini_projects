
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.ALL;

entity problem3_1 is
	generic(
		vt : in real := 0.7;
		eta : in real := 2.0;
		gmin : in real := 1.0;
		i_bv : in real := 1.0;
		e : in real := 2.71;
		bv : in real := 1.0);
	port(
		i_s : in real;
		v_d : in real;
		i_d : out real);
end problem3_1;

architecture Behavioral of problem3_1 is
	procedure diode_proc (
			signal i_s: in real;
			signal v_d :in real;
			signal i_d :out real) is
	begin
		if(-5.0 * vt <= v_d) then
			i_d <= i_s * (e**(v_d/(eta*vt))-1) + v_d * gmin;
		elsif( (-1.0 * bv <v_d) and (v_d < -5.0 * vt)) then
			i_d <= -1.0 * i_s +  v_d * gmin;
		elsif(-5.0 * bv = v_d) then
			i_d <= -1.0 * i_bv ;
		else
			i_d <= i_s * (e**(v_d/(eta*vt))-1 + (bv/vt)) + v_d * gmin;
		end if;
    
end procedure;
begin
	diode_proc(i_s, v_d, i_d);

end Behavioral;

