`timescale 1ns / 1ps
module process(MODE,round,in,key,out,newkey,deskeys);
    input  [1:0]MODE;                   //MODEΪ0����DES���ܣ�1��DES���ܣ�2��AES���ܣ�3��AES����
    input [4:0]   round;                //����aes��ʾ�ڼ��ּӽ���
    input  [127:0] in;                  //���������
    input  [127:0] key;                 //aes��key
    input  [1:768]deskeys;              //deskeys����desÿһ�ֵ���Կ
    output   [127:0] out;               //outһ�ּӽ��ܵĽ��
    output   [127:0] newkey;            //������һ�ֵ���Կ
    wire    [127:0] usekey;
    reg     [127:0] endeskey,dedeskey;
    wire   [127:0] text1,text2,text3;
    keyprocess tonewkey(MODE,round,key,newkey);
    always@(*)begin                                             //��ȡDES��Կ
    case(round)
        5'b00001: endeskey={80'b0,deskeys[1:48]};
        5'b00010: endeskey={80'b0,deskeys[49:96]};
        5'b00011: endeskey={80'b0,deskeys[97:144]};
        5'b00100: endeskey={80'b0,deskeys[145:192]};
        5'b00101: endeskey={80'b0,deskeys[193:240]};
        5'b00110: endeskey={80'b0,deskeys[241:288]};
        5'b00111: endeskey={80'b0,deskeys[289:336]};
        5'b01000: endeskey={80'b0,deskeys[337:384]};
        5'b01001: endeskey={80'b0,deskeys[385:432]};
        5'b01010: endeskey={80'b0,deskeys[433:480]};
        5'b01011: endeskey={80'b0,deskeys[481:528]};
        5'b01100: endeskey={80'b0,deskeys[529:576]};
        5'b01101: endeskey={80'b0,deskeys[577:624]};
        5'b01110: endeskey={80'b0,deskeys[625:672]};
        5'b01111: endeskey={80'b0,deskeys[673:720]};
        5'b10000: endeskey={80'b0,deskeys[721:768]};
        endcase
    case(round)
        5'b00001: dedeskey={80'b0,deskeys[721:768]};
        5'b00010: dedeskey={80'b0,deskeys[673:720]};
        5'b00011: dedeskey={80'b0,deskeys[625:672]};
        5'b00100: dedeskey={80'b0,deskeys[577:624]};
        5'b00101: dedeskey={80'b0,deskeys[529:576]};
        5'b00110: dedeskey={80'b0,deskeys[481:528]};
        5'b00111: dedeskey={80'b0,deskeys[433:480]};
        5'b01000: dedeskey={80'b0,deskeys[385:432]};
        5'b01001: dedeskey={80'b0,deskeys[337:384]};
        5'b01010: dedeskey={80'b0,deskeys[289:336]};
        5'b01011: dedeskey={80'b0,deskeys[241:288]};
        5'b01100: dedeskey={80'b0,deskeys[193:240]};
        5'b01101: dedeskey={80'b0,deskeys[145:192]};
        5'b01110: dedeskey={80'b0,deskeys[97:144]};
        5'b01111: dedeskey={80'b0,deskeys[49:96]};
        5'b10000: dedeskey={80'b0,deskeys[1:48]};
        endcase
        end
    assign usekey=(MODE==2'b00)?dedeskey:((MODE==2'b01)?endeskey:key);
    desL DESSOLVE(in,usekey,text1);
    aesde AESSOLVE(in,usekey,round,text2);
    aesen AESSSSS(in,usekey,round,text3);
    assign out=(MODE==2'b00||MODE==2'b01)?text1:((MODE==2'b10)?text2:text3);
endmodule
