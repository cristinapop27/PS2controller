library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity sevenseg is
    Port (
        clk   : in  STD_LOGIC;
        Decoded_char    : in STD_LOGIC_VECTOR (27 downto 0);
        anod  : out STD_LOGIC_VECTOR (3 downto 0);
        catod : out STD_LOGIC_VECTOR (6 downto 0)
        --new_character : in STD_LOGIC
    );
end sevenseg;

architecture Behavioral of sevenseg is
    --signal count : integer range 0 to 3 := 0;
    --signal anod_reg : STD_LOGIC_VECTOR(3 downto 0) := "1110";
    --signal catod_reg : STD_LOGIC_VECTOR(6 downto 0) := "0100000";
    --signal prev_anode_data : STD_LOGIC_VECTOR (27 downto 0) := (others => '0');
    
     signal refresh_count: STD_LOGIC_VECTOR(15 downto 0);

    --signal aux : STD_LOGIC_VECTOR (27 downto 0) := (others => '0');
begin
    
    process (clk)
    begin
        if rising_edge(clk) then
      
            refresh_count <= (refresh_count + 1);
        end if;
     
    end process;

    process(refresh_count, Decoded_char)
    begin
    
    case refresh_count(15 downto 14) is
        when "00" => anod <="1110"; catod <= Decoded_char(27 downto 21);
        when "01" => anod <="1101"; catod <= Decoded_char(20 downto 14);
        when "10" => anod <="1011"; catod <= Decoded_char(13 downto 7);
        when others => anod <="0111"; catod <= Decoded_char(6 downto 0);
        end case;

      end process;
   
end Behavioral;