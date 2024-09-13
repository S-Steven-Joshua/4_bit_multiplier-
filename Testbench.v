module tb();
  reg [3:0] a, b;
  wire [7:0] y;

  multi ut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    #10
    a = 4'b0001; b = 4'b0001;
    #10;
    
    a = 4'b0011; b = 4'b0101;
    #10;
    
    a = 4'b1010; b = 4'b1100;
    #10;
    
    a = 4'b1111; b = 4'b1111;
    #10;

    a = 4'b0101; b = 4'b0011;
    #10;



    $finish;

  end
endmodule
