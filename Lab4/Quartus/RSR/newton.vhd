--Newton

library IEEE;
use IEEE.std_logic_1164.all;

entity Newton is
    port  ( clk         :in  std_logic;
            x           :in  std_logic_vector (31 downto 0);
            yguess      :in  std_logic_vector (31 downto 0);
				y           :out std_logic_vector (31 downto 0));
end entity;

architecture  Newton_arch of Newton is 

    begin
	 
end architecture; 