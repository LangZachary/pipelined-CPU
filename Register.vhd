
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Reg is
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
end Reg;

architecture behavioural of Reg is

	type reg_array is array (integer range 0 to 7) of std_logic_vector(15 downto 0);
	--internals signals
	signal reg_file: 	reg_array; 
	signal data: std_logic_vector(15 downto 0);
	
	begin
	--write operation 
	
	data <= wr_data;
	
					-- Read from Registers --
	rd_data1<= 	reg_file(0) when (((rd_index1 = "000") and (wr_enable = '0')) or ((rd_index1 = "000") and (wr_enable = '1') and (wr_index /= "000"))) else
					wr_data 		when ((rd_index1 = "000") 	and (wr_index = "000") and (wr_enable = '1')) else
					reg_file(1) when (((rd_index1 = "001") and (wr_enable = '0')) or ((rd_index1 = "001") and (wr_enable = '1') and (wr_index /= "001"))) else
					wr_data 		when ((rd_index1 = "001") 	and (wr_index = "001") 	and (wr_enable = '1')) else
					reg_file(2) when (((rd_index1 = "010") and (wr_enable = '0')) or ((rd_index1 = "010") and (wr_enable = '1') and (wr_index /= "010"))) else
					wr_data 		when ((rd_index1 = "010") 	and (wr_index = "010") 	and (wr_enable = '1')) else
					reg_file(3) when (((rd_index1 = "011") and (wr_enable = '0')) or ((rd_index1 = "011") and (wr_enable = '1') and (wr_index /= "011"))) else
					wr_data 		when ((rd_index1 = "011") 	and (wr_index = "011") 	and (wr_enable = '1')) else
					reg_file(4) when (((rd_index1 = "100") and (wr_enable = '0')) or ((rd_index1 = "100") and (wr_enable = '1') and (wr_index /= "100"))) else
					wr_data 		when ((rd_index1 = "100") 	and (wr_index = "100") 	and (wr_enable = '1')) else
					reg_file(5) when (((rd_index1 = "101") and (wr_enable = '0')) or ((rd_index1 = "101") and (wr_enable = '1') and (wr_index /= "101"))) else
					wr_data 		when ((rd_index1 = "101") 	and (wr_index = "101") 	and (wr_enable = '1')) else
					reg_file(6) when (((rd_index1 = "110") and (wr_enable = '0')) or ((rd_index1 = "110") and (wr_enable = '1') and (wr_index /= "110"))) else
					wr_data 		when ((rd_index1 = "110") 	and (wr_index = "110") 	and (wr_enable = '1')) else
					reg_file(7) when (((rd_index1 = "111") and (wr_enable = '0')) or ((rd_index1 = "111") and (wr_enable = '1') and (wr_index /= "111"))) else
					wr_data 		when ((rd_index1 = "111") 	and (wr_index = "111") 	and (wr_enable = '1')) else X"0000";
	
	rd_data2<= 	reg_file(0) when (((rd_index2 = "000") and (wr_enable = '0')) or ((rd_index2 = "000") and (wr_enable = '1') and (wr_index /= "000"))) else
					wr_data 		when ((rd_index2 = "000") 	and (wr_index = "000") and (wr_enable = '1')) else
					reg_file(1) when (((rd_index2 = "001") and (wr_enable = '0')) or ((rd_index2 = "001") and (wr_enable = '1') and (wr_index /= "001"))) else
					wr_data 		when ((rd_index2 = "001") 	and (wr_index = "001") 	and (wr_enable = '1')) else
					reg_file(2) when (((rd_index2 = "010") and (wr_enable = '0')) or ((rd_index2 = "010") and (wr_enable = '1') and (wr_index /= "010"))) else
					wr_data 		when ((rd_index2 = "010") 	and (wr_index = "010") 	and (wr_enable = '1')) else
					reg_file(3) when (((rd_index2 = "011") and (wr_enable = '0')) or ((rd_index2 = "011") and (wr_enable = '1') and (wr_index /= "011"))) else
					wr_data 		when ((rd_index2 = "011") 	and (wr_index = "011") 	and (wr_enable = '1')) else
					reg_file(4) when (((rd_index2 = "100") and (wr_enable = '0')) or ((rd_index2 = "100") and (wr_enable = '1') and (wr_index /= "100"))) else
					wr_data 		when ((rd_index2 = "100") 	and (wr_index = "100") 	and (wr_enable = '1')) else
					reg_file(5) when (((rd_index2 = "101") and (wr_enable = '0')) or ((rd_index2 = "101") and (wr_enable = '1') and (wr_index /= "101"))) else
					wr_data 		when ((rd_index2 = "101") 	and (wr_index = "101") 	and (wr_enable = '1')) else
					reg_file(6) when (((rd_index2 = "110") and (wr_enable = '0')) or ((rd_index2 = "110") and (wr_enable = '1') and (wr_index /= "110"))) else
					wr_data 		when ((rd_index2 = "110") 	and (wr_index = "110") 	and (wr_enable = '1')) else
					reg_file(7) when (((rd_index2 = "111") and (wr_enable = '0')) or ((rd_index2 = "111") and (wr_enable = '1') and (wr_index /= "111"))) else
					wr_data 		when ((rd_index2 = "111") 	and (wr_index = "111") 	and (wr_enable = '1')) else X"0000";
					
	process(clk)
		begin
		if rising_edge(clk) then 
		
			-- Reset Registers --
			if(rst='1') then
				for i in 0 to 7 loop
					reg_file(i)<= (others => '0'); 
				end loop;
				
			-- Write to Register --
			elsif(wr_enable='1') then
				case wr_index(2 downto 0) is
					when "000" => reg_file(0) <= wr_data;
					when "001" => reg_file(1) <= wr_data;
					when "010" => reg_file(2) <= wr_data;
					when "011" => reg_file(3) <= wr_data;
					when "100" => reg_file(4) <= wr_data;
					when "101" => reg_file(5) <= wr_data;
					when "110" => reg_file(6) <= wr_data;
					when "111" => reg_file(7) <= wr_data;
					when others => NULL; 
				end case;
			end if;
			
		end if;
		
	end process;



end behavioural;