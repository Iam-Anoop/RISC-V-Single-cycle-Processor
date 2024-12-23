`timescale 1ns / 1ps
module immediategenerator(input [31:0]inst,
                          input[6:0]opcode,
                          output reg[31:0]immi,
                          output reg[31:0]imms,
                          output reg[31:0]immj,
                          output reg[31:0]immb,
                          output reg[31:0]immu);
                          
always@(*)
begin
    //default all outputs to zero
    immi=32'd0;
    imms=32'd0; 
    immj=32'd0;
    immb=32'd0;
    immu=32'd0;  
    case(opcode)
    7'b0010011,//I type
    7'b0000011,//load
    7'b1100111: //JALR
        immi={{20{inst[31]}},inst[31:20]};
    7'b0100011: //s type
        imms={{20{inst[31]}},inst[31:25],inst[11:7]};
    7'b1100011: //b type
        immb={{19{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0}; //left shift is done since this immediate is word aligned in instruction and it need to be converted to byte to use as offset in pc,similarly for j type ie jal 
    7'b0110111, //lui
    7'b0010111: //auipc
        immu={inst[31:12],12'd0};
    7'b1101111: //JAL
        immj={{11{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
    default: begin
        immi=32'd0;
        imms=32'd0; 
        immj=32'd0;
        immb=32'd0;
        immu=32'd0;
        end             
    endcase
end    
                    
                           
endmodule
