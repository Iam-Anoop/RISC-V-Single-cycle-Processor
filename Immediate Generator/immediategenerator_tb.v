`timescale 1ns / 1ps
module immediategenerator_tb();
reg [31:0]inst;
reg [6:0]opcode;
wire [31:0]immi,imms,immj,immb,immu;

immediategenerator dut(.inst(inst),.opcode(opcode),.immi(immi),.imms(imms),.immj(immj),.immb(immb),.immu(immu));

initial
begin
$monitor("time=%0t | opcode=%b | inst=%b| immi=%b| imms=%b| immj=%b| immb=%b| immu=%b",$time,opcode,inst,immi,imms,immj,immb,immu);
    // Test I-type instruction (e.g., ADDI x2, x1, 1)
        inst = 32'b000000000001_00001_000_00010_0010011;opcode=7'b0010011;
        #10;

        // Test S-type instruction (e.g., SW x3, 1(x2))
        inst = 32'b0000000_00011_00010_010_00001_0100011;opcode=7'b0100011;
        #10;

        // Test B-type instruction (e.g., BEQ x1, x2, offset 4)
        inst = 32'b0000000_00001_00010_000_00010_1100011;opcode=7'b1100011;
        #10;

        // Test U-type instruction (e.g., LUI x2, 1)
        inst = 32'b00000000000000000001_00010_0110111;opcode=7'b0110111;
        #10;

        // Test J-type instruction (e.g., JAL x2, offset 4)
        inst = 32'b00000000000100000000_00010_1101111; opcode=7'b1101111;
        #10;
        $finish;
end        

endmodule
