module ha_v1(output wire sum, output wire carry, input wire a, input wire b);
  xor xor_1(sum,a,b);
  and and_1(carry,a,b);
endmodule