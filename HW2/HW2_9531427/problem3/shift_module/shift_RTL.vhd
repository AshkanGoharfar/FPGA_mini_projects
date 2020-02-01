----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:28:22 03/22/2019 
-- Design Name: 
-- Module Name:    shift_RTL - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_RTL is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           shamt : in  STD_LOGIC_VECTOR (2 downto 0):="101";
           mode : in  STD_LOGIC:='0';
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end shift_RTL;

architecture  struct of shift_RTL is
signal zero: std_logic_vector(7 downto 0):=(others=>'0');
signal msb :std_logic_vector(7 downto 0) ;
 
signal shift_count:integer range 0 to 7;
 
begin
shift_count<=to_integer(unsigned(shamt));
 msb<=(others=>input(7));
 output<= input when shift_count=0 else
          msb(shift_count-1 downto 0) & input(7 downto shift_count) when mode='1' and shift_count/=0 else  --left shift
          zero(shift_count-1 downto 0) & input(7 downto shift_count)      when mode='0' and shift_count/=0  ;     --rigth shift
 



end struct;

