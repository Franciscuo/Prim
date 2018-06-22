

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Banco_Comparadores is



port(
clk: IN std_logic;
alfa : in std_logic_vector(4 downto 0);
rst : in std_logic;
wr : in std_logic;
j : in std_logic_vector(2 downto 0);

--    columans de salida
j_0 : out std_logic_vector(2 downto 0); -- mismo Ja
j_1 : out std_logic_vector(2 downto 0); -- mismo Jb
j_2 : out std_logic_vector(2 downto 0); -- mismo Jc
j_3 : out std_logic_vector(2 downto 0); -- mismo Jd
j_4 : out std_logic_vector(2 downto 0); -- mismo Je
--      pseos de salida
aux_0 : OUT std_logic_vector(5 downto 0);
aux_1 : OUT std_logic_vector(5 downto 0);
aux_2 : OUT std_logic_vector(5 downto 0);
aux_3 : OUT std_logic_vector(5 downto 0);
aux_4 : OUT std_logic_vector(5 downto 0);
--      pesos de entrada, se toman de cada RAM
registro_0 : IN std_logic_vector(5 downto 0); 
registro_1 : IN std_logic_vector(5 downto 0); 
registro_2 : IN std_logic_vector(5 downto 0); 
registro_3 : IN std_logic_vector(5 downto 0); 
registro_4 : IN std_logic_vector(5 downto 0)
	
);
end Banco_Comparadores;

architecture Behavioral of Banco_Comparadores is

	COMPONENT comparador_fila
	PORT(
		clk : IN std_logic;
		alfa : IN std_logic;
		rst : IN std_logic;
		wr : IN std_logic;
		j : IN std_logic_vector(2 downto 0);
		registro : IN std_logic_vector(5 downto 0);          
		j_x : OUT std_logic_vector(2 downto 0);
		aux_x : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
begin

	FILA_0: comparador_fila PORT MAP(
		clk => clk ,
		alfa =>alfa(0) ,
		rst => rst,
		wr => wr ,
		j =>j  ,
		j_x =>j_0 ,  -- columna del peso minimo
		aux_x => aux_0,-- valor del peso minimo
		registro => registro_0
	);

	FILA_1: comparador_fila PORT MAP(
		clk => clk ,
		alfa =>alfa(1) ,
		rst => rst,
		wr => wr ,
		j =>j  ,
		j_x =>j_1 ,  -- columna del peso minimo
		aux_x => aux_1,-- valor del peso minimo
		registro => registro_1
	);

	FILA_2: comparador_fila PORT MAP(
		clk => clk ,
		alfa =>alfa(2) ,
		rst => rst,
		wr => wr ,
		j =>j  ,
		j_x =>j_2 ,  -- columna del peso minimo
		aux_x => aux_2,-- valor del peso minimo
		registro => registro_2
	);

	FILA_3: comparador_fila PORT MAP(
		clk => clk ,
		alfa =>alfa(3) ,
		rst => rst,
		wr => wr ,
		j =>j  ,
		j_x =>j_3 ,  -- columna del peso minimo
		aux_x => aux_3,-- valor del peso minimo
		registro => registro_3
	);
	
		FILA_4: comparador_fila PORT MAP(
		clk => clk ,
		alfa =>alfa(4) ,
		rst => rst,
		wr => wr ,
		j =>j  ,
		j_x =>j_4 ,  -- columna del peso minimo
		aux_x => aux_4,-- valor del peso minimo
		registro => registro_4
	);



end Behavioral;

