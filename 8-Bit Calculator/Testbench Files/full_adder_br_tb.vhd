library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_br_tb is
end full_adder_br_tb;

architecture behavior of full_adder_br_tb is
    signal X, Y, S, Cin, Result, Cout: std_logic;
    component full_adder_br is
        port (
            X, Y, S, Cin : in std_logic;
        	Result, Cout: out std_logic);
    end component;

begin
    process
    begin
   	X <= '0';
    Y <= '0';
    S <= '0';
    Cin <= '0';
    wait for 5 ns;
    
    X <= '1';
    Y <= '0';
    S <= '0';
    Cin <= '0';
    wait for 5 ns;
    
    X <= '0';
    Y <= '0';
    S <= '1';
    Cin <= '0';
    wait for 5 ns;
    
    X <= '1';
    Y <= '1';
    S <= '0';
    Cin <= '0';
    wait for 5 ns;
    
    X <= '1';
    Y <= '1';
    S <= '1';
    Cin <= '0';
    wait for 5 ns;
    
    std.env.finish;
        -- End simulations
    end process;

u1: full_adder_br port map (X, Y, S, Cin, Result, Cout);
end behavior;