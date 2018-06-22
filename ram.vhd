
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ram is
 PORT (
		 a_1,a_2,a_3,a_4             : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d_1,d_2,d_3,d_4             : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpra_1,dpra_2,dpra_3,dpra_4 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 clk                         : IN STD_LOGIC;
		 we_1,we_2,we_3,we_4         : IN STD_LOGIC;
		 spo_1,spo_2,spo_3,spo_4     : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpo_1,dpo_2,dpo_3,dpo_4     : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	  );
end ram;

architecture Behavioral of ram is

	COMPONENT ram_1
	 PORT (
		 a    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);-- dirección del dato de entrada
		 d    : IN STD_LOGIC_VECTOR(5 DOWNTO 0);-- datos a guardar 
		 dpra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 clk  : IN STD_LOGIC;
		 we   : IN STD_LOGIC;
		 spo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT ram_2
	   PORT (
		 a    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d    : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 clk  : IN STD_LOGIC;
		 we   : IN STD_LOGIC;
		 spo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT ram_3
	  PORT (
		 a    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d    : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 clk  : IN STD_LOGIC;
		 we   : IN STD_LOGIC;
		 spo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT ram_4
	  PORT (
		 a    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d    : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 clk  : IN STD_LOGIC;
		 we   : IN STD_LOGIC;
		 spo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 dpo  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	  );
	END COMPONENT;

begin


c1: ram_1 PORT MAP (a => a_1,d => d_1,dpra => dpra_1,clk => clk,we => we_1,spo => spo_1,dpo => dpo_1);
c2: ram_2 PORT MAP (a => a_2,d => d_2,dpra => dpra_2,clk => clk,we => we_2,spo => spo_2,dpo => dpo_2);
c3: ram_3 PORT MAP (a => a_3,d => d_3,dpra => dpra_3,clk => clk,we => we_3,spo => spo_3,dpo => dpo_3);
c4: ram_4 PORT MAP (a => a_4,d => d_4,dpra => dpra_4,clk => clk,we => we_4,spo => spo_4,dpo => dpo_4);











end Behavioral;

