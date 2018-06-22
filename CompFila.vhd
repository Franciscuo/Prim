library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;



entity comparador_fila is
    Port ( clk : in  STD_LOGIC;
           alfa: in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  wr  : in  STD_LOGIC;
			  j   : in  STD_LOGIC_vector(2 downto 0);
			  j_x : out STD_LOGIC_vector(2 downto 0);
           aux_x : out  STD_LOGIC_vector(5 downto 0);
			  registro: in STD_LOGIC_vector(5 downto 0)
			  );
end comparador_fila;

architecture Behavioral of comparador_fila is

	signal mux1,aux: std_logic_vector(5 downto 0);
	signal mux2,reg_jx: std_logic_vector(2 downto 0);
	signal comp: std_logic;

begin
	
	aux_x<= aux;
	j_x<=reg_jx;
	
	comp<= '1' when registro > aux or registro = "000000" else '0';
	mux1<=aux when  comp='1' else registro;
	mux2<= j when comp='0' else reg_jx;

	process(reg_jx,aux,clk,rst)
		begin
				if rst='1' then
					aux<=(others=>'1');
					reg_jx<=(others=>'0');
				elsif clk' event and clk ='1' then
					if wr='1' then
						if alfa='1' then
							aux<=mux1; 
							reg_jx<=mux2 ;	
						else
							aux<=(others=>'1');
							reg_jx<=mux2 ;	
						end if;
					end if;
				end if;
		end process;
end Behavioral;

