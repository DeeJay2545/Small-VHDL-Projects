library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_mult is
    port (
        A, B : in std_logic_vector(7 downto 0);
        Result : out std_logic_vector(15 downto 0)
        );
end eight_bit_mult;

architecture behavior of eight_bit_mult is
    -- Signals
  	signal Sum1 : std_logic_vector(6 downto 0);
  	signal Carry1 : std_logic_vector(7 downto 0);
    
    signal Sum2 : std_logic_vector(6 downto 0);
    signal Carry2 : std_logic_vector(7 downto 0);
    
    signal Sum3 : std_logic_vector(6 downto 0);
    signal Carry3 : std_logic_vector(7 downto 0);
    
    signal Sum4 : std_logic_vector(6 downto 0);
    signal Carry4 : std_logic_vector(7 downto 0);
    
    signal Sum5 : std_logic_vector(6 downto 0);
    signal Carry5 : std_logic_vector(7 downto 0);
    
    signal Sum6 : std_logic_vector(6 downto 0);
    signal Carry6 : std_logic_vector(7 downto 0);
    
    signal Carry7 : std_logic_vector(6 downto 0);

    -- Components
    component full_adder_tr is
        port (
            X0, X1, Y0, Y1, Cin : in std_logic;
        	Result, Cout : out std_logic
        );
    end component;
    
    component full_adder_br is
        port (
            X, Y, S, Cin : in std_logic;
        	Result, Cout : out std_logic
        );
    end component;
    
    
    -- Each entity type of component is only declared once
begin
	Result(0) <= A(0) AND B(0) after 1 ps;
    
    r0c0 : full_adder_tr port map(A(0), A(1), B(0), B(1), '0', Result(1), Carry1(0));
    r0c1 : full_adder_tr port map(A(1), A(2), B(0), B(1), Carry1(0), Sum1(0), Carry1(1));
    r0c2 : full_adder_tr port map(A(2), A(3), B(0), B(1), Carry1(1), Sum1(1), Carry1(2));
    r0c3 : full_adder_tr port map(A(3), A(4), B(0), B(1), Carry1(2), Sum1(2), Carry1(3));
    r0c4 : full_adder_tr port map(A(4), A(5), B(0), B(1), Carry1(3), Sum1(3), Carry1(4));
    r0c5 : full_adder_tr port map(A(5), A(6), B(0), B(1), Carry1(4), Sum1(4), Carry1(5));
    r0c6 : full_adder_tr port map(A(6), A(7), B(0), B(1), Carry1(5), Sum1(5), Carry1(6));
    r0c7 : full_adder_tr port map(A(7), '0', B(0), B(1), Carry1(6), Sum1(6), Carry1(7));
    
    r1c0 : full_adder_br port map(A(0), B(2), Sum1(0), '0', Result(2), Carry2(0));
    r1c1 : full_adder_br port map(A(1), B(2), Sum1(1), Carry2(0), Sum2(0), Carry2(1));
    r1c2 : full_adder_br port map(A(2), B(2), Sum1(2), Carry2(1), Sum2(1), Carry2(2));
    r1c3 : full_adder_br port map(A(3), B(2), Sum1(3), Carry2(2), Sum2(2), Carry2(3));
    r1c4 : full_adder_br port map(A(4), B(2), Sum1(4), Carry2(3), Sum2(3), Carry2(4));
    r1c5 : full_adder_br port map(A(5), B(2), Sum1(5), Carry2(4), Sum2(4), Carry2(5));
    r1c6 : full_adder_br port map(A(6), B(2), Sum1(6), Carry2(5), Sum2(5), Carry2(6));
    r1c7 : full_adder_br port map(A(7), B(2), Carry1(7), Carry2(6), Sum2(6), Carry2(7));
    
    r2c0 : full_adder_br port map(A(0), B(3), Sum2(0), '0', Result(3), Carry3(0));
    r2c1 : full_adder_br port map(A(1), B(3), Sum2(1), Carry3(0), Sum3(0), Carry3(1));
    r2c2 : full_adder_br port map(A(2), B(3), Sum2(2), Carry3(1), Sum3(1), Carry3(2));
    r2c3 : full_adder_br port map(A(3), B(3), Sum2(3), Carry3(2), Sum3(2), Carry3(3));
    r2c4 : full_adder_br port map(A(4), B(3), Sum2(4), Carry3(3), Sum3(3), Carry3(4));
    r2c5 : full_adder_br port map(A(5), B(3), Sum2(5), Carry3(4), Sum3(4), Carry3(5));
    r2c6 : full_adder_br port map(A(6), B(3), Sum2(6), Carry3(5), Sum3(5), Carry3(6));
    r2c7 : full_adder_br port map(A(7), B(3), Carry2(7), Carry3(6), Sum3(6), Carry3(7));
    
    r3c0 : full_adder_br port map(A(0), B(4), Sum3(0), '0', Result(4), Carry4(0));
    r3c1 : full_adder_br port map(A(1), B(4), Sum3(1), Carry4(0), Sum4(0), Carry4(1));
    r3c2 : full_adder_br port map(A(2), B(4), Sum3(2), Carry4(1), Sum4(1), Carry4(2));
    r3c3 : full_adder_br port map(A(3), B(4), Sum3(3), Carry4(2), Sum4(2), Carry4(3));
    r3c4 : full_adder_br port map(A(4), B(4), Sum3(4), Carry4(3), Sum4(3), Carry4(4));
    r3c5 : full_adder_br port map(A(5), B(4), Sum3(5), Carry4(4), Sum4(4), Carry4(5));
    r3c6 : full_adder_br port map(A(6), B(4), Sum3(6), Carry4(5), Sum4(5), Carry4(6));
    r3c7 : full_adder_br port map(A(7), B(4), Carry3(7), Carry4(6), Sum4(6), Carry4(7));
    
    r4c0 : full_adder_br port map(A(0), B(5), Sum4(0), '0', Result(5), Carry5(0));
    r4c1 : full_adder_br port map(A(1), B(5), Sum4(1), Carry5(0), Sum5(0), Carry5(1));
    r4c2 : full_adder_br port map(A(2), B(5), Sum4(2), Carry5(1), Sum5(1), Carry5(2));
    r4c3 : full_adder_br port map(A(3), B(5), Sum4(3), Carry5(2), Sum5(2), Carry5(3));
    r4c4 : full_adder_br port map(A(4), B(5), Sum4(4), Carry5(3), Sum5(3), Carry5(4));
    r4c5 : full_adder_br port map(A(5), B(5), Sum4(5), Carry5(4), Sum5(4), Carry5(5));
    r4c6 : full_adder_br port map(A(6), B(5), Sum4(6), Carry5(5), Sum5(5), Carry5(6));
    r4c7 : full_adder_br port map(A(7), B(5), Carry4(7), Carry5(6), Sum5(6), Carry5(7));
    
    r5c0 : full_adder_br port map(A(0), B(6), Sum5(0), '0', Result(6), Carry6(0));
    r5c1 : full_adder_br port map(A(1), B(6), Sum5(1), Carry6(0), Sum6(0), Carry6(1));
    r5c2 : full_adder_br port map(A(2), B(6), Sum5(2), Carry6(1), Sum6(1), Carry6(2));
    r5c3 : full_adder_br port map(A(3), B(6), Sum5(3), Carry6(2), Sum6(2), Carry6(3));
    r5c4 : full_adder_br port map(A(4), B(6), Sum5(4), Carry6(3), Sum6(3), Carry6(4));
    r5c5 : full_adder_br port map(A(5), B(6), Sum5(5), Carry6(4), Sum6(4), Carry6(5));
    r5c6 : full_adder_br port map(A(6), B(6), Sum5(6), Carry6(5), Sum6(5), Carry6(6));
    r5c7 : full_adder_br port map(A(7), B(6), Carry5(7), Carry6(6), Sum6(6), Carry6(7));
    
    r6c0 : full_adder_br port map(A(0), B(7), Sum6(0), '0', Result(7), Carry7(0));
    r6c1 : full_adder_br port map(A(1), B(7), Sum6(1), Carry7(0), Result(8), Carry7(1));
    r6c2 : full_adder_br port map(A(2), B(7), Sum6(2), Carry7(1), Result(9), Carry7(2));
    r6c3 : full_adder_br port map(A(3), B(7), Sum6(3), Carry7(2), Result(10), Carry7(3));
    r6c4 : full_adder_br port map(A(4), B(7), Sum6(4), Carry7(3), Result(11), Carry7(4));
    r6c5 : full_adder_br port map(A(5), B(7), Sum6(5), Carry7(4), Result(12), Carry7(5));
    r6c6 : full_adder_br port map(A(6), B(7), Sum6(6), Carry7(5), Result(13), Carry7(6));
    r6c7 : full_adder_br port map(A(7), B(7), Carry6(7), Carry7(6), Result(14), Result(15));

end behavior;
    
    
    
    
    
    
    
    
    
    
    
    
    