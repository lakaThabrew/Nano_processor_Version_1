----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 06:19:51 PM
-- Design Name: 
-- Module Name: Sim_Add_unit - Behavioral
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

entity Sim_Add_unit is
--  Port ( );
end Sim_Add_unit;

architecture Behavioral of Sim_Add_unit is
    component Add_Sub_unit
       Port ( 
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0); 
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
   end component;

   signal A, B : STD_LOGIC_VECTOR(3 downto 0);
   signal M : STD_LOGIC;
   signal C_out : STD_LOGIC;
   signal S : STD_LOGIC_VECTOR(3 downto 0);
   signal Zero : STD_LOGIC;
   signal Overflow : STD_LOGIC;

begin
    UUT: Add_Sub_unit 
        Port map (
          A => A,
          B => B,
          M => M,
          C_out => C_out,
          S => S,
          Zero => Zero,
          Overflow => Overflow
        );
--230631 --- 0011 1000 0100 1110 0111
    process begin
        -- Test 1: 7 + -2
        A <= "0111";  -- 7
        B <= "1110";  -- -2
        M <= '0';     -- Add
        wait for 100 ns;

        -- Test 2: 7 - -2
        A <= "0111";  -- 7
        B <= "1110";  -- -2
        M <= '1';     -- Sub
        wait for 100 ns;

        -- Test 3: -8 + 4
        A <= "1000";  -- -8
        B <= "0100";  -- 4
        M <= '0';     -- Sub
        wait for 100 ns;

        -- Test 4: -8 - 4 (Overflow expected)
        A <= "1000";  -- -8
        B <= "0100";  -- 4
        M <= '1';     -- Add
        wait for 100 ns;
        
        A <= "0011";  -- 3
        B <= "0100";  -- 4
        M <= '1';     -- Sub
        wait for 100 ns;
 
        A <= "0011";  -- 3
        B <= "0011";  -- 3
        M <= '1';     -- Sub
        wait for 100 ns;       
    end process;
end Behavioral;
