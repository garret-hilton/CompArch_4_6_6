library IEEE;
use IEEE.std_logic_1164.all;

entity full_cla_adder is
    port  (A, B        :in std_logic_vector(7 downto 0);
	       Sub         :in std_logic;
           Sum         :out std_logic_vector(7 downto 0);
		   Cout        :out std_logic);
end entity;

architecture full_cla_adder_arch of full_cla_adder is

      component cla_adder
	      port  (A, B        :in std_logic_vector(3 downto 0);
		         Cin_sub     :in std_logic;
                 Sum         :out std_logic_vector(3 downto 0);
		         Cout        :out std_logic);
      end component;
		
	  signal BS0, BS1, BS2, BS3, BS4, BS5, BS6, BS7, link : std_logic;
	  signal BfB1, BfB2                                   : std_logic_vector(3 downto 0);
	  
    begin
	
      BS0 <= (B(0) xor Sub);
      BS1 <= (B(1) xor Sub);
      BS2 <= (B(2) xor Sub);
      BS3 <= (B(3) xor Sub);
      BS4 <= (B(4) xor Sub);
      BS5 <= (B(5) xor Sub);
      BS6 <= (B(6) xor Sub);
      BS7 <= (B(7) xor Sub);
      BfB1 <= BS0 & BS1 & BS2 & BS3;
	  BfB2 <= BS4 & BS5 & BS6 & BS7;

      A0  :  cla_adder port map (A => A(3 downto 0), B => BfB1, Cin_sub => Sub,  Sum => Sum(3 downto 0),   Cout => link);
      A1  :  cla_adder port map (A => A(7 downto 4), B => BfB2, Cin_sub => link, Sum => Sum(7 downto 4),   Cout => Cout);



end architecture;