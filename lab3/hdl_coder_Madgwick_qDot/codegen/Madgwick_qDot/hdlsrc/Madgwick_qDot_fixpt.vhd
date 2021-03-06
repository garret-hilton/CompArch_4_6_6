-- -------------------------------------------------------------
-- 
-- File Name: C:\EELE_466\lab3\hdl_coder_Madgwick_qDot\codegen\Madgwick_qDot\hdlsrc\Madgwick_qDot_fixpt.vhd
-- Created: 2018-01-30 13:06:53
-- 
-- Generated by MATLAB 9.1, MATLAB Coder 3.2 and HDL Coder 3.9
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 0.25
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ceout         1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- qdot1                         ceout         1
-- qdot2                         ceout         1
-- qdot3                         ceout         1
-- qdot4                         ceout         1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Madgwick_qDot_fixpt
-- Source Path: Madgwick_qDot_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Madgwick_qDot_fixpt_pac.ALL;

ENTITY Madgwick_qDot_fixpt IS
  PORT( clk                               :   IN    std_logic;
        resetx                            :   IN    std_logic;
        clkenable                         :   IN    std_logic;
        q0                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q1                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q2                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q3                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        gx                                :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        gy                                :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        gz                                :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        ceout                             :   OUT   std_logic;
        qdot1                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En8
        qdot2                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qdot3                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qdot4                             :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En7
        );
END Madgwick_qDot_fixpt;


