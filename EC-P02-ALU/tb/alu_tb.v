`timescale 1ns/1ps

`include "../src/mux4_1.v"
`include "../src/fa.v"
`include "../src/cl.v"
`include "../src/mux2_4.v"
`include "../src/compl1.v"

`include "../src/sum4.v"
`include "../src/ul4.v"
`include "../src/flags.v"
`include "../src/preprocess.v"

`include "../src/alu.v"


module alu_tb;
  
  reg [3:0] test_A, test_B;
  reg [2:0] test_Op;
  
  wire [3:0] test_R;
  wire test_zero, test_carry, test_sign;

  alu uut (
    .R(test_R), .zero(test_zero), .carry(test_carry), .sign(test_sign),
    .A(test_A), .B(test_B), .Op(test_Op)
  );

  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    $monitor("Tiempo=%0t | Op=%b | A=%d, B=%d -> R=%d (Bin: %b) | Z=%b C=%b S=%b", 
             $time, test_Op, test_A, test_B, test_R, test_R, test_zero, test_carry, test_sign);

    test_A = 4'b0110; 
    test_B = 4'b0011; 

    test_Op = 3'b000; // A
    #10;

    test_Op = 3'b001; // -A
    #10;

    test_Op = 3'b010; // A + B
    #10;

    test_Op = 3'b011; // A - B
    #10;

    test_Op = 3'b100; // not(A)
    #10;

    test_Op = 3'b101; // A and B
    #10;

    test_Op = 3'b110; // A or B
    #10;

    test_Op = 3'b111; // A xor B
    #10;

    $finish;
  end

endmodule