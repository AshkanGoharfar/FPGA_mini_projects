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
 
ENTITY test5 IS
END test5;
 
ARCHITECTURE behavior OF test5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
  
    component config_arch is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0);
           mode : in  STD_LOGIC;
           shift : in  STD_LOGIC_VECTOR (2 downto 0);
           output1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  output2 : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal shift : std_logic_vector(2 downto 0) := (others => '0');
   signal mode : std_logic := '0';

 	--Outputs
   signal output1 : std_logic_vector(7 downto 0);
   signal output2 : std_logic_vector(7 downto 0);
 
    
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: config_arch PORT MAP (
          input => input,
          shift => shift,
          mode => mode,
          output1 => output1,
			 output2 => output2
			 
        );

 
 

  -- Stimulus process
   stim_proc: process
   begin		
   wait for 100 ns;
	shift<="010";
   mode<='0',
	      '1' after 20 ns,
	      '0' after 40 ns;
	
	input <= b"1_101_10_10" after 10 ns,
	         b"0_101_11_00" after 30 ns;
	
	
 
 
 
   end process;

END;
