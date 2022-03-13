-- David Morvay
-- October 25, 2019
-- ICA #2
-- Multiplexer

library IEEE;
use ieee.std_logic_1164.all;

entity MUX is
	port(
		A, B, X : in std_logic;
		Y : out std_logic);
end MUX;

architecture behavior of MUX is
    signal X1, A1, B1: std_logic;
    begin
    -- Build Gates
    	X1 <= NOT X after 1 ps;
    	A1 <= A AND X1 after 1 ps;
      	B1 <= X AND B after 1 ps;
        Y <= A1 or B1 after 1 ps;
      end behavior;
        