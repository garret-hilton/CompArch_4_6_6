-- -------------------------------------------------------------
-- 

-- File Name: C:\EELE466\GHC_DDC\lab3\hdl_coder_Madgwick_correction\codegen\Madgwick_correction\hdlsrc\Madgwick_correction_fixpt_pac.vhd
-- Created: 2018-02-06 13:35:26
-- 
-- Generated by MATLAB 9.3, MATLAB Coder 3.4 and HDL Coder 3.11
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE Madgwick_correction_fixpt_pac IS
  TYPE vector_of_unsigned28 IS ARRAY (NATURAL RANGE <>) OF unsigned(27 DOWNTO 0);
  TYPE vector_of_signed31 IS ARRAY (NATURAL RANGE <>) OF signed(30 DOWNTO 0);
  TYPE vector_of_signed39 IS ARRAY (NATURAL RANGE <>) OF signed(38 DOWNTO 0);
  TYPE vector_of_signed29 IS ARRAY (NATURAL RANGE <>) OF signed(28 DOWNTO 0);
  TYPE vector_of_signed19 IS ARRAY (NATURAL RANGE <>) OF signed(18 DOWNTO 0);
  TYPE vector_of_unsigned14 IS ARRAY (NATURAL RANGE <>) OF unsigned(13 DOWNTO 0);
  TYPE vector_of_unsigned42 IS ARRAY (NATURAL RANGE <>) OF unsigned(41 DOWNTO 0);
  TYPE vector_of_signed35 IS ARRAY (NATURAL RANGE <>) OF signed(34 DOWNTO 0);
  TYPE vector_of_signed37 IS ARRAY (NATURAL RANGE <>) OF signed(36 DOWNTO 0);
  TYPE vector_of_signed54 IS ARRAY (NATURAL RANGE <>) OF signed(53 DOWNTO 0);
  TYPE vector_of_signed56 IS ARRAY (NATURAL RANGE <>) OF signed(55 DOWNTO 0);
  TYPE vector_of_signed15 IS ARRAY (NATURAL RANGE <>) OF signed(14 DOWNTO 0);
  TYPE vector_of_unsigned15 IS ARRAY (NATURAL RANGE <>) OF unsigned(14 DOWNTO 0);
  TYPE vector_of_signed34 IS ARRAY (NATURAL RANGE <>) OF signed(33 DOWNTO 0);
  TYPE vector_of_signed36 IS ARRAY (NATURAL RANGE <>) OF signed(35 DOWNTO 0);
  TYPE vector_of_signed38 IS ARRAY (NATURAL RANGE <>) OF signed(37 DOWNTO 0);
  TYPE vector_of_signed55 IS ARRAY (NATURAL RANGE <>) OF signed(54 DOWNTO 0);
  TYPE vector_of_signed57 IS ARRAY (NATURAL RANGE <>) OF signed(56 DOWNTO 0);
  TYPE vector_of_signed30 IS ARRAY (NATURAL RANGE <>) OF signed(29 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
  TYPE vector_of_signed33 IS ARRAY (NATURAL RANGE <>) OF signed(32 DOWNTO 0);
  TYPE vector_of_signed17 IS ARRAY (NATURAL RANGE <>) OF signed(16 DOWNTO 0);
  TYPE vector_of_signed28 IS ARRAY (NATURAL RANGE <>) OF signed(27 DOWNTO 0);
  TYPE vector_of_signed64 IS ARRAY (NATURAL RANGE <>) OF signed(63 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed14 IS ARRAY (NATURAL RANGE <>) OF signed(13 DOWNTO 0);
  TYPE vector_of_signed66 IS ARRAY (NATURAL RANGE <>) OF signed(65 DOWNTO 0);
  TYPE vector_of_signed65 IS ARRAY (NATURAL RANGE <>) OF signed(64 DOWNTO 0);
  TYPE vector_of_signed41 IS ARRAY (NATURAL RANGE <>) OF signed(40 DOWNTO 0);
  TYPE vector_of_signed69 IS ARRAY (NATURAL RANGE <>) OF signed(68 DOWNTO 0);
  TYPE vector_of_signed67 IS ARRAY (NATURAL RANGE <>) OF signed(66 DOWNTO 0);
  TYPE vector_of_std_logic_vector14 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(13 DOWNTO 0);
  TYPE vector_of_signed24 IS ARRAY (NATURAL RANGE <>) OF signed(23 DOWNTO 0);
  TYPE vector_of_signed25 IS ARRAY (NATURAL RANGE <>) OF signed(24 DOWNTO 0);
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_unsigned17 IS ARRAY (NATURAL RANGE <>) OF unsigned(16 DOWNTO 0);
END Madgwick_correction_fixpt_pac;
