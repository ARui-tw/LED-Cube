`timescale 1ns / 1ps
// --------------------------------------------------------------------
// --------------------------------------------------------------------
// Module:cube_scan 
// 
// Author: george
// 
// Description: Display with LED cube
// 
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2021/01/11   |Initial ver
// --------------------------------------------------------------------
//
//
//
//==============================================================74HC595
// OE:output enabale // MR:reset
//
//     VCC   QA    SER   OE    RCLK  SRCLK SRCLR QH'    
//     Vin   0     DS    OE    ST    SH    MR  
//     16    15    14    13    12    11    10    9
//     ---------------------------------------------
//     | )                                         |
//     ---------------------------------------------
//     1     2     3     4     5     6     7     8
//     QB    QC    QD    QE    QF    QG    QH    GND
//========================================================================
//
//
module cube_scan
(
    input				    clk_in,			//系統clock
    input				    rst_n_in,		//系统reset，低位有效
    input		[64-1:0]	layer_1,	//單層LED第1排要顯示的數據
    input		[64-1:0]	layer_2,	//單層LED第2排要顯示的數據
    input		[64-1:0]	layer_3,	//單層LED第3排要顯示的數據
    input		[64-1:0]	layer_4,	//單層LED第4排要顯示的數據
    input		[64-1:0]	layer_5,	//單層LED第5排要顯示的數據
    input		[64-1:0]	layer_6,	//單層LED第6排要顯示的數據
    input		[64-1:0]	layer_7,	//單層LED第7排要顯示的數據
    input		[64-1:0]	layer_8,	//單層LED第8排要顯示的數據

    output	reg			    sclk_out,	//74HC595的SCK腳位 //活塞 (SHCP) (SH)     //SRCLK
    output	reg			    rclk_out,	//74HC595的RCK腳位 //大平台 (STCP) (ST)   //RCLK
    output	reg			    sdio_out	//74HC595的SER腳位 //資料 (DS)            //SER
);
 
    parameter CLK_DIV_PERIOD = 50; //分頻係數
    
    localparam	IDLE	=	3'd0;
    localparam	MAIN	=	3'd1;
    localparam	WRITE	=	3'd2;
    
    localparam	LOW		=	1'b0;
    localparam	HIGH	=	1'b1;

    //计数器对系统时钟信号进行计数
    reg[9:0] cnt=0;
    always@(posedge clk_in or negedge rst_n_in) begin
        if(rst_n_in) begin
            cnt <= 1'b0;
        end else begin
            if(cnt>=(CLK_DIV_PERIOD-1)) cnt <= 1'b0;
            else cnt <= cnt + 1'b1;
        end
    end
    
    //根据计数器计数的周期产生分频的脉冲信号
    reg clk_div; 
    always@(posedge clk_in or negedge rst_n_in) begin
        if(rst_n_in) begin
            clk_div <= 1'b0;
        end else begin
            if(cnt==(CLK_DIV_PERIOD-1)) clk_div <= 1'b1;
            else clk_div <= 1'b0;
        end
    end
    
    //使用finite state machine 完成LED的掃描和74HC595時序的實現
    reg		[71:0]		data_reg;
    reg     [4-1:0]       cnt_main;
    reg		[8-1:0]		cnt_write;
    reg		[2:0] 		state = IDLE;

    always@(posedge clk_in or negedge rst_n_in) begin
        if(rst_n_in) begin	//reset狀態下，各register給定初值
            state <= IDLE;
            cnt_main <= 4'd0;
            cnt_write <= 8'd0;
            sdio_out <= 1'b0;
            sclk_out <= LOW;
            rclk_out <= LOW;
        end else begin
            case(state)
                IDLE:begin	//IDLE作為第一個狀態，相當於軟復位  (soft reset)
                        state <= MAIN;
                        cnt_main <= 4'd0;
                        cnt_write <= 8'd0;
                        sdio_out <= 1'b0;
                        sclk_out <= LOW;
                        rclk_out <= LOW;
                    end
                MAIN:begin
                        if(cnt_main >= 4'd7) cnt_main <= 4'd0;
                        else cnt_main <= cnt_main + 1'b1;
                        case(cnt_main)
                            4'd0:begin
                                state <= WRITE;
                                data_reg <= {8'b10000000,
                                            layer_8
                                        };
                            end
                            4'd1:begin
                                state <= WRITE;
                                data_reg <= {8'b01000000,
                                            layer_7
                                        };
                            end
                            4'd2:begin
                                state <= WRITE;
                                data_reg <= {8'b00100000,
                                            layer_6
                                        };
                            end
                            4'd3:begin
                                state <= WRITE;
                                data_reg <= {8'b00010000,
                                            layer_5
                                        };
                            end
                            4'd4:begin
                                state <= WRITE;
                                data_reg <= {8'b00001000,
                                            layer_4
                                        };
                            end
                            4'd5:begin
                                state <= WRITE;
                                data_reg <= {8'b00000100,
                                            layer_3
                                        };
                            end
                            4'd6:begin
                                state <= WRITE;
                                data_reg <= {8'b00000010,
                                            layer_2
                                        };
                            end
                            4'd7:begin
                                state <= WRITE;
                                data_reg <= {8'b00000001,
                                            layer_1
                                        };
                            end
                            default: state <= IDLE;
                        endcase              
                    end
                WRITE:begin
                        if(clk_div) begin	//74HC595的串行時鐘有速度要求，需要按照分頻後的節拍
                            if(cnt_write >= 8'd145) cnt_write <= 1'b0;
                            else cnt_write <= cnt_write + 1'b1;
                            case(cnt_write)
                                //74HC595是串行轉並行的芯片，3路輸入可產生8路輸出，而且可以級聯使用
                                //74HC595的時序實現，參考74HC595的芯片手冊
                                8'd0:   begin sclk_out <= LOW; sdio_out <= data_reg[71]; end		//SCK下降沿時SER更新數據
                                8'd1:   begin sclk_out <= HIGH; end								//SCK上升沿時SER數據穩定 //推活塞
                                8'd2:   begin sclk_out <= LOW; sdio_out <= data_reg[70]; end
                                8'd3:   begin sclk_out <= HIGH; end
                                8'd4:   begin sclk_out <= LOW; sdio_out <= data_reg[69]; end
                                8'd5:   begin sclk_out <= HIGH; end
                                8'd6:   begin sclk_out <= LOW; sdio_out <= data_reg[68]; end
                                8'd7:   begin sclk_out <= HIGH; end
                                8'd8:   begin sclk_out <= LOW; sdio_out <= data_reg[67]; end
                                8'd9:   begin sclk_out <= HIGH; end
                                8'd10:  begin sclk_out <= LOW; sdio_out <= data_reg[66]; end
                                8'd11:  begin sclk_out <= HIGH; end
                                8'd12:  begin sclk_out <= LOW; sdio_out <= data_reg[65]; end
                                8'd13:  begin sclk_out <= HIGH; end
                                8'd14:  begin sclk_out <= LOW; sdio_out <= data_reg[64]; end
                                8'd15:  begin sclk_out <= HIGH; end
                                8'd16:  begin sclk_out <= LOW; sdio_out <= data_reg[63]; end
                                8'd17:  begin sclk_out <= HIGH; end
                                8'd18:  begin sclk_out <= LOW; sdio_out <= data_reg[62]; end
                                8'd19:  begin sclk_out <= HIGH; end
                                8'd20:  begin sclk_out <= LOW; sdio_out <= data_reg[61]; end
                                8'd21:  begin sclk_out <= HIGH; end
                                8'd22:  begin sclk_out <= LOW; sdio_out <= data_reg[60]; end
                                8'd23:  begin sclk_out <= HIGH; end
                                8'd24:  begin sclk_out <= LOW; sdio_out <= data_reg[59]; end
                                8'd25:  begin sclk_out <= HIGH; end
                                8'd26:  begin sclk_out <= LOW; sdio_out <= data_reg[58]; end
                                8'd27:  begin sclk_out <= HIGH; end
                                8'd28:  begin sclk_out <= LOW; sdio_out <= data_reg[57]; end
                                8'd29:  begin sclk_out <= HIGH; end
                                8'd30:  begin sclk_out <= LOW; sdio_out <= data_reg[56]; end
                                8'd31:  begin sclk_out <= HIGH; end
                                8'd32:  begin sclk_out <= LOW; sdio_out <= data_reg[55]; end
                                8'd33:  begin sclk_out <= HIGH; end
                                8'd34:  begin sclk_out <= LOW; sdio_out <= data_reg[54]; end
                                8'd35:  begin sclk_out <= HIGH; end
                                8'd36:  begin sclk_out <= LOW; sdio_out <= data_reg[53]; end
                                8'd37:  begin sclk_out <= HIGH; end
                                8'd38:  begin sclk_out <= LOW; sdio_out <= data_reg[52]; end
                                8'd39:  begin sclk_out <= HIGH; end
                                8'd40:  begin sclk_out <= LOW; sdio_out <= data_reg[51]; end
                                8'd41:  begin sclk_out <= HIGH; end
                                8'd42:  begin sclk_out <= LOW; sdio_out <= data_reg[50]; end
                                8'd43:  begin sclk_out <= HIGH; end
                                8'd44:  begin sclk_out <= LOW; sdio_out <= data_reg[49]; end
                                8'd45:  begin sclk_out <= HIGH; end
                                8'd46:  begin sclk_out <= LOW; sdio_out <= data_reg[48]; end
                                8'd47:  begin sclk_out <= HIGH; end
                                8'd48:  begin sclk_out <= LOW; sdio_out <= data_reg[47]; end
                                8'd49:  begin sclk_out <= HIGH; end
                                8'd50:  begin sclk_out <= LOW; sdio_out <= data_reg[46]; end
                                8'd51:  begin sclk_out <= HIGH; end
                                8'd52:  begin sclk_out <= LOW; sdio_out <= data_reg[45]; end
                                8'd53:  begin sclk_out <= HIGH; end
                                8'd54:  begin sclk_out <= LOW; sdio_out <= data_reg[44]; end
                                8'd55:  begin sclk_out <= HIGH; end
                                8'd56:  begin sclk_out <= LOW; sdio_out <= data_reg[43]; end
                                8'd57:  begin sclk_out <= HIGH; end
                                8'd58:  begin sclk_out <= LOW; sdio_out <= data_reg[42]; end
                                8'd59:  begin sclk_out <= HIGH; end
                                8'd60:  begin sclk_out <= LOW; sdio_out <= data_reg[41]; end
                                8'd61:  begin sclk_out <= HIGH; end
                                8'd62:  begin sclk_out <= LOW; sdio_out <= data_reg[40]; end
                                8'd63:  begin sclk_out <= HIGH; end
                                8'd64:  begin sclk_out <= LOW; sdio_out <= data_reg[39]; end
                                8'd65:  begin sclk_out <= HIGH; end
                                8'd66:  begin sclk_out <= LOW; sdio_out <= data_reg[38]; end
                                8'd67:  begin sclk_out <= HIGH; end
                                8'd68:  begin sclk_out <= LOW; sdio_out <= data_reg[37]; end
                                8'd69:  begin sclk_out <= HIGH; end
                                8'd70:  begin sclk_out <= LOW; sdio_out <= data_reg[36]; end
                                8'd71:  begin sclk_out <= HIGH; end
                                8'd72:  begin sclk_out <= LOW; sdio_out <= data_reg[35]; end
                                8'd73:  begin sclk_out <= HIGH; end
                                8'd74:  begin sclk_out <= LOW; sdio_out <= data_reg[34]; end
                                8'd75:  begin sclk_out <= HIGH; end
                                8'd76:  begin sclk_out <= LOW; sdio_out <= data_reg[33]; end
                                8'd77:  begin sclk_out <= HIGH; end
                                8'd78:  begin sclk_out <= LOW; sdio_out <= data_reg[32]; end
                                8'd79:  begin sclk_out <= HIGH; end
                                8'd80:  begin sclk_out <= LOW; sdio_out <= data_reg[31]; end
                                8'd81:  begin sclk_out <= HIGH; end
                                8'd82:  begin sclk_out <= LOW; sdio_out <= data_reg[30]; end
                                8'd83:  begin sclk_out <= HIGH; end
                                8'd84:  begin sclk_out <= LOW; sdio_out <= data_reg[29]; end
                                8'd85:  begin sclk_out <= HIGH; end
                                8'd86:  begin sclk_out <= LOW; sdio_out <= data_reg[28]; end
                                8'd87:  begin sclk_out <= HIGH; end
                                8'd88:  begin sclk_out <= LOW; sdio_out <= data_reg[27]; end
                                8'd89:  begin sclk_out <= HIGH; end
                                8'd90:  begin sclk_out <= LOW; sdio_out <= data_reg[26]; end
                                8'd91:  begin sclk_out <= HIGH; end
                                8'd92:  begin sclk_out <= LOW; sdio_out <= data_reg[25]; end
                                8'd93:  begin sclk_out <= HIGH; end
                                8'd94:  begin sclk_out <= LOW; sdio_out <= data_reg[24]; end
                                8'd95:  begin sclk_out <= HIGH; end
                                8'd96:  begin sclk_out <= LOW; sdio_out <= data_reg[23]; end
                                8'd97:  begin sclk_out <= HIGH; end
                                8'd98:  begin sclk_out <= LOW; sdio_out <= data_reg[22]; end
                                8'd99:  begin sclk_out <= HIGH; end
                                8'd100: begin sclk_out <= LOW; sdio_out <= data_reg[21]; end
                                8'd101: begin sclk_out <= HIGH; end
                                8'd102: begin sclk_out <= LOW; sdio_out <= data_reg[20]; end
                                8'd103: begin sclk_out <= HIGH; end
                                8'd104: begin sclk_out <= LOW; sdio_out <= data_reg[19]; end
                                8'd105: begin sclk_out <= HIGH; end
                                8'd106: begin sclk_out <= LOW; sdio_out <= data_reg[18]; end
                                8'd107: begin sclk_out <= HIGH; end
                                8'd108: begin sclk_out <= LOW; sdio_out <= data_reg[17]; end
                                8'd109: begin sclk_out <= HIGH; end
                                8'd110: begin sclk_out <= LOW; sdio_out <= data_reg[16]; end
                                8'd111: begin sclk_out <= HIGH; end
                                8'd112: begin sclk_out <= LOW; sdio_out <= data_reg[15]; end
                                8'd113: begin sclk_out <= HIGH; end
                                8'd114: begin sclk_out <= LOW; sdio_out <= data_reg[14]; end
                                8'd115: begin sclk_out <= HIGH; end
                                8'd116: begin sclk_out <= LOW; sdio_out <= data_reg[13]; end
                                8'd117: begin sclk_out <= HIGH; end
                                8'd118: begin sclk_out <= LOW; sdio_out <= data_reg[12]; end
                                8'd119: begin sclk_out <= HIGH; end
                                8'd120: begin sclk_out <= LOW; sdio_out <= data_reg[11]; end
                                8'd121: begin sclk_out <= HIGH; end
                                8'd122: begin sclk_out <= LOW; sdio_out <= data_reg[10]; end
                                8'd123: begin sclk_out <= HIGH; end
                                8'd124: begin sclk_out <= LOW; sdio_out <= data_reg[9]; end
                                8'd125: begin sclk_out <= HIGH; end
                                8'd126: begin sclk_out <= LOW; sdio_out <= data_reg[8]; end
                                8'd127: begin sclk_out <= HIGH; end
                                8'd128: begin sclk_out <= LOW; sdio_out <= data_reg[7]; end
                                8'd129: begin sclk_out <= HIGH; end
                                8'd130: begin sclk_out <= LOW; sdio_out <= data_reg[6]; end
                                8'd131: begin sclk_out <= HIGH; end
                                8'd132: begin sclk_out <= LOW; sdio_out <= data_reg[5]; end
                                8'd133: begin sclk_out <= HIGH; end
                                8'd134: begin sclk_out <= LOW; sdio_out <= data_reg[4]; end
                                8'd135: begin sclk_out <= HIGH; end
                                8'd136: begin sclk_out <= LOW; sdio_out <= data_reg[3]; end
                                8'd137: begin sclk_out <= HIGH; end
                                8'd138: begin sclk_out <= LOW; sdio_out <= data_reg[2]; end
                                8'd139: begin sclk_out <= HIGH; end
                                8'd140: begin sclk_out <= LOW; sdio_out <= data_reg[1]; end
                                8'd141: begin sclk_out <= HIGH; end
                                8'd142: begin sclk_out <= LOW; sdio_out <= data_reg[0]; end
                                8'd143: begin sclk_out <= HIGH; end
                                8'd144: begin rclk_out <= HIGH; end	  //當72位數據傳送完成後RCK拉高，輸出生效 
                                8'd145: begin rclk_out <= LOW; state <= MAIN; end
                                default: state <= IDLE;
                            endcase
                        end else begin
                            sclk_out <= sclk_out;
                            sdio_out <= sdio_out;
                            rclk_out <= rclk_out;
                            cnt_write <= cnt_write;
                            state <= state;
                        end
                    end
                default: state <= IDLE;
            endcase
        end
    end
 
endmodule