`timescale 1ns / 1ps
module invkey(MODE,key,keyout0,keyout);
    input  [1:0]MODE;//MODEΪ0����DES����,2��AES����
    input  [127:0] key;
    output   [127:0] keyout0;
    output   [127:0] keyout;
    reg [127:0] keyout_reg;
    wire [127:0] keyaes,keyearly,keydes;
    AESkeyprocess FINALKEY(key,keyearly,keyaes);
    assign keyout0=keyaes;
    assign keyout=keyearly;
    
endmodule