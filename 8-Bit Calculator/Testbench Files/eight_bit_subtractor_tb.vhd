library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_sub_tb is
end eight_bit_sub_tb;

architecture testbench of eight_bit_sub_tb is
    -- Signals
    signal A, B : std_logic_vector(7 downto 0) := "00000000";
    signal Result : std_logic_vector(15 downto 0) := "0000000000000000";

    -- Components
    component eight_bit_subtractor is
        port (
            A, B : in std_logic_vector(7 downto 0);
        	Result : out std_logic_vector(15 downto 0)
            );
    end component;
begin
    DUT : eight_bit_subtractor port map (A, B, Result);

    process
    begin
    
   		report "* START OF TESTBENCH *";
        
        wait for 10 ns;

        -- Drive
        A <= "00000000";
        B <= "00000000";

        wait for 10 ns;

        -- Assert
        assert Result = "0000000000000000" report "Result should be 0 when A=0, B=0";
        
        wait for 10 ns;
        -- Subtracting 7 - 3 = 4
        A <= "00000111";
        B <= "00000011";
        
        wait for 10 ns;
        
        -- Assert
        assert Result = "0000000000000100" report "Result should be 4";

        wait for 10 ns;
        
        -- Subtracting 15 - 5 = 10
        A <= "00001111";
        B <= "00000101";
        
        wait for 10 ns;
        
        -- Assert
        assert Result = "0000000000001010" report "Result should be 10";

        
        -- Declare that the test is finished
        report "* END OF TESTBENCH *";
        
        std.env.finish;
    end process;
end testbench;
