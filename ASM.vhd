library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity ASM is
   port 
	(	clk: IN std_logic;
		rst: IN std_logic;
		wr : in std_logic
	 );
end ASM;

architecture Behavioral of ASM is

	 
	 COMPONENT ram
	 PORT (
		 a_1,a_2,a_3,a_4             : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d_1,d_2,d_3,d_4             : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpra_1,dpra_2,dpra_3,dpra_4 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 clk                         : IN STD_LOGIC;
		 we_1,we_2,we_3,we_4         : IN STD_LOGIC;
		 spo_1,spo_2,spo_3,spo_4     : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpo_1,dpo_2,dpo_3,dpo_4     : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	  );
	END COMPONENT;
	  
	COMPONENT mem
	PORT(
			  a  : in  std_logic_vector(5 downto 0);
			  spo: out std_logic_vector(11 downto 0)
			  
		);
	END COMPONENT;
	
   COMPONENT contador
	PORT(
		clk : IN std_logic;
		sel : IN std_logic;
		rst : IN std_logic;          
		j : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

COMPONENT Banco_Comparadores
	PORT(
		clk : IN std_logic;
		alfa : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		wr : IN std_logic;
		j : IN std_logic_vector(2 downto 0);
		registro_0 : IN std_logic_vector(5 downto 0);
		registro_1 : IN std_logic_vector(5 downto 0);
		registro_2 : IN std_logic_vector(5 downto 0);
		registro_3 : IN std_logic_vector(5 downto 0);
		registro_4 : IN std_logic_vector(5 downto 0);          
		j_0 : OUT std_logic_vector(2 downto 0);
		j_1 : OUT std_logic_vector(2 downto 0);
		j_2 : OUT std_logic_vector(2 downto 0);
		j_3 : OUT std_logic_vector(2 downto 0);
		j_4 : OUT std_logic_vector(2 downto 0);
		aux_0 : OUT std_logic_vector(5 downto 0);
		aux_1 : OUT std_logic_vector(5 downto 0);
		aux_2 : OUT std_logic_vector(5 downto 0);
		aux_3 : OUT std_logic_vector(5 downto 0);
		aux_4 : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;




	signal in_rom,aux   : std_logic_vector(5 downto 0);
	signal out_rom      : std_logic_vector(11 downto 0);
	
	signal in_ram_11,in_ram_21 : std_logic_vector(3 downto 0);
	signal in_ram_12,in_ram_22 : std_logic_vector(3 downto 0);
	signal in_ram_13,in_ram_23 : std_logic_vector(3 downto 0);
	signal in_ram_14,in_ram_24 : std_logic_vector(3 downto 0);
	
	signal out_ram_11,out_ram_21 : std_logic_vector(5 downto 0);
	signal out_ram_12,out_ram_22 : std_logic_vector(5 downto 0);
	signal out_ram_13,out_ram_23 : std_logic_vector(5 downto 0);
	signal out_ram_14,out_ram_24 : std_logic_vector(5 downto 0);
	
	signal din_ram_1 : std_logic_vector(5 downto 0);
	signal din_ram_2 : std_logic_vector(5 downto 0);
	signal din_ram_3 : std_logic_vector(5 downto 0);
	signal din_ram_4 : std_logic_vector(5 downto 0);
	
	signal we_ram_1 : std_logic;
	signal we_ram_2 : std_logic;
	signal we_ram_3 : std_logic;
	signal we_ram_4 : std_logic;
	

	type estado is (s00,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,inicio_alg);
   signal estado_actual , estado_siguiente : estado;
	
	signal destino,origen : std_logic_vector(3 downto 0);
	signal peso           : std_logic_vector(5 downto 0);
	signal listo          : std_logic;


   signal sel: std_logic;
   signal j : std_logic_vector(2 downto 0);
    signal alfa : std_logic_vector(4 downto 0);

-- señales del banco de comparadores
signal j_0,j_1,j_2,j_3,j_4 :std_logic_vector(2 downto 0);
signal aux_0, aux_1,aux_2,aux_3,aux_4 : std_logic_vector(5 downto 0);
begin


-- instanciaciones 

	c1 : mem port map (a=>in_rom,spo=>out_rom);
	c2 : ram port map (we_1=>we_ram_1,we_2=>we_ram_2,we_3=>we_ram_3,we_4=>we_ram_4,
							 a_1=>in_ram_11,a_2=>in_ram_12,a_3=>in_ram_13,a_4=>in_ram_14,
							 dpra_1=>in_ram_21,dpra_2=>in_ram_22,dpra_3=>in_ram_23,dpra_4=>in_ram_24,
							 d_1=>din_ram_1,d_2=>din_ram_2,d_3=>din_ram_3,d_4=>din_ram_4,
							 spo_1=>out_ram_11,spo_2=>out_ram_12,spo_3=>out_ram_13,spo_4=>out_ram_14,
							 dpo_1=>out_ram_21,dpo_2=>out_ram_22,dpo_3=>out_ram_23,dpo_4=>out_ram_24,
							 clk=>clk);
	
	Contador_J: contador PORT MAP(
		clk =>clk ,
		sel =>sel ,
		rst =>rst ,
		j => j
	);						 
   
	Banco: Banco_Comparadores PORT MAP(
		clk =>clk ,
		alfa =>alfa ,
		rst => rst,
		wr => wr ,
		j =>j  ,
		j_0 =>j_0 ,
		j_1 => j_1,
		j_2 =>j_2 ,
		j_3 =>j_3 ,
		j_4 => j_4,
		aux_0 => aux_0,
		aux_1 => aux_1,
		aux_2 => aux_2,
		aux_3 => aux_3,
		aux_4 => aux_4,
		registro_0 =>out_ram_11 ,
		registro_1 =>out_ram_11 ,
		registro_2 =>out_ram_11 ,
		registro_3 =>out_ram_11 ,
		registro_4 =>out_ram_11 
	);







---------------------------------------
-- señales intermedias-------------
	origen<=("0"&out_rom(11 downto 9));
	destino<=("0"&out_rom(8 downto 6));
	peso<=out_rom(5 downto 0);
	
combinacional : process (estado_actual,origen)  
	begin
		 case estado_actual is
							when s00=>
									 in_rom<=(others=>'0');
									 in_ram_11<=(others=>'0');
									 in_ram_12<=(others=>'0');
									 in_ram_13<=(others=>'0');
									 in_ram_14<=(others=>'0');
									 in_ram_21<=(others=>'0');
									 in_ram_22<=(others=>'0');
									 in_ram_23<=(others=>'0');
									 in_ram_24<=(others=>'0');
									 we_ram_1<='0';
									 we_ram_2<='0';
									 we_ram_3<='0';
									 we_ram_4<='0';
									 din_ram_1<=(others=>'0');
									 din_ram_2<=(others=>'0');
									 din_ram_3<=(others=>'0');
									 din_ram_4<=(others=>'0');
									 estado_siguiente<=s0;
					
					      when s0 =>
								if(origen="0000" or origen="0001") then 
									estado_siguiente<=s1;
								elsif (origen="0010" or origen="0011") then 
									estado_siguiente<=s2;
								elsif (origen="0100" or origen="0101") then 
									estado_siguiente<=s3;
								else
									estado_siguiente<=s4;
								end if;

							when s1 =>   
								if(origen="0000") then 
									in_ram_11<=destino;
								else
									in_ram_11<=(destino+"1000");
								end if;
								we_ram_1<='1';
								din_ram_1<=peso;
							   estado_siguiente<=s5;
							
							when s2 =>
								if(origen="0010") then 
									in_ram_12<=destino;
								else
									in_ram_12<=(destino+"1000");
								end if;
								we_ram_2<='1';
								din_ram_2<=peso;
							   estado_siguiente<=s5;
							
							when s3 =>
								if(origen="0100") then 
									in_ram_13<=destino;
								else
									in_ram_13<=(destino+"1000");
								end if;
								we_ram_3<='1';
								din_ram_3<=peso;
							   estado_siguiente<=s5;
							
							when s4 =>
								if(origen="0110") then 
									in_ram_14<=destino;
								else
									in_ram_14<=(destino+"1000");
								end if;
								we_ram_4<='1';
								din_ram_4<=peso;
							   estado_siguiente<=s5;
							
							when s5 =>
							aux<=in_rom;
							estado_siguiente<=s6;
							
							when s6 =>
									 we_ram_1<='0';
									 we_ram_2<='0';
									 we_ram_3<='0';
									 we_ram_4<='0';
									 in_rom<=(aux+"00001");
							estado_siguiente<=s7;
							
							when s7 =>
								if(in_rom="111111") then
									estado_siguiente<=inicio_alg;
									listo<='1';
								else
									estado_siguiente<=s0;
								end if;
				         when inicio_alg=>
							
							estado_siguiente<=inicio_alg;
							
							
							
							
							
							
							when others =>
							estado_siguiente<=s00;
			end case;
end process combinacional;

secuencial : process (clk,rst)
begin 
	if rst='1' then -- reset general del sistema
		estado_actual<=s00;
	
		sel<='0';
		alfa<="00001";
		
	 elsif clk'event and clk ='1' then
		estado_actual<=estado_siguiente;
	end if;
end process secuencial;

end Behavioral;

