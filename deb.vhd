library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity deb is
    Port (
        clk        : in  STD_LOGIC;
        input_sig  : in  STD_LOGIC;
        debounced  : out STD_LOGIC
    );
end deb;

architecture Behavioral of deb is
    signal debounce_reg : STD_LOGIC_VECTOR(19 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if input_sig = '0' then
                debounce_reg <= (others => '0');
            else
                debounce_reg <= debounce_reg(18 downto 0) & '1';
            end if;
        end if;
    end process;

    debounced <= '1' when debounce_reg = "11111111111111111111" else '0';
end Behavioral;