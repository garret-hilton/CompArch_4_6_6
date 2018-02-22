library IEEE;
use IEEE.std_logic_1164.all;

entity mod_full_adder is
    port  (A, B, Cin        :in std_logic;
           Sum, P, G        :out std_logic);
end entity;

architecture mod_full_adder_arch of mod_full_adder is

    
    begin
	
      Sum  <= (A xor B) xor Cin;
	  P    <= (A xor B);
	  G    <= (A and B);


end architecture;
