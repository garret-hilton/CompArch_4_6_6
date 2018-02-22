library IEEE;
use IEEE.std_logic_1164.all;

entity rca_eight_bit is
    port  (A, B        :in std_logic_vector(7 downto 0);
           Sub         :in std_logic;
           Cout        :out std_logic;
           Sum         :out std_logic_vector(7 downto 0));
end entity;

architecture rca_eight_bit_arch of rca_eight_bit is

    component full_adder is
        port  (A, B, Cin        :in std_logic;
               Cout, Sum        :out std_logic);
    end component;

    signal C1, C2, C3, C4, C5, C6, C7 : std_logic;

    signal BS0, BS1, BS2, BS3, BS4, BS5, BS6, BS7 : std_logic;
 

    begin
	
      BS0 <= (B(0) xor Sub);
      BS1 <= (B(1) xor Sub);
      BS2 <= (B(2) xor Sub);
      BS3 <= (B(3) xor Sub);
      BS4 <= (B(4) xor Sub);
      BS5 <= (B(5) xor Sub);
      BS6 <= (B(6) xor Sub);
      BS7 <= (B(7) xor Sub);

      A0  :  full_adder port map (A => A(0), B => BS0, Cin => Sub, Cout => C1,   Sum => Sum(0));
      A1  :  full_adder port map (A => A(1), B => BS1, Cin => C1,  Cout => C2,   Sum => Sum(1));
      A2  :  full_adder port map (A => A(2), B => BS2, Cin => C2,  Cout => C3,   Sum => Sum(2));
      A3  :  full_adder port map (A => A(3), B => BS3, Cin => C3,  Cout => C4,   Sum => Sum(3));
      A4  :  full_adder port map (A => A(4), B => BS4, Cin => C4,  Cout => C5,   Sum => Sum(4));
      A5  :  full_adder port map (A => A(5), B => BS5, Cin => C5,  Cout => C6,   Sum => Sum(5));
      A6  :  full_adder port map (A => A(6), B => BS6, Cin => C6,  Cout => C7,   Sum => Sum(6));
      A7  :  full_adder port map (A => A(7), B => BS7, Cin => C7,  Cout => Cout, Sum => Sum(7)); 


end architecture;