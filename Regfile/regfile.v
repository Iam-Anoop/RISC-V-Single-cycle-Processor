`timescale 1ns / 1ps
module regfile(input clk,werf,
               input[4:0]ra1,ra2,wa,
               input[31:0]wd,
               output [31:0]rd1,rd2);
               
reg [31:0]register[31:0];

//async read
assign rd1=register[ra1];
assign rd2=register[ra2];

//syn write
always@(posedge clk)
begin
    if(werf & wa!=0) //wa should not be xo reg which is hardwired to  zero
        register[wa]<=wd;
end
     
initial
begin
$readmemh("C:/Users/x/RISC V Single cycle processor/Single cycle RISC V processor/Single cycle RISC V processor.srcs/sim_1/new/registers.hex",register);           
end
endmodule
