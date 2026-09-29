`timescale 1ns/1ps
`include "../src/fa_vr.v"

module fa_vr_tb; 
  reg test_a, test_b, test_cin;
  wire test_sum, test_carry;

  fa_vr full_adder(
    .c_in(test_cin),
    .a(test_a),
    .b(test_b),
    .sum(test_sum), 
    .c_out(test_carry)
  ); 

  initial begin
    $dumpfile("fa_vr_tb.vcd");
    $dumpvars;
    $monitor("tiempo=%t, a=%b, b=%b, acarreo_entrada=%b, suma=%b, acarreo_salida=%b", $time, test_a, test_b, test_cin, test_sum, test_carry);

    test_a = 'b0;
    test_b = 'b0;
    test_cin = 'b0;
    #20; 

    test_a = 'b0;
    test_b = 'b0;
    test_cin = 'b1;
    #20;

    test_a = 'b0;
    test_b = 'b1;
    test_cin = 'b0;
    #20;

    test_a = 'b0;
    test_b = 'b1;
    test_cin = 'b1;
    #20;

    test_a = 'b1;
    test_b = 'b0;
    test_cin = 'b0;
    #20;

    test_a = 'b1;
    test_b = 'b0;
    test_cin = 'b1;
    #20;

    test_a = 'b1;
    test_b = 'b1;
    test_cin = 'b0;
    #20;

    test_a = 'b1;
    test_b = 'b1;
    test_cin = 'b1;
    #20;

    $finish; 
  end

endmodule

