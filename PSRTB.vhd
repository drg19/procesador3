LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 


ENTITY PSRTB IS
END PSRTB;
 
ARCHITECTURE behavior OF PSRTB IS 
 
 
    COMPONENT PSR
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal c : std_logic;

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clk => clk,
          reset => reset,
          nzvc => nzvc,
          c => c
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

	 reset <='1';
    nzvc <="0001";      
    wait for 100 ns;	
	 
	 reset <='1';
    nzvc <="0000";      
    wait for 100 ns;

      wait;
   end process;

END;
