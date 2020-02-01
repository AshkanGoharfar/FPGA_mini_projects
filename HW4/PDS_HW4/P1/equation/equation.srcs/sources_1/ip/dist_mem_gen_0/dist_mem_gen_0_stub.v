// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1733598 Wed Dec 14 22:35:39 MST 2016
// Date        : Sun May 19 22:50:05 2019
// Host        : goharfar-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub {D:/Ashkan
//               works/PDS_HW4/P1/equation/equation.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_stub.v}
// Design      : dist_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tiffg1156-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_11,Vivado 2016.4" *)
module dist_mem_gen_0(a, clk, spo)
/* synthesis syn_black_box black_box_pad_pin="a[4:0],clk,spo[15:0]" */;
  input [4:0]a;
  input clk;
  output [15:0]spo;
endmodule