ARCHITECTURE rtl OF Madgwick_qDot_fixpt IS

  -- Component Declarations
  COMPONENT Madgwick_qDot_fixpt_enb_bypa
    PORT( clk_1                           :   IN    std_logic;
          resetx_1                        :   IN    std_logic;
          clkenable_1                     :   IN    std_logic;
          clkenable_2                     :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Madgwick_qDot_fixpt_tc
    PORT( clk                             :   IN    std_logic;
          resetx                          :   IN    std_logic;
          clkenable                       :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_4_0                       :   OUT   std_logic;
          enb_1_4_1                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Madgwick_qDot_fixpt_enb_bypa
    USE ENTITY work.Madgwick_qDot_fixpt_enb_bypa(rtl);

  FOR ALL : Madgwick_qDot_fixpt_tc
    USE ENTITY work.Madgwick_qDot_fixpt_tc(rtl);

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL enb_1_4_0                        : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_4_1                        : std_logic;
  SIGNAL q1_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL tmp                              : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL tmp_1                            : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL p78tmp_cast                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL p78tmp_cast_1                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL gx_signed                        : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL tmp_2                            : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_3                            : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL clkenable_1                      : std_logic;
  SIGNAL alpha0_deserializer_contl_cnt    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL alpha0_deserializer_contl_validOutpu : std_logic;
  SIGNAL alpha0_deserializer_innerRegEn   : std_logic;
  SIGNAL alpha0_deserializer_innerRegCtrolEn : std_logic;
  SIGNAL alpha0_deserializer_outBypassEn  : std_logic;
  SIGNAL alpha0_deserializer_tapDelayEn   : std_logic;
  SIGNAL alpha0_deserializer_tapDelayEn_1 : std_logic;
  SIGNAL counterSig                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL c0_serial_0                      : vector_of_std_logic_vector14(0 TO 3);  -- ufix14 [4]
  SIGNAL c0_serial_0_1                    : vector_of_unsigned14(0 TO 3);  -- ufix14_En14 [4]
  SIGNAL rcc_out                          : vector_of_unsigned14(0 TO 3);  -- ufix14_En14 [4]
  SIGNAL ratechange_splitcomp_out0        : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out1        : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out2        : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out3        : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL q1_1                             : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL c0_serial_1                      : vector_of_std_logic_vector14(0 TO 3);  -- ufix14 [4]
  SIGNAL c0_serial_1_1                    : vector_of_signed14(0 TO 3);  -- sfix14_En7 [4]
  SIGNAL rcc_out_1                        : vector_of_signed14(0 TO 3);  -- sfix14_En7 [4]
  SIGNAL ratechange_splitcomp_out0_1      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out1_1      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out2_1      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out3_1      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL gz_1                             : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL multiplier_cast                  : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL multiplier_mul_temp              : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_4                            : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL alpha0_deserializer_tapout       : vector_of_signed28(0 TO 2);  -- sfix28_En21 [3]
  SIGNAL alpha0_deserializer_muxOut       : vector_of_signed28(0 TO 3);  -- sfix28_En21 [4]
  SIGNAL c0_serialOut_0                   : vector_of_signed28(0 TO 3);  -- sfix28_En21 [4]
  SIGNAL alpha0_deserializer_contl_cnt_1  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL alpha0_deserializer_contl_cntGlobal : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL alpha0_deserializer_contl_validOutpu_1 : std_logic;
  SIGNAL alpha0_deserializer_innerRegEn_1 : std_logic;
  SIGNAL alpha0_deserializer_innerRegCtrolEn_1 : std_logic;
  SIGNAL alpha0_deserializer_outBypassEn_1 : std_logic;
  SIGNAL alpha0_deserializer_tapDelayEn_2 : std_logic;
  SIGNAL alpha0_deserializer_tapDelayEn_3 : std_logic;
  SIGNAL c0_serial_0_2                    : vector_of_std_logic_vector14(0 TO 2);  -- ufix14 [3]
  SIGNAL c0_serial_0_3                    : vector_of_unsigned14(0 TO 2);  -- ufix14_En14 [3]
  SIGNAL rcc_out_2                        : vector_of_unsigned14(0 TO 2);  -- ufix14_En14 [3]
  SIGNAL ratechange_splitcomp_out0_2      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out1_2      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out2_2      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL q3_1                             : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL c0_serial_1_2                    : vector_of_std_logic_vector14(0 TO 2);  -- ufix14 [3]
  SIGNAL c0_serial_1_3                    : vector_of_signed14(0 TO 2);  -- sfix14_En7 [3]
  SIGNAL rcc_out_3                        : vector_of_signed14(0 TO 2);  -- sfix14_En7 [3]
  SIGNAL ratechange_splitcomp_out0_3      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out1_3      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out2_3      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL gx_1                             : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL multiplier_cast_1                : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL multiplier_mul_temp_1            : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_5                            : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL alpha0_deserializer_tapout_1     : vector_of_signed28(0 TO 1);  -- sfix28_En21 [2]
  SIGNAL alpha0_deserializer_muxOut_1     : vector_of_signed28(0 TO 2);  -- sfix28_En21 [3]
  SIGNAL alpha0_deserializer_deserInnerOut : vector_of_signed28(0 TO 2);  -- sfix28_En21 [3]
  SIGNAL c0_serialOut_0_1                 : vector_of_signed28(0 TO 2);  -- sfix28_En21 [3]
  SIGNAL tmp_6                            : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_7                            : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_8                            : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_9                            : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_10                           : signed(30 DOWNTO 0);  -- sfix31_En21
  SIGNAL tmp_11                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_12                           : signed(30 DOWNTO 0);  -- sfix31_En21
  SIGNAL tmp_13                           : signed(30 DOWNTO 0);  -- sfix31_En21
  SIGNAL tmp_14                           : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL p75tmp_cast                      : signed(45 DOWNTO 0);  -- sfix46_En35
  SIGNAL tmp_15                           : signed(13 DOWNTO 0);  -- sfix14_En8
  SIGNAL qDot1_1                          : signed(13 DOWNTO 0);  -- sfix14_En8
  SIGNAL alpha0_deserializer_contl_cnt_2  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL alpha0_deserializer_contl_validOutpu_2 : std_logic;
  SIGNAL alpha0_deserializer_innerRegEn_2 : std_logic;
  SIGNAL alpha0_deserializer_innerRegCtrolEn_2 : std_logic;
  SIGNAL alpha0_deserializer_outBypassEn_2 : std_logic;
  SIGNAL alpha0_deserializer_tapDelayEn_4 : std_logic;
  SIGNAL alpha0_deserializer_tapDelayEn_5 : std_logic;
  SIGNAL c0_serial_0_4                    : vector_of_std_logic_vector14(0 TO 3);  -- ufix14 [4]
  SIGNAL c0_serial_0_5                    : vector_of_unsigned14(0 TO 3);  -- ufix14_En14 [4]
  SIGNAL rcc_out_4                        : vector_of_unsigned14(0 TO 3);  -- ufix14_En14 [4]
  SIGNAL ratechange_splitcomp_out0_4      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out1_4      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out2_4      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL ratechange_splitcomp_out3_2      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL q0_1                             : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL c0_serial_1_4                    : vector_of_std_logic_vector14(0 TO 3);  -- ufix14 [4]
  SIGNAL c0_serial_1_5                    : vector_of_signed14(0 TO 3);  -- sfix14_En7 [4]
  SIGNAL rcc_out_5                        : vector_of_signed14(0 TO 3);  -- sfix14_En7 [4]
  SIGNAL ratechange_splitcomp_out0_5      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out1_5      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out2_5      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL ratechange_splitcomp_out3_3      : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL gz_2                             : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL multiplier_cast_2                : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL multiplier_mul_temp_2            : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_16                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL alpha0_deserializer_tapout_2     : vector_of_signed28(0 TO 2);  -- sfix28_En21 [3]
  SIGNAL alpha0_deserializer_muxOut_2     : vector_of_signed28(0 TO 3);  -- sfix28_En21 [4]
  SIGNAL c0_serialOut_0_2                 : vector_of_signed28(0 TO 3);  -- sfix28_En21 [4]
  SIGNAL tmp_17                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_18                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_19                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_20                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_21                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_22                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_23                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_24                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_25                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_26                           : signed(43 DOWNTO 0);  -- sfix44_En35
  SIGNAL p73tmp_cast                      : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL tmp_27                           : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot2_1                          : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL tmp_28                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_29                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_30                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_31                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_32                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_33                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_34                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_35                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_36                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_37                           : signed(43 DOWNTO 0);  -- sfix44_En35
  SIGNAL p71tmp_cast                      : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL tmp_38                           : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot3_1                          : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL tmp_39                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_40                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_41                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_42                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_43                           : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL tmp_44                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_45                           : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL tmp_46                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_47                           : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL tmp_48                           : signed(43 DOWNTO 0);  -- sfix44_En35
  SIGNAL p69tmp_cast                      : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL tmp_49                           : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot4_1                          : signed(13 DOWNTO 0);  -- sfix14_En7

BEGIN
  UMadgwick_qDot_fixpt_enb_byp : Madgwick_qDot_fixpt_enb_bypa
    PORT MAP( clk_1 => clk,
              resetx_1 => resetx,
              clkenable_1 => clkenable,
              clkenable_2 => clkenable_1
              );

  UMadgwick_qDot_fixpt_tc_1 : Madgwick_qDot_fixpt_tc
    PORT MAP( clk => clk,
              resetx => resetx,
              clkenable => clkenable_1,
              enb => enb,
              enb_1_4_0 => enb_1_4_0,
              enb_1_4_1 => enb_1_4_1
              );

  q1_unsigned <= unsigned(q1);

  -- HDL code generation from MATLAB function: Madgwick_qDot_fixpt
  -- 
  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- 
  --                                                                          %
  -- 
  --           Generated by MATLAB 9.1 and Fixed-Point Designer 5.3           %
  -- 
  --                                                                          %
  -- 
  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- 
  -- Rate of change of quaternion from gyroscope
  -- 
  -- 'Madgwick_qDot_fixpt:9' fm = get_fimath();
  -- 
  
-- 'Madgwick_qDot_fixpt:11' qDot1 = fi(fi(0.5, 0, 14, 14, fm) * (fi_signed(fi_signed(fi_uminus(q1) * gx) - q2 * gy) 
  -- - q3 * gz), 1, 14, 8, fm)
  -- 
  -- 'Madgwick_qDot_fixpt:32' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:33' if isfi( a )
  -- 
  -- 'Madgwick_qDot_fixpt:34' nt = numerictype( a );
  -- 
  -- 'Madgwick_qDot_fixpt:35' new_nt = numerictype( 1, nt.WordLength + 1, nt.FractionLength );
  -- 
  -- 'Madgwick_qDot_fixpt:36' y = -fi( a, new_nt, fimath( a ) );
  -- 
  -- 'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  -- 
  -- 'Madgwick_qDot_fixpt:25' else
  -- 
  -- 'Madgwick_qDot_fixpt:26' y = a;
  -- 
  -- 'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  -- 
  -- 'Madgwick_qDot_fixpt:25' else
  -- 
  -- 'Madgwick_qDot_fixpt:26' y = a;
  tmp <= signed(resize(q1_unsigned, 15));

  p78tmp_cast <= resize(tmp, 16);
  p78tmp_cast_1 <=  - (p78tmp_cast);
  tmp_1 <= p78tmp_cast_1(14 DOWNTO 0);

  gx_signed <= signed(gx);

  tmp_2 <= tmp_1 * gx_signed;

  tmp_3 <= resize(tmp_2, 30);

  alpha0_deserializer_contl_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      alpha0_deserializer_contl_cnt <= to_unsigned(16#0#, 3);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        IF alpha0_deserializer_contl_cnt = to_unsigned(16#3#, 3) THEN 
          alpha0_deserializer_contl_cnt <= to_unsigned(16#0#, 3);
        ELSE 
          alpha0_deserializer_contl_cnt <= alpha0_deserializer_contl_cnt + to_unsigned(16#1#, 3);
        END IF;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_contl_process;

  alpha0_deserializer_tapDelayEn <= hdlcoder_to_stdlogic(alpha0_deserializer_contl_cnt < to_unsigned(16#3#, 
    3));
  
  alpha0_deserializer_contl_validOutpu <= '1' WHEN alpha0_deserializer_contl_cnt = to_unsigned(16#3#, 3) ELSE
      '0';
  
  alpha0_deserializer_innerRegEn <= '1' WHEN alpha0_deserializer_contl_validOutpu = '1' ELSE
      '0';
  
  alpha0_deserializer_innerRegCtrolEn <= '1' WHEN alpha0_deserializer_contl_validOutpu = '1' ELSE
      '0';
  alpha0_deserializer_outBypassEn <= '1';

  alpha0_deserializer_tapDelayEn_1 <= enb AND alpha0_deserializer_tapDelayEn;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 3
  ctr_0_3_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      counterSig <= to_unsigned(16#0#, 2);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        counterSig <= counterSig + to_unsigned(16#1#, 2);
      END IF;
    END IF;
  END PROCESS ctr_0_3_process;


  c0_serial_0(0) <= q1;
  c0_serial_0(1) <= q2;
  c0_serial_0(2) <= q2;
  c0_serial_0(3) <= q2;

  outputgen5: FOR kk IN 0 TO 3 GENERATE
    c0_serial_0_1(kk) <= unsigned(c0_serial_0(kk));
  END GENERATE;

  rcc_out <= c0_serial_0_1;

  ratechange_splitcomp_out0 <= rcc_out(0);

  ratechange_splitcomp_out1 <= rcc_out(1);

  ratechange_splitcomp_out2 <= rcc_out(2);

  ratechange_splitcomp_out3 <= rcc_out(3);

  
  q1_1 <= ratechange_splitcomp_out0 WHEN counterSig = to_unsigned(16#0#, 2) ELSE
      ratechange_splitcomp_out1 WHEN counterSig = to_unsigned(16#1#, 2) ELSE
      ratechange_splitcomp_out2 WHEN counterSig = to_unsigned(16#2#, 2) ELSE
      ratechange_splitcomp_out3;

  c0_serial_1(0) <= gz;
  c0_serial_1(1) <= gx;
  c0_serial_1(2) <= gz;
  c0_serial_1(3) <= gy;

  outputgen4: FOR kk IN 0 TO 3 GENERATE
    c0_serial_1_1(kk) <= signed(c0_serial_1(kk));
  END GENERATE;

  rcc_out_1 <= c0_serial_1_1;

  ratechange_splitcomp_out0_1 <= rcc_out_1(0);

  ratechange_splitcomp_out1_1 <= rcc_out_1(1);

  ratechange_splitcomp_out2_1 <= rcc_out_1(2);

  ratechange_splitcomp_out3_1 <= rcc_out_1(3);

  
  gz_1 <= ratechange_splitcomp_out0_1 WHEN counterSig = to_unsigned(16#0#, 2) ELSE
      ratechange_splitcomp_out1_1 WHEN counterSig = to_unsigned(16#1#, 2) ELSE
      ratechange_splitcomp_out2_1 WHEN counterSig = to_unsigned(16#2#, 2) ELSE
      ratechange_splitcomp_out3_1;

  multiplier_cast <= signed(resize(q1_1, 15));
  multiplier_mul_temp <= multiplier_cast * gz_1;
  tmp_4 <= multiplier_mul_temp(27 DOWNTO 0);

  alpha0_deserializer_tapDelayComp_pro : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      alpha0_deserializer_tapout <= (OTHERS => to_signed(16#0000000#, 28));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' AND alpha0_deserializer_tapDelayEn_1 = '1' THEN
        alpha0_deserializer_tapout(2) <= tmp_4;
        alpha0_deserializer_tapout(0 TO 1) <= alpha0_deserializer_tapout(1 TO 2);
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_tapDelayComp_pro;


  alpha0_deserializer_muxOut(0) <= alpha0_deserializer_tapout(0);
  alpha0_deserializer_muxOut(1) <= alpha0_deserializer_tapout(1);
  alpha0_deserializer_muxOut(2) <= alpha0_deserializer_tapout(2);
  alpha0_deserializer_muxOut(3) <= tmp_4;

  alpha0_deserializer_regComp_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      c0_serialOut_0 <= (OTHERS => to_signed(16#0000000#, 28));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' AND alpha0_deserializer_innerRegEn = '1' THEN
        c0_serialOut_0 <= alpha0_deserializer_muxOut;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_regComp_process;


  alpha0_deserializer_contl_1_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      alpha0_deserializer_contl_cnt_1 <= to_unsigned(16#0#, 3);
      alpha0_deserializer_contl_cntGlobal <= to_unsigned(16#0#, 3);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        IF alpha0_deserializer_contl_cnt_1 = to_unsigned(16#3#, 3) THEN 
          alpha0_deserializer_contl_cnt_1 <= to_unsigned(16#0#, 3);
        ELSE 
          alpha0_deserializer_contl_cnt_1 <= alpha0_deserializer_contl_cnt_1 + to_unsigned(16#1#, 3);
        END IF;
        IF alpha0_deserializer_contl_cntGlobal = to_unsigned(16#3#, 3) THEN 
          alpha0_deserializer_contl_cntGlobal <= to_unsigned(16#0#, 3);
        ELSE 
          alpha0_deserializer_contl_cntGlobal <= alpha0_deserializer_contl_cntGlobal + to_unsigned(16#1#, 3);
        END IF;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_contl_1_process;

  alpha0_deserializer_tapDelayEn_2 <= hdlcoder_to_stdlogic(alpha0_deserializer_contl_cnt_1 < 
    to_unsigned(16#2#, 3));
  
  alpha0_deserializer_contl_validOutpu_1 <= '1' WHEN alpha0_deserializer_contl_cnt_1 = to_unsigned(16#2#, 3) 
    ELSE
      '0';
  
  alpha0_deserializer_innerRegEn_1 <= '1' WHEN alpha0_deserializer_contl_validOutpu_1 = '1' ELSE
      '0';
  
  alpha0_deserializer_innerRegCtrolEn_1 <= '1' WHEN alpha0_deserializer_contl_validOutpu_1 = '1' ELSE
      '0';
  
  alpha0_deserializer_outBypassEn_1 <= '1' WHEN alpha0_deserializer_contl_cntGlobal = to_unsigned(16#3#, 3) 
    ELSE
      '0';

  alpha0_deserializer_tapDelayEn_3 <= enb AND alpha0_deserializer_tapDelayEn_2;

  c0_serial_0_2(0) <= q3;
  c0_serial_0_2(1) <= q3;
  c0_serial_0_2(2) <= q3;

  outputgen3: FOR kk IN 0 TO 2 GENERATE
    c0_serial_0_3(kk) <= unsigned(c0_serial_0_2(kk));
  END GENERATE;

  rcc_out_2 <= c0_serial_0_3;

  ratechange_splitcomp_out0_2 <= rcc_out_2(0);

  ratechange_splitcomp_out1_2 <= rcc_out_2(1);

  ratechange_splitcomp_out2_2 <= rcc_out_2(2);

  
  q3_1 <= ratechange_splitcomp_out0_2 WHEN counterSig = to_unsigned(16#0#, 2) ELSE
      ratechange_splitcomp_out1_2 WHEN counterSig = to_unsigned(16#1#, 2) ELSE
      ratechange_splitcomp_out2_2 WHEN counterSig = to_unsigned(16#2#, 2) ELSE
      ratechange_splitcomp_out2_2;

  c0_serial_1_2(0) <= gx;
  c0_serial_1_2(1) <= gy;
  c0_serial_1_2(2) <= gz;

  outputgen2: FOR kk IN 0 TO 2 GENERATE
    c0_serial_1_3(kk) <= signed(c0_serial_1_2(kk));
  END GENERATE;

  rcc_out_3 <= c0_serial_1_3;

  ratechange_splitcomp_out0_3 <= rcc_out_3(0);

  ratechange_splitcomp_out1_3 <= rcc_out_3(1);

  ratechange_splitcomp_out2_3 <= rcc_out_3(2);

  
  gx_1 <= ratechange_splitcomp_out0_3 WHEN counterSig = to_unsigned(16#0#, 2) ELSE
      ratechange_splitcomp_out1_3 WHEN counterSig = to_unsigned(16#1#, 2) ELSE
      ratechange_splitcomp_out2_3 WHEN counterSig = to_unsigned(16#2#, 2) ELSE
      ratechange_splitcomp_out2_3;

  multiplier_cast_1 <= signed(resize(q3_1, 15));
  multiplier_mul_temp_1 <= multiplier_cast_1 * gx_1;
  tmp_5 <= multiplier_mul_temp_1(27 DOWNTO 0);

  alpha0_deserializer_tapDelayComp_1_p : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      alpha0_deserializer_tapout_1 <= (OTHERS => to_signed(16#0000000#, 28));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' AND alpha0_deserializer_tapDelayEn_3 = '1' THEN
        alpha0_deserializer_tapout_1(0) <= alpha0_deserializer_tapout_1(1);
        alpha0_deserializer_tapout_1(1) <= tmp_5;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_tapDelayComp_1_p;


  alpha0_deserializer_muxOut_1(0) <= alpha0_deserializer_tapout_1(0);
  alpha0_deserializer_muxOut_1(1) <= alpha0_deserializer_tapout_1(1);
  alpha0_deserializer_muxOut_1(2) <= tmp_5;

  alpha0_deserializer_innerRegComp_pro : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      alpha0_deserializer_deserInnerOut <= (OTHERS => to_signed(16#0000000#, 28));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' AND alpha0_deserializer_innerRegEn_1 = '1' THEN
        alpha0_deserializer_deserInnerOut <= alpha0_deserializer_muxOut_1;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_innerRegComp_pro;


  alpha0_deserializer_OutRegComp_proce : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      c0_serialOut_0_1 <= (OTHERS => to_signed(16#0000000#, 28));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' AND alpha0_deserializer_outBypassEn_1 = '1' THEN
        c0_serialOut_0_1 <= alpha0_deserializer_deserInnerOut;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_OutRegComp_proce;


  delayMatch_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      tmp_6 <= to_signed(16#00000000#, 30);
    ELSIF rising_edge(clk) THEN
      IF enb_1_4_0 = '1' THEN
        tmp_6 <= tmp_3;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  tmp_7 <= c0_serialOut_0(3);

  tmp_8 <= resize(tmp_7, 30);

  tmp_9 <= tmp_6 - tmp_8;

  tmp_10 <= resize(tmp_9, 31);

  tmp_11 <= c0_serialOut_0_1(2);

  tmp_12 <= resize(tmp_11, 31);

  tmp_13 <= tmp_10 - tmp_12;

  p75tmp_cast <= resize(tmp_13 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 
    46);
  tmp_14 <= p75tmp_cast(44 DOWNTO 0);

  tmp_15 <= tmp_14(40 DOWNTO 27);

  qDot1_reg_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      qDot1_1 <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb_1_4_0 = '1' THEN
        qDot1_1 <= tmp_15;
      END IF;
    END IF;
  END PROCESS qDot1_reg_process;


  qdot1 <= std_logic_vector(qDot1_1);

  alpha0_deserializer_contl_2_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      alpha0_deserializer_contl_cnt_2 <= to_unsigned(16#0#, 3);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        IF alpha0_deserializer_contl_cnt_2 = to_unsigned(16#3#, 3) THEN 
          alpha0_deserializer_contl_cnt_2 <= to_unsigned(16#0#, 3);
        ELSE 
          alpha0_deserializer_contl_cnt_2 <= alpha0_deserializer_contl_cnt_2 + to_unsigned(16#1#, 3);
        END IF;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_contl_2_process;

  alpha0_deserializer_tapDelayEn_4 <= hdlcoder_to_stdlogic(alpha0_deserializer_contl_cnt_2 < 
    to_unsigned(16#3#, 3));
  
  alpha0_deserializer_contl_validOutpu_2 <= '1' WHEN alpha0_deserializer_contl_cnt_2 = to_unsigned(16#3#, 3) 
    ELSE
      '0';
  
  alpha0_deserializer_innerRegEn_2 <= '1' WHEN alpha0_deserializer_contl_validOutpu_2 = '1' ELSE
      '0';
  
  alpha0_deserializer_innerRegCtrolEn_2 <= '1' WHEN alpha0_deserializer_contl_validOutpu_2 = '1' ELSE
      '0';
  alpha0_deserializer_outBypassEn_2 <= '1';

  alpha0_deserializer_tapDelayEn_5 <= enb AND alpha0_deserializer_tapDelayEn_4;

  c0_serial_0_4(0) <= q0;
  c0_serial_0_4(1) <= q0;
  c0_serial_0_4(2) <= q0;
  c0_serial_0_4(3) <= q1;

  outputgen1: FOR kk IN 0 TO 3 GENERATE
    c0_serial_0_5(kk) <= unsigned(c0_serial_0_4(kk));
  END GENERATE;

  rcc_out_4 <= c0_serial_0_5;

  ratechange_splitcomp_out0_4 <= rcc_out_4(0);

  ratechange_splitcomp_out1_4 <= rcc_out_4(1);

  ratechange_splitcomp_out2_4 <= rcc_out_4(2);

  ratechange_splitcomp_out3_2 <= rcc_out_4(3);

  
  q0_1 <= ratechange_splitcomp_out0_4 WHEN counterSig = to_unsigned(16#0#, 2) ELSE
      ratechange_splitcomp_out1_4 WHEN counterSig = to_unsigned(16#1#, 2) ELSE
      ratechange_splitcomp_out2_4 WHEN counterSig = to_unsigned(16#2#, 2) ELSE
      ratechange_splitcomp_out3_2;

  c0_serial_1_4(0) <= gz;
  c0_serial_1_4(1) <= gy;
  c0_serial_1_4(2) <= gx;
  c0_serial_1_4(3) <= gy;

  outputgen: FOR kk IN 0 TO 3 GENERATE
    c0_serial_1_5(kk) <= signed(c0_serial_1_4(kk));
  END GENERATE;

  rcc_out_5 <= c0_serial_1_5;

  ratechange_splitcomp_out0_5 <= rcc_out_5(0);

  ratechange_splitcomp_out1_5 <= rcc_out_5(1);

  ratechange_splitcomp_out2_5 <= rcc_out_5(2);

  ratechange_splitcomp_out3_3 <= rcc_out_5(3);

  
  gz_2 <= ratechange_splitcomp_out0_5 WHEN counterSig = to_unsigned(16#0#, 2) ELSE
      ratechange_splitcomp_out1_5 WHEN counterSig = to_unsigned(16#1#, 2) ELSE
      ratechange_splitcomp_out2_5 WHEN counterSig = to_unsigned(16#2#, 2) ELSE
      ratechange_splitcomp_out3_3;

  
-- 'Madgwick_qDot_fixpt:14' qDot4 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gz + q1 * gy) - q2 * gx), 1, 14, 
  -- 7, fm)
  -- 
  -- 'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  -- 
  -- 'Madgwick_qDot_fixpt:25' else
  -- 
  -- 'Madgwick_qDot_fixpt:26' y = a;
  -- 
  
-- 'Madgwick_qDot_fixpt:13' qDot3 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gy) - q1 * gz + q3 * gx), 1, 14, 
  -- 7, fm)
  -- 
  -- 'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  -- 
  -- 'Madgwick_qDot_fixpt:25' else
  -- 
  -- 'Madgwick_qDot_fixpt:26' y = a;
  -- 
  
-- 'Madgwick_qDot_fixpt:12' qDot2 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gx + q2 * gz) - q3 * gy), 1, 14, 
  -- 7, fm)
  -- 
  -- 'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  -- 
  -- 'Madgwick_qDot_fixpt:25' else
  -- 
  -- 'Madgwick_qDot_fixpt:26' y = a;
  -- 
  
-- 'Madgwick_qDot_fixpt:13' qDot3 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gy) - q1 * gz + q3 * gx), 1, 14, 
  -- 7, fm)
  -- 
  -- 'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  -- 
  -- 'Madgwick_qDot_fixpt:25' else
  -- 
  -- 'Madgwick_qDot_fixpt:26' y = a;
  -- 
  
-- 'Madgwick_qDot_fixpt:12' qDot2 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gx + q2 * gz) - q3 * gy), 1, 14, 
  -- 7, fm)
  -- 
  -- 'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  -- 
  -- 'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  -- 
  -- 'Madgwick_qDot_fixpt:25' else
  -- 
  -- 'Madgwick_qDot_fixpt:26' y = a;
  multiplier_cast_2 <= signed(resize(q0_1, 15));
  multiplier_mul_temp_2 <= multiplier_cast_2 * gz_2;
  tmp_16 <= multiplier_mul_temp_2(27 DOWNTO 0);

  alpha0_deserializer_tapDelayComp_2_p : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      alpha0_deserializer_tapout_2 <= (OTHERS => to_signed(16#0000000#, 28));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' AND alpha0_deserializer_tapDelayEn_5 = '1' THEN
        alpha0_deserializer_tapout_2(2) <= tmp_16;
        alpha0_deserializer_tapout_2(0 TO 1) <= alpha0_deserializer_tapout_2(1 TO 2);
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_tapDelayComp_2_p;


  alpha0_deserializer_muxOut_2(0) <= alpha0_deserializer_tapout_2(0);
  alpha0_deserializer_muxOut_2(1) <= alpha0_deserializer_tapout_2(1);
  alpha0_deserializer_muxOut_2(2) <= alpha0_deserializer_tapout_2(2);
  alpha0_deserializer_muxOut_2(3) <= tmp_16;

  alpha0_deserializer_regComp_1_proces : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      c0_serialOut_0_2 <= (OTHERS => to_signed(16#0000000#, 28));
    ELSIF rising_edge(clk) THEN
      IF enb = '1' AND alpha0_deserializer_innerRegEn_2 = '1' THEN
        c0_serialOut_0_2 <= alpha0_deserializer_muxOut_2;
      END IF;
    END IF;
  END PROCESS alpha0_deserializer_regComp_1_proces;


  tmp_17 <= c0_serialOut_0_2(2);

  tmp_18 <= resize(tmp_17, 29);

  tmp_19 <= c0_serialOut_0(2);

  tmp_20 <= resize(tmp_19, 29);

  tmp_21 <= tmp_18 + tmp_20;

  tmp_22 <= resize(tmp_21, 30);

  tmp_23 <= c0_serialOut_0_1(1);

  tmp_24 <= resize(tmp_23, 30);

  tmp_25 <= tmp_22 - tmp_24;

  p73tmp_cast <= resize(tmp_25 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 
    45);
  tmp_26 <= p73tmp_cast(43 DOWNTO 0);

  tmp_27 <= tmp_26(41 DOWNTO 28);

  qDot2_reg_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      qDot2_1 <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb_1_4_0 = '1' THEN
        qDot2_1 <= tmp_27;
      END IF;
    END IF;
  END PROCESS qDot2_reg_process;


  qdot2 <= std_logic_vector(qDot2_1);

  tmp_28 <= c0_serialOut_0_2(1);

  tmp_29 <= resize(tmp_28, 29);

  tmp_30 <= c0_serialOut_0(0);

  tmp_31 <= resize(tmp_30, 29);

  tmp_32 <= tmp_29 - tmp_31;

  tmp_33 <= resize(tmp_32, 30);

  tmp_34 <= c0_serialOut_0_1(0);

  tmp_35 <= resize(tmp_34, 30);

  tmp_36 <= tmp_33 + tmp_35;

  p71tmp_cast <= resize(tmp_36 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 
    45);
  tmp_37 <= p71tmp_cast(43 DOWNTO 0);

  tmp_38 <= tmp_37(41 DOWNTO 28);

  qDot3_reg_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      qDot3_1 <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb_1_4_0 = '1' THEN
        qDot3_1 <= tmp_38;
      END IF;
    END IF;
  END PROCESS qDot3_reg_process;


  qdot3 <= std_logic_vector(qDot3_1);

  tmp_39 <= c0_serialOut_0_2(0);

  tmp_40 <= resize(tmp_39, 29);

  tmp_41 <= c0_serialOut_0_2(3);

  tmp_42 <= resize(tmp_41, 29);

  tmp_43 <= tmp_40 + tmp_42;

  tmp_44 <= resize(tmp_43, 30);

  tmp_45 <= c0_serialOut_0(1);

  tmp_46 <= resize(tmp_45, 30);

  tmp_47 <= tmp_44 - tmp_46;

  p69tmp_cast <= resize(tmp_47 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 
    45);
  tmp_48 <= p69tmp_cast(43 DOWNTO 0);

  tmp_49 <= tmp_48(41 DOWNTO 28);

  qDot4_reg_process : PROCESS (clk, resetx)
  BEGIN
    IF resetx = '1' THEN
      qDot4_1 <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb_1_4_0 = '1' THEN
        qDot4_1 <= tmp_49;
      END IF;
    END IF;
  END PROCESS qDot4_reg_process;


  qdot4 <= std_logic_vector(qDot4_1);

  ceout <= enb_1_4_1;

END rtl;

