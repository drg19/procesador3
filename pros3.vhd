library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;


entity pros3 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end pros3;

architecture Behavioral of pros3 is

	component IM 
    Port ( reset : in  STD_LOGIC;
           adres : in  STD_LOGIC_VECTOR (31 downto 0);
           IMout : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component ALU 
    Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0);
			  carry : in  STD_LOGIC;
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0));
	end component;
	
	component SEU 
    Port ( simm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           simm32 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component mux 
    Port ( UESout : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           inmediato : in  STD_LOGIC;
           muxout : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component PC 
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           address  : in  STD_LOGIC_VECTOR(31 downto 0) ;
           next_instruction : out  STD_LOGIC_VECTOR(31 downto 0));
	end component;
	
  COMPONENT registerFile
    PORT(
         reset : IN  std_logic;
         rS1 : IN  std_logic_vector(4 downto 0);
         rS2 : IN  std_logic_vector(4 downto 0);
         rD : IN  std_logic_vector(4 downto 0);
         dataToWrite : IN  std_logic_vector(31 downto 0);
         cRS1 : OUT  std_logic_vector(31 downto 0);
         cRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	
	component Sumador 
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component UC 
    Port ( op : in  STD_LOGIC_VECTOR(1 downto 0);
           op3  : in  STD_LOGIC_VECTOR(5 downto 0);
           Aluop : out  STD_LOGIC_VECTOR(5 downto 0));
	end component;
	
	component nPC 
    Port ( addres : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sgteinstruccion : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	
	component PSRM is
    Port ( reset : in STD_LOGIC;
			  Op1 : in  STD_LOGIC;
           Op2 : in  STD_LOGIC;
			  Aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
		end component;
	
	component  PSR 
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
	end component;

signal C,D,E,F,G,I,J,L,M,N,O,K,H: STD_LOGIC_VECTOR (31 downto 0);
signal CA: STD_LOGIC;
 
begin

nextPC : nPC
	port map( addres => D,
				 clk => clk,
				 reset => reset,
				 sgteinstruccion => C
			);
------------------------------------		
	Program_Counter : PC	
	port map (
					clk => clk,
					reset => reset,
					address => C,
					next_instruction => E
					
				);
				
-----------------------------------
	Sum: Sumador
	port map(
					A => "00000000000000000000000000000001",
					B => C,
					Cout => D
				);

---------------------------------

	Instruction_M : IM
	port map(
				  reset => reset,
				  adres => E,
              IMout => F
				);
---------------------------------

	Unidad_c : UC
	port map(
					op => F(31 downto 30),
					op3  => F(24 downto 19),
					Aluop => G(5 downto 0)
				);

--------------------------------

	Register_F : registerFile
	port map (
					rs1 => F(18 downto 14),
					rs2 =>F(4 downto 0),
					rd  =>F(29 downto 25),
					reset => reset,
					DataToWrite => L,
					CRS1 => H,
					CRS2 => I
				 );
-----------------------------------------------
	 unidadES: SEU 
    Port map ( 
					simm13 =>F(12 downto 0),
					simm32 =>J  
				  );


------------------------------------------------
	 multiplexor: mux 
    Port map 
				( 	
					UESout => J,
					CRS2 => I,
					inmediato => F(13),
					muxout =>k
				 );


------------------------------------------------

	 aluu : ALU		
    Port map( 
					CRS1 => H,
					CRS2 => K,
					ALUOP =>G(5 downto 0),
					carry =>CA,
					ALURESULT => L
				);
				
----------------------------------------------

	 PSRMe: PSRM 
    Port map( 	reset =>reset,
					Op1 =>H(31),
					Op2 =>K(31),
					Aluresult =>L,
					Aluop => G(5 downto 0),
					nzvc=> O(3 downto 0)
	); 
-------------------------------
	PSRe : PSR
	port map( clk => clk,
				 reset => reset,
				 nzvc => O(3 downto 0),
             c =>CA
			);
---------------------------------

ALURESULT <= L;





end Behavioral;


