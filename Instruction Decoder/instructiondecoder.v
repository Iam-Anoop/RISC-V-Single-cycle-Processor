`timescale 1ns / 1ps
module instructiondecoder(input [31:0]inst,
                          output[6:0]opcode,
                          output[4:0]rd,
                          output[4:0]rs1,rs2,
                          output[2:0]fn3,
                          output[6:0]fn7);
                          
assign opcode=inst[6:0];
assign rd=inst[11:7];
assign fn3=inst[14:12];
assign rs1=inst[19:15];
assign rs2=inst[24:20];
assign fn7=inst[31:25];
                          
endmodule
