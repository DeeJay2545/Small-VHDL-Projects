-- David Morvay
-- October 25, 2019
-- ICA #2
-- 1 Bit Accumulator

library IEEE;
use IEEE.std_logic_1164.all;

entity ACC is
    port (
        Ad, Ld, K, Cin, Yi, CLK : in std_logic := '0';
		Cout, Xi : out std_logic := '0');
end ACC;

architecture behavior of ACC is
    component Adder_1 is
        port(
            K, CinA, ADD0, ADD1 : in std_logic;
            s, Cout : out std_logic
        );
    end component;
--------------------------------------------------
    component D_FF_CE is
        port(
            D, CLK, EN: in std_logic;
      		Q, QN: out std_logic);
    end component;
--------------------------------------------------
	component MUX is
        port(
           A, B, X : in std_logic;
			Y : out std_logic);
    end component;
--------------------------------------------------
    signal S1, Cout1, EN1, Y1, Ad_Ld, Q1, QN1: std_logic := '0';
begin
	Ad_Ld <= Ad OR Ld after 1 ps;
    EN1 <= Ad_Ld after 1 ps;
    Cout <= Cout1 after 1 ps;
    Xi <= Q1 after 1 ps;
   
    u0: Adder_1 port map(K, Cin, Q1, Yi, S1, Cout1);
    u1: MUX port map(S1, Yi, Ld, Y1);
    u2: D_FF_CE port map(Y1, CLK, EN1, Q1, QN1);
    
end behavior;