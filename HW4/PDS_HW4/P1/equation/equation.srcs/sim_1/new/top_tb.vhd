----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2019 05:49:03 PM
-- Design Name: 
-- Module Name: top_tb - Behavioral
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

entity top_tb is
--  Port ( );
end top_tb;
architecture Behavioral of top_tb is
component top
    Port ( x : in STD_LOGIC_VECTOR (4 downto 0);
           clk :in std_logic;
           f : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal x   :STD_LOGIC_VECTOR (4 downto 0):="00000";
signal clk :  std_logic:='0';
signal f :   STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
signal number: unsigned (4 downto 0):="00000";

begin

my_formula: top port map(
   x=>x,
   clk=>clk,
   f=>f
);
clk<=not(clk) after 10 ns;
process(clk)
begin
 if  rising_edge(clk) then
 number<=number+1;
 x<=std_logic_vector(number);
    
 end if;
 
end process;

end Behavioral;
