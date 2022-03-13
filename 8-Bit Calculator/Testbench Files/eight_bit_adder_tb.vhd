library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_adder_tb is
end eight_bit_adder_tb;

architecture testbench of eight_bit_adder_tb is
    -- Signals
    signal A, B : std_logic_vector(7 downto 0) := "00000000";
    signal Result : std_logic_vector(15 downto 0) := "0000000000000000";

    -- Components
    component eight_bit_adder is
        port (
            A, B : in std_logic_vector(7 downto 0);
        	Result : out std_logic_vector(15 downto 0)
            );
    end component;
begin
    DUT : eight_bit_adder port map (A, B, Result);

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
        -- Subtracting 7 + 5 = 12
        A <= "00000111";
        B <= "00000101";
        
        wait for 10 ns;
        
        -- Assert
        assert Result = "0000000000001100" report "Result should be 12";

        wait for 10 ns;
        -- Subtracting 20 + 10 = 30
        A <= "00010100";
        B <= "00001010";
        
        wait for 10 ns;
        
        -- Assert
        assert Result = "0000000000011110" report "Result should be 30";
        
        wait for 10 ns;
		-- Subtracting 20 + 10 = 30
        A <= "11111111";
        B <= "11111111";
        
        wait for 10 ns;
        
        -- Assert
        assert Result = "0000000111111110" report "Result should be 510";

        
        -- Declare that the test is finished
        report "* END OF TESTBENCH *";
        
        std.env.finish;
    end process;
end testbench;
