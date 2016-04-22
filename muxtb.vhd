library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

 
ENTITY muxtb IS
END muxtb;
 
ARCHITECTURE behavior OF muxtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         UESout : IN  std_logic_vector(31 downto 0);
         CRS2 : IN  std_logic_vector(31 downto 0);
         inmediato : IN  std_logic;
         muxout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal UESout : std_logic_vector(31 downto 0) := (others => '0');
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal inmediato : std_logic := '0';

 	--Outputs
   signal muxout : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          UESout => UESout,
          CRS2 => CRS2,
          inmediato => inmediato,
          muxout => muxout
        );



   -- Stimulus process
   stim_proc: process
   begin		
     
		UESout <= "00000000000000000000000000000001";
		CRS2 	 <= "10000000000000000000000000000000";
		inmediato <= '1';
      wait for 100 ns;	
		
		UESout <= "00000000000000000000000000000001";
		CRS2 	 <= "10000000000000000000000000000000";
		inmediato <= '0';
      wait for 100 ns;



      wait;
   end process;

END;
