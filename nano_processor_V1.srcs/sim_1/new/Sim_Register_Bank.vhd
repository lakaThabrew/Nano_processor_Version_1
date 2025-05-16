----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 07:33:14 PM
-- Design Name: 
-- Module Name: Sim_Register_Bank - Behavioral
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

entity Sim_Register_Bank is
--  Port ( );
end Sim_Register_Bank;

architecture Behavioral of Sim_Register_Bank is

    component Registers_Bank
        Port (  input : in STD_LOGIC_VECTOR(3 downto 0);
                Reg_Sel : in STD_LOGIC_VECTOR(2 downto 0);
                Slow_Clk : in STD_LOGIC;
                Reset : in STD_LOGIC;
                Reg0_Out : out STD_LOGIC_VECTOR(3 downto 0);
                Reg1_Out : out STD_LOGIC_VECTOR(3 downto 0);
                Reg2_Out : out STD_LOGIC_VECTOR(3 downto 0);
                Reg3_Out : out STD_LOGIC_VECTOR(3 downto 0);
                Reg4_Out : out STD_LOGIC_VECTOR(3 downto 0);
                Reg5_Out : out STD_LOGIC_VECTOR(3 downto 0);
                Reg6_Out : out STD_LOGIC_VECTOR(3 downto 0);
                Reg7_Out : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal input : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Reg_Sel : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Slow_Clk : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '1';
    signal Reg0_Out, Reg1_Out, Reg2_Out, Reg3_Out : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg4_Out, Reg5_Out, Reg6_Out, Reg7_Out : STD_LOGIC_VECTOR(3 downto 0);

begin
    UUT: Registers_Bank
        port map (
            input => input,
            Reg_Sel => Reg_Sel,
            Slow_Clk => Slow_Clk,
            Reset => Reset,
            Reg0_Out => Reg0_Out,
            Reg1_Out => Reg1_Out,
            Reg2_Out => Reg2_Out,
            Reg3_Out => Reg3_Out,
            Reg4_Out => Reg4_Out,
            Reg5_Out => Reg5_Out,
            Reg6_Out => Reg6_Out,
            Reg7_Out => Reg7_Out
        );

    process
        begin
            Slow_Clk <= '1';
            wait for 2 ns;
            Slow_Clk <='0';
            wait for 2 ns;
        end process;

--230631 --- 0011 1000 0100 1110 0111
--230631 --- 00 111 000 010 011 100 111
    process
    begin
        Reset <= '1';
        wait for 100 ns;
        Reset <= '0';
  
        Reg_Sel <= "111";
        input <= "0111";
        wait for 100ns;
                
        Reg_Sel <= "100";
        Reset <= '1';
        input <= "1110";
        wait for 100ns;
        
        Reset <= '0';         
        Reg_Sel <= "011";
        input <= "0100";
        wait for 100ns;
                
        Reg_Sel <= "010";
        input <= "1000";
        wait for 100ns;
                
    end process;
end Behavioral;
