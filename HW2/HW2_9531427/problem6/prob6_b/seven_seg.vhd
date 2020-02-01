----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:50 03/22/2019 
-- Design Name: 
-- Module Name:    seven_seg - Behavioral 
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

entity seven_seg is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (6 downto 0));
end seven_seg;


architecture Behavioral of seven_seg is
signal output_not :STD_LOGIC_VECTOR (6 downto 0);
begin

output_not <=
   "0111111" when input="0000" else   --0
	"0000110" when input="0001" else   --1
	"1011011" when input="0010" else   --2
	"1001111" when input="0011" else   --3
	"1100110" when input="0100" else    --4
	"1101101" when input="0101" else    --5
	"1111101" when input="0110" else    --6
	"0000111" when input="0111" else    --7
	"1111111" when input="1000" else    --8
	"1101111" when input="1001" else    --9
	"1110111" when input="1010" else    --A
	"1111100" when input="1011" else   --B
	"0111001" when input="1100" else --C
   "1011110" when input="1101" else --D
   "1111001" when input="1110" else  --E
   "1110001" when input="1111";	 --F

output<=not(output_not); -- for common anode  seven segment

end Behavioral;

