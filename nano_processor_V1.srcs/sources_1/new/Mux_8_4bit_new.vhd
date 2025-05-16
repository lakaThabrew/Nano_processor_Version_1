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

entity Mux_8_4bit_new is
       Port (   A0 : in STD_LOGIC_VECTOR (3 downto 0);
                A1 : in STD_LOGIC_VECTOR (3 downto 0);
                A2 : in STD_LOGIC_VECTOR (3 downto 0);
                A3 : in STD_LOGIC_VECTOR (3 downto 0);
                A4 : in STD_LOGIC_VECTOR (3 downto 0);
                A5 : in STD_LOGIC_VECTOR (3 downto 0);
                A6 : in STD_LOGIC_VECTOR (3 downto 0);
                A7 : in STD_LOGIC_VECTOR (3 downto 0);
                Sel : in STD_LOGIC_VECTOR (2 downto 0);
                Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_4bit_new;

architecture Behavioral of Mux_8_4bit_new is

    component Tri_State_buffer_4bit is
        port (  I : in STD_LOGIC_VECTOR (3 downto 0);
                EN : in STD_LOGIC;
                M : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Decoder_3_to_8 is
        port(   I : in STD_LOGIC_VECTOR (2 downto 0);
                EN : in STD_LOGIC;
                Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal Enable : STD_LOGIC_VECTOR(7 downto 0); 
      
begin
    Decoder_3_to_8_0: Decoder_3_to_8
        port map(   I => Sel,
                    EN => '1',
                    Y => Enable        
        );
        
    buffer_0: Tri_State_buffer_4bit
        port map(   I => A0,
                    EN => Enable(0),
                    M => Y      
        );
    
    buffer_1: Tri_State_buffer_4bit
         port map(   I => A1,
                     EN => Enable(1),
                     M => Y );
                     
    buffer_2: Tri_State_buffer_4bit
         port map(   I => A2,
                     EN => Enable(2),
                     M => Y );
                     
    buffer_3: Tri_State_buffer_4bit
         port map(   I => A3,
                     EN => Enable(3),
                     M => Y );
                     
    buffer_4: Tri_State_buffer_4bit
         port map(   I => A4,
                     EN => Enable(4),
                     M => Y );
                     
    buffer_5: Tri_State_buffer_4bit
         port map(   I => A5,
                     EN => Enable(5),
                     M => Y  );
                     
    buffer_6: Tri_State_buffer_4bit
         port map(   I => A6,
                     EN => Enable(6),
                     M => Y  );
                     
    buffer_7: Tri_State_buffer_4bit
         port map(   I => A7,
                     EN => Enable(7),
                     M => Y  );
                     
end Behavioral;
