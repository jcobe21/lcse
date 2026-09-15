----------------------------------------------------------------------------------
-- Create Date: Sep. 2025
-- Module Name: Shift_Register - Behavioral
-----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister is
    Port ( Reset : in STD_LOGIC;
           D : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end ShiftRegister;

architecture Behavioral of ShiftRegister is
  -- Declaracion de las señales internas de la arquitectura
  signal reg : std_logic_vector (7 downto 0);
begin

process (Reset, Clk)
begin
  -- Implementación secuencial del funcionamiento del registro
    if  Reset = '0' then
        reg <= (others => '0');
    elsif clk'event and clk = '1'then
        if Enable = '1' then
            reg <= D & reg(7 downto 1);
        end if;
    end if;
end process;

-- Asignación de las salidas
Q <= reg;

end Behavioral;
