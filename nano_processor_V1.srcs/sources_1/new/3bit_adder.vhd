----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 11:40:14 AM
-- Design Name: 
-- Module Name: 3bit_adder - Behavioral
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

entity 3bit_adder is
    Port ( input : in STD_LOGIC_VECTOR (2 downto 0);
           input_2 : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end 3bit_adder;

architecture Behavioral of 3bit_adder is

begin


end Behavioral;
