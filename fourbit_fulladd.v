module fourbit_fulladd(a, b, c, sum, c_out);
  input [3:0] a, b;
  input c;
  output [3:0] sum;
  output c_out;
  wire [3:0] d;

  full_add fa1(a[0], b[0], c, sum[0], d[0]);
  full_add fa2(a[1], b[1], d[0], sum[1], d[1]);
  full_add fa3(a[2], b[2], d[1], sum[2], d[2]);
  full_add fa4(a[3], b[3], d[2], sum[3], c_out);
endmodule

module fourbit_fulladd_tb();

  reg [3:0] a;
  reg [3:0] b;
  reg c;
  wire [3:0] sum;
  wire c_out;

  fourbit_fulladd uut(.a(a),.b(b),.c(c),.sum(sum),.c_out(c_out));

  initial begin
    
    a = 4'b0000;
    b = 4'b0000;
    c = 0;
    #10;
    if (sum !== 4'b0000 || c_out !== 0) $display("Test case 1 failed");

    
    a = 4'b0001;
    b = 4'b0001;
    c = 0;
    #10;
    if (sum !== 4'b0010 || c_out !== 0) $display("Test case 2 failed");

   
    a = 4'b1111;
    b = 4'b0001;
    c = 0;
    #10;
    if (sum !== 4'b0000 || c_out !== 1) $display("Test case 3 failed");

    a = 4'b1111;
    b = 4'b1111;
    c = 1;
    #10;
    if (sum !== 4'b1111 || c_out !== 1) $display("Test case 4 failed");

    $display("All tests passed");
    $finish;
  end

endmodule
