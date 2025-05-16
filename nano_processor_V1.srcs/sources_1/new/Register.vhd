----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 07:21:03 PM
-- Design Name: 
-- Module Name: Register - Behavioral
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

entity Regi is
 Port (    D : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset: in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Regi;

architecture Behavioral of Regi is

begin
    process (Clk, EN, Reset) begin
        if Reset = '0' then
            if (rising_edge(Clk)) then  -- respond when clock rises
                if En = '1' then        -- Enable should be set
                    Q <= D;
                end if;
            end if;
        else
            Q <= "0000";
        end if;
    end process;

end Behavioral;
