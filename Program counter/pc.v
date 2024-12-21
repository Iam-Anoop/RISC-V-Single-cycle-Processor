`timescale 1ns / 1ps
module pc(input clk,reset,
          input [1:0]pcmux,
          input [31:0]immb,immj,jt, //jt is addr formed for jalr inst
          output reg[31:0]pc);
          
//internal reg
reg [31:0]pcnext; //such that pcnext is updated as combinational logic and this pcnext can be assigned to pc at every posedge

always@(*)
begin   
    case(pcmux)
    2'b00:pcnext=pc+4;
    2'b01:pcnext=pc+immb;
    2'b10:pcnext=pc+immj;
    2'b11:pcnext=jt;
    default:pcnext=pc;
    endcase
end

always@(posedge clk)
begin
    if(reset)
        pc<=0;
    else 
        pc<=pcnext;
end
           
endmodule
