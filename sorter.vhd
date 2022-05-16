LIBRARY ieee;
USE     ieee.std_logic_1164.ALL;
USE     ieee.std_logic_arith.ALL;
USE     ieee.std_logic_unsigned.ALL;

ENTITY sorter IS
    PORT (
        clk         : IN std_logic;
        dir_of_sort : IN bit;
        new_set     : IN bit;
        reset       : IN bit;
        sort_en     : IN bit;
        in0         : IN bit_vector (2 DOWNTO 0);
        in1         : IN bit_vector (2 DOWNTO 0);
        in2         : IN bit_vector (2 DOWNTO 0);
        in3         : IN bit_vector (2 DOWNTO 0);
        in4         : IN bit_vector (2 DOWNTO 0);
        in5         : IN bit_vector (2 DOWNTO 0);
        in6         : IN bit_vector (2 DOWNTO 0);
        in7         : IN bit_vector (2 DOWNTO 0);
        out0        : INOUT bit_vector (2 DOWNTO 0);
        out1        : INOUT bit_vector (2 DOWNTO 0);
        out2        : INOUT bit_vector (2 DOWNTO 0);
        out3        : INOUT bit_vector (2 DOWNTO 0);
        out4        : INOUT bit_vector (2 DOWNTO 0);
        out5        : INOUT bit_vector (2 DOWNTO 0);
        out6        : INOUT bit_vector (2 DOWNTO 0);
        out7        : INOUT bit_vector (2 DOWNTO 0);
        sorted      : OUT bit
    );
END ENTITY sorter;

ARCHITECTURE sort OF sorter IS

    SIGNAL mux_even0 : bit_vector (2 DOWNTO 0);
    SIGNAL mux_even1 : bit_vector (2 DOWNTO 0);
    SIGNAL mux_even2 : bit_vector (2 DOWNTO 0);
    SIGNAL mux_even3 : bit_vector (2 DOWNTO 0);
    SIGNAL mux_even4 : bit_vector (2 DOWNTO 0);
    SIGNAL mux_even5 : bit_vector (2 DOWNTO 0);
    SIGNAL mux_even6 : bit_vector (2 DOWNTO 0);
    SIGNAL mux_even7 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd0 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd1 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd2 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd3 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd4 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd5 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd6 : bit_vector (2 DOWNTO 0);
    SIGNAL even_odd7 : bit_vector (2 DOWNTO 0);

COMPONENT even_sort IS
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
END COMPONENT even_sort;

COMPONENT new_sort IS
    PORT (
        new_set  : IN bit;
        reset    : IN bit;
        old_in0  : IN bit_vector (2 DOWNTO 0);
        old_in1  : IN bit_vector (2 DOWNTO 0);
        old_in2  : IN bit_vector (2 DOWNTO 0);
        old_in3  : IN bit_vector (2 DOWNTO 0);
        old_in4  : IN bit_vector (2 DOWNTO 0);
        old_in5  : IN bit_vector (2 DOWNTO 0);
        old_in6  : IN bit_vector (2 DOWNTO 0);
        old_in7  : IN bit_vector (2 DOWNTO 0);
        new_in0  : IN bit_vector (2 DOWNTO 0);
        new_in1  : IN bit_vector (2 DOWNTO 0);
        new_in2  : IN bit_vector (2 DOWNTO 0);
        new_in3  : IN bit_vector (2 DOWNTO 0);
        new_in4  : IN bit_vector (2 DOWNTO 0);
        new_in5  : IN bit_vector (2 DOWNTO 0);
        new_in6  : IN bit_vector (2 DOWNTO 0);
        new_in7  : IN bit_vector (2 DOWNTO 0);
        mux_out0 : OUT bit_vector (2 DOWNTO 0);
        mux_out1 : OUT bit_vector (2 DOWNTO 0);
        mux_out2 : OUT bit_vector (2 DOWNTO 0);
        mux_out3 : OUT bit_vector (2 DOWNTO 0);
        mux_out4 : OUT bit_vector (2 DOWNTO 0);
        mux_out5 : OUT bit_vector (2 DOWNTO 0);
        mux_out6 : OUT bit_vector (2 DOWNTO 0);
        mux_out7 : OUT bit_vector (2 DOWNTO 0)
    );
END COMPONENT new_sort;

COMPONENT odd_sort IS
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
END COMPONENT odd_sort;

COMPONENT sort_done IS
    PORT (
        dir_of_sort : IN bit;
        reset       : IN bit;
        sort_en     : IN bit;
        num0        : IN bit_vector (2 DOWNTO 0);
        num1        : IN bit_vector (2 DOWNTO 0);
        num2        : IN bit_vector (2 DOWNTO 0);
        num3        : IN bit_vector (2 DOWNTO 0);
        num4        : IN bit_vector (2 DOWNTO 0);
        num5        : IN bit_vector (2 DOWNTO 0);
        num6        : IN bit_vector (2 DOWNTO 0);
        num7        : IN bit_vector (2 DOWNTO 0);
        sorted      : OUT bit
    );
END COMPONENT sort_done;

BEGIN

es:even_sort
PORT MAP (clk, dir_of_sort, reset, mux_even0, mux_even1, mux_even2,
          mux_even3, mux_even4, mux_even5, mux_even6, mux_even7,
          even_odd0, even_odd1, even_odd2, even_odd3, even_odd4,
          even_odd5, even_odd6, even_odd7);

ns:new_sort
PORT MAP (new_set, reset, out0, out1, out2, out3, out4, out5, out6,
          out7, in0, in1, in2, in3, in4, in5, in6, in7, mux_even0,
          mux_even1, mux_even2, mux_even3, mux_even4, mux_even5,
          mux_even6, mux_even7);

os:odd_sort
PORT MAP (clk, dir_of_sort, reset, even_odd0, even_odd1, even_odd2,
          even_odd3, even_odd4, even_odd5, even_odd6, even_odd7, out0,
          out1, out2, out3, out4, out5, out6, out7);

sd:sort_done
PORT MAP (dir_of_sort, reset, sort_en, out0, out1, out2, out3, out4,
          out5, out6, out7, sorted);

END ARCHITECTURE sort;