library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;



entity contador is
    Port ( clk : in  STD_LOGIC;
           sel : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
  --         listo : out  STD_LOGIC;
			  j : out  STD_LOGIC_vector(2 downto 0)
			  );
end contador;

architecture Behavioral of contador is
	signal sum: std_logic_vector(2 downto 0);
begin

j<=sum;
--listo<='1' when sum="101" else '0';

process(sel,clk,rst)
		begin
				if rst='1' or sel='0' then
					sum<=(others=>'0');
				elsif clk' event and clk ='1' then
					sum<=sum+1;
				end if;
		end process;
end Behavioral;

