library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_test_bench is
end full_adder_test_bench;

architecture testbench of full_adder_test_bench is
    -- Signals
    signal A, B, Cin, Sum, Cout : std_logic := '0';

    -- Components
    component full_adder is
        port (
            A, B, Cin : in std_logic;
            Sum, Cout : out std_logic
        );
    end component;
begin
    DUT : full_adder port map (
        A, B, Cin, Sum, Cout
    );

    process
    begin
        wait for 10 ns;

        -- Drive
        A <= '0';
        B <= '0';
        Cin <= '0';

        wait for 10 ns;

        -- Assert
        assert Sum = '0' report "Sum should be '0' when A=0, B=0, Cin=0";
        assert Cout = '0' report "Cout should be '0' when A=0, B=0, Cin=0";

        wait for 10 ns;

        -- Drive
        A <= '0';
        B <= '0';
        Cin <= '1';

        wait for 10 ns;

        -- Assert
        assert Sum = '1' report "Sum should be '1' when A=0, B=0, Cin=1";
        assert Cout = '0' report "Cout should be '0' when A=0, B=0, Cin=1";

        -- Quiz, finish this
     std.env.finish;
    end process;
end testbench;


    