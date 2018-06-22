

	COMPONENT comparador_fila
	PORT(
		clk : IN std_logic;
		alfa : IN std_logic;
		rst : IN std_logic;
		wr : IN std_logic;
		j : IN std_logic_vector(2 downto 0);
		registro : IN std_logic_vector(7 downto 0);          
		j_x : OUT std_logic_vector(2 downto 0);
		aux_x : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_comparador_fila: comparador_fila PORT MAP(
		clk => ,
		alfa => ,
		rst => ,
		wr => ,
		j => ,
		j_x => ,
		aux_x => ,
		registro => 
	);


