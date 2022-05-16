LIBRARY ieee;
USE     ieee.std_logic_1164.ALL;
USE     ieee.std_logic_arith.ALL;
USE     ieee.std_logic_unsigned.ALL;

ENTITY comp IS
    PORT (
        clk         : IN std_logic;
        dir_of_sort : IN bit;
        reset       : IN bit;
        num0_in     : IN bit_vector (2 DOWNTO 0);
        num1_in     : IN bit_vector (2 DOWNTO 0);
        num0_out    : OUT bit_vector (2 DOWNTO 0);
        num1_out    : OUT bit_vector (2 DOWNTO 0)
    );
END ENTITY comp;

ARCHITECTURE compare OF comp IS
BEGIN
    PROCESS (reset, clk)
    BEGIN

        -- reset everything to '0' when reset is asserted
        IF (reset = '1') THEN
            num0_out <= (OTHERS => '0');
            num1_out <= (OTHERS => '0');
        -- the flip-flops are sensitive to the rising edge of clk
        ELSIF (rising_edge (clk)) THEN
            CASE dir_of_sort IS
            -- direction of sort is ascending
            WHEN '1' =>
                -- num0_in is greater than num1_in, so switch them
                IF (num0_in > num1_in) THEN
                    num0_out <= num1_in;
                    num1_out <= num0_in;
                -- num0_in and num1_in are in order
                ELSE
                    num0_out <= num0_in;
                    num1_out <= num1_in;
                END IF;

            -- direction of sort is descending
            WHEN '0' =>
                -- num0_in is less than num1_in, so switch them
                IF (num0_in < num1_in) THEN
                    num0_out <= num1_in;
                    num1_out <= num0_in;
                -- num0_in and num1_in are in order
                ELSE
                    num0_out <= num0_in;
                    num1_out <= num1_in;
                END IF;
            END CASE;
        END IF;
    END PROCESS;
END ARCHITECTURE compare;