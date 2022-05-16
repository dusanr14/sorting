LIBRARY ieee;
USE     ieee.std_logic_1164.ALL;
USE     ieee.std_logic_arith.ALL;
USE     ieee.std_logic_unsigned.ALL;

ENTITY even_sort IS
    PORT (
        clk         : IN std_logic;
        dir_of_sort : IN bit;
        reset       : IN bit;
        even_in0    : IN bit_vector (2 DOWNTO 0);
        even_in1    : IN bit_vector (2 DOWNTO 0);
        even_in2    : IN bit_vector (2 DOWNTO 0);
        even_in3    : IN bit_vector (2 DOWNTO 0);
        even_in4    : IN bit_vector (2 DOWNTO 0);
        even_in5    : IN bit_vector (2 DOWNTO 0);
        even_in6    : IN bit_vector (2 DOWNTO 0);
        even_in7    : IN bit_vector (2 DOWNTO 0);
        even_out0   : OUT bit_vector (2 DOWNTO 0);
        even_out1   : OUT bit_vector (2 DOWNTO 0);
        even_out2   : OUT bit_vector (2 DOWNTO 0);
        even_out3   : OUT bit_vector (2 DOWNTO 0);
        even_out4   : OUT bit_vector (2 DOWNTO 0);
        even_out5   : OUT bit_vector (2 DOWNTO 0);
        even_out6   : OUT bit_vector (2 DOWNTO 0);
        even_out7   : OUT bit_vector (2 DOWNTO 0)
    );
END ENTITY even_sort;

ARCHITECTURE even_sorter OF even_sort IS

-- use this module to perform data comparison
COMPONENT comp IS
    PORT (
        clk : IN std_logic;
        dir_of_sort : IN bit;
        reset : IN bit;
        num0_in : IN bit_vector (2 DOWNTO 0);
        num1_in : IN bit_vector (2 DOWNTO 0);
        num0_out : OUT bit_vector (2 DOWNTO 0);
        num1_out : OUT bit_vector (2 DOWNTO 0)
        );
END COMPONENT comp;

BEGIN

-- sort data0 and data1
even_comp1:comp
PORT MAP (clk, dir_of_sort, reset, even_in0, even_in1, even_out0,
          even_out1);

-- sort data2 and data3
even_comp2:comp
PORT MAP (clk, dir_of_sort, reset, even_in2, even_in3, even_out2,
          even_out3);

-- sort data4 and data5
even_comp3:comp
PORT MAP (clk, dir_of_sort, reset, even_in4, even_in5, even_out4,
          even_out5);

-- sort data6 and data7
even_comp4:comp
PORT MAP (clk, dir_of_sort, reset, even_in6, even_in7, even_out6,
          even_out7);

END ARCHITECTURE even_sorter;