`timescale 1ns/1ps
module tb_test_clock();
    reg clk_1Hz;
    reg rst_n;
    wire [5:0] mon_sec;
    wire [5:0] mon_min;
    wire [4:0] mon_hour;
    wire [4:0] mon_day;
    wire [3:0] mon_mont;
    wire [12:0] mon_year;

    test_clock dut(
        .clk_1Hz(clk_1Hz),
        .rst_n(rst_n),
        .sec(mon_sec),
        .min(mon_min),
        .hour(mon_hour),
        .day(mon_day),
        .mont(mon_mont),
        .year(mon_year)
    );

    initial begin
        clk_1Hz = 0;
        forever #0.5 clk_1Hz = ~clk_1Hz;  
    end

    initial begin
    $monitor ("Time = %t, sec = %d, min = %d, hour = %d, day = %d, mont = %d, year = %d", $time, mon_sec, mon_min, mon_hour, mon_day, mon_mont, mon_year);
    end
    initial begin
        rst_n = 0; //reset
        #1;
        rst_n = 1; //bo reset
        #100000
        $finish;
    end

endmodule