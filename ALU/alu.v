`timescale 1ns / 1ps
module alu(input[31:0]rs1,rs2,immi,imms,
           input [3:0]aluop,
           input[1:0]irmux,
           output reg[31:0]result,
           output [31:0]jt,
           output reg bt);
//based on irmux cs from control unit this op2 change           
wire [31:0]op2;

assign op2=(irmux==2'b00)?rs2:
           (irmux==2'b01)?immi:
           (irmux==2'b10)?imms:32'd0;

//jt output is for jalr inst it would only be used in pc at pcmux=2'b11
assign jt=(rs1+immi)&~32'd1;

always@(*)
begin
    //default
    result=32'd0;
    bt=0;
    case(aluop)
    4'b0000:result=rs1+op2; //add
    4'b0001:result=rs1-op2; //sub
    4'b0010:result=rs1&op2; //and
    4'b0011:result=rs1|op2; //or
    4'b0100:result=rs1^op2; //xor
    4'b0101:result=rs1<<op2[4:0];  //sll shift left by value specified  in 5 bits(0 to 31)
    4'b0110:result=rs1>>op2[4:0]; //srl
    4'b0111:result=$signed(rs1)>>>op2[4:0];  //sra
    4'b1000:bt=(rs1==op2); //beq
    4'b1001:bt=(rs1!=op2); //bne
    4'b1010:result=($signed(rs1)< $signed(op2))?32'd1:32'd0; //slt
    4'b1011:result=(rs1 < op2)?32'd1:32'd0; //sltu
    4'b1100:bt=($signed(rs1)< $signed(op2));  //blt
    4'b1101:bt=($signed(rs1)>= $signed(op2));  //bge
    4'b1111:result=32'd0;    //nop
    default: begin
    result=32'd0;
    bt=1'b0;
    end
    endcase
end           
endmodule
