module ClockGenerator (
    input clk,            // 50 MHz Clock input
    output reg clk_1Hz   // 1 Hz Clock output
    //output reg clk_5Hz    // 5 Hz Clock output    
);

reg [24:0] count1;        // Counter for 50 MHz clock cycles
//reg [22:0] count2;        // Counter for 50 MHz clock cycles

always @(posedge clk) begin
    // Increment the counter on each clock edge
    count1 <= count1 + 1;
    //count2 <= count2 + 1;

    // Generate 1 Hz clock when 25 million clock cycles have elapsed
    if (count1 == 25000000) begin
        clk_1Hz <= ~clk_1Hz;   // Toggle the 1 Hz clock signal
        count1 <= 0;           // Reset the counter
    end

    //if (count2 == 5000000) begin
      //clk_5Hz <= ~clk_5Hz;
      //count2 <= 0;
    //end
end

endmodule