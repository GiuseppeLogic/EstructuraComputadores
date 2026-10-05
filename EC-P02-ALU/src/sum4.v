`ifndef SUM4_V
`define SUM4_V

module sum4(output wire [3:0] S, output wire c_out, input wire [3:0] A, input wire [3:0] B, input wire c_in);
  
  wire c_aux_1, c_aux_2, c_aux_3;
  
  fa fa1(.c_out(c_aux_1), .sum(S[0]), .a(A[0]), .b(B[0]), .c_in(c_in));
  fa fa2(.c_out(c_aux_2), .sum(S[1]), .a(A[1]), .b(B[1]), .c_in(c_aux_1));
  fa fa3(.c_out(c_aux_3), .sum(S[2]), .a(A[2]), .b(B[2]), .c_in(c_aux_2));
  fa fa4(.c_out(c_out),   .sum(S[3]), .a(A[3]), .b(B[3]), .c_in(c_aux_3));

endmodule

`endif 