library ieee;
use ieee.std_logic_1164.all;


entity alu is
  port (
    A, B : in std_logic_vector(7 downto 0);
    operation : in std_logic_vector(1 downto 0);
    Result : out std_logic_vector(15 downto 0) := "0000000000000000"
  );
end alu;


architecture behavior of alu is
	signal Result_multiplication, Result_addition, Result_subtraction : std_logic_vector(15 downto 0) := "0000000000000000";

  component eight_bit_mult is
    port (
      	A, B : in std_logic_vector(7 downto 0);
        Result : out std_logic_vector(15 downto 0)
    );
  end component;

  component eight_bit_adder is
    port (
      	A, B : in std_logic_vector(7 downto 0);
        Result : out std_logic_vector(15 downto 0) := "0000000000000000"
    );
  end component;
  
  component eight_bit_subtractor is
    port (
      	A, B : in std_logic_vector(7 downto 0);
        Result : out std_logic_vector(15 downto 0) := "0000000000000000"
    );
  end component;
  
begin

	u0: eight_bit_mult port map (
    	A, B, Result_multiplication
    );
    
    u1: eight_bit_adder port map (
    	A, B, Result_addition
    );
    
    u2: eight_bit_subtractor port map (
    	A, B, Result_subtraction
    );
    
    Result <= x"0000" when operation = "00" else -- reset to zero
    		   Result_addition when operation = "01" else -- addition
               Result_subtraction when operation = "10" else -- addition
               Result_multiplication when operation = "11"; -- multiply

end behavior;