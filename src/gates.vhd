library ieee;
USE ieee.std_logic_1164.ALL; 

entity Inverter is
	port(a: in std_logic;
	b: out std_logic);
end entity Inverter;

architecture strct of Inverter is
begin
	b<= not a after 2 ns;
	
end architecture strct;
	   
--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity NANDG is
	port(a,b: in std_logic;
	c: out std_logic);
end entity NANDG;

architecture strct of NANDG is
begin
	c<=  a nand b after 5 ns;
	
end architecture strct;
  
--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity NORG is
	port(a,b: in std_logic;
	c: out std_logic);
end entity NORG;

architecture strct of NORG is
begin
	c<=  a nor b after 5 ns;
	
end architecture strct;

--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity ANDG is
	port(a,b: in std_logic;
	c: out std_logic);
end entity ANDG;

architecture strct of ANDG is
begin
	c<=  a and b after 7 ns;
	
end architecture strct;

--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity ORG is
	port(a,b: in std_logic;
	c: out std_logic);
end entity ORG;

architecture strct of ORG is
begin
	c<=  a or b after 7 ns;
	
end architecture strct;

--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity XNORG is
	port(a,b: in std_logic;
	c: out std_logic);
end entity XNORG;

architecture strct of XNORG is
begin
	c<=  a xnor b after 9 ns;
	
end architecture strct;

--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity XORG is
	port(a,b: in std_logic;
	c: out std_logic);
end entity XORG;

architecture strct of XORG is
begin
	c<=  a xor b after 12 ns;
	
end architecture strct;		

--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity AND3G is
	port(a,b,d: in std_logic;
	c: out std_logic);
end entity AND3G;

architecture strct of AND3G is
begin
	c<=  a and b and d after 7 ns;
	
end architecture strct;

--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 
entity OR3G is
	port(a,b,d: in std_logic;
	c: out std_logic);
end entity OR3G;

architecture strct of OR3G is
begin
	c<=  a or b or d after 7 ns;
	
end architecture strct;
--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity XOR_subG is
	port(a: in std_logic_vector(7 downto 0);
	c: out std_logic_vector(7 downto 0));
end entity XOR_subG;					 

architecture strct of XOR_subG is
begin
	c<=  a xor "11111111" after 12 ns;
	
end architecture strct;
--********************************

library ieee;
USE ieee.std_logic_1164.ALL; 

entity NOR8G is
	port(a: in std_logic_vector(7 downto 0);
	c: out std_logic);
end entity NOR8G;

architecture strct of NOR8G is 

signal s: std_logic;
begin	
	
	s<=  a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7);
	c<= not s after 5 ns;	
end architecture strct;


