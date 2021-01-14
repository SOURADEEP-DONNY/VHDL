--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:23:57 01/14/2021
-- Design Name:   
-- Module Name:   E:/Vhdl_Projects/FIFO_BASIC_TB.vhd
-- Project Name:  Vhdl_Projects
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BASIC_FIFO_MODULE
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
 
ENTITY FIFO_BASIC_TB IS
END FIFO_BASIC_TB;
 
ARCHITECTURE behavior OF FIFO_BASIC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BASIC_FIFO_MODULE
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         WR : IN  std_logic;
         RD : IN  std_logic;
         DATAIN : IN  std_logic_vector(3 downto 0);
         DATAOUT : OUT  std_logic_vector(3 downto 0);
         EMPTY : OUT  std_logic;
         FULL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal DATAIN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal DATAOUT : std_logic_vector(3 downto 0);
   signal EMPTY : std_logic;
   signal FULL : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BASIC_FIFO_MODULE PORT MAP (
          CLK => CLK,
          RST => RST,
          WR => WR,
          RD => RD,
          DATAIN => DATAIN,
          DATAOUT => DATAOUT,
          EMPTY => EMPTY,
          FULL => FULL
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		RST<='1';
		WAIT FOR 20 NS;
		RST<='0';
		DATAIN<="0101";
		WR<='1';
		WAIT FOR 20 NS;
		WR<='0';
		RD<='1';
      wait;
   end process;

END;
