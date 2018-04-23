`timescale 1ns / 1ps

module sseg_control(
    input clock,
    input reset,
    input [3:0] digit0, digit1, digit2, digit3,
    output reg [6:0] sseg_output,
    output reg [3:0] an_temp,
    output reg reg_dp
    );
    
    localparam N = 18;
    reg [N-1:0]count;
    reg [6:0]sseg_selector;
    
    always @ (posedge clock or posedge reset)
    begin
        if(reset)
            count <= 0;
        else
            count <= count + 1;
    end
    
    always @ (*)
    begin
        case(count[N-1:N-2])
            2'b00 :
            begin
                sseg_selector = digit0;
                an_temp = 4'b1110;
                reg_dp = 1'b1;
            end
            
            2'b01:
            begin
                sseg_selector = digit1;
                an_temp = 4'b1101;
                reg_dp = 1'b1;
            end
            
            2'b10:
            begin
                sseg_selector = digit2;
                an_temp = 4'b1011;
                reg_dp = 1'b0;
            end
            
            2'b11:
            begin
                sseg_selector = digit3;
                an_temp = 4'b0111;
                reg_dp = 1'b1;
            end
        endcase
    end
    
    always @ (*)
    begin
        case(sseg_selector)
            4'd0 : sseg_output = 7'b1000000;
            4'd1 : sseg_output = 7'b1111001;
            4'd2 : sseg_output = 7'b0100100;
            4'd3 : sseg_output = 7'b0110000;
            4'd4 : sseg_output = 7'b0011001;
            4'd5 : sseg_output = 7'b0010010;
            4'd6 : sseg_output = 7'b0000010;
            4'd7 : sseg_output = 7'b1111000;
            4'd8 : sseg_output = 7'b0000000;
            4'd9 : sseg_output = 7'b0010000;
            default : sseg_output = 7'b0111111;
        endcase
    end
    
endmodule