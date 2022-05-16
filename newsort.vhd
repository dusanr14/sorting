LIBRARY ieee;
USE     ieee.std_logic_1164.ALL;
USE     ieee.std_logic_arith.ALL;
USE     ieee.std_logic_unsigned.ALL;

ENTITY new_sort IS
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
END ENTITY new_sort;

ARCHITECTURE mux OF new_sort IS
BEGIN
    PROCESS (reset, new_set, new_in0, new_in1, new_in2, new_in3, new_in4,
             new_in5, new_in6, new_in7, old_in0, old_in1, old_in2,
             old_in3, old_in4, old_in5, old_in6, old_in7)
    BEGIN
        -- reset everything to '0' when reset is asserted
        IF (reset = '1') THEN
            mux_out0 <= (OTHERS => '0');
            mux_out1 <= (OTHERS => '0');
            mux_out2 <= (OTHERS => '0');
            mux_out3 <= (OTHERS => '0');
            mux_out4 <= (OTHERS => '0');
            mux_out5 <= (OTHERS => '0');
            mux_out6 <= (OTHERS => '0');
            mux_out7 <= (OTHERS => '0');
        ELSE
            -- if new_set is asserted, the mux output should contain the
            -- new set of data
            IF (new_set = '1') THEN
                mux_out0 <= new_in0;
                mux_out1 <= new_in1;
                mux_out2 <= new_in2;
                mux_out3 <= new_in3;
                mux_out4 <= new_in4;
                mux_out5 <= new_in5;
                mux_out6 <= new_in6;
                mux_out7 <= new_in7;
            -- otherwise, let the old data coming out of odd sort through
            ELSE
                mux_out0 <= old_in0;
                mux_out1 <= old_in1;
                mux_out2 <= old_in2;
                mux_out3 <= old_in3;
                mux_out4 <= old_in4;
                mux_out5 <= old_in5;
                mux_out6 <= old_in6;
                mux_out7 <= old_in7;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE mux;