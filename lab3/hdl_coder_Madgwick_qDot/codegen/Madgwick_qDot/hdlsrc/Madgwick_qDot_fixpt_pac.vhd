-- -------------------------------------------------------------
-- 

-- File Name: C:\EELE_466\lab3\hdl_coder_Madgwick_qDot\codegen\Madgwick_qDot\hdlsrc\Madgwick_qDot_fixpt_pac.vhd
-- Created: 2018-01-30 13:06:53
-- 
-- Generated by MATLAB 9.1, MATLAB Coder 3.2 and HDL Coder 3.9
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE Madgwick_qDot_fixpt_pac IS
  TYPE vector_of_signed28 IS ARRAY (NATURAL RANGE <>) OF signed(27 DOWNTO 0);
  TYPE vector_of_std_logic_vector14 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(13 DOWNTO 0);
  TYPE vector_of_unsigned14 IS ARRAY (NATURAL RANGE <>) OF unsigned(13 DOWNTO 0);
  TYPE vector_of_signed14 IS ARRAY (NATURAL RANGE <>) OF signed(13 DOWNTO 0);
END Madgwick_qDot_fixpt_pac;

