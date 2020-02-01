
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_Std.ALL;

entity problem3_3 is
end problem3_3;

architecture Behavioral of problem3_3 is
	subtype time_t is std_logic_vector(16 downto 0);

function "+" (x , y : time_t) return time_t is
	variable x_seconds, y_seconds, r_seconds: integer;
	variable result : time_t;
	
begin
	x_seconds := to_integer(unsigned(x(5 downto 0))) + 60* to_integer(unsigned(x(11 downto 6))) + 3600 * to_integer(unsigned(x(16 downto 12)));
	y_seconds := to_integer(unsigned(y(5 downto 0))) + 60* to_integer(unsigned(y(11 downto 6))) + 3600 * to_integer(unsigned(y(16 downto 12)));
	r_seconds := x_seconds + y_seconds;
	result(5 downto 0) := conv_std_logic_vector(r_second rem 60,6);
	result := r_seconds mod 60;
	result(11 downto 6) := conv_std_logic_vector(r_second rem 60,6);
	result := r_seconds mod 60;
	result(16 downto 12) := conv_std_logic_vector(r_second rem 60,5);
	
	return result;
end;


begin


end Behavioral;

