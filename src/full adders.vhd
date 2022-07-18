								   
-- one bit full adder circuit
library ieee;
USE ieee.std_logic_1164.ALL;

entity FA is
	port(A,B,Cin:in std_logic;
	s,Cout:out std_logic);
	
end entity FA;


architecture one_bit_adder of FA is	
signal s1,s2,s3,s4,s5: std_logic;
begin			
	g1:	entity work.XORG(strct) port map(A,B,s1);
	g2:	entity work.ANDG(strct) port map(A,B,s2);
	g3:	entity work.ANDG(strct) port map(Cin,s1,s3);
	g4:	entity work.XORG(strct) port map(s1,Cin,s4);
	g5:	entity work.ORG(strct) port map(s2,s3,s5); 
	
	s<=s4;
	Cout<=s5;
	
	--24 ns needed to give correct answer
end architecture one_bit_adder;















--8 bits full adder

library ieee;
USE ieee.std_logic_1164.ALL;

entity bit8_adder is
	port(A,B:in std_logic_vector(7 downto 0);
	Cin:in std_logic;
	sum:out std_logic_vector(7 downto 0);
	Cout6, Cout:out std_logic);
	
end entity bit8_adder;



architecture strct of bit8_adder is

signal s,c:std_logic_vector(7 downto 0);
begin
	
	g1: entity work.FA(one_bit_adder) port map(A(0),B(0),Cin,s(0),c(0));
	g2: entity work.FA(one_bit_adder) port map(A(1),B(1),c(0),s(1),c(1));	
	g3: entity work.FA(one_bit_adder) port map(A(2),B(2),c(1),s(2),c(2));	
	g4: entity work.FA(one_bit_adder) port map(A(3),B(3),c(2),s(3),c(3));
	g5: entity work.FA(one_bit_adder) port map(A(4),B(4),c(3),s(4),c(4));
	g6: entity work.FA(one_bit_adder) port map(A(5),B(5),c(4),s(5),c(5));
	g7: entity work.FA(one_bit_adder) port map(A(6),B(6),c(5),s(6),c(6));
	g8: entity work.FA(one_bit_adder) port map(A(7),B(7),c(6),s(7),c(7));
	
	Cout6<=c(6);
	Cout<=c(7);
	sum<=s;
	-- 24 ns needed for delay correction	
end architecture strct;

