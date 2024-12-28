`timescale 1ns / 1ps
module wbmux(input [31:0]pcplus4,result,immu,readmemdata,
             input [1:0]wbmux,
             output reg [31:0]wbout);
             
always@(*)
begin
    case(wbmux)
    2'b00:wbout=pcplus4;
    2'b01:wbout=result;
    2'b10:wbout=immu;
    2'b11:wbout=readmemdata;
    default:wbout=result;
    endcase
end    
                 
endmodule
