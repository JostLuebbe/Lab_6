`timescale 1ps / 1ps

module tb_stopwatch;

//    reg clock;
//    reg toggle;
//    reg reset;
//    reg [1:0] mode_sel;
//    reg [3:0] init_val_one, init_val_two;
    
//    wire a, b, c, d, e, f, g, dp;
//    wire enable_D1, enable_D2, enable_D3, enable_D4;

//    stopwatch uut (
//        clock,
//        toggle,
//        reset,
//        mode_sel,
//        init_val_one, init_val_two,
//        a, b, c, d, e, f, g, dp,
//        enable_D1, enable_D2, enable_D3, enable_D4
//    );
    
//    initial begin
    
//    clock = 0;
//    reset = 1;
//    toggle = 1;
//    mode_sel = 2'b00;
//    init_val_one = 4'b0000;
//    init_val_two = 4'b0000;
    
//    #20;
    
//    toggle = 0;
//    reset = 0;
    
//    #5;
    
    
    
//    end
    
//    always
//    #5 clock = ~clock;

    reg stopwatch_clock;
    reg enable;
    reg reset_toggle;
    reg [1:0] mode_sel;
    reg [3:0] init_val_one, init_val_two;
    
    wire [3:0] digit0, digit1, digit2, digit3;

    counter uut (
        .stopwatch_clock(stopwatch_clock),
        .start_stop_toggle(enable),
        .reset_toggle(reset_toggle),
        .mode_sel(mode_sel),
        .init_val_one(init_val_one), .init_val_two(init_val_two),
        .digit0(digit0), .digit1(digit1), .digit2(digit2), .digit3(digit3)
    );

    initial begin
    
    stopwatch_clock = 0;
    enable = 0;
    reset_toggle = 1;
    mode_sel = 2'b00;
    init_val_one = 4'b0000;
    init_val_two = 4'b0000;
//    digit0 = 4'b0000;
//    digit1 = 4'b0000;
//    digit2 = 4'b0000;
//    digit3 = 4'b0000;
    
    #20;
    
    reset_toggle = 0;
    enable = 1;
    
    end
    
    always
    #50 stopwatch_clock = ~stopwatch_clock;
    
    

endmodule
