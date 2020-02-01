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
           shamt : in  STD_LOGIC_VECTOR (2 downto 0);
           mode : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end shift_RTL;

-----------------------------------------------
architecture  problem3 of shift_RTL is
signal zero: std_logic_vector(7 downto 0):=(others=>'0');
signal msb :std_logic_vector(7 downto 0) ;
 
signal shift_count:integer range 0 to 7;
 
begin
shift_count<=to_integer(unsigned(shamt));
 msb<=(others=>input(7));
 output<= input when shift_count=0 else
          msb(shift_count-1 downto 0) & input(7 downto shift_count) when mode='1' and shift_count/=0 else  --left shift
          zero(shift_count-1 downto 0) & input(7 downto shift_count)      when mode='0' and shift_count/=0  ;     --rigth shift

end problem3;

--------------------------------------------------------

architecture problem4 of shift_RTL is
signal zero: std_logic_vector(7 downto 0):=(others=>'0');
 
signal  sel :std_logic_vector( 3 downto 0);

component MUX8 
    Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           dout : out  STD_LOGIC);
end component;

signal dinmux0,dinmux1,dinmux2,dinmux3,dinmux4,dinmux5,dinmux6,dinmux7  :std_logic_vector(15 downto 0);

 
begin
dinmux0<=input(7 downto 0)&input(7 downto 0);
dinmux1<=input(7)&input(7 downto 1) &"0"&input(7 downto 1);
dinmux2<=input(7)&input(7)&input(7 downto 2) &"00"&input(7 downto 2);
dinmux3<=input(7)&input(7)&input(7)&input(7 downto 3) &"000"&input(7 downto 3);
dinmux4<=input(7)&input(7)&input(7)&input(7)&input(7 downto 4) &"0000"&input(7 downto 4);
dinmux5<=input(7)&input(7)&input(7)&input(7)&input(7)&input(7 downto 5) &"00000"&input(7 downto 5);
dinmux6<=input(7)&input(7)&input(7)&input(7)&input(7)&input(7)&input(7 downto 6) &"000000"&input(7 downto 6);
dinmux7<=input(7)&input(7)&input(7)&input(7)&input(7)&input(7)&input(7)&input(7) & "0000000"&input(7);

MUX_0:MUX8 port map(dinmux0,sel,output(0));
MUX_1:MUX8 port map(dinmux1,sel,output(1));
MUX_2:MUX8 port map(dinmux2,sel,output(2));
MUX_3:MUX8 port map(dinmux3,sel,output(3));
MUX_4:MUX8 port map(dinmux4,sel,output(4)); 
MUX_5:MUX8 port map(dinmux5,sel,output(5)); 
MUX_6:MUX8 port map(dinmux6,sel,output(6)); 
MUX_7:MUX8 port map(dinmux7,sel,output(7)); 
----
sel<=mode & shamt;
 
                                        

 
                                        




end problem4;
--------------------------------------------
