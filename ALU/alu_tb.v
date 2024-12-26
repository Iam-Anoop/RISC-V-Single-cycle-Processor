`timescale 1ns / 1ps
module alu_tb();
reg[31:0]rs1,rs2,immi,imms;
reg [3:0]aluop;
reg[1:0]irmux;
wire[31:0]result;
wire [31:0]jt;
wire bt;

alu dut(.rs1(rs1),.rs2(rs2),.immi(immi),.imms(imms),.aluop(aluop),.irmux(irmux),.result(result),.jt(jt),.bt(bt));

initial
begin
        // Initialize inputs
        rs1 = 32'd10;
        rs2 = 32'd20;
        immi = 32'd5;
        imms = 32'd15;
        irmux = 2'b00;
        
        aluop = 4'b0000; // add
        #10;
        $display("ADD: rs1=%d, rs2=%d, result=%d", rs1, rs2, result);

        aluop = 4'b0001; // sub
        #10;
        $display("SUB: rs1=%d , rs2=%d ,result=%d",rs1,rs2,$signed(result));

        aluop = 4'b0010; // and
        #10;
        $display("AND: rs1=%h, rs2=%h, result=%h", rs1, rs2, result);

        aluop = 4'b0011; // or
        #10;
        $display("OR: rs1=%h, rs2=%h, result=%h", rs1, rs2, result);

        aluop = 4'b0100; // xor
        #10;
        $display("XOR: rs1=%h, rs2=%h, result=%h", rs1, rs2, result);

        aluop = 4'b0101; // sll
        irmux = 2'b01;  //  immi
        #10;
        $display("SLL: rs1=%h, immi=%h, result=%h", rs1, immi, result);

        aluop = 4'b0110; // srl
        #10;
        $display("SRL: rs1=%h, immi=%h, result=%h", rs1, immi, result);

        aluop = 4'b0111; // sra
        #10;
        $display("SRA: rs1=%h, immi=%h, result=%h", rs1, immi, result);

        aluop = 4'b1000; // beq
        irmux = 2'b00;  // select rs2
        #10;
        $display("BEQ: rs1=%d, rs2=%d, bt=%b", rs1, rs2, bt);

        aluop = 4'b1010; // slt
        #10;
        $display("SLT: rs1=%d, rs2=%d, result=%d", rs1, rs2, result);

        aluop = 4'b1111; // nop
        #10;
        $display("NOP: result=%d", result);
        
        aluop=4'b0000;
        irmux=2'b01;
        #10;
        $display("ADDI : rs1=%d , immi=%d , result=%d",rs1,immi,result);
        
        #10;
        $finish;
end        

endmodule
