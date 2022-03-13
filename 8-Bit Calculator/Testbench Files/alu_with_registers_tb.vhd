library ieee;
use ieee.std_logic_1164.all;

entity alu_with_registers_tb is
end alu_with_registers_tb;


architecture testbench of alu_with_registers_tb is

component alu_with_registers is
  port (
  	clk : in std_logic;
    data_in : in std_logic_vector(7 downto 0);
    operation : in std_logic_vector(1 downto 0);
    read_in_A, read_in_B, read_in_data_out : in std_logic;
    data_out : out std_logic_vector(15 downto 0)
  );
end component;
    
    signal data_in : std_logic_vector(7 downto 0);
    signal data_out : std_logic_vector(15 downto 0);
    signal operation : std_logic_vector(1 downto 0);
    signal clk, read_in_A, read_in_B, read_in_data_out : std_logic;

begin

	DUT: alu_with_registers port map (
    	clk, data_in, operation, read_in_A, read_in_B, read_in_data_out, data_out
    );
    
    process
    begin
    
    	report "* START OF TESTBENCH *";
    
    	--First Cycle - Report all zeros
        clk <= '0';
    	data_in <= x"00";
        operation <= "01";
        read_in_A <= '0';
        read_in_B <= '0';
        read_in_data_out <= '0';
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
        
        read_in_data_out <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"0000";
        wait for 5 ns;
        
        clk <= '0';
        read_in_data_out <= '0';
        wait for 10 ns;
        
        
        --Second Cycle - Add 101 + 217
        -- Answer should = 399
        clk <= '0';
    	data_in <= x"00";
        operation <= "01";
        read_in_A <= '0';
        read_in_B <= '0';
        read_in_data_out <= '0';
        wait for 10 ns;
        
        read_in_A <= '1';
        data_in <= x"65";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_A <= '0';
        wait for 10 ns;
        
        read_in_B <= '1';
        data_in <= x"D9";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        read_in_data_out <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"013E";
        wait for 5 ns;
        
        clk <= '0';
        read_in_data_out <= '0';
        wait for 10 ns;
        
        
         --Third Cycle - Subtract 189 - 145
        -- Answer should = 44
        clk <= '0';
    	data_in <= x"00";
        operation <= "10";
        read_in_A <= '0';
        read_in_B <= '0';
        read_in_data_out <= '0';
        wait for 10 ns;
        
        read_in_A <= '1';
        data_in <= x"BD";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_A <= '0';
        wait for 10 ns;
        
        read_in_B <= '1';
        data_in <= x"91";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        read_in_data_out <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"002C";
        wait for 5 ns;
        
        clk <= '0';
        read_in_data_out <= '0';
        wait for 10 ns;
        
        --Fourth Cycle - Multiply 23 * 216
        -- Answer should = 4,968
        clk <= '0';
    	data_in <= x"00";
        operation <= "11";
        read_in_A <= '0';
        read_in_B <= '0';
        read_in_data_out <= '0';
        wait for 10 ns;
        
        read_in_A <= '1';
        data_in <= x"17";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_A <= '0';
        wait for 10 ns;
        
        read_in_B <= '1';
        data_in <= x"D8";
        wait for 10 ns;
        
        clk <= '1';
        wait for 10 ns;
        
        clk <= '0';
        read_in_B <= '0';
        wait for 10 ns;
        
        read_in_data_out <= '1';
        wait for 10 ns;
        
        clk <= '1';
        wait for 5 ns;
        
        --Assert
        assert data_out = x"1368";
        wait for 5 ns;
        
        clk <= '0';
        read_in_data_out <= '0';
        wait for 10 ns;
        
        report "* END OF TESTBENCH *";
    
    	std.env.finish;
    end process;


end testbench;