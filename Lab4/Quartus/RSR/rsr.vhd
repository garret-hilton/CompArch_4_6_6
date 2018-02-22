--RSR top level
library IEEE;
use IEEE.std_logic_1164.all;

entity rsr is
    port  ( clk    :in  std_logic;
            x      :in  std_logic_vector (31 downto 0);
				y      :out std_logic_vector (31 downto 0));
end entity;

architecture rsr_arch of rsr is

    component igy is 
	     port ( clk         :in  std_logic;
               x           :in  std_logic_vector (31 downto 0);
				   yGuess      :out std_logic_vector (31 downto 0));
    end component;
	 
	 component Newton is 
	     port ( clk         :in  std_logic;
               x           :in  std_logic_vector (31 downto 0);
               yguess      :in  std_logic_vector (31 downto 0);
				   y           :out std_logic_vector (31 downto 0));
    end component;
	 
	 signal yGuessSig : std_logic_vector(31 downto 0);
	 
	 begin

	 
	     A0  :  igy     port map (clk => clk, x => x, yGuess => yGuessSig );
		  A1  :  Newton  port map (clk => clk, x => x, yGuess => yGuessSig, y => y);
	 
	 
end architecture;