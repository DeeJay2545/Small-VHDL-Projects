-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity two_to_one_tb is
end two_to_one_tb;

architecture behavior of two_to_one_tb is

	-- Signals
    signal A_sig, B_sig : std_logic;
    signal S_sig : std_logic;
    signal Output_sig : std_logic;
    
    -- Components
    component two_to_one is 
    port(
    		A, B : in std_logic;
        	S : in std_logic;
        	Output : out std_logic
        );
     end component;
     
begin
	process 
    begin
    	
        A_sig <= '0';
        B_sig <= '0';
        S_sig <= '0';
        wait for 10 us;
        
        A_sig <= '1';
        B_sig <= '0';
        S_sig <= '0';
        wait for 10 us;
        
        A_sig <= '1';
        B_sig <= '0';
        S_sig <= '1';
        wait for 10 us;
        
        wait;
     end process;
     
     dut : two_to_one port map(A => A_sig, B => B_sig, S => S_sig, Output => Output_sig);

end behavior;
        	
