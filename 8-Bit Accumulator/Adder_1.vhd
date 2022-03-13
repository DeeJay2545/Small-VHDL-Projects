-- David Morvay
-- October 25, 2019
-- ICA #2
-- 1 Bit Adder

library IEEE;
use ieee.std_logic_1164.all;

entity Adder_1 is
	port(
		K, CinA, ADD0, ADD1 : in std_logic;
		s, Cout : out std_logic);
end Adder_1;

architecture behavior of Adder_1 is
    signal X1, C_K, o1, o2, o3 : std_logic;
    begin
    -- Build Gates 
    	X1 <= ADD1 XOR K after 1 ps;
    	o1 <= ADD0 XOR X1 after 1 ps;
    	o2 <= o1 AND CinA after 1 ps;
      	o3 <= ADD0 AND X1 after 1 ps;
        Cout <= o2 or o3 after 1 ps;
        s <= CinA XOR o1 after 1 ps;
      end behavior;
        
