`timescale 1ns / 1ps
module regfile_tb();
reg clk,werf;
reg[4:0]ra1,ra2,wa;
reg[31:0]wd;
wire [31:0]rd1,rd2;

regfile dut(.clk(clk),.werf(werf),.ra1(ra1),.ra2(ra2),.wa(wa),.wd(wd),.rd1(rd1),.rd2(rd2));

initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end

initial
begin
    werf=0;
    ra1=0; ra2=0; wa=0; wd=0;
    #10;
    
    ra1=5'd0;
    ra2=5'd1;
    werf=1;
    wa=5'd10;
    wd=32'd56;
    #10;
    $display("rd1=%h,rd2=%h,wd=%d",rd1,rd2,wd);
    
    ra1=5'd2;
    ra2=5'd3;
    werf=1;
    wa=5'd12;
    wd=32'd69;
    #10;
    $display("rd1=%h,rd2=%h,wd=%d",rd1,rd2,wd);
    
    ra1=5'd4;
    ra2=5'd5;
    werf=1;
    wa=5'd0;
    wd=32'd66;
    #10;
    $display("rd1=%h,rd2=%h,wd=%d",rd1,rd2,wd);
    
    ra1=5'd6;
    ra2=5'd10;
    werf=1;
    wa=5'd0;
    wd=32'd66;
    #10;
    $display("rd1=%h,rd2=%h,wd=%d",rd1,rd2,wd);
    
    ra1=5'd7;
    ra2=5'd18; //THIS GIVE RD1 ,RD2 AS x since the file load regfile only upto 6 th location
    werf=1;
    wa=5'd1;
    wd=32'd20;
    #10;
    $display("rd1=%h,rd2=%h,wd=%d",rd1,rd2,wd);
 
#10;
$finish;    
end

endmodule
