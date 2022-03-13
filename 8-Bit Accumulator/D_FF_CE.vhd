-- David Morvay
-- October 25, 2019
-- ICA #2
-- D Flip Flop

library ieee;
use ieee.std_logic_1164.all;
    
entity D_FF_CE is
	port(
    -- Create Inputs
    	D, CLK, EN: in std_logic;
      	Q, QN: out std_logic);
end D_FF_CE;

architecture behavior of D_FF_CE is
    signal EN1, D1, D2, Y, N1, N2, N3, A1, A2, A3, A4, NO1, NO2, NO3, NO4: std_logic;
    begin
    -- Build Gates
    	Q <= NO3 after 1 ps;
      	EN1 <= not EN after 1 ps;
      	D1 <= D AND EN after 1 ps;
      	D2 <= EN1 AND NO3 after 1 ps;
        Y <= D1 or D2 after 1 ps;
    	N1 <= not Y after 1 ps;
      	N2 <= not CLK after 1 ps;
      	A1 <= Y and N2 after 1 ps;
        A2 <= N1 and N2 after 1 ps;
		NO1 <= NO2 nor A1 after 1 ps;
      	NO2 <= NO1 nor A2 after 1 ps;
        N3 <= not NO1 after 1 ps;
        A3 <= NO1 and CLK after 1 ps;
        A4 <= N3 and CLK after 1 ps;
        NO3 <= NO4 nor A3 after 1 ps;
        NO4 <= NO3 nor A4 after 1 ps;
        end behavior;