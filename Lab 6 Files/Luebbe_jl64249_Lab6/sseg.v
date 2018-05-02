`timescale 1ns / 1ps

module sseg(
        input [3:0] sseg_selector,
        output reg [6:0] sseg_output
    );
    
    always @ (*)
    begin
        case(sseg_selector)
            0 : sseg_output = 7'b1000000;
            1 : sseg_output = 7'b1111001;
            2 : sseg_output = 7'b0100100;
            3 : sseg_output = 7'b0110000;
            4 : sseg_output = 7'b0011001;
            5 : sseg_output = 7'b0010010;
            6 : sseg_output = 7'b0000010;
            7 : sseg_output = 7'b1111000;
            8 : sseg_output = 7'b0000000;
            9 : sseg_output = 7'b0010000;
            default : sseg_output = 7'b0111111;
        endcase
    end
endmodule
