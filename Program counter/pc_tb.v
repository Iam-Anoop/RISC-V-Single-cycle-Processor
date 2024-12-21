`timescale 1ns / 1ps
module pc_tb();
reg clk,reset;
reg[31:0]immj,immb,jt;
reg[1:0]pcmux;
wire[31:0]pc;
integer i;

pc dut(.clk(clk),.reset(reset),.immj(immj),.immb(immb),.jt(jt),.pcmux(pcmux),.pc(pc));

initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end

task initialise;
begin
    reset=0;
    immb=0;
    immj=0;
    jt=0;
    pcmux=0;
end
endtask

task resetdrive;
begin
    @(negedge clk)
        reset=1'b1;
    @(negedge clk)
        reset=1'b0;  
end
endtask

task inputdrive;
reg[1:0]datain;
begin
    @(negedge clk)  
        immb=32'd15;
        immj=32'd30;
        jt=32'd45; 
    #10;
        for(i=0;i<3;i=i+1) begin
            @(negedge clk)
            datain=i;
            pcmux=datain;
        end
    #10;
        pcmux=0;
end
endtask   

initial
begin
$monitor("time=%0t|pcmux=%b|pc=%d|immb=%d|immj=%d|jt=%d",$time,pcmux,pc,immb,immj,jt);
    resetdrive;
    initialise;
    inputdrive;
    #50;
    $finish;
end

endmodule
