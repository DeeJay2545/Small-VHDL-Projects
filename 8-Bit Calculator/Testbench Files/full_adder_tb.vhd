library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture testbench of full_adder_tb is
    signal A, B, Cin, Sum, Cout: std_logic;
    component full_adder is
        port (
            A, B, Cin: in std_logic;
        	Sum, Cout: out std_logic);
    end component;

begin
    process
    begin
    -- Set Inputs
       -- Set Inputs
       A <= '0';
       B <= '0';
       Cin <= '0';
      wait for 5 ns;
      
      Cin <= '1';
      wait for 5 ns;
      
      B <= '1';
      Cin <= '0';
      wait for 5 ns;
      
      B <= '1';
      Cin <= '1';
      wait for 5 ns;
      
      A <= '1';
      B <= '0';
      Cin <= '0';
      wait for 5 ns;
      
      A <= '1';
      B <= '0';
      Cin <= '1';
      wait for 5 ns;
      
      A <= '1';
      B <= '1';
      Cin <= '0';
      wait for 5 ns;
      
      A <= '1';
      B <= '1';
      Cin <= '1';
      wait for 5 ns;
      
      std.env.finish;
        -- End simulations
    end process;

u1: full_adder port map (A, B, Cin, Sum, Cout);
end testbench;