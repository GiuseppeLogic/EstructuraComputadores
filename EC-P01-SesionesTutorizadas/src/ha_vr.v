module ha_vr(output wire sum, output wire carry, input wire a, input wire b);
  // La salida se actualizará una unidad de tipo después de que cambien a y b.
  xor #(1) xor_1(sum,a,b);
  and #(1) and_1(carry,a,b);
endmodule