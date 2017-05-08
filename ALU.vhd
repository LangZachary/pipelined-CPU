
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
--use IEEE.STD_LOGIC_ARITH.all;

entity ALU is
	Port	(	rst: 				in std_logic; 
				in1: 				in std_logic_vector(15 downto 0); 
				in2: 				in std_logic_vector(15 downto 0); 
				alu_mode:	 	in std_logic_vector(3 downto 0); 
				result: 			out std_logic_vector(15 downto 0);
				z_flag: 			out std_logic; 
				n_flag: 			out std_logic
			);
end ALU;

architecture behavioural of ALU is

	signal data: std_logic_vector(15 downto 0);
	signal data_mult: std_logic_vector(31 downto 0);
	
	begin

		data_mult<=std_logic_vector(unsigned(in1) * unsigned(in2)) 					when (alu_mode = "0011") else
					X"00000000";

		data<= 	X"0000" 																			when (rst='1') else 
					in1 																				when (alu_mode = "0000") else 
					std_logic_vector(unsigned(in1) + unsigned(in2)) 					when (alu_mode = "0001") else
					std_logic_vector(unsigned(in1) - unsigned(in2)) 					when (alu_mode = "0010") else
					data_mult(15 downto 0)														when (alu_mode = "0011") else
					in1 nand in2 																	when (alu_mode = "0100") else
					std_logic_vector(unsigned(in1) sll to_integer(unsigned(in2))) 	when (alu_mode = "0101") else
					std_logic_vector(unsigned(in1) srl to_integer(unsigned(in2))) 	when (alu_mode = "0110") else
					in1																				when (alu_mode = "0111") else
					X"0000";
					
		z_flag<= '1' when (data = X"0000" and alu_mode = "0111") else
					'0';
					
		n_flag<= '1' when (to_integer(signed(data)) < 0 and alu_mode = "0111") else
					'0';
		
		result<= data;

--process(clk)
--variable data: integer := 0;
--variable data_mult: integer := 0;
--
--begin
--
--
--
--	if(clk='0' and clk'event) then
--	
--		if(rst='1') then
--			data := 0;
--		else
--			case alu_mode(3 downto 0) is
--				when "0000" => data := to_integer(unsigned(in1)); 
--				when "0001" => data := to_integer(unsigned(in1))+to_integer(unsigned(in2));
--				when "0010" => data := to_integer(unsigned(in1))-to_integer(unsigned(in2));
--				when "0011" => data := (to_integer(unsigned(in1))*to_integer(unsigned(in2))) mod 65536;
--				when "0100" => data := to_integer(unsigned(in1 nand in2));
--				when "0101" => data := to_integer(unsigned(in1) sll to_integer(unsigned(in2)));
--				when "0110" => data := to_integer(unsigned(in1) srl to_integer(unsigned(in2)));
--				when others => NULL;
--			end case;
--		end if;		
--		
--		result <= std_logic_vector(to_unsigned(data, 16));
--		
--		if (data = 0) then
--			z_flag <= '1';
--		else
--			z_flag <= '0';
--		end if;
--		if (data < 0) then
--			n_flag <= '1';
--		else
--			n_flag <= '0';
--		end if;
--   end if;
--	
--
--	
--end process;

--read operation

end behavioural;