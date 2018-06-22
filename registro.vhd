
library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;



entity registro_fila is
    Port ( 
           j      : in  STD_LOGIC_VECTOR (2 downto 0);
           salida : out STD_LOGIC_VECTOR (7 downto 0)
			  );
	 end registro_fila;

architecture Behavioral of registro_fila is

	type matriz is array (0 to 7) of std_logic_vector(7 downto 0);
	signal recorredor: matriz;
	begin
	
		recorredor(0)<="00000000";
		recorredor(1)<=(conv_std_logic_vector(128, 4) +"00000000");
		recorredor(2)<=(conv_std_logic_vector(128, 7) +"00000000");
		recorredor(3)<=(conv_std_logic_vector(128, 10)+"00000000");
		recorredor(4)<="00000000";
		recorredor(5)<=(conv_std_logic_vector(128, 3) +"00000000");
		recorredor(6)<=(conv_std_logic_vector(128, 9) +"00000000");
		recorredor(7)<=(conv_std_logic_vector(128, 15)+"00000000");

		
		salida<=recorredor(conv_integer(j));
		
end Behavioral;

