library ieee;
use ieee.std_logic_1164.all;

entity alu_testbench is
end alu_testbench;


architecture testbench of alu_testbench is

	component alu is
    	port (
        	A, B : in std_logic_vector(7 downto 0);
    		operation : in std_logic_vector(1 downto 0);
    		Result : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal A, B : std_logic_vector(7 downto 0);
    signal Result : std_logic_vector(15 downto 0);
    signal operation : std_logic_vector(1 downto 0);

begin

	DUT: alu port map (
    	A, B, operation, Result
    );
    
    process
    begin
    
    	report "* START OF TESTBENCH *";
    
    	--Drive
    	A <= x"00";
        B <= x"00";
        operation <= "00";
        
        wait for 10 ns;
        
        --Assert
        assert Result = x"0000" report "Expected x0000 but got " & to_hstring(Result); -- ZERO
        
        wait for 10 ns;
        
        --Drive
    	A <= x"19"; -- 25
        B <= x"4E"; -- 78
        operation <= "01"; -- Add
        
        wait for 10 ns;
        
        --Assert
        assert Result = x"0067" report "Expected x67 but got " & to_hstring(Result); -- 103
        
        wait for 10 ns;
        
        --Drive
    	A <= x"64"; -- 100
        B <= x"24"; -- 36
        operation <= "10"; -- subtract
        
        wait for 10 ns;
        
        --Assert
        assert Result = x"0040" report "Expected x0040 but got " & to_hstring(Result); -- 64 
        
        wait for 10 ns;
        
        --Drive
    	A <= x"7A"; -- 122
        B <= x"9C"; -- 156
        operation <= "11"; -- multiply
        
        wait for 10 ns;
        
        --Assert
        assert Result = x"4A58" report "Expected 4A58 but got " & to_hstring(Result); -- 19032
        
        wait for 10 ns;
        
        report "* END OF TESTBENCH *";
    
    	std.env.finish;
    end process;


end testbench;