-- Project #2 
-- David Morvay, Joey Pezzano, RJ Yarwood
-- Set Function

library ieee;
use ieee.std_logic_1164.all;
    
entity Set_Function is
	port(
    -- Create Inputs
    	A, B, C, Turn_On : in std_logic;
      	AO, BO, CO : out std_logic);
end Set_Function;

architecture behavior of Set_Function is
    begin
    AO <= A AND Turn_On after 1 ps;
    BO <= B AND Turn_On after 1 ps;
    CO <= C AND Turn_On after 1 ps;
    end behavior;