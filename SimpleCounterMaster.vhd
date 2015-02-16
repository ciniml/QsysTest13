library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity SimpleCounterMaster is
	generic(
		target_address	:	integer := 0
	);
	port(
		-- Generic signals
		clock		: in		std_logic;
		reset		: in		std_logic;
		-- Avalon-MM Master signals
		address		: out		std_logic_vector(31 downto 0);
		read_n		: out		std_logic;
		readdata		: in		std_logic_vector(31 downto 0);
		write_n		: out		std_logic;
		writedata	: out		std_logic_vector(31 downto 0);
		waitrequest	: in		std_logic
	);
end entity;

architecture Behavioral of SimpleCounterMaster is
	signal counter	: std_logic_vector(39 downto 0);
	signal state	: std_logic_vector(7 downto 0);
begin
	process(clock, reset)
	begin
		if( reset = '1' ) then
			counter <= (others => '0');
			read_n <= '1';
			write_n <= '1';
			state <= X"00";
		elsif( rising_edge(clock) ) then
			counter <= counter + 1;
			case( state )is
				when X"00" => 
					address <= conv_std_logic_vector(target_address, 32);
					writedata <= counter(39 downto 8);
					write_n <= '0';
					state <= X"01";
				when X"01" =>
					if( waitrequest = '0' ) then
						state <= X"02";
						write_n <= '1';
					end if;
				when others =>
					state <= state + 1;
			end case;
		end if;
	end process;
end architecture;
