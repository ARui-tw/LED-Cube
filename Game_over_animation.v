module Game_over_animation (
    input clk,
    input rst,
    input [4-1:0] A_score,
    input [4-1:0] B_score,
    output reg [63:0] layer1,
    output reg [63:0] layer2,
    output reg [63:0] layer3,
    output reg [63:0] layer4,
    output reg [63:0] layer5,
    output reg [63:0] layer6,
    output reg [63:0] layer7,
    output reg [63:0] layer8
);

    reg cube[7:0][7:0][7:0]; // x y z

    reg [2:0] Text_pos_x;
    reg [2:0] next_Text_pos_x;
    reg Text_yz[8-1:0][8-1:0]; 
    reg [23-1:0] count;

    reg [4-1:0] Text_num;
    reg [4-1:0] next_Text_num;

    always @ (posedge clk, posedge rst) begin
		if (rst) begin
            Text_num <= 4'd0;
            Text_pos_x <= 3'd0;
            count <= 23'b0;
            layer1 <= 64'b0;
            layer2 <= 64'b0;
            layer3 <= 64'b0;
            layer4 <= 64'b0;
            layer5 <= 64'b0;
            layer6 <= 64'b0;
            layer7 <= 64'b0;
            layer8 <= 64'b0;
            cube[0][0][0] <= 1'b0; cube[1][0][0] <= 1'b0; cube[2][0][0] <= 1'b0; cube[3][0][0] <= 1'b0; cube[4][0][0] <= 1'b0; cube[5][0][0] <= 1'b0; cube[6][0][0] <= 1'b0; cube[7][0][0] <= 1'b0; 
            cube[0][1][0] <= 1'b0; cube[1][1][0] <= 1'b0; cube[2][1][0] <= 1'b0; cube[3][1][0] <= 1'b0; cube[4][1][0] <= 1'b0; cube[5][1][0] <= 1'b0; cube[6][1][0] <= 1'b0; cube[7][1][0] <= 1'b0; 
            cube[0][2][0] <= 1'b0; cube[1][2][0] <= 1'b0; cube[2][2][0] <= 1'b0; cube[3][2][0] <= 1'b0; cube[4][2][0] <= 1'b0; cube[5][2][0] <= 1'b0; cube[6][2][0] <= 1'b0; cube[7][2][0] <= 1'b0; 
            cube[0][3][0] <= 1'b0; cube[1][3][0] <= 1'b0; cube[2][3][0] <= 1'b0; cube[3][3][0] <= 1'b0; cube[4][3][0] <= 1'b0; cube[5][3][0] <= 1'b0; cube[6][3][0] <= 1'b0; cube[7][3][0] <= 1'b0;
            cube[0][4][0] <= 1'b0; cube[1][4][0] <= 1'b0; cube[2][4][0] <= 1'b0; cube[3][4][0] <= 1'b0; cube[4][4][0] <= 1'b0; cube[5][4][0] <= 1'b0; cube[6][4][0] <= 1'b0; cube[7][4][0] <= 1'b0; 
            cube[0][5][0] <= 1'b0; cube[1][5][0] <= 1'b0; cube[2][5][0] <= 1'b0; cube[3][5][0] <= 1'b0; cube[4][5][0] <= 1'b0; cube[5][5][0] <= 1'b0; cube[6][5][0] <= 1'b0; cube[7][5][0] <= 1'b0; 
            cube[0][6][0] <= 1'b0; cube[1][6][0] <= 1'b0; cube[2][6][0] <= 1'b0; cube[3][6][0] <= 1'b0; cube[4][6][0] <= 1'b0; cube[5][6][0] <= 1'b0; cube[6][6][0] <= 1'b0; cube[7][6][0] <= 1'b0;
            cube[0][7][0] <= 1'b0; cube[1][7][0] <= 1'b0; cube[2][7][0] <= 1'b0; cube[3][7][0] <= 1'b0; cube[4][7][0] <= 1'b0; cube[5][7][0] <= 1'b0; cube[6][7][0] <= 1'b0; cube[7][7][0] <= 1'b0; 
            cube[0][0][1] <= 1'b0; cube[1][0][1] <= 1'b0; cube[2][0][1] <= 1'b0; cube[3][0][1] <= 1'b0; cube[4][0][1] <= 1'b0; cube[5][0][1] <= 1'b0; cube[6][0][1] <= 1'b0; cube[7][0][1] <= 1'b0; 
            cube[0][1][1] <= 1'b0; cube[1][1][1] <= 1'b0; cube[2][1][1] <= 1'b0; cube[3][1][1] <= 1'b0; cube[4][1][1] <= 1'b0; cube[5][1][1] <= 1'b0; cube[6][1][1] <= 1'b0; cube[7][1][1] <= 1'b0;
            cube[0][2][1] <= 1'b0; cube[1][2][1] <= 1'b0; cube[2][2][1] <= 1'b0; cube[3][2][1] <= 1'b0; cube[4][2][1] <= 1'b0; cube[5][2][1] <= 1'b0; cube[6][2][1] <= 1'b0; cube[7][2][1] <= 1'b0; 
            cube[0][3][1] <= 1'b0; cube[1][3][1] <= 1'b0; cube[2][3][1] <= 1'b0; cube[3][3][1] <= 1'b0; cube[4][3][1] <= 1'b0; cube[5][3][1] <= 1'b0; cube[6][3][1] <= 1'b0; cube[7][3][1] <= 1'b0; 
            cube[0][4][1] <= 1'b0; cube[1][4][1] <= 1'b0; cube[2][4][1] <= 1'b0; cube[3][4][1] <= 1'b0; cube[4][4][1] <= 1'b0; cube[5][4][1] <= 1'b0; cube[6][4][1] <= 1'b0; cube[7][4][1] <= 1'b0;
            cube[0][5][1] <= 1'b0; cube[1][5][1] <= 1'b0; cube[2][5][1] <= 1'b0; cube[3][5][1] <= 1'b0; cube[4][5][1] <= 1'b0; cube[5][5][1] <= 1'b0; cube[6][5][1] <= 1'b0; cube[7][5][1] <= 1'b0; 
            cube[0][6][1] <= 1'b0; cube[1][6][1] <= 1'b0; cube[2][6][1] <= 1'b0; cube[3][6][1] <= 1'b0; cube[4][6][1] <= 1'b0; cube[5][6][1] <= 1'b0; cube[6][6][1] <= 1'b0; cube[7][6][1] <= 1'b0; 
            cube[0][7][1] <= 1'b0; cube[1][7][1] <= 1'b0; cube[2][7][1] <= 1'b0; cube[3][7][1] <= 1'b0; cube[4][7][1] <= 1'b0; cube[5][7][1] <= 1'b0; cube[6][7][1] <= 1'b0; cube[7][7][1] <= 1'b0; 
            cube[0][0][2] <= 1'b0; cube[1][0][2] <= 1'b0; cube[2][0][2] <= 1'b0; cube[3][0][2] <= 1'b0; cube[4][0][2] <= 1'b0; cube[5][0][2] <= 1'b0; cube[6][0][2] <= 1'b0; cube[7][0][2] <= 1'b0; 
            cube[0][1][2] <= 1'b0; cube[1][1][2] <= 1'b0; cube[2][1][2] <= 1'b0; cube[3][1][2] <= 1'b0; cube[4][1][2] <= 1'b0; cube[5][1][2] <= 1'b0; cube[6][1][2] <= 1'b0; cube[7][1][2] <= 1'b0; 
            cube[0][2][2] <= 1'b0; cube[1][2][2] <= 1'b0; cube[2][2][2] <= 1'b0; cube[3][2][2] <= 1'b0; cube[4][2][2] <= 1'b0; cube[5][2][2] <= 1'b0; cube[6][2][2] <= 1'b0; cube[7][2][2] <= 1'b0; 
            cube[0][3][2] <= 1'b0; cube[1][3][2] <= 1'b0; cube[2][3][2] <= 1'b0; cube[3][3][2] <= 1'b0; cube[4][3][2] <= 1'b0; cube[5][3][2] <= 1'b0; cube[6][3][2] <= 1'b0; cube[7][3][2] <= 1'b0; 
            cube[0][4][2] <= 1'b0; cube[1][4][2] <= 1'b0; cube[2][4][2] <= 1'b0; cube[3][4][2] <= 1'b0; cube[4][4][2] <= 1'b0; cube[5][4][2] <= 1'b0; cube[6][4][2] <= 1'b0; cube[7][4][2] <= 1'b0; 
            cube[0][5][2] <= 1'b0; cube[1][5][2] <= 1'b0; cube[2][5][2] <= 1'b0; cube[3][5][2] <= 1'b0; cube[4][5][2] <= 1'b0; cube[5][5][2] <= 1'b0; cube[6][5][2] <= 1'b0; cube[7][5][2] <= 1'b0; 
            cube[0][6][2] <= 1'b0; cube[1][6][2] <= 1'b0; cube[2][6][2] <= 1'b0; cube[3][6][2] <= 1'b0; cube[4][6][2] <= 1'b0; cube[5][6][2] <= 1'b0; cube[6][6][2] <= 1'b0; cube[7][6][2] <= 1'b0;
            cube[0][7][2] <= 1'b0; cube[1][7][2] <= 1'b0; cube[2][7][2] <= 1'b0; cube[3][7][2] <= 1'b0; cube[4][7][2] <= 1'b0; cube[5][7][2] <= 1'b0; cube[6][7][2] <= 1'b0; cube[7][7][2] <= 1'b0; 
            cube[0][0][3] <= 1'b0; cube[1][0][3] <= 1'b0; cube[2][0][3] <= 1'b0; cube[3][0][3] <= 1'b0; cube[4][0][3] <= 1'b0; cube[5][0][3] <= 1'b0; cube[6][0][3] <= 1'b0; cube[7][0][3] <= 1'b0;
            cube[0][1][3] <= 1'b0; cube[1][1][3] <= 1'b0; cube[2][1][3] <= 1'b0; cube[3][1][3] <= 1'b0; cube[4][1][3] <= 1'b0; cube[5][1][3] <= 1'b0; cube[6][1][3] <= 1'b0; cube[7][1][3] <= 1'b0; 
            cube[0][2][3] <= 1'b0; cube[1][2][3] <= 1'b0; cube[2][2][3] <= 1'b0; cube[3][2][3] <= 1'b0; cube[4][2][3] <= 1'b0; cube[5][2][3] <= 1'b0; cube[6][2][3] <= 1'b0; cube[7][2][3] <= 1'b0; 
            cube[0][3][3] <= 1'b0; cube[1][3][3] <= 1'b0; cube[2][3][3] <= 1'b0; cube[3][3][3] <= 1'b0; cube[4][3][3] <= 1'b0; cube[5][3][3] <= 1'b0; cube[6][3][3] <= 1'b0; cube[7][3][3] <= 1'b0; 
            cube[0][4][3] <= 1'b0; cube[1][4][3] <= 1'b0; cube[2][4][3] <= 1'b0; cube[3][4][3] <= 1'b0; cube[4][4][3] <= 1'b0; cube[5][4][3] <= 1'b0; cube[6][4][3] <= 1'b0; cube[7][4][3] <= 1'b0; 
            cube[0][5][3] <= 1'b0; cube[1][5][3] <= 1'b0; cube[2][5][3] <= 1'b0; cube[3][5][3] <= 1'b0; cube[4][5][3] <= 1'b0; cube[5][5][3] <= 1'b0; cube[6][5][3] <= 1'b0; cube[7][5][3] <= 1'b0; 
            cube[0][6][3] <= 1'b0; cube[1][6][3] <= 1'b0; cube[2][6][3] <= 1'b0; cube[3][6][3] <= 1'b0; cube[4][6][3] <= 1'b0; cube[5][6][3] <= 1'b0; cube[6][6][3] <= 1'b0; cube[7][6][3] <= 1'b0;
            cube[0][7][3] <= 1'b0; cube[1][7][3] <= 1'b0; cube[2][7][3] <= 1'b0; cube[3][7][3] <= 1'b0; cube[4][7][3] <= 1'b0; cube[5][7][3] <= 1'b0; cube[6][7][3] <= 1'b0; cube[7][7][3] <= 1'b0; 
            cube[0][0][4] <= 1'b0; cube[1][0][4] <= 1'b0; cube[2][0][4] <= 1'b0; cube[3][0][4] <= 1'b0; cube[4][0][4] <= 1'b0; cube[5][0][4] <= 1'b0; cube[6][0][4] <= 1'b0; cube[7][0][4] <= 1'b0; 
            cube[0][1][4] <= 1'b0; cube[1][1][4] <= 1'b0; cube[2][1][4] <= 1'b0; cube[3][1][4] <= 1'b0; cube[4][1][4] <= 1'b0; cube[5][1][4] <= 1'b0; cube[6][1][4] <= 1'b0; cube[7][1][4] <= 1'b0; 
            cube[0][2][4] <= 1'b0; cube[1][2][4] <= 1'b0; cube[2][2][4] <= 1'b0; cube[3][2][4] <= 1'b0; cube[4][2][4] <= 1'b0; cube[5][2][4] <= 1'b0; cube[6][2][4] <= 1'b0; cube[7][2][4] <= 1'b0;
            cube[0][3][4] <= 1'b0; cube[1][3][4] <= 1'b0; cube[2][3][4] <= 1'b0; cube[3][3][4] <= 1'b0; cube[4][3][4] <= 1'b0; cube[5][3][4] <= 1'b0; cube[6][3][4] <= 1'b0; cube[7][3][4] <= 1'b0; 
            cube[0][4][4] <= 1'b0; cube[1][4][4] <= 1'b0; cube[2][4][4] <= 1'b0; cube[3][4][4] <= 1'b0; cube[4][4][4] <= 1'b0; cube[5][4][4] <= 1'b0; cube[6][4][4] <= 1'b0; cube[7][4][4] <= 1'b0; 
            cube[0][5][4] <= 1'b0; cube[1][5][4] <= 1'b0; cube[2][5][4] <= 1'b0; cube[3][5][4] <= 1'b0; cube[4][5][4] <= 1'b0; cube[5][5][4] <= 1'b0; cube[6][5][4] <= 1'b0; cube[7][5][4] <= 1'b0; 
            cube[0][6][4] <= 1'b0; cube[1][6][4] <= 1'b0; cube[2][6][4] <= 1'b0; cube[3][6][4] <= 1'b0; cube[4][6][4] <= 1'b0; cube[5][6][4] <= 1'b0; cube[6][6][4] <= 1'b0; cube[7][6][4] <= 1'b0; 
            cube[0][7][4] <= 1'b0; cube[1][7][4] <= 1'b0; cube[2][7][4] <= 1'b0; cube[3][7][4] <= 1'b0; cube[4][7][4] <= 1'b0; cube[5][7][4] <= 1'b0; cube[6][7][4] <= 1'b0; cube[7][7][4] <= 1'b0; 
            cube[0][0][5] <= 1'b0; cube[1][0][5] <= 1'b0; cube[2][0][5] <= 1'b0; cube[3][0][5] <= 1'b0; cube[4][0][5] <= 1'b0; cube[5][0][5] <= 1'b0; cube[6][0][5] <= 1'b0; cube[7][0][5] <= 1'b0; 
            cube[0][1][5] <= 1'b0; cube[1][1][5] <= 1'b0; cube[2][1][5] <= 1'b0; cube[3][1][5] <= 1'b0; cube[4][1][5] <= 1'b0; cube[5][1][5] <= 1'b0; cube[6][1][5] <= 1'b0; cube[7][1][5] <= 1'b0;
            cube[0][2][5] <= 1'b0; cube[1][2][5] <= 1'b0; cube[2][2][5] <= 1'b0; cube[3][2][5] <= 1'b0; cube[4][2][5] <= 1'b0; cube[5][2][5] <= 1'b0; cube[6][2][5] <= 1'b0; cube[7][2][5] <= 1'b0; 
            cube[0][3][5] <= 1'b0; cube[1][3][5] <= 1'b0; cube[2][3][5] <= 1'b0; cube[3][3][5] <= 1'b0; cube[4][3][5] <= 1'b0; cube[5][3][5] <= 1'b0; cube[6][3][5] <= 1'b0; cube[7][3][5] <= 1'b0; 
            cube[0][4][5] <= 1'b0; cube[1][4][5] <= 1'b0; cube[2][4][5] <= 1'b0; cube[3][4][5] <= 1'b0; cube[4][4][5] <= 1'b0; cube[5][4][5] <= 1'b0; cube[6][4][5] <= 1'b0; cube[7][4][5] <= 1'b0; 
            cube[0][5][5] <= 1'b0; cube[1][5][5] <= 1'b0; cube[2][5][5] <= 1'b0; cube[3][5][5] <= 1'b0; cube[4][5][5] <= 1'b0; cube[5][5][5] <= 1'b0; cube[6][5][5] <= 1'b0; cube[7][5][5] <= 1'b0; 
            cube[0][6][5] <= 1'b0; cube[1][6][5] <= 1'b0; cube[2][6][5] <= 1'b0; cube[3][6][5] <= 1'b0; cube[4][6][5] <= 1'b0; cube[5][6][5] <= 1'b0; cube[6][6][5] <= 1'b0; cube[7][6][5] <= 1'b0; 
            cube[0][7][5] <= 1'b0; cube[1][7][5] <= 1'b0; cube[2][7][5] <= 1'b0; cube[3][7][5] <= 1'b0; cube[4][7][5] <= 1'b0; cube[5][7][5] <= 1'b0; cube[6][7][5] <= 1'b0; cube[7][7][5] <= 1'b0;
            cube[0][0][6] <= 1'b0; cube[1][0][6] <= 1'b0; cube[2][0][6] <= 1'b0; cube[3][0][6] <= 1'b0; cube[4][0][6] <= 1'b0; cube[5][0][6] <= 1'b0; cube[6][0][6] <= 1'b0; cube[7][0][6] <= 1'b0; 
            cube[0][1][6] <= 1'b0; cube[1][1][6] <= 1'b0; cube[2][1][6] <= 1'b0; cube[3][1][6] <= 1'b0; cube[4][1][6] <= 1'b0; cube[5][1][6] <= 1'b0; cube[6][1][6] <= 1'b0; cube[7][1][6] <= 1'b0; 
            cube[0][2][6] <= 1'b0; cube[1][2][6] <= 1'b0; cube[2][2][6] <= 1'b0; cube[3][2][6] <= 1'b0; cube[4][2][6] <= 1'b0; cube[5][2][6] <= 1'b0; cube[6][2][6] <= 1'b0; cube[7][2][6] <= 1'b0;
            cube[0][3][6] <= 1'b0; cube[1][3][6] <= 1'b0; cube[2][3][6] <= 1'b0; cube[3][3][6] <= 1'b0; cube[4][3][6] <= 1'b0; cube[5][3][6] <= 1'b0; cube[6][3][6] <= 1'b0; cube[7][3][6] <= 1'b0; 
            cube[0][4][6] <= 1'b0; cube[1][4][6] <= 1'b0; cube[2][4][6] <= 1'b0; cube[3][4][6] <= 1'b0; cube[4][4][6] <= 1'b0; cube[5][4][6] <= 1'b0; cube[6][4][6] <= 1'b0; cube[7][4][6] <= 1'b0; 
            cube[0][5][6] <= 1'b0; cube[1][5][6] <= 1'b0; cube[2][5][6] <= 1'b0; cube[3][5][6] <= 1'b0; cube[4][5][6] <= 1'b0; cube[5][5][6] <= 1'b0; cube[6][5][6] <= 1'b0; cube[7][5][6] <= 1'b0; 
            cube[0][6][6] <= 1'b0; cube[1][6][6] <= 1'b0; cube[2][6][6] <= 1'b0; cube[3][6][6] <= 1'b0; cube[4][6][6] <= 1'b0; cube[5][6][6] <= 1'b0; cube[6][6][6] <= 1'b0; cube[7][6][6] <= 1'b0; 
            cube[0][7][6] <= 1'b0; cube[1][7][6] <= 1'b0; cube[2][7][6] <= 1'b0; cube[3][7][6] <= 1'b0; cube[4][7][6] <= 1'b0; cube[5][7][6] <= 1'b0; cube[6][7][6] <= 1'b0; cube[7][7][6] <= 1'b0;
            cube[0][0][7] <= 1'b0; cube[1][0][7] <= 1'b0; cube[2][0][7] <= 1'b0; cube[3][0][7] <= 1'b0; cube[4][0][7] <= 1'b0; cube[5][0][7] <= 1'b0; cube[6][0][7] <= 1'b0; cube[7][0][7] <= 1'b0;
            cube[0][1][7] <= 1'b0; cube[1][1][7] <= 1'b0; cube[2][1][7] <= 1'b0; cube[3][1][7] <= 1'b0; cube[4][1][7] <= 1'b0; cube[5][1][7] <= 1'b0; cube[6][1][7] <= 1'b0; cube[7][1][7] <= 1'b0;
            cube[0][2][7] <= 1'b0; cube[1][2][7] <= 1'b0; cube[2][2][7] <= 1'b0; cube[3][2][7] <= 1'b0; cube[4][2][7] <= 1'b0; cube[5][2][7] <= 1'b0; cube[6][2][7] <= 1'b0; cube[7][2][7] <= 1'b0;
            cube[0][3][7] <= 1'b0; cube[1][3][7] <= 1'b0; cube[2][3][7] <= 1'b0; cube[3][3][7] <= 1'b0; cube[4][3][7] <= 1'b0; cube[5][3][7] <= 1'b0; cube[6][3][7] <= 1'b0; cube[7][3][7] <= 1'b0;
            cube[0][4][7] <= 1'b0; cube[1][4][7] <= 1'b0; cube[2][4][7] <= 1'b0; cube[3][4][7] <= 1'b0; cube[4][4][7] <= 1'b0; cube[5][4][7] <= 1'b0; cube[6][4][7] <= 1'b0; cube[7][4][7] <= 1'b0;
            cube[0][5][7] <= 1'b0; cube[1][5][7] <= 1'b0; cube[2][5][7] <= 1'b0; cube[3][5][7] <= 1'b0; cube[4][5][7] <= 1'b0; cube[5][5][7] <= 1'b0; cube[6][5][7] <= 1'b0; cube[7][5][7] <= 1'b0;
            cube[0][6][7] <= 1'b0; cube[1][6][7] <= 1'b0; cube[2][6][7] <= 1'b0; cube[3][6][7] <= 1'b0; cube[4][6][7] <= 1'b0; cube[5][6][7] <= 1'b0; cube[6][6][7] <= 1'b0; cube[7][6][7] <= 1'b0;
            cube[0][7][7] <= 1'b0; cube[1][7][7] <= 1'b0; cube[2][7][7] <= 1'b0; cube[3][7][7] <= 1'b0; cube[4][7][7] <= 1'b0; cube[5][7][7] <= 1'b0; cube[6][7][7] <= 1'b0; cube[7][7][7] <= 1'b0;
		end else begin

            Text_pos_x <= next_Text_pos_x;
            
            Text_num <= next_Text_num;

            count <= count + 1;

            cube[Text_pos_x][0][0] <= Text_yz[0][0]; cube[Text_pos_x][1][0] <= Text_yz[1][0]; cube[Text_pos_x][2][0] <= Text_yz[2][0]; cube[Text_pos_x][3][0] <= Text_yz[3][0]; cube[Text_pos_x][4][0] <= Text_yz[4][0]; cube[Text_pos_x][5][0] <= Text_yz[5][0]; cube[Text_pos_x][6][0] <= Text_yz[6][0]; cube[Text_pos_x][7][0] <= Text_yz[7][0];
            cube[Text_pos_x][0][1] <= Text_yz[0][1]; cube[Text_pos_x][1][1] <= Text_yz[1][1]; cube[Text_pos_x][2][1] <= Text_yz[2][1]; cube[Text_pos_x][3][1] <= Text_yz[3][1]; cube[Text_pos_x][4][1] <= Text_yz[4][1]; cube[Text_pos_x][5][1] <= Text_yz[5][1]; cube[Text_pos_x][6][1] <= Text_yz[6][1]; cube[Text_pos_x][7][1] <= Text_yz[7][1];
            cube[Text_pos_x][0][2] <= Text_yz[0][2]; cube[Text_pos_x][1][2] <= Text_yz[1][2]; cube[Text_pos_x][2][2] <= Text_yz[2][2]; cube[Text_pos_x][3][2] <= Text_yz[3][2]; cube[Text_pos_x][4][2] <= Text_yz[4][2]; cube[Text_pos_x][5][2] <= Text_yz[5][2]; cube[Text_pos_x][6][2] <= Text_yz[6][2]; cube[Text_pos_x][7][2] <= Text_yz[7][2];
            cube[Text_pos_x][0][3] <= Text_yz[0][3]; cube[Text_pos_x][1][3] <= Text_yz[1][3]; cube[Text_pos_x][2][3] <= Text_yz[2][3]; cube[Text_pos_x][3][3] <= Text_yz[3][3]; cube[Text_pos_x][4][3] <= Text_yz[4][3]; cube[Text_pos_x][5][3] <= Text_yz[5][3]; cube[Text_pos_x][6][3] <= Text_yz[6][3]; cube[Text_pos_x][7][3] <= Text_yz[7][3];
            cube[Text_pos_x][0][4] <= Text_yz[0][4]; cube[Text_pos_x][1][4] <= Text_yz[1][4]; cube[Text_pos_x][2][4] <= Text_yz[2][4]; cube[Text_pos_x][3][4] <= Text_yz[3][4]; cube[Text_pos_x][4][4] <= Text_yz[4][4]; cube[Text_pos_x][5][4] <= Text_yz[5][4]; cube[Text_pos_x][6][4] <= Text_yz[6][4]; cube[Text_pos_x][7][4] <= Text_yz[7][4];
            cube[Text_pos_x][0][5] <= Text_yz[0][5]; cube[Text_pos_x][1][5] <= Text_yz[1][5]; cube[Text_pos_x][2][5] <= Text_yz[2][5]; cube[Text_pos_x][3][5] <= Text_yz[3][5]; cube[Text_pos_x][4][5] <= Text_yz[4][5]; cube[Text_pos_x][5][5] <= Text_yz[5][5]; cube[Text_pos_x][6][5] <= Text_yz[6][5]; cube[Text_pos_x][7][5] <= Text_yz[7][5];
            cube[Text_pos_x][0][6] <= Text_yz[0][6]; cube[Text_pos_x][1][6] <= Text_yz[1][6]; cube[Text_pos_x][2][6] <= Text_yz[2][6]; cube[Text_pos_x][3][6] <= Text_yz[3][6]; cube[Text_pos_x][4][6] <= Text_yz[4][6]; cube[Text_pos_x][5][6] <= Text_yz[5][6]; cube[Text_pos_x][6][6] <= Text_yz[6][6]; cube[Text_pos_x][7][6] <= Text_yz[7][6];
            cube[Text_pos_x][0][7] <= Text_yz[0][7]; cube[Text_pos_x][1][7] <= Text_yz[1][7]; cube[Text_pos_x][2][7] <= Text_yz[2][7]; cube[Text_pos_x][3][7] <= Text_yz[3][7]; cube[Text_pos_x][4][7] <= Text_yz[4][7]; cube[Text_pos_x][5][7] <= Text_yz[5][7]; cube[Text_pos_x][6][7] <= Text_yz[6][7]; cube[Text_pos_x][7][7] <= Text_yz[7][7];

            cube[Text_pos_x-1'b1][0][0] <= 1'b0; cube[Text_pos_x-1'b1][1][0] <= 1'b0; cube[Text_pos_x-1'b1][2][0] <= 1'b0; cube[Text_pos_x-1'b1][3][0] <= 1'b0; cube[Text_pos_x-1'b1][4][0] <= 1'b0; cube[Text_pos_x-1'b1][5][0] <= 1'b0; cube[Text_pos_x-1'b1][6][0] <= 1'b0; cube[Text_pos_x-1'b1][7][0] <= 1'b0;
            cube[Text_pos_x-1'b1][0][1] <= 1'b0; cube[Text_pos_x-1'b1][1][1] <= 1'b0; cube[Text_pos_x-1'b1][2][1] <= 1'b0; cube[Text_pos_x-1'b1][3][1] <= 1'b0; cube[Text_pos_x-1'b1][4][1] <= 1'b0; cube[Text_pos_x-1'b1][5][1] <= 1'b0; cube[Text_pos_x-1'b1][6][1] <= 1'b0; cube[Text_pos_x-1'b1][7][1] <= 1'b0;
            cube[Text_pos_x-1'b1][0][2] <= 1'b0; cube[Text_pos_x-1'b1][1][2] <= 1'b0; cube[Text_pos_x-1'b1][2][2] <= 1'b0; cube[Text_pos_x-1'b1][3][2] <= 1'b0; cube[Text_pos_x-1'b1][4][2] <= 1'b0; cube[Text_pos_x-1'b1][5][2] <= 1'b0; cube[Text_pos_x-1'b1][6][2] <= 1'b0; cube[Text_pos_x-1'b1][7][2] <= 1'b0;
            cube[Text_pos_x-1'b1][0][3] <= 1'b0; cube[Text_pos_x-1'b1][1][3] <= 1'b0; cube[Text_pos_x-1'b1][2][3] <= 1'b0; cube[Text_pos_x-1'b1][3][3] <= 1'b0; cube[Text_pos_x-1'b1][4][3] <= 1'b0; cube[Text_pos_x-1'b1][5][3] <= 1'b0; cube[Text_pos_x-1'b1][6][3] <= 1'b0; cube[Text_pos_x-1'b1][7][3] <= 1'b0;
            cube[Text_pos_x-1'b1][0][4] <= 1'b0; cube[Text_pos_x-1'b1][1][4] <= 1'b0; cube[Text_pos_x-1'b1][2][4] <= 1'b0; cube[Text_pos_x-1'b1][3][4] <= 1'b0; cube[Text_pos_x-1'b1][4][4] <= 1'b0; cube[Text_pos_x-1'b1][5][4] <= 1'b0; cube[Text_pos_x-1'b1][6][4] <= 1'b0; cube[Text_pos_x-1'b1][7][4] <= 1'b0;
            cube[Text_pos_x-1'b1][0][5] <= 1'b0; cube[Text_pos_x-1'b1][1][5] <= 1'b0; cube[Text_pos_x-1'b1][2][5] <= 1'b0; cube[Text_pos_x-1'b1][3][5] <= 1'b0; cube[Text_pos_x-1'b1][4][5] <= 1'b0; cube[Text_pos_x-1'b1][5][5] <= 1'b0; cube[Text_pos_x-1'b1][6][5] <= 1'b0; cube[Text_pos_x-1'b1][7][5] <= 1'b0;
            cube[Text_pos_x-1'b1][0][6] <= 1'b0; cube[Text_pos_x-1'b1][1][6] <= 1'b0; cube[Text_pos_x-1'b1][2][6] <= 1'b0; cube[Text_pos_x-1'b1][3][6] <= 1'b0; cube[Text_pos_x-1'b1][4][6] <= 1'b0; cube[Text_pos_x-1'b1][5][6] <= 1'b0; cube[Text_pos_x-1'b1][6][6] <= 1'b0; cube[Text_pos_x-1'b1][7][6] <= 1'b0;
            cube[Text_pos_x-1'b1][0][7] <= 1'b0; cube[Text_pos_x-1'b1][1][7] <= 1'b0; cube[Text_pos_x-1'b1][2][7] <= 1'b0; cube[Text_pos_x-1'b1][3][7] <= 1'b0; cube[Text_pos_x-1'b1][4][7] <= 1'b0; cube[Text_pos_x-1'b1][5][7] <= 1'b0; cube[Text_pos_x-1'b1][6][7] <= 1'b0; cube[Text_pos_x-1'b1][7][7] <= 1'b0;

            cube[Text_pos_x+1'b1][0][0] <= 1'b0; cube[Text_pos_x+1'b1][1][0] <= 1'b0; cube[Text_pos_x+1'b1][2][0] <= 1'b0; cube[Text_pos_x+1'b1][3][0] <= 1'b0; cube[Text_pos_x+1'b1][4][0] <= 1'b0; cube[Text_pos_x+1'b1][5][0] <= 1'b0; cube[Text_pos_x+1'b1][6][0] <= 1'b0; cube[Text_pos_x+1'b1][7][0] <= 1'b0;
            cube[Text_pos_x+1'b1][0][1] <= 1'b0; cube[Text_pos_x+1'b1][1][1] <= 1'b0; cube[Text_pos_x+1'b1][2][1] <= 1'b0; cube[Text_pos_x+1'b1][3][1] <= 1'b0; cube[Text_pos_x+1'b1][4][1] <= 1'b0; cube[Text_pos_x+1'b1][5][1] <= 1'b0; cube[Text_pos_x+1'b1][6][1] <= 1'b0; cube[Text_pos_x+1'b1][7][1] <= 1'b0;
            cube[Text_pos_x+1'b1][0][2] <= 1'b0; cube[Text_pos_x+1'b1][1][2] <= 1'b0; cube[Text_pos_x+1'b1][2][2] <= 1'b0; cube[Text_pos_x+1'b1][3][2] <= 1'b0; cube[Text_pos_x+1'b1][4][2] <= 1'b0; cube[Text_pos_x+1'b1][5][2] <= 1'b0; cube[Text_pos_x+1'b1][6][2] <= 1'b0; cube[Text_pos_x+1'b1][7][2] <= 1'b0;
            cube[Text_pos_x+1'b1][0][3] <= 1'b0; cube[Text_pos_x+1'b1][1][3] <= 1'b0; cube[Text_pos_x+1'b1][2][3] <= 1'b0; cube[Text_pos_x+1'b1][3][3] <= 1'b0; cube[Text_pos_x+1'b1][4][3] <= 1'b0; cube[Text_pos_x+1'b1][5][3] <= 1'b0; cube[Text_pos_x+1'b1][6][3] <= 1'b0; cube[Text_pos_x+1'b1][7][3] <= 1'b0;
            cube[Text_pos_x+1'b1][0][4] <= 1'b0; cube[Text_pos_x+1'b1][1][4] <= 1'b0; cube[Text_pos_x+1'b1][2][4] <= 1'b0; cube[Text_pos_x+1'b1][3][4] <= 1'b0; cube[Text_pos_x+1'b1][4][4] <= 1'b0; cube[Text_pos_x+1'b1][5][4] <= 1'b0; cube[Text_pos_x+1'b1][6][4] <= 1'b0; cube[Text_pos_x+1'b1][7][4] <= 1'b0;
            cube[Text_pos_x+1'b1][0][5] <= 1'b0; cube[Text_pos_x+1'b1][1][5] <= 1'b0; cube[Text_pos_x+1'b1][2][5] <= 1'b0; cube[Text_pos_x+1'b1][3][5] <= 1'b0; cube[Text_pos_x+1'b1][4][5] <= 1'b0; cube[Text_pos_x+1'b1][5][5] <= 1'b0; cube[Text_pos_x+1'b1][6][5] <= 1'b0; cube[Text_pos_x+1'b1][7][5] <= 1'b0;
            cube[Text_pos_x+1'b1][0][6] <= 1'b0; cube[Text_pos_x+1'b1][1][6] <= 1'b0; cube[Text_pos_x+1'b1][2][6] <= 1'b0; cube[Text_pos_x+1'b1][3][6] <= 1'b0; cube[Text_pos_x+1'b1][4][6] <= 1'b0; cube[Text_pos_x+1'b1][5][6] <= 1'b0; cube[Text_pos_x+1'b1][6][6] <= 1'b0; cube[Text_pos_x+1'b1][7][6] <= 1'b0;
            cube[Text_pos_x+1'b1][0][7] <= 1'b0; cube[Text_pos_x+1'b1][1][7] <= 1'b0; cube[Text_pos_x+1'b1][2][7] <= 1'b0; cube[Text_pos_x+1'b1][3][7] <= 1'b0; cube[Text_pos_x+1'b1][4][7] <= 1'b0; cube[Text_pos_x+1'b1][5][7] <= 1'b0; cube[Text_pos_x+1'b1][6][7] <= 1'b0; cube[Text_pos_x+1'b1][7][7] <= 1'b0;

            layer1 <= {
                cube[0][0][0], cube[1][0][0], cube[2][0][0], cube[3][0][0], cube[4][0][0], cube[5][0][0], cube[6][0][0], cube[7][0][0], 
                cube[0][1][0], cube[1][1][0], cube[2][1][0], cube[3][1][0], cube[4][1][0], cube[5][1][0], cube[6][1][0], cube[7][1][0], 
                cube[0][2][0], cube[1][2][0], cube[2][2][0], cube[3][2][0], cube[4][2][0], cube[5][2][0], cube[6][2][0], cube[7][2][0], 
                cube[0][3][0], cube[1][3][0], cube[2][3][0], cube[3][3][0], cube[4][3][0], cube[5][3][0], cube[6][3][0], cube[7][3][0], 
                cube[0][4][0], cube[1][4][0], cube[2][4][0], cube[3][4][0], cube[4][4][0], cube[5][4][0], cube[6][4][0], cube[7][4][0], 
                cube[0][5][0], cube[1][5][0], cube[2][5][0], cube[3][5][0], cube[4][5][0], cube[5][5][0], cube[6][5][0], cube[7][5][0], 
                cube[0][6][0], cube[1][6][0], cube[2][6][0], cube[3][6][0], cube[4][6][0], cube[5][6][0], cube[6][6][0], cube[7][6][0], 
                cube[0][7][0], cube[1][7][0], cube[2][7][0], cube[3][7][0], cube[4][7][0], cube[5][7][0], cube[6][7][0], cube[7][7][0]
            };
            
            layer2 <= {
                cube[0][0][1], cube[1][0][1], cube[2][0][1], cube[3][0][1], cube[4][0][1], cube[5][0][1], cube[6][0][1], cube[7][0][1], 
                cube[0][1][1], cube[1][1][1], cube[2][1][1], cube[3][1][1], cube[4][1][1], cube[5][1][1], cube[6][1][1], cube[7][1][1],
                cube[0][2][1], cube[1][2][1], cube[2][2][1], cube[3][2][1], cube[4][2][1], cube[5][2][1], cube[6][2][1], cube[7][2][1], 
                cube[0][3][1], cube[1][3][1], cube[2][3][1], cube[3][3][1], cube[4][3][1], cube[5][3][1], cube[6][3][1], cube[7][3][1], 
                cube[0][4][1], cube[1][4][1], cube[2][4][1], cube[3][4][1], cube[4][4][1], cube[5][4][1], cube[6][4][1], cube[7][4][1],
                cube[0][5][1], cube[1][5][1], cube[2][5][1], cube[3][5][1], cube[4][5][1], cube[5][5][1], cube[6][5][1], cube[7][5][1], 
                cube[0][6][1], cube[1][6][1], cube[2][6][1], cube[3][6][1], cube[4][6][1], cube[5][6][1], cube[6][6][1], cube[7][6][1], 
                cube[0][7][1], cube[1][7][1], cube[2][7][1], cube[3][7][1], cube[4][7][1], cube[5][7][1], cube[6][7][1], cube[7][7][1]
            };

            layer3 <= {
                cube[0][0][2], cube[1][0][2], cube[2][0][2], cube[3][0][2], cube[4][0][2], cube[5][0][2], cube[6][0][2], cube[7][0][2], 
                cube[0][1][2], cube[1][1][2], cube[2][1][2], cube[3][1][2], cube[4][1][2], cube[5][1][2], cube[6][1][2], cube[7][1][2], 
                cube[0][2][2], cube[1][2][2], cube[2][2][2], cube[3][2][2], cube[4][2][2], cube[5][2][2], cube[6][2][2], cube[7][2][2], 
                cube[0][3][2], cube[1][3][2], cube[2][3][2], cube[3][3][2], cube[4][3][2], cube[5][3][2], cube[6][3][2], cube[7][3][2], 
                cube[0][4][2], cube[1][4][2], cube[2][4][2], cube[3][4][2], cube[4][4][2], cube[5][4][2], cube[6][4][2], cube[7][4][2], 
                cube[0][5][2], cube[1][5][2], cube[2][5][2], cube[3][5][2], cube[4][5][2], cube[5][5][2], cube[6][5][2], cube[7][5][2], 
                cube[0][6][2], cube[1][6][2], cube[2][6][2], cube[3][6][2], cube[4][6][2], cube[5][6][2], cube[6][6][2], cube[7][6][2], 
                cube[0][7][2], cube[1][7][2], cube[2][7][2], cube[3][7][2], cube[4][7][2], cube[5][7][2], cube[6][7][2], cube[7][7][2]
            };

            layer4 <= {
                cube[0][0][3], cube[1][0][3], cube[2][0][3], cube[3][0][3], cube[4][0][3], cube[5][0][3], cube[6][0][3], cube[7][0][3],
                cube[0][1][3], cube[1][1][3], cube[2][1][3], cube[3][1][3], cube[4][1][3], cube[5][1][3], cube[6][1][3], cube[7][1][3],
                cube[0][2][3], cube[1][2][3], cube[2][2][3], cube[3][2][3], cube[4][2][3], cube[5][2][3], cube[6][2][3], cube[7][2][3], 
                cube[0][3][3], cube[1][3][3], cube[2][3][3], cube[3][3][3], cube[4][3][3], cube[5][3][3], cube[6][3][3], cube[7][3][3], 
                cube[0][4][3], cube[1][4][3], cube[2][4][3], cube[3][4][3], cube[4][4][3], cube[5][4][3], cube[6][4][3], cube[7][4][3], 
                cube[0][5][3], cube[1][5][3], cube[2][5][3], cube[3][5][3], cube[4][5][3], cube[5][5][3], cube[6][5][3], cube[7][5][3],
                cube[0][6][3], cube[1][6][3], cube[2][6][3], cube[3][6][3], cube[4][6][3], cube[5][6][3], cube[6][6][3], cube[7][6][3], 
                cube[0][7][3], cube[1][7][3], cube[2][7][3], cube[3][7][3], cube[4][7][3], cube[5][7][3], cube[6][7][3], cube[7][7][3]
            };

            layer5 <= {
                cube[0][0][4], cube[1][0][4], cube[2][0][4], cube[3][0][4], cube[4][0][4], cube[5][0][4], cube[6][0][4], cube[7][0][4],
                cube[0][1][4], cube[1][1][4], cube[2][1][4], cube[3][1][4], cube[4][1][4], cube[5][1][4], cube[6][1][4], cube[7][1][4], 
                cube[0][2][4], cube[1][2][4], cube[2][2][4], cube[3][2][4], cube[4][2][4], cube[5][2][4], cube[6][2][4], cube[7][2][4], 
                cube[0][3][4], cube[1][3][4], cube[2][3][4], cube[3][3][4], cube[4][3][4], cube[5][3][4], cube[6][3][4], cube[7][3][4],
                cube[0][4][4], cube[1][4][4], cube[2][4][4], cube[3][4][4], cube[4][4][4], cube[5][4][4], cube[6][4][4], cube[7][4][4], 
                cube[0][5][4], cube[1][5][4], cube[2][5][4], cube[3][5][4], cube[4][5][4], cube[5][5][4], cube[6][5][4], cube[7][5][4], 
                cube[0][6][4], cube[1][6][4], cube[2][6][4], cube[3][6][4], cube[4][6][4], cube[5][6][4], cube[6][6][4], cube[7][6][4], 
                cube[0][7][4], cube[1][7][4], cube[2][7][4], cube[3][7][4], cube[4][7][4], cube[5][7][4], cube[6][7][4], cube[7][7][4]
            };

            layer6 <= {
                cube[0][0][5], cube[1][0][5], cube[2][0][5], cube[3][0][5], cube[4][0][5], cube[5][0][5], cube[6][0][5], cube[7][0][5],
                cube[0][1][5], cube[1][1][5], cube[2][1][5], cube[3][1][5], cube[4][1][5], cube[5][1][5], cube[6][1][5], cube[7][1][5], 
                cube[0][2][5], cube[1][2][5], cube[2][2][5], cube[3][2][5], cube[4][2][5], cube[5][2][5], cube[6][2][5], cube[7][2][5], 
                cube[0][3][5], cube[1][3][5], cube[2][3][5], cube[3][3][5], cube[4][3][5], cube[5][3][5], cube[6][3][5], cube[7][3][5], 
                cube[0][4][5], cube[1][4][5], cube[2][4][5], cube[3][4][5], cube[4][4][5], cube[5][4][5], cube[6][4][5], cube[7][4][5],
                cube[0][5][5], cube[1][5][5], cube[2][5][5], cube[3][5][5], cube[4][5][5], cube[5][5][5], cube[6][5][5], cube[7][5][5], 
                cube[0][6][5], cube[1][6][5], cube[2][6][5], cube[3][6][5], cube[4][6][5], cube[5][6][5], cube[6][6][5], cube[7][6][5], 
                cube[0][7][5], cube[1][7][5], cube[2][7][5], cube[3][7][5], cube[4][7][5], cube[5][7][5], cube[6][7][5], cube[7][7][5] 
            };

            layer7 <= {
                cube[0][0][6], cube[1][0][6], cube[2][0][6], cube[3][0][6], cube[4][0][6], cube[5][0][6], cube[6][0][6], cube[7][0][6],
                cube[0][1][6], cube[1][1][6], cube[2][1][6], cube[3][1][6], cube[4][1][6], cube[5][1][6], cube[6][1][6], cube[7][1][6], 
                cube[0][2][6], cube[1][2][6], cube[2][2][6], cube[3][2][6], cube[4][2][6], cube[5][2][6], cube[6][2][6], cube[7][2][6], 
                cube[0][3][6], cube[1][3][6], cube[2][3][6], cube[3][3][6], cube[4][3][6], cube[5][3][6], cube[6][3][6], cube[7][3][6], 
                cube[0][4][6], cube[1][4][6], cube[2][4][6], cube[3][4][6], cube[4][4][6], cube[5][4][6], cube[6][4][6], cube[7][4][6],
                cube[0][5][6], cube[1][5][6], cube[2][5][6], cube[3][5][6], cube[4][5][6], cube[5][5][6], cube[6][5][6], cube[7][5][6], 
                cube[0][6][6], cube[1][6][6], cube[2][6][6], cube[3][6][6], cube[4][6][6], cube[5][6][6], cube[6][6][6], cube[7][6][6], 
                cube[0][7][6], cube[1][7][6], cube[2][7][6], cube[3][7][6], cube[4][7][6], cube[5][7][6], cube[6][7][6], cube[7][7][6] 
            };

            layer8 <= {
                cube[0][0][7], cube[1][0][7], cube[2][0][7], cube[3][0][7], cube[4][0][7], cube[5][0][7], cube[6][0][7], cube[7][0][7],
                cube[0][1][7], cube[1][1][7], cube[2][1][7], cube[3][1][7], cube[4][1][7], cube[5][1][7], cube[6][1][7], cube[7][1][7],
                cube[0][2][7], cube[1][2][7], cube[2][2][7], cube[3][2][7], cube[4][2][7], cube[5][2][7], cube[6][2][7], cube[7][2][7],
                cube[0][3][7], cube[1][3][7], cube[2][3][7], cube[3][3][7], cube[4][3][7], cube[5][3][7], cube[6][3][7], cube[7][3][7],
                cube[0][4][7], cube[1][4][7], cube[2][4][7], cube[3][4][7], cube[4][4][7], cube[5][4][7], cube[6][4][7], cube[7][4][7],
                cube[0][5][7], cube[1][5][7], cube[2][5][7], cube[3][5][7], cube[4][5][7], cube[5][5][7], cube[6][5][7], cube[7][5][7],
                cube[0][6][7], cube[1][6][7], cube[2][6][7], cube[3][6][7], cube[4][6][7], cube[5][6][7], cube[6][6][7], cube[7][6][7],
                cube[0][7][7], cube[1][7][7], cube[2][7][7], cube[3][7][7], cube[4][7][7], cube[5][7][7], cube[6][7][7], cube[7][7][7]
            }; 
		end
	end

    always@(*) begin
        case (Text_num)
            4'd0: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b1; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end         
            4'd1: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b0; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b1; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b1; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end
            4'd2: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b1; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b1; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b1; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b1; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b1; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b1; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end           
            4'd3: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b1; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b0; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b0; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b1; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b1; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end
            4'd4: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b0; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b1; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b0; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end
            4'd5: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b0; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b1; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b1; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b0; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b0; Text_yz[3][4] = 1'b1; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b1; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b0; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end
            4'd6: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b1; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b0; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b0; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b1; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b1; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end
            4'd7: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b0; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b1; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b1; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b0; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b0; Text_yz[3][4] = 1'b1; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b1; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b1; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end

            4'd8: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b1; Text_yz[6][1] = 1'b1; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b1; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b1; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b1; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b1; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end

            4'd9: begin
                case (A_score)
                    4'd0: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd1: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd2: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b0; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd3: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd4: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd5: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd6: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd7: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd8: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd9: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd10: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b1; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b1; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b1; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b1; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b1; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd11: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b1; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b1; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b1; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b1; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b1; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    default :begin
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                endcase
            end

            4'd10: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b1; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b1; Text_yz[6][1] = 1'b1; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b1; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b1; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b1; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b1; Text_yz[6][3] = 1'b1; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b0; Text_yz[3][4] = 1'b1; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b1; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b1; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b1; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end
            4'd11: begin
                case (B_score)
                    4'd0: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd1: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd2: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b0; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd3: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd4: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd5: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd6: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b0; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd7: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd8: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd9: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b1; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd10: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b1; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b1; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b1; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b1; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b1; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    4'd11: begin     
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b0; Text_yz[4][1] = 1'b0; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b1; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b0; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b1; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b0; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b1; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b0; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b1; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b0; Text_yz[4][5] = 1'b0; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b1; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                    default :begin
                    Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
                    Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
                    Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
                    Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
                    Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
                    Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
                    Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
                    Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
                    end
                endcase
            end

            default: begin     
            Text_yz[0][0] = 1'b0; Text_yz[1][0] = 1'b0; Text_yz[2][0] = 1'b0; Text_yz[3][0] = 1'b0; Text_yz[4][0] = 1'b0; Text_yz[5][0] = 1'b0; Text_yz[6][0] = 1'b0; Text_yz[7][0] = 1'b0;
            Text_yz[0][1] = 1'b0; Text_yz[1][1] = 1'b0; Text_yz[2][1] = 1'b1; Text_yz[3][1] = 1'b1; Text_yz[4][1] = 1'b1; Text_yz[5][1] = 1'b0; Text_yz[6][1] = 1'b0; Text_yz[7][1] = 1'b0;
            Text_yz[0][2] = 1'b0; Text_yz[1][2] = 1'b0; Text_yz[2][2] = 1'b1; Text_yz[3][2] = 1'b0; Text_yz[4][2] = 1'b1; Text_yz[5][2] = 1'b0; Text_yz[6][2] = 1'b0; Text_yz[7][2] = 1'b0;
            Text_yz[0][3] = 1'b0; Text_yz[1][3] = 1'b0; Text_yz[2][3] = 1'b1; Text_yz[3][3] = 1'b0; Text_yz[4][3] = 1'b1; Text_yz[5][3] = 1'b0; Text_yz[6][3] = 1'b0; Text_yz[7][3] = 1'b0;
            Text_yz[0][4] = 1'b0; Text_yz[1][4] = 1'b0; Text_yz[2][4] = 1'b1; Text_yz[3][4] = 1'b0; Text_yz[4][4] = 1'b1; Text_yz[5][4] = 1'b0; Text_yz[6][4] = 1'b0; Text_yz[7][4] = 1'b0;
            Text_yz[0][5] = 1'b0; Text_yz[1][5] = 1'b0; Text_yz[2][5] = 1'b1; Text_yz[3][5] = 1'b1; Text_yz[4][5] = 1'b1; Text_yz[5][5] = 1'b0; Text_yz[6][5] = 1'b0; Text_yz[7][5] = 1'b0;
            Text_yz[0][6] = 1'b0; Text_yz[1][6] = 1'b0; Text_yz[2][6] = 1'b0; Text_yz[3][6] = 1'b0; Text_yz[4][6] = 1'b0; Text_yz[5][6] = 1'b0; Text_yz[6][6] = 1'b0; Text_yz[7][6] = 1'b0;
            Text_yz[0][7] = 1'b0; Text_yz[1][7] = 1'b0; Text_yz[2][7] = 1'b0; Text_yz[3][7] = 1'b0; Text_yz[4][7] = 1'b0; Text_yz[5][7] = 1'b0; Text_yz[6][7] = 1'b0; Text_yz[7][7] = 1'b0;
            end

        endcase

        if(count == 23'b11111_11111_11111_11111_111) begin//every second
            next_Text_pos_x = Text_pos_x + 1'b1;
            if(Text_pos_x == 3'd7) begin
                if(Text_num == 4'd11) begin
                    next_Text_num = 4'd0;
                end
                else begin
                    next_Text_num = Text_num + 1'b1; 
                end
            end
            else begin
                next_Text_num = Text_num;
            end
        end
        else begin
            next_Text_pos_x = Text_pos_x;
            next_Text_num = Text_num;
        end
    end

endmodule