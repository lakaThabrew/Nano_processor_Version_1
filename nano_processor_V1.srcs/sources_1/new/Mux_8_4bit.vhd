----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 03:12:31 PM
-- Design Name: 
-- Module Name: Mux_8_4bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_8_4bit is
  Port (
            A0 : in STD_LOGIC_VECTOR (3 downto 0);
            A1 : in STD_LOGIC_VECTOR (3 downto 0);
            A2 : in STD_LOGIC_VECTOR (3 downto 0);
            A3 : in STD_LOGIC_VECTOR (3 downto 0);
            A4 : in STD_LOGIC_VECTOR (3 downto 0);
            A5 : in STD_LOGIC_VECTOR (3 downto 0);
            A6 : in STD_LOGIC_VECTOR (3 downto 0);
            A7 : in STD_LOGIC_VECTOR (3 downto 0);
            Sel : in STD_LOGIC_VECTOR (2 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_4bit;


architecture Behavioral of Mux_8_4bit is

begin
    process(sel, A0, A1, A2, A3, A4, A5, A6, A7)
    begin
        case sel is
            when "000" => Y <= A0;
            when "001" => Y <= A1;
            when "010" => Y <= A2;
            when "011" => Y <= A3;
            when "100" => Y <= A4;
            when "101" => Y <= A5;
            when "110" => Y <= A6;
            when "111" => Y <= A7;
            when others => Y <= (others => '0');
        end case;
    end process;
end Behavioral;
