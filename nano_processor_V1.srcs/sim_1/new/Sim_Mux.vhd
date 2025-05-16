----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 03:24:58 PM
-- Design Name: 
-- Module Name: Sim_Mux - Behavioral
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

entity Sim_Mux is
--  Port ( );
end Sim_Mux;

architecture Behavioral of Sim_Mux is
    component Mux_8_4bit
        port (
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
    end component;
    
    signal A0, A1, A2, A3, A4, A5, A6, A7 : STD_LOGIC_VECTOR(3 downto 0);
    signal sel : STD_LOGIC_VECTOR(2 downto 0);
    signal Y   : STD_LOGIC_VECTOR(3 downto 0);
 
begin
    UUT: Mux_8_4bit port map(
             A0 => A0, 
             A1 => A1, 
             A2 => A2, 
             A3 => A3,
             A4 => A4, 
             A5 => A5, 
             A6 => A6, 
             A7 => A7,
             sel => sel,
             Y => Y );
     
     process begin
        A0 <= "0000"; 
        A1 <= "0001"; 
        A2 <= "0010"; 
        A3 <= "1010";
        A4 <= "1011"; 
        A5 <= "1100"; 
        A6 <= "1101"; 
        A7 <= "1111";
        
        sel <= "000";
        wait for 100 ns;
        
        sel <= "101";
        wait for 100ns;
        
        sel <= "110";
        wait for 100ns;
        
        sel <= "111";
        wait for 100ns;
    end process;            

end Behavioral;
