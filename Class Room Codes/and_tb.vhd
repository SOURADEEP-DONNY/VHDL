--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:22:14 09/03/2020
-- Design Name:   
-- Module Name:   E:/Vhdl_Projects/and_tb.vhd
-- Project Name:  Vhdl_Projects
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xor_gate
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
 
ENTITY and_tb IS
END and_tb;
 
ARCHITECTURE behavior OF and_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xor_gate
    PORT(
         c : IN  std_logic;
         d : IN  std_logic;
         r : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal c : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal r : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xor_gate PORT MAP (
          c => c,
          d => d,
          r => r
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
c<='0';
d<='0';
wait for 100 ns;	
c<='0';
d<='1';
wait for 100 ns;	
c<='1';
d<='0';
wait for 100 ns;	
c<='1';
d<='1';
--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
