----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 02:37:41 PM
-- Design Name: 
-- Module Name: Mux_2_4bit - Behavioral
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

entity Mux_2_4bit is
 Port ( A1 : in STD_LOGIC_VECTOR (3 downto 0);
        A2 : in STD_LOGIC_VECTOR (3 downto 0);
        Sel : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0) );
end Mux_2_4bit;

architecture Behavioral of Mux_2_4bit is

component Tri_State_buffer_4bit is
    port (  I : in STD_LOGIC_VECTOR (3 downto 0);
            EN : in STD_LOGIC;
            M : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Not_Sel : STD_LOGIC;

begin
    Not_Sel <= NOT Sel;

    buffer_0: Tri_State_buffer_4bit
        port map(
                    I => A1,
                    EN => NOT_Sel,
                    M => Q ); 
                      
    buffer_1: Tri_State_buffer_4bit
       port map(
                    I => A2,
                    EN => Sel,
                    M => Q ); 
end Behavioral;
