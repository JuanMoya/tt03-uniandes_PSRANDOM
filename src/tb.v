`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input BB_SYSTEM_CLOCK_50,
    input BB_SYSTEM_RESET_inHigh,
    input BB_SYSTEM_clear_InLow,
    input BB_SYSTEM_load_InLow,
    output [7:0] BB_SYSTEM_data_OutBUS
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {4'b0, BB_SYSTEM_load_InLow, BB_SYSTEM_clear_InLow, BB_SYSTEM_RESET_inHigh, BB_SYSTEM_CLOCK_50};
    wire [7:0] outputs;
    assign BB_SYSTEM_data_OutBUS = outputs[7:0];

    // instantiate the DUT
    BB_SYSTEM BB_SYSTEM(
//        `ifdef GL_TEST
//            .vccd1( 1'b1),
//            .vssd1( 1'b0),
//       `endif
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
