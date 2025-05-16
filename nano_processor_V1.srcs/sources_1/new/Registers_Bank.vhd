----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 07:05:02 PM
-- Design Name: 
-- Module Name: Registers_Bank - Behavioral
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

entity Registers_Bank is
    Port (  input: in STD_LOGIC_VECTOR(3 downto 0);
            Reg_Sel: in STD_LOGIC_VECTOR(2 downto 0);
            Slow_Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Reg0_Out : out STD_LOGIC_VECTOR (3 downto 0);
            Reg1_Out : out STD_LOGIC_VECTOR (3 downto 0);
            Reg2_Out : out STD_LOGIC_VECTOR (3 downto 0);
            Reg3_Out : out STD_LOGIC_VECTOR (3 downto 0);
            Reg4_Out : out STD_LOGIC_VECTOR (3 downto 0);
            Reg5_Out : out STD_LOGIC_VECTOR (3 downto 0);
            Reg6_Out : out STD_LOGIC_VECTOR (3 downto 0);
            Reg7_Out : out STD_LOGIC_VECTOR (3 downto 0)
     );
end Registers_Bank;

architecture Behavioral of Registers_Bank is
    
    component Decoder_3_to_8
        port (  I : in STD_LOGIC_VECTOR (2 downto 0);
                EN : in STD_LOGIC;
                Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component Regi
        port(   D : in STD_LOGIC_VECTOR (3 downto 0);
                EN : in STD_LOGIC;
                Clk : in STD_LOGIC;
                Reset : in STD_LOGIC;
                Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    Signal Reg_Enable : STD_LOGIC_VECTOR (7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
          Port map( 
                I => Reg_Sel,
                EN =>'1',
                Y => Reg_Enable );
                    
    Reg_0 : Regi
          Port map ( 
                D => "0000",
                EN => Reg_Enable(0),
                Clk =>Slow_Clk,
                Reset => Reset,
                Q=> Reg0_Out );
               
    Reg_1 : Regi
         Port map ( 
                D => input,
                EN => Reg_Enable(1),
                Clk => Slow_Clk,
                Reset => Reset,
                Q => Reg1_Out );
              
    Reg_2 : Regi
         Port map ( 
                D => input,
                EN => Reg_Enable(2),
                Clk => Slow_Clk,
                Reset => Reset,
                Q => Reg2_Out );
              
    Reg_3 : Regi
         Port map ( 
                D => input,
                EN => Reg_Enable(3),
                Clk => Slow_Clk,
                Reset => Reset,
                Q => Reg3_Out );
                        
    Reg_4 : Regi
         Port map ( 
                D => input,
                EN => Reg_Enable(4),
                Clk => Slow_Clk,
                Reset => Reset,
                Q => Reg4_Out );
              
    Reg_5 : Regi
         Port map ( 
                D => input,
                EN => Reg_Enable(5),
                Clk => Slow_Clk,
                Reset => Reset,
                Q => Reg5_Out );
                        
    Reg_6 : Regi
         Port map ( 
                D => input,
                EN => Reg_Enable(6),
                Clk => Slow_Clk,
                Reset => Reset,
                Q => Reg6_Out );
                                  
    Reg_7 : Regi
         Port map ( 
                D => input,
                EN => Reg_Enable(7),
                Clk => Slow_Clk,
                Reset => Reset,
                Q => Reg7_Out );

end Behavioral;
