library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
    Port (
        clk: in std_logic;
        reset: in std_logic;
        data_in_cpu: in std_logic_vector(15 downto 0);
	instruction_in: in std_logic_vector(15 downto 0);
	adrPc:out std_logic_vector(5 downto 0);
	adrData:out std_logic_vector(5 downto 0);
        data_out_cpu: out std_logic_vector(15 downto 0);        
	MEMw: out std_logic
    );
end CPU;

architecture Behavioral of CPU is
    -- Component declarations
    component datapath is
        Port (
            SRw: in std_logic;
            DRw: in std_logic;
            ARw: in std_logic;
            IRw: in std_logic;
            Pc_incremente: in std_logic;
            DRsrc: in std_logic;
            RFsrc: in std_logic;
            RFxy: in std_logic;
            data_in: in std_logic_vector(15 downto 0);
            clk: in std_logic;
            reset: in std_logic;
            M: out std_logic;
            OpCode: out std_logic_vector(4 downto 0);
            out_AR: out std_logic_vector(5 downto 0);
            out_PC: out std_logic_vector(5 downto 0);
            data_out: out std_logic_vector(15 downto 0)


        );
    end component;

    component Control_Unit is
        Port (

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
    end component;

    
    -- Signals
    signal datapath_data_out: std_logic_vector(15 downto 0);
    signal datapath_instruction_out: std_logic_vector(15 downto 0);
    signal bus_out_PC,bus_out_AR: std_logic_vector(5 downto 0); -- Add bus_out_PC signal

	signal bus_OpCode: std_logic_vector(4 downto 0);	
	signal bus_SRw,bus_DRw,bus_ARw,bus_IRw,bus_PC_incremente,bus_DRsrc,bus_RFsrc,bus_RFxy,bus_M,bus_MEMw: std_logic;

begin

    -- Instantiate the datapath
    datapath_inst: datapath
        port map (
            SRw => bus_SRw,
            DRw => bus_DRw,
            ARw => bus_ARw,
            IRw => bus_IRw,
            Pc_incremente => bus_Pc_incremente,
            DRsrc => bus_DRsrc,
            RFsrc => bus_RFsrc,
            RFxy => bus_RFxy,
            data_in => data_in_cpu,
            clk => clk,
            reset => reset,
            M => bus_M,
            OpCode => bus_OpCode,
            out_AR => bus_out_AR,
            out_PC => bus_out_PC, -- Connect bus_out_PC signal
            data_out => datapath_data_out
        );

    -- Instantiate the control unit
    control_unit_inst: Control_Unit
        port map (
            opcode => bus_OpCode,
            m => bus_M,
            MEMw => bus_MEMw,
            clk => clk,
            reset => reset,
            SRw => bus_SRw,
            DRw => bus_DRw,
            ARw => bus_ARw,
            IRw => bus_IRw,
            Pc_incremente => bus_Pc_incremente,
            DRsrc => bus_DRsrc,
            RFsrc => bus_RFsrc,
            RFxy => bus_RFxy
        );

	
	adrData <= bus_out_AR;
	adrPc <=  bus_out_PC;
	MEMw <= bus_MEMw ;
	data_out_cpu <= datapath_data_out;


end Behavioral;

