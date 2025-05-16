----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 08:44:05 PM
-- Design Name: 
-- Module Name: sim_Program_counter - Behavioral
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

entity sim_Program_counter is
--  Port ( );
end sim_Program_counter;

architecture Behavioral of sim_Program_counter is

    component Program_Counter
        Port ( 
            input : in STD_LOGIC_VECTOR(2 downto 0);
            output: out STD_LOGIC_VECTOR(2 downto 0);
            Clk: in STD_LOGIC;
            Reset: in STD_LOGIC );
    end component;

    signal input  : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal output : STD_LOGIC_VECTOR(2 downto 0);
    signal Clk    : STD_LOGIC := '0';
    signal Reset  : STD_LOGIC := '1';

begin
    uut: Program_Counter
        port map (
            input => input,
            output => output,
            Clk => Clk,
            Reset => Reset
        );

    clk_process : process
    begin
        Clk <= '1';
        wait for 2 ns;
        Clk <='0';
        wait for 2 ns;
    end process;

    stim_proc: process
    begin
        wait for 100 ns;
        Reset <= '0';
        
        --230631 --- 00 111 000 010 011 100 111
        input <= "111"; wait for 100 ns;
        input <= "100"; wait for 100 ns;
        input <= "011"; wait for 100 ns;
        input <= "010"; wait for 100 ns;

        Reset <= '1'; wait for 100 ns;
        Reset <= '0';
        
        input <= "000"; wait for 100 ns;

        wait;
    end process;
end Behavioral;
