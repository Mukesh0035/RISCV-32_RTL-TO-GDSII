// This is the unpowered netlist.
module riscv32 (clk,
    halt,
    reset,
    R0,
    R1,
    R2,
    R3,
    instr,
    pc);
 input clk;
 output halt;
 input reset;
 output [3:0] R0;
 output [3:0] R1;
 output [3:0] R2;
 output [3:0] R3;
 output [7:0] instr;
 output [3:0] pc;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire net1;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net3;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net4;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_fd_sc_hd__fill_2 FILLER_0_0_20 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_49 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_62 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_66 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_83 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_91 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_10_12 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_43 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_51 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_68 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_83 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_10 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11_81 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_23 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_28 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_48 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_13_52 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_70 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_37 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_37 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_15_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_55 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_15_63 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_72 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_82 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_15_91 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_55 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_1_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_83 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_1_90 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_40 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_73 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_77 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_18 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_40 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_3_68 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_76 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_19 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_40 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_47 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_59 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_63 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_74 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_17 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_29 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_5_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_5_36 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_43 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_55 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_6_29 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_6_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_6_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_45 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_49 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_72 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_76 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_28 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_55 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_66 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_74 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_92 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_48 ();
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_58 ();
 sky130_fd_sc_hd__inv_2 _072_ (.A(net40),
    .Y(_000_));
 sky130_fd_sc_hd__inv_2 _073_ (.A(net31),
    .Y(net19));
 sky130_fd_sc_hd__nor2_2 _074_ (.A(_000_),
    .B(net19),
    .Y(net18));
 sky130_fd_sc_hd__or2_2 _075_ (.A(net27),
    .B(net31),
    .X(_042_));
 sky130_fd_sc_hd__inv_2 _076_ (.A(_042_),
    .Y(net20));
 sky130_fd_sc_hd__nand2b_2 _077_ (.A_N(net31),
    .B(net27),
    .Y(_043_));
 sky130_fd_sc_hd__inv_2 _078_ (.A(_043_),
    .Y(net23));
 sky130_fd_sc_hd__or2b_1 _079_ (.A(net27),
    .B_N(net31),
    .X(_044_));
 sky130_fd_sc_hd__buf_2 _080_ (.A(_044_),
    .X(_045_));
 sky130_fd_sc_hd__inv_2 _081_ (.A(_045_),
    .Y(net22));
 sky130_fd_sc_hd__nand2_1 _082_ (.A(_043_),
    .B(_045_),
    .Y(_001_));
 sky130_fd_sc_hd__nor2_1 _083_ (.A(net39),
    .B(net18),
    .Y(_046_));
 sky130_fd_sc_hd__and3_1 _084_ (.A(net27),
    .B(net31),
    .C(net29),
    .X(_047_));
 sky130_fd_sc_hd__nor2_1 _085_ (.A(_046_),
    .B(_047_),
    .Y(_002_));
 sky130_fd_sc_hd__xor2_1 _086_ (.A(net32),
    .B(_047_),
    .X(_003_));
 sky130_fd_sc_hd__inv_2 _087_ (.A(net1),
    .Y(_004_));
 sky130_fd_sc_hd__inv_2 _088_ (.A(net1),
    .Y(_005_));
 sky130_fd_sc_hd__inv_2 _089_ (.A(net1),
    .Y(_006_));
 sky130_fd_sc_hd__inv_2 _090_ (.A(net1),
    .Y(_007_));
 sky130_fd_sc_hd__clkbuf_1 _091_ (.A(net36),
    .X(_048_));
 sky130_fd_sc_hd__clkbuf_1 _092_ (.A(_048_),
    .X(_008_));
 sky130_fd_sc_hd__clkbuf_1 _093_ (.A(net38),
    .X(_049_));
 sky130_fd_sc_hd__clkbuf_1 _094_ (.A(_049_),
    .X(_009_));
 sky130_fd_sc_hd__clkbuf_1 _095_ (.A(net35),
    .X(_050_));
 sky130_fd_sc_hd__clkbuf_1 _096_ (.A(_050_),
    .X(_010_));
 sky130_fd_sc_hd__clkbuf_1 _097_ (.A(net34),
    .X(_051_));
 sky130_fd_sc_hd__clkbuf_1 _098_ (.A(_051_),
    .X(_011_));
 sky130_fd_sc_hd__a21bo_1 _099_ (.A1(net2),
    .A2(net22),
    .B1_N(net46),
    .X(_052_));
 sky130_fd_sc_hd__or3b_1 _100_ (.A(net46),
    .B(_045_),
    .C_N(net2),
    .X(_053_));
 sky130_fd_sc_hd__nand2_1 _101_ (.A(_052_),
    .B(_053_),
    .Y(_012_));
 sky130_fd_sc_hd__and3_1 _102_ (.A(net31),
    .B(net2),
    .C(net3),
    .X(_054_));
 sky130_fd_sc_hd__or3b_1 _103_ (.A(net2),
    .B(net3),
    .C_N(net31),
    .X(_055_));
 sky130_fd_sc_hd__or3b_1 _104_ (.A(net20),
    .B(_054_),
    .C_N(_055_),
    .X(_056_));
 sky130_fd_sc_hd__and3b_1 _105_ (.A_N(net27),
    .B(net31),
    .C(net11),
    .X(_057_));
 sky130_fd_sc_hd__and3b_1 _106_ (.A_N(net31),
    .B(net7),
    .C(net27),
    .X(_058_));
 sky130_fd_sc_hd__a311o_1 _107_ (.A1(net3),
    .A2(_043_),
    .A3(_045_),
    .B1(_057_),
    .C1(_058_),
    .X(_059_));
 sky130_fd_sc_hd__xor2_1 _108_ (.A(_056_),
    .B(_059_),
    .X(_060_));
 sky130_fd_sc_hd__o221a_1 _109_ (.A1(net2),
    .A2(_042_),
    .B1(_043_),
    .B2(net6),
    .C1(_053_),
    .X(_061_));
 sky130_fd_sc_hd__nand2_1 _110_ (.A(_060_),
    .B(_061_),
    .Y(_062_));
 sky130_fd_sc_hd__or2_1 _111_ (.A(_060_),
    .B(_061_),
    .X(_063_));
 sky130_fd_sc_hd__and2_1 _112_ (.A(net45),
    .B(_045_),
    .X(_064_));
 sky130_fd_sc_hd__a31o_1 _113_ (.A1(net22),
    .A2(_062_),
    .A3(_063_),
    .B1(_064_),
    .X(_013_));
 sky130_fd_sc_hd__nand2_1 _114_ (.A(_056_),
    .B(_059_),
    .Y(_065_));
 sky130_fd_sc_hd__or2_1 _115_ (.A(net19),
    .B(net4),
    .X(_066_));
 sky130_fd_sc_hd__nor2_1 _116_ (.A(net4),
    .B(_055_),
    .Y(_067_));
 sky130_fd_sc_hd__a31o_1 _117_ (.A1(_042_),
    .A2(_055_),
    .A3(_066_),
    .B1(_067_),
    .X(_068_));
 sky130_fd_sc_hd__and3_1 _118_ (.A(net4),
    .B(_043_),
    .C(_044_),
    .X(_069_));
 sky130_fd_sc_hd__a221o_1 _119_ (.A1(net8),
    .A2(net23),
    .B1(net22),
    .B2(net12),
    .C1(_069_),
    .X(_070_));
 sky130_fd_sc_hd__xnor2_1 _120_ (.A(_068_),
    .B(_070_),
    .Y(_071_));
 sky130_fd_sc_hd__a21o_1 _121_ (.A1(_065_),
    .A2(_062_),
    .B1(_071_),
    .X(_024_));
 sky130_fd_sc_hd__a31oi_1 _122_ (.A1(_065_),
    .A2(_062_),
    .A3(_071_),
    .B1(_045_),
    .Y(_025_));
 sky130_fd_sc_hd__a22o_1 _123_ (.A1(net33),
    .A2(_045_),
    .B1(_024_),
    .B2(_025_),
    .X(_014_));
 sky130_fd_sc_hd__nand2_1 _124_ (.A(_068_),
    .B(_070_),
    .Y(_026_));
 sky130_fd_sc_hd__or2_1 _125_ (.A(net9),
    .B(_043_),
    .X(_027_));
 sky130_fd_sc_hd__o221a_1 _126_ (.A1(net13),
    .A2(_045_),
    .B1(_001_),
    .B2(net5),
    .C1(_027_),
    .X(_028_));
 sky130_fd_sc_hd__nand2_1 _127_ (.A(net24),
    .B(net5),
    .Y(_029_));
 sky130_fd_sc_hd__mux2_1 _128_ (.A0(_029_),
    .A1(net5),
    .S(_067_),
    .X(_030_));
 sky130_fd_sc_hd__xor2_1 _129_ (.A(_028_),
    .B(_030_),
    .X(_031_));
 sky130_fd_sc_hd__a21oi_1 _130_ (.A1(_026_),
    .A2(_024_),
    .B1(_031_),
    .Y(_032_));
 sky130_fd_sc_hd__a31o_1 _131_ (.A1(_026_),
    .A2(_024_),
    .A3(_031_),
    .B1(_045_),
    .X(_033_));
 sky130_fd_sc_hd__a2bb2o_1 _132_ (.A1_N(_032_),
    .A2_N(_033_),
    .B1(net37),
    .B2(_045_),
    .X(_015_));
 sky130_fd_sc_hd__or2_1 _133_ (.A(net43),
    .B(net23),
    .X(_034_));
 sky130_fd_sc_hd__clkbuf_1 _134_ (.A(_034_),
    .X(_016_));
 sky130_fd_sc_hd__and2_1 _135_ (.A(net44),
    .B(_043_),
    .X(_035_));
 sky130_fd_sc_hd__clkbuf_1 _136_ (.A(_035_),
    .X(_017_));
 sky130_fd_sc_hd__or2_1 _137_ (.A(net41),
    .B(net23),
    .X(_036_));
 sky130_fd_sc_hd__clkbuf_1 _138_ (.A(_036_),
    .X(_018_));
 sky130_fd_sc_hd__and2_1 _139_ (.A(net42),
    .B(_043_),
    .X(_037_));
 sky130_fd_sc_hd__clkbuf_1 _140_ (.A(_037_),
    .X(_019_));
 sky130_fd_sc_hd__or2_1 _141_ (.A(net2),
    .B(net20),
    .X(_038_));
 sky130_fd_sc_hd__clkbuf_1 _142_ (.A(_038_),
    .X(_020_));
 sky130_fd_sc_hd__or2_1 _143_ (.A(net3),
    .B(net20),
    .X(_039_));
 sky130_fd_sc_hd__clkbuf_1 _144_ (.A(_039_),
    .X(_021_));
 sky130_fd_sc_hd__and2_1 _145_ (.A(net4),
    .B(_042_),
    .X(_040_));
 sky130_fd_sc_hd__clkbuf_1 _146_ (.A(_040_),
    .X(_022_));
 sky130_fd_sc_hd__and2_1 _147_ (.A(net5),
    .B(_042_),
    .X(_041_));
 sky130_fd_sc_hd__clkbuf_1 _148_ (.A(_041_),
    .X(_023_));
 sky130_fd_sc_hd__dfrtp_4 _149_ (.CLK(clknet_1_1__leaf_clk),
    .D(_000_),
    .RESET_B(_004_),
    .Q(net27));
 sky130_fd_sc_hd__dfrtp_1 _150_ (.CLK(clknet_1_1__leaf_clk),
    .D(_001_),
    .RESET_B(_005_),
    .Q(net24));
 sky130_fd_sc_hd__dfrtp_1 _151_ (.CLK(clknet_1_0__leaf_clk),
    .D(_002_),
    .RESET_B(_006_),
    .Q(net29));
 sky130_fd_sc_hd__dfrtp_1 _152_ (.CLK(clknet_1_1__leaf_clk),
    .D(_003_),
    .RESET_B(_007_),
    .Q(net30));
 sky130_fd_sc_hd__dfxtp_1 _153_ (.CLK(clknet_1_1__leaf_clk),
    .D(_008_),
    .Q(net14));
 sky130_fd_sc_hd__dfxtp_1 _154_ (.CLK(clknet_1_0__leaf_clk),
    .D(_009_),
    .Q(net15));
 sky130_fd_sc_hd__dfxtp_1 _155_ (.CLK(clknet_1_1__leaf_clk),
    .D(_010_),
    .Q(net16));
 sky130_fd_sc_hd__dfxtp_1 _156_ (.CLK(clknet_1_0__leaf_clk),
    .D(_011_),
    .Q(net17));
 sky130_fd_sc_hd__dfxtp_1 _157_ (.CLK(clknet_1_0__leaf_clk),
    .D(_012_),
    .Q(net10));
 sky130_fd_sc_hd__dfxtp_1 _158_ (.CLK(clknet_1_0__leaf_clk),
    .D(_013_),
    .Q(net11));
 sky130_fd_sc_hd__dfxtp_1 _159_ (.CLK(clknet_1_0__leaf_clk),
    .D(_014_),
    .Q(net12));
 sky130_fd_sc_hd__dfxtp_1 _160_ (.CLK(clknet_1_0__leaf_clk),
    .D(_015_),
    .Q(net13));
 sky130_fd_sc_hd__dfxtp_1 _161_ (.CLK(clknet_1_1__leaf_clk),
    .D(_016_),
    .Q(net6));
 sky130_fd_sc_hd__dfxtp_1 _162_ (.CLK(clknet_1_0__leaf_clk),
    .D(_017_),
    .Q(net7));
 sky130_fd_sc_hd__dfxtp_1 _163_ (.CLK(clknet_1_0__leaf_clk),
    .D(_018_),
    .Q(net8));
 sky130_fd_sc_hd__dfxtp_1 _164_ (.CLK(clknet_1_1__leaf_clk),
    .D(_019_),
    .Q(net9));
 sky130_fd_sc_hd__dfxtp_1 _165_ (.CLK(clknet_1_1__leaf_clk),
    .D(_020_),
    .Q(net2));
 sky130_fd_sc_hd__dfxtp_1 _166_ (.CLK(clknet_1_0__leaf_clk),
    .D(_021_),
    .Q(net3));
 sky130_fd_sc_hd__dfxtp_1 _167_ (.CLK(clknet_1_0__leaf_clk),
    .D(_022_),
    .Q(net4));
 sky130_fd_sc_hd__dfxtp_1 _168_ (.CLK(clknet_1_1__leaf_clk),
    .D(_023_),
    .Q(net5));
 sky130_fd_sc_hd__clkbuf_1 _169_ (.A(net23),
    .X(net21));
 sky130_fd_sc_hd__clkbuf_1 _170_ (.A(net18),
    .X(net25));
 sky130_fd_sc_hd__clkbuf_1 _171_ (.A(net18),
    .X(net26));
 sky130_fd_sc_hd__clkbuf_1 _172_ (.A(net31),
    .X(net28));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__buf_2 fanout31 (.A(net24),
    .X(net31));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(net30),
    .X(net32));
 sky130_fd_sc_hd__dlygate4sd3_1 hold10 (.A(net8),
    .X(net41));
 sky130_fd_sc_hd__dlygate4sd3_1 hold11 (.A(net9),
    .X(net42));
 sky130_fd_sc_hd__dlygate4sd3_1 hold12 (.A(net6),
    .X(net43));
 sky130_fd_sc_hd__dlygate4sd3_1 hold13 (.A(net7),
    .X(net44));
 sky130_fd_sc_hd__dlygate4sd3_1 hold14 (.A(net11),
    .X(net45));
 sky130_fd_sc_hd__dlygate4sd3_1 hold15 (.A(net10),
    .X(net46));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(net12),
    .X(net33));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(net17),
    .X(net34));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(net16),
    .X(net35));
 sky130_fd_sc_hd__dlygate4sd3_1 hold5 (.A(net14),
    .X(net36));
 sky130_fd_sc_hd__dlygate4sd3_1 hold6 (.A(net13),
    .X(net37));
 sky130_fd_sc_hd__dlygate4sd3_1 hold7 (.A(net15),
    .X(net38));
 sky130_fd_sc_hd__dlygate4sd3_1 hold8 (.A(net29),
    .X(net39));
 sky130_fd_sc_hd__dlygate4sd3_1 hold9 (.A(net27),
    .X(net40));
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(reset),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_4 output10 (.A(net10),
    .X(R2[0]));
 sky130_fd_sc_hd__clkbuf_4 output11 (.A(net11),
    .X(R2[1]));
 sky130_fd_sc_hd__clkbuf_4 output12 (.A(net12),
    .X(R2[2]));
 sky130_fd_sc_hd__clkbuf_4 output13 (.A(net13),
    .X(R2[3]));
 sky130_fd_sc_hd__clkbuf_4 output14 (.A(net14),
    .X(R3[0]));
 sky130_fd_sc_hd__clkbuf_4 output15 (.A(net15),
    .X(R3[1]));
 sky130_fd_sc_hd__clkbuf_4 output16 (.A(net16),
    .X(R3[2]));
 sky130_fd_sc_hd__clkbuf_4 output17 (.A(net17),
    .X(R3[3]));
 sky130_fd_sc_hd__clkbuf_4 output18 (.A(net18),
    .X(halt));
 sky130_fd_sc_hd__clkbuf_4 output19 (.A(net19),
    .X(instr[0]));
 sky130_fd_sc_hd__buf_2 output2 (.A(net2),
    .X(R0[0]));
 sky130_fd_sc_hd__clkbuf_4 output20 (.A(net20),
    .X(instr[1]));
 sky130_fd_sc_hd__clkbuf_4 output21 (.A(net21),
    .X(instr[2]));
 sky130_fd_sc_hd__clkbuf_4 output22 (.A(net22),
    .X(instr[3]));
 sky130_fd_sc_hd__clkbuf_4 output23 (.A(net23),
    .X(instr[4]));
 sky130_fd_sc_hd__clkbuf_4 output24 (.A(net24),
    .X(instr[5]));
 sky130_fd_sc_hd__clkbuf_4 output25 (.A(net25),
    .X(instr[6]));
 sky130_fd_sc_hd__clkbuf_4 output26 (.A(net26),
    .X(instr[7]));
 sky130_fd_sc_hd__clkbuf_4 output27 (.A(net27),
    .X(pc[0]));
 sky130_fd_sc_hd__clkbuf_4 output28 (.A(net28),
    .X(pc[1]));
 sky130_fd_sc_hd__clkbuf_4 output29 (.A(net29),
    .X(pc[2]));
 sky130_fd_sc_hd__clkbuf_4 output3 (.A(net3),
    .X(R0[1]));
 sky130_fd_sc_hd__clkbuf_4 output30 (.A(net30),
    .X(pc[3]));
 sky130_fd_sc_hd__clkbuf_4 output4 (.A(net4),
    .X(R0[2]));
 sky130_fd_sc_hd__clkbuf_4 output5 (.A(net5),
    .X(R0[3]));
 sky130_fd_sc_hd__clkbuf_4 output6 (.A(net6),
    .X(R1[0]));
 sky130_fd_sc_hd__clkbuf_4 output7 (.A(net7),
    .X(R1[1]));
 sky130_fd_sc_hd__clkbuf_4 output8 (.A(net8),
    .X(R1[2]));
 sky130_fd_sc_hd__clkbuf_4 output9 (.A(net9),
    .X(R1[3]));
endmodule

