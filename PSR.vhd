library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity PSR is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end PSR;

architecture arqPSR of PSR is


begin
	process(clk)
	begin
			if(reset = '0') then
				c <= '0';
			else
				if(rising_edge(clk))then
					c<=nzvc(0);
			end if;
		end if;
	end process;
end arqPSR;
