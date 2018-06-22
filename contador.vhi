
-- VHDL Instantiation Created from source file contador.vhd -- 17:08:55 06/20/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT contador
	PORT(
		clk : IN std_logic;
		sel : IN std_logic;
		rst : IN std_logic;          
		j : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_contador: contador PORT MAP(
		clk => ,
		sel => ,
		rst => ,
		j => 
	);


