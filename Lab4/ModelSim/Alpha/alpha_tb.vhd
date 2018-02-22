
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_signed.all;

entity alpha_tb is
   
end entity;

architecture alpha_tb_arch of alpha_tb is
	constant TIME_DELTA: time := 10 ns;
	signal zeroCount :  std_logic_vector(4 downto 0);
	signal alpha_1     :  signed(5 downto 0);

	component alpha is 
	     port ( zeroCount      :in  std_logic_vector(4 downto 0);
	            alpha          :out signed (5 downto 0));
        end component;

	 begin
	    
      	    simulation: process
		begin
		    zeroCount <= "00000";
		    wait for TIME_DELTA;

		    zeroCount <= "00001";
		    wait for TIME_DELTA;

		    zeroCount <= "00010";
		    wait for TIME_DELTA;

		    zeroCount <= "00011";
		    wait for TIME_DELTA;
 	    
	    end process;

	    A0  :  alpha  port map (zeroCount => zeroCount, alpha => alpha_1);

end architecture;