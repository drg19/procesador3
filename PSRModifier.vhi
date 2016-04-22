
-- VHDL Instantiation Created from source file PSRModifier.vhd -- 17:32:53 04/19/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSRModifier
	PORT(
		aluResult : IN std_logic_vector(31 downto 0);
		operando1 : IN std_logic;
		operando2 : IN std_logic;
		aluOp : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_PSRModifier: PSRModifier PORT MAP(
		aluResult => ,
		operando1 => ,
		operando2 => ,
		aluOp => ,
		nzvc => 
	);


