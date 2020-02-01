----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2019 06:31:20 PM
-- Design Name: 
-- Module Name: matrix_tb - Behavioral
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

entity matrix_tb is
--  Port ( );
end matrix_tb;

architecture Behavioral of matrix_tb is

component top_matrix  
    Port ( data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_in_index : in STD_LOGIC_VECTOR (1 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out_index : out STD_LOGIC_VECTOR (1 downto 0);
           clk   : in std_logic;
           valid : out STD_LOGIC);
end component;

signal data_in :  STD_LOGIC_VECTOR (15 downto 0);
signal data_in_index :   STD_LOGIC_VECTOR (1 downto 0):="00";
signal data_out :   STD_LOGIC_VECTOR (15 downto 0);
signal data_out_index :   STD_LOGIC_VECTOR (1 downto 0);
signal clk   :   std_logic:='0';
signal  valid :   STD_LOGIC:='0';
type data_test is array(0 to 3) of std_logic_vector(15 downto 0);
signal data:data_test;
signal i :integer range 0 to 4:=0;
signal delay:integer range 0 to 10:=0;
begin

my_top:top_matrix  
    Port map( data_in =>data_in,
           data_in_index =>data_in_index,
           data_out =>data_out,
           data_out_index =>data_out_index,
           clk   =>clk,
           valid =>valid);
data(0)<=x"0001";
data(1)<=x"0002";
data(2)<=x"0003";
data(3)<=x"0004"; 
clk<= not(clk) after 10ns;
process(clk)
begin

if rising_edge(clk) then
    -- if i<4 then
        
     --end if;
   
         if i=0  then
             data_in<=data(0);
             data_in_index<="00"; 
             i<=1;
         elsif i=1 then
              data_in<=data(1);
               data_in_index<="01"; 
              i<=2;            
          elsif i=2 then
                   data_in<=data(2);
                    data_in_index<="10"; 
                   i<=3; 
          elsif i=3 then
                        data_in<=data(3);
                         data_in_index<="11"; 
                        i<=3;            
          end if;   
   
end if;

end process;



end Behavioral;
