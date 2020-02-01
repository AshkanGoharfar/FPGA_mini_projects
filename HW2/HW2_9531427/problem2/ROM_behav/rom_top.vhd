----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:30:06 03/21/2019 
-- Design Name: 
-- Module Name:    rom_top - Behavioral 
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
use IEEE.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_top is
    generic ( m: integer:=10 ;
	           n: integer:=4);
	 
 
    Port ( address : in  STD_LOGIC_VECTOR (m-1 downto 0);
           mode : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (n*8 downto 0));
end rom_top;

architecture Behavioral of rom_top is

constant k :unsigned(m-1 downto 0):=(others=>'1');
 
subtype ROW_BYTES  is std_logic_vector(n*8 downto 0);
type ROM is array (1 to to_integer(k) )of ROW_BYTES;
signal my_ROM : ROM;
signal data_big_Endian,data_little_Endian: ROW_BYTES ;
 
begin
 
data_big_Endian <=my_ROM(to_integer(unsigned(address)));
   
 LE: for I in   n*8 downto 0  generate
 
     data_little_Endian(I)<=data_big_Endian(n*8-I);
   
		 
     end generate LE;
  
data <= data_big_Endian when mode='0' else
        data_little_Endian;

end Behavioral;

