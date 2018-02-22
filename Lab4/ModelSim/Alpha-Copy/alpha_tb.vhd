
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_signed.all;

entity alpha_tb is
  port (Z              :out signed(6 downto 0);
  Beta           :out signed(6 downto 0);
  NegBeta        :out signed(6 downto 0);
  LSLBeta        :out signed(6 downto 0);
  LSRBeta        :out signed(6 downto 0));
end entity;

architecture alpha_tb_arch of alpha_tb is
  constant TIME_DELTA: time := 10 ns;
  signal zeroCount :  std_logic_vector(4 downto 0);
  signal alpha_1     :  signed(6 downto 0);
  signal clk_in      : std_logic;
  signal xA             : std_logic_vector(31 downto 0);
  signal xB             : std_logic_vector(31 downto 0);
  signal x           : std_logic_vector(31 downto 0):="10000000000000000000000000000001";
 

  component alpha is
       port ( zeroCount      :in  std_logic_vector(4 downto 0);
	         clk		    :in std_logic;
			 x              :in  std_logic_vector(31 downto 0);
			 xA             :out std_logic_vector(31 downto 0);
			 xB             :out std_logic_vector(31 downto 0);
             Z              :out signed(6 downto 0);
             Beta           :out signed(6 downto 0);
             NegBeta        :out signed(6 downto 0);
             LSLBeta        :out signed(6 downto 0);
             LSRBeta        :out signed(6 downto 0);
             alpha          :out signed (6 downto 0));
        end component;

   begin

      CLOCK_STIM : process 
	      begin
		    clk_in <= '0'; wait for 0.25*TIME_DELTA;
			clk_in <= '1'; wait for 0.25*TIME_DELTA;
		  end process;
      simulation: process
          begin
				--- 
              zeroCount <= "00000";
              wait for TIME_DELTA;

              zeroCount <= "00001";
              wait for TIME_DELTA;

              zeroCount <= "00010";
              wait for TIME_DELTA;

              zeroCount <= "00011";
              wait for TIME_DELTA;
			  
			  zeroCount <= "00100";
              wait for TIME_DELTA;

              zeroCount <= "00101";
              wait for TIME_DELTA;

              zeroCount <= "00110";
              wait for TIME_DELTA;

              zeroCount <= "00111";
              wait for TIME_DELTA;
			  
			  zeroCount <= "01000";
              wait for TIME_DELTA;

              zeroCount <= "01001";
              wait for TIME_DELTA;

              zeroCount <= "01010";
              wait for TIME_DELTA;

              zeroCount <= "01011";
              wait for TIME_DELTA;
			  
			  zeroCount <= "01100";
              wait for TIME_DELTA;
			  
              zeroCount <= "01101";
              wait for TIME_DELTA;

              zeroCount <= "01110";
              wait for TIME_DELTA;
			  
			  zeroCount <= "01111";
              wait for TIME_DELTA;
			  
			  --
			  
              zeroCount <= "10000";
              wait for TIME_DELTA;

              zeroCount <= "10001";
              wait for TIME_DELTA;

              zeroCount <= "10010";
              wait for TIME_DELTA;

              zeroCount <= "10011";
              wait for TIME_DELTA;
			  
			  zeroCount <= "10100";
              wait for TIME_DELTA;

              zeroCount <= "10101";
              wait for TIME_DELTA;

              zeroCount <= "10110";
              wait for TIME_DELTA;

              zeroCount <= "10111";
              wait for TIME_DELTA;
			  
			  zeroCount <= "11000";
              wait for TIME_DELTA;

              zeroCount <= "11001";
              wait for TIME_DELTA;

              zeroCount <= "11010";
              wait for TIME_DELTA;

              zeroCount <= "11011";
              wait for TIME_DELTA;
			  
			  zeroCount <= "11100";
              wait for TIME_DELTA;
			  
              zeroCount <= "11101";
              wait for TIME_DELTA;

              zeroCount <= "11110";
              wait for TIME_DELTA;
			  
			  zeroCount <= "11111";
              wait for TIME_DELTA;

      end process;

      A0  :  alpha  port map (zeroCount => zeroCount, clk => clk_in, x => x, xA => xA, xB => xB, Z => Z, Beta => Beta, NegBeta => NegBeta, LSLBeta => LSLBeta, LSRBeta => LSRBeta, alpha => alpha_1);

end architecture;
