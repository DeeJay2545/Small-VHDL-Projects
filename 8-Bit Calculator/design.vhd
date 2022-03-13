library ieee;
use ieee.std_logic_1164.all;

entity alu_cpu is
	port (
    	clk : in std_logic;
    	data_in : in std_logic_vector(7 downto 0);
        read_in_A, read_in_B, add, subtract, multiply, equal : in std_logic;
        data_out : out std_logic_vector(15 downto 0) := x"0000"
   	);
end alu_cpu;

architecture behavior of alu_cpu is
		
	component alu_with_registers is
    	port (
        	clk : in std_logic;
    		data_in : in std_logic_vector(7 downto 0);
    		operation : in std_logic_vector(1 downto 0);
    		read_in_A, read_in_B, read_in_data_out : in std_logic;
    		data_out : out std_logic_vector(15 downto 0) := x"0000"
        );
    end component;
    
    signal operation : std_logic_vector(1 downto 0);
    
begin

	alu_1: alu_with_registers port map (
    	clk, data_in, operation, read_in_A, read_in_B, equal, data_out
    );

	operation <=  "01" when add = '1' else -- Addition
    		      "10" when subtract = '1' else -- Subtraction
                  "11" when multiply = '1' else; -- Multiplication
            
end behavior;