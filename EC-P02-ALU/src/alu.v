`ifndef ALU_V
`define ALU_V

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [2:0] Op);
  wire [3:0] AMod_w,BMod_w, sum4_w, ul4_w;
  wire add1_w, c_out_w;

  preprocess preprocess_1(.AMod(AMod_w),.BMod(BMod_w),.add1(add1_w),.A(A),.B(B),.Op(Op));

  sum4 sum4_1(.S(sum4_w),.c_out(c_out_w),.A(AMod_w),.B(BMod_w),.c_in(add1_w));
  ul4 ul4_1(.Out(ul4_w),.A(AMod_w),.B(BMod_w),.S(Op[1:0]));

  mux2_4 mux2_4_1(.Out(R),.A(sum4_w),.B(ul4_w),.s(Op[2]));
  flags  flags_1(.carry(carry),.zero(zero),.sign(sign),.R(R),.c_out(c_out_w));

endmodule

`endif 