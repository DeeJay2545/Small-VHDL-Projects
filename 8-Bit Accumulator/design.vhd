-- David Morvay
-- October 25, 2019
-- ICA #2
-- 8 Bit Accumulator

-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity ACC_8 is
    port (
        Ad, Ld, K, Cin : in std_logic := '0';
        Yi : in std_logic_vector(7 downto 0) := "00000000";
        CLK : in std_logic := '0';
		Cout : out std_logic_vector(7 downto 0) := "00000000";
        Xi : out std_logic_vector(7 downto 0) := "00000000";
        Yi0 : out std_logic);
end ACC_8;

architecture behavior of ACC_8 is
    component ACC is
    port(
        Ad, Ld, K, Cin, Yi, CLK : in std_logic;
		Cout, Xi : out std_logic);
    end component;
   
   signal C_K0 , C_K1 : std_logic := '0';
   signal CoutS : std_logic_vector(7 downto 0) := "00000000";
   signal XiS : std_logic_vector(7 downto 0) := "00000000";
   begin
   
   C_K0 <= NOT Cin after 1 ps;
   C_K1 <= NOT C_K0 after 1 ps;
   Cout <= CoutS after 1 ps;
   Xi <= XiS after 1 ps;
   Yi0 <= Couts(0) after ps;
   
    ACC0: ACC port map(Ad, Ld, C_K1, Cin, Yi(0), CLK, CoutS(0), XiS(0));
    ACC1: ACC port map(Ad, Ld, C_K1, CoutS(0), Yi(1), CLK, CoutS(1), XiS(1));
    ACC2: ACC port map(Ad, Ld, C_K1, CoutS(1), Yi(2), CLK, CoutS(2), XiS(2));
    ACC3: ACC port map(Ad, Ld, C_K1, CoutS(2), Yi(3), CLK, CoutS(3), XiS(3));
    ACC4: ACC port map(Ad, Ld, C_K1, CoutS(3), Yi(4), CLK, CoutS(4), XiS(4));
    ACC5: ACC port map(Ad, Ld, C_K1, CoutS(4), Yi(5), CLK, CoutS(5), XiS(5));
    ACC6: ACC port map(Ad, Ld, C_K1, CoutS(5), Yi(6), CLK, CoutS(6), XiS(6));
    ACC7: ACC port map(Ad, Ld, C_K1, CoutS(6), Yi(7), CLK, CoutS(7), XiS(7));
    
end behavior;
