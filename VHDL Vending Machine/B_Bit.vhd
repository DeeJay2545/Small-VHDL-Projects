-- Project #2 
-- David Morvay, Joey Pezzano, RJ Yarwood
-- B_Bit

library ieee;
use ieee.std_logic_1164.all;

entity B_Bit is
    port (
       A, B, C, CLK, Change: in std_logic;
       Five, Ten : in std_logic;
		Q: out std_logic);
end B_Bit;

architecture behavior of B_Bit is
component D_FF is
        port(
            D, CLK: in std_logic;
      		Q: out std_logic);
    end component;
    
signal B1, B2, B3, B4, B5, B6, B7, Q1 : std_logic;


begin 
B1 <= (A AND (NOT B) AND (NOT C)) after 1 ps;
B2 <= (((NOT A) AND B AND (NOT C)) OR ((NOT A) AND B AND C)) AND (NOT Five) AND (NOT Ten) AND (NOT Change) after 1 ps;
B3 <= ((NOT A) AND (NOT B) AND C) OR ((NOT A) AND B AND (NOT C)) OR ((NOT A) AND B AND C) after 1 ps;
B4 <= B3 AND Five AND (NOT Change) after 1 ps;
B5 <= (((NOT A) AND (NOT B) AND C) OR ((NOT A) AND (NOT B) AND (NOT C))) AND Ten AND (NOT Change) after 1 ps;
B6 <= (((NOT A) AND B AND (NOT C)) OR ((NOT A) AND B AND C)) AND Change after 1 ps;
B7 <= B1 OR B2 OR B4 OR B5 OR B6 after 1 ps;
Q <= Q1 after 1 ps;

DB: D_FF port map(B7, CLK, Q1);

end behavior; 