----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 04:17:24 PM
-- Design Name: 
-- Module Name: sim_Instuction_Decoder - Behavioral
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

entity sim_Instuction_Decoder is
--  Port ( );
end sim_Instuction_Decoder;

architecture Behavioral of sim_Instuction_Decoder is
    component Instruction_decoder
        Port (
            Instruction_Bus : in STD_LOGIC_VECTOR(11 downto 0);
            Reg_Check_Jump  : in STD_LOGIC_VECTOR(3 downto 0);
            Reg_Enable      : out STD_LOGIC_VECTOR(2 downto 0);
            Load_Sel        : out STD_LOGIC;
            Imm_Value       : out STD_LOGIC_VECTOR(3 downto 0);
            Reg_Sel_1       : out STD_LOGIC_VECTOR(2 downto 0);
            Reg_Sel_2       : out STD_LOGIC_VECTOR(2 downto 0);
            Add_Sub_Sel     : out STD_LOGIC;
            Jump_flag       : out STD_LOGIC;
            Address_Jump    : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;
    
    signal Instruction_Bus_tb  : STD_LOGIC_VECTOR(11 downto 0);
    signal Reg_Check_Jump_tb   : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_Enable_tb       : STD_LOGIC_VECTOR(2 downto 0);
    signal Load_Sel_tb         : STD_LOGIC;
    signal Imm_Value_tb        : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_Sel_1_tb        : STD_LOGIC_VECTOR(2 downto 0);
    signal Reg_Sel_2_tb        : STD_LOGIC_VECTOR(2 downto 0);
    signal Add_Sub_Sel_tb      : STD_LOGIC;
    signal Jump_flag_tb        : STD_LOGIC;
    signal Address_Jump_tb     : STD_LOGIC_VECTOR(2 downto 0);

begin
    UUT: Instruction_decoder
        port map (
            Instruction_Bus => Instruction_Bus_tb,
            Reg_Check_Jump  => Reg_Check_Jump_tb,
            Reg_Enable      => Reg_Enable_tb,
            Load_Sel        => Load_Sel_tb,
            Imm_Value       => Imm_Value_tb,
            Reg_Sel_1       => Reg_Sel_1_tb,
            Reg_Sel_2       => Reg_Sel_2_tb,
            Add_Sub_Sel     => Add_Sub_Sel_tb,
            Jump_flag       => Jump_flag_tb,
            Address_Jump    => Address_Jump_tb
        );

    process
        begin
            -- 1. Test ADD R1, R2 (operator "00")
            Instruction_Bus_tb <= "000010100010"; -- ADD R1, R2
            Reg_Check_Jump_tb <= "0001"; -- Not zero
            wait for 100 ns;
    
            -- 2. Test NEG R2 (operator "01")
            Instruction_Bus_tb <= "010100000000"; -- NEG R2
            wait for 100 ns;
    
            -- 3. Test MOVI R1, 4 (operator "10")
            Instruction_Bus_tb <= "100010000100"; -- MOVI R1, 4
            wait for 100 ns;
    
            -- 4. Test JZR R1, 7 (operator "11") with R1 = 0 (jump expected)
            Instruction_Bus_tb <= "110010000111"; -- JZR R1, 7
            Reg_Check_Jump_tb <= "0000"; -- Zero
            wait for 100 ns;
    
            -- 5. Test JZR R1, 7 (operator "11") with R1 ? 0 (no jump)
            Instruction_Bus_tb <= "110010000111";
            Reg_Check_Jump_tb <= "0010"; -- Not zero
            wait for 100 ns;
    
            wait;
        end process;
end Behavioral;
