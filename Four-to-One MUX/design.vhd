-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity four_to_one is
port(
		A, B, C, D : in std_logic;
        S0, S1 : in std_logic;
        Output : out std_logic
        );
end four_to_one;

architecture behavior of four_to_one is
	-- Signals
    signal Output1, Output2 : std_logic;
    
    -- Components
    component two_to_one is
    port(
    		A, B : in std_logic;
        	S : in std_logic;
        	Output : out std_logic
         );
     end component;
     
begin
	
    dut1 : two_to_one port map(A => A, B => B, S => S0, Output => Output1);
    dut2 : two_to_one port map(A => C, B => D, S => S0, Output => Output2);
    dut3 : two_to_one port map(A => Output1, B => Output2, S => S1, Output => Output);

end behavior;