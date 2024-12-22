`timescale 1ns / 1ps
module instructiondecoder_tb();
reg [31:0]inst;
wire [6:0]opcode;
wire [4:0]rd;
wire[4:0]rs1,rs2;
wire[2:0]fn3;
wire[6:0]fn7;

instructiondecoder dut(.inst(inst),.opcode(opcode),.rd(rd),.rs1(rs1),.rs2(rs2),.fn3(fn3),.fn7(fn7));

initial
begin
$monitor("time=%0t|inst=%b|opcode=%b|rd=%b |fn3=%b |rs1=%b |rs2=%b |fn7=%b",$time,inst,opcode,rd,fn3,rs1,rs2,fn7);
     // I-type instruction (e.g., load word lw x4, 0(x5))
        inst = 32'b000000000000_00101_010_00100_0000011; // lw x4, 0(x5)
        #10;
        
        // S-type instruction (e.g., store word sw x6, 4(x7))
        inst = 32'b0000000_00110_00111_010_00000_0100011; // sw x6, 4(x7)
        #10;
        
        // B-type instruction (e.g., branch if equal beq x8, x9, 8)
        inst = 32'b0000000_01001_01000_000_00001_1100011; // beq x8, x9, 8
        #10;
        
        // J-type instruction (e.g., jump and link jal x10, 16)
        inst = 32'b00000000100000000001_01010_1101111; // jal x10, 16
        #10;

        //  U-type instruction (e.g., auipc x11, 32)
        inst = 32'b00000000000000100000_01011_0010111; // auipc x11, 32
        #10;
        $finish;
end        
endmodule
