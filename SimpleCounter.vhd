library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SimpleCounter is
	port (
		clk	:		in		std_logic;
		reset	:		in		std_logic;
		address:		in		std_logic;
		read_n:		in		std_logic;
		readdata:	out	std_logic_vector(31 downto 0)
	);
end entity;

architecture BEHAVIORAL of SimpleCounter is
	signal	counter: std_logic_vector(31 downto 0);
	signal	readdata_r:	std_logic_vector(31 downto 0);
begin
	process(reset, clk)
	begin
		if( reset = '1' ) then
			counter <= (others => '0');
		elsif( rising_edge(clk) ) then
			counter <= counter + 1;
			if( read_n = '0' ) then
				readdata_r <= counter;
			end if;
		end if;
	end process;
	
	readdata <= readdata_r;
end architecture;