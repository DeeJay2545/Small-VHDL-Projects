-- David Morvay
-- October 25, 2019
-- ICA #2
-- 8 Bit Accumulator

-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbenchACC is
end testbenchACC;

architecture behavior of testbenchACC is
    signal Ad, Ld, K, Cin : std_logic := '0';
    signal Yi : std_logic_vector(7 downto 0) := "00000000";
    signal CLK : std_logic := '0';
    signal Cout : std_logic_vector(7 downto 0) := "00000000";
    signal Xi : std_logic_vector(7 downto 0) := "00000000";
    signal Yi0 : std_logic;
    component ACC_8 is
        port(
            Ad, Ld, K, Cin : in std_logic;
            Yi : in std_logic_vector(7 downto 0);
            CLK : in std_logic;
        	Cout : out std_logic_vector(7 downto 0);
            Xi : out std_logic_vector(7 downto 0);
            Yi0 : out std_logic);
    end component;
begin
    process
    begin
    -- Set Inputs
       -- Set for addition
       CLK <= '0';
       Cin <= '0';
      wait for 1 ns;
      
      -- Set initial value of 32 
      Yi <= "00100000";
      wait for 0.5 ns;
      
      Ld <= '1';
      wait for 0.5 ns;
     
      CLK <= '1'; 
      wait for 1 ns; 
      
      assert Xi = "00100000";
      wait for 1 ns;
      
      -- Turn load off and add next number of 6 (Total 38)
      CLK <= '0';
      Ld <= '0';
      Yi <= "00000110";
      wait for 1 ns;
      
      Ad <= '1';
      wait for 1 ns;
 
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00100110";
      wait for 1 ns;
     
     -- Add next number of 10 (Total 48)
      CLK <= '0';
     Yi <= "00001010";
      wait for 2 ns;
      
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00110000";
      wait for 1 ns;
      
      -- Add next numnber 6 (Total 54)
      CLK <= '0';
      Yi <= "00000110";
      wait for 2 ns;
      
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00110110";
      wait for 1 ns;
      
      -- Add next number 8 (Total 62)
      CLK <= '0';
      Yi <= "00001000";
      wait for 2 ns;
      
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00111110";
      wait for 1 ns;
      
      -- Turn on subtraction function and subtract 5 (total 57)
      CLK <= '0';
      Yi <= "00000101";
      Cin <= '1';
      wait for 2 ns;
      
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00111001";
      wait for 1 ns;
      
      -- Subtract 8 (49)
      CLK <= '0';
      Yi <= "00001000";
      wait for 2 ns;
      
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00110001";
      wait for 1 ns;
      
      -- Subtract 11 (38)
      Yi <= "00001011";
      CLK <= '0';
      wait for 2 ns;
      
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00100110";
      wait for 1 ns;
      
      -- Subtract 17 (21)
      CLK <= '0';
      Yi <= "00010001";
      wait for 2 ns;
      
      CLK <= '1';
      wait for 1 ns;
      
      assert Xi = "00010101";
      wait for 1 ns;
      
      CLK <= '0';
      wait;
      
        -- End simulation
    end process;

u0: ACC_8 port map (Ad, Ld, K, Cin, Yi, CLK, Cout, Xi, Yi0);
end behavior;