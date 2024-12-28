`timescale 1ns / 1ps
module data_memory(input clk,mwr,
                   input[31:0]wd,
                   input[31:0]addr,
                   output[31:0]rd);
                   
reg [31:0]ram[0:1023];

//asyn read //mwr==1
assign rd=(mwr==1)?ram[addr[31:2]]:32'd0; //word aligned

always@(posedge clk)
begin
    if(!mwr)
        ram[addr[31:2]]<=wd;
end        
                                    
endmodule
