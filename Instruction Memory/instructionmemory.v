`timescale 1ns / 1ps
module instructionmemory #(parameter width=32,depth=1024)
(input [31:0]pc,
 input reset,
 output reg[31:0]inst);
 
 //internal reg
 reg [width-1:0]mem[0:depth-1];
 
 always@(*)
 begin
    if(reset)
        inst=0;
    else
        inst=mem[pc[31:2]]; //addr from pc is byte aligned so the lower two bits is neglected since the memory is word aligned
                            //so why last two bits gone because it is actually divide by 4(right shift)since 1 word=4 bytes
end

//preload memory with instruction
initial
begin
    $readmemh("C:/Users/x/RISC V Single cycle processor/Single cycle RISC V processor/Single cycle RISC V processor.srcs/sim_1/new/instructions.hex",mem);
end    
 
endmodule
