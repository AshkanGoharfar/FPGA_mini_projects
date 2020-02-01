--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:01:34 03/22/2019
-- Design Name:   
-- Module Name:   D:/Ashkan works/HW2_9531427/problem4/barrel_shift/test4.vhd
-- Project Name:  barrel_shift
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_RTL
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test4 IS
END test4;
 
ARCHITECTURE behavior OF test4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_RTL
    PORT(
         input : IN  std_logic_vector(7 downto 0);
         shamt : IN  std_logic_vector(2 downto 0);
         mode : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal shamt : std_logic_vector(2 downto 0) := (others => '0');
   signal mode : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
 
 
    
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_RTL PORT MAP (
          input => input,
          shamt => shamt,
          mode => mode,
          output => output
        );

 
 

  -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

       input<="10101111";
		 shamt<="010";
		 mode<='0';
      wait for 100 ns;
       input<="10101111";
		 shamt<="010";
		 mode<='1';

      wait;
   end process;

END;
