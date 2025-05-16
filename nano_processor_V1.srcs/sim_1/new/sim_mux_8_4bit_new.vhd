----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 07:40:32 PM
-- Design Name: 
-- Module Name: sim_mux_8_4bit_new - Behavioral
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

entity sim_mux_8_4bit_new is
--  Port ( );
end sim_mux_8_4bit_new;

architecture Behavioral of sim_mux_8_4bit_new is

    component Mux_8_4bit_new
        Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
               A1 : in STD_LOGIC_VECTOR (3 downto 0);
               A2 : in STD_LOGIC_VECTOR (3 downto 0);
               A3 : in STD_LOGIC_VECTOR (3 downto 0);
               A4 : in STD_LOGIC_VECTOR (3 downto 0);
               A5 : in STD_LOGIC_VECTOR (3 downto 0);
               A6 : in STD_LOGIC_VECTOR (3 downto 0);
               A7 : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC_VECTOR (2 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal A0, A1, A2, A3, A4, A5, A6, A7 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Sel : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal Y : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    UUT: Mux_8_4bit_new
        port map (
            A0 => A0, 
            A1 => A1, 
            A2 => A2, 
            A3 => A3,
            A4 => A4, 
            A5 => A5, 
            A6 => A6, 
            A7 => A7,
            Sel => Sel,
            Y => Y
        );
--230631 ---> 0011 1000 0100 1110 0111
    process
        begin
            A0 <= "0011";
            A1 <= "1000";
            A2 <= "0100";
            A3 <= "1110";
            A4 <= "0111";
            A5 <= "0000";
            A6 <= "1111";
            A7 <= "0001";
            
            Sel <= "000";
            wait for 100ns;
            
            Sel <= "010";
            wait for 100ns;
            
            Sel <= "100";
            wait for 100ns;
                        
            Sel <= "110";
            wait for 100ns;
            
            Sel <= "101";
            wait for 100ns;
                        
            Sel <= "111";
            wait for 100ns;
            wait;
    end process;
end Behavioral;
