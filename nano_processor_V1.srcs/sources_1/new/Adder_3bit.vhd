----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 11:42:25 AM
-- Design Name: 
-- Module Name: Adder_3bit - Behavioral
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

entity Adder_3bit is
    Port ( input : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end Adder_3bit;

architecture Behavioral of Adder_3bit is

component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

SIGNAL FA0_C, FA1_C : std_logic;

begin
    FA_0 : FA
        port map (
            A => input(0),
            B => '1',
            C_in => '0',
            S => output(0),
            C_Out => FA0_C);
            
    FA_1 : FA
        port map (
            A => input(1),
            B => '0',
            C_in => FA0_C,
            S => output(1),
            C_Out => FA1_C);
            
    FA_2 : FA
            port map (
            A => input(2),
            B => '0',
            C_in => FA1_C,
            S => output(2),
            C_Out => C_out);

end Behavioral;
