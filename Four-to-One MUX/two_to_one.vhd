-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity two_to_one is
port(
		A, B : in std_logic;
        S : in std_logic;
        Output : out std_logic
        );
end two_to_one;

architecture behavior of two_to_one is

begin
	
    process(S, A, B)
    begin
    	if (S = '1') then
        	Output <= B;
         else
         	Output <= A;
         end if;
     end process;

end behavior;