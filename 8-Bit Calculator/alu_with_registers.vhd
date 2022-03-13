library ieee;
use ieee.std_logic_1164.all;

entity alu_with_registers is
  port (
  	clk : in std_logic;
    data_in : in std_logic_vector(7 downto 0);
    operation : in std_logic_vector(1 downto 0);
    read_in_A, read_in_B, read_in_data_out : in std_logic;
    data_out : out std_logic_vector(15 downto 0) := "0000000000000000"
  );
end alu_with_registers;

architecture behavior of alu_with_registers is

	component alu is
    	port (
        	A, B : in std_logic_vector(7 downto 0);
    		operation : in std_logic_vector(1 downto 0);
    		Result : out std_logic_vector(15 downto 0) := "0000000000000000"
        );
    end component;
    
    signal A, B : std_logic_vector(7 downto 0);
    signal Result : std_logic_vector(15 downto 0);

begin

	alu_0: alu port map (
    	A, B, operation, Result
    );
    
    process(clk)
    begin
    	if rising_edge(clk) then
        	if read_in_A = '1' then
            	A <= data_in;
            end if;
            if read_in_B = '1' then
            	B <= data_in;
            end if;
            if read_in_data_out = '1' then
            	data_out <= Result;
            end if;
        end if;
    end process;


end behavior;