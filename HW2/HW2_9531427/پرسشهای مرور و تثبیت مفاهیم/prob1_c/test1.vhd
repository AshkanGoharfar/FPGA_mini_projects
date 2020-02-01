--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:17:18 03/21/2019
-- Design Name:   
-- Module Name:   D:/Ashkan works/exam2-1/prob1/test1.vhd
-- Project Name:  prob1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: INC
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
 
ENTITY test1 IS
END test1;
 
ARCHITECTURE behavior OF test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT INC_a
	  
    PORT(
         Iin : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

    COMPONENT INC_b
	  
    PORT(
         Iin : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;



   --Inputs
   signal Iin : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Y_a : std_logic_vector(8 downto 0);
   signal Y_b : std_logic_vector(8 downto 0);	
	
	signal compare_result : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uuta: INC_a 
	
	  
	  PORT MAP (
          Iin => Iin,
          Y => Y_a
        );
		  
		  
	   uutb: INC_b 
		  	  PORT MAP (
          Iin => Iin,
          Y => Y_b
        );	  
		  

   -- Clock process definitions
   --<clock>_process :process
  -- begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
 --  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		compare_result<=Y_b xnor Y_a;
      wait for 100 ns;	
      Iin<="00000000";
		compare_result<=Y_b xnor Y_a;
      wait for 100 ns;	
		Iin<="11100000";
		compare_result<=Y_b xnor Y_a;
		wait for 100 ns; 
		Iin<="00001111";
		compare_result<=Y_b xnor Y_a;
		wait for 100 ns;		 
		compare_result<=Y_b xnor Y_a; 

      -- insert stimulus here 

      wait;
   end process;

END;
