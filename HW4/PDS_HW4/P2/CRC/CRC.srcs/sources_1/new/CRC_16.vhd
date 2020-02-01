----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2019 04:23:37 PM
-- Design Name: 
-- Module Name: CRC_16 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CRC_16 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           serial_in : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end CRC_16;

architecture Behavioral of CRC_16 is
signal data_register:std_logic_vector(15 downto 0):=x"0000";
begin
data_out<=data_register;
process(clk,reset)
begin
if reset='1' then
  data_register<=x"0000";
elsif rising_edge(clk) then
  if(enable='1') then
  data_register(15)<=serial_in xor data_register(0);
  data_register(14)<=data_register(15);
  data_register(13)<=data_register(14);
  data_register(12)<=data_register(13);
  data_register(11)<=data_register(12);
  data_register(10)<=data_register(11)xor (serial_in xor data_register(0));
  data_register(9)<=data_register(10);
  data_register(8)<=data_register(9);
  data_register(7)<=data_register(8);
  data_register(6)<=data_register(7);
  data_register(5)<=data_register(6);
  data_register(4)<=data_register(5);
  data_register(3)<=data_register(4);
  data_register(2)<=data_register(3)xor (serial_in xor data_register(0));
  data_register(1)<=data_register(2);
  data_register(0)<=data_register(1);
  

  end if;

end if;

end process;


end Behavioral;
