// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Thu Jun 01 20:31:39 2017
// Host        : Dear-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               F:/VivadoProject/MobileCharger/MobileCharger.sim/sim_1/synth/timing/Keyboard_Driver_tb_time_synth.v
// Design      : Keyboard_Driver
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* KEY_PRESSED = "4'b1111" *) (* NO_KEY_PRESSED = "4'b0000" *) (* SCAN_COL0 = "4'b1110" *) 
(* SCAN_COL1 = "4'b1101" *) (* SCAN_COL2 = "4'b1011" *) (* SCAN_COL3 = "4'b0111" *) 
(* NotValidForBitStream *)
module Keyboard_Driver
   (clk,
    rst_n,
    row,
    col,
    keyboard_val,
    key_pressed_flag);
  input clk;
  input rst_n;
  input [3:0]row;
  output [3:0]col;
  output [3:0]keyboard_val;
  output key_pressed_flag;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]col;
  wire \col[0]_i_1_n_0 ;
  wire \col[1]_i_1_n_0 ;
  wire \col[2]_i_1_n_0 ;
  wire \col[3]_i_1_n_0 ;
  wire \col[3]_i_2_n_0 ;
  wire [3:0]col_OBUF;
  wire [3:0]current_state;
  wire \current_state[3]_i_1_n_0 ;
  wire key_pressed_flag;
  wire key_pressed_flag_OBUF;
  wire key_pressed_flag_i_1_n_0;
  wire [3:0]keyboard_val;
  wire keyboard_val0;
  wire \keyboard_val[0]_i_1_n_0 ;
  wire \keyboard_val[1]_i_1_n_0 ;
  wire \keyboard_val[2]_i_1_n_0 ;
  wire \keyboard_val[3]_i_2_n_0 ;
  wire \keyboard_val[3]_i_3_n_0 ;
  wire \keyboard_val[3]_i_4_n_0 ;
  wire [3:0]keyboard_val_OBUF;
  wire [3:0]next_state;
  wire \next_state_reg[0]_i_1_n_0 ;
  wire \next_state_reg[1]_i_1_n_0 ;
  wire \next_state_reg[2]_i_1_n_0 ;
  wire \next_state_reg[3]_i_1_n_0 ;
  wire \next_state_reg[3]_i_2_n_0 ;
  wire \next_state_reg[3]_i_3_n_0 ;
  wire [3:0]row;
  wire [3:0]row_IBUF;
  wire rst_n;
  wire rst_n_IBUF;
PULLUP pullup_row_0
       (.O(row[0]));
PULLUP pullup_row_1
       (.O(row[1]));
PULLUP pullup_row_2
       (.O(row[2]));
PULLUP pullup_row_3
       (.O(row[3]));

