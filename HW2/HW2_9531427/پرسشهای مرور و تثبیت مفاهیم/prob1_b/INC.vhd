library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
entity INC is
 
 Port ( 
   Iin :in std_logic_vector(7 downto 0);
   Y   : out  std_logic_vector(8 downto 0)
 );
end entity INC;
architecture Behavioral of INC is 
 
signal sum : std_logic_vector(Iin'high+1 downto Iin'low );
signal one : std_logic_vector(Iin'high+1 downto Iin'low );
begin
 one(one'high downto one'low+1)<=(others=>'0');
 one(one'low)<='1';
 sum<=Iin+one;
 Y<=sum(one'high downto one'low);
 
end architecture ;






