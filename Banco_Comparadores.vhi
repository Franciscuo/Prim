
-- VHDL Instantiation Created from source file Banco_Comparadores.vhd -- 12:29:13 06/21/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Banco_Comparadores
	PORT(
		clk : IN std_logic;
		alfa : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		wr : IN std_logic;
		j : IN std_logic_vector(2 downto 0);
		registro_0 : IN std_logic_vector(7 downto 0);
		registro_1 : IN std_logic_vector(7 downto 0);
		registro_2 : IN std_logic_vector(7 downto 0);
		registro_3 : IN std_logic_vector(7 downto 0);
		registro_4 : IN std_logic_vector(7 downto 0);          
		j_0 : OUT std_logic_vector(2 downto 0);
		j_1 : OUT std_logic_vector(2 downto 0);
		j_2 : OUT std_logic_vector(2 downto 0);
		j_3 : OUT std_logic_vector(2 downto 0);
		j_4 : OUT std_logic_vector(2 downto 0);
		aux_0 : OUT std_logic_vector(7 downto 0);
		aux_1 : OUT std_logic_vector(7 downto 0);
		aux_2 : OUT std_logic_vector(7 downto 0);
		aux_3 : OUT std_logic_vector(7 downto 0);
		aux_4 : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Banco_Comparadores: Banco_Comparadores PORT MAP(
		clk => ,
		alfa => ,
		rst => ,
		wr => ,
		j => ,
		j_0 => ,
		j_1 => ,
		j_2 => ,
		j_3 => ,
		j_4 => ,
		aux_0 => ,
		aux_1 => ,
		aux_2 => ,
		aux_3 => ,
		aux_4 => ,
		registro_0 => ,
		registro_1 => ,
		registro_2 => ,
		registro_3 => ,
		registro_4 => 
	);