initial begin
 $sdf_annotate("Keyboard_Driver_tb_time_synth.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h28804880)) 
    \col[0]_i_1 
       (.I0(current_state[0]),
        .I1(current_state[3]),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(\next_state_reg[3]_i_3_n_0 ),
        .O(\col[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hF7FF9FFE)) 
    \col[1]_i_1 
       (.I0(current_state[0]),
        .I1(current_state[3]),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(\next_state_reg[3]_i_3_n_0 ),
        .O(\col[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF7FD7FE)) 
    \col[2]_i_1 
       (.I0(current_state[0]),
        .I1(current_state[3]),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(\next_state_reg[3]_i_3_n_0 ),
        .O(\col[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6666888888881011)) 
    \col[3]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[2]),
        .I2(rst_n_IBUF),
        .I3(\next_state_reg[3]_i_3_n_0 ),
        .I4(current_state[3]),
        .I5(current_state[0]),
        .O(\col[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hDFFFDF7E)) 
    \col[3]_i_2 
       (.I0(current_state[0]),
        .I1(current_state[3]),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(\next_state_reg[3]_i_3_n_0 ),
        .O(\col[3]_i_2_n_0 ));
  OBUF \col_OBUF[0]_inst 
       (.I(col_OBUF[0]),
        .O(col[0]));
  OBUF \col_OBUF[1]_inst 
       (.I(col_OBUF[1]),
        .O(col[1]));
  OBUF \col_OBUF[2]_inst 
       (.I(col_OBUF[2]),
        .O(col[2]));
  OBUF \col_OBUF[3]_inst 
       (.I(col_OBUF[3]),
        .O(col[3]));
  FDCE #(
    .INIT(1'b0)) 
    \col_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\col[3]_i_1_n_0 ),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\col[0]_i_1_n_0 ),
        .Q(col_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \col_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\col[3]_i_1_n_0 ),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\col[1]_i_1_n_0 ),
        .Q(col_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \col_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\col[3]_i_1_n_0 ),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\col[2]_i_1_n_0 ),
        .Q(col_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \col_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\col[3]_i_1_n_0 ),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\col[3]_i_2_n_0 ),
        .Q(col_OBUF[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \current_state[3]_i_1 
       (.I0(rst_n_IBUF),
        .O(\current_state[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \current_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(next_state[0]),
        .Q(current_state[0]));
  FDCE #(
    .INIT(1'b0)) 
    \current_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(next_state[1]),
        .Q(current_state[1]));
  FDCE #(
    .INIT(1'b0)) 
    \current_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(next_state[2]),
        .Q(current_state[2]));
  FDCE #(
    .INIT(1'b0)) 
    \current_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(next_state[3]),
        .Q(current_state[3]));
  OBUF key_pressed_flag_OBUF_inst
       (.I(key_pressed_flag_OBUF),
        .O(key_pressed_flag));
  LUT5 #(
    .INIT(32'hA0000001)) 
    key_pressed_flag_i_1
       (.I0(current_state[3]),
        .I1(\next_state_reg[3]_i_3_n_0 ),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(current_state[0]),
        .O(key_pressed_flag_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    key_pressed_flag_reg
       (.C(clk_IBUF_BUFG),
        .CE(key_pressed_flag_i_1_n_0),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(current_state[3]),
        .Q(key_pressed_flag_OBUF));
  LUT5 #(
    .INIT(32'h78778888)) 
    \keyboard_val[0]_i_1 
       (.I0(col_OBUF[2]),
        .I1(col_OBUF[0]),
        .I2(row_IBUF[3]),
        .I3(row_IBUF[2]),
        .I4(row_IBUF[1]),
        .O(\keyboard_val[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9990009999999999)) 
    \keyboard_val[1]_i_1 
       (.I0(col_OBUF[0]),
        .I1(row_IBUF[2]),
        .I2(row_IBUF[1]),
        .I3(col_OBUF[1]),
        .I4(row_IBUF[3]),
        .I5(col_OBUF[2]),
        .O(\keyboard_val[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2888AAAAAAAA2888)) 
    \keyboard_val[2]_i_1 
       (.I0(row_IBUF[0]),
        .I1(row_IBUF[2]),
        .I2(col_OBUF[2]),
        .I3(col_OBUF[1]),
        .I4(row_IBUF[3]),
        .I5(col_OBUF[0]),
        .O(\keyboard_val[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \keyboard_val[3]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(current_state[3]),
        .I3(current_state[2]),
        .I4(\keyboard_val[3]_i_3_n_0 ),
        .I5(\keyboard_val[3]_i_4_n_0 ),
        .O(keyboard_val0));
  LUT5 #(
    .INIT(32'hAA2A2A2A)) 
    \keyboard_val[3]_i_2 
       (.I0(col_OBUF[0]),
        .I1(row_IBUF[3]),
        .I2(row_IBUF[2]),
        .I3(col_OBUF[1]),
        .I4(col_OBUF[2]),
        .O(\keyboard_val[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6880)) 
    \keyboard_val[3]_i_3 
       (.I0(row_IBUF[0]),
        .I1(row_IBUF[1]),
        .I2(row_IBUF[2]),
        .I3(row_IBUF[3]),
        .O(\keyboard_val[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h6880)) 
    \keyboard_val[3]_i_4 
       (.I0(col_OBUF[0]),
        .I1(col_OBUF[1]),
        .I2(col_OBUF[3]),
        .I3(col_OBUF[2]),
        .O(\keyboard_val[3]_i_4_n_0 ));
  OBUF \keyboard_val_OBUF[0]_inst 
       (.I(keyboard_val_OBUF[0]),
        .O(keyboard_val[0]));
  OBUF \keyboard_val_OBUF[1]_inst 
       (.I(keyboard_val_OBUF[1]),
        .O(keyboard_val[1]));
  OBUF \keyboard_val_OBUF[2]_inst 
       (.I(keyboard_val_OBUF[2]),
        .O(keyboard_val[2]));
  OBUF \keyboard_val_OBUF[3]_inst 
       (.I(keyboard_val_OBUF[3]),
        .O(keyboard_val[3]));
  FDCE #(
    .INIT(1'b0)) 
    \keyboard_val_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(keyboard_val0),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\keyboard_val[0]_i_1_n_0 ),
        .Q(keyboard_val_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \keyboard_val_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(keyboard_val0),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\keyboard_val[1]_i_1_n_0 ),
        .Q(keyboard_val_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \keyboard_val_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(keyboard_val0),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\keyboard_val[2]_i_1_n_0 ),
        .Q(keyboard_val_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \keyboard_val_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(keyboard_val0),
        .CLR(\current_state[3]_i_1_n_0 ),
        .D(\keyboard_val[3]_i_2_n_0 ),
        .Q(keyboard_val_OBUF[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \next_state_reg[0] 
       (.CLR(1'b0),
        .D(\next_state_reg[0]_i_1_n_0 ),
        .G(\next_state_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF7FFC4CC)) 
    \next_state_reg[0]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(\next_state_reg[3]_i_3_n_0 ),
        .I3(current_state[2]),
        .I4(current_state[3]),
        .O(\next_state_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \next_state_reg[1] 
       (.CLR(1'b0),
        .D(\next_state_reg[1]_i_1_n_0 ),
        .G(\next_state_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hF5FDF4FC)) 
    \next_state_reg[1]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(\next_state_reg[3]_i_3_n_0 ),
        .I3(current_state[2]),
        .I4(current_state[3]),
        .O(\next_state_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \next_state_reg[2] 
       (.CLR(1'b0),
        .D(\next_state_reg[2]_i_1_n_0 ),
        .G(\next_state_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hF2FAF0F8)) 
    \next_state_reg[2]_i_1 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(\next_state_reg[3]_i_3_n_0 ),
        .I3(current_state[2]),
        .I4(current_state[3]),
        .O(\next_state_reg[2]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \next_state_reg[3] 
       (.CLR(1'b0),
        .D(\next_state_reg[3]_i_1_n_0 ),
        .G(\next_state_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state[3]));
  LUT4 #(
    .INIT(16'hFF3A)) 
    \next_state_reg[3]_i_1 
       (.I0(current_state[3]),
        .I1(current_state[1]),
        .I2(current_state[0]),
        .I3(\next_state_reg[3]_i_3_n_0 ),
        .O(\next_state_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hE881)) 
    \next_state_reg[3]_i_2 
       (.I0(current_state[2]),
        .I1(current_state[3]),
        .I2(current_state[1]),
        .I3(current_state[0]),
        .O(\next_state_reg[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \next_state_reg[3]_i_3 
       (.I0(row_IBUF[1]),
        .I1(row_IBUF[0]),
        .I2(row_IBUF[2]),
        .I3(row_IBUF[3]),
        .O(\next_state_reg[3]_i_3_n_0 ));
  IBUF \row_IBUF[0]_inst 
       (.I(row[0]),
        .O(row_IBUF[0]));
  IBUF \row_IBUF[1]_inst 
       (.I(row[1]),
        .O(row_IBUF[1]));
  IBUF \row_IBUF[2]_inst 
       (.I(row[2]),
        .O(row_IBUF[2]));
  IBUF \row_IBUF[3]_inst 
       (.I(row[3]),
        .O(row_IBUF[3]));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
