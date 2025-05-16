----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 01:15:59 PM
-- Design Name: 
-- Module Name: Sim_nano_processor - Behavioral
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

entity Sim_nano_processor is
--  Port ( );
end Sim_nano_processor;

architecture Behavioral of Sim_nano_processor is
    
    component Nano_processor
        Port (
            Reset         : in STD_LOGIC;
            Clk           : in STD_LOGIC;
            Output        : out STD_LOGIC_VECTOR(3 downto 0);
            Flag_overflow : out STD_LOGIC;
            Flag_Zero     : out STD_LOGIC;
            Flag_C_out    : out STD_LOGIC;
            Flag_Sign     : out STD_LOGIC;
            AnodeSelector : out STD_LOGIC_VECTOR(3 downto 0);
            S_7Seg        : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    signal tb_Reset         : STD_LOGIC := '1';
    signal tb_Clk           : STD_LOGIC := '0';
    signal tb_Output        : STD_LOGIC_VECTOR(3 downto 0);
    signal tb_Flag_overflow : STD_LOGIC;
    signal tb_Flag_Zero     : STD_LOGIC;
    signal tb_Flag_C_out    : STD_LOGIC;
    signal tb_Flag_Sign     : STD_LOGIC;
    signal tb_AnodeSelector : STD_LOGIC_VECTOR(3 downto 0);
    signal tb_S_7Seg        : STD_LOGIC_VECTOR(6 downto 0);
        
begin
    uut: Nano_processor
        port map (
            Reset         => tb_Reset,
            Clk           => tb_Clk,
            Output        => tb_Output,
            Flag_overflow => tb_Flag_overflow,
            Flag_Zero     => tb_Flag_Zero,
            Flag_C_out    => tb_Flag_C_out,
            Flag_Sign     => tb_Flag_Sign,
            AnodeSelector => tb_AnodeSelector,
            S_7Seg        => tb_S_7Seg
        );

    -- Clock process: 100 MHz (10 ns period)
    process
        begin
            tb_Clk <= '1';
            wait for 2 ns;
            tb_Clk <='0';
            wait for 2 ns;
    end process;

    -- Reset process
    process
        begin
            tb_Reset <= '1';
            wait for 100 ns;
    
            tb_Reset <= '0';
    
            wait;
    end process;
end Behavioral;
