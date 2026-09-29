`timescale 1ns/1ps
`include "../src/fa_v1.v"

module fa_v1_tb; 
  reg test_a, test_b, test_cin;
  wire test_sum, test_carry;

  fa_v1 full_adder(
    .c_in(test_cin),
    .a(test_a),
    .b(test_b),
    .sum(test_sum), 
    .c_out(test_carry)
  ); 

  initial begin
    $dumpfile("fa_v1_tb.vcd");
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

/*
=============================================================================
GUÍA RÁPIDA DE EJECUCIÓN (Desde la terminal, en la carpeta del testbench)
=============================================================================
1. Compilar el código fuente y el testbench en un archivo ejecutable (.vvp):
   iverilog -o test tb/fa_v1_tb.vvp src/fa_v1.v src/ha_v1.v

2. Ejecutar la simulación para generar el archivo de ondas (.vcd):
   vvp test

3. Abrir el archivo de ondas resultante en GTKWave:
   gtkwave fa_v1_tb.vcd
=============================================================================
*/
