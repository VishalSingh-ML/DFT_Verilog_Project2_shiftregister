module shift_register (
    input clk,
    input rst,
    input scan_en,
    input scan_in,
    input d,
    output reg [3:0] q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 4'b0000;
    else if (scan_en)
        q <= {q[2:0], scan_in};  // Scan mode: shift right, load scan_in
    else
        q <= {q[2:0], d};        // Normal mode: shift right, load d
end

endmodule
