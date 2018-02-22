library IEEE;
use IEEE.std_logic_1164.all;

entity cla_adder is
    port  (A, B        :in std_logic_vector(3 downto 0);
	       Cin_sub     :in std_logic;
           Sum         :out std_logic_vector(3 downto 0);
		   Cout        :out std_logic);
end entity;

architecture cla_adder_arch of cla_adder is

      component mod_full_adder
	      port  (A, B, Cin        :in std_logic;
                 Sum, P, G        :out std_logic);
      end component;
	
	  signal C0, C1, C2, C3  :  std_logic;
	  signal P, G            :  std_logic_vector(3 downto 0);
	
    begin
	
      C0 <= Cin_sub;
      C1 <= G(0) or (P(0) and C0);
      C2 <= G(1) or (P(1) and C1);
      C3 <= G(2) or (P(2) and C2);
      Cout <= G(3) or (P(3) and C3);


      A0  :  mod_full_adder port map (A => A(0), B => B(0), Cin => C0,  Sum => Sum(0),   P => P(0),   G => G(0));
      A1  :  mod_full_adder port map (A => A(1), B => B(1), Cin => C1,  Sum => Sum(1),   P => P(1),   G => G(1));
      A2  :  mod_full_adder port map (A => A(2), B => B(2), Cin => C2,  Sum => Sum(2),   P => P(2),   G => G(2));
      A3  :  mod_full_adder port map (A => A(3), B => B(3), Cin => C3,  Sum => Sum(3),   P => P(3),   G => G(3));



end architecture;