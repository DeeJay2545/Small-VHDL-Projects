library IEEE;
use IEEE.std_logic_1164.all;

entity three_bit_adder is
    port (
        A, B : in std_logic_vector(2 downto 0);
        Cin : in std_logic;
        Sum : out std_logic_vector(2 downto 0);
        Cout : out std_logic
    );
end three_bit_adder;

architecture behavior of three_bit_adder is
    -- Signals
    signal CoutS : std_logic_vector(2 downto 0) := "000";

    -- Components
    component full_adder is
        port (
            A, B, Cin : in std_logic;
        	Sum, Cout : out std_logic 
        );
    end component;
    -- Each entity type of component is only declared once
begin
    -- concurrent statements
	Cout <= CoutS(2) after 1 ps;
    -- component port maps
    FA_1 : full_adder port map (
        A(0),
        B(0),
        Cin,
        Sum(0),
        CoutS(0)
    );
    
    FA_2 : full_adder port map (
        A(1),
        B(1),
        CoutS(0),
        Sum(1),
        CoutS(1)
    );

 	FA_3 : full_adder port map (
        A(2),
        B(2),
        CoutS(1),
        Sum(2),
        CoutS(2)
    );
    
end behavior;
