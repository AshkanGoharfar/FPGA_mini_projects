library ieee;
use ieee.std_logic_1164.all;
entity piso is
	port(clk ,en,sh,rst :in std_logic;	
		din  :in 	std_logic_vector;
		dout  :out 	std_logic);
end piso;

architecture behavioral of piso is
	signal reg :std_logic_vector(din'RANGE);
	constant ZERO :	std_logic_vector(din'range):= (others=> '0');
	
begin
	reg_process:process(clk)
	begin
		if(clk'EVENT and clk='1' )then 
			dout <= reg(0);
			if(rst ='1') then
				reg <= ZERO;
			elsif(en = '1')	 then
				reg <= din;
			elsif(sh='1') then	
				reg <= '0' & reg(reg'LENGTH-1 downto 1) ; 
			end if;
		end if;
	end process;
end behavioral;
