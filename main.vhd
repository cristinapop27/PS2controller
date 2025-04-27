library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port (
        CLK100MHZ : in STD_LOGIC;
        PS2_CLK   : in STD_LOGIC;
        PS2_DATA  : in STD_LOGIC;
        ANOD      : out STD_LOGIC_VECTOR (3 downto 0);
        CATOD     : out STD_LOGIC_VECTOR (6 downto 0)
    );
end main;

architecture Behavioral of main is
    component ps2receiv is
        Port (
            clk      : in  STD_LOGIC;
            ps2_clk  : in  STD_LOGIC;
            ps2_data : in  STD_LOGIC;
            key_code : out STD_LOGIC_VECTOR (7 downto 0);
            new_key  : out STD_LOGIC
        );
    end component;

    component sevenseg is
        Port (
            clk   : in  STD_LOGIC;
            Decoded_char    : in STD_LOGIC_VECTOR (27 downto 0);
            anod  : out STD_LOGIC_VECTOR (3 downto 0);
            catod : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    component decod is
        Port (
            key_code : in  STD_LOGIC_VECTOR (7 downto 0);
            char     : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    component deb is
        Port (
            clk        : in  STD_LOGIC;
            input_sig  : in  STD_LOGIC;
            debounced  : out STD_LOGIC
        );
    end component;

    component shift_register is
    Port ( data_in : in STD_LOGIC_VECTOR (6 downto 0);
           data_out : out STD_LOGIC_VECTOR (27 downto 0);
           --aux : in STD_LOGIC_VECTOR (27 downto 0); 
           enable : in STD_LOGIC;
           clk : in STD_LOGIC);
    end component;


    signal ps2_key : STD_LOGIC_VECTOR (7 downto 0);
    signal decoded_char : STD_LOGIC_VECTOR (6 downto 0);
    signal PS2_CLK_DEB, PS2_DATA_DEB : STD_LOGIC;
    signal iesire_registru : STD_LOGIC_VECTOR (27 downto 0);
    --signal data_mem : STD_LOGIC_VECTOR (27 downto 0) :=(others => '1');
    signal signal_new_key : STD_LOGIC;
    
begin
    Debouncer_PS2_CLK : deb
        port map (
            clk       => CLK100MHZ,
            input_sig => PS2_CLK,
            debounced => PS2_CLK_DEB
        );

    Debouncer_PS2_DATA : deb
        port map (
            clk       => CLK100MHZ,
            input_sig => PS2_DATA,
            debounced => PS2_DATA_DEB
        );

    PS2Receiver_inst : ps2receiv
        port map (
            clk      => CLK100MHZ,
            ps2_clk  => PS2_CLK_DEB,
            ps2_data => PS2_DATA_DEB,
            key_code => ps2_key,
            new_key => signal_new_key
        );

    Decoder_inst : decod
        port map (
            key_code => ps2_key,
            char     => decoded_char
        );

    Shift_register_inst: shift_register
        port map (
        data_in => decoded_char,
        data_out=> iesire_registru,
        enable => signal_new_key,
        clk => CLK100MHZ
        );
    SSD_inst : sevenseg
        port map (
            clk  => CLK100MHZ,
            Decoded_char => iesire_registru,
            anod => ANOD,
            catod => CATOD
        );
end Behavioral;
