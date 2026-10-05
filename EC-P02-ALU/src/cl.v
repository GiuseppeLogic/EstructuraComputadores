`ifndef CL_V
`define CL_V

module cl(output wire out, input wire a, b, input wire [1:0] S);
  wire not_a,and_a_b,or_a_b,xor_a_b;

  not not1(not_a,a);
  and and1(and_a_b,a,b);
  or or1(or_a_b,a,b);
  xor xor1(xor_a_b,a,b);

  mux4_1 mux(.out(out),.a(not_a),.b(and_a_b),.c(or_a_b),.d(xor_a_b),.S(S));

endmodule

`endif 