library ieee;
use ieee.std_logic_1164.all;

entity alu_cpu_testbench is
end alu_cpu_testbench;

architecture testbench of alu_cpu_testbench is
	component alu_cpu is
    port (
    	clk : in std_logic;
    	data_in : in std_logic_vector(7 downto 0);
        read_in_A, read_in_B, add, subtract, multiply, equal : in std_logic;
        data_out : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal data_in : std_logic_vector(7 downto 0);
    signal read_in_A, read_in_B, clk, add, subtract, multiply, equal : std_logic;
    signal data_out : std_logic_vector(15 downto 0);
begin

	DUT_CPU: alu_cpu port map (
    	clk, data_in, read_in_A, read_in_B, add, subtract, multiply, equal, data_out
    );
    
	process
    begin
    
    	report "* START OF TESTBENCH *";
    
    	--First Cycle - Report all zeros
        clk <= '0';
    	data_in <= x"00";
        add <= '1';
        subtract <= '0';
        multiply <= '0';
        equal <= '0';
        read_in_A <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        read_in_A <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_A <= '0';
        wait for 10 ns;
        
        read_in_B <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        equal <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"0000";
        wait for 5 ns;
        
        clk <= '0';
        equal <= '0';
        wait for 10 ns;
        
        
        --Second Cycle - Add 151 + 199
        -- Answer should = 
        clk <= '0';
    	data_in <= x"00";
        add <= '1';
        read_in_A <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        read_in_A <= '1';
        data_in <= x"97";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_A <= '0';
        wait for 10 ns;
        
        read_in_B <= '1';
        data_in <= x"C7";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        equal <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"015E";
        wait for 5 ns;
        
        clk <= '0';
        equal <= '0';
        wait for 10 ns;
        
        
         --Third Cycle - Subtract 245 - 177
        -- Answer should = 68
        clk <= '0';
    	data_in <= x"00";
        subtract <= '1';
        add <= '0';
        read_in_A <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        read_in_A <= '1';
        data_in <= x"F5";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_A <= '0';
        wait for 10 ns;
        
        read_in_B <= '1';
        data_in <= x"B1";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        equal <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"0044";
        wait for 5 ns;
        
        clk <= '0';
        equal <= '0';
        wait for 10 ns;
        
        --Fourth Cycle - Multiply 225 * 232
        -- Answer should = 52200
        clk <= '0';
    	data_in <= x"00";
        subtract <= '0';
        multiply <= '1';
        read_in_A <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        read_in_A <= '1';
        data_in <= x"E1";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_A <= '0';
        wait for 10 ns;
        
        read_in_B <= '1';
        data_in <= x"E8";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        equal <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"CBE8";
        wait for 5 ns;
        
        clk <= '0';
        equal <= '0';
        wait for 10 ns;
        
        report "* END OF TESTBENCH *";
    
    	std.env.finish;
    end process;

end testbench;