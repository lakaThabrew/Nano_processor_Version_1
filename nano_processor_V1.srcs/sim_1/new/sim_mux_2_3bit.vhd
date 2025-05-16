----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 07:40:32 PM
-- Design Name: 
-- Module Name: sim_mux_2_3bit - Behavioral
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

entity sim_mux_2_3bit is
--  Port ( );
end sim_mux_2_3bit;

architecture Behavioral of sim_mux_2_3bit is
    component Mux_2_3bit
        Port ( A1 : in STD_LOGIC_VECTOR (2 downto 0);
               A2 : in STD_LOGIC_VECTOR (2 downto 0);
               Sel : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
     signal A1 : STD_LOGIC_VECTOR (2 downto 0) := "000";
     signal A2 : STD_LOGIC_VECTOR (2 downto 0) := "000";
     signal Sel : STD_LOGIC := '0';
     signal Q : STD_LOGIC_VECTOR (2 downto 0);
     
begin
    UUT: Mux_2_3bit 
        port map (
            A1 => A1,
            A2 => A2,
            Sel => Sel,
            Q => Q
    );
    --230631 ---> 00 111 000 010 011 100 111
    process
        begin
            -- Test 1: Select A1 (Sel = 0)
            A1 <= "111";
            A2 <= "100";
            Sel <= '0';
            wait for 100 ns;
    
            -- Test 2: Select A2 (Sel = 1)
            Sel <= '1';
            wait for 100 ns;
    
            -- Test 3: Change inputs and select A1
            A1 <= "011";
            A2 <= "010";
            Sel <= '0';
            wait for 100 ns;
    
            -- Test 4: Select A2
            Sel <= '1';
            wait for 100 ns;

            wait;
    end process;

end Behavioral;
