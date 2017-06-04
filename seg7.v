module seg7(input [3:0]num, output [6:0]seg);
   reg [6:0]nseg;
    always @(num) begin
        case (num)
            4'b0000: nseg = 7'b0111111; // 0
            4'b0001: nseg = 7'b0000110; // 1
            4'b0010: nseg = 7'b1011011; // 2
            4'b0011: nseg = 7'b1001111; // 3
            4'b0100: nseg = 7'b1100110; // 4
            4'b0101: nseg = 7'b1101101; // 5
            4'b0110: nseg = 7'b1111100; // 6
            4'b0111: nseg = 7'b0100111; // 7
            4'b1000: nseg = 7'b1111111; // 8
            4'b1001: nseg = 7'b1100111; // 9
            default: nseg = 7'b0000000; //  
        endcase
    end
   assign seg = ~nseg;
endmodule
