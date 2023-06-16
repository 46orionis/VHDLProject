library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    port (
        opcode : in std_logic_vector(4 downto 0);
	m : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
	MEMw: out std_logic;
	SRw: out std_logic;
	DRw: out std_logic;
	ARw: out std_logic;
	IRw: out std_logic;
	Pc_incremente: out std_logic;
	DRsrc: out std_logic;
	RFsrc: out std_logic;
	RFxy: out std_logic
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
    component Mapper is
        port (
            opcode : in std_logic_vector(4 downto 0);
            address : out std_logic_vector(4 downto 0)
        );
    end component;

component and_not_gate is
port(

	signal1 : in std_logic;
        signal2 : in std_logic;
        output : out std_logic

);
end component;

component CSR is
port(
	clk: in std_logic;
	d: in std_logic_vector(15 downto 0);
	jump: out std_logic_vector(4 downto 0);
	muxchoice: out std_logic;
	incremente_choice: out std_logic;
	MEMw: out std_logic;
	SRw: out std_logic;
	DRw: out std_logic;
	ARw: out std_logic;
	IRw: out std_logic;
	Pc_incremente: out std_logic;
	DRsrc: out std_logic;
	RFsrc: out std_logic;
	RFxy: out std_logic
	
--q: out std_logic_vector(15 downto 0)
);
end component;
    component Mux2_1_5 is
	port (
	    In0,In1: in std_logic_vector(4 downto 0);
	    s: in std_logic;
	    Z: out std_logic_vector(4 downto 0)
	);
    end component;
	    

    component RegisterCU is
        port (
            clk : in std_logic;
            reset : in std_logic;
            increment : in std_logic;
            address : in std_logic_vector(4 downto 0);
            next_address : out std_logic_vector(4 downto 0)
        );
    end component;

    component MP_ROM is
        port (
            address : in std_logic_vector(4 downto 0);
            data_out : out std_logic_vector(15 downto 0)
        );
    end component;

    signal mapper_address : std_logic_vector(4 downto 0);
    signal RegisterCU_address : std_logic_vector(4 downto 0);
    signal next_RegisterCU_address : std_logic_vector(4 downto 0);
    signal microinstruction_data : std_logic_vector(15 downto 0);
    signal increment_choice_bus : std_logic;
    signal data_out_rom : std_logic_vector(15 downto 0);
    signal jumpbus: std_logic_vector(4 downto 0);
    signal muxchoice_bus: std_logic;
    signal increment_bus: std_logic;

begin
    -- Composant de mappage d'opcode à une adresse de micro-instruction
    mapper1: Mapper port map (
        opcode => opcode,
        address => mapper_address
    );

	and_not_1 : and_not_gate port map (

		signal1	=> m,
		signal2 =>increment_choice_bus,
		output => increment_bus

);	

	CSR1: CSR port map (
	clk => clk,
	d => data_out_rom,
	jump => jumpbus ,
	muxchoice => muxchoice_bus ,
	incremente_choice => increment_choice_bus ,
	MEMw => MEMw,
	SRw => SRw,
	DRw => DRw,
	ARw => ARw,
	IRw => IRw,
	Pc_incremente => Pc_incremente,
	DRsrc => DRsrc,
	RFsrc => RFsrc,
	RFxy => RFxy 
);

    FirstMux2_1: Mux2_1_5 port map (
	In0 => jumpbus,
	In1 =>  mapper_address,
	s => muxchoice_bus,
	Z => RegisterCU_address
);

    -- Composant de registre d'adresse de micro-instruction
    RegisterCU1: RegisterCU port map (
        clk => clk,
        reset => reset,
        increment =>increment_bus, -- Use the new signal instead of direct port mapping
        address => RegisterCU_address,
        next_address => next_RegisterCU_address
    );

    -- Composant de mémoire de micro-instructions
    mp_rom1: MP_ROM port map (                   --needs improvement error in simulation for binding
        address => next_RegisterCU_address,
        data_out => data_out_rom
    );

    

end Behavioral;
