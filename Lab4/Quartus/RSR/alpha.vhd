library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity alpha is
    port  ( zeroCount      :in  std_logic_vector(4 downto 0);
            clk  		   :in  std_logic;
			x              :in  std_logic_vector(31 downto 0);
			xA             :out std_logic_vector(31 downto 0);
			xB             :out std_logic_vector(31 downto 0));
			--alpha          :out signed (6 downto 0):="0000000");
end entity;

architecture alpha_arch of alpha is

   signal Zsig         :   signed(6 downto 0);
   signal Betasig       :  signed(6 downto 0);
   signal NegBetasig    :  signed(6 downto 0);
   signal LSLBetasig    :  signed(6 downto 0);
   signal LSRBetasig    :  signed(6 downto 0);
   signal xAsig           :  std_logic_vector(31 downto 0);
   signal xBsig           :  std_logic_vector(31 downto 0);
   signal alphaSig        :  signed(6 downto 0);
   signal int_A        :  integer range 0 to 25;
  
   begin

     Zsig <= "00" & signed(zeroCount);
     Betasig <= 17 - Zsig;
     NegBetasig <= -Betasig;--(Not Betasig) + 1;
     LSLBetasig <= shift_left(NegBetasig, 1); --2 * NegBeta;
     LSRBetasig <= shift_right(Betasig, 1);

  Alpha_Process : process (clk)

    begin
	  if (clk'event and clk='1') then
	  
	    if (Betasig(0) = '0') then    --IF even
		      alphaSig <= LSLBetasig + LSRBetasig; 

		else                         --IF ODD
		      alphaSig <= LSLBetasig + LSRBetasig + 1;
		   
		end if;
      end if;


    end process;
	
  x_Process : process (clk)
  	 
	begin
      if (clk'event and clk='1') then

		xASig <= std_logic_vector(shift_right(signed(x), to_integer(not alphaSig)));
		xBSig <= std_logic_vector(shift_left(signed(x), to_integer(Betasig)));
	  end if;
	  
	end process;
	
    -- Z <= Zsig;
    -- Beta <= Betasig;
    -- NegBeta <= NegBetasig;
    -- LSLBeta <= LSLBetasig;
    -- LSRBeta <= LSRBetasig;
	xA <= xAsig;
	xB <= xBsig;
	-- alpha <= alphaSig;
end architecture;
