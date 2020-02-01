----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2019 04:57:06 PM
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
generic( m: integer:=16;
         n: integer :=1024);
    Port ( data_in : in STD_LOGIC_VECTOR (m-1 downto 0);
           write_command : in STD_LOGIC;
           read_command : in STD_LOGIC;
           error : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (m-1 downto 0);
           full : out STD_LOGIC;
           clk  : in std_logic;
           empty : out STD_LOGIC);
end top;

architecture Behavioral of top is
subtype row is std_logic_vector(m-1 downto 0);
type stack is array(0 to n) of row;
signal my_stack :stack;
signal address :integer range 0 to n:=0; 
signal full_signal :std_logic:='0';
signal error_signal : std_logic:='0';
signal empty_signal :std_logic:='0';

begin

process(clk)

begin
full<=full_signal;
empty<=empty_signal;
error<=error_signal;
if  rising_edge(clk) then
--write
   if write_command='1' then
        my_stack(address)<=data_in;
        if address<n then 
            address<=address+1;
            full_signal<='0';
            error_signal<='0';
        elsif address>n  and full_signal='0' then
             full_signal<='1';
             error_signal<='0';
        elsif address>n and full_signal='1' then
             error_signal<='1';  
        end if;   --write  
-- read             
   elsif read_command='1' and address>=0 then
     data_out<=my_stack(address);
     if address>=1 then 
         address<=address-1;
         empty_signal<='0';
         error_signal<='0';
     elsif address=1  and empty_signal='0' then
          empty_signal<='1';
          error_signal<='0';
     elsif address=0 and empty_signal='1' then
          error_signal<='1';  
      end if; --read
             
 end if;  --read or write

end if; --rising clk
end process;


end Behavioral;
