library IEEE;
use IEEE.std_logic_1164.all;

entity full_subtractor_tb is
end full_subtractor_tb;

architecture behavior of full_subtractor_tb is
    signal A, B, Bin, Diff, Bout: std_logic;
    component full_subtractor is
        port (
            A, B, Bin: in std_logic;
        	Diff, Bout: out std_logic);
    end component;

begin
    process
    begin
    -- Set Inputs
       -- Set Inputs
       A <= '0';
       B <= '0';
       Bin <= '0';
      wait for 5 ns;
      
      Bin <= '1';
      wait for 5 ns;
      
      B <= '1';
      Bin <= '0';
      wait for 5 ns;
      
      B <= '1';
      Bin <= '1';
      wait for 5 ns;
      
      A <= '1';
      B <= '0';
      Bin <= '0';
      wait for 5 ns;
      
      A <= '1';
      B <= '0';
      Bin <= '1';
      wait for 5 ns;
      
      A <= '1';
      B <= '1';
      Bin <= '0';
      wait for 5 ns;
      
      A <= '1';
      B <= '1';
      Bin <= '1';
      wait for 5 ns;
      
      std.env.finish;
        -- End simulations
    end process;

u1: full_subtractor port map (A, B, Bin, Diff, Bout);
end behavior;