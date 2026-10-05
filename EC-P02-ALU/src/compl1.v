`ifndef COMPL1_V
`define COMPL1_V

module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);
  assign Out = (cpl == 1'b0) ? Inp : ~Inp;
endmodule

`endif