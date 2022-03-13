-- Project #2 
-- David Morvay, Joey Pezzano, RJ Yarwood
-- C_Bit

library ieee;
use ieee.std_logic_1164.all;

entity C_Bit is
    port (
        A, B, C, CLK, Change: in std_logic;
        	Five, Ten : in std_logic;
			Q : out std_logic);
end C_Bit;

architecture behavior of C_Bit is
component D_FF is
        port(
            D, CLK: in std_logic;
      		Q: out std_logic);
    end component;
    
signal C1, C2, C3, C4, C5, C6, C7, Q1: std_logic;

begin 
C1 <= (A AND (NOT B) AND (NOT C)) after 1 ps;
C2 <= (((NOT A) AND (NOT B) AND C) OR ((NOT A) AND B AND C)) AND (NOT Five) AND (NOT Ten) AND (NOT Change) after 1 ps;
C3 <= ((NOT A) AND (NOT B) AND (NOT C)) or ((NOT A) AND (NOT B) AND C) or ((NOT A) AND B AND (NOT C)) or ((NOT A) AND B AND C) after 1 ps;
C4 <= C3 AND Five AND (NOT Change) after 1 ps;
C5 <= ((NOT A) AND (NOT B) AND C) AND Ten AND (NOT Change) after 1 ps;
C6 <= ((NOT A) AND (NOT B) AND C) AND Change after 1 ps;
C7 <= C1 OR C2 OR C4 OR C5 or C6 after 1 ps;
Q <= Q1 after 1 ps;

DC: D_FF port map(C7, CLK, Q1);

end behavior; 