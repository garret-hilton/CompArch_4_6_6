-- Initial Guess Output
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_signed.all;

entity igy is
    port  ( clk    :in  std_logic;
            x      :in  std_logic_vector (31 downto 0);
				yGuess :out std_logic_vector (31 downto 0));
end entity;

architecture igy_arch of igy is

    component lzc is 
	     port ( clk            : in  std_logic;
               lzc_vector     : in  std_logic_vector (31 downto 0);
               lzc_count      : out std_logic_vector ( 4 downto 0));
    end component;
	 
	 component rom is 
	     port ( address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		         clock		   : IN STD_LOGIC  := '1';
		         q		      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    end component;
	 
	 component alpha is 
	     port ( zeroCount      :in  std_logic_vector(4 downto 0);
               clk  		   :in  std_logic;
			      x              :in  std_logic_vector(31 downto 0);
			      xA             :out std_logic_vector(31 downto 0);
			      xB             :out std_logic_vector(31 downto 0));
    end component;
	 
	 signal zeroCount    :  std_logic_vector(4 downto 0);
	 signal alphaSig     :  signed(6 downto 0);
	 signal xA           :  std_logic_vector(31 downto 0);
	 signal xB           :  std_logic_vector(31 downto 0);
	 signal xBTT         :  std_logic_vector(7 downto 0);
	 signal xBfromRom    :  std_logic_vector(7 downto 0);
	 
	 begin
   
		xBTT <= xB (17 downto 10);
		
	   A0  :  lzc         port map (clk => clk, lzc_vector => x, lzc_count => zeroCount );
		A1  :  alpha       port map (zeroCount => zeroCount, clk => clk, x => x, xA => xA, xB => xB);--, alpha => alphaSig);
		A2  :  rom         port map (address => xBTT, clock => clk, q => xBfromROM);
		
end architecture;