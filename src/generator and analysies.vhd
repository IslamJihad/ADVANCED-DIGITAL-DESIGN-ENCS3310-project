--islam jihad 1191375
library ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbanch is
end;			  

architecture test of testbanch is 

signal testa,testb:std_logic_vector(7 downto 0):="00000000";
signal sum: std_logic_vector(7 downto 0);
signal cin:std_logic:='0';
signal cout: std_logic;
begin  			
	
	g1:	entity work.bit8_adder(strct) port map(testa, testb,cin,sum,cout);
		
		
	testa<=testa + 1 after 200 ns;
	testb<=testb + 1 after 400 ns;
	cin<= not cin after 800 ns;
end;


--***************************************


library ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbanch1 is
end;			  

architecture test of testbanch1 is 

signal testa,testb:std_logic_vector(7 downto 0):="00000000";
signal ans: std_logic_vector(2 downto 0); 
signal Fq, Fs, Fg,clk: std_logic;
begin  			
	
	g1:	entity work.mag_comp(strct) port map(clk, testa, testb,Fq, Fs, Fg);
		
		
	testa<=testa + 1 after 200 ns;
	testb<=testb + 1 after 400 ns;	 
end; 































--------------------------------------------------
----------------- Test Generator -----------------
--------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_ARITH.ALL;
USE ieee.std_logic_UNSIGNED.ALL;


ENTITY TestGenerator IS
PORT(clk: IN STD_LOGIC:='0'; 
A,B: OUT STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000"; 
FqCorr, FgCorr, FsCorr: OUT STD_LOGIC:='0');
END TestGenerator;	  


ARCHITECTURE generator OF TestGenerator IS 
SIGNAL AA,BB: STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
SIGNAL x: STD_LOGIC_VECTOR(2 DOWNTO 0):="000";
BEGIN 
		A<=AA;
		B<=BB;	   
		
		FqCorr<=X(2);
		FgCorr<=X(1);
		FsCorr<=X(0); 
		
	-- The Process Below calculate the behavioural results
	
	PROCESS (clk) 
	BEGIN 
		
			if (AA = BB) then	  
				x<="100";
			elsif (AA > BB) then
				x<="010";
			elsif (AA < BB) then
				x<="001";
		   end if; 
		END PROCESS;
		
		
		  -- this  2 loops to make sure to check all the possible results between A and B
		PROCESS 
			BEGIN
				FOR i IN 0 TO 255 LOOP
					FOR j IN 0 TO 255 LOOP 
						
								AA(7 DOWNTO 0) <= CONV_STD_LOGIC_VECTOR(i,8);
								BB(7 DOWNTO 0) <= CONV_STD_LOGIC_VECTOR(j,8);
								WAIT UNTIL rising_edge(CLK); 
 
					END LOOP; 
				END LOOP;
			WAIT;
		END PROCESS;
END;	

























--------------------------------------------------
----------------- Result Analyser ----------------
--------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_ARITH.ALL;


ENTITY ResultAnalyser IS
PORT(CLK: IN STD_LOGIC:='0'; 
	Fqc, Fgc, Fsc, Fq, Fg, Fs: IN STD_LOGIC:='0');
END ResultAnalyser;		


ARCHITECTURE analyser OF ResultAnalyser IS
BEGIN 
-- The code below is to make sure that the result from my system equals to the correct one or not
-- if not it will print an error when the outputs are not equal to each other
PROCESS
BEGIN
assert (Fqc = Fq and Fgc = Fg and Fsc = Fs)
report "The results that were obtained from your design don't agree with the correct results" 
severity ERROR;
WAIT UNTIL rising_edge(CLK);
END PROCESS;
END; 


































--------------------------------------------------
--------------- Built In Self Test ---------------
--------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_ARITH.ALL; 
ENTITY BIST IS
END ENTITY BIST;
------------------------------------------------
-------- Test For The adder comparator ---------
ARCHITECTURE adder_comp OF BIST IS

SIGNAL clk: STD_LOGIC:='0';
SIGNAL A,B: STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000"; 
SIGNAL Fq, Fg, Fs,Fqc, Fgc, Fsc: STD_LOGIC:='0';
BEGIN 																 
	
-- 127 ns is the minimum delay we should have to have a correct output
-- so I'll increse it 3 ns to make sure of the of the correct answer 

CLK <= NOT CLK AFTER 130 NS;  

G1: ENTITY WORK.TestGenerator(generator) PORT MAP(clk, A, B, Fqc, Fgc, Fsc); 
	
G2: ENTITY WORK.comparator(adder_comp) PORT MAP(clk, A, B, Fq, Fg, Fs);
	
G3: ENTITY WORK.ResultAnalyser(analyser) PORT MAP(clk, Fqc, Fgc, Fsc, Fq, Fg, Fs); 	  
	
END ARCHITECTURE adder_comp;  












------------------------------------------------
------ Test For The magnitude comparator -------
ARCHITECTURE mag_comp OF BIST IS

SIGNAL clk: STD_LOGIC:='0';
SIGNAL A,B: STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000"; 
SIGNAL Fq, Fg, Fs,Fqc, Fgc, Fsc: STD_LOGIC:='0';
BEGIN 																 
	
-- 16 ns is the minimum delay we should have to have a correct output
-- so I'll increse it 3 ns to make sure of the of the correct answer 

CLK <= NOT CLK AFTER 16 NS;  

G1: ENTITY WORK.TestGenerator(generator) PORT MAP(clk, A, B, Fqc, Fgc, Fsc); 
	
G2: ENTITY WORK.comparator(mag_comp) PORT MAP(clk, A, B, Fq, Fg, Fs);
	
G3: ENTITY WORK.ResultAnalyser(analyser) PORT MAP(clk, Fqc, Fgc, Fsc, Fq, Fg, Fs); 	  
	
END ARCHITECTURE mag_comp; 	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	