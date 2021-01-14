----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:02:52 01/14/2021 
-- Design Name: 
-- Module Name:    BASIC_FIFO_MODULE - Behavioral 
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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BASIC_FIFO_MODULE is
PORT (
	CLK: IN STD_LOGIC;
	RST: IN STD_LOGIC;
	WR: IN STD_LOGIC;
	RD: IN STD_LOGIC;
	DATAIN: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	DATAOUT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	EMPTY: OUT STD_LOGIC;
	FULL: OUT STD_LOGIC
	);
end BASIC_FIFO_MODULE;

architecture Behavioral of BASIC_FIFO_MODULE is

begin
FIFO_PROC:PROCESS(CLK,RST)
TYPE FIFO_MEMORY IS ARRAY(0 TO 3) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
VARIABLE MEMORY:FIFO_MEMORY;
VARIABLE HEAD:NATURAL RANGE 0 TO 3;
VARIABLE TAIL:NATURAL RANGE 0 TO 3;

VARIABLE LOOPED:BOOLEAN;
BEGIN
	IF RISING_EDGE(CLK)THEN
		IF RST='1' THEN
		HEAD:=0;
		TAIL:=0;
		LOOPED:=FALSE;
		FULL<='0';
		EMPTY<='1';
	ELSE
		IF(RD='1')THEN
			IF((LOOPED=TRUE)OR(HEAD/=TAIL))THEN
			DATAOUT<=MEMORY(TAIL);
			IF(TAIL=3)THEN
				TAIL:=0;
				LOOPED:=FALSE;
			ELSE
			TAIL:=TAIL+1;
			END IF;
			END IF;
		END IF;
		
		IF(WR='1')THEN
			IF((LOOPED=FALSE)OR(HEAD/=TAIL))THEN 
			MEMORY(HEAD):=DATAIN;
			IF (HEAD=3) THEN
				HEAD:=0;
				LOOPED:=TRUE;
			ELSE
				HEAD:=HEAD+1;
			END IF;
			END IF;
		END IF;
		
		IF(HEAD=TAIL)THEN
			IF LOOPED THEN
				FULL<='1';
			ELSE
				EMPTY<='1';
			END IF;
			
		ELSE
			FULL<='0';
			EMPTY<='0';
		
		END IF;
		END IF;
	END IF;
END PROCESS;
end Behavioral;

