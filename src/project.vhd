


-- D Flip Flop to get off delays
library ieee;
use ieee.std_logic_1164.all;

entity dfflop is 
   port(clk, d:in std_logic;
   o : out std_logic );
end entity dfflop;	 


architecture rise_dff of dfflop is  
begin  
 process(clk)
 begin 
    if(rising_edge(clk)) then
    o <= d; 
    end if;       
 end process;  
end rise_dff;




--******************************************************************************************



library ieee;
USE ieee.std_logic_1164.ALL;

entity comparator is
	port(clk: in std_logic;
	A,B: in std_logic_vector(7 downto 0);
	Fq,Fg,Fs:out std_logic);
end entity comparator;



-- the comparator using full adder
architecture adder_comp of comparator is	 
signal Bxored, sum: std_logic_vector(7 downto 0);
signal cout6, cout, Ov, res,equall : std_logic;
signal Fout: std_logic_vector(2 downto 0);
signal fqr, fgr,fsr: std_logic;

begin
	XORB:  entity work.XOR_subG(strct) port map(B, Bxored);	-- to nigative all B digits  to be subtracted
		
	FA8:   entity work.bit8_adder(strct) port map(A, Bxored, '1', sum, cout6, cout); --  8 bit adder subtractor work
		--like subtractor as it has the B is xor with 1 and have a Cin =1 to work as subtract
		
	g1:	entity work.XORG(strct) port map(cout6, cout, Ov); -- to get the over flow by making xor between the Cout and the previous cout
	
	g2:	entity work.XORG(strct) port map(Ov, sum(7), res); -- to check ether it's grater or smaller (A & B)
		
	g3:	entity work.NOR8G(strct) port map(sum, equall); -- a nor gate for all summation result index so to know ether the sum =0 or not
		
	
	Fout<= "100" when equall='1'
	else  
		"001" when  res='1'
	else 
		"010" when  res='0';
		
	Fqr<= Fout(2);
	Fgr<= Fout(1);
	Fsr<= Fout(0);
	
	g4:	entity work.dfflop(rise_dff) port map(clk,Fqr,Fq);
	g5:	entity work.dfflop(rise_dff) port map(clk,Fgr,Fg);
	g6:	entity work.dfflop(rise_dff) port map(clk,Fsr,Fs);
-- delay needed is 127 ns for this circuit
-- so th clk will be 127 ns
--clk<= not clk after 127 ns;	
end architecture adder_comp;












--*****************************************************************************************

				
-- the comparator using magnitude comparator


architecture mag_comp of comparator is  
signal result, s1, s2, s3, Fout: std_logic_vector(2 downto 0); 
signal Fqr, Fgr, Fsr: std_logic;
begin	
	
	Fout<="010" when A(7)='1' and B(7)='0'
else
	"001" when A(7)='0' and B(7)='1'
else 
	result when A(7)='1' and B(7)='1'
else
	result when A(7)='0' and B(7)='0'; 
	
	g1:	entity work.one_bit(strct) port map(A(6), B(6), s1); 
	g2:	entity work.two_bit(strct) port map(s1, A(5),A(4), B(5),B(4), s2);
    g3:	entity work.two_bit(strct) port map(s2, A(3),A(2), B(3),B(2), s3);
	g4:	entity work.two_bit(strct) port map(s3, A(1),A(0), B(1),B(0), result); 
		
	Fqr<= Fout(2);
	Fsr<= Fout(1);
	Fgr<= Fout(0);  
	
	g5:	entity work.dfflop(rise_dff) port map(clk,Fqr,Fq);
	g6:	entity work.dfflop(rise_dff) port map(clk,Fgr,Fg);
	g7:	entity work.dfflop(rise_dff) port map(clk,Fsr,Fs); 
		
-- delay needed is 16 ns for this circuit
-- so th clk will be 16 ns
--clk<= not clk after 16 ns;

end architecture mag_comp;






























  library ieee;
USE ieee.std_logic_1164.ALL;

entity aaa is
	port(A,B: in std_logic_vector(7 downto 0);
	Fq,Fg,Fs:out std_logic);
end entity aaa;






architecture aa of aaa is  
signal result, s1, s2, s3, Fout: std_logic_vector(2 downto 0); 
signal Fqr, Fgr, Fsr: std_logic;
begin	
	
	Fout<="010" when A(7)='1' and B(7)='0'
else
	"001" when A(7)='0' and B(7)='1'
else 
	result when A(7)='1' and B(7)='1'
else
	result when A(7)='0' and B(7)='0'; 
	
	g1:	entity work.one_bit(strct) port map(A(6), B(6), s1); 
	g2:	entity work.two_bit(strct) port map(s1, A(5),A(4), B(5),B(4), s2);
    g3:	entity work.two_bit(strct) port map(s2, A(3),A(2), B(3),B(2), s3);
	g4:	entity work.two_bit(strct) port map(s3, A(1),A(0), B(1),B(0), result); 
		
	Fq<= Fout(2);
	Fs<= Fout(1);
	Fg<= Fout(0);  
	
	
		
-- delay needed is 16 ns for this circuit
-- so th clk will be 16 ns
--clk<= not clk after 16 ns;

end architecture aa;
























-- the comparator using full adder
architecture adder_comp of aaa is	 
signal Bxored, sum: std_logic_vector(7 downto 0);
signal cout6, cout, Ov, res,equall : std_logic;
signal Fout: std_logic_vector(2 downto 0);
signal fqr, fgr,fsr: std_logic;

begin
	XORB:  entity work.XOR_subG(strct) port map(B, Bxored);	-- to nigative all B digits  to be subtracted
		
	FA8:   entity work.bit8_adder(strct) port map(A, Bxored, '1', sum, cout6, cout); --  8 bit adder subtractor work
		--like subtractor as it has the B is xor with 1 and have a Cin =1 to work as subtract
		
	g1:	entity work.XORG(strct) port map(cout6, cout, Ov); -- to get the over flow by making xor between the Cout and the previous cout
	
	g2:	entity work.XORG(strct) port map(Ov, sum(7), res); -- to check ether it's grater or smaller (A & B)
		
	g3:	entity work.NOR8G(strct) port map(sum, equall); -- a nor gate for all summation result index so to know ether the sum =0 or not
		
	
	Fout<= "100" when equall='1'
	else  
		"001" when  res='1'
	else 
		"010" when  res='0';
		
	Fq<= Fout(2);
	Fg<= Fout(1);
	Fs<= Fout(0);
	
	
-- delay needed is 127 ns for this circuit
-- so th clk will be 127 ns
--clk<= not clk after 127 ns;	
end architecture adder_comp;