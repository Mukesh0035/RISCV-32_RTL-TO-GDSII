module riscv32 (clk,
    halt,
    reset,
    vdd,
    gnd,
    R0,
    R1,
    R2,
    R3,
    instr,
    pc);
 input clk;
 output halt;
 input reset;
 input vdd;
 input gnd;
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

 sky130_fd_sc_hd__inv_2 _072_ (.A(pc[0]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_000_));
 sky130_fd_sc_hd__inv_2 _073_ (.A(instr[5]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(instr[0]));
 sky130_fd_sc_hd__nor2_2 _074_ (.A(_000_),
    .B(instr[0]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(halt));
 sky130_fd_sc_hd__or2_2 _075_ (.A(pc[0]),
    .B(instr[5]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_042_));
 sky130_fd_sc_hd__inv_2 _076_ (.A(_042_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(instr[1]));
 sky130_fd_sc_hd__nand2b_2 _077_ (.A_N(instr[5]),
    .B(pc[0]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_043_));
 sky130_fd_sc_hd__inv_2 _078_ (.A(_043_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(instr[4]));
 sky130_fd_sc_hd__or2b_2 _079_ (.A(pc[0]),
    .B_N(instr[5]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_044_));
 sky130_fd_sc_hd__buf_1 _080_ (.A(_044_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_045_));
 sky130_fd_sc_hd__inv_2 _081_ (.A(_045_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(instr[3]));
 sky130_fd_sc_hd__nand2_2 _082_ (.A(_043_),
    .B(_045_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_001_));
 sky130_fd_sc_hd__nor2_2 _083_ (.A(pc[2]),
    .B(halt),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_046_));
 sky130_fd_sc_hd__and3_2 _084_ (.A(pc[0]),
    .B(instr[5]),
    .C(pc[2]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_047_));
 sky130_fd_sc_hd__nor2_2 _085_ (.A(_046_),
    .B(_047_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_002_));
 sky130_fd_sc_hd__xor2_2 _086_ (.A(pc[3]),
    .B(_047_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_003_));
 sky130_fd_sc_hd__inv_2 _087_ (.A(reset),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_004_));
 sky130_fd_sc_hd__inv_2 _088_ (.A(reset),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_005_));
 sky130_fd_sc_hd__inv_2 _089_ (.A(reset),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_006_));
 sky130_fd_sc_hd__inv_2 _090_ (.A(reset),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_007_));
 sky130_fd_sc_hd__buf_1 _091_ (.A(R3[0]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_048_));
 sky130_fd_sc_hd__buf_1 _092_ (.A(_048_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_008_));
 sky130_fd_sc_hd__buf_1 _093_ (.A(R3[1]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_049_));
 sky130_fd_sc_hd__buf_1 _094_ (.A(_049_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_009_));
 sky130_fd_sc_hd__buf_1 _095_ (.A(R3[2]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_050_));
 sky130_fd_sc_hd__buf_1 _096_ (.A(_050_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_010_));
 sky130_fd_sc_hd__buf_1 _097_ (.A(R3[3]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_051_));
 sky130_fd_sc_hd__buf_1 _098_ (.A(_051_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_011_));
 sky130_fd_sc_hd__a21bo_2 _099_ (.A1(R0[0]),
    .A2(instr[3]),
    .B1_N(R2[0]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_052_));
 sky130_fd_sc_hd__or3b_2 _100_ (.A(R2[0]),
    .B(_045_),
    .C_N(R0[0]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_053_));
 sky130_fd_sc_hd__nand2_2 _101_ (.A(_052_),
    .B(_053_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_012_));
 sky130_fd_sc_hd__and3_2 _102_ (.A(instr[5]),
    .B(R0[0]),
    .C(R0[1]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_054_));
 sky130_fd_sc_hd__or3b_2 _103_ (.A(R0[0]),
    .B(R0[1]),
    .C_N(instr[5]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_055_));
 sky130_fd_sc_hd__or3b_2 _104_ (.A(instr[1]),
    .B(_054_),
    .C_N(_055_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_056_));
 sky130_fd_sc_hd__and3b_2 _105_ (.A_N(pc[0]),
    .B(instr[5]),
    .C(R2[1]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_057_));
 sky130_fd_sc_hd__and3b_2 _106_ (.A_N(instr[5]),
    .B(R1[1]),
    .C(pc[0]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_058_));
 sky130_fd_sc_hd__a311o_2 _107_ (.A1(R0[1]),
    .A2(_043_),
    .A3(_045_),
    .B1(_057_),
    .C1(_058_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_059_));
 sky130_fd_sc_hd__xor2_2 _108_ (.A(_056_),
    .B(_059_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_060_));
 sky130_fd_sc_hd__o221a_2 _109_ (.A1(R0[0]),
    .A2(_042_),
    .B1(_043_),
    .B2(R1[0]),
    .C1(_053_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_061_));
 sky130_fd_sc_hd__nand2_2 _110_ (.A(_060_),
    .B(_061_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_062_));
 sky130_fd_sc_hd__or2_2 _111_ (.A(_060_),
    .B(_061_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_063_));
 sky130_fd_sc_hd__and2_2 _112_ (.A(R2[1]),
    .B(_045_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_064_));
 sky130_fd_sc_hd__a31o_2 _113_ (.A1(instr[3]),
    .A2(_062_),
    .A3(_063_),
    .B1(_064_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_013_));
 sky130_fd_sc_hd__nand2_2 _114_ (.A(_056_),
    .B(_059_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_065_));
 sky130_fd_sc_hd__or2_2 _115_ (.A(instr[0]),
    .B(R0[2]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_066_));
 sky130_fd_sc_hd__nor2_2 _116_ (.A(R0[2]),
    .B(_055_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_067_));
 sky130_fd_sc_hd__a31o_2 _117_ (.A1(_042_),
    .A2(_055_),
    .A3(_066_),
    .B1(_067_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_068_));
 sky130_fd_sc_hd__and3_2 _118_ (.A(R0[2]),
    .B(_043_),
    .C(_044_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_069_));
 sky130_fd_sc_hd__a221o_2 _119_ (.A1(R1[2]),
    .A2(instr[4]),
    .B1(instr[3]),
    .B2(R2[2]),
    .C1(_069_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_070_));
 sky130_fd_sc_hd__xnor2_2 _120_ (.A(_068_),
    .B(_070_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_071_));
 sky130_fd_sc_hd__a21o_2 _121_ (.A1(_065_),
    .A2(_062_),
    .B1(_071_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_024_));
 sky130_fd_sc_hd__a31oi_2 _122_ (.A1(_065_),
    .A2(_062_),
    .A3(_071_),
    .B1(_045_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_025_));
 sky130_fd_sc_hd__a22o_2 _123_ (.A1(R2[2]),
    .A2(_045_),
    .B1(_024_),
    .B2(_025_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_014_));
 sky130_fd_sc_hd__nand2_2 _124_ (.A(_068_),
    .B(_070_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_026_));
 sky130_fd_sc_hd__or2_2 _125_ (.A(R1[3]),
    .B(_043_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_027_));
 sky130_fd_sc_hd__o221a_2 _126_ (.A1(R2[3]),
    .A2(_045_),
    .B1(_001_),
    .B2(R0[3]),
    .C1(_027_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_028_));
 sky130_fd_sc_hd__nand2_2 _127_ (.A(instr[5]),
    .B(R0[3]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_029_));
 sky130_fd_sc_hd__mux2_2 _128_ (.A0(_029_),
    .A1(R0[3]),
    .S(_067_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_030_));
 sky130_fd_sc_hd__xor2_2 _129_ (.A(_028_),
    .B(_030_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_031_));
 sky130_fd_sc_hd__a21oi_2 _130_ (.A1(_026_),
    .A2(_024_),
    .B1(_031_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Y(_032_));
 sky130_fd_sc_hd__a31o_2 _131_ (.A1(_026_),
    .A2(_024_),
    .A3(_031_),
    .B1(_045_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_033_));
 sky130_fd_sc_hd__a2bb2o_2 _132_ (.A1_N(_032_),
    .A2_N(_033_),
    .B1(R2[3]),
    .B2(_045_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_015_));
 sky130_fd_sc_hd__or2_2 _133_ (.A(R1[0]),
    .B(instr[4]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_034_));
 sky130_fd_sc_hd__buf_1 _134_ (.A(_034_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_016_));
 sky130_fd_sc_hd__and2_2 _135_ (.A(R1[1]),
    .B(_043_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_035_));
 sky130_fd_sc_hd__buf_1 _136_ (.A(_035_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_017_));
 sky130_fd_sc_hd__or2_2 _137_ (.A(R1[2]),
    .B(instr[4]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_036_));
 sky130_fd_sc_hd__buf_1 _138_ (.A(_036_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_018_));
 sky130_fd_sc_hd__and2_2 _139_ (.A(R1[3]),
    .B(_043_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_037_));
 sky130_fd_sc_hd__buf_1 _140_ (.A(_037_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_019_));
 sky130_fd_sc_hd__or2_2 _141_ (.A(R0[0]),
    .B(instr[1]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_038_));
 sky130_fd_sc_hd__buf_1 _142_ (.A(_038_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_020_));
 sky130_fd_sc_hd__or2_2 _143_ (.A(R0[1]),
    .B(instr[1]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_039_));
 sky130_fd_sc_hd__buf_1 _144_ (.A(_039_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_021_));
 sky130_fd_sc_hd__and2_2 _145_ (.A(R0[2]),
    .B(_042_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_040_));
 sky130_fd_sc_hd__buf_1 _146_ (.A(_040_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_022_));
 sky130_fd_sc_hd__and2_2 _147_ (.A(R0[3]),
    .B(_042_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_041_));
 sky130_fd_sc_hd__buf_1 _148_ (.A(_041_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(_023_));
 sky130_fd_sc_hd__dfrtp_2 _149_ (.CLK(clk),
    .D(_000_),
    .RESET_B(_004_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(pc[0]));
 sky130_fd_sc_hd__dfrtp_2 _150_ (.CLK(clk),
    .D(_001_),
    .RESET_B(_005_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(instr[5]));
 sky130_fd_sc_hd__dfrtp_2 _151_ (.CLK(clk),
    .D(_002_),
    .RESET_B(_006_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(pc[2]));
 sky130_fd_sc_hd__dfrtp_2 _152_ (.CLK(clk),
    .D(_003_),
    .RESET_B(_007_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(pc[3]));
 sky130_fd_sc_hd__dfxtp_2 _153_ (.CLK(clk),
    .D(_008_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R3[0]));
 sky130_fd_sc_hd__dfxtp_2 _154_ (.CLK(clk),
    .D(_009_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R3[1]));
 sky130_fd_sc_hd__dfxtp_2 _155_ (.CLK(clk),
    .D(_010_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R3[2]));
 sky130_fd_sc_hd__dfxtp_2 _156_ (.CLK(clk),
    .D(_011_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R3[3]));
 sky130_fd_sc_hd__dfxtp_2 _157_ (.CLK(clk),
    .D(_012_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R2[0]));
 sky130_fd_sc_hd__dfxtp_2 _158_ (.CLK(clk),
    .D(_013_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R2[1]));
 sky130_fd_sc_hd__dfxtp_2 _159_ (.CLK(clk),
    .D(_014_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R2[2]));
 sky130_fd_sc_hd__dfxtp_2 _160_ (.CLK(clk),
    .D(_015_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R2[3]));
 sky130_fd_sc_hd__dfxtp_2 _161_ (.CLK(clk),
    .D(_016_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R1[0]));
 sky130_fd_sc_hd__dfxtp_2 _162_ (.CLK(clk),
    .D(_017_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R1[1]));
 sky130_fd_sc_hd__dfxtp_2 _163_ (.CLK(clk),
    .D(_018_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R1[2]));
 sky130_fd_sc_hd__dfxtp_2 _164_ (.CLK(clk),
    .D(_019_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R1[3]));
 sky130_fd_sc_hd__dfxtp_2 _165_ (.CLK(clk),
    .D(_020_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R0[0]));
 sky130_fd_sc_hd__dfxtp_2 _166_ (.CLK(clk),
    .D(_021_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R0[1]));
 sky130_fd_sc_hd__dfxtp_2 _167_ (.CLK(clk),
    .D(_022_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R0[2]));
 sky130_fd_sc_hd__dfxtp_2 _168_ (.CLK(clk),
    .D(_023_),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .Q(R0[3]));
 sky130_fd_sc_hd__buf_2 _169_ (.A(instr[4]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(instr[2]));
 sky130_fd_sc_hd__buf_2 _170_ (.A(halt),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(instr[6]));
 sky130_fd_sc_hd__buf_2 _171_ (.A(halt),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(instr[7]));
 sky130_fd_sc_hd__buf_2 _172_ (.A(instr[5]),
    .VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd),
    .X(pc[1]));
 sky130_fd_sc_hd__decap_3 PHY_0 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_1 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_2 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_3 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_4 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_5 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_6 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_7 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_8 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_9 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_10 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_11 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_12 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_13 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_14 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_15 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_16 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_17 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_18 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_19 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_20 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_21 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_22 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_23 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_24 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_25 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_26 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_27 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_28 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_29 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_30 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__decap_3 PHY_31 (.VGND(gnd),
    .VNB(gnd),
    .VPB(vdd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_38 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_39 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_40 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_41 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_42 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_43 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_44 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_45 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_46 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_47 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_48 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_49 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_50 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_51 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_52 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_53 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_54 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_55 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_56 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_57 (.VGND(gnd),
    .VPWR(vdd));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_58 (.VGND(gnd),
    .VPWR(vdd));
endmodule
