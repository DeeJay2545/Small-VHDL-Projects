library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port (
        A, B, Cin : in std_logic;
        Sum, Cout : out std_logic
    );
end full_adder;

architecture behavior of full_adder is
    -- Signals
    signal HA_1_S_TO_HA_2_A, HA_1_Cout, HA_2_Cout : std_logic := '0';

    -- Components
    component half_adder is
        port (
            A : in std_logic;
            B : in std_logic;
            Sum : out std_logic;
            Carry_out : out std_logic    
        );
    end component;
    -- Each entity type of component is only declared once
begin
    -- concurrent statements

    -- component port maps
    HA_1 : half_adder port map (
        A,
        B,
        HA_1_S_TO_HA_2_A,
        HA_1_Cout
    );
    
    HA_2 : half_adder port map (
        HA_1_S_TO_HA_2_A,
        Cin,
        Sum,
        HA_2_Cout
    );

    Cout <= HA_1_Cout or HA_2_Cout;
end behavior;
