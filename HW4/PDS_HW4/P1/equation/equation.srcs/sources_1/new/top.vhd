----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2019 05:18:42 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( x : in STD_LOGIC_VECTOR (4 downto 0);
           clk :in std_logic;
           f : out STD_LOGIC_VECTOR (15 downto 0));
end top;

architecture Behavioral of top is

COMPONENT dist_mem_gen_0
  PORT (
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    clk : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;


begin


my_rom : dist_mem_gen_0
  PORT MAP (
    a => x,
    clk => clk,
    spo => f
  );


end Behavioral;
