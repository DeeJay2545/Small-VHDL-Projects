-- Project #2 
-- David Morvay, Joey Pezzano, RJ Yarwood
-- D Flip Flop

library ieee;
use ieee.std_logic_1164.all;
    
entity D_FF is
	port(
    -- Create Inputs
    	D, CLK: in std_logic;
      	Q: out std_logic);
end D_FF;

architecture behavior of D_FF is
    signal N1, N2, N3, A1, A2, A3, A4, NO1, NO2, NO3, NO4: std_logic;
    begin
    -- Build Gates
    	N1 <= not D after 1 ps;
      	N2 <= not CLK after 1 ps;
      	A1 <= D and N2 after 1 ps;
        A2 <= N1 and N2 after 1 ps;
		NO1 <= NO2 nor A1 after 1 ps;
      	NO2 <= NO1 nor A2 after 1 ps;
        N3 <= not NO1 after 1 ps;
        A3 <= NO1 and CLK after 1 ps;
        A4 <= N3 and CLK after 1 ps;
        NO3 <= NO4 nor A3 after 1 ps;
        NO4 <= NO3 nor A4 after 1 ps;
        Q <= NO3 after 1 ps;
        end behavior;
        