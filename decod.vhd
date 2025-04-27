library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decod is
    Port (
        key_code : in  STD_LOGIC_VECTOR (7 downto 0);
        char     : out STD_LOGIC_VECTOR (6 downto 0)
    );
end decod;

architecture Behavioral of decod is
begin

    process (key_code)
    begin
    
        case key_code is
            
            when "00011100" => char <= "0001000"; -- A
            when "00110010" => char <= "1100000"; -- B
            when "00100001" => char <= "0110001"; -- C
            when "00100011" => char <= "1000010"; -- D
            when "00100100" => char <= "0110000"; -- E
            when "00101011" => char <= "0111000"; -- F
            when "00110100" => char <= "0100001"; -- G
            when "00110011" => char <= "1001000"; -- H
            when "01000011" => char <= "1111001"; -- I
            when "00111011" => char <= "1000011"; -- J
            when "01000010" => char <= "0101000"; --K
            when "01001011" => char <= "1110001"; --L
            when "00111010" => char <= "0101010"; --M
            when "00110001" => char <= "1101010"; --N
            when "01000100" => char <= "1100010"; --O
            when "01001101" => char <= "0011000"; --p
            when "00101101" => char <= "1111010"; --r
            when "00010101" => char <= "0001100"; --q
            when "00011011" => char <= "0100101"; --s
            when "00101100" => char <= "1110000"; --t
            when "00111100" => char <= "1000001"; --u
            when "00101010" => char <= "1010101"; --v
            when "00011101" => char <= "1010100"; --w
            when "00100010" => char <= "1101011"; --x
            when "00110101" => char <= "1000100"; --y
            when "00010110" => char <= "1001111"; --1
            when "00011110" => char <= "0010010";--2
            when "00100110" => char <= "0000110";--3
            when "00100101" => char <= "1001100";--4
            when "00101110" => char <= "0100100";--5
            when "00110110" => char <= "0100000";--6
            when "00111101" => char <= "0001111";--7
            when "00111110" => char <= "0000000";--8
            when "01000110" => char <= "0000100";--9
            when "01000101" => char <= "0000001";--0
            when others     => char <= "1111111"; -- Blank
        end case;
    end process;
end Behavioral;