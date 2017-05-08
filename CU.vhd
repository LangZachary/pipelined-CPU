----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:46:50 02/19/2017 
-- Design Name: 
-- Module Name:    CU - Behavioral 
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

entity CU is
	Port	(	rst: 				in std_logic; 
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
end CU;

architecture Behavioral of CU is

	constant ID : integer := 1;
	constant EX : integer := 2;
	constant WB : integer := 3;
	constant OP_ADD : std_logic_vector(6 downto 0) := "0000001";
	constant OP_SUB : std_logic_vector(6 downto 0) := "0000010";
	constant OP_MULT : std_logic_vector(6 downto 0) := "0000011";
	constant OP_NAND : std_logic_vector(6 downto 0) := "0000100";
	constant OP_SHR : std_logic_vector(6 downto 0) := "0000101";
	constant OP_SHL : std_logic_vector(6 downto 0) := "0000110";
	constant OP_TEST : std_logic_vector(6 downto 0) := "0000111";
	constant OP_OUT : std_logic_vector(6 downto 0) := "0100000";
	constant OP_IN : std_logic_vector(6 downto 0) := "0100001";
	constant OP_BRR : std_logic_vector(6 downto 0) := "1000000";
	constant OP_BRRN : std_logic_vector(6 downto 0) := "1000001";
	constant OP_BRRZ : std_logic_vector(6 downto 0) := "1000010";
	constant OP_BR : std_logic_vector(6 downto 0) := "1000011";
	constant OP_BRN : std_logic_vector(6 downto 0) := "1000100";
	constant OP_BRZ : std_logic_vector(6 downto 0) := "1000101";
	constant OP_BRSUB : std_logic_vector(6 downto 0) := "1000110";
	constant OP_RET : std_logic_vector(6 downto 0) := "1000111";
	constant OP_LOAD : std_logic_vector(6 downto 0) := "0010000";
	constant OP_STORE : std_logic_vector(6 downto 0) := "0010001";
	constant OP_LOADIMM : std_logic_vector(6 downto 0) := "0010010";
	constant OP_MOV : std_logic_vector(6 downto 0) := "0010011";
	type instruction_array is array (integer range 1 to 3) of std_logic_vector(15 downto 0);
	signal instruction: instruction_array;
	signal branch_clear: std_logic;
	signal ID_inputdata: std_logic_vector(15 downto 0);
	signal EX_inputdata: std_logic_vector(15 downto 0);
	signal EX_data: std_logic_vector(15 downto 0);
	signal EX_regdata1: std_logic_vector(15 downto 0);
	signal EX_regdata2: std_logic_vector(15 downto 0);
	signal WB_alu_result: std_logic_vector(15 downto 0);
	signal WB_inputdata: std_logic_vector(15 downto 0);
	signal WB_data: std_logic_vector(15 downto 0);
	signal ram_data: std_logic_vector(15 downto 0);
	signal n_test: std_logic;
	signal z_test: std_logic;
	signal wait_input: std_logic := '0';
	signal input_state: std_logic_vector(2 downto 0) := "000";
	alias	ID_OP: std_logic_vector(6 downto 0) is instruction(ID)(15 downto 9);
	alias ID_Ra: std_logic_vector(2 downto 0) is instruction(ID)(8 downto 6);
	alias ID_Rb: std_logic_vector(2 downto 0) is instruction(ID)(5 downto 3);
	alias ID_Rc: std_logic_vector(2 downto 0) is instruction(ID)(2 downto 0);
	alias	ID_displ: std_logic_vector(8 downto 0) is instruction(ID)(8 downto 0);
	alias	ID_disps: std_logic_vector(5 downto 0) is instruction(ID)(5 downto 0);
	alias	EX_OP: std_logic_vector(6 downto 0) is instruction(EX)(15 downto 9);
	alias	EX_displ: std_logic_vector(8 downto 0) is instruction(EX)(8 downto 0);
	alias EX_disps: std_logic_vector(5 downto 0) is instruction(EX)(5 downto 0);
	alias EX_ALU: std_logic_vector(3 downto 0) is instruction(EX)(12 downto 9);
	alias EX_Ra: std_logic_vector(2 downto 0) is instruction(EX)(8 downto 6);
	alias EX_Rb: std_logic_vector(2 downto 0) is instruction(EX)(5 downto 3);
	alias	EX_Rc: std_logic_vector(2 downto 0) is instruction(EX)(2 downto 0);
	alias EX_cl: std_logic_vector(3 downto 0) is instruction(EX)(3 downto 0);
	alias EX_ml: std_logic is instruction(EX)(8);
	alias EX_imm: std_logic_vector(7 downto 0) is instruction(EX)(7 downto 0);
	alias	WB_OP: std_logic_vector(6 downto 0) is instruction(WB)(15 downto 9);
	alias	WB_Ra: std_logic_vector(2 downto 0) is instruction(WB)(8 downto 6);

	begin
	
	process(clk)
	
		begin
		
		-- Interstage Latching --
		if (rising_edge(clk)) then
			
			if (rst = '0' and wait_input = '0') then
				-- EX/WB --
				instruction(WB) <= instruction(EX);
				WB_data <= EX_data;
				WB_alu_result <= alu_result;
				WB_inputdata <= EX_inputdata;
				ram_data <= ram_din;
							
				-- ID/EX --
				if (branch_clear = '0') then
					instruction(EX) <= instruction(ID);
				else
					instruction(EX) <= X"0000";
				end if;
				EX_inputdata <= ID_inputdata;
				EX_regdata1 <= rd_data1;
				EX_regdata2 <= rd_data2;
				n_test <= n_flag;
				z_test <= z_flag;
				
				-- IF/ID --
				instruction(ID) <= rom_data;
				
			elsif (rst = '1') then
				instruction(ID) <= X"0000";
				instruction(EX) <= X"0000";
				instruction(WB) <= X"0000";
			end if;
			
			-- Input From Switches --
			-- Receive MSB first, then LSB, press and release "step" button to save each byte --
			if (rst = '0' and rom_data(15 downto 9) = OP_IN) then
				
				if (input_state /= "100") then
					wait_input <= '1';
					
					
					if input_state = "000" then
						LEDOUT <= X"F0";
						if step = '1' then
							input_state <= "001";
						end if;
						
					elsif input_state = "001" then
						LEDOUT <= X"F0";
						if step = '0' then
							ID_inputdata(15 downto 8) <= switches;
							input_state <= "010";
						end if;
						
					elsif input_state = "010" then
						LEDOUT <= X"0F";
						if step = '1' then
							input_state <= "011";
						end if;
						
					elsif input_state = "011" then
						LEDOUT <= X"0F";
						if step = '0' then
							ID_inputdata(7 downto 0) <= switches;
							input_state <= "100";
						end if;
					end if;
				else
					LEDOUT <= X"00";
					input_state <= "000";
					wait_input <= '0';
				end if;
			
			else
				ID_inputdata <= X"0000";
			end if;
			
			
		end if;
	end process;

	process(clk)
	
		variable PC_return:		integer := 0;
		variable PC:				integer := 0;
		variable NPC:				integer := 0;
	
	begin
		if falling_edge(clk) then
		
		if (rst='0' and wait_input = '0') then	
			
			-- WB --
			if((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
				wr_index <= WB_Ra;
				wr_data <= WB_alu_result;
				wr_reg <= '1';
			elsif (WB_OP = OP_IN) then
				wr_index <= WB_Ra;
				wr_data <= WB_inputdata;
				wr_reg <= '1';
			elsif (WB_OP = OP_BRSUB) then
				wr_index <= "111";
				wr_data <= std_logic_vector(to_unsigned(PC_return, 16));
				wr_reg <= '1';
			elsif (WB_OP = OP_LOAD) then
				wr_index <= WB_Ra;
				wr_data <= ram_data;
				wr_reg <= '1';
			elsif (WB_OP = OP_LOADIMM) then
				wr_index <= "111";
				wr_data <= WB_data;
				wr_reg <= '1';
			elsif (WB_OP = OP_MOV) then
				wr_index <= WB_Ra;
				wr_data <= WB_data;
				wr_reg <= '1';
			else
				wr_index <= "000";
				wr_data <= X"0000";
				wr_reg <= '0';
			end if;

			-- EX --
			
			-- DATA HAZARDS --
			-- Input 1 --
			-- ADD, SUB, MULT, NAND --
			if((EX_OP = OP_ADD) or (EX_OP = OP_SUB) or (EX_OP = OP_MULT) or (EX_OP = OP_NAND)) then
			
				-- WRITE AFTER READ HAZARDS --
				if (WB_Ra = EX_Rb) then
					if (WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR) then
						alu_in1 <= WB_alu_result;
					elsif (WB_OP = OP_IN) then
						alu_in1 <= WB_inputdata;
					elsif (WB_OP = OP_LOAD) then
						alu_in1 <= ram_data;
					elsif (WB_OP = OP_MOV) then
						alu_in1 <= WB_data;
					else
						alu_in1 <= EX_regdata1;
					end if;
				elsif (EX_Rb = "111") and (WB_OP = OP_LOADIMM) then
					alu_in1 <= WB_data;
				else
					alu_in1 <= EX_regdata1;
				end if;
			
			-- SHL, SHR, TEST --	
			elsif((EX_OP = OP_SHL) or (EX_OP = OP_SHR) or (EX_OP = OP_TEST)) then
			
				-- WRITE AFTER READ HAZARDS --
				if (WB_Ra = EX_Ra) then
					if (WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR) then
						alu_in1 <= WB_alu_result;
					elsif (WB_OP = OP_IN) then
						alu_in1 <= WB_inputdata;
					elsif (WB_OP = OP_LOAD) then
						alu_in1 <= ram_data;
					elsif (WB_OP = OP_MOV) then
						alu_in1 <= WB_data;
					else
						alu_in1 <= EX_regdata1;
					end if;
				elsif (EX_Ra = "111") and (WB_OP = OP_LOADIMM) then
					alu_in1 <= WB_data;
				else
					alu_in1 <= EX_regdata1;
				end if;
				
			else
				alu_in1 <= X"0000";
			end if;
			
			-- Input 2 --
			-- ADD, SUB, MULT, NAND --
			if((EX_OP = OP_ADD) or (EX_OP = OP_SUB) or (EX_OP = OP_MULT) or (EX_OP = OP_NAND)) then
				

				-- WRITE AFTER READ HAZARDS --
				if (WB_Ra = EX_Rc) then
					if (WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR) then
						alu_in2 <= WB_alu_result;
					elsif (WB_OP = OP_IN) then
						alu_in2 <= WB_inputdata;
					elsif (WB_OP = OP_LOAD) then
						alu_in2 <= ram_data;
					elsif (WB_OP = OP_MOV) then
						alu_in2 <= WB_data;
					else
						alu_in2 <= EX_regdata2;
					end if;
				elsif (EX_Rc = "111") and (WB_OP = OP_LOADIMM) then
					alu_in2 <= WB_data;
				else
					alu_in2 <= EX_regdata2;
				end if;
				alu_mode <= EX_ALU;
				
			-- SHL, SHR --
			elsif((EX_OP = OP_SHL) or (EX_OP = OP_SHR)) then
			
				alu_in2 <= (15 downto EX_cl'length => '0') & EX_cl;
				alu_mode <= EX_ALU;
				
			-- TEST --
			elsif(EX_OP = OP_TEST) then
			
				alu_mode <= EX_ALU;
			
			-- OTHERS --
			else
				alu_in2 <= X"0000";
				alu_mode <= "0000";
			end if;	
			
			-- OUT --			
			if (EX_OP = OP_OUT) then
			
				-- WRITE AFTER READ HAZARDS --
				if ((WB_Ra = EX_Ra) and (WB_OP = OP_LOAD)) then
					OUTPUT <= ram_data;
				elsif ((EX_Ra = "111") and (WB_OP = OP_LOADIMM)) or ((WB_Ra = EX_Rb) and (WB_OP = OP_MOV)) then
					OUTPUT <= WB_data;
				elsif ((WB_Ra = EX_Ra) and (WB_OP = OP_IN)) then
					OUTPUT <= WB_inputdata;
				elsif (WB_Ra = EX_Ra) and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					OUTPUT <= WB_alu_result;
				else						
					OUTPUT <= EX_regdata1;
				end if;
--			else
--				OUTPUT <= X"0000";
			end if;
			
			-- BRANCHES --	
			-- BR, BRSUB --
			if(EX_OP = OP_BR) then
				-- clear the current ID --
				branch_clear <= '1';
			
				-- WRITE AFTER READ HAZARDS --
				if ((WB_Ra = EX_Ra) and (WB_OP = OP_LOAD)) then
					NPC := to_integer(2 * signed(ram_data)) + to_integer(2 * (signed(EX_disps)));
				elsif ((EX_Ra = "111") and (WB_OP = OP_LOADIMM)) or ((WB_Ra = EX_Ra) and (WB_OP = OP_MOV)) then
					NPC := to_integer(2 * signed(WB_data)) + to_integer(2 * (signed(EX_disps))) - 2;
				elsif ((WB_Ra = EX_Ra) and (WB_OP = OP_IN)) then
					NPC := to_integer(2 * signed(WB_inputdata)) + to_integer(2 * (signed(EX_disps)));
				elsif (WB_Ra = EX_Ra) and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					NPC := to_integer(2 * signed(WB_alu_result)) + to_integer(2 * (signed(EX_disps))) - 2;
				else
					NPC := to_integer(2 * signed(rd_data1)) + to_integer(2 * (signed(EX_disps)));
				end if;		
		
			elsif (EX_OP = OP_BRSUB) or ((EX_OP = OP_BRN) and (n_test = '1')) or ((EX_OP = OP_BRZ) and (z_test = '1')) then
				-- clear the current ID --
				branch_clear <= '1';
			
				-- WRITE AFTER READ HAZARDS --
				if ((WB_Ra = EX_Ra) and (WB_OP = OP_LOAD)) then
					NPC := to_integer(2 * signed(ram_data)) + PC + to_integer(2 * (signed(EX_disps)));
				elsif ((EX_Ra = "111") and (WB_OP = OP_LOADIMM)) or ((WB_Ra = EX_Ra) and (WB_OP = OP_MOV)) then
					NPC := to_integer(2 * signed(WB_data)) + PC + to_integer(2 * (signed(EX_disps))) - 2;
				elsif ((WB_Ra = EX_Ra) and (WB_OP = OP_IN)) then
					NPC := to_integer(2 * signed(WB_inputdata)) + PC + to_integer(2 * (signed(EX_disps)));
				elsif (WB_Ra = EX_Ra) and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					NPC := to_integer(2 * signed(WB_alu_result)) + PC + to_integer(2 * (signed(EX_disps))) - 2;
				else
					NPC := to_integer(2 * signed(rd_data1)) + PC + to_integer(2 * (signed(EX_disps)));
				end if;

			-- BRRN, BRRZ --
			elsif (((EX_OP = OP_BRRN) and (n_flag = '1')) or ((EX_OP = OP_BRRZ) and (z_flag = '1'))) then
				--clear the current ID--
				branch_clear <= '1';
				
				-- Since the PC will be pointing to the instruction after the branch, must subtract 2 to compensate.
				NPC := PC + to_integer(2 * (signed(EX_displ)));
				
			-- RETURN --
			elsif (EX_OP = OP_RET) then
				
				branch_clear <= '1';
				
				-- WRITE AFTER READ HAZARDS --
				if ((WB_Ra = "111") and (WB_OP = OP_LOAD)) then
					NPC := to_integer(2 * signed(ram_data));
				elsif (WB_OP = OP_LOADIMM) or ((WB_Ra = "111") and (WB_OP = OP_MOV)) then
					NPC := to_integer(2 * signed(WB_data));
				elsif ((WB_Ra = "111") and (WB_OP = OP_IN)) then
					NPC := to_integer(2 * signed(WB_inputdata));
				elsif (WB_Ra = "111") and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					NPC := to_integer(2 * signed(WB_alu_result));
				else
					NPC := to_integer(2 * signed(rd_data1));
				end if;
					
			-- BRR --
			elsif (ID_OP = OP_BRR) then
				NPC := PC + to_integer(2 * (signed(ID_displ))) + 2;			
				branch_clear <= '0';
			else
				branch_clear <= '0';
			end if;
			
			-- MEMORY --
			-- STORE --
			if (EX_OP = OP_STORE) then
			
				-- WRITE AFTER READ HAZARDS --
				if ((WB_Ra = EX_Ra) and (WB_OP = OP_LOAD)) then
					ram_address <= ram_data;
				elsif ((EX_Ra = "111") and (WB_OP = OP_LOADIMM)) or ((WB_Ra = EX_Ra) and (WB_OP = OP_MOV)) then
					ram_address <= WB_data;	
				elsif (WB_Ra = EX_Ra) and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					ram_address <= WB_alu_result;
				elsif (WB_Ra = EX_Ra) and (WB_OP = OP_IN) then
					ram_address <= WB_inputdata;
				else
					ram_address <= EX_regdata1;
				end if;
				
				if ((WB_Ra = EX_Rb) and (WB_OP = OP_LOAD)) then
					ram_dout <= ram_data;
				elsif ((EX_Rb = "111") and (WB_OP = OP_LOADIMM)) or ((WB_Ra = EX_Rb) and (WB_OP = OP_MOV)) then
					ram_dout <= WB_data;	
				elsif ((WB_Ra = EX_Rb) and (WB_OP = OP_IN)) then
					ram_dout <= WB_inputdata;
				elsif (WB_Ra = EX_Rb) and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					ram_dout <= WB_alu_result;
				else						
					ram_dout <= EX_regdata2;
				end if;
				
				wr_ram <= '1';
							
			-- LOAD --
			elsif (EX_OP = OP_LOAD) then

				-- WRITE AFTER READ HAZARDS --
				if ((WB_Ra = EX_Rb) and (WB_OP = OP_LOAD)) then
					ram_address <= ram_data;
				elsif ((EX_Rb = "111") and (WB_OP = OP_LOADIMM)) or ((WB_Ra = EX_Rb) and (WB_OP = OP_MOV)) then
					ram_address <= WB_data;
				elsif ((WB_Ra = EX_Rb) and (WB_OP = OP_IN)) then
					ram_address <= WB_inputdata;
				elsif (WB_Ra = EX_Rb) and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					ram_address <= WB_alu_result;
				else						
					ram_address <= EX_regdata2;
				end if;
				
				wr_ram <= '0';
				ram_dout <= X"0000";
			
			else
				ram_dout <= X"0000";
				ram_address <= X"0000";
				wr_ram <= '0';
			end if;
			
			-- LOAD IMM --
			if (EX_OP = OP_LOADIMM) then
				if (EX_ml = '1') then
				
					-- WRITE AFTER READ HAZARDS --
					if ((WB_Ra = "111") and (WB_OP = OP_LOAD)) then
						EX_data <= EX_imm & ram_data(7 downto 0);
					elsif (WB_OP = OP_LOADIMM) or ((WB_Ra = "111") and (WB_OP = OP_MOV)) then
						EX_data <= EX_imm & WB_data(7 downto 0);
					elsif ((WB_Ra = "111") and (WB_OP = OP_IN)) then
						EX_data <= EX_imm & WB_inputdata(7 downto 0);
					elsif (WB_Ra = "111") and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
						EX_data <= EX_imm & WB_alu_result(7 downto 0);
					else						
						EX_data <= EX_imm & EX_regdata1(7 downto 0);
					end if;
					
				else
				
					-- WRITE AFTER READ HAZARDS --
					if ((WB_Ra = "111") and (WB_OP = OP_LOAD)) then
						EX_data <=  ram_data(15 downto 8) & EX_imm;
					elsif (WB_OP = OP_LOADIMM) or ((WB_Ra = "111") and (WB_OP = OP_MOV)) then
						EX_data <= WB_data(15 downto 8) & EX_imm;
					elsif ((WB_Ra = "111") and (WB_OP = OP_IN)) then
						EX_data <= WB_inputdata(15 downto 8) & EX_imm;
					elsif (WB_Ra = "111") and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
						EX_data <= WB_alu_result(15 downto 8) & EX_imm;
					else						
						EX_data <= EX_regdata1(15 downto 8) & EX_imm;
					end if;
				end if;
			
			-- MOV --
			elsif (EX_OP = OP_MOV) then
			
				-- WRITE AFTER READ HAZARDS --
				if ((WB_Ra = EX_Rb) and (WB_OP = OP_LOAD)) then
					EX_data <= ram_data;
				elsif ((EX_Rb = "111") and (WB_OP = OP_LOADIMM)) or ((WB_Ra = EX_Rb) and (WB_OP = OP_MOV)) then
					EX_data <= WB_data;
				elsif ((WB_Ra = EX_Rb) and (WB_OP = OP_IN)) then
					EX_data <= WB_inputdata;
				elsif (WB_Ra = EX_Rb) and ((WB_OP = OP_ADD) or (WB_OP = OP_SUB) or (WB_OP = OP_MULT) or (WB_OP = OP_NAND) or (WB_OP = OP_SHL) or (WB_OP = OP_SHR)) then
					EX_data <= WB_alu_result;
				else						
					EX_data <= EX_regdata2;
				end if;
				
			else
				EX_data <= X"0000";
			end if;
			
			-- ID --
			-- Reg Input 1 --
			-- ADD, SUB, MULT, NAND --
			if((ID_OP = OP_ADD) or (ID_OP = OP_SUB) or (ID_OP = OP_MULT) or (ID_OP = OP_NAND)) then
				rd_index1 <= ID_Rb;
				
			-- SHR, SHL, OUT, TEST, BR, BRN, BRZ, BRSUB, STORE --
			elsif ((ID_OP = OP_SHR) or (ID_OP = OP_SHL) or (ID_OP = OP_OUT) or (ID_OP = OP_TEST) or (ID_OP = OP_BR) or (ID_OP = OP_BRN) or (ID_OP = OP_BRZ) or (ID_OP = OP_STORE) or (ID_OP = OP_BRSUB)) then
				rd_index1 <= ID_Ra;

			-- RETURN, LOADIMM --
			elsif (ID_OP = OP_RET) or (ID_OP = OP_LOADIMM) then
				rd_index1 <= "111";
			else
				rd_index1 <= "000";
			end if;
			
			-- Reg Input 2 --
			-- ADD, SUB, MULT, NAND --
			if((ID_OP = OP_ADD) or (ID_OP = OP_SUB) or (ID_OP = OP_MULT) or (ID_OP = OP_NAND)) then			
				rd_index2 <= ID_Rc;

			-- STORE, LOAD, MOV --
			elsif (ID_OP = OP_STORE) or (ID_OP = OP_LOAD) or (ID_OP = OP_MOV) then
				rd_index2 <= ID_Rb;	
	
			else
				rd_index2 <= "000";
			end if;	
				
			-- BRSUB --
			if (ID_OP = OP_BRSUB) then
				PC_return := PC / 2 + 1;
			end if;
				
			-- IF --
			PC := NPC;
			rom_address <= std_logic_vector(to_unsigned(PC, 16));
			if (PC < 40) then
				NPC := PC + 2;
			else
				NPC := 0;
			end if;					
		elsif (rst = '1') then
			PC := 0;
			NPC := 0;
			rom_address <= X"0000";
			branch_clear <= '0';
			OUTPUT <= X"0000";
		end if;
		end if;	
	end process;
end Behavioral;

