library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_tr is
    port (
        X0, X1, Y0, Y1, Cin : in std_logic;
        Result, Cout : out std_logic
        );
end full_adder_tr;

architecture behavior of full_adder_tr is
	signal AND1, AND2 : std_logic;
    
     component full_adder is
        port (
            A, B, Cin : in std_logic;
			Sum, Cout : out std_logic
        );
    end component;
    
begin
	AND1 <= X0 AND Y1 after 1 ps;
    AND2 <= Y0 AND X1 after 1 ps;
    
    FA_1 : full_adder port map (AND1, AND2, Cin, Result, Cout);
    
end behavior;