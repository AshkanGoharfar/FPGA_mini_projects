----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:29 03/22/2019 
-- Design Name: 
-- Module Name:    MUX8 - Behavioral 
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

entity MUX8 is
    Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           dout : out  STD_LOGIC);
end MUX8;

architecture Behavioral of MUX8 is

begin

dout<=din(0) when sel="0000" else
      din(1) when sel="0001" else
      din(2) when sel="0010" else
      din(3) when sel="0011" else
      din(4) when sel="0100" else
		din(5) when sel="0101" else
      din(6) when sel="0110" else
      din(7) when sel="0111" else
		din(8) when sel="1000" else
      din(9) when sel="1001" else
      din(10) when sel="1010" else
      din(11) when sel="1011" else
		din(12) when sel="1100" else
      din(13) when sel="1101" else
      din(14) when sel="1110" else
		din(15) when sel="1111" ;
 





end Behavioral;

