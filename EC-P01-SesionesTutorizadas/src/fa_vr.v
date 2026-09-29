`include "ha_vr.v" 

module fa_vr(input wire c_in, input wire a, input wire b, output wire sum, output wire c_out);
  wire sum1, carry_1, carry_2;

  ha_vr half_adder_1(
    .a(a), 
    .b(b), 
    .sum(sum1), 
    .carry(carry_1)
  );

  ha_vr half_adder_2(
    .a(sum1), 
    .b(c_in), 
    .sum(sum), 
    .carry(carry_2)
  );

  or or_1(c_out, carry_1, carry_2);
endmodule