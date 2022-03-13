library IEEE;
use IEEE.std_logic_1164.all;

entity three_bit_adder_testbench is
end three_bit_adder_testbench;

architecture testbench of three_bit_adder_testbench is
    -- Signals
    signal A, B, Sum : std_logic_vector(2 downto 0) := "000";
    signal Cin, Cout : std_logic := '0';

    -- Components
    component three_bit_adder is
        port (
            A, B : in std_logic_vector(2 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(2 downto 0);
            Cout : out std_logic
        );
    end component;
begin
    DUT : three_bit_adder port map (
        A, B, Cin, Sum, Cout
    );

    process
    begin
    
   		report "* START OF TESTBENCH *";
        
        wait for 10 ns;

        -- Drive
        A <= "000";
        B <= "000";
        Cin <= '0';

        wait for 10 ns;

        -- Assert
        assert Sum = "000" report "Sum should be 0 when A=0, B=0, Cin=0";
        assert Cout = '0' report "Cout should be '0' when A=0, B=0, Cin=0";

        wait for 10 ns;
        
        -- Drive
        A <= "111";
        B <= "111";
        Cin <= '1';
        
        wait for 10 ns;
        
        -- Assert
        assert Sum = "111";
        assert Cout = '1';

        -- We'll complete more of this a different time.
        
        -- Declare that the test is finished
        report "* END OF TESTBENCH *";
        
        std.env.finish;
    end process;
end testbench;
