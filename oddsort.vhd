LIBRARY ieee;
USE     ieee.std_logic_1164.ALL;
USE     ieee.std_logic_arith.ALL;
USE     ieee.std_logic_unsigned.ALL;

ENTITY odd_sort IS
    PORT (
        clk         : IN std_logic;
        dir_of_sort : IN bit;
        reset       : IN bit;
        odd_in0     : IN bit_vector (2 DOWNTO 0);
        odd_in1     : IN bit_vector (2 DOWNTO 0);
        odd_in2     : IN bit_vector (2 DOWNTO 0);
        odd_in3     : IN bit_vector (2 DOWNTO 0);
        odd_in4     : IN bit_vector (2 DOWNTO 0);
        odd_in5     : IN bit_vector (2 DOWNTO 0);
        odd_in6     : IN bit_vector (2 DOWNTO 0);
        odd_in7     : IN bit_vector (2 DOWNTO 0);
        odd_out0    : OUT bit_vector (2 DOWNTO 0);
        odd_out1    : OUT bit_vector (2 DOWNTO 0);
        odd_out2    : OUT bit_vector (2 DOWNTO 0);
        odd_out3    : OUT bit_vector (2 DOWNTO 0);
        odd_out4    : OUT bit_vector (2 DOWNTO 0);
        odd_out5    : OUT bit_vector (2 DOWNTO 0);
        odd_out6    : OUT bit_vector (2 DOWNTO 0);
        odd_out7    : OUT bit_vector (2 DOWNTO 0)
    );
END ENTITY odd_sort;

ARCHITECTURE odd_sorter OF odd_sort IS

-- use this module to perform data comparison
COMPONENT comp IS
    PORT (
        clk         : IN std_logic;
        dir_of_sort : IN bit;
        reset       : IN bit;
        num0_in     : IN bit_vector (2 DOWNTO 0);
        num1_in     : IN bit_vector (2 DOWNTO 0);
        num0_out    : OUT bit_vector (2 DOWNTO 0);
        num1_out    : OUT bit_vector (2 DOWNTO 0)
    );
END COMPONENT comp;

BEGIN
    PROCESS (reset, clk)
    BEGIN
        -- reset everything to '0' if reset is asserted
        IF (reset = '1') THEN
            odd_out0 <= (OTHERS => '0');
            odd_out7 <= (OTHERS => '0');
        -- send data0 and data7 straight through
        ELSIF (rising_edge (clk)) THEN
            odd_out0 <= odd_in0;
            odd_out7 <= odd_in7;
        END IF;
    END PROCESS;

-- sort data1 and data2
odd_comp1:comp
PORT MAP (clk, dir_of_sort, reset, odd_in1, odd_in2, odd_out1,
          odd_out2);

-- sort data3 and data4
odd_comp2:comp
PORT MAP (clk, dir_of_sort, reset, odd_in3, odd_in4, odd_out3,
          odd_out4);

-- sort data5 and data6
odd_comp3:comp
PORT MAP (clk, dir_of_sort, reset, odd_in5, odd_in6, odd_out5,
          odd_out6);

END ARCHITECTURE odd_sorter;