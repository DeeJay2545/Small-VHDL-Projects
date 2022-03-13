-- Project #2 
-- David Morvay, Joey Pezzano, RJ Yarwood
-- Design File

library IEEE;
use IEEE.std_logic_1164.all;

entity Machine is
    port (
        CLK, Turn_On, Change: in std_logic;
        Coin_In : in std_logic_vector(4 downto 0);
		Soda : out std_logic;
        Return_Change : out std_logic_vector(4 downto 0);
        State : out std_logic_vector(2 downto 0));
end Machine;

architecture behavior of Machine is
component A_Bit is
        port(
        	A, B, C, CLK, Change: in std_logic;
        	Five, Ten : in std_logic;
			Q : out std_logic
            );         
    end component;
------------------------------------    
component B_Bit is
        port(
            A, B, C, CLK, Change : in std_logic;
        	Five, Ten : in std_logic;
			Q : out std_logic);
    end component;
-------------------------------------    
component C_Bit is
        port(
            A, B, C, CLK, Change : in std_logic;
        	Five, Ten : in std_logic;
			Q : out std_logic);
    end component;
---------------------------------------
component Set_Function is
        port(
			A, B, C, Turn_On : in std_logic;
      		AO, BO, CO : out std_logic);
            end component;
---------------------------------------
signal QA, QB, QC, QA1, QB1, QC1, Five, Ten, Input_Check, Extra_Change : std_logic;
signal Change_Out : std_logic_vector(4 downto 0) := "00000";
begin
--- Determine State
State(0) <= QC1;
State(1) <= QB1;
State(2) <= QA1;
-- Determine Coin Input
Five <= (Coin_In(0) AND (NOT Coin_In(1)) AND Coin_In(2) AND (NOT Coin_In(3)) AND (NOT Coin_In(4)));
Ten <= ((NOT Coin_In(0)) AND Coin_In(1) AND (NOT Coin_In(2)) AND Coin_In(3) AND (NOT Coin_In(4)));
-- Dispense Soda
Soda <= QA1 AND QB1 AND QC1 after 1 ps;
-- Wrong inputs + Dispense Chnage
Input_Check <= Five NOR Ten after 1 ps;
Extra_Change <= ((NOT QA1) AND (NOT QB1) AND QC1) OR ((NOT QA1) AND QB1 AND (NOT QC1)) OR ((NOT QA1) AND QB1 AND QC1) after 1 ps;
Change_Out(0) <= (Input_Check AND Coin_In(0)) OR ((NOT Input_Check) AND ((QA1 AND (NOT QB1) AND (NOT QC1)) OR (QA1 AND (NOT QB1) AND QC1))) OR (Change AND Extra_Change AND Coin_In(0)) OR (Input_Check AND ((QA1 AND (NOT QB1) AND (NOT QC1)) OR (QA1 AND (NOT QB1) AND QC1))) after 1 ps;
Change_Out(1) <= (Input_Check AND Coin_In(1)) OR ((NOT Input_Check) AND (QA1 AND QB1 AND (NOT QC1))) OR (Change AND Extra_Change AND Coin_In(1)) OR (Input_Check AND (QA1 AND QB1 AND (NOT QC1))) after 1 ps;
Change_Out(2) <= (Input_Check AND Coin_In(2)) OR ((NOT Input_Check) AND ((QA1 AND (NOT QB1) AND (NOT QC1)) OR (QA1 AND (NOT QB1) AND QC1))) OR (Change AND Extra_Change AND Coin_In(2)) OR (Input_Check AND ((QA1 AND (NOT QB1) AND (NOT QC1)) OR (QA1 AND (NOT QB1) AND QC1))) after 1 ps;
Change_Out(3) <= (Input_Check AND Coin_In(3)) OR ((NOT Input_Check) AND (QA1 AND QB1 AND (NOT QC1))) OR (Change AND Extra_Change AND Coin_In(3)) OR (Input_Check AND (QA1 AND QB1 AND (NOT QC1))) after 1 ps;
Change_Out(4) <= (Input_Check AND Coin_In(4)) OR (Change AND Extra_Change AND Coin_In(4)) after 1 ps;
--- Determine Change
Return_Change(0) <= Change_Out(0);
Return_Change(1) <= Change_Out(1);
Return_Change(2) <= Change_Out(2);
Return_Change(3) <= Change_Out(3);
Return_Change(4) <= Change_Out(4);

S0: Set_Function port map(QA, QB, QC, Turn_On, QA1, QB1, QC1);
Bit0: A_Bit port map(QA1, QB1, QC1, CLK, Change, Five, Ten, QA);
Bit1: B_Bit port map(QA1, QB1, QC1, CLK, Change, Five, Ten, QB);
Bit2: C_Bit port map(QA1, QB1, QC1, CLK, Change, Five, Ten, QC);

end behavior;