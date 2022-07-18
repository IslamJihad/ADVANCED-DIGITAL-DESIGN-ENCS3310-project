--entities  to make the magnitude comparator
--I'll make a 1 bit comparator and 2X3 bit comparators*************************************



library ieee;
USE ieee.std_logic_1164.ALL;

entity one_bit is
	port(a,b: in std_logic;
	F:out std_logic_vector(2 downto 0));
end entity one_bit;



architecture strct of one_bit is 

signal s1,s2,s3,s4,s5:std_logic;

begin
	
	g1:	entity work.Inverter(strct) port map(A,s1);
	g2:	entity work.Inverter(strct) port map(B,s2);
	g3:	entity work.ANDG(strct) port map(B,s1,s3);  --A<B
	g4:	entity work.ANDG(strct) port map(A,s2,s4);	--A>B
	g5:	entity work.NORG(strct) port map(s3,s4,s5);	--A=B
	
	F<=(s5 & s3 & s4);
	-- 14 ns delay
	
end architecture strct;










library ieee;
USE ieee.std_logic_1164.ALL;

entity two_bit is
	port(Fin: in std_logic_vector(2 downto 0);
	a1,a0,b1,b0: in std_logic;
	Fout:out std_logic_vector(2 downto 0));
end entity two_bit;



architecture strct of two_bit is 

signal na1,na0,nb1,nb0:std_logic;
signal a:std_logic_vector(5 downto 0);
signal n:std_logic_vector(1 downto 0);
signal smaller, equall, greater: std_logic;
signal f: std_logic_vector(2 downto 0);

begin  
	
-- compare if the previous bits are greater to pass the answer or not to start calculating	
	Fout<="010" when Fin="010"
else
	"001" when Fin="001"
else 
	f when Fin="100"
else
	f when Fin="100";	
	
--======================================================= 
--the design of the 2 bit cercuit to compare
--=======================================================
	nota1:	entity work.Inverter(strct) port map(A1,na1);
	nota0:	entity work.Inverter(strct) port map(A0,na0);
	notb1:	entity work.Inverter(strct) port map(B1,nb1);
	notb0:	entity work.Inverter(strct) port map(B0,nb0);
	
	
	-- smaller gates to connect
	g1:	entity work.ANDG(strct) port map(na1,B1,a(0));
	g2:	entity work.AND3G(strct) port map(na0,B1,B0,a(1));
	g3:	entity work.AND3G(strct) port map(na1,na0,B0,a(2));
	g4:	entity work.OR3G(strct) port map(a(0),a(1),a(2),smaller);
	
	-- equall gates to connect
	g5:	entity work.XNORG(strct) port map(A1,B1,n(0));
	g6:	entity work.XNORG(strct) port map(A0,B0,n(1));
	g7:	entity work.ANDG(strct) port map(n(0),n(1),equall);
	
	-- greater gates to connect
	g8:	entity work.ANDG(strct) port map(A1,nb1,a(3));
	g9:	entity work.AND3G(strct) port map(A0,nb1,nb0,a(4));
	g10:entity work.AND3G(strct) port map(A1,A0,nb0,a(5));
	g11:entity work.OR3G(strct) port map(a(3),a(4),a(5),greater);
	
		
	
	f<=(equall & smaller & greater);
	
	--16 ns delay
end architecture strct;