----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 09:47:29 PM
-- Design Name: 
-- Module Name: sim_ROM - Behavioral
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

entity sim_ROM is
--  Port ( );
end sim_ROM;

architecture Behavioral of sim_ROM is
    component ROM
        Port (
            Memory_Sel : in STD_LOGIC_VECTOR(2 downto 0);
            Instruction_bus : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    signal Memory_Sel_tb : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Instruction_bus_tb : STD_LOGIC_VECTOR(11 downto 0);
    
begin
    UUT: ROM
        port map (
            Memory_Sel => Memory_Sel_tb,
            Instruction_bus => Instruction_bus_tb
        );
    --230631 --- 00 111 000 010 011 100 111
    process
        begin 
            Memory_Sel_tb <= "111";
            wait for 100ns;
            
            Memory_Sel_tb <= "100";
            wait for 100ns;
            
            Memory_Sel_tb <= "011";
            wait for 100ns;
            
            Memory_Sel_tb <= "010";
            wait for 100ns;
            
            Memory_Sel_tb <= "000";
            wait for 100ns;
            
            Memory_Sel_tb <= "111";
            wait for 100ns;
            wait;
            
    end process;
end Behavioral;
