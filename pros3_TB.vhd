LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pros3_Tb IS
END pros3_Tb;
 
ARCHITECTURE behavior OF pros3_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pros3
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         ALUresult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal ALUresult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pros3 PORT MAP (
          clk => clk,
          reset => reset,
          ALUresult => ALUresult
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period;
   end process;
 

	
   -- Stimulus process
   stim_proc: process
   begin		
    	reset <= '0';
		wait for 10 ns;
		reset <= '1' ;
		

  
      wait;
   end process;

END;