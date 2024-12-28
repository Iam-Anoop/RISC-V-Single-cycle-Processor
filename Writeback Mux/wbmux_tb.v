`timescale 1ns / 1ps
module wbmux_tb();
reg [31:0]pcplus4,result,immu,readmemdata;
reg[1:0]wbmux;
wire[31:0]wbout;

wbmux dut(.pcplus4(pcplus4),.result(result),.immu(immu),.readmemdata(readmemdata),.wbmux(wbmux),.wbout(wbout));

initial
begin
    //initialise those 4 input to mux
    pcplus4 = 32'd4;   
    result = 32'd16;      
    immu = 32'd32;         
    readmemdata = 32'd48;  
    wbmux = 2'b00; 
    #10;
    $display("wbmux=%b, pcplus4=%d, wbdataout=%d",wbmux,pcplus4,wbout);
    
    wbmux=2'b01;
    #10;
    $display("wbmux=%b, result=%d, wbdataout=%d",wbmux,result,wbout);
    
    
    wbmux=2'b10;
    #10;
    $display("wbmux=%b, immu=%d, wbdataout=%d",wbmux,immu,wbout);
    
    
    wbmux=2'b11;
    #10;
    $display("wbmux=%b, memdataout=%d, wbdataout=%d",wbmux,readmemdata,wbout);
    
    
    #10;
    $finish;
    
end

endmodule
