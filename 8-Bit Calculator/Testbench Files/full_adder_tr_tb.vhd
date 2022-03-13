library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_tr_tb is
end full_adder_tr_tb;

architecture behavior of full_adder_tr_tb is
    signal X0, X1, Y0, Y1, Cin, Result, Cout: std_logic;
    component full_adder_tr is
        port (
            X0, X1, Y0, Y1, Cin : in std_logic;
        	Result, Cout: out std_logic);
    end component;

begin
    process
    begin
   	X0 <= '0';
    X1 <= '0';
    Y0 <= '0';
    Y1 <= '0';
    Cin <= '0';
    wait for 5 ns;
    
    X0 <= '1';
    X1 <= '0';
    Y0 <= '0';
    Y1 <= '0';
    Cin <= '0';
    wait for 5 ns;
    
    X0 <= '1';
    X1 <= '0';
    Y0 <= '0';
    Y1 <= '1';
    Cin <= '0';
    wait for 5 ns;
    
    X0 <= '0';
    X1 <= '1';
    Y0 <= '1';
    Y1 <= '0';
    Cin <= '0';
    wait for 5 ns;
    
    X0 <= '1';
    X1 <= '1';
    Y0 <= '1';
    Y1 <= '1';
    Cin <= '0';
    wait for 5 ns;
    
    std.env.finish;
        -- End simulations
    end process;

u1: full_adder_tr port map (X0, X1, Y0, Y1, Cin, Result, Cout);
end behavior;