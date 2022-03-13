library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_subtractor is
    port (
        A, B : in std_logic_vector(7 downto 0);
        Result : out std_logic_vector(15 downto 0) := "0000000000000000"
        );
end eight_bit_subtractor;

architecture behavior of eight_bit_subtractor is
    -- Signals
  	signal Bout_Sig : std_logic_vector(6 downto 0);
  
    -- Components
    component full_subtractor is
        port (
            A, B, Bin : in std_logic;
			Diff, Bout : out std_logic
        );
    end component;
    -- Each entity type of component is only declared once
begin

	FS_1 : full_subtractor port map (A(0), B(0), '0', Result(0), Bout_Sig(0));
    FS_2 : full_subtractor port map (A(1), B(1), Bout_Sig(0), Result(1), Bout_Sig(1));
	FS_3 : full_subtractor port map (A(2), B(2), Bout_Sig(1), Result(2), Bout_Sig(2));
    FS_4 : full_subtractor port map (A(3), B(3), Bout_Sig(1), Result(3), Bout_Sig(3));
    FS_5 : full_subtractor port map (A(4), B(4), Bout_Sig(3), Result(4), Bout_Sig(4));
    FS_6 : full_subtractor port map (A(5), B(5), Bout_Sig(4), Result(5), Bout_Sig(5));
    FS_7 : full_subtractor port map (A(6), B(6), Bout_Sig(5), Result(6), Bout_Sig(6));
    FS_8 : full_subtractor port map (A(7), B(7), Bout_Sig(6), Result(7), Result(8));
    
end behavior;