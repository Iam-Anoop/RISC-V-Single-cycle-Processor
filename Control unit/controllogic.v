`timescale 1ns / 1ps
module controllogic(input [6:0]opcode,fn7,
                    input[2:0]fn3,
                    input bt,
                    input [31:0]immi,//only to distinguish srl and sra in i type
                    output reg werf,mwr,
                    output reg [3:0]aluop,
                    output reg [1:0]pcmux,irmux,wbmux);
                    
always@(*)
begin
    //default output value
    werf=0;
    mwr=1; //read
    aluop=4'b1111; //nop
    pcmux=2'b00;
    irmux=2'b00;
    wbmux=2'b00;
        case(opcode)
        7'b0110011: begin  //r type
            werf=1;
            pcmux=2'b00;
            irmux=2'b00; //rs2
            wbmux=2'b01; //result
            case(fn3)
            3'b000:aluop=(fn7==7'b0000000)?4'b0000:4'b0001; //add/sub
            3'b001:aluop=4'b0101; //sll
            3'b111:aluop=4'b0010; //and
            3'b110:aluop=4'b0011; //or
            3'b100:aluop=4'b0100; //xor
            3'b101:aluop=(fn7==7'b0000000)?4'b0110:4'b0111; //srl/sra
            3'b010:aluop=4'b1010; //set less than signed(slt)
            3'b011:aluop=4'b1011; //sltu
            endcase
        end
        
        7'b0010011: begin  //i type
            werf=1;
            pcmux=2'b00;
            irmux=2'b01; //immi
            wbmux=2'b01; //result
            case(fn3)
            3'b000:aluop=4'b0000; //add
            3'b001:aluop=4'b0101; //sll
            3'b111:aluop=4'b0010; //and
            3'b110:aluop=4'b0011; //or
            3'b100:aluop=4'b0100; //xor
            3'b101:aluop=(immi[11:5]==7'b0000000)?4'b0110:4'b0111; //srl/sra
            3'b010:aluop=4'b1010; //set less than signed(slt)
            3'b011:aluop=4'b1011; //sltu
            endcase
        end
        
        7'b0000011: begin //load
            werf=1;
            aluop=4'b0000;
            irmux=2'b01;
            wbmux=2'b11; //rd from data memory 
            mwr=1; //read
        end
        
        7'b0100011: begin //store
            werf=0;
            aluop=4'b0000;
            irmux=2'b10; //imms
            mwr=0; //write to memory data
        end
        
        7'b1100011: begin //b type
            pcmux=(bt==1)?2'b01:2'b00; //immb/pc+4
            werf=0;
            case(fn3)
            3'b000:aluop=4'b1000; //beq
            3'b001:aluop=4'b1001; //bne
            3'b100:aluop=4'b1100; //blt
            3'b101:aluop=4'b1101; //bge
            endcase
        end
        
        7'b0110111: begin //u type only lui
            werf=1;
            wbmux=2'b10; //immu
        end
        
        7'b1101111: begin //jal
            pcmux=2'b10; //pc+immj
            werf=1;
            wbmux=2'b00; //pc+4
        end
        
        7'b1100111: begin //jalr
            pcmux=2'b11; //jt
            werf=1;
            wbmux=2'b00; //pc+4
        end
        default: begin
            werf=0;
            mwr=1; //read
            aluop=4'b1111; //nop
            pcmux=2'b00; //pc+4
            irmux=2'b00; //rs2
            wbmux=2'b00; //pc+4
        end
        
    endcase       
end            
                                  
endmodule
