module multi_4_row(a, b, pro);
input [3:0] a, b;
output [7:0] pro;    
wire [3:0] p0, p1, p2, p3;  

  
    

assign p0 = a & {4{b[0]}};   
assign p1 = a & {4{b[1]}};
    
assign p2 = a & {4{b[2]}};
    
assign p3 = a & {4{b[3]}};

 
    
wire bypass1 = ~b[1];     
wire bypass2 = ~b[2];    
wire bypass3 = ~b[3];  
wire [4:0] sum1, sum2, sum3;
wire [4:0] carry1, carry2, carry3;

    
assign pro[0] = p0[0];
 fab fab01(p0[1], p1[0], 1'b0, bypass1, sum1[0], carry1[0]);
 fab fab02(p0[2], p1[1], carry1[0], bypass1, sum1[1], carry1[1]);
 fab fab03(p0[3], p1[2], carry1[1], bypass1, sum1[2], carry1[2]);
 fab fab04(1'b0, p1[3], carry1[2], bypass1, sum1[3], carry1[3]);

    
assign pro[1] = sum1[0];
fab fab11(sum1[1], p2[0], 1'b0, bypass2, sum2[0], carry2[0]);
 fab fab12(sum1[2], p2[1], carry2[0], bypass2, sum2[1], carry2[1]);
 fab fab13(sum1[3], p2[2], carry2[1], bypass2, sum2[2], carry2[2]);
 fab fab14(carry1[3], p2[3], carry2[2], bypass2, sum2[3], carry2[3]);

    
assign pro[2] = sum2[0];
fab fab21(sum2[1], p3[0], 1'b0, bypass3, sum3[0], carry3[0]);
fab fab22(sum2[2], p3[1], carry3[0], bypass3, sum3[1], carry3[1]);
fab fab23(sum2[3], p3[2], carry3[1], bypass3, sum3[2], carry3[2]);
fab fab24(carry2[3], p3[3], carry3[2], bypass3, sum3[3], carry3[3]);

    
assign pro[3] = sum3[0];
assign pro[4] = sum3[1];
assign pro[5] = sum3[2];
assign pro[6] = sum3[3];
 assign pro[7] = carry3[3];
endmodule


module fab(a, b, cin, bypass, sum, cout);
input a, b, cin, bypass;
output sum, cout;
    
wire fa_sum, fa_cout;
fa f1(a, b, cin, fa_sum, fa_cout);  

    
assign sum = bypass ? a : fa_sum;
assign cout = bypass ? cin : fa_cout;
endmodule


module fa(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;
assign sum = a ^ b ^ cin;

assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
