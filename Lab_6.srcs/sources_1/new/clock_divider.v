`timescale 1ns / 1ps

module clock_divider(
    input clock,
    input reset,
    output slow_clock
    );
    
    reg [20:0] count;
    
    assign slow_clock = (count == 1000000) ? 1'b1 : 1'b0;
    
    always @ (posedge clock or posedge reset)
    begin
        if(reset)
            count <= 0;
        else if(count == 1000000) //if it reaches the desired max value reset it
            count <= 0;
        else
            count <= count + 1;
    end
endmodule
