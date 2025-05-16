----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 07:40:32 PM
-- Design Name: 
-- Module Name: sim_mux_2_4bit - Behavioral
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

entity sim_mux_2_4bit is
--  Port ( );
end sim_mux_2_4bit;

architecture Behavioral of sim_mux_2_4bit is
    component Mux_2_4bit
        Port ( A1 : in STD_LOGIC_VECTOR (3 downto 0);
               A2 : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0) );
    end component;
    
    signal A1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal A2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Sel : STD_LOGIC := '0';
    signal Q : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT: Mux_2_4bit 
        port map (
            A1 => A1,
            A2 => A2,
            Sel => Sel,
            Q => Q
    );
        --230631 ---> 0011 1000 0100 1110 0111
    process
        begin
            -- Test Case 1: Sel = 0 => Output should be A1
            A1 <= "0111";
            A2 <= "1110";
            Sel <= '0';
            wait for 100 ns;
            
            -- Test Case 2: Sel = 1 => Output should be A2
            Sel <= '1';
            wait for 100 ns;
    
            -- Test Case 3: Change both inputs
            A1 <= "0100";
            A2 <= "1000";
            Sel <= '0';
            wait for 100 ns;
    
            Sel <= '1';
            wait for 100 ns;

            wait;
    end process;
end Behavioral;
