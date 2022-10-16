// S�? 变换
// �?48bit的输入，进行s变换，其实每�?个s变换都是�?个用case实现的组合�?�辑

module  S_box (
    input   [1:48]  in  ,
    output  [1:32]  out
);

    S1 u_S1(in[ 1: 6],out[ 1: 4]);
    S2 u_S2(in[ 7:12],out[ 5: 8]);
    S3 u_S3(in[13:18],out[ 9:12]);
    S4 u_S4(in[19:24],out[13:16]);
    S5 u_S5(in[25:30],out[17:20]);
    S6 u_S6(in[31:36],out[21:24]);
    S7 u_S7(in[37:42],out[25:28]);
    S8 u_S8(in[43:48],out[29:32]);

endmodule