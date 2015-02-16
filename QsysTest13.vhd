library ieee;
use ieee.std_logic_1164.all;

entity QsysTest13 is
	port (
		CLOCK_50		: in	std_logic;
		KEY			: in	std_logic_vector(1 downto 0);
		DRAM_ADDR	: out		std_logic_vector(12 downto 0);
		DRAM_CLK		: out		std_logic;
		DRAM_BA		: out		std_logic_vector(1 downto 0);
		DRAM_CAS_N	: out		std_logic;
		DRAM_CKE		: out		std_logic;
		DRAM_CS_N	: out		std_logic;
		DRAM_DQ		: inout	std_logic_vector(15 downto 0);
		DRAM_DQM		: out		std_logic_vector(1 downto 0);
		DRAM_RAS_N	: out		std_logic;
		DRAM_WE_N	: out		std_logic;
		LED	: out	std_logic_vector(7 downto 0)
	);
end entity;
architecture STRUCTURE of QsysTest13 is
    		  
    component QsysTest is
        port (
            clk_clk                           : in    std_logic                     := 'X';             -- clk
            reset_reset_n                     : in    std_logic                     := 'X';             -- reset_n
            pio_0_external_connection_export  : out   std_logic_vector(7 downto 0);                     -- export
            altpll_0_c1_clk                   : out   std_logic;                                        -- clk
            altpll_0_areset_conduit_export    : in    std_logic                     := 'X';             -- export
            altpll_0_locked_conduit_export    : out   std_logic;                                        -- export
            altpll_0_phasedone_conduit_export : out   std_logic;                                        -- export
            sdram_0_wire_addr                 : out   std_logic_vector(12 downto 0);                    -- addr
            sdram_0_wire_ba                   : out   std_logic_vector(1 downto 0);                     -- ba
            sdram_0_wire_cas_n                : out   std_logic;                                        -- cas_n
            sdram_0_wire_cke                  : out   std_logic;                                        -- cke
            sdram_0_wire_cs_n                 : out   std_logic;                                        -- cs_n
            sdram_0_wire_dq                   : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
            sdram_0_wire_dqm                  : out   std_logic_vector(1 downto 0);                     -- dqm
            sdram_0_wire_ras_n                : out   std_logic;                                        -- ras_n
            sdram_0_wire_we_n                 : out   std_logic                                         -- we_n
        );
    end component QsysTest;
begin
    u0 : component QsysTest
        port map (
            clk_clk                           => CLOCK_50,  --                        clk.clk
            reset_reset_n                     => KEY(0),    --                      reset.reset_n
            pio_0_external_connection_export  => LED,  		--  pio_0_external_connection.export
            altpll_0_c1_clk                   => DRAM_CLK,	--                altpll_0_c1.clk
            altpll_0_areset_conduit_export    => '0',    	--    altpll_0_areset_conduit.export
            altpll_0_locked_conduit_export    => open,    	--    altpll_0_locked_conduit.export
            altpll_0_phasedone_conduit_export => open, 		-- altpll_0_phasedone_conduit.export
            sdram_0_wire_addr                 => DRAM_ADDR, --               sdram_0_wire.addr
            sdram_0_wire_ba                   => DRAM_BA,   --                           .ba
            sdram_0_wire_cas_n                => DRAM_CAS_N,--                           .cas_n
            sdram_0_wire_cke                  => DRAM_CKE,  --                           .cke
            sdram_0_wire_cs_n                 => DRAM_CS_N, --                           .cs_n
            sdram_0_wire_dq                   => DRAM_DQ,   --                           .dq
            sdram_0_wire_dqm                  => DRAM_DQM,  --                           .dqm
            sdram_0_wire_ras_n                => DRAM_RAS_N,--                           .ras_n
            sdram_0_wire_we_n                 => DRAM_WE_N  --                           .we_n
        );

end architecture;
