----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:56 03/22/2019 
-- Design Name: 
-- Module Name:    config_arch - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity config_arch is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           mode : in  STD_LOGIC;
           shift : in  STD_LOGIC_VECTOR (2 downto 0);
           output1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  output2 : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end config_arch;

architecture Behavioral of config_arch is
component shift_RTL 
Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           shamt : in  STD_LOGIC_VECTOR (2 downto 0);
           mode : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

for module1:shift_RTL
    use entity work.shift_RTL(problem3);

 for module2:shift_RTL
    use entity work.shift_RTL(problem4);



begin

module1:shift_RTL port map(input=>input,
                           shamt=>shift,
									mode=>mode,
									output=>output1);
module2:shift_RTL port map(input=>input,
                           shamt=>shift,
									mode=>mode,
									output=>output2);


end Behavioral;

