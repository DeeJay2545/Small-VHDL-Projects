library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_adder is
    port (
        A, B : in std_logic_vector(7 downto 0);
        Result : out std_logic_vector(15 downto 0) := "0000000000000000"
        );
end eight_bit_adder;

architecture behavior of eight_bit_adder is
    -- Signals
  	signal Cout_Sig : std_logic_vector(6 downto 0);
  
    -- Components
    component full_adder is
        port (
            A, B, Cin : in std_logic;
        	Sum, Cout : out std_logic 
        );
    end component;
    -- Each entity type of component is only declared once
begin

	FA_1 : full_adder port map (A(0), B(0), '0', Result(0), Cout_Sig(0));
    FA_2 : full_adder port map (A(1), B(1), Cout_Sig(0), Result(1), Cout_Sig(1));
	FA_3 : full_adder port map (A(2), B(2), Cout_Sig(1), Result(2), Cout_Sig(2));
    FA_4 : full_adder port map (A(3), B(3), Cout_Sig(1), Result(3), Cout_Sig(3));
    FA_5 : full_adder port map (A(4), B(4), Cout_Sig(3), Result(4), Cout_Sig(4));
    FA_6 : full_adder port map (A(5), B(5), Cout_Sig(4), Result(5), Cout_Sig(5));
    FA_7 : full_adder port map (A(6), B(6), Cout_Sig(5), Result(6), Cout_Sig(6));
    FA_8 : full_adder port map (A(7), B(7), Cout_Sig(6), Result(7), Result(8));
    
end behavior;