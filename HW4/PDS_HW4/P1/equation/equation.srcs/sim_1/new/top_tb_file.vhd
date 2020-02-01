----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2019 07:07:34 PM
-- Design Name: 
-- Module Name: top_tb_file - Behavioral
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
use STD.textio.all;
use ieee.std_logic_textio.all;
use IEEE.MATH_REAL.all;
 


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_tb_file is
--  Port ( );
end top_tb_file;

architecture Behavioral of top_tb_file is

component top
    Port ( x : in STD_LOGIC_VECTOR (4 downto 0);
           clk :in std_logic;
           f : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal x   :STD_LOGIC_VECTOR (4 downto 0):="00000";
signal clk :  std_logic:='0';
signal f :   STD_LOGIC_VECTOR (15 downto 0):=(others=>'0');
signal number: unsigned (4 downto 0):="00000";
 
file file_RESULTS : text;
begin
my_formula: top port map(
   x=>x,
   clk=>clk,
   f=>f
);
clk<=not(clk) after 10 ns;
 ---------------------------------
 process
 
   variable v_OLINE     : line;
   variable v_SPACE     : character:=',';
   variable v_dot     : character:='.';
   
 begin 

 
 file_open(file_RESULTS, "output_results.txt", write_mode);

 cal: for I in 0 to 32 loop
     number<=number+1;
     x<=std_logic_vector(number);
     wait for 20 ns;
     
      write(v_OLINE,x,left,7);
      write(v_OLINE, v_SPACE);
      write(v_OLINE,to_integer(signed(x)),left,7);
      write(v_OLINE, v_SPACE);
      write(v_OLINE,f,left,18);
      write(v_OLINE, v_SPACE);
      write(v_OLINE,to_integer(signed(f(15 downto 10))));  
      write(v_OLINE, v_dot); 
      write(v_OLINE, integer(1000000*real(to_integer(unsigned(f(9 downto 0))))/1024));  
      writeline(file_RESULTS, v_OLINE);
    
    -- writeline(file_RESULTS, v_OLINE);
   --  write(v_OLINE, f, right, 5);
    -- writeline(file_RESULTS, v_OLINE);
   end loop;

  
   file_close(file_RESULTS);
   
   wait;
 end process;
 
 
 
 
 ------------------------------


end Behavioral;
