library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port  (A, B, Cin        :in std_logic;
           Cout, Sum        :out std_logic);
end entity;

architecture full_adder_arch of full_adder is

    
    begin
	
      Sum  <= (A xor B) xor Cin;
      Cout <= (A and B) or (A and Cin) or (B and Cin);


end architecture;
