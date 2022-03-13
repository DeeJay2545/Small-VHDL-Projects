-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity four_to_one_tb is
end four_to_one_tb;

architecture behavior of four_to_one_tb is

	-- Signals
    signal A_sig, B_sig, C_sig, D_sig : std_logic;
    signal S0_sig, S1_sig : std_logic;
    signal Output_sig : std_logic;
    
    -- Components
    component four_to_one is 
    port(
    		A, B, C, D : in std_logic;
        	S0, S1 : in std_logic;
        	Output : out std_logic
        );
     end component;
     
begin
	process 
    begin
    	
        A_sig <= '1';
        B_sig <= '0';
        C_sig <= '0';
        D_sig <= '0';
        S0_sig <= '0';
        S1_sig <= '0';
        wait for 10 us;
        
        A_sig <= '0';
        B_sig <= '0';
        C_sig <= '0';
        D_sig <= '0';
        S0_sig <= '1';
        S1_sig <= '0';
        wait for 10 us;
        
        A_sig <= '0';
        B_sig <= '0';
        C_sig <= '1';
        D_sig <= '0';
        S0_sig <= '0';
        S1_sig <= '1';
        wait for 10 us;
        
        A_sig <= '0';
        B_sig <= '0';
        C_sig <= '0';
        D_sig <= '0';
        S0_sig <= '1';
        S1_sig <= '1';
        wait for 10 us;
        
        wait;
     end process;
     
     dut : four_to_one port map(A => A_sig, B => B_sig, C => C_sig,
     							D => D_sig, S0 => S0_sig, S1 => S1_sig, Output => Output_sig);

end behavior;
        	
