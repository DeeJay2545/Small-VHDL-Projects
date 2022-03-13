library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
    port (
        A, B : in std_logic;
        Result, Cout : out std_logic
        );
end half_adder;

architecture behavior of half_adder is
begin
	Result <= A XOR B after 1 ps;
    Cout <= A AND B after 1 ps;
    
end behavior;