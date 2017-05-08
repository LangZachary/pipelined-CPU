
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity RAM is
    Port ( 	clk: 				in std_logic;
				rst:				in std_logic;
				wr_enable:		in std_logic;
				mem_address: 	in std_logic_vector (15 downto 0);
				din: 				in std_logic_vector (15 downto 0);
				dout:				out std_logic_vector (15 downto 0));
end RAM;

architecture Behavioral of RAM is

   type mem_array is array (15 downto 0) of std_logic_vector (7 downto 0);
	signal mem: mem_array;

	 
begin

	dout <= mem(2 * to_integer(unsigned(mem_address))) & mem(2 * to_integer(unsigned(mem_address))+ 1)	when (wr_enable = '0') else
				X"0000";		
	
	process(clk)
		begin
			if rising_edge(clk) then 
				-- Reset Registers --
				if(rst='1') then
					for i in 0 to 15 loop
						mem(i)<= (others => '0'); 
					end loop;
					
				-- Write to Register	--
				elsif(wr_enable='1') then
					mem(2 * to_integer(unsigned(mem_address)) + 1) 	<= din(7 downto 0);
					mem(2 * to_integer(unsigned(mem_address))) 		<= din(15 downto 8);
				end if;
				
			end if;
	end process;

end Behavioral;

