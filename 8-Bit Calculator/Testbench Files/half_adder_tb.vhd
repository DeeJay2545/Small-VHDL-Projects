library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture behavior of half_adder_tb is
    signal A, B, Result, Cout: std_logic;
    component half_adder is
        port (
            A, B: in std_logic;
        	Result, Cout: out std_logic);
    end component;

begin
    process
    begin
   	A <= '0';
    B <= '0';
    wait for 5 ns;
    
    A <= '1';
    B <= '0';
    wait for 5 ns;
    
    A <= '0';
    B <= '1';
    wait for 5 ns;
    
    A <= '1';
    B <= '1';
    wait for 5 ns;
    
    std.env.finish;
        -- End simulations
    end process;

u1: half_adder port map (A, B, Result, Cout);
end behavior;