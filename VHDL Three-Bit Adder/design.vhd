-- Import the IEEE library from the compiler/standard libraries.
-- By default, our working library is called `work`
library IEEE;

-- Import specific entities/constants/functions from a library
-- Since we have .all at the end, we are automatically importing everything from IEEE.std_logic_1164
-- Reference to the package: https://www.hdlworks.com/hdl_corner/vhdl_ref/VHDLContents/StdLogic1164.htm
-- Reference to the standard: https://en.wikipedia.org/wiki/IEEE_1164
use IEEE.std_logic_1164.all;

-- Now that we have imported the necessary files needed to specify logic values,
-- we can implement the half adder.

-- An entity is a black-box in our system design that can be used.
entity half_adder is

-- Since our entity is a black-box, we have to specify the ports for it.
-- There are four types of ports: in, out, buffer, inout.
-- in == An input to our entity
-- out == An output from our entity that CANNOT be read.
-- buffer == An output from our entity that CAN be read.
-- inout == A port that can be modified by external entities and this entity.
    port (

-- Ports
-- std_logic is a single bit value that adheres to IEEE 1164
        A : in std_logic;
        B : in std_logic;
--      A, B : in std_logic;
        Sum : out std_logic;
        Carry_out : out std_logic -- Last item in your port listing does not get a ;        
    );
-- Other things can be declared here, like constants, but we won't get into that now.

end half_adder;



-- Next we have to define our architecture
architecture name_of_the_architecture of half_adder is

-- Define signals or components inside of your design
-- but we have none

-- All concurrent logic will go after begin
begin

-- <= means concurrent assignment
-- = means conditional logic statement 
-- := means variable assingment or initialization
-- => mean port assignment
    Sum <= A xor B;
    Carry_out <= A and B;

-- When done
end name_of_the_architecture;
