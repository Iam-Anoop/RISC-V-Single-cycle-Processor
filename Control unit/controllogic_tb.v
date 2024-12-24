`timescale 1ns / 1ps
module controllogic_tb();
reg [6:0]opcode,fn7;
reg[2:0]fn3;
reg bt;
reg [31:0]immi;
wire werf,mwr;
wire [3:0]aluop;
wire [1:0]pcmux,irmux,wbmux;

controllogic dut(.opcode(opcode),.fn3(fn3),.fn7(fn7),.bt(bt),.immi(immi),.werf(werf),.mwr(mwr),.aluop(aluop),.pcmux(pcmux),.irmux(irmux),.wbmux(wbmux));

initial 
begin
$monitor("time=%0t|opcode=%b| fn3=%b| fn7=%b|immi[11:5]=%b| bt=%b| werf=%b| mwr=%b |aluop=%b| pcmux=%b| wbmux=%b| irmux=%b ",$time,opcode,fn3,fn7,immi[11:5],bt,werf,mwr,aluop,pcmux,wbmux,irmux);
     // R-type ADD
    opcode = 7'b0110011; fn3 = 3'b000; fn7 = 7'b0000000; immi = 32'b0; bt = 0;
    #10;
    // R-type SUB
    opcode = 7'b0110011; fn3 = 3'b000; fn7 = 7'b0100000; immi = 32'b0; bt = 0;
    #10;
    //ADDI
    opcode = 7'b0010011; fn3 = 3'b000; fn7 = 7'b0; immi = 32'h00000010; bt = 0;
    #10;
    // SRAI
    opcode = 7'b0010011; fn3 = 3'b101; fn7 = 7'b0; immi = 32'h00000020; 
    #10;
    //SRLI
    opcode = 7'b0010011; fn3 = 3'b101; fn7 = 7'b0; immi = 32'h00400000; 
    #10;
    //(LW)
    opcode = 7'b0000011; fn3 = 3'b010; fn7 = 7'b0; immi = 32'h0; bt = 0;
    #10;
    //(SW)
    opcode = 7'b0100011; fn3 = 3'b010; fn7 = 7'b0; immi = 32'h0; bt = 0;
    #10;
    //(BEQ)
    opcode = 7'b1100011; fn3 = 3'b000; fn7 = 7'b0; immi = 32'h0; bt = 1; // Taken
    #10;
    // Test 9: Branch (BNE)
    opcode = 7'b1100011; fn3 = 3'b001; fn7 = 7'b0; immi = 32'h0; bt = 0; // Not taken
    #10;
    //LUI
    opcode = 7'b0110111; fn3 = 3'b0; fn7 = 7'b0; immi = 32'h0; bt = 0;
    #10;
    // Test 11: JAL
    opcode = 7'b1101111; fn3 = 3'b0; fn7 = 7'b0; immi = 32'h0; bt = 0;
    #10;
    //JALR
    opcode = 7'b1100111; fn3 = 3'b0; fn7 = 7'b0; immi = 32'h0; bt = 0;
    #10;
    $finish;
end
endmodule
