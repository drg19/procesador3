--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:54:08 04/11/2016
-- Design Name:   
-- Module Name:   E:/LG Smart TV/procesador2/PSRM/PSRM_TB.vhd
-- Project Name:  PSRM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSRModifier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PSRM_TB IS
END PSRM_TB;
 
ARCHITECTURE behavior OF PSRM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRModifier
    PORT(
         aluResult : IN  std_logic_vector(31 downto 0);
         operando1 : IN  std_logic;
         operando2 : IN  std_logic;
         aluOp : IN  std_logic_vector(5 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal operando1 : std_logic := '0';
   signal operando2 : std_logic := '0';
   signal aluOp : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRModifier PORT MAP (
          aluResult => aluResult,
          operando1 => operando1,
          operando2 => operando2,
          aluOp => aluOp,
          nzvc => nzvc
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
  
		aluResult <= "00000000000000000000000000000000";
		operando1 <= '0';
		operando2 <= '0';
		aluOp <= "000101";
			
      wait for 100 ns;	



      wait;
   end process;

END;
