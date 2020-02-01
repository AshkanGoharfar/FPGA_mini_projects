----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2019 04:36:06 PM
-- Design Name: 
-- Module Name: CRC_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CRC_tb is
--  Port ( );
end CRC_tb;

architecture Behavioral of CRC_tb is

component CRC_16 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           serial_in : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal clk :   STD_LOGIC:='0';
signal reset :  STD_LOGIC:='1';
signal enable :  STD_LOGIC:='0';
signal serial_in :  STD_LOGIC:='0';
signal data_out :  STD_LOGIC_VECTOR (15 downto 0):=x"0000";
signal i :integer range 0 to 15:=0;
signal data :std_logic_vector(15 downto 0):=X"1A47";

begin

my_crc:  CRC_16 
    Port map ( clk =>clk,
           reset  =>reset,
           enable=>enable,
           serial_in =>serial_in,
           data_out =>data_out
            );
clk<= not(clk) after 10 ns;
process(clk)
begin
if rising_edge(clk) then
 serial_in<=data(i);
 i<=i+1;
  if i=15 then
    i<=0;
   end if; 
 enable<='1';
 reset<='0';
end if; 


end process;

end Behavioral;
