-- Project #2 
-- David Morvay, Joey Pezzano, RJ Yarwood
-- Testbench

library IEEE;
use IEEE.std_logic_1164.all;

entity testbench1 is
end testbench1;

architecture behavior of testbench1 is
    signal CLK, Turn_On, Change : std_logic;
    signal Coin_In : std_logic_vector(4 downto 0);
    signal Soda : std_logic;
    signal Return_Change : std_logic_vector(4 downto 0);
    signal State : std_logic_vector(2 downto 0);
    component Machine is
        port(
            CLK, Turn_On, Change: in std_logic;
        	Coin_In : in std_logic_vector(4 downto 0);
			Soda : out std_logic;
            Return_Change : out std_logic_vector(4 downto 0);
        	State : out std_logic_vector(2 downto 0));
    end component;
begin
    process
    begin
    -- Set Inputs
       CLK <= '0';
       Turn_On <= '0';
       Coin_In <= "00000";
       Change <= '0';
      wait for 5 ns;
 --------------------------------------------------     
      CLK <= '1';
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Turn_On <= '1';
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 5 ns;
 --------------------------------------------------         
       CLK <= '0';
      wait for 2.5 ns;
 --------------------------------------------------         
      Coin_In <= "00101";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "001";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      wait for 2.5 ns;
 --------------------------------------------------         
      Coin_In <= "00000";
      wait for 2.5 ns;
 --------------------------------------------------        
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "001";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00101";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "011";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00000";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "011";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00101";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "111";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00000";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "01010";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "010";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "01010";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "100";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00000";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "111";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00101";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "001";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "01010";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "111";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00000";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      wait for 5 ns;
--------------------------------------------------        
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "01010";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "010";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00101";
      wait for 5 ns;
 --------------------------------------------------        
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "111";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00000";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00101";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "001";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00000";
      Change <= '1';
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "101";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Change <= '0';
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
  --------------------------------------------------        
      CLK <= '0';
      Coin_In <= "01010";
      wait for 5 ns;
 --------------------------------------------------         
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "010";
      wait for 2.5 ns;
 --------------------------------------------------         
      CLK <= '0';
      Coin_In <= "00000";
      Change <= '1';
      wait for 5 ns;
 --------------------------------------------------         
       CLK <= '1';
      wait for 2.5 ns;
      assert State = "110";
      wait for 2.5 ns;
  --------------------------------------------------        
      CLK <= '0';
      Change <= '0';
      wait for 5 ns;
  --------------------------------------------------        
      CLK <= '1';
      wait for 2.5 ns;
      assert State = "000";
      wait for 2.5 ns;
  --------------------------------------------------        
      CLK <= '0';
      wait;
      
      
end process;

u0: Machine port map (CLK, Turn_On, Change, Coin_In, Soda, Return_Change, State);
end behavior;