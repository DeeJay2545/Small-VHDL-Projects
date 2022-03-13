library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_br is
    port (
        X, Y, S, Cin : in std_logic;
        Result, Cout : out std_logic
        );
end full_adder_br;

architecture behavior of full_adder_br is
	signal AND1 : std_logic;
    
     component full_adder is
        port (
            A, B, Cin : in std_logic;
			Sum, Cout : out std_logic
        );
    end component;
    
begin
	AND1 <= X AND Y after 1 ps;
    
    FA_1 : full_adder port map (AND1, S, Cin, Result, Cout);
    
end behavior;