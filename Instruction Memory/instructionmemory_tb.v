`timescale 1ns / 1ps
module instructionmemory_tb();
reg reset;
reg[31:0]pc;
wire [31:0]inst;

instructionmemory dut(.reset(reset),.pc(pc),.inst(inst));

initial
begin
$monitor("time=%0t|pc=%d|inst=%h",$time,pc,inst);
    pc=0; //0/4=0 fetch first inst
    reset=0;
    #10;
    reset=1;
    #10;
    reset=0;
    #10;
    pc=32'd4; //fetch second instruction from memory 4/4=1
    #10;
     pc=32'd8; //fetch third inst 8/4=2
    #10;
    pc=32'd12;
    #10;
    pc=32'd16;
    #10;
    pc=18; //invalid ,inst remain same
    #10;
    $finish;
end    
endmodule    
    
    

