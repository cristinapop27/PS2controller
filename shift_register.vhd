----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2024 06:25:34 PM
-- Design Name: 
-- Module Name: register - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_register is
    Port ( data_in : in STD_LOGIC_VECTOR (6 downto 0);
           data_out : out STD_LOGIC_VECTOR (27 downto 0); 
           enable : in STD_LOGIC;
           clk : in STD_LOGIC);
end shift_register;

architecture Behavioral of shift_register is

signal aux: STD_LOGIC_VECTOR(27 downto 0) := (others => '1');
signal anode_count : STD_LOGIC_VECTOR(1 downto 0):="00";

begin
process(clk, aux)
begin

if rising_edge(clk) then 
    if anode_count = "00" then
        if enable = '1' then
            aux(27 downto 21) <= data_in;
        else anode_count<="01";
        end if;
    elsif anode_count = "01" then
        if enable = '1' then
            aux(20 downto 14) <= data_in;
        else anode_count<="10";
        end if;
    
    elsif anode_count = "10" then
        if enable = '1' then
            aux(13 downto 7) <= data_in;
        else anode_count <= "11";
        end if;
    elsif anode_count = "11" then
        if enable = '1' then
            aux(6 downto 0) <=data_in;
        else anode_count<="00";
        end if;
   end if;
end if;

data_out<=aux;
end process;
end Behavioral;