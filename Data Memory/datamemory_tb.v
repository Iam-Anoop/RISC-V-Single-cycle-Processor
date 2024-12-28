`timescale 1ns / 1ps
module datamemory_tb();
reg clk,mwr;
reg[31:0]addr,wd;
wire[31:0]rd;

data_memory dut(.clk(clk),.mwr(mwr),.addr(addr),.wd(wd),.rd(rd));

initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end

initial
begin
    addr=32'd0;
    wd=32'd0;
    mwr=0;
    #10;
    
    addr=32'd4;
    wd=32'd56;
    #10;
    $display("mwr=%b, addr=%d, wd=%d",mwr,addr,wd);
    
    addr=32'd8;
    wd=32'd22;
    #10;
    $display("mwr=%b, addr=%d, wd=%d",mwr,addr,wd);
    
    addr=32'd12;
    wd=32'd86;
    #10;
    $display("mwr=%b, addr=%d, wd=%d",mwr,addr,wd);
    
    addr=32'd24;
    wd=32'd33;
    #10;
    $display("mwr=%b, addr=%d, wd=%d",mwr,addr,wd);
    
    addr=32'd36;
    wd=32'd56;
    #10;
    $display("mwr=%b, addr=%d, wd=%d",mwr,addr,wd);
    
    addr=32'd52;
    wd=32'd96;
    #10;
    $display("mwr=%b, addr=%d, wd=%d",mwr,addr,wd);
    
    addr=32'd4;
    mwr=1;
    #10;
    $display("mwr=%b, addr=%d, rd=%d",mwr,addr,rd);
    
    addr=32'd8;
    mwr=1;
    #10;
    $display("mwr=%b, addr=%d, rd=%d",mwr,addr,rd);
    
    addr=32'd12;
    mwr=1;
    #10;
    $display("mwr=%b, addr=%d, rd=%d",mwr,addr,rd);
    
    addr=32'd24;
    mwr=1;
    #10;
    $display("mwr=%b, addr=%d, rd=%d",mwr,addr,rd);
    
    addr=32'd36;
    mwr=1;
    #10;
    $display("mwr=%b, addr=%d, rd=%d",mwr,addr,rd);
    
    addr=32'd52;
    mwr=1;
    #10;
    $display("mwr=%b, addr=%d, rd=%d",mwr,addr,rd);
    
    #10;
    $finish;
end
    
endmodule
