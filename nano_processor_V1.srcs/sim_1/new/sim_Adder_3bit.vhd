----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 11:49:57 AM
-- Design Name: 
-- Module Name: sim_Adder_3bit - Behavioral
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

entity sim_Adder_3bit is
--  Port ( );
end sim_Adder_3bit;

architecture Behavioral of sim_Adder_3bit is

    component Adder_3bit
        Port ( input : in STD_LOGIC_VECTOR (2 downto 0);
               output : out STD_LOGIC_VECTOR (2 downto 0);
               C_out : out STD_LOGIC);
    end component;
    
    signal input     : STD_LOGIC_VECTOR (2 downto 0);
    signal output    : STD_LOGIC_VECTOR (2 downto 0);
    signal C_out     : STD_LOGIC;
    
begin
    UUT: Adder_3bit 
    PORT MAP (
        input => input,
        output => output,
        C_out => C_out
    );
    
    --230631 --- 00 111 000 010 011 100 111
    process begin
        input <= "111";
        wait for 100ns;
        
        input <= "000";
        wait for 100ns;
        
        input <= "010";
        wait for 100ns;
        
        input <= "011";
        wait for 100ns;
        
        input <= "100";
        wait for 100ns;
        
        wait;
    end process;

end Behavioral;
