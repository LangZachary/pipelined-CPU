--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:07:33 02/09/2017
-- Design Name:   
-- Module Name:   M:/Documents/CENG450/Final_Project/CPU_TB.vhd
-- Project Name:  Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
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
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all; 
use work.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CPU_TB IS
END CPU_TB;
 
ARCHITECTURE behavior OF CPU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    Port ( 	clk: 				in std_logic;
				rst: 				in std_logic;
				step:				in std_logic;
				switches:		in std_logic_vector(7 downto 0);
				LEDOUT:			out std_logic_vector(7 downto 0);
				result_mult: 	out std_logic_vector(15 downto 0);
				an:				out std_logic_vector(3 downto 0);
				sseg:				out std_logic_vector(6 downto 0)
			);
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
	signal step : std_logic := '0';
	signal switches : std_logic_vector(7 downto 0) := X"00";

	--BiDirs

 	--Outputs
   signal result_mult: std_logic_vector(15 downto 0);
	signal LEDOUT: std_logic_vector(7 downto 0);
	signal an: std_logic_vector(3 downto 0);
	signal sseg: std_logic_vector(6 downto 0);
	

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (	clk => clk,
								rst => rst,
								step => step,
								switches => switches,
								LEDOUT => LEDOUT,
								an => an,
								sseg => sseg,
								result_mult => result_mult			 
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0'; wait for 10 us;
		clk <= '1'; wait for 10 us; 
   end process;
 

   -- Stimulus process
   stim_proc: process
	begin
		rst <= '1';
		wait for 20 us;
		rst <= '0';
		wait for 150 us;
		switches <= X"00";
		step <= '1';
		wait for 40 us;
		step <= '0';
		wait for 40 us;
		switches <= X"04";
		step <= '1';
		wait for 40 us;
		step <= '0';
		wait for 10000 us;
	end process;

END;