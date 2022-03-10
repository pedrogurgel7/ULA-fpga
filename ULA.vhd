--
-- UNIDADE LÓGICA ARITMÉTICA EM VHDL
--
--   sel2  sel1  sel0   |     O                      [A0..A3] [B0..B3]
--   --------------------------------                 ______  ______
--      0     0     0   |  A  +  B                    \     \/     /
--      0     0     1   |  A  -  B         [s0..s2]    \    ALU   /
--      0     1     0   |  A and B                      \________/
--      0     1     1   |  A  or B
--      1     0     0   |  A xor B                       [O0..O3]
--      1     0     1   |  not A
--      1     1     0   |  not B
--      1     1     1   |     Zlibrary ieee;



library ieee;
use ieee.std_logic_1164.all;

use ieee.std_logic_unsigned.all;



entity ULA is

port(
A,B    : in std_logic_vector(3 downto 0);
sel    : in std_logic_vector(2 downto 0);
output : out std_logic_vector(3 downto 0)
);
end ULA;

architecture bahave_ula of ULA is

begin
process(A,B,sel)
begin
	case sel is
	
	when "000" => output <= A + B;
	when "001" => output <= A - B;
	when "010" => output <= A and B;
	when "011" => output <= A or B;
	when "100" => output <= A xor B;
	when "101" => output <= not A;
	when "110" => output <= not B;
	when others => output <= "ZZZZ";
	end case;
end process;


end architecture;