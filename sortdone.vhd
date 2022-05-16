LIBRARY ieee;
USE     ieee.std_logic_1164.ALL;
USE     ieee.std_logic_arith.ALL;
USE     ieee.std_logic_unsigned.ALL;

ENTITY sort_done IS
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
END ENTITY sort_done;

ARCHITECTURE verify OF sort_done IS
BEGIN
    PROCESS (reset, dir_of_sort, sort_en, num0, num1, num2, num3, num4,
             num5, num6, num7)
    BEGIN
        IF (reset = '1') THEN
            sorted <= '0';
        ELSE
            CASE dir_of_sort IS
            -- direction of sort is ascending (num0 = min, num7 = max),
            -- so check to see if all inputs are in desired order;
            -- assert sorted if sort_en is asserted and all numbers are
            -- in order
            WHEN '1' =>
                IF (sort_en = '1' AND num0 <= num1 AND num1 <= num2 AND
                    num2 <= num3 AND num3 <= num4 AND num4 <= num5 AND
                    num5 <= num6 AND num6 <= num7) THEN

                    sorted <= '1';
                ELSE
                    sorted <= '0';
                END IF;

            -- direction of sort is descending (num0 = max, num7 = min),
            -- so check to see if all inputs are in desired order;
            -- assert sorted if sort_en is asserted and all numbers are
            -- in order
            WHEN '0' =>
                IF (sort_en = '1' AND num0 >= num1 AND num1 >= num2 AND
                    num2 >= num3 AND num3 >= num4 AND num4 >= num5 AND
                    num5 >= num6 AND num6 >= num7) THEN

                    sorted <= '1';
                ELSE
                    sorted <= '0';
                END IF;
            END CASE;
        END IF;
    END PROCESS;
END ARCHITECTURE verify;