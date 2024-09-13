module multi(a,b,pro);
input [3:0] a,b;
output [7:0] pro;

assign pro[0]=a[0]&b[0];

wire x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17;


fa h1((a[1]&b[0]),(a[0]&b[1]),1'b0,pro[1],x1);
fa f1((a[1]&b[1]),(a[2]&b[0]),x1,x2,x3);
fa f2(x3,(a[2]&b[1]),(a[3]&b[0]),x4,x5);
fa h2((a[3]&b[1]),x5,1'b0,x6,x7);

fa h3((a[0]&b[2]),x2,1'b0,pro[2],x9);
fa f3((a[1]&b[2]),x9,x4,x10,x11);
fa f4(x11,(a[2]&b[2]),x6,x12,x13);
fa f5(x13,x7,(a[3]&b[2]),x14,x15);

fa h4((a[0]&b[3]),x10,1'b0,pro[3],x16);
fa f6((a[1]&b[3]),x12,x16,pro[4],x17);
fa f7((a[2]&b[3]),x17,x14,pro[5],x8);
fa f8((a[3]&b[3]),x8,x15,pro[6],pro[7]);

endmodule 
