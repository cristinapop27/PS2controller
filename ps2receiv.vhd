library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ps2receiv is
    Port (
        clk      : in  STD_LOGIC;
        ps2_clk  : in  STD_LOGIC;
        ps2_data : in  STD_LOGIC;
        key_code : out STD_LOGIC_VECTOR (7 downto 0);
        new_key  : out STD_LOGIC
    );
end ps2receiv;

architecture Behavioral of ps2receiv is
    signal buffered : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
    signal count : integer range 0 to 10 := 0;
    signal new_key1: STD_LOGIC := '0';
    --signal count_inputs : STD_LOGIC_VECTOR(1 downto 0) := "11";
begin
    process (ps2_clk)
    begin
        if falling_edge(ps2_clk) then
            buffered <= ps2_data & buffered(10 downto 1);
            if count = 10 then
  
                key_code <= buffered(9 downto 2);
                count <= 0;
                new_key1 <= '1';
               
            else
                count <= count + 1;
                new_key1 <= '0';
            end if;
        end if;
    end process;
    new_key <= new_key1;
end Behavioral;