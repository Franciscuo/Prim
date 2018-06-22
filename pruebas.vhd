library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity mem is
	port(
			  a  : in  std_logic_vector(5 downto 0);
			  spo: out std_logic_vector(11 downto 0)
	);
end mem;

architecture Behavioral of mem is

	
	
	COMPONENT memoria
	PORT(
			  a  : in  std_logic_vector(5 downto 0);
			  spo: out std_logic_vector(11 downto 0)
			  
		);
	END COMPONENT;

begin

c1 : memoria port map (a=>a,spo=>spo);


end Behavioral;

