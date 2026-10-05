`ifndef PREPROCESS_V
`define PREPROCESS_V

module preprocess(output wire [3:0] AMod, output wire [3:0] BMod, output wire add1, input wire [3:0] A, input wire [3:0] B, input wire [2:0] Op);
  
  wire op_2B, op_1A, cpl;
  wire [3:0] input_compl1;

  mux2_4 mux2_4_1(.Out(AMod), .A(4'b0000), .B(A), .s(op_1A));
  mux2_4 mux2_4_2(.Out(input_compl1), .A(A), .B(B), .s(op_2B));
  compl1 compl1_1(.Out(BMod), .Inp(input_compl1), .cpl(cpl));

  assign op_1A = Op[2] | Op[1];
  assign op_2B = Op[2] | Op[1];
  assign cpl   = ~Op[2] & Op[0];
  assign add1  = Op[0];

endmodule

`endif 