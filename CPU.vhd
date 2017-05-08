----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:29:07 02/09/2017 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
    Port ( 	clk: 				in std_logic;
				rst: 				in std_logic;
				step:				in std_logic;
				switches:		in std_logic_vector(7 downto 0);
				LEDOUT:			out std_logic_vector(7 downto 0);
				result_mult: 	out std_logic_vector(15 downto 0);
				an:				out std_logic_vector(3 downto 0);
				sseg:				out std_logic_vector(6 downto 0)
			);
end CPU;

architecture Behavioral of CPU is

	signal ram_address:	std_logic_vector(15 downto 0);
	signal rom_address:	std_logic_vector(15 downto 0);
	signal ram_din:		std_logic_vector(15 downto 0);
	signal ram_dout:		std_logic_vector(15 downto 0);
	signal rom_data:		std_logic_vector(15 downto 0);
	signal wr_data:		std_logic_vector(15 downto 0);
	signal wr_reg: 		std_logic;
	signal wr_ram:			std_logic;
	signal wr_index: 		std_logic_vector(2 downto 0); 
	signal rd_index1: 	std_logic_vector(2 downto 0); 
	signal rd_index2: 	std_logic_vector(2 downto 0);
	signal rd_data1: 		std_logic_vector(15 downto 0); 
	signal rd_data2: 		std_logic_vector(15 downto 0);
	signal alu_in1: 		std_logic_vector(15 downto 0);
	signal alu_in2: 		std_logic_vector(15 downto 0);				
	signal alu_mode:		std_logic_vector (3 downto 0);
	signal alu_result:	std_logic_vector (15 downto 0);
	signal z_flag: 		std_logic;
	signal n_flag: 		std_logic;
	signal OUTPUT:			std_logic_vector(15 downto 0);


component ALU is
	Port	(	rst : 			in std_logic; 
				in1:				in std_logic_vector(15 downto 0); 
				in2: 				in std_logic_vector(15 downto 0); 
				alu_mode: 		in std_logic_vector(3 downto 0); 
				result: 			out std_logic_vector(15 downto 0);
				z_flag: 			out std_logic; 
				n_flag: 			out std_logic
			);
end component;

component Reg is
	Port	(	rst : 			in std_logic; 
				clk: 				in std_logic;
				rd_index1: 		in std_logic_vector(2 downto 0); 
				rd_index2: 		in std_logic_vector(2 downto 0); 
				rd_data1: 		out std_logic_vector(15 downto 0); 
				rd_data2: 		out std_logic_vector(15 downto 0);
				wr_index: 		in std_logic_vector(2 downto 0); 
				wr_data: 		in std_logic_vector(15 downto 0); 
				wr_enable: 		in std_logic
			);
end component;

component CU is
	Port	(	rst : 			in std_logic; 
				clk: 				in std_logic;
				step:				in std_logic;
				switches:		in std_logic_vector(7 downto 0);
				LEDOUT:			out std_logic_vector(7 downto 0);
				OUTPUT:			out std_logic_vector(15 downto 0);
				ram_address:	out std_logic_vector(15 downto 0);
				rom_address:	out std_logic_vector(15 downto 0);
				ram_din:			in std_logic_vector(15 downto 0);
				ram_dout:		out std_logic_vector(15 downto 0);
				rom_data:		in std_logic_vector(15 downto 0);
				alu_mode:		out std_logic_vector(3 downto 0);
				rd_index1: 		out std_logic_vector(2 downto 0); 
				rd_index2: 		out std_logic_vector(2 downto 0);
				rd_data1:		in std_logic_vector(15 downto 0);
				rd_data2:		in std_logic_vector(15 downto 0);
				alu_in1: 		out std_logic_vector(15 downto 0);
				alu_in2: 		out std_logic_vector(15 downto 0);
				alu_result:		in std_logic_vector(15 downto 0);
				wr_data:			out std_logic_vector(15 downto 0);
				wr_index: 		out std_logic_vector(2 downto 0); 
				wr_reg: 			out std_logic;
				wr_ram:			out std_logic;
				n_flag:			in std_logic;
				z_flag:			in std_logic
			);
end component;

component ROM is
    Port ( 	clk : 			in  std_logic;
				mem_address : 	in  std_logic_vector (15 downto 0);
				data : 			out  std_logic_vector (15 downto 0)
			);
end component;

component RAM is
    Port ( 	clk: 				in std_logic;
				rst:				in std_logic;
				wr_enable:		in std_logic;
				mem_address: 	in std_logic_vector (15 downto 0);
				din: 				in std_logic_vector (15 downto 0);
				dout:				out std_logic_vector(15 downto 0)
			);
end component;

component display_controller is
	port(
		clk, reset: in std_logic;
		hex3, hex2, hex1, hex0: in std_logic_vector(3 downto 0);
		an: out std_logic_vector(3 downto 0);
		sseg: out std_logic_vector(6 downto 0)
	);
end component;

begin

u0:ALU
port map	(	rst => rst,
				in1 => alu_in1,
				in2 => alu_in2,
				result => alu_result,
				alu_mode => alu_mode,
				z_flag => z_flag,
				n_flag => n_flag
);

u1:Reg
port map	(	rst => rst,
				clk => clk,
				rd_index1 => rd_index1,
				rd_index2 => rd_index2,
				rd_data1 => rd_data1,
				rd_data2 => rd_data2,
				wr_enable => wr_reg,
				wr_index => wr_index,
				wr_data => wr_data
);

u2:CU
port map	(	rst => rst,
				clk => clk,
				step => step,
				switches => switches,
				LEDOUT => LEDOUT,
				OUTPUT => OUTPUT,
				alu_mode => alu_mode,
				wr_data => wr_data,
				wr_reg => wr_reg,
				wr_ram => wr_ram,
				rd_index1 => rd_index1,
				rd_index2 => rd_index2,
				rd_data1 => rd_data1,
				rd_data2 => rd_data2,
				alu_in1 => alu_in1,
				alu_in2 => alu_in2,
				alu_result => alu_result,
				wr_index => wr_index,
				ram_address => ram_address,
				rom_address => rom_address,
				ram_din => ram_din,
				ram_dout => ram_dout,
				rom_data => rom_data,
				n_flag => n_flag,
				z_flag => z_flag
);

u3:ROM
port map	(	clk => clk,
				mem_address => rom_address,
				data => rom_data
);	

u4:RAM
port map	(	clk => clk,
				rst => rst,
				wr_enable => wr_ram,
				mem_address => ram_address,
				din => ram_dout,
				dout => ram_din
);	

u5:display_controller
port map	(	clk => clk,
				reset => rst,
				hex3 => OUTPUT(15 downto 12),
				hex2 => OUTPUT(11 downto 8),
				hex1 => OUTPUT(7 downto 4),
				hex0 => OUTPUT(3 downto 0),
				an => an,
				sseg => sseg
);			
		
end Behavioral;

