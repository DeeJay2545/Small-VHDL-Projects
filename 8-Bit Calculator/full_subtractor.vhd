library IEEE;
use ieee.std_logic_1164.all;

entity full_subtractor is
	port(
		A, B, Bin : in std_logic;
		Diff, Bout : out std_logic);
end full_subtractor;

architecture behavior of full_subtractor is
    signal XOR1, AND1, AND2 : std_logic;
    begin
    -- Build Gates 
    	XOR1 <= A XOR B after 1 ps;
    	AND1 <= (NOT A) AND B after 1 ps;
    	AND2 <= (NOT XOR1) AND Bin after 1 ps;
      	Bout <= AND1 OR AND2 after 1 ps;
        Diff <= XOR1 XOR Bin after 1 ps;
      end behavior;
        
