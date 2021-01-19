`timescale 1ns / 1ps
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// Module:top
// 
// Author: george
// 
// Description: top module of led cube
// 
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2021/01/11   |Initial ver
// --------------------------------------------------------------------
///////////////////////////////sample code : onepulse
module cube_top (
    clk,
    center,
    sw0,
    sw1,
    sw2,
    sclk_out,
    rclk_out,
    sdio_out,
    PS2_DATA,
    PS2_CLK,
    robot_A,
    robot_B
	);

    inout wire PS2_DATA;    
    inout wire PS2_CLK;
    input clk;
    input center;
    input sw0;
    input sw1;
    input sw2;
    input robot_A;
    input robot_B;
    output  sclk_out;
    output  rclk_out;
    output  sdio_out;

    wire clk_19;                            //1/2^17 clk = 2^27/2^17 = 2^10 = 1024 hz ~= 1ms   //digit period 
    clockDivider #(.n(19)) c19(clk, clk_19);//get 1/2^19 clk = 2^27/2^19 = 2^8 = 256 hz ~= 4ms //refresh period = digit period * 4

    wire debounced_center,onepulsed_center;
    debounce db(
        .pb(center),
        .clk(clk_19),
        .pb_debounce(debounced_center)
    );

    OnePulse op(
        .signal_single_pulse(onepulsed_center),
        .signal(debounced_center),
        .clock(clk_19)
    );

    reg [64-1:0] layer_1;
    reg [64-1:0] layer_2;
    reg [64-1:0] layer_3;
    reg [64-1:0] layer_4;
    reg [64-1:0] layer_5;
    reg [64-1:0] layer_6;
    reg [64-1:0] layer_7;
    reg [64-1:0] layer_8;

    wire [64-1:0] L1;
    wire [64-1:0] L2;
    wire [64-1:0] L3;
    wire [64-1:0] L4;
    wire [64-1:0] L5;
    wire [64-1:0] L6;
    wire [64-1:0] L7;
    wire [64-1:0] L8;

    wire [64-1:0] t_L1;
    wire [64-1:0] t_L2;
    wire [64-1:0] t_L3;
    wire [64-1:0] t_L4;
    wire [64-1:0] t_L5;
    wire [64-1:0] t_L6;
    wire [64-1:0] t_L7;
    wire [64-1:0] t_L8;

    wire [64-1:0] z_L1;
    wire [64-1:0] z_L2;
    wire [64-1:0] z_L3;
    wire [64-1:0] z_L4;
    wire [64-1:0] z_L5;
    wire [64-1:0] z_L6;
    wire [64-1:0] z_L7;
    wire [64-1:0] z_L8;

    wire [64-1:0] g_L1;
    wire [64-1:0] g_L2;
    wire [64-1:0] g_L3;
    wire [64-1:0] g_L4;
    wire [64-1:0] g_L5;
    wire [64-1:0] g_L6;
    wire [64-1:0] g_L7;
    wire [64-1:0] g_L8;

    wire finish;
    wire [4-1:0] A_score;
    wire [4-1:0] B_score;
    
    Pong p(
        .clk(clk),
        .rst(debounced_center),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .layer1(L1),
        .layer2(L2),
        .layer3(L3),
        .layer4(L4),
        .layer5(L5),
        .layer6(L6),
        .layer7(L7),
        .layer8(L8),
        .A_score(A_score),
        .B_score(B_score),
        .finish(finish),
        .robot_A(robot_A),
        .robot_B(robot_B)
    );

    Text_animation ta(
        .clk(clk),
        .rst(debounced_center),
       // .Text_num(4'b0),
        .layer1(t_L1),
        .layer2(t_L2),
        .layer3(t_L3),
        .layer4(t_L4),
        .layer5(t_L5),
        .layer6(t_L6),
        .layer7(t_L7),
        .layer8(t_L8)
    );

    zoom_animation zm(
        .clk(clk),
        .rst(debounced_center),
        .layer1(z_L1),
        .layer2(z_L2),
        .layer3(z_L3),
        .layer4(z_L4),
        .layer5(z_L5),
        .layer6(z_L6),
        .layer7(z_L7),
        .layer8(z_L8)
    );

    Game_over_animation gom(
        .clk(clk),        
        .rst(finish),
        .A_score(A_score),
        .B_score(B_score),
        .layer1(g_L1),
        .layer2(g_L2),
        .layer3(g_L3),
        .layer4(g_L4),
        .layer5(g_L5),
        .layer6(g_L6),
        .layer7(g_L7),
        .layer8(g_L8)
    );

   always@(*) begin
       if(sw0==1'b1) begin
            layer_1 = t_L1;
            layer_2 = t_L2;
            layer_3 = t_L3;
            layer_4 = t_L4;
            layer_5 = t_L5;
            layer_6 = t_L6;
            layer_7 = t_L7;
            layer_8 = t_L8;
       end
       else begin
           if(sw1==1'b1) begin
                layer_1 = z_L1;
                layer_2 = z_L2;
                layer_3 = z_L3;
                layer_4 = z_L4;
                layer_5 = z_L5;
                layer_6 = z_L6;
                layer_7 = z_L7;
                layer_8 = z_L8;
           end
           else begin
                if(sw2==1'b1) begin
                    layer_1 = 64'b11111111_10000001_10000001_10000001_10000001_10000001_10000001_11111111;
                    layer_2 = 64'b10000001_00000000_00000000_00000000_00000000_00000000_00000000_10000001;
                    layer_3 = 64'b10000001_00000000_00000000_00000000_00000000_00000000_00000000_10000001;
                    layer_4 = 64'b10000001_00000000_00000000_00000000_00000000_00000000_00000000_10000001;
                    layer_5 = 64'b10000001_00000000_00000000_00000000_00000000_00000000_00000000_10000001;
                    layer_6 = 64'b10000001_00000000_00000000_00000000_00000000_00000000_00000000_10000001;
                    layer_7 = 64'b10000001_00000000_00000000_00000000_00000000_00000000_00000000_10000001;
                    layer_8 = 64'b11111111_10000001_10000001_10000001_10000001_10000001_10000001_11111111;
                end
               else begin
                    if(finish==1'b1) begin
                        layer_1 = g_L1;
                        layer_2 = g_L2;
                        layer_3 = g_L3;
                        layer_4 = g_L4;
                        layer_5 = g_L5;
                        layer_6 = g_L6;
                        layer_7 = g_L7;
                        layer_8 = g_L8;
                    end
                    else begin
                        layer_1 = L1;
                        layer_2 = L2;
                        layer_3 = L3;
                        layer_4 = L4;
                        layer_5 = L5;
                        layer_6 = L6;
                        layer_7 = L7;
                        layer_8 = L8; 
                    end
               end
           end
       end
   end 




    cube_scan cs
    (
        .clk_in(clk),
        .rst_n_in(onepulsed_center),
        .layer_1(layer_1),
        .layer_2(layer_2),
        .layer_3(layer_3),
        .layer_4(layer_4),
        .layer_5(layer_5),
        .layer_6(layer_6),
        .layer_7(layer_7),
        .layer_8(layer_8),

        .sclk_out(sclk_out),
        .rclk_out(rclk_out),
        .sdio_out(sdio_out)
    );

endmodule
////////////////////////////////////////////////