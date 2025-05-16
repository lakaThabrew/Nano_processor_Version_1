----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 04:14:38 PM
-- Design Name: 
-- Module Name: Add_Sub_unit - Behavioral
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

entity Add_Sub_unit is
 Port ( 
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            M : in STD_LOGIC;
            C_out : out STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0); 
            Zero : out STD_LOGIC;
            overflow : out STD_LOGIC);
            
end Add_Sub_unit;

architecture Behavioral of Add_Sub_unit is
    component RCA_4
        port (     A0 : in STD_LOGIC;
                   A1 : in STD_LOGIC;
                   A2 : in STD_LOGIC;
                   A3 : in STD_LOGIC;
                   B0 : in STD_LOGIC;
                   B1 : in STD_LOGIC;
                   B2 : in STD_LOGIC;
                   B3 : in STD_LOGIC;
                   C_in : in STD_LOGIC;
                   S0 : out STD_LOGIC;
                   S1 : out STD_LOGIC;
                   S2 : out STD_LOGIC;
                   S3 : out STD_LOGIC;
                   C_out : out STD_LOGIC   );
    end component;
    
    signal z0, z1, z2, z3, carry : std_logic;
    signal S_RCA_4 : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    z0 <= B(0) XOR M;
    z1 <= B(1) XOR M;
    z2 <= B(2) XOR M;
    z3 <= B(3) XOR M;

    RCA_4_0: RCA_4
        port map(      
                 A0 => A(0),
                 A1 => A(1),
                 A2 => A(2),
                 A3 => A(3),
                 B0 => z0,
                 B1 => z1,
                 B2 => z2,
                 B3 => z3,
                 C_in => M,
                 S0 => S_RCA_4(0),
                 S1 => S_RCA_4(1),
                 S2 => S_RCA_4(2),
                 S3 => S_RCA_4(3),
                 C_out => carry);
      
      S <= S_RCA_4 ; 
      c_out <= carry;           
      Zero <= '1' when S_RCA_4 = "0000" and ((M = '0' and carry = '0') or (M = '1' and carry = '1')) else '0';
      Overflow <= (A(3) xor z3) and (A(3) xor S_RCA_4(3));

end Behavioral;
