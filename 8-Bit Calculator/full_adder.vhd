library IEEE;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		A, B, Cin : in std_logic;
		Sum, Cout : out std_logic);
end full_adder;

architecture behavior of full_adder is
    signal XOR1, AND1, AND2 : std_logic;
    begin
    -- Build Gates 
    	XOR1 <= A XOR B after 1 ps;
    	AND1 <= A AND B after 1 ps;
    	AND2 <= XOR1 AND Cin after 1 ps;
      	Cout <= AND1 OR AND2 after 1 ps;
        Sum <= XOR1 XOR Cin after 1 ps;
      end behavior;
        
