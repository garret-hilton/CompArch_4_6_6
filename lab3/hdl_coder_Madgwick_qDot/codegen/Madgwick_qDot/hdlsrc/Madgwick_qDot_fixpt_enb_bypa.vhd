-- -------------------------------------------------------------
-- 

-- File Name: C:\EELE_466\lab3\hdl_coder_Madgwick_qDot\codegen\Madgwick_qDot\hdlsrc\Madgwick_qDot_fixpt_enb_bypa.vhd
-- Created: 2018-01-30 13:06:53
-- 
-- Generated by MATLAB 9.1, MATLAB Coder 3.2 and HDL Coder 3.9
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Madgwick_qDot_fixpt_enb_bypa
-- Source Path: 
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Madgwick_qDot_fixpt_enb_bypa IS
  PORT( clk_1                             :   IN    std_logic;
        resetx_1                          :   IN    std_logic;
        clkenable_1                       :   IN    std_logic;
        clkenable_2                       :   OUT   std_logic
        );
END Madgwick_qDot_fixpt_enb_bypa;


ARCHITECTURE rtl OF Madgwick_qDot_fixpt_enb_bypa IS

  -- Signals
  SIGNAL clkenable_3                      : std_logic;
  SIGNAL ctr0_out                         : std_logic;
  SIGNAL ctr1_out                         : std_logic;
  SIGNAL ctr2_out                         : std_logic;
  SIGNAL ctrstate_out                     : std_logic;
  SIGNAL bypass_out                       : std_logic;
  SIGNAL clkenable_4                      : std_logic;

BEGIN
  c_c_process: PROCESS (clk_1, resetx_1)
  BEGIN
    IF resetx_1 = '1' THEN
      ctr0_out <= '0';
    ELSIF rising_edge(clk_1) THEN
      ctr0_out <= clkenable_3 AND clkenable_1;
    END IF;
  END PROCESS c_c_process;

  c_c_1_process: PROCESS (clk_1, resetx_1)
  BEGIN
    IF resetx_1 = '1' THEN
      ctr1_out <= '0';
    ELSIF rising_edge(clk_1) THEN
      ctr1_out <= ctr0_out;
    END IF;
  END PROCESS c_c_1_process;

  c_c_2_process: PROCESS (clk_1, resetx_1)
  BEGIN
    IF resetx_1 = '1' THEN
      ctr2_out <= '0';
    ELSIF rising_edge(clk_1) THEN
      ctr2_out <= ctr1_out;
    END IF;
  END PROCESS c_c_2_process;

  ctrstate_out <= NOT clkenable_1 WHEN clkenable_3 = '1' ELSE
                  ctr2_out;

  c_c_3_process: PROCESS (clk_1, resetx_1)
  BEGIN
    IF resetx_1 = '1' THEN
      clkenable_3 <= '1';
    ELSIF rising_edge(clk_1) THEN
      clkenable_3 <= ctrstate_out;
    END IF;
  END PROCESS c_c_3_process;

  c_c_4_process: PROCESS (clk_1, resetx_1)
  BEGIN
    IF resetx_1 = '1' THEN
      bypass_out <= '0';
    ELSIF rising_edge(clk_1) THEN
      IF clkenable_3 = '1' THEN
        bypass_out <= clkenable_1;
      END IF;
    END IF;
  END PROCESS c_c_4_process;

  clkenable_4 <= clkenable_1 WHEN clkenable_3 = '1' ELSE
                 bypass_out;

  clkenable_2 <= clkenable_4;

END rtl;

