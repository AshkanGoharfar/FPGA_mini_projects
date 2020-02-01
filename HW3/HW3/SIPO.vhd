library ieee;
use ieee.std_logic_1164.all;

entity sipo is
	port(clk ,en,rst :in std_logic;	
		din  :in 	std_logic;
		dout  :out 	std_logic_vector);
end sipo;

architecture behavioral of sipo is
	signal	 reg :	std_logic_vector(dout'RANGE);
	constant ZERO :	std_logic_vector(dout'range):= (others=> '0');
begin
	reg_process:process(clk,en)
	begin
		if(clk'EVENT and clk='1' )then 
			if(rst ='1') then
				reg <= ZERO;
			elsif(en = '1')	 then
				reg(reg'LENGTH -1 downto 1) <= reg(reg'LENGTH -2 downto 0);
				reg(0) <= din;
			end if;
		end if;
	end process;
	dout <= reg;
end behavioral;