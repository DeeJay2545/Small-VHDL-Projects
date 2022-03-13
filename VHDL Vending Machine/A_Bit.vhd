-- Project #2 
-- David Morvay, Joey Pezzano, RJ Yarwood
-- A_Bit

library ieee;
use ieee.std_logic_1164.all;

entity A_Bit is
    port (
        A, B, C, CLK, Change: in std_logic;
        Five, Ten : in std_logic;
		Q: out std_logic);
end A_Bit;

architecture behavior of A_Bit is
component D_FF is
        port(
            D, CLK: in std_logic;
      		Q: out std_logic);
    end component;
    
signal A1, A2, A3, A4, A5, A6, A7, Q1 : std_logic;


begin
Q <= Q1 after 1 ps;
A1 <= (A AND (NOT B) AND (NOT C)) after 1 ps;
A2 <= (((NOT A) AND B AND (NOT C)) OR ((NOT A) AND B AND C)) AND Five AND (NOT Change) after 1 ps;
A3 <= ((NOT A) AND (NOT B) AND C) OR ((NOT A) AND B AND (NOT C)) OR ((NOT A) AND B AND C) after 1 ps;
A4 <= A3 AND Ten AND (NOT Change) after 1 ps;
A5 <= ((NOT A) AND (NOT B) AND (C)) OR ((NOT A) AND B AND (NOT C)) OR ((NOT A) AND B AND C) after 1 ps; 
A6 <= A5 AND Change after 1 ps; 
A7 <= A1 OR A2 OR A4 OR A6 after 1 ps;


DA: D_FF port map(A7, CLK, Q1);

end behavior; 