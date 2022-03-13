library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder_test_bench is
end half_adder_test_bench;

architecture test_bench of half_adder_test_bench is
    signal A, B, Sum, Carry_out : std_logic := '0';
    component half_adder is
        port (
            A : in std_logic;
            B : in std_logic;
            Sum : out std_logic;
            Carry_out : out std_logic
        );
    end component;
    -- VHDL is case insensitive
begin
    dut: half_adder port map (
        A,
        B,
        Sum,
        Carry_out
    );

    process
    begin
        report "* START OF TESTBENCH *";
        
        wait for 10 ns;
        A <= '0';
        B <= '0';
        
        wait for 10 ns;
        assert Sum = '0' report "Sum should be 0 when A = 0 and B = 0";
        assert Carry_out = '0';

        wait for 10 ns;
        A <= '0';
        B <= '1';

        wait for 10 ns;
        assert Sum = '1';
        assert Carry_out = '0';

        wait for 10 ns;
        A <= '1';
        B <= '0';

        wait for 10 ns;
        assert Sum = '1';
        assert Carry_out = '0';

        wait for 10 ns;
        A <= '1';
        B <= '1';

        wait for 10 ns;
        assert Sum = '0' report "Sum should be 0 when A = 1 and B = 1";
        assert Carry_out = '1';

        wait for 10 ns;
        A <= '0';
        B <= '0';

        wait for 10 ns;
        assert Sum = '0';
        assert Carry_out = '0';
        
        report "* END OF TESTBENCH *";

        -- Declare that the test is finished
        std.env.finish;
    end process;
end test_bench;
