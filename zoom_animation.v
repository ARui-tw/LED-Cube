module zoom_animation (
    input clk,
    input rst,
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

    reg zoom_xyz[8-1:0][8-1:0][8-1:0]; 
    
    reg [23-1:0] count;

    reg [3-1:0] state;
    reg [3-1:0] next_state;

    always @ (posedge clk, posedge rst) begin
		if (rst) begin
            state <= 3'd0;
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
            
            state <= next_state;

            count <= count + 1;

            cube[0][0][0] = zoom_xyz[0][0][0]; cube[1][0][0] = zoom_xyz[1][0][0]; cube[2][0][0] = zoom_xyz[2][0][0]; cube[3][0][0] = zoom_xyz[3][0][0]; cube[4][0][0] = zoom_xyz[4][0][0]; cube[5][0][0] = zoom_xyz[5][0][0]; cube[6][0][0] = zoom_xyz[6][0][0]; cube[7][0][0] = zoom_xyz[7][0][0];
            cube[0][1][0] = zoom_xyz[0][1][0]; cube[1][1][0] = zoom_xyz[1][1][0]; cube[2][1][0] = zoom_xyz[2][1][0]; cube[3][1][0] = zoom_xyz[3][1][0]; cube[4][1][0] = zoom_xyz[4][1][0]; cube[5][1][0] = zoom_xyz[5][1][0]; cube[6][1][0] = zoom_xyz[6][1][0]; cube[7][1][0] = zoom_xyz[7][1][0];
            cube[0][2][0] = zoom_xyz[0][2][0]; cube[1][2][0] = zoom_xyz[1][2][0]; cube[2][2][0] = zoom_xyz[2][2][0]; cube[3][2][0] = zoom_xyz[3][2][0]; cube[4][2][0] = zoom_xyz[4][2][0]; cube[5][2][0] = zoom_xyz[5][2][0]; cube[6][2][0] = zoom_xyz[6][2][0]; cube[7][2][0] = zoom_xyz[7][2][0];
            cube[0][3][0] = zoom_xyz[0][3][0]; cube[1][3][0] = zoom_xyz[1][3][0]; cube[2][3][0] = zoom_xyz[2][3][0]; cube[3][3][0] = zoom_xyz[3][3][0]; cube[4][3][0] = zoom_xyz[4][3][0]; cube[5][3][0] = zoom_xyz[5][3][0]; cube[6][3][0] = zoom_xyz[6][3][0]; cube[7][3][0] = zoom_xyz[7][3][0];
            cube[0][4][0] = zoom_xyz[0][4][0]; cube[1][4][0] = zoom_xyz[1][4][0]; cube[2][4][0] = zoom_xyz[2][4][0]; cube[3][4][0] = zoom_xyz[3][4][0]; cube[4][4][0] = zoom_xyz[4][4][0]; cube[5][4][0] = zoom_xyz[5][4][0]; cube[6][4][0] = zoom_xyz[6][4][0]; cube[7][4][0] = zoom_xyz[7][4][0];
            cube[0][5][0] = zoom_xyz[0][5][0]; cube[1][5][0] = zoom_xyz[1][5][0]; cube[2][5][0] = zoom_xyz[2][5][0]; cube[3][5][0] = zoom_xyz[3][5][0]; cube[4][5][0] = zoom_xyz[4][5][0]; cube[5][5][0] = zoom_xyz[5][5][0]; cube[6][5][0] = zoom_xyz[6][5][0]; cube[7][5][0] = zoom_xyz[7][5][0];
            cube[0][6][0] = zoom_xyz[0][6][0]; cube[1][6][0] = zoom_xyz[1][6][0]; cube[2][6][0] = zoom_xyz[2][6][0]; cube[3][6][0] = zoom_xyz[3][6][0]; cube[4][6][0] = zoom_xyz[4][6][0]; cube[5][6][0] = zoom_xyz[5][6][0]; cube[6][6][0] = zoom_xyz[6][6][0]; cube[7][6][0] = zoom_xyz[7][6][0];
            cube[0][7][0] = zoom_xyz[0][7][0]; cube[1][7][0] = zoom_xyz[1][7][0]; cube[2][7][0] = zoom_xyz[2][7][0]; cube[3][7][0] = zoom_xyz[3][7][0]; cube[4][7][0] = zoom_xyz[4][7][0]; cube[5][7][0] = zoom_xyz[5][7][0]; cube[6][7][0] = zoom_xyz[6][7][0]; cube[7][7][0] = zoom_xyz[7][7][0];
            cube[0][0][1] = zoom_xyz[0][0][1]; cube[1][0][1] = zoom_xyz[1][0][1]; cube[2][0][1] = zoom_xyz[2][0][1]; cube[3][0][1] = zoom_xyz[3][0][1]; cube[4][0][1] = zoom_xyz[4][0][1]; cube[5][0][1] = zoom_xyz[5][0][1]; cube[6][0][1] = zoom_xyz[6][0][1]; cube[7][0][1] = zoom_xyz[7][0][1];
            cube[0][1][1] = zoom_xyz[0][1][1]; cube[1][1][1] = zoom_xyz[1][1][1]; cube[2][1][1] = zoom_xyz[2][1][1]; cube[3][1][1] = zoom_xyz[3][1][1]; cube[4][1][1] = zoom_xyz[4][1][1]; cube[5][1][1] = zoom_xyz[5][1][1]; cube[6][1][1] = zoom_xyz[6][1][1]; cube[7][1][1] = zoom_xyz[7][1][1];
            cube[0][2][1] = zoom_xyz[0][2][1]; cube[1][2][1] = zoom_xyz[1][2][1]; cube[2][2][1] = zoom_xyz[2][2][1]; cube[3][2][1] = zoom_xyz[3][2][1]; cube[4][2][1] = zoom_xyz[4][2][1]; cube[5][2][1] = zoom_xyz[5][2][1]; cube[6][2][1] = zoom_xyz[6][2][1]; cube[7][2][1] = zoom_xyz[7][2][1];
            cube[0][3][1] = zoom_xyz[0][3][1]; cube[1][3][1] = zoom_xyz[1][3][1]; cube[2][3][1] = zoom_xyz[2][3][1]; cube[3][3][1] = zoom_xyz[3][3][1]; cube[4][3][1] = zoom_xyz[4][3][1]; cube[5][3][1] = zoom_xyz[5][3][1]; cube[6][3][1] = zoom_xyz[6][3][1]; cube[7][3][1] = zoom_xyz[7][3][1];
            cube[0][4][1] = zoom_xyz[0][4][1]; cube[1][4][1] = zoom_xyz[1][4][1]; cube[2][4][1] = zoom_xyz[2][4][1]; cube[3][4][1] = zoom_xyz[3][4][1]; cube[4][4][1] = zoom_xyz[4][4][1]; cube[5][4][1] = zoom_xyz[5][4][1]; cube[6][4][1] = zoom_xyz[6][4][1]; cube[7][4][1] = zoom_xyz[7][4][1];
            cube[0][5][1] = zoom_xyz[0][5][1]; cube[1][5][1] = zoom_xyz[1][5][1]; cube[2][5][1] = zoom_xyz[2][5][1]; cube[3][5][1] = zoom_xyz[3][5][1]; cube[4][5][1] = zoom_xyz[4][5][1]; cube[5][5][1] = zoom_xyz[5][5][1]; cube[6][5][1] = zoom_xyz[6][5][1]; cube[7][5][1] = zoom_xyz[7][5][1];
            cube[0][6][1] = zoom_xyz[0][6][1]; cube[1][6][1] = zoom_xyz[1][6][1]; cube[2][6][1] = zoom_xyz[2][6][1]; cube[3][6][1] = zoom_xyz[3][6][1]; cube[4][6][1] = zoom_xyz[4][6][1]; cube[5][6][1] = zoom_xyz[5][6][1]; cube[6][6][1] = zoom_xyz[6][6][1]; cube[7][6][1] = zoom_xyz[7][6][1];
            cube[0][7][1] = zoom_xyz[0][7][1]; cube[1][7][1] = zoom_xyz[1][7][1]; cube[2][7][1] = zoom_xyz[2][7][1]; cube[3][7][1] = zoom_xyz[3][7][1]; cube[4][7][1] = zoom_xyz[4][7][1]; cube[5][7][1] = zoom_xyz[5][7][1]; cube[6][7][1] = zoom_xyz[6][7][1]; cube[7][7][1] = zoom_xyz[7][7][1];
            cube[0][0][2] = zoom_xyz[0][0][2]; cube[1][0][2] = zoom_xyz[1][0][2]; cube[2][0][2] = zoom_xyz[2][0][2]; cube[3][0][2] = zoom_xyz[3][0][2]; cube[4][0][2] = zoom_xyz[4][0][2]; cube[5][0][2] = zoom_xyz[5][0][2]; cube[6][0][2] = zoom_xyz[6][0][2]; cube[7][0][2] = zoom_xyz[7][0][2];
            cube[0][1][2] = zoom_xyz[0][1][2]; cube[1][1][2] = zoom_xyz[1][1][2]; cube[2][1][2] = zoom_xyz[2][1][2]; cube[3][1][2] = zoom_xyz[3][1][2]; cube[4][1][2] = zoom_xyz[4][1][2]; cube[5][1][2] = zoom_xyz[5][1][2]; cube[6][1][2] = zoom_xyz[6][1][2]; cube[7][1][2] = zoom_xyz[7][1][2];
            cube[0][2][2] = zoom_xyz[0][2][2]; cube[1][2][2] = zoom_xyz[1][2][2]; cube[2][2][2] = zoom_xyz[2][2][2]; cube[3][2][2] = zoom_xyz[3][2][2]; cube[4][2][2] = zoom_xyz[4][2][2]; cube[5][2][2] = zoom_xyz[5][2][2]; cube[6][2][2] = zoom_xyz[6][2][2]; cube[7][2][2] = zoom_xyz[7][2][2];
            cube[0][3][2] = zoom_xyz[0][3][2]; cube[1][3][2] = zoom_xyz[1][3][2]; cube[2][3][2] = zoom_xyz[2][3][2]; cube[3][3][2] = zoom_xyz[3][3][2]; cube[4][3][2] = zoom_xyz[4][3][2]; cube[5][3][2] = zoom_xyz[5][3][2]; cube[6][3][2] = zoom_xyz[6][3][2]; cube[7][3][2] = zoom_xyz[7][3][2];
            cube[0][4][2] = zoom_xyz[0][4][2]; cube[1][4][2] = zoom_xyz[1][4][2]; cube[2][4][2] = zoom_xyz[2][4][2]; cube[3][4][2] = zoom_xyz[3][4][2]; cube[4][4][2] = zoom_xyz[4][4][2]; cube[5][4][2] = zoom_xyz[5][4][2]; cube[6][4][2] = zoom_xyz[6][4][2]; cube[7][4][2] = zoom_xyz[7][4][2];
            cube[0][5][2] = zoom_xyz[0][5][2]; cube[1][5][2] = zoom_xyz[1][5][2]; cube[2][5][2] = zoom_xyz[2][5][2]; cube[3][5][2] = zoom_xyz[3][5][2]; cube[4][5][2] = zoom_xyz[4][5][2]; cube[5][5][2] = zoom_xyz[5][5][2]; cube[6][5][2] = zoom_xyz[6][5][2]; cube[7][5][2] = zoom_xyz[7][5][2];
            cube[0][6][2] = zoom_xyz[0][6][2]; cube[1][6][2] = zoom_xyz[1][6][2]; cube[2][6][2] = zoom_xyz[2][6][2]; cube[3][6][2] = zoom_xyz[3][6][2]; cube[4][6][2] = zoom_xyz[4][6][2]; cube[5][6][2] = zoom_xyz[5][6][2]; cube[6][6][2] = zoom_xyz[6][6][2]; cube[7][6][2] = zoom_xyz[7][6][2];
            cube[0][7][2] = zoom_xyz[0][7][2]; cube[1][7][2] = zoom_xyz[1][7][2]; cube[2][7][2] = zoom_xyz[2][7][2]; cube[3][7][2] = zoom_xyz[3][7][2]; cube[4][7][2] = zoom_xyz[4][7][2]; cube[5][7][2] = zoom_xyz[5][7][2]; cube[6][7][2] = zoom_xyz[6][7][2]; cube[7][7][2] = zoom_xyz[7][7][2];
            cube[0][0][3] = zoom_xyz[0][0][3]; cube[1][0][3] = zoom_xyz[1][0][3]; cube[2][0][3] = zoom_xyz[2][0][3]; cube[3][0][3] = zoom_xyz[3][0][3]; cube[4][0][3] = zoom_xyz[4][0][3]; cube[5][0][3] = zoom_xyz[5][0][3]; cube[6][0][3] = zoom_xyz[6][0][3]; cube[7][0][3] = zoom_xyz[7][0][3];
            cube[0][1][3] = zoom_xyz[0][1][3]; cube[1][1][3] = zoom_xyz[1][1][3]; cube[2][1][3] = zoom_xyz[2][1][3]; cube[3][1][3] = zoom_xyz[3][1][3]; cube[4][1][3] = zoom_xyz[4][1][3]; cube[5][1][3] = zoom_xyz[5][1][3]; cube[6][1][3] = zoom_xyz[6][1][3]; cube[7][1][3] = zoom_xyz[7][1][3];
            cube[0][2][3] = zoom_xyz[0][2][3]; cube[1][2][3] = zoom_xyz[1][2][3]; cube[2][2][3] = zoom_xyz[2][2][3]; cube[3][2][3] = zoom_xyz[3][2][3]; cube[4][2][3] = zoom_xyz[4][2][3]; cube[5][2][3] = zoom_xyz[5][2][3]; cube[6][2][3] = zoom_xyz[6][2][3]; cube[7][2][3] = zoom_xyz[7][2][3];
            cube[0][3][3] = zoom_xyz[0][3][3]; cube[1][3][3] = zoom_xyz[1][3][3]; cube[2][3][3] = zoom_xyz[2][3][3]; cube[3][3][3] = zoom_xyz[3][3][3]; cube[4][3][3] = zoom_xyz[4][3][3]; cube[5][3][3] = zoom_xyz[5][3][3]; cube[6][3][3] = zoom_xyz[6][3][3]; cube[7][3][3] = zoom_xyz[7][3][3];
            cube[0][4][3] = zoom_xyz[0][4][3]; cube[1][4][3] = zoom_xyz[1][4][3]; cube[2][4][3] = zoom_xyz[2][4][3]; cube[3][4][3] = zoom_xyz[3][4][3]; cube[4][4][3] = zoom_xyz[4][4][3]; cube[5][4][3] = zoom_xyz[5][4][3]; cube[6][4][3] = zoom_xyz[6][4][3]; cube[7][4][3] = zoom_xyz[7][4][3];
            cube[0][5][3] = zoom_xyz[0][5][3]; cube[1][5][3] = zoom_xyz[1][5][3]; cube[2][5][3] = zoom_xyz[2][5][3]; cube[3][5][3] = zoom_xyz[3][5][3]; cube[4][5][3] = zoom_xyz[4][5][3]; cube[5][5][3] = zoom_xyz[5][5][3]; cube[6][5][3] = zoom_xyz[6][5][3]; cube[7][5][3] = zoom_xyz[7][5][3];
            cube[0][6][3] = zoom_xyz[0][6][3]; cube[1][6][3] = zoom_xyz[1][6][3]; cube[2][6][3] = zoom_xyz[2][6][3]; cube[3][6][3] = zoom_xyz[3][6][3]; cube[4][6][3] = zoom_xyz[4][6][3]; cube[5][6][3] = zoom_xyz[5][6][3]; cube[6][6][3] = zoom_xyz[6][6][3]; cube[7][6][3] = zoom_xyz[7][6][3];
            cube[0][7][3] = zoom_xyz[0][7][3]; cube[1][7][3] = zoom_xyz[1][7][3]; cube[2][7][3] = zoom_xyz[2][7][3]; cube[3][7][3] = zoom_xyz[3][7][3]; cube[4][7][3] = zoom_xyz[4][7][3]; cube[5][7][3] = zoom_xyz[5][7][3]; cube[6][7][3] = zoom_xyz[6][7][3]; cube[7][7][3] = zoom_xyz[7][7][3];
            cube[0][0][4] = zoom_xyz[0][0][4]; cube[1][0][4] = zoom_xyz[1][0][4]; cube[2][0][4] = zoom_xyz[2][0][4]; cube[3][0][4] = zoom_xyz[3][0][4]; cube[4][0][4] = zoom_xyz[4][0][4]; cube[5][0][4] = zoom_xyz[5][0][4]; cube[6][0][4] = zoom_xyz[6][0][4]; cube[7][0][4] = zoom_xyz[7][0][4];
            cube[0][1][4] = zoom_xyz[0][1][4]; cube[1][1][4] = zoom_xyz[1][1][4]; cube[2][1][4] = zoom_xyz[2][1][4]; cube[3][1][4] = zoom_xyz[3][1][4]; cube[4][1][4] = zoom_xyz[4][1][4]; cube[5][1][4] = zoom_xyz[5][1][4]; cube[6][1][4] = zoom_xyz[6][1][4]; cube[7][1][4] = zoom_xyz[7][1][4];
            cube[0][2][4] = zoom_xyz[0][2][4]; cube[1][2][4] = zoom_xyz[1][2][4]; cube[2][2][4] = zoom_xyz[2][2][4]; cube[3][2][4] = zoom_xyz[3][2][4]; cube[4][2][4] = zoom_xyz[4][2][4]; cube[5][2][4] = zoom_xyz[5][2][4]; cube[6][2][4] = zoom_xyz[6][2][4]; cube[7][2][4] = zoom_xyz[7][2][4];
            cube[0][3][4] = zoom_xyz[0][3][4]; cube[1][3][4] = zoom_xyz[1][3][4]; cube[2][3][4] = zoom_xyz[2][3][4]; cube[3][3][4] = zoom_xyz[3][3][4]; cube[4][3][4] = zoom_xyz[4][3][4]; cube[5][3][4] = zoom_xyz[5][3][4]; cube[6][3][4] = zoom_xyz[6][3][4]; cube[7][3][4] = zoom_xyz[7][3][4];
            cube[0][4][4] = zoom_xyz[0][4][4]; cube[1][4][4] = zoom_xyz[1][4][4]; cube[2][4][4] = zoom_xyz[2][4][4]; cube[3][4][4] = zoom_xyz[3][4][4]; cube[4][4][4] = zoom_xyz[4][4][4]; cube[5][4][4] = zoom_xyz[5][4][4]; cube[6][4][4] = zoom_xyz[6][4][4]; cube[7][4][4] = zoom_xyz[7][4][4];
            cube[0][5][4] = zoom_xyz[0][5][4]; cube[1][5][4] = zoom_xyz[1][5][4]; cube[2][5][4] = zoom_xyz[2][5][4]; cube[3][5][4] = zoom_xyz[3][5][4]; cube[4][5][4] = zoom_xyz[4][5][4]; cube[5][5][4] = zoom_xyz[5][5][4]; cube[6][5][4] = zoom_xyz[6][5][4]; cube[7][5][4] = zoom_xyz[7][5][4];
            cube[0][6][4] = zoom_xyz[0][6][4]; cube[1][6][4] = zoom_xyz[1][6][4]; cube[2][6][4] = zoom_xyz[2][6][4]; cube[3][6][4] = zoom_xyz[3][6][4]; cube[4][6][4] = zoom_xyz[4][6][4]; cube[5][6][4] = zoom_xyz[5][6][4]; cube[6][6][4] = zoom_xyz[6][6][4]; cube[7][6][4] = zoom_xyz[7][6][4];
            cube[0][7][4] = zoom_xyz[0][7][4]; cube[1][7][4] = zoom_xyz[1][7][4]; cube[2][7][4] = zoom_xyz[2][7][4]; cube[3][7][4] = zoom_xyz[3][7][4]; cube[4][7][4] = zoom_xyz[4][7][4]; cube[5][7][4] = zoom_xyz[5][7][4]; cube[6][7][4] = zoom_xyz[6][7][4]; cube[7][7][4] = zoom_xyz[7][7][4];
            cube[0][0][5] = zoom_xyz[0][0][5]; cube[1][0][5] = zoom_xyz[1][0][5]; cube[2][0][5] = zoom_xyz[2][0][5]; cube[3][0][5] = zoom_xyz[3][0][5]; cube[4][0][5] = zoom_xyz[4][0][5]; cube[5][0][5] = zoom_xyz[5][0][5]; cube[6][0][5] = zoom_xyz[6][0][5]; cube[7][0][5] = zoom_xyz[7][0][5];
            cube[0][1][5] = zoom_xyz[0][1][5]; cube[1][1][5] = zoom_xyz[1][1][5]; cube[2][1][5] = zoom_xyz[2][1][5]; cube[3][1][5] = zoom_xyz[3][1][5]; cube[4][1][5] = zoom_xyz[4][1][5]; cube[5][1][5] = zoom_xyz[5][1][5]; cube[6][1][5] = zoom_xyz[6][1][5]; cube[7][1][5] = zoom_xyz[7][1][5];
            cube[0][2][5] = zoom_xyz[0][2][5]; cube[1][2][5] = zoom_xyz[1][2][5]; cube[2][2][5] = zoom_xyz[2][2][5]; cube[3][2][5] = zoom_xyz[3][2][5]; cube[4][2][5] = zoom_xyz[4][2][5]; cube[5][2][5] = zoom_xyz[5][2][5]; cube[6][2][5] = zoom_xyz[6][2][5]; cube[7][2][5] = zoom_xyz[7][2][5];
            cube[0][3][5] = zoom_xyz[0][3][5]; cube[1][3][5] = zoom_xyz[1][3][5]; cube[2][3][5] = zoom_xyz[2][3][5]; cube[3][3][5] = zoom_xyz[3][3][5]; cube[4][3][5] = zoom_xyz[4][3][5]; cube[5][3][5] = zoom_xyz[5][3][5]; cube[6][3][5] = zoom_xyz[6][3][5]; cube[7][3][5] = zoom_xyz[7][3][5];
            cube[0][4][5] = zoom_xyz[0][4][5]; cube[1][4][5] = zoom_xyz[1][4][5]; cube[2][4][5] = zoom_xyz[2][4][5]; cube[3][4][5] = zoom_xyz[3][4][5]; cube[4][4][5] = zoom_xyz[4][4][5]; cube[5][4][5] = zoom_xyz[5][4][5]; cube[6][4][5] = zoom_xyz[6][4][5]; cube[7][4][5] = zoom_xyz[7][4][5];
            cube[0][5][5] = zoom_xyz[0][5][5]; cube[1][5][5] = zoom_xyz[1][5][5]; cube[2][5][5] = zoom_xyz[2][5][5]; cube[3][5][5] = zoom_xyz[3][5][5]; cube[4][5][5] = zoom_xyz[4][5][5]; cube[5][5][5] = zoom_xyz[5][5][5]; cube[6][5][5] = zoom_xyz[6][5][5]; cube[7][5][5] = zoom_xyz[7][5][5];
            cube[0][6][5] = zoom_xyz[0][6][5]; cube[1][6][5] = zoom_xyz[1][6][5]; cube[2][6][5] = zoom_xyz[2][6][5]; cube[3][6][5] = zoom_xyz[3][6][5]; cube[4][6][5] = zoom_xyz[4][6][5]; cube[5][6][5] = zoom_xyz[5][6][5]; cube[6][6][5] = zoom_xyz[6][6][5]; cube[7][6][5] = zoom_xyz[7][6][5];
            cube[0][7][5] = zoom_xyz[0][7][5]; cube[1][7][5] = zoom_xyz[1][7][5]; cube[2][7][5] = zoom_xyz[2][7][5]; cube[3][7][5] = zoom_xyz[3][7][5]; cube[4][7][5] = zoom_xyz[4][7][5]; cube[5][7][5] = zoom_xyz[5][7][5]; cube[6][7][5] = zoom_xyz[6][7][5]; cube[7][7][5] = zoom_xyz[7][7][5];
            cube[0][0][6] = zoom_xyz[0][0][6]; cube[1][0][6] = zoom_xyz[1][0][6]; cube[2][0][6] = zoom_xyz[2][0][6]; cube[3][0][6] = zoom_xyz[3][0][6]; cube[4][0][6] = zoom_xyz[4][0][6]; cube[5][0][6] = zoom_xyz[5][0][6]; cube[6][0][6] = zoom_xyz[6][0][6]; cube[7][0][6] = zoom_xyz[7][0][6];
            cube[0][1][6] = zoom_xyz[0][1][6]; cube[1][1][6] = zoom_xyz[1][1][6]; cube[2][1][6] = zoom_xyz[2][1][6]; cube[3][1][6] = zoom_xyz[3][1][6]; cube[4][1][6] = zoom_xyz[4][1][6]; cube[5][1][6] = zoom_xyz[5][1][6]; cube[6][1][6] = zoom_xyz[6][1][6]; cube[7][1][6] = zoom_xyz[7][1][6];
            cube[0][2][6] = zoom_xyz[0][2][6]; cube[1][2][6] = zoom_xyz[1][2][6]; cube[2][2][6] = zoom_xyz[2][2][6]; cube[3][2][6] = zoom_xyz[3][2][6]; cube[4][2][6] = zoom_xyz[4][2][6]; cube[5][2][6] = zoom_xyz[5][2][6]; cube[6][2][6] = zoom_xyz[6][2][6]; cube[7][2][6] = zoom_xyz[7][2][6];
            cube[0][3][6] = zoom_xyz[0][3][6]; cube[1][3][6] = zoom_xyz[1][3][6]; cube[2][3][6] = zoom_xyz[2][3][6]; cube[3][3][6] = zoom_xyz[3][3][6]; cube[4][3][6] = zoom_xyz[4][3][6]; cube[5][3][6] = zoom_xyz[5][3][6]; cube[6][3][6] = zoom_xyz[6][3][6]; cube[7][3][6] = zoom_xyz[7][3][6];
            cube[0][4][6] = zoom_xyz[0][4][6]; cube[1][4][6] = zoom_xyz[1][4][6]; cube[2][4][6] = zoom_xyz[2][4][6]; cube[3][4][6] = zoom_xyz[3][4][6]; cube[4][4][6] = zoom_xyz[4][4][6]; cube[5][4][6] = zoom_xyz[5][4][6]; cube[6][4][6] = zoom_xyz[6][4][6]; cube[7][4][6] = zoom_xyz[7][4][6];
            cube[0][5][6] = zoom_xyz[0][5][6]; cube[1][5][6] = zoom_xyz[1][5][6]; cube[2][5][6] = zoom_xyz[2][5][6]; cube[3][5][6] = zoom_xyz[3][5][6]; cube[4][5][6] = zoom_xyz[4][5][6]; cube[5][5][6] = zoom_xyz[5][5][6]; cube[6][5][6] = zoom_xyz[6][5][6]; cube[7][5][6] = zoom_xyz[7][5][6];
            cube[0][6][6] = zoom_xyz[0][6][6]; cube[1][6][6] = zoom_xyz[1][6][6]; cube[2][6][6] = zoom_xyz[2][6][6]; cube[3][6][6] = zoom_xyz[3][6][6]; cube[4][6][6] = zoom_xyz[4][6][6]; cube[5][6][6] = zoom_xyz[5][6][6]; cube[6][6][6] = zoom_xyz[6][6][6]; cube[7][6][6] = zoom_xyz[7][6][6];
            cube[0][7][6] = zoom_xyz[0][7][6]; cube[1][7][6] = zoom_xyz[1][7][6]; cube[2][7][6] = zoom_xyz[2][7][6]; cube[3][7][6] = zoom_xyz[3][7][6]; cube[4][7][6] = zoom_xyz[4][7][6]; cube[5][7][6] = zoom_xyz[5][7][6]; cube[6][7][6] = zoom_xyz[6][7][6]; cube[7][7][6] = zoom_xyz[7][7][6];
            cube[0][0][7] = zoom_xyz[0][0][7]; cube[1][0][7] = zoom_xyz[1][0][7]; cube[2][0][7] = zoom_xyz[2][0][7]; cube[3][0][7] = zoom_xyz[3][0][7]; cube[4][0][7] = zoom_xyz[4][0][7]; cube[5][0][7] = zoom_xyz[5][0][7]; cube[6][0][7] = zoom_xyz[6][0][7]; cube[7][0][7] = zoom_xyz[7][0][7];
            cube[0][1][7] = zoom_xyz[0][1][7]; cube[1][1][7] = zoom_xyz[1][1][7]; cube[2][1][7] = zoom_xyz[2][1][7]; cube[3][1][7] = zoom_xyz[3][1][7]; cube[4][1][7] = zoom_xyz[4][1][7]; cube[5][1][7] = zoom_xyz[5][1][7]; cube[6][1][7] = zoom_xyz[6][1][7]; cube[7][1][7] = zoom_xyz[7][1][7];
            cube[0][2][7] = zoom_xyz[0][2][7]; cube[1][2][7] = zoom_xyz[1][2][7]; cube[2][2][7] = zoom_xyz[2][2][7]; cube[3][2][7] = zoom_xyz[3][2][7]; cube[4][2][7] = zoom_xyz[4][2][7]; cube[5][2][7] = zoom_xyz[5][2][7]; cube[6][2][7] = zoom_xyz[6][2][7]; cube[7][2][7] = zoom_xyz[7][2][7];
            cube[0][3][7] = zoom_xyz[0][3][7]; cube[1][3][7] = zoom_xyz[1][3][7]; cube[2][3][7] = zoom_xyz[2][3][7]; cube[3][3][7] = zoom_xyz[3][3][7]; cube[4][3][7] = zoom_xyz[4][3][7]; cube[5][3][7] = zoom_xyz[5][3][7]; cube[6][3][7] = zoom_xyz[6][3][7]; cube[7][3][7] = zoom_xyz[7][3][7];
            cube[0][4][7] = zoom_xyz[0][4][7]; cube[1][4][7] = zoom_xyz[1][4][7]; cube[2][4][7] = zoom_xyz[2][4][7]; cube[3][4][7] = zoom_xyz[3][4][7]; cube[4][4][7] = zoom_xyz[4][4][7]; cube[5][4][7] = zoom_xyz[5][4][7]; cube[6][4][7] = zoom_xyz[6][4][7]; cube[7][4][7] = zoom_xyz[7][4][7];
            cube[0][5][7] = zoom_xyz[0][5][7]; cube[1][5][7] = zoom_xyz[1][5][7]; cube[2][5][7] = zoom_xyz[2][5][7]; cube[3][5][7] = zoom_xyz[3][5][7]; cube[4][5][7] = zoom_xyz[4][5][7]; cube[5][5][7] = zoom_xyz[5][5][7]; cube[6][5][7] = zoom_xyz[6][5][7]; cube[7][5][7] = zoom_xyz[7][5][7];
            cube[0][6][7] = zoom_xyz[0][6][7]; cube[1][6][7] = zoom_xyz[1][6][7]; cube[2][6][7] = zoom_xyz[2][6][7]; cube[3][6][7] = zoom_xyz[3][6][7]; cube[4][6][7] = zoom_xyz[4][6][7]; cube[5][6][7] = zoom_xyz[5][6][7]; cube[6][6][7] = zoom_xyz[6][6][7]; cube[7][6][7] = zoom_xyz[7][6][7];
            cube[0][7][7] = zoom_xyz[0][7][7]; cube[1][7][7] = zoom_xyz[1][7][7]; cube[2][7][7] = zoom_xyz[2][7][7]; cube[3][7][7] = zoom_xyz[3][7][7]; cube[4][7][7] = zoom_xyz[4][7][7]; cube[5][7][7] = zoom_xyz[5][7][7]; cube[6][7][7] = zoom_xyz[6][7][7]; cube[7][7][7] = zoom_xyz[7][7][7];





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
        case (state)
            3'd0: begin     
                zoom_xyz[0][0][0] = 1'b1; zoom_xyz[1][0][0] = 1'b1; zoom_xyz[2][0][0] = 1'b1; zoom_xyz[3][0][0] = 1'b1; zoom_xyz[4][0][0] = 1'b1; zoom_xyz[5][0][0] = 1'b1; zoom_xyz[6][0][0] = 1'b1; zoom_xyz[7][0][0] = 1'b1;
                zoom_xyz[0][1][0] = 1'b1; zoom_xyz[1][1][0] = 1'b1; zoom_xyz[2][1][0] = 1'b1; zoom_xyz[3][1][0] = 1'b1; zoom_xyz[4][1][0] = 1'b1; zoom_xyz[5][1][0] = 1'b1; zoom_xyz[6][1][0] = 1'b1; zoom_xyz[7][1][0] = 1'b1;
                zoom_xyz[0][2][0] = 1'b1; zoom_xyz[1][2][0] = 1'b1; zoom_xyz[2][2][0] = 1'b1; zoom_xyz[3][2][0] = 1'b1; zoom_xyz[4][2][0] = 1'b1; zoom_xyz[5][2][0] = 1'b1; zoom_xyz[6][2][0] = 1'b1; zoom_xyz[7][2][0] = 1'b1;
                zoom_xyz[0][3][0] = 1'b1; zoom_xyz[1][3][0] = 1'b1; zoom_xyz[2][3][0] = 1'b1; zoom_xyz[3][3][0] = 1'b1; zoom_xyz[4][3][0] = 1'b1; zoom_xyz[5][3][0] = 1'b1; zoom_xyz[6][3][0] = 1'b1; zoom_xyz[7][3][0] = 1'b1;
                zoom_xyz[0][4][0] = 1'b1; zoom_xyz[1][4][0] = 1'b1; zoom_xyz[2][4][0] = 1'b1; zoom_xyz[3][4][0] = 1'b1; zoom_xyz[4][4][0] = 1'b1; zoom_xyz[5][4][0] = 1'b1; zoom_xyz[6][4][0] = 1'b1; zoom_xyz[7][4][0] = 1'b1;
                zoom_xyz[0][5][0] = 1'b1; zoom_xyz[1][5][0] = 1'b1; zoom_xyz[2][5][0] = 1'b1; zoom_xyz[3][5][0] = 1'b1; zoom_xyz[4][5][0] = 1'b1; zoom_xyz[5][5][0] = 1'b1; zoom_xyz[6][5][0] = 1'b1; zoom_xyz[7][5][0] = 1'b1;
                zoom_xyz[0][6][0] = 1'b1; zoom_xyz[1][6][0] = 1'b1; zoom_xyz[2][6][0] = 1'b1; zoom_xyz[3][6][0] = 1'b1; zoom_xyz[4][6][0] = 1'b1; zoom_xyz[5][6][0] = 1'b1; zoom_xyz[6][6][0] = 1'b1; zoom_xyz[7][6][0] = 1'b1;
                zoom_xyz[0][7][0] = 1'b1; zoom_xyz[1][7][0] = 1'b1; zoom_xyz[2][7][0] = 1'b1; zoom_xyz[3][7][0] = 1'b1; zoom_xyz[4][7][0] = 1'b1; zoom_xyz[5][7][0] = 1'b1; zoom_xyz[6][7][0] = 1'b1; zoom_xyz[7][7][0] = 1'b1;
                zoom_xyz[0][0][1] = 1'b1; zoom_xyz[1][0][1] = 1'b1; zoom_xyz[2][0][1] = 1'b1; zoom_xyz[3][0][1] = 1'b1; zoom_xyz[4][0][1] = 1'b1; zoom_xyz[5][0][1] = 1'b1; zoom_xyz[6][0][1] = 1'b1; zoom_xyz[7][0][1] = 1'b1;
                zoom_xyz[0][1][1] = 1'b1; zoom_xyz[1][1][1] = 1'b0; zoom_xyz[2][1][1] = 1'b0; zoom_xyz[3][1][1] = 1'b0; zoom_xyz[4][1][1] = 1'b0; zoom_xyz[5][1][1] = 1'b0; zoom_xyz[6][1][1] = 1'b0; zoom_xyz[7][1][1] = 1'b1;
                zoom_xyz[0][2][1] = 1'b1; zoom_xyz[1][2][1] = 1'b0; zoom_xyz[2][2][1] = 1'b0; zoom_xyz[3][2][1] = 1'b0; zoom_xyz[4][2][1] = 1'b0; zoom_xyz[5][2][1] = 1'b0; zoom_xyz[6][2][1] = 1'b0; zoom_xyz[7][2][1] = 1'b1;
                zoom_xyz[0][3][1] = 1'b1; zoom_xyz[1][3][1] = 1'b0; zoom_xyz[2][3][1] = 1'b0; zoom_xyz[3][3][1] = 1'b0; zoom_xyz[4][3][1] = 1'b0; zoom_xyz[5][3][1] = 1'b0; zoom_xyz[6][3][1] = 1'b0; zoom_xyz[7][3][1] = 1'b1;
                zoom_xyz[0][4][1] = 1'b1; zoom_xyz[1][4][1] = 1'b0; zoom_xyz[2][4][1] = 1'b0; zoom_xyz[3][4][1] = 1'b0; zoom_xyz[4][4][1] = 1'b0; zoom_xyz[5][4][1] = 1'b0; zoom_xyz[6][4][1] = 1'b0; zoom_xyz[7][4][1] = 1'b1;
                zoom_xyz[0][5][1] = 1'b1; zoom_xyz[1][5][1] = 1'b0; zoom_xyz[2][5][1] = 1'b0; zoom_xyz[3][5][1] = 1'b0; zoom_xyz[4][5][1] = 1'b0; zoom_xyz[5][5][1] = 1'b0; zoom_xyz[6][5][1] = 1'b0; zoom_xyz[7][5][1] = 1'b1;
                zoom_xyz[0][6][1] = 1'b1; zoom_xyz[1][6][1] = 1'b0; zoom_xyz[2][6][1] = 1'b0; zoom_xyz[3][6][1] = 1'b0; zoom_xyz[4][6][1] = 1'b0; zoom_xyz[5][6][1] = 1'b0; zoom_xyz[6][6][1] = 1'b0; zoom_xyz[7][6][1] = 1'b1;
                zoom_xyz[0][7][1] = 1'b1; zoom_xyz[1][7][1] = 1'b1; zoom_xyz[2][7][1] = 1'b1; zoom_xyz[3][7][1] = 1'b1; zoom_xyz[4][7][1] = 1'b1; zoom_xyz[5][7][1] = 1'b1; zoom_xyz[6][7][1] = 1'b1; zoom_xyz[7][7][1] = 1'b1;
                zoom_xyz[0][0][2] = 1'b1; zoom_xyz[1][0][2] = 1'b1; zoom_xyz[2][0][2] = 1'b1; zoom_xyz[3][0][2] = 1'b1; zoom_xyz[4][0][2] = 1'b1; zoom_xyz[5][0][2] = 1'b1; zoom_xyz[6][0][2] = 1'b1; zoom_xyz[7][0][2] = 1'b1;
                zoom_xyz[0][1][2] = 1'b1; zoom_xyz[1][1][2] = 1'b0; zoom_xyz[2][1][2] = 1'b0; zoom_xyz[3][1][2] = 1'b0; zoom_xyz[4][1][2] = 1'b0; zoom_xyz[5][1][2] = 1'b0; zoom_xyz[6][1][2] = 1'b0; zoom_xyz[7][1][2] = 1'b1;
                zoom_xyz[0][2][2] = 1'b1; zoom_xyz[1][2][2] = 1'b0; zoom_xyz[2][2][2] = 1'b0; zoom_xyz[3][2][2] = 1'b0; zoom_xyz[4][2][2] = 1'b0; zoom_xyz[5][2][2] = 1'b0; zoom_xyz[6][2][2] = 1'b0; zoom_xyz[7][2][2] = 1'b1;
                zoom_xyz[0][3][2] = 1'b1; zoom_xyz[1][3][2] = 1'b0; zoom_xyz[2][3][2] = 1'b0; zoom_xyz[3][3][2] = 1'b0; zoom_xyz[4][3][2] = 1'b0; zoom_xyz[5][3][2] = 1'b0; zoom_xyz[6][3][2] = 1'b0; zoom_xyz[7][3][2] = 1'b1;
                zoom_xyz[0][4][2] = 1'b1; zoom_xyz[1][4][2] = 1'b0; zoom_xyz[2][4][2] = 1'b0; zoom_xyz[3][4][2] = 1'b0; zoom_xyz[4][4][2] = 1'b0; zoom_xyz[5][4][2] = 1'b0; zoom_xyz[6][4][2] = 1'b0; zoom_xyz[7][4][2] = 1'b1;
                zoom_xyz[0][5][2] = 1'b1; zoom_xyz[1][5][2] = 1'b0; zoom_xyz[2][5][2] = 1'b0; zoom_xyz[3][5][2] = 1'b0; zoom_xyz[4][5][2] = 1'b0; zoom_xyz[5][5][2] = 1'b0; zoom_xyz[6][5][2] = 1'b0; zoom_xyz[7][5][2] = 1'b1;
                zoom_xyz[0][6][2] = 1'b1; zoom_xyz[1][6][2] = 1'b0; zoom_xyz[2][6][2] = 1'b0; zoom_xyz[3][6][2] = 1'b0; zoom_xyz[4][6][2] = 1'b0; zoom_xyz[5][6][2] = 1'b0; zoom_xyz[6][6][2] = 1'b0; zoom_xyz[7][6][2] = 1'b1;
                zoom_xyz[0][7][2] = 1'b1; zoom_xyz[1][7][2] = 1'b1; zoom_xyz[2][7][2] = 1'b1; zoom_xyz[3][7][2] = 1'b1; zoom_xyz[4][7][2] = 1'b1; zoom_xyz[5][7][2] = 1'b1; zoom_xyz[6][7][2] = 1'b1; zoom_xyz[7][7][2] = 1'b1;
                zoom_xyz[0][0][3] = 1'b1; zoom_xyz[1][0][3] = 1'b1; zoom_xyz[2][0][3] = 1'b1; zoom_xyz[3][0][3] = 1'b1; zoom_xyz[4][0][3] = 1'b1; zoom_xyz[5][0][3] = 1'b1; zoom_xyz[6][0][3] = 1'b1; zoom_xyz[7][0][3] = 1'b1;
                zoom_xyz[0][1][3] = 1'b1; zoom_xyz[1][1][3] = 1'b0; zoom_xyz[2][1][3] = 1'b0; zoom_xyz[3][1][3] = 1'b0; zoom_xyz[4][1][3] = 1'b0; zoom_xyz[5][1][3] = 1'b0; zoom_xyz[6][1][3] = 1'b0; zoom_xyz[7][1][3] = 1'b1;
                zoom_xyz[0][2][3] = 1'b1; zoom_xyz[1][2][3] = 1'b0; zoom_xyz[2][2][3] = 1'b0; zoom_xyz[3][2][3] = 1'b0; zoom_xyz[4][2][3] = 1'b0; zoom_xyz[5][2][3] = 1'b0; zoom_xyz[6][2][3] = 1'b0; zoom_xyz[7][2][3] = 1'b1;
                zoom_xyz[0][3][3] = 1'b1; zoom_xyz[1][3][3] = 1'b0; zoom_xyz[2][3][3] = 1'b0; zoom_xyz[3][3][3] = 1'b0; zoom_xyz[4][3][3] = 1'b0; zoom_xyz[5][3][3] = 1'b0; zoom_xyz[6][3][3] = 1'b0; zoom_xyz[7][3][3] = 1'b1;
                zoom_xyz[0][4][3] = 1'b1; zoom_xyz[1][4][3] = 1'b0; zoom_xyz[2][4][3] = 1'b0; zoom_xyz[3][4][3] = 1'b0; zoom_xyz[4][4][3] = 1'b0; zoom_xyz[5][4][3] = 1'b0; zoom_xyz[6][4][3] = 1'b0; zoom_xyz[7][4][3] = 1'b1;
                zoom_xyz[0][5][3] = 1'b1; zoom_xyz[1][5][3] = 1'b0; zoom_xyz[2][5][3] = 1'b0; zoom_xyz[3][5][3] = 1'b0; zoom_xyz[4][5][3] = 1'b0; zoom_xyz[5][5][3] = 1'b0; zoom_xyz[6][5][3] = 1'b0; zoom_xyz[7][5][3] = 1'b1;
                zoom_xyz[0][6][3] = 1'b1; zoom_xyz[1][6][3] = 1'b0; zoom_xyz[2][6][3] = 1'b0; zoom_xyz[3][6][3] = 1'b0; zoom_xyz[4][6][3] = 1'b0; zoom_xyz[5][6][3] = 1'b0; zoom_xyz[6][6][3] = 1'b0; zoom_xyz[7][6][3] = 1'b1;
                zoom_xyz[0][7][3] = 1'b1; zoom_xyz[1][7][3] = 1'b1; zoom_xyz[2][7][3] = 1'b1; zoom_xyz[3][7][3] = 1'b1; zoom_xyz[4][7][3] = 1'b1; zoom_xyz[5][7][3] = 1'b1; zoom_xyz[6][7][3] = 1'b1; zoom_xyz[7][7][3] = 1'b1;
                zoom_xyz[0][0][4] = 1'b1; zoom_xyz[1][0][4] = 1'b1; zoom_xyz[2][0][4] = 1'b1; zoom_xyz[3][0][4] = 1'b1; zoom_xyz[4][0][4] = 1'b1; zoom_xyz[5][0][4] = 1'b1; zoom_xyz[6][0][4] = 1'b1; zoom_xyz[7][0][4] = 1'b1;
                zoom_xyz[0][1][4] = 1'b1; zoom_xyz[1][1][4] = 1'b0; zoom_xyz[2][1][4] = 1'b0; zoom_xyz[3][1][4] = 1'b0; zoom_xyz[4][1][4] = 1'b0; zoom_xyz[5][1][4] = 1'b0; zoom_xyz[6][1][4] = 1'b0; zoom_xyz[7][1][4] = 1'b1;
                zoom_xyz[0][2][4] = 1'b1; zoom_xyz[1][2][4] = 1'b0; zoom_xyz[2][2][4] = 1'b0; zoom_xyz[3][2][4] = 1'b0; zoom_xyz[4][2][4] = 1'b0; zoom_xyz[5][2][4] = 1'b0; zoom_xyz[6][2][4] = 1'b0; zoom_xyz[7][2][4] = 1'b1;
                zoom_xyz[0][3][4] = 1'b1; zoom_xyz[1][3][4] = 1'b0; zoom_xyz[2][3][4] = 1'b0; zoom_xyz[3][3][4] = 1'b0; zoom_xyz[4][3][4] = 1'b0; zoom_xyz[5][3][4] = 1'b0; zoom_xyz[6][3][4] = 1'b0; zoom_xyz[7][3][4] = 1'b1;
                zoom_xyz[0][4][4] = 1'b1; zoom_xyz[1][4][4] = 1'b0; zoom_xyz[2][4][4] = 1'b0; zoom_xyz[3][4][4] = 1'b0; zoom_xyz[4][4][4] = 1'b0; zoom_xyz[5][4][4] = 1'b0; zoom_xyz[6][4][4] = 1'b0; zoom_xyz[7][4][4] = 1'b1;
                zoom_xyz[0][5][4] = 1'b1; zoom_xyz[1][5][4] = 1'b0; zoom_xyz[2][5][4] = 1'b0; zoom_xyz[3][5][4] = 1'b0; zoom_xyz[4][5][4] = 1'b0; zoom_xyz[5][5][4] = 1'b0; zoom_xyz[6][5][4] = 1'b0; zoom_xyz[7][5][4] = 1'b1;
                zoom_xyz[0][6][4] = 1'b1; zoom_xyz[1][6][4] = 1'b0; zoom_xyz[2][6][4] = 1'b0; zoom_xyz[3][6][4] = 1'b0; zoom_xyz[4][6][4] = 1'b0; zoom_xyz[5][6][4] = 1'b0; zoom_xyz[6][6][4] = 1'b0; zoom_xyz[7][6][4] = 1'b1;
                zoom_xyz[0][7][4] = 1'b1; zoom_xyz[1][7][4] = 1'b1; zoom_xyz[2][7][4] = 1'b1; zoom_xyz[3][7][4] = 1'b1; zoom_xyz[4][7][4] = 1'b1; zoom_xyz[5][7][4] = 1'b1; zoom_xyz[6][7][4] = 1'b1; zoom_xyz[7][7][4] = 1'b1;
                zoom_xyz[0][0][5] = 1'b1; zoom_xyz[1][0][5] = 1'b1; zoom_xyz[2][0][5] = 1'b1; zoom_xyz[3][0][5] = 1'b1; zoom_xyz[4][0][5] = 1'b1; zoom_xyz[5][0][5] = 1'b1; zoom_xyz[6][0][5] = 1'b1; zoom_xyz[7][0][5] = 1'b1;
                zoom_xyz[0][1][5] = 1'b1; zoom_xyz[1][1][5] = 1'b0; zoom_xyz[2][1][5] = 1'b0; zoom_xyz[3][1][5] = 1'b0; zoom_xyz[4][1][5] = 1'b0; zoom_xyz[5][1][5] = 1'b0; zoom_xyz[6][1][5] = 1'b0; zoom_xyz[7][1][5] = 1'b1;
                zoom_xyz[0][2][5] = 1'b1; zoom_xyz[1][2][5] = 1'b0; zoom_xyz[2][2][5] = 1'b0; zoom_xyz[3][2][5] = 1'b0; zoom_xyz[4][2][5] = 1'b0; zoom_xyz[5][2][5] = 1'b0; zoom_xyz[6][2][5] = 1'b0; zoom_xyz[7][2][5] = 1'b1;
                zoom_xyz[0][3][5] = 1'b1; zoom_xyz[1][3][5] = 1'b0; zoom_xyz[2][3][5] = 1'b0; zoom_xyz[3][3][5] = 1'b0; zoom_xyz[4][3][5] = 1'b0; zoom_xyz[5][3][5] = 1'b0; zoom_xyz[6][3][5] = 1'b0; zoom_xyz[7][3][5] = 1'b1;
                zoom_xyz[0][4][5] = 1'b1; zoom_xyz[1][4][5] = 1'b0; zoom_xyz[2][4][5] = 1'b0; zoom_xyz[3][4][5] = 1'b0; zoom_xyz[4][4][5] = 1'b0; zoom_xyz[5][4][5] = 1'b0; zoom_xyz[6][4][5] = 1'b0; zoom_xyz[7][4][5] = 1'b1;
                zoom_xyz[0][5][5] = 1'b1; zoom_xyz[1][5][5] = 1'b0; zoom_xyz[2][5][5] = 1'b0; zoom_xyz[3][5][5] = 1'b0; zoom_xyz[4][5][5] = 1'b0; zoom_xyz[5][5][5] = 1'b0; zoom_xyz[6][5][5] = 1'b0; zoom_xyz[7][5][5] = 1'b1;
                zoom_xyz[0][6][5] = 1'b1; zoom_xyz[1][6][5] = 1'b0; zoom_xyz[2][6][5] = 1'b0; zoom_xyz[3][6][5] = 1'b0; zoom_xyz[4][6][5] = 1'b0; zoom_xyz[5][6][5] = 1'b0; zoom_xyz[6][6][5] = 1'b0; zoom_xyz[7][6][5] = 1'b1;
                zoom_xyz[0][7][5] = 1'b1; zoom_xyz[1][7][5] = 1'b1; zoom_xyz[2][7][5] = 1'b1; zoom_xyz[3][7][5] = 1'b1; zoom_xyz[4][7][5] = 1'b1; zoom_xyz[5][7][5] = 1'b1; zoom_xyz[6][7][5] = 1'b1; zoom_xyz[7][7][5] = 1'b1;
                zoom_xyz[0][0][6] = 1'b1; zoom_xyz[1][0][6] = 1'b1; zoom_xyz[2][0][6] = 1'b1; zoom_xyz[3][0][6] = 1'b1; zoom_xyz[4][0][6] = 1'b1; zoom_xyz[5][0][6] = 1'b1; zoom_xyz[6][0][6] = 1'b1; zoom_xyz[7][0][6] = 1'b1;
                zoom_xyz[0][1][6] = 1'b1; zoom_xyz[1][1][6] = 1'b0; zoom_xyz[2][1][6] = 1'b0; zoom_xyz[3][1][6] = 1'b0; zoom_xyz[4][1][6] = 1'b0; zoom_xyz[5][1][6] = 1'b0; zoom_xyz[6][1][6] = 1'b0; zoom_xyz[7][1][6] = 1'b1;
                zoom_xyz[0][2][6] = 1'b1; zoom_xyz[1][2][6] = 1'b0; zoom_xyz[2][2][6] = 1'b0; zoom_xyz[3][2][6] = 1'b0; zoom_xyz[4][2][6] = 1'b0; zoom_xyz[5][2][6] = 1'b0; zoom_xyz[6][2][6] = 1'b0; zoom_xyz[7][2][6] = 1'b1;
                zoom_xyz[0][3][6] = 1'b1; zoom_xyz[1][3][6] = 1'b0; zoom_xyz[2][3][6] = 1'b0; zoom_xyz[3][3][6] = 1'b0; zoom_xyz[4][3][6] = 1'b0; zoom_xyz[5][3][6] = 1'b0; zoom_xyz[6][3][6] = 1'b0; zoom_xyz[7][3][6] = 1'b1;
                zoom_xyz[0][4][6] = 1'b1; zoom_xyz[1][4][6] = 1'b0; zoom_xyz[2][4][6] = 1'b0; zoom_xyz[3][4][6] = 1'b0; zoom_xyz[4][4][6] = 1'b0; zoom_xyz[5][4][6] = 1'b0; zoom_xyz[6][4][6] = 1'b0; zoom_xyz[7][4][6] = 1'b1;
                zoom_xyz[0][5][6] = 1'b1; zoom_xyz[1][5][6] = 1'b0; zoom_xyz[2][5][6] = 1'b0; zoom_xyz[3][5][6] = 1'b0; zoom_xyz[4][5][6] = 1'b0; zoom_xyz[5][5][6] = 1'b0; zoom_xyz[6][5][6] = 1'b0; zoom_xyz[7][5][6] = 1'b1;
                zoom_xyz[0][6][6] = 1'b1; zoom_xyz[1][6][6] = 1'b0; zoom_xyz[2][6][6] = 1'b0; zoom_xyz[3][6][6] = 1'b0; zoom_xyz[4][6][6] = 1'b0; zoom_xyz[5][6][6] = 1'b0; zoom_xyz[6][6][6] = 1'b0; zoom_xyz[7][6][6] = 1'b1;
                zoom_xyz[0][7][6] = 1'b1; zoom_xyz[1][7][6] = 1'b1; zoom_xyz[2][7][6] = 1'b1; zoom_xyz[3][7][6] = 1'b1; zoom_xyz[4][7][6] = 1'b1; zoom_xyz[5][7][6] = 1'b1; zoom_xyz[6][7][6] = 1'b1; zoom_xyz[7][7][6] = 1'b1;
                zoom_xyz[0][0][7] = 1'b1; zoom_xyz[1][0][7] = 1'b1; zoom_xyz[2][0][7] = 1'b1; zoom_xyz[3][0][7] = 1'b1; zoom_xyz[4][0][7] = 1'b1; zoom_xyz[5][0][7] = 1'b1; zoom_xyz[6][0][7] = 1'b1; zoom_xyz[7][0][7] = 1'b1;
                zoom_xyz[0][1][7] = 1'b1; zoom_xyz[1][1][7] = 1'b1; zoom_xyz[2][1][7] = 1'b1; zoom_xyz[3][1][7] = 1'b1; zoom_xyz[4][1][7] = 1'b1; zoom_xyz[5][1][7] = 1'b1; zoom_xyz[6][1][7] = 1'b1; zoom_xyz[7][1][7] = 1'b1;
                zoom_xyz[0][2][7] = 1'b1; zoom_xyz[1][2][7] = 1'b1; zoom_xyz[2][2][7] = 1'b1; zoom_xyz[3][2][7] = 1'b1; zoom_xyz[4][2][7] = 1'b1; zoom_xyz[5][2][7] = 1'b1; zoom_xyz[6][2][7] = 1'b1; zoom_xyz[7][2][7] = 1'b1;
                zoom_xyz[0][3][7] = 1'b1; zoom_xyz[1][3][7] = 1'b1; zoom_xyz[2][3][7] = 1'b1; zoom_xyz[3][3][7] = 1'b1; zoom_xyz[4][3][7] = 1'b1; zoom_xyz[5][3][7] = 1'b1; zoom_xyz[6][3][7] = 1'b1; zoom_xyz[7][3][7] = 1'b1;
                zoom_xyz[0][4][7] = 1'b1; zoom_xyz[1][4][7] = 1'b1; zoom_xyz[2][4][7] = 1'b1; zoom_xyz[3][4][7] = 1'b1; zoom_xyz[4][4][7] = 1'b1; zoom_xyz[5][4][7] = 1'b1; zoom_xyz[6][4][7] = 1'b1; zoom_xyz[7][4][7] = 1'b1;
                zoom_xyz[0][5][7] = 1'b1; zoom_xyz[1][5][7] = 1'b1; zoom_xyz[2][5][7] = 1'b1; zoom_xyz[3][5][7] = 1'b1; zoom_xyz[4][5][7] = 1'b1; zoom_xyz[5][5][7] = 1'b1; zoom_xyz[6][5][7] = 1'b1; zoom_xyz[7][5][7] = 1'b1;
                zoom_xyz[0][6][7] = 1'b1; zoom_xyz[1][6][7] = 1'b1; zoom_xyz[2][6][7] = 1'b1; zoom_xyz[3][6][7] = 1'b1; zoom_xyz[4][6][7] = 1'b1; zoom_xyz[5][6][7] = 1'b1; zoom_xyz[6][6][7] = 1'b1; zoom_xyz[7][6][7] = 1'b1;
                zoom_xyz[0][7][7] = 1'b1; zoom_xyz[1][7][7] = 1'b1; zoom_xyz[2][7][7] = 1'b1; zoom_xyz[3][7][7] = 1'b1; zoom_xyz[4][7][7] = 1'b1; zoom_xyz[5][7][7] = 1'b1; zoom_xyz[6][7][7] = 1'b1; zoom_xyz[7][7][7] = 1'b1;
            end
            3'd1: begin     
                zoom_xyz[0][0][0] = 1'b0; zoom_xyz[1][0][0] = 1'b0; zoom_xyz[2][0][0] = 1'b0; zoom_xyz[3][0][0] = 1'b0; zoom_xyz[4][0][0] = 1'b0; zoom_xyz[5][0][0] = 1'b0; zoom_xyz[6][0][0] = 1'b0; zoom_xyz[7][0][0] = 1'b0;
                zoom_xyz[0][1][0] = 1'b0; zoom_xyz[1][1][0] = 1'b0; zoom_xyz[2][1][0] = 1'b0; zoom_xyz[3][1][0] = 1'b0; zoom_xyz[4][1][0] = 1'b0; zoom_xyz[5][1][0] = 1'b0; zoom_xyz[6][1][0] = 1'b0; zoom_xyz[7][1][0] = 1'b0;
                zoom_xyz[0][2][0] = 1'b0; zoom_xyz[1][2][0] = 1'b0; zoom_xyz[2][2][0] = 1'b0; zoom_xyz[3][2][0] = 1'b0; zoom_xyz[4][2][0] = 1'b0; zoom_xyz[5][2][0] = 1'b0; zoom_xyz[6][2][0] = 1'b0; zoom_xyz[7][2][0] = 1'b0;
                zoom_xyz[0][3][0] = 1'b0; zoom_xyz[1][3][0] = 1'b0; zoom_xyz[2][3][0] = 1'b0; zoom_xyz[3][3][0] = 1'b0; zoom_xyz[4][3][0] = 1'b0; zoom_xyz[5][3][0] = 1'b0; zoom_xyz[6][3][0] = 1'b0; zoom_xyz[7][3][0] = 1'b0;
                zoom_xyz[0][4][0] = 1'b0; zoom_xyz[1][4][0] = 1'b0; zoom_xyz[2][4][0] = 1'b0; zoom_xyz[3][4][0] = 1'b0; zoom_xyz[4][4][0] = 1'b0; zoom_xyz[5][4][0] = 1'b0; zoom_xyz[6][4][0] = 1'b0; zoom_xyz[7][4][0] = 1'b0;
                zoom_xyz[0][5][0] = 1'b0; zoom_xyz[1][5][0] = 1'b0; zoom_xyz[2][5][0] = 1'b0; zoom_xyz[3][5][0] = 1'b0; zoom_xyz[4][5][0] = 1'b0; zoom_xyz[5][5][0] = 1'b0; zoom_xyz[6][5][0] = 1'b0; zoom_xyz[7][5][0] = 1'b0;
                zoom_xyz[0][6][0] = 1'b0; zoom_xyz[1][6][0] = 1'b0; zoom_xyz[2][6][0] = 1'b0; zoom_xyz[3][6][0] = 1'b0; zoom_xyz[4][6][0] = 1'b0; zoom_xyz[5][6][0] = 1'b0; zoom_xyz[6][6][0] = 1'b0; zoom_xyz[7][6][0] = 1'b0;
                zoom_xyz[0][7][0] = 1'b0; zoom_xyz[1][7][0] = 1'b0; zoom_xyz[2][7][0] = 1'b0; zoom_xyz[3][7][0] = 1'b0; zoom_xyz[4][7][0] = 1'b0; zoom_xyz[5][7][0] = 1'b0; zoom_xyz[6][7][0] = 1'b0; zoom_xyz[7][7][0] = 1'b0;
                zoom_xyz[0][0][1] = 1'b0; zoom_xyz[1][0][1] = 1'b0; zoom_xyz[2][0][1] = 1'b0; zoom_xyz[3][0][1] = 1'b0; zoom_xyz[4][0][1] = 1'b0; zoom_xyz[5][0][1] = 1'b0; zoom_xyz[6][0][1] = 1'b0; zoom_xyz[7][0][1] = 1'b0;
                zoom_xyz[0][1][1] = 1'b0; zoom_xyz[1][1][1] = 1'b1; zoom_xyz[2][1][1] = 1'b1; zoom_xyz[3][1][1] = 1'b1; zoom_xyz[4][1][1] = 1'b1; zoom_xyz[5][1][1] = 1'b1; zoom_xyz[6][1][1] = 1'b1; zoom_xyz[7][1][1] = 1'b0;
                zoom_xyz[0][2][1] = 1'b0; zoom_xyz[1][2][1] = 1'b1; zoom_xyz[2][2][1] = 1'b1; zoom_xyz[3][2][1] = 1'b1; zoom_xyz[4][2][1] = 1'b1; zoom_xyz[5][2][1] = 1'b1; zoom_xyz[6][2][1] = 1'b1; zoom_xyz[7][2][1] = 1'b0;
                zoom_xyz[0][3][1] = 1'b0; zoom_xyz[1][3][1] = 1'b1; zoom_xyz[2][3][1] = 1'b1; zoom_xyz[3][3][1] = 1'b1; zoom_xyz[4][3][1] = 1'b1; zoom_xyz[5][3][1] = 1'b1; zoom_xyz[6][3][1] = 1'b1; zoom_xyz[7][3][1] = 1'b0;
                zoom_xyz[0][4][1] = 1'b0; zoom_xyz[1][4][1] = 1'b1; zoom_xyz[2][4][1] = 1'b1; zoom_xyz[3][4][1] = 1'b1; zoom_xyz[4][4][1] = 1'b1; zoom_xyz[5][4][1] = 1'b1; zoom_xyz[6][4][1] = 1'b1; zoom_xyz[7][4][1] = 1'b0;
                zoom_xyz[0][5][1] = 1'b0; zoom_xyz[1][5][1] = 1'b1; zoom_xyz[2][5][1] = 1'b1; zoom_xyz[3][5][1] = 1'b1; zoom_xyz[4][5][1] = 1'b1; zoom_xyz[5][5][1] = 1'b1; zoom_xyz[6][5][1] = 1'b1; zoom_xyz[7][5][1] = 1'b0;
                zoom_xyz[0][6][1] = 1'b0; zoom_xyz[1][6][1] = 1'b1; zoom_xyz[2][6][1] = 1'b1; zoom_xyz[3][6][1] = 1'b1; zoom_xyz[4][6][1] = 1'b1; zoom_xyz[5][6][1] = 1'b1; zoom_xyz[6][6][1] = 1'b1; zoom_xyz[7][6][1] = 1'b0;
                zoom_xyz[0][7][1] = 1'b0; zoom_xyz[1][7][1] = 1'b0; zoom_xyz[2][7][1] = 1'b0; zoom_xyz[3][7][1] = 1'b0; zoom_xyz[4][7][1] = 1'b0; zoom_xyz[5][7][1] = 1'b0; zoom_xyz[6][7][1] = 1'b0; zoom_xyz[7][7][1] = 1'b0;
                zoom_xyz[0][0][2] = 1'b0; zoom_xyz[1][0][2] = 1'b0; zoom_xyz[2][0][2] = 1'b0; zoom_xyz[3][0][2] = 1'b0; zoom_xyz[4][0][2] = 1'b0; zoom_xyz[5][0][2] = 1'b0; zoom_xyz[6][0][2] = 1'b0; zoom_xyz[7][0][2] = 1'b0;
                zoom_xyz[0][1][2] = 1'b0; zoom_xyz[1][1][2] = 1'b1; zoom_xyz[2][1][2] = 1'b1; zoom_xyz[3][1][2] = 1'b1; zoom_xyz[4][1][2] = 1'b1; zoom_xyz[5][1][2] = 1'b1; zoom_xyz[6][1][2] = 1'b1; zoom_xyz[7][1][2] = 1'b0;
                zoom_xyz[0][2][2] = 1'b0; zoom_xyz[1][2][2] = 1'b1; zoom_xyz[2][2][2] = 1'b0; zoom_xyz[3][2][2] = 1'b0; zoom_xyz[4][2][2] = 1'b0; zoom_xyz[5][2][2] = 1'b0; zoom_xyz[6][2][2] = 1'b1; zoom_xyz[7][2][2] = 1'b0;
                zoom_xyz[0][3][2] = 1'b0; zoom_xyz[1][3][2] = 1'b1; zoom_xyz[2][3][2] = 1'b0; zoom_xyz[3][3][2] = 1'b0; zoom_xyz[4][3][2] = 1'b0; zoom_xyz[5][3][2] = 1'b0; zoom_xyz[6][3][2] = 1'b1; zoom_xyz[7][3][2] = 1'b0;
                zoom_xyz[0][4][2] = 1'b0; zoom_xyz[1][4][2] = 1'b1; zoom_xyz[2][4][2] = 1'b0; zoom_xyz[3][4][2] = 1'b0; zoom_xyz[4][4][2] = 1'b0; zoom_xyz[5][4][2] = 1'b0; zoom_xyz[6][4][2] = 1'b1; zoom_xyz[7][4][2] = 1'b0;
                zoom_xyz[0][5][2] = 1'b0; zoom_xyz[1][5][2] = 1'b1; zoom_xyz[2][5][2] = 1'b0; zoom_xyz[3][5][2] = 1'b0; zoom_xyz[4][5][2] = 1'b0; zoom_xyz[5][5][2] = 1'b0; zoom_xyz[6][5][2] = 1'b1; zoom_xyz[7][5][2] = 1'b0;
                zoom_xyz[0][6][2] = 1'b0; zoom_xyz[1][6][2] = 1'b1; zoom_xyz[2][6][2] = 1'b1; zoom_xyz[3][6][2] = 1'b1; zoom_xyz[4][6][2] = 1'b1; zoom_xyz[5][6][2] = 1'b1; zoom_xyz[6][6][2] = 1'b1; zoom_xyz[7][6][2] = 1'b0;
                zoom_xyz[0][7][2] = 1'b0; zoom_xyz[1][7][2] = 1'b0; zoom_xyz[2][7][2] = 1'b0; zoom_xyz[3][7][2] = 1'b0; zoom_xyz[4][7][2] = 1'b0; zoom_xyz[5][7][2] = 1'b0; zoom_xyz[6][7][2] = 1'b0; zoom_xyz[7][7][2] = 1'b0;
                zoom_xyz[0][0][3] = 1'b0; zoom_xyz[1][0][3] = 1'b0; zoom_xyz[2][0][3] = 1'b0; zoom_xyz[3][0][3] = 1'b0; zoom_xyz[4][0][3] = 1'b0; zoom_xyz[5][0][3] = 1'b0; zoom_xyz[6][0][3] = 1'b0; zoom_xyz[7][0][3] = 1'b0;
                zoom_xyz[0][1][3] = 1'b0; zoom_xyz[1][1][3] = 1'b1; zoom_xyz[2][1][3] = 1'b1; zoom_xyz[3][1][3] = 1'b1; zoom_xyz[4][1][3] = 1'b1; zoom_xyz[5][1][3] = 1'b1; zoom_xyz[6][1][3] = 1'b1; zoom_xyz[7][1][3] = 1'b0;
                zoom_xyz[0][2][3] = 1'b0; zoom_xyz[1][2][3] = 1'b1; zoom_xyz[2][2][3] = 1'b0; zoom_xyz[3][2][3] = 1'b0; zoom_xyz[4][2][3] = 1'b0; zoom_xyz[5][2][3] = 1'b0; zoom_xyz[6][2][3] = 1'b1; zoom_xyz[7][2][3] = 1'b0;
                zoom_xyz[0][3][3] = 1'b0; zoom_xyz[1][3][3] = 1'b1; zoom_xyz[2][3][3] = 1'b0; zoom_xyz[3][3][3] = 1'b0; zoom_xyz[4][3][3] = 1'b0; zoom_xyz[5][3][3] = 1'b0; zoom_xyz[6][3][3] = 1'b1; zoom_xyz[7][3][3] = 1'b0;
                zoom_xyz[0][4][3] = 1'b0; zoom_xyz[1][4][3] = 1'b1; zoom_xyz[2][4][3] = 1'b0; zoom_xyz[3][4][3] = 1'b0; zoom_xyz[4][4][3] = 1'b0; zoom_xyz[5][4][3] = 1'b0; zoom_xyz[6][4][3] = 1'b1; zoom_xyz[7][4][3] = 1'b0;
                zoom_xyz[0][5][3] = 1'b0; zoom_xyz[1][5][3] = 1'b1; zoom_xyz[2][5][3] = 1'b0; zoom_xyz[3][5][3] = 1'b0; zoom_xyz[4][5][3] = 1'b0; zoom_xyz[5][5][3] = 1'b0; zoom_xyz[6][5][3] = 1'b1; zoom_xyz[7][5][3] = 1'b0;
                zoom_xyz[0][6][3] = 1'b0; zoom_xyz[1][6][3] = 1'b1; zoom_xyz[2][6][3] = 1'b1; zoom_xyz[3][6][3] = 1'b1; zoom_xyz[4][6][3] = 1'b1; zoom_xyz[5][6][3] = 1'b1; zoom_xyz[6][6][3] = 1'b1; zoom_xyz[7][6][3] = 1'b0;
                zoom_xyz[0][7][3] = 1'b0; zoom_xyz[1][7][3] = 1'b0; zoom_xyz[2][7][3] = 1'b0; zoom_xyz[3][7][3] = 1'b0; zoom_xyz[4][7][3] = 1'b0; zoom_xyz[5][7][3] = 1'b0; zoom_xyz[6][7][3] = 1'b0; zoom_xyz[7][7][3] = 1'b0;
                zoom_xyz[0][0][4] = 1'b0; zoom_xyz[1][0][4] = 1'b0; zoom_xyz[2][0][4] = 1'b0; zoom_xyz[3][0][4] = 1'b0; zoom_xyz[4][0][4] = 1'b0; zoom_xyz[5][0][4] = 1'b0; zoom_xyz[6][0][4] = 1'b0; zoom_xyz[7][0][4] = 1'b0;
                zoom_xyz[0][1][4] = 1'b0; zoom_xyz[1][1][4] = 1'b1; zoom_xyz[2][1][4] = 1'b1; zoom_xyz[3][1][4] = 1'b1; zoom_xyz[4][1][4] = 1'b1; zoom_xyz[5][1][4] = 1'b1; zoom_xyz[6][1][4] = 1'b1; zoom_xyz[7][1][4] = 1'b0;
                zoom_xyz[0][2][4] = 1'b0; zoom_xyz[1][2][4] = 1'b1; zoom_xyz[2][2][4] = 1'b0; zoom_xyz[3][2][4] = 1'b0; zoom_xyz[4][2][4] = 1'b0; zoom_xyz[5][2][4] = 1'b0; zoom_xyz[6][2][4] = 1'b1; zoom_xyz[7][2][4] = 1'b0;
                zoom_xyz[0][3][4] = 1'b0; zoom_xyz[1][3][4] = 1'b1; zoom_xyz[2][3][4] = 1'b0; zoom_xyz[3][3][4] = 1'b0; zoom_xyz[4][3][4] = 1'b0; zoom_xyz[5][3][4] = 1'b0; zoom_xyz[6][3][4] = 1'b1; zoom_xyz[7][3][4] = 1'b0;
                zoom_xyz[0][4][4] = 1'b0; zoom_xyz[1][4][4] = 1'b1; zoom_xyz[2][4][4] = 1'b0; zoom_xyz[3][4][4] = 1'b0; zoom_xyz[4][4][4] = 1'b0; zoom_xyz[5][4][4] = 1'b0; zoom_xyz[6][4][4] = 1'b1; zoom_xyz[7][4][4] = 1'b0;
                zoom_xyz[0][5][4] = 1'b0; zoom_xyz[1][5][4] = 1'b1; zoom_xyz[2][5][4] = 1'b0; zoom_xyz[3][5][4] = 1'b0; zoom_xyz[4][5][4] = 1'b0; zoom_xyz[5][5][4] = 1'b0; zoom_xyz[6][5][4] = 1'b1; zoom_xyz[7][5][4] = 1'b0;
                zoom_xyz[0][6][4] = 1'b0; zoom_xyz[1][6][4] = 1'b1; zoom_xyz[2][6][4] = 1'b1; zoom_xyz[3][6][4] = 1'b1; zoom_xyz[4][6][4] = 1'b1; zoom_xyz[5][6][4] = 1'b1; zoom_xyz[6][6][4] = 1'b1; zoom_xyz[7][6][4] = 1'b0;
                zoom_xyz[0][7][4] = 1'b0; zoom_xyz[1][7][4] = 1'b0; zoom_xyz[2][7][4] = 1'b0; zoom_xyz[3][7][4] = 1'b0; zoom_xyz[4][7][4] = 1'b0; zoom_xyz[5][7][4] = 1'b0; zoom_xyz[6][7][4] = 1'b0; zoom_xyz[7][7][4] = 1'b0;
                zoom_xyz[0][0][5] = 1'b0; zoom_xyz[1][0][5] = 1'b0; zoom_xyz[2][0][5] = 1'b0; zoom_xyz[3][0][5] = 1'b0; zoom_xyz[4][0][5] = 1'b0; zoom_xyz[5][0][5] = 1'b0; zoom_xyz[6][0][5] = 1'b0; zoom_xyz[7][0][5] = 1'b0;
                zoom_xyz[0][1][5] = 1'b0; zoom_xyz[1][1][5] = 1'b1; zoom_xyz[2][1][5] = 1'b1; zoom_xyz[3][1][5] = 1'b1; zoom_xyz[4][1][5] = 1'b1; zoom_xyz[5][1][5] = 1'b1; zoom_xyz[6][1][5] = 1'b1; zoom_xyz[7][1][5] = 1'b0;
                zoom_xyz[0][2][5] = 1'b0; zoom_xyz[1][2][5] = 1'b1; zoom_xyz[2][2][5] = 1'b0; zoom_xyz[3][2][5] = 1'b0; zoom_xyz[4][2][5] = 1'b0; zoom_xyz[5][2][5] = 1'b0; zoom_xyz[6][2][5] = 1'b1; zoom_xyz[7][2][5] = 1'b0;
                zoom_xyz[0][3][5] = 1'b0; zoom_xyz[1][3][5] = 1'b1; zoom_xyz[2][3][5] = 1'b0; zoom_xyz[3][3][5] = 1'b0; zoom_xyz[4][3][5] = 1'b0; zoom_xyz[5][3][5] = 1'b0; zoom_xyz[6][3][5] = 1'b1; zoom_xyz[7][3][5] = 1'b0;
                zoom_xyz[0][4][5] = 1'b0; zoom_xyz[1][4][5] = 1'b1; zoom_xyz[2][4][5] = 1'b0; zoom_xyz[3][4][5] = 1'b0; zoom_xyz[4][4][5] = 1'b0; zoom_xyz[5][4][5] = 1'b0; zoom_xyz[6][4][5] = 1'b1; zoom_xyz[7][4][5] = 1'b0;
                zoom_xyz[0][5][5] = 1'b0; zoom_xyz[1][5][5] = 1'b1; zoom_xyz[2][5][5] = 1'b0; zoom_xyz[3][5][5] = 1'b0; zoom_xyz[4][5][5] = 1'b0; zoom_xyz[5][5][5] = 1'b0; zoom_xyz[6][5][5] = 1'b1; zoom_xyz[7][5][5] = 1'b0;
                zoom_xyz[0][6][5] = 1'b0; zoom_xyz[1][6][5] = 1'b1; zoom_xyz[2][6][5] = 1'b1; zoom_xyz[3][6][5] = 1'b1; zoom_xyz[4][6][5] = 1'b1; zoom_xyz[5][6][5] = 1'b1; zoom_xyz[6][6][5] = 1'b1; zoom_xyz[7][6][5] = 1'b0;
                zoom_xyz[0][7][5] = 1'b0; zoom_xyz[1][7][5] = 1'b0; zoom_xyz[2][7][5] = 1'b0; zoom_xyz[3][7][5] = 1'b0; zoom_xyz[4][7][5] = 1'b0; zoom_xyz[5][7][5] = 1'b0; zoom_xyz[6][7][5] = 1'b0; zoom_xyz[7][7][5] = 1'b0;
                zoom_xyz[0][0][6] = 1'b0; zoom_xyz[1][0][6] = 1'b0; zoom_xyz[2][0][6] = 1'b0; zoom_xyz[3][0][6] = 1'b0; zoom_xyz[4][0][6] = 1'b0; zoom_xyz[5][0][6] = 1'b0; zoom_xyz[6][0][6] = 1'b0; zoom_xyz[7][0][6] = 1'b0;
                zoom_xyz[0][1][6] = 1'b0; zoom_xyz[1][1][6] = 1'b1; zoom_xyz[2][1][6] = 1'b1; zoom_xyz[3][1][6] = 1'b1; zoom_xyz[4][1][6] = 1'b1; zoom_xyz[5][1][6] = 1'b1; zoom_xyz[6][1][6] = 1'b1; zoom_xyz[7][1][6] = 1'b0;
                zoom_xyz[0][2][6] = 1'b0; zoom_xyz[1][2][6] = 1'b1; zoom_xyz[2][2][6] = 1'b1; zoom_xyz[3][2][6] = 1'b1; zoom_xyz[4][2][6] = 1'b1; zoom_xyz[5][2][6] = 1'b1; zoom_xyz[6][2][6] = 1'b1; zoom_xyz[7][2][6] = 1'b0;
                zoom_xyz[0][3][6] = 1'b0; zoom_xyz[1][3][6] = 1'b1; zoom_xyz[2][3][6] = 1'b1; zoom_xyz[3][3][6] = 1'b1; zoom_xyz[4][3][6] = 1'b1; zoom_xyz[5][3][6] = 1'b1; zoom_xyz[6][3][6] = 1'b1; zoom_xyz[7][3][6] = 1'b0;
                zoom_xyz[0][4][6] = 1'b0; zoom_xyz[1][4][6] = 1'b1; zoom_xyz[2][4][6] = 1'b1; zoom_xyz[3][4][6] = 1'b1; zoom_xyz[4][4][6] = 1'b1; zoom_xyz[5][4][6] = 1'b1; zoom_xyz[6][4][6] = 1'b1; zoom_xyz[7][4][6] = 1'b0;
                zoom_xyz[0][5][6] = 1'b0; zoom_xyz[1][5][6] = 1'b1; zoom_xyz[2][5][6] = 1'b1; zoom_xyz[3][5][6] = 1'b1; zoom_xyz[4][5][6] = 1'b1; zoom_xyz[5][5][6] = 1'b1; zoom_xyz[6][5][6] = 1'b1; zoom_xyz[7][5][6] = 1'b0;
                zoom_xyz[0][6][6] = 1'b0; zoom_xyz[1][6][6] = 1'b1; zoom_xyz[2][6][6] = 1'b1; zoom_xyz[3][6][6] = 1'b1; zoom_xyz[4][6][6] = 1'b1; zoom_xyz[5][6][6] = 1'b1; zoom_xyz[6][6][6] = 1'b1; zoom_xyz[7][6][6] = 1'b0;
                zoom_xyz[0][7][6] = 1'b0; zoom_xyz[1][7][6] = 1'b0; zoom_xyz[2][7][6] = 1'b0; zoom_xyz[3][7][6] = 1'b0; zoom_xyz[4][7][6] = 1'b0; zoom_xyz[5][7][6] = 1'b0; zoom_xyz[6][7][6] = 1'b0; zoom_xyz[7][7][6] = 1'b0;
                zoom_xyz[0][0][7] = 1'b0; zoom_xyz[1][0][7] = 1'b0; zoom_xyz[2][0][7] = 1'b0; zoom_xyz[3][0][7] = 1'b0; zoom_xyz[4][0][7] = 1'b0; zoom_xyz[5][0][7] = 1'b0; zoom_xyz[6][0][7] = 1'b0; zoom_xyz[7][0][7] = 1'b0;
                zoom_xyz[0][1][7] = 1'b0; zoom_xyz[1][1][7] = 1'b0; zoom_xyz[2][1][7] = 1'b0; zoom_xyz[3][1][7] = 1'b0; zoom_xyz[4][1][7] = 1'b0; zoom_xyz[5][1][7] = 1'b0; zoom_xyz[6][1][7] = 1'b0; zoom_xyz[7][1][7] = 1'b0;
                zoom_xyz[0][2][7] = 1'b0; zoom_xyz[1][2][7] = 1'b0; zoom_xyz[2][2][7] = 1'b0; zoom_xyz[3][2][7] = 1'b0; zoom_xyz[4][2][7] = 1'b0; zoom_xyz[5][2][7] = 1'b0; zoom_xyz[6][2][7] = 1'b0; zoom_xyz[7][2][7] = 1'b0;
                zoom_xyz[0][3][7] = 1'b0; zoom_xyz[1][3][7] = 1'b0; zoom_xyz[2][3][7] = 1'b0; zoom_xyz[3][3][7] = 1'b0; zoom_xyz[4][3][7] = 1'b0; zoom_xyz[5][3][7] = 1'b0; zoom_xyz[6][3][7] = 1'b0; zoom_xyz[7][3][7] = 1'b0;
                zoom_xyz[0][4][7] = 1'b0; zoom_xyz[1][4][7] = 1'b0; zoom_xyz[2][4][7] = 1'b0; zoom_xyz[3][4][7] = 1'b0; zoom_xyz[4][4][7] = 1'b0; zoom_xyz[5][4][7] = 1'b0; zoom_xyz[6][4][7] = 1'b0; zoom_xyz[7][4][7] = 1'b0;
                zoom_xyz[0][5][7] = 1'b0; zoom_xyz[1][5][7] = 1'b0; zoom_xyz[2][5][7] = 1'b0; zoom_xyz[3][5][7] = 1'b0; zoom_xyz[4][5][7] = 1'b0; zoom_xyz[5][5][7] = 1'b0; zoom_xyz[6][5][7] = 1'b0; zoom_xyz[7][5][7] = 1'b0;
                zoom_xyz[0][6][7] = 1'b0; zoom_xyz[1][6][7] = 1'b0; zoom_xyz[2][6][7] = 1'b0; zoom_xyz[3][6][7] = 1'b0; zoom_xyz[4][6][7] = 1'b0; zoom_xyz[5][6][7] = 1'b0; zoom_xyz[6][6][7] = 1'b0; zoom_xyz[7][6][7] = 1'b0;
                zoom_xyz[0][7][7] = 1'b0; zoom_xyz[1][7][7] = 1'b0; zoom_xyz[2][7][7] = 1'b0; zoom_xyz[3][7][7] = 1'b0; zoom_xyz[4][7][7] = 1'b0; zoom_xyz[5][7][7] = 1'b0; zoom_xyz[6][7][7] = 1'b0; zoom_xyz[7][7][7] = 1'b0;
            end
            3'd2: begin     
                zoom_xyz[0][0][0] = 1'b0; zoom_xyz[1][0][0] = 1'b0; zoom_xyz[2][0][0] = 1'b0; zoom_xyz[3][0][0] = 1'b0; zoom_xyz[4][0][0] = 1'b0; zoom_xyz[5][0][0] = 1'b0; zoom_xyz[6][0][0] = 1'b0; zoom_xyz[7][0][0] = 1'b0;
                zoom_xyz[0][1][0] = 1'b0; zoom_xyz[1][1][0] = 1'b0; zoom_xyz[2][1][0] = 1'b0; zoom_xyz[3][1][0] = 1'b0; zoom_xyz[4][1][0] = 1'b0; zoom_xyz[5][1][0] = 1'b0; zoom_xyz[6][1][0] = 1'b0; zoom_xyz[7][1][0] = 1'b0;
                zoom_xyz[0][2][0] = 1'b0; zoom_xyz[1][2][0] = 1'b0; zoom_xyz[2][2][0] = 1'b0; zoom_xyz[3][2][0] = 1'b0; zoom_xyz[4][2][0] = 1'b0; zoom_xyz[5][2][0] = 1'b0; zoom_xyz[6][2][0] = 1'b0; zoom_xyz[7][2][0] = 1'b0;
                zoom_xyz[0][3][0] = 1'b0; zoom_xyz[1][3][0] = 1'b0; zoom_xyz[2][3][0] = 1'b0; zoom_xyz[3][3][0] = 1'b0; zoom_xyz[4][3][0] = 1'b0; zoom_xyz[5][3][0] = 1'b0; zoom_xyz[6][3][0] = 1'b0; zoom_xyz[7][3][0] = 1'b0;
                zoom_xyz[0][4][0] = 1'b0; zoom_xyz[1][4][0] = 1'b0; zoom_xyz[2][4][0] = 1'b0; zoom_xyz[3][4][0] = 1'b0; zoom_xyz[4][4][0] = 1'b0; zoom_xyz[5][4][0] = 1'b0; zoom_xyz[6][4][0] = 1'b0; zoom_xyz[7][4][0] = 1'b0;
                zoom_xyz[0][5][0] = 1'b0; zoom_xyz[1][5][0] = 1'b0; zoom_xyz[2][5][0] = 1'b0; zoom_xyz[3][5][0] = 1'b0; zoom_xyz[4][5][0] = 1'b0; zoom_xyz[5][5][0] = 1'b0; zoom_xyz[6][5][0] = 1'b0; zoom_xyz[7][5][0] = 1'b0;
                zoom_xyz[0][6][0] = 1'b0; zoom_xyz[1][6][0] = 1'b0; zoom_xyz[2][6][0] = 1'b0; zoom_xyz[3][6][0] = 1'b0; zoom_xyz[4][6][0] = 1'b0; zoom_xyz[5][6][0] = 1'b0; zoom_xyz[6][6][0] = 1'b0; zoom_xyz[7][6][0] = 1'b0;
                zoom_xyz[0][7][0] = 1'b0; zoom_xyz[1][7][0] = 1'b0; zoom_xyz[2][7][0] = 1'b0; zoom_xyz[3][7][0] = 1'b0; zoom_xyz[4][7][0] = 1'b0; zoom_xyz[5][7][0] = 1'b0; zoom_xyz[6][7][0] = 1'b0; zoom_xyz[7][7][0] = 1'b0;
                zoom_xyz[0][0][1] = 1'b0; zoom_xyz[1][0][1] = 1'b0; zoom_xyz[2][0][1] = 1'b0; zoom_xyz[3][0][1] = 1'b0; zoom_xyz[4][0][1] = 1'b0; zoom_xyz[5][0][1] = 1'b0; zoom_xyz[6][0][1] = 1'b0; zoom_xyz[7][0][1] = 1'b0;
                zoom_xyz[0][1][1] = 1'b0; zoom_xyz[1][1][1] = 1'b0; zoom_xyz[2][1][1] = 1'b0; zoom_xyz[3][1][1] = 1'b0; zoom_xyz[4][1][1] = 1'b0; zoom_xyz[5][1][1] = 1'b0; zoom_xyz[6][1][1] = 1'b0; zoom_xyz[7][1][1] = 1'b0;
                zoom_xyz[0][2][1] = 1'b0; zoom_xyz[1][2][1] = 1'b0; zoom_xyz[2][2][1] = 1'b0; zoom_xyz[3][2][1] = 1'b0; zoom_xyz[4][2][1] = 1'b0; zoom_xyz[5][2][1] = 1'b0; zoom_xyz[6][2][1] = 1'b0; zoom_xyz[7][2][1] = 1'b0;
                zoom_xyz[0][3][1] = 1'b0; zoom_xyz[1][3][1] = 1'b0; zoom_xyz[2][3][1] = 1'b0; zoom_xyz[3][3][1] = 1'b0; zoom_xyz[4][3][1] = 1'b0; zoom_xyz[5][3][1] = 1'b0; zoom_xyz[6][3][1] = 1'b0; zoom_xyz[7][3][1] = 1'b0;
                zoom_xyz[0][4][1] = 1'b0; zoom_xyz[1][4][1] = 1'b0; zoom_xyz[2][4][1] = 1'b0; zoom_xyz[3][4][1] = 1'b0; zoom_xyz[4][4][1] = 1'b0; zoom_xyz[5][4][1] = 1'b0; zoom_xyz[6][4][1] = 1'b0; zoom_xyz[7][4][1] = 1'b0;
                zoom_xyz[0][5][1] = 1'b0; zoom_xyz[1][5][1] = 1'b0; zoom_xyz[2][5][1] = 1'b0; zoom_xyz[3][5][1] = 1'b0; zoom_xyz[4][5][1] = 1'b0; zoom_xyz[5][5][1] = 1'b0; zoom_xyz[6][5][1] = 1'b0; zoom_xyz[7][5][1] = 1'b0;
                zoom_xyz[0][6][1] = 1'b0; zoom_xyz[1][6][1] = 1'b0; zoom_xyz[2][6][1] = 1'b0; zoom_xyz[3][6][1] = 1'b0; zoom_xyz[4][6][1] = 1'b0; zoom_xyz[5][6][1] = 1'b0; zoom_xyz[6][6][1] = 1'b0; zoom_xyz[7][6][1] = 1'b0;
                zoom_xyz[0][7][1] = 1'b0; zoom_xyz[1][7][1] = 1'b0; zoom_xyz[2][7][1] = 1'b0; zoom_xyz[3][7][1] = 1'b0; zoom_xyz[4][7][1] = 1'b0; zoom_xyz[5][7][1] = 1'b0; zoom_xyz[6][7][1] = 1'b0; zoom_xyz[7][7][1] = 1'b0;
                zoom_xyz[0][0][2] = 1'b0; zoom_xyz[1][0][2] = 1'b0; zoom_xyz[2][0][2] = 1'b0; zoom_xyz[3][0][2] = 1'b0; zoom_xyz[4][0][2] = 1'b0; zoom_xyz[5][0][2] = 1'b0; zoom_xyz[6][0][2] = 1'b0; zoom_xyz[7][0][2] = 1'b0;
                zoom_xyz[0][1][2] = 1'b0; zoom_xyz[1][1][2] = 1'b0; zoom_xyz[2][1][2] = 1'b0; zoom_xyz[3][1][2] = 1'b0; zoom_xyz[4][1][2] = 1'b0; zoom_xyz[5][1][2] = 1'b0; zoom_xyz[6][1][2] = 1'b0; zoom_xyz[7][1][2] = 1'b0;
                zoom_xyz[0][2][2] = 1'b0; zoom_xyz[1][2][2] = 1'b0; zoom_xyz[2][2][2] = 1'b1; zoom_xyz[3][2][2] = 1'b1; zoom_xyz[4][2][2] = 1'b1; zoom_xyz[5][2][2] = 1'b1; zoom_xyz[6][2][2] = 1'b0; zoom_xyz[7][2][2] = 1'b0;
                zoom_xyz[0][3][2] = 1'b0; zoom_xyz[1][3][2] = 1'b0; zoom_xyz[2][3][2] = 1'b1; zoom_xyz[3][3][2] = 1'b1; zoom_xyz[4][3][2] = 1'b1; zoom_xyz[5][3][2] = 1'b1; zoom_xyz[6][3][2] = 1'b0; zoom_xyz[7][3][2] = 1'b0;
                zoom_xyz[0][4][2] = 1'b0; zoom_xyz[1][4][2] = 1'b0; zoom_xyz[2][4][2] = 1'b1; zoom_xyz[3][4][2] = 1'b1; zoom_xyz[4][4][2] = 1'b1; zoom_xyz[5][4][2] = 1'b1; zoom_xyz[6][4][2] = 1'b0; zoom_xyz[7][4][2] = 1'b0;
                zoom_xyz[0][5][2] = 1'b0; zoom_xyz[1][5][2] = 1'b0; zoom_xyz[2][5][2] = 1'b1; zoom_xyz[3][5][2] = 1'b1; zoom_xyz[4][5][2] = 1'b1; zoom_xyz[5][5][2] = 1'b1; zoom_xyz[6][5][2] = 1'b0; zoom_xyz[7][5][2] = 1'b0;
                zoom_xyz[0][6][2] = 1'b0; zoom_xyz[1][6][2] = 1'b0; zoom_xyz[2][6][2] = 1'b0; zoom_xyz[3][6][2] = 1'b0; zoom_xyz[4][6][2] = 1'b0; zoom_xyz[5][6][2] = 1'b0; zoom_xyz[6][6][2] = 1'b0; zoom_xyz[7][6][2] = 1'b0;
                zoom_xyz[0][7][2] = 1'b0; zoom_xyz[1][7][2] = 1'b0; zoom_xyz[2][7][2] = 1'b0; zoom_xyz[3][7][2] = 1'b0; zoom_xyz[4][7][2] = 1'b0; zoom_xyz[5][7][2] = 1'b0; zoom_xyz[6][7][2] = 1'b0; zoom_xyz[7][7][2] = 1'b0;
                zoom_xyz[0][0][3] = 1'b0; zoom_xyz[1][0][3] = 1'b0; zoom_xyz[2][0][3] = 1'b0; zoom_xyz[3][0][3] = 1'b0; zoom_xyz[4][0][3] = 1'b0; zoom_xyz[5][0][3] = 1'b0; zoom_xyz[6][0][3] = 1'b0; zoom_xyz[7][0][3] = 1'b0;
                zoom_xyz[0][1][3] = 1'b0; zoom_xyz[1][1][3] = 1'b0; zoom_xyz[2][1][3] = 1'b0; zoom_xyz[3][1][3] = 1'b0; zoom_xyz[4][1][3] = 1'b0; zoom_xyz[5][1][3] = 1'b0; zoom_xyz[6][1][3] = 1'b0; zoom_xyz[7][1][3] = 1'b0;
                zoom_xyz[0][2][3] = 1'b0; zoom_xyz[1][2][3] = 1'b0; zoom_xyz[2][2][3] = 1'b1; zoom_xyz[3][2][3] = 1'b1; zoom_xyz[4][2][3] = 1'b1; zoom_xyz[5][2][3] = 1'b1; zoom_xyz[6][2][3] = 1'b0; zoom_xyz[7][2][3] = 1'b0;
                zoom_xyz[0][3][3] = 1'b0; zoom_xyz[1][3][3] = 1'b0; zoom_xyz[2][3][3] = 1'b1; zoom_xyz[3][3][3] = 1'b0; zoom_xyz[4][3][3] = 1'b0; zoom_xyz[5][3][3] = 1'b1; zoom_xyz[6][3][3] = 1'b0; zoom_xyz[7][3][3] = 1'b0;
                zoom_xyz[0][4][3] = 1'b0; zoom_xyz[1][4][3] = 1'b0; zoom_xyz[2][4][3] = 1'b1; zoom_xyz[3][4][3] = 1'b0; zoom_xyz[4][4][3] = 1'b0; zoom_xyz[5][4][3] = 1'b1; zoom_xyz[6][4][3] = 1'b0; zoom_xyz[7][4][3] = 1'b0;
                zoom_xyz[0][5][3] = 1'b0; zoom_xyz[1][5][3] = 1'b0; zoom_xyz[2][5][3] = 1'b1; zoom_xyz[3][5][3] = 1'b1; zoom_xyz[4][5][3] = 1'b1; zoom_xyz[5][5][3] = 1'b1; zoom_xyz[6][5][3] = 1'b0; zoom_xyz[7][5][3] = 1'b0;
                zoom_xyz[0][6][3] = 1'b0; zoom_xyz[1][6][3] = 1'b0; zoom_xyz[2][6][3] = 1'b0; zoom_xyz[3][6][3] = 1'b0; zoom_xyz[4][6][3] = 1'b0; zoom_xyz[5][6][3] = 1'b0; zoom_xyz[6][6][3] = 1'b0; zoom_xyz[7][6][3] = 1'b0;
                zoom_xyz[0][7][3] = 1'b0; zoom_xyz[1][7][3] = 1'b0; zoom_xyz[2][7][3] = 1'b0; zoom_xyz[3][7][3] = 1'b0; zoom_xyz[4][7][3] = 1'b0; zoom_xyz[5][7][3] = 1'b0; zoom_xyz[6][7][3] = 1'b0; zoom_xyz[7][7][3] = 1'b0;
                zoom_xyz[0][0][4] = 1'b0; zoom_xyz[1][0][4] = 1'b0; zoom_xyz[2][0][4] = 1'b0; zoom_xyz[3][0][4] = 1'b0; zoom_xyz[4][0][4] = 1'b0; zoom_xyz[5][0][4] = 1'b0; zoom_xyz[6][0][4] = 1'b0; zoom_xyz[7][0][4] = 1'b0;
                zoom_xyz[0][1][4] = 1'b0; zoom_xyz[1][1][4] = 1'b0; zoom_xyz[2][1][4] = 1'b0; zoom_xyz[3][1][4] = 1'b0; zoom_xyz[4][1][4] = 1'b0; zoom_xyz[5][1][4] = 1'b0; zoom_xyz[6][1][4] = 1'b0; zoom_xyz[7][1][4] = 1'b0;
                zoom_xyz[0][2][4] = 1'b0; zoom_xyz[1][2][4] = 1'b0; zoom_xyz[2][2][4] = 1'b1; zoom_xyz[3][2][4] = 1'b1; zoom_xyz[4][2][4] = 1'b1; zoom_xyz[5][2][4] = 1'b1; zoom_xyz[6][2][4] = 1'b0; zoom_xyz[7][2][4] = 1'b0;
                zoom_xyz[0][3][4] = 1'b0; zoom_xyz[1][3][4] = 1'b0; zoom_xyz[2][3][4] = 1'b1; zoom_xyz[3][3][4] = 1'b0; zoom_xyz[4][3][4] = 1'b0; zoom_xyz[5][3][4] = 1'b1; zoom_xyz[6][3][4] = 1'b0; zoom_xyz[7][3][4] = 1'b0;
                zoom_xyz[0][4][4] = 1'b0; zoom_xyz[1][4][4] = 1'b0; zoom_xyz[2][4][4] = 1'b1; zoom_xyz[3][4][4] = 1'b0; zoom_xyz[4][4][4] = 1'b0; zoom_xyz[5][4][4] = 1'b1; zoom_xyz[6][4][4] = 1'b0; zoom_xyz[7][4][4] = 1'b0;
                zoom_xyz[0][5][4] = 1'b0; zoom_xyz[1][5][4] = 1'b0; zoom_xyz[2][5][4] = 1'b1; zoom_xyz[3][5][4] = 1'b1; zoom_xyz[4][5][4] = 1'b1; zoom_xyz[5][5][4] = 1'b1; zoom_xyz[6][5][4] = 1'b0; zoom_xyz[7][5][4] = 1'b0;
                zoom_xyz[0][6][4] = 1'b0; zoom_xyz[1][6][4] = 1'b0; zoom_xyz[2][6][4] = 1'b0; zoom_xyz[3][6][4] = 1'b0; zoom_xyz[4][6][4] = 1'b0; zoom_xyz[5][6][4] = 1'b0; zoom_xyz[6][6][4] = 1'b0; zoom_xyz[7][6][4] = 1'b0;
                zoom_xyz[0][7][4] = 1'b0; zoom_xyz[1][7][4] = 1'b0; zoom_xyz[2][7][4] = 1'b0; zoom_xyz[3][7][4] = 1'b0; zoom_xyz[4][7][4] = 1'b0; zoom_xyz[5][7][4] = 1'b0; zoom_xyz[6][7][4] = 1'b0; zoom_xyz[7][7][4] = 1'b0;
                zoom_xyz[0][0][5] = 1'b0; zoom_xyz[1][0][5] = 1'b0; zoom_xyz[2][0][5] = 1'b0; zoom_xyz[3][0][5] = 1'b0; zoom_xyz[4][0][5] = 1'b0; zoom_xyz[5][0][5] = 1'b0; zoom_xyz[6][0][5] = 1'b0; zoom_xyz[7][0][5] = 1'b0;
                zoom_xyz[0][1][5] = 1'b0; zoom_xyz[1][1][5] = 1'b0; zoom_xyz[2][1][5] = 1'b0; zoom_xyz[3][1][5] = 1'b0; zoom_xyz[4][1][5] = 1'b0; zoom_xyz[5][1][5] = 1'b0; zoom_xyz[6][1][5] = 1'b0; zoom_xyz[7][1][5] = 1'b0;
                zoom_xyz[0][2][5] = 1'b0; zoom_xyz[1][2][5] = 1'b0; zoom_xyz[2][2][5] = 1'b1; zoom_xyz[3][2][5] = 1'b1; zoom_xyz[4][2][5] = 1'b1; zoom_xyz[5][2][5] = 1'b1; zoom_xyz[6][2][5] = 1'b0; zoom_xyz[7][2][5] = 1'b0;
                zoom_xyz[0][3][5] = 1'b0; zoom_xyz[1][3][5] = 1'b0; zoom_xyz[2][3][5] = 1'b1; zoom_xyz[3][3][5] = 1'b1; zoom_xyz[4][3][5] = 1'b1; zoom_xyz[5][3][5] = 1'b1; zoom_xyz[6][3][5] = 1'b0; zoom_xyz[7][3][5] = 1'b0;
                zoom_xyz[0][4][5] = 1'b0; zoom_xyz[1][4][5] = 1'b0; zoom_xyz[2][4][5] = 1'b1; zoom_xyz[3][4][5] = 1'b1; zoom_xyz[4][4][5] = 1'b1; zoom_xyz[5][4][5] = 1'b1; zoom_xyz[6][4][5] = 1'b0; zoom_xyz[7][4][5] = 1'b0;
                zoom_xyz[0][5][5] = 1'b0; zoom_xyz[1][5][5] = 1'b0; zoom_xyz[2][5][5] = 1'b1; zoom_xyz[3][5][5] = 1'b1; zoom_xyz[4][5][5] = 1'b1; zoom_xyz[5][5][5] = 1'b1; zoom_xyz[6][5][5] = 1'b0; zoom_xyz[7][5][5] = 1'b0;
                zoom_xyz[0][6][5] = 1'b0; zoom_xyz[1][6][5] = 1'b0; zoom_xyz[2][6][5] = 1'b0; zoom_xyz[3][6][5] = 1'b0; zoom_xyz[4][6][5] = 1'b0; zoom_xyz[5][6][5] = 1'b0; zoom_xyz[6][6][5] = 1'b0; zoom_xyz[7][6][5] = 1'b0;
                zoom_xyz[0][7][5] = 1'b0; zoom_xyz[1][7][5] = 1'b0; zoom_xyz[2][7][5] = 1'b0; zoom_xyz[3][7][5] = 1'b0; zoom_xyz[4][7][5] = 1'b0; zoom_xyz[5][7][5] = 1'b0; zoom_xyz[6][7][5] = 1'b0; zoom_xyz[7][7][5] = 1'b0;
                zoom_xyz[0][0][6] = 1'b0; zoom_xyz[1][0][6] = 1'b0; zoom_xyz[2][0][6] = 1'b0; zoom_xyz[3][0][6] = 1'b0; zoom_xyz[4][0][6] = 1'b0; zoom_xyz[5][0][6] = 1'b0; zoom_xyz[6][0][6] = 1'b0; zoom_xyz[7][0][6] = 1'b0;
                zoom_xyz[0][1][6] = 1'b0; zoom_xyz[1][1][6] = 1'b0; zoom_xyz[2][1][6] = 1'b0; zoom_xyz[3][1][6] = 1'b0; zoom_xyz[4][1][6] = 1'b0; zoom_xyz[5][1][6] = 1'b0; zoom_xyz[6][1][6] = 1'b0; zoom_xyz[7][1][6] = 1'b0;
                zoom_xyz[0][2][6] = 1'b0; zoom_xyz[1][2][6] = 1'b0; zoom_xyz[2][2][6] = 1'b0; zoom_xyz[3][2][6] = 1'b0; zoom_xyz[4][2][6] = 1'b0; zoom_xyz[5][2][6] = 1'b0; zoom_xyz[6][2][6] = 1'b0; zoom_xyz[7][2][6] = 1'b0;
                zoom_xyz[0][3][6] = 1'b0; zoom_xyz[1][3][6] = 1'b0; zoom_xyz[2][3][6] = 1'b0; zoom_xyz[3][3][6] = 1'b0; zoom_xyz[4][3][6] = 1'b0; zoom_xyz[5][3][6] = 1'b0; zoom_xyz[6][3][6] = 1'b0; zoom_xyz[7][3][6] = 1'b0;
                zoom_xyz[0][4][6] = 1'b0; zoom_xyz[1][4][6] = 1'b0; zoom_xyz[2][4][6] = 1'b0; zoom_xyz[3][4][6] = 1'b0; zoom_xyz[4][4][6] = 1'b0; zoom_xyz[5][4][6] = 1'b0; zoom_xyz[6][4][6] = 1'b0; zoom_xyz[7][4][6] = 1'b0;
                zoom_xyz[0][5][6] = 1'b0; zoom_xyz[1][5][6] = 1'b0; zoom_xyz[2][5][6] = 1'b0; zoom_xyz[3][5][6] = 1'b0; zoom_xyz[4][5][6] = 1'b0; zoom_xyz[5][5][6] = 1'b0; zoom_xyz[6][5][6] = 1'b0; zoom_xyz[7][5][6] = 1'b0;
                zoom_xyz[0][6][6] = 1'b0; zoom_xyz[1][6][6] = 1'b0; zoom_xyz[2][6][6] = 1'b0; zoom_xyz[3][6][6] = 1'b0; zoom_xyz[4][6][6] = 1'b0; zoom_xyz[5][6][6] = 1'b0; zoom_xyz[6][6][6] = 1'b0; zoom_xyz[7][6][6] = 1'b0;
                zoom_xyz[0][7][6] = 1'b0; zoom_xyz[1][7][6] = 1'b0; zoom_xyz[2][7][6] = 1'b0; zoom_xyz[3][7][6] = 1'b0; zoom_xyz[4][7][6] = 1'b0; zoom_xyz[5][7][6] = 1'b0; zoom_xyz[6][7][6] = 1'b0; zoom_xyz[7][7][6] = 1'b0;
                zoom_xyz[0][0][7] = 1'b0; zoom_xyz[1][0][7] = 1'b0; zoom_xyz[2][0][7] = 1'b0; zoom_xyz[3][0][7] = 1'b0; zoom_xyz[4][0][7] = 1'b0; zoom_xyz[5][0][7] = 1'b0; zoom_xyz[6][0][7] = 1'b0; zoom_xyz[7][0][7] = 1'b0;
                zoom_xyz[0][1][7] = 1'b0; zoom_xyz[1][1][7] = 1'b0; zoom_xyz[2][1][7] = 1'b0; zoom_xyz[3][1][7] = 1'b0; zoom_xyz[4][1][7] = 1'b0; zoom_xyz[5][1][7] = 1'b0; zoom_xyz[6][1][7] = 1'b0; zoom_xyz[7][1][7] = 1'b0;
                zoom_xyz[0][2][7] = 1'b0; zoom_xyz[1][2][7] = 1'b0; zoom_xyz[2][2][7] = 1'b0; zoom_xyz[3][2][7] = 1'b0; zoom_xyz[4][2][7] = 1'b0; zoom_xyz[5][2][7] = 1'b0; zoom_xyz[6][2][7] = 1'b0; zoom_xyz[7][2][7] = 1'b0;
                zoom_xyz[0][3][7] = 1'b0; zoom_xyz[1][3][7] = 1'b0; zoom_xyz[2][3][7] = 1'b0; zoom_xyz[3][3][7] = 1'b0; zoom_xyz[4][3][7] = 1'b0; zoom_xyz[5][3][7] = 1'b0; zoom_xyz[6][3][7] = 1'b0; zoom_xyz[7][3][7] = 1'b0;
                zoom_xyz[0][4][7] = 1'b0; zoom_xyz[1][4][7] = 1'b0; zoom_xyz[2][4][7] = 1'b0; zoom_xyz[3][4][7] = 1'b0; zoom_xyz[4][4][7] = 1'b0; zoom_xyz[5][4][7] = 1'b0; zoom_xyz[6][4][7] = 1'b0; zoom_xyz[7][4][7] = 1'b0;
                zoom_xyz[0][5][7] = 1'b0; zoom_xyz[1][5][7] = 1'b0; zoom_xyz[2][5][7] = 1'b0; zoom_xyz[3][5][7] = 1'b0; zoom_xyz[4][5][7] = 1'b0; zoom_xyz[5][5][7] = 1'b0; zoom_xyz[6][5][7] = 1'b0; zoom_xyz[7][5][7] = 1'b0;
                zoom_xyz[0][6][7] = 1'b0; zoom_xyz[1][6][7] = 1'b0; zoom_xyz[2][6][7] = 1'b0; zoom_xyz[3][6][7] = 1'b0; zoom_xyz[4][6][7] = 1'b0; zoom_xyz[5][6][7] = 1'b0; zoom_xyz[6][6][7] = 1'b0; zoom_xyz[7][6][7] = 1'b0;
                zoom_xyz[0][7][7] = 1'b0; zoom_xyz[1][7][7] = 1'b0; zoom_xyz[2][7][7] = 1'b0; zoom_xyz[3][7][7] = 1'b0; zoom_xyz[4][7][7] = 1'b0; zoom_xyz[5][7][7] = 1'b0; zoom_xyz[6][7][7] = 1'b0; zoom_xyz[7][7][7] = 1'b0;
            end
            3'd3: begin     
                zoom_xyz[0][0][0] = 1'b0; zoom_xyz[1][0][0] = 1'b0; zoom_xyz[2][0][0] = 1'b0; zoom_xyz[3][0][0] = 1'b0; zoom_xyz[4][0][0] = 1'b0; zoom_xyz[5][0][0] = 1'b0; zoom_xyz[6][0][0] = 1'b0; zoom_xyz[7][0][0] = 1'b0;
                zoom_xyz[0][1][0] = 1'b0; zoom_xyz[1][1][0] = 1'b0; zoom_xyz[2][1][0] = 1'b0; zoom_xyz[3][1][0] = 1'b0; zoom_xyz[4][1][0] = 1'b0; zoom_xyz[5][1][0] = 1'b0; zoom_xyz[6][1][0] = 1'b0; zoom_xyz[7][1][0] = 1'b0;
                zoom_xyz[0][2][0] = 1'b0; zoom_xyz[1][2][0] = 1'b0; zoom_xyz[2][2][0] = 1'b0; zoom_xyz[3][2][0] = 1'b0; zoom_xyz[4][2][0] = 1'b0; zoom_xyz[5][2][0] = 1'b0; zoom_xyz[6][2][0] = 1'b0; zoom_xyz[7][2][0] = 1'b0;
                zoom_xyz[0][3][0] = 1'b0; zoom_xyz[1][3][0] = 1'b0; zoom_xyz[2][3][0] = 1'b0; zoom_xyz[3][3][0] = 1'b0; zoom_xyz[4][3][0] = 1'b0; zoom_xyz[5][3][0] = 1'b0; zoom_xyz[6][3][0] = 1'b0; zoom_xyz[7][3][0] = 1'b0;
                zoom_xyz[0][4][0] = 1'b0; zoom_xyz[1][4][0] = 1'b0; zoom_xyz[2][4][0] = 1'b0; zoom_xyz[3][4][0] = 1'b0; zoom_xyz[4][4][0] = 1'b0; zoom_xyz[5][4][0] = 1'b0; zoom_xyz[6][4][0] = 1'b0; zoom_xyz[7][4][0] = 1'b0;
                zoom_xyz[0][5][0] = 1'b0; zoom_xyz[1][5][0] = 1'b0; zoom_xyz[2][5][0] = 1'b0; zoom_xyz[3][5][0] = 1'b0; zoom_xyz[4][5][0] = 1'b0; zoom_xyz[5][5][0] = 1'b0; zoom_xyz[6][5][0] = 1'b0; zoom_xyz[7][5][0] = 1'b0;
                zoom_xyz[0][6][0] = 1'b0; zoom_xyz[1][6][0] = 1'b0; zoom_xyz[2][6][0] = 1'b0; zoom_xyz[3][6][0] = 1'b0; zoom_xyz[4][6][0] = 1'b0; zoom_xyz[5][6][0] = 1'b0; zoom_xyz[6][6][0] = 1'b0; zoom_xyz[7][6][0] = 1'b0;
                zoom_xyz[0][7][0] = 1'b0; zoom_xyz[1][7][0] = 1'b0; zoom_xyz[2][7][0] = 1'b0; zoom_xyz[3][7][0] = 1'b0; zoom_xyz[4][7][0] = 1'b0; zoom_xyz[5][7][0] = 1'b0; zoom_xyz[6][7][0] = 1'b0; zoom_xyz[7][7][0] = 1'b0;
                zoom_xyz[0][0][1] = 1'b0; zoom_xyz[1][0][1] = 1'b0; zoom_xyz[2][0][1] = 1'b0; zoom_xyz[3][0][1] = 1'b0; zoom_xyz[4][0][1] = 1'b0; zoom_xyz[5][0][1] = 1'b0; zoom_xyz[6][0][1] = 1'b0; zoom_xyz[7][0][1] = 1'b0;
                zoom_xyz[0][1][1] = 1'b0; zoom_xyz[1][1][1] = 1'b0; zoom_xyz[2][1][1] = 1'b0; zoom_xyz[3][1][1] = 1'b0; zoom_xyz[4][1][1] = 1'b0; zoom_xyz[5][1][1] = 1'b0; zoom_xyz[6][1][1] = 1'b0; zoom_xyz[7][1][1] = 1'b0;
                zoom_xyz[0][2][1] = 1'b0; zoom_xyz[1][2][1] = 1'b0; zoom_xyz[2][2][1] = 1'b0; zoom_xyz[3][2][1] = 1'b0; zoom_xyz[4][2][1] = 1'b0; zoom_xyz[5][2][1] = 1'b0; zoom_xyz[6][2][1] = 1'b0; zoom_xyz[7][2][1] = 1'b0;
                zoom_xyz[0][3][1] = 1'b0; zoom_xyz[1][3][1] = 1'b0; zoom_xyz[2][3][1] = 1'b0; zoom_xyz[3][3][1] = 1'b0; zoom_xyz[4][3][1] = 1'b0; zoom_xyz[5][3][1] = 1'b0; zoom_xyz[6][3][1] = 1'b0; zoom_xyz[7][3][1] = 1'b0;
                zoom_xyz[0][4][1] = 1'b0; zoom_xyz[1][4][1] = 1'b0; zoom_xyz[2][4][1] = 1'b0; zoom_xyz[3][4][1] = 1'b0; zoom_xyz[4][4][1] = 1'b0; zoom_xyz[5][4][1] = 1'b0; zoom_xyz[6][4][1] = 1'b0; zoom_xyz[7][4][1] = 1'b0;
                zoom_xyz[0][5][1] = 1'b0; zoom_xyz[1][5][1] = 1'b0; zoom_xyz[2][5][1] = 1'b0; zoom_xyz[3][5][1] = 1'b0; zoom_xyz[4][5][1] = 1'b0; zoom_xyz[5][5][1] = 1'b0; zoom_xyz[6][5][1] = 1'b0; zoom_xyz[7][5][1] = 1'b0;
                zoom_xyz[0][6][1] = 1'b0; zoom_xyz[1][6][1] = 1'b0; zoom_xyz[2][6][1] = 1'b0; zoom_xyz[3][6][1] = 1'b0; zoom_xyz[4][6][1] = 1'b0; zoom_xyz[5][6][1] = 1'b0; zoom_xyz[6][6][1] = 1'b0; zoom_xyz[7][6][1] = 1'b0;
                zoom_xyz[0][7][1] = 1'b0; zoom_xyz[1][7][1] = 1'b0; zoom_xyz[2][7][1] = 1'b0; zoom_xyz[3][7][1] = 1'b0; zoom_xyz[4][7][1] = 1'b0; zoom_xyz[5][7][1] = 1'b0; zoom_xyz[6][7][1] = 1'b0; zoom_xyz[7][7][1] = 1'b0;
                zoom_xyz[0][0][2] = 1'b0; zoom_xyz[1][0][2] = 1'b0; zoom_xyz[2][0][2] = 1'b0; zoom_xyz[3][0][2] = 1'b0; zoom_xyz[4][0][2] = 1'b0; zoom_xyz[5][0][2] = 1'b0; zoom_xyz[6][0][2] = 1'b0; zoom_xyz[7][0][2] = 1'b0;
                zoom_xyz[0][1][2] = 1'b0; zoom_xyz[1][1][2] = 1'b0; zoom_xyz[2][1][2] = 1'b0; zoom_xyz[3][1][2] = 1'b0; zoom_xyz[4][1][2] = 1'b0; zoom_xyz[5][1][2] = 1'b0; zoom_xyz[6][1][2] = 1'b0; zoom_xyz[7][1][2] = 1'b0;
                zoom_xyz[0][2][2] = 1'b0; zoom_xyz[1][2][2] = 1'b0; zoom_xyz[2][2][2] = 1'b0; zoom_xyz[3][2][2] = 1'b0; zoom_xyz[4][2][2] = 1'b0; zoom_xyz[5][2][2] = 1'b0; zoom_xyz[6][2][2] = 1'b0; zoom_xyz[7][2][2] = 1'b0;
                zoom_xyz[0][3][2] = 1'b0; zoom_xyz[1][3][2] = 1'b0; zoom_xyz[2][3][2] = 1'b0; zoom_xyz[3][3][2] = 1'b0; zoom_xyz[4][3][2] = 1'b0; zoom_xyz[5][3][2] = 1'b0; zoom_xyz[6][3][2] = 1'b0; zoom_xyz[7][3][2] = 1'b0;
                zoom_xyz[0][4][2] = 1'b0; zoom_xyz[1][4][2] = 1'b0; zoom_xyz[2][4][2] = 1'b0; zoom_xyz[3][4][2] = 1'b0; zoom_xyz[4][4][2] = 1'b0; zoom_xyz[5][4][2] = 1'b0; zoom_xyz[6][4][2] = 1'b0; zoom_xyz[7][4][2] = 1'b0;
                zoom_xyz[0][5][2] = 1'b0; zoom_xyz[1][5][2] = 1'b0; zoom_xyz[2][5][2] = 1'b0; zoom_xyz[3][5][2] = 1'b0; zoom_xyz[4][5][2] = 1'b0; zoom_xyz[5][5][2] = 1'b0; zoom_xyz[6][5][2] = 1'b0; zoom_xyz[7][5][2] = 1'b0;
                zoom_xyz[0][6][2] = 1'b0; zoom_xyz[1][6][2] = 1'b0; zoom_xyz[2][6][2] = 1'b0; zoom_xyz[3][6][2] = 1'b0; zoom_xyz[4][6][2] = 1'b0; zoom_xyz[5][6][2] = 1'b0; zoom_xyz[6][6][2] = 1'b0; zoom_xyz[7][6][2] = 1'b0;
                zoom_xyz[0][7][2] = 1'b0; zoom_xyz[1][7][2] = 1'b0; zoom_xyz[2][7][2] = 1'b0; zoom_xyz[3][7][2] = 1'b0; zoom_xyz[4][7][2] = 1'b0; zoom_xyz[5][7][2] = 1'b0; zoom_xyz[6][7][2] = 1'b0; zoom_xyz[7][7][2] = 1'b0;
                zoom_xyz[0][0][3] = 1'b0; zoom_xyz[1][0][3] = 1'b0; zoom_xyz[2][0][3] = 1'b0; zoom_xyz[3][0][3] = 1'b0; zoom_xyz[4][0][3] = 1'b0; zoom_xyz[5][0][3] = 1'b0; zoom_xyz[6][0][3] = 1'b0; zoom_xyz[7][0][3] = 1'b0;
                zoom_xyz[0][1][3] = 1'b0; zoom_xyz[1][1][3] = 1'b0; zoom_xyz[2][1][3] = 1'b0; zoom_xyz[3][1][3] = 1'b0; zoom_xyz[4][1][3] = 1'b0; zoom_xyz[5][1][3] = 1'b0; zoom_xyz[6][1][3] = 1'b0; zoom_xyz[7][1][3] = 1'b0;
                zoom_xyz[0][2][3] = 1'b0; zoom_xyz[1][2][3] = 1'b0; zoom_xyz[2][2][3] = 1'b0; zoom_xyz[3][2][3] = 1'b0; zoom_xyz[4][2][3] = 1'b0; zoom_xyz[5][2][3] = 1'b0; zoom_xyz[6][2][3] = 1'b0; zoom_xyz[7][2][3] = 1'b0;
                zoom_xyz[0][3][3] = 1'b0; zoom_xyz[1][3][3] = 1'b0; zoom_xyz[2][3][3] = 1'b0; zoom_xyz[3][3][3] = 1'b1; zoom_xyz[4][3][3] = 1'b1; zoom_xyz[5][3][3] = 1'b0; zoom_xyz[6][3][3] = 1'b0; zoom_xyz[7][3][3] = 1'b0;
                zoom_xyz[0][4][3] = 1'b0; zoom_xyz[1][4][3] = 1'b0; zoom_xyz[2][4][3] = 1'b0; zoom_xyz[3][4][3] = 1'b1; zoom_xyz[4][4][3] = 1'b1; zoom_xyz[5][4][3] = 1'b0; zoom_xyz[6][4][3] = 1'b0; zoom_xyz[7][4][3] = 1'b0;
                zoom_xyz[0][5][3] = 1'b0; zoom_xyz[1][5][3] = 1'b0; zoom_xyz[2][5][3] = 1'b0; zoom_xyz[3][5][3] = 1'b0; zoom_xyz[4][5][3] = 1'b0; zoom_xyz[5][5][3] = 1'b0; zoom_xyz[6][5][3] = 1'b0; zoom_xyz[7][5][3] = 1'b0;
                zoom_xyz[0][6][3] = 1'b0; zoom_xyz[1][6][3] = 1'b0; zoom_xyz[2][6][3] = 1'b0; zoom_xyz[3][6][3] = 1'b0; zoom_xyz[4][6][3] = 1'b0; zoom_xyz[5][6][3] = 1'b0; zoom_xyz[6][6][3] = 1'b0; zoom_xyz[7][6][3] = 1'b0;
                zoom_xyz[0][7][3] = 1'b0; zoom_xyz[1][7][3] = 1'b0; zoom_xyz[2][7][3] = 1'b0; zoom_xyz[3][7][3] = 1'b0; zoom_xyz[4][7][3] = 1'b0; zoom_xyz[5][7][3] = 1'b0; zoom_xyz[6][7][3] = 1'b0; zoom_xyz[7][7][3] = 1'b0;
                zoom_xyz[0][0][4] = 1'b0; zoom_xyz[1][0][4] = 1'b0; zoom_xyz[2][0][4] = 1'b0; zoom_xyz[3][0][4] = 1'b0; zoom_xyz[4][0][4] = 1'b0; zoom_xyz[5][0][4] = 1'b0; zoom_xyz[6][0][4] = 1'b0; zoom_xyz[7][0][4] = 1'b0;
                zoom_xyz[0][1][4] = 1'b0; zoom_xyz[1][1][4] = 1'b0; zoom_xyz[2][1][4] = 1'b0; zoom_xyz[3][1][4] = 1'b0; zoom_xyz[4][1][4] = 1'b0; zoom_xyz[5][1][4] = 1'b0; zoom_xyz[6][1][4] = 1'b0; zoom_xyz[7][1][4] = 1'b0;
                zoom_xyz[0][2][4] = 1'b0; zoom_xyz[1][2][4] = 1'b0; zoom_xyz[2][2][4] = 1'b0; zoom_xyz[3][2][4] = 1'b0; zoom_xyz[4][2][4] = 1'b0; zoom_xyz[5][2][4] = 1'b0; zoom_xyz[6][2][4] = 1'b0; zoom_xyz[7][2][4] = 1'b0;
                zoom_xyz[0][3][4] = 1'b0; zoom_xyz[1][3][4] = 1'b0; zoom_xyz[2][3][4] = 1'b0; zoom_xyz[3][3][4] = 1'b1; zoom_xyz[4][3][4] = 1'b1; zoom_xyz[5][3][4] = 1'b0; zoom_xyz[6][3][4] = 1'b0; zoom_xyz[7][3][4] = 1'b0;
                zoom_xyz[0][4][4] = 1'b0; zoom_xyz[1][4][4] = 1'b0; zoom_xyz[2][4][4] = 1'b0; zoom_xyz[3][4][4] = 1'b1; zoom_xyz[4][4][4] = 1'b1; zoom_xyz[5][4][4] = 1'b0; zoom_xyz[6][4][4] = 1'b0; zoom_xyz[7][4][4] = 1'b0;
                zoom_xyz[0][5][4] = 1'b0; zoom_xyz[1][5][4] = 1'b0; zoom_xyz[2][5][4] = 1'b0; zoom_xyz[3][5][4] = 1'b0; zoom_xyz[4][5][4] = 1'b0; zoom_xyz[5][5][4] = 1'b0; zoom_xyz[6][5][4] = 1'b0; zoom_xyz[7][5][4] = 1'b0;
                zoom_xyz[0][6][4] = 1'b0; zoom_xyz[1][6][4] = 1'b0; zoom_xyz[2][6][4] = 1'b0; zoom_xyz[3][6][4] = 1'b0; zoom_xyz[4][6][4] = 1'b0; zoom_xyz[5][6][4] = 1'b0; zoom_xyz[6][6][4] = 1'b0; zoom_xyz[7][6][4] = 1'b0;
                zoom_xyz[0][7][4] = 1'b0; zoom_xyz[1][7][4] = 1'b0; zoom_xyz[2][7][4] = 1'b0; zoom_xyz[3][7][4] = 1'b0; zoom_xyz[4][7][4] = 1'b0; zoom_xyz[5][7][4] = 1'b0; zoom_xyz[6][7][4] = 1'b0; zoom_xyz[7][7][4] = 1'b0;
                zoom_xyz[0][0][5] = 1'b0; zoom_xyz[1][0][5] = 1'b0; zoom_xyz[2][0][5] = 1'b0; zoom_xyz[3][0][5] = 1'b0; zoom_xyz[4][0][5] = 1'b0; zoom_xyz[5][0][5] = 1'b0; zoom_xyz[6][0][5] = 1'b0; zoom_xyz[7][0][5] = 1'b0;
                zoom_xyz[0][1][5] = 1'b0; zoom_xyz[1][1][5] = 1'b0; zoom_xyz[2][1][5] = 1'b0; zoom_xyz[3][1][5] = 1'b0; zoom_xyz[4][1][5] = 1'b0; zoom_xyz[5][1][5] = 1'b0; zoom_xyz[6][1][5] = 1'b0; zoom_xyz[7][1][5] = 1'b0;
                zoom_xyz[0][2][5] = 1'b0; zoom_xyz[1][2][5] = 1'b0; zoom_xyz[2][2][5] = 1'b0; zoom_xyz[3][2][5] = 1'b0; zoom_xyz[4][2][5] = 1'b0; zoom_xyz[5][2][5] = 1'b0; zoom_xyz[6][2][5] = 1'b0; zoom_xyz[7][2][5] = 1'b0;
                zoom_xyz[0][3][5] = 1'b0; zoom_xyz[1][3][5] = 1'b0; zoom_xyz[2][3][5] = 1'b0; zoom_xyz[3][3][5] = 1'b0; zoom_xyz[4][3][5] = 1'b0; zoom_xyz[5][3][5] = 1'b0; zoom_xyz[6][3][5] = 1'b0; zoom_xyz[7][3][5] = 1'b0;
                zoom_xyz[0][4][5] = 1'b0; zoom_xyz[1][4][5] = 1'b0; zoom_xyz[2][4][5] = 1'b0; zoom_xyz[3][4][5] = 1'b0; zoom_xyz[4][4][5] = 1'b0; zoom_xyz[5][4][5] = 1'b0; zoom_xyz[6][4][5] = 1'b0; zoom_xyz[7][4][5] = 1'b0;
                zoom_xyz[0][5][5] = 1'b0; zoom_xyz[1][5][5] = 1'b0; zoom_xyz[2][5][5] = 1'b0; zoom_xyz[3][5][5] = 1'b0; zoom_xyz[4][5][5] = 1'b0; zoom_xyz[5][5][5] = 1'b0; zoom_xyz[6][5][5] = 1'b0; zoom_xyz[7][5][5] = 1'b0;
                zoom_xyz[0][6][5] = 1'b0; zoom_xyz[1][6][5] = 1'b0; zoom_xyz[2][6][5] = 1'b0; zoom_xyz[3][6][5] = 1'b0; zoom_xyz[4][6][5] = 1'b0; zoom_xyz[5][6][5] = 1'b0; zoom_xyz[6][6][5] = 1'b0; zoom_xyz[7][6][5] = 1'b0;
                zoom_xyz[0][7][5] = 1'b0; zoom_xyz[1][7][5] = 1'b0; zoom_xyz[2][7][5] = 1'b0; zoom_xyz[3][7][5] = 1'b0; zoom_xyz[4][7][5] = 1'b0; zoom_xyz[5][7][5] = 1'b0; zoom_xyz[6][7][5] = 1'b0; zoom_xyz[7][7][5] = 1'b0;
                zoom_xyz[0][0][6] = 1'b0; zoom_xyz[1][0][6] = 1'b0; zoom_xyz[2][0][6] = 1'b0; zoom_xyz[3][0][6] = 1'b0; zoom_xyz[4][0][6] = 1'b0; zoom_xyz[5][0][6] = 1'b0; zoom_xyz[6][0][6] = 1'b0; zoom_xyz[7][0][6] = 1'b0;
                zoom_xyz[0][1][6] = 1'b0; zoom_xyz[1][1][6] = 1'b0; zoom_xyz[2][1][6] = 1'b0; zoom_xyz[3][1][6] = 1'b0; zoom_xyz[4][1][6] = 1'b0; zoom_xyz[5][1][6] = 1'b0; zoom_xyz[6][1][6] = 1'b0; zoom_xyz[7][1][6] = 1'b0;
                zoom_xyz[0][2][6] = 1'b0; zoom_xyz[1][2][6] = 1'b0; zoom_xyz[2][2][6] = 1'b0; zoom_xyz[3][2][6] = 1'b0; zoom_xyz[4][2][6] = 1'b0; zoom_xyz[5][2][6] = 1'b0; zoom_xyz[6][2][6] = 1'b0; zoom_xyz[7][2][6] = 1'b0;
                zoom_xyz[0][3][6] = 1'b0; zoom_xyz[1][3][6] = 1'b0; zoom_xyz[2][3][6] = 1'b0; zoom_xyz[3][3][6] = 1'b0; zoom_xyz[4][3][6] = 1'b0; zoom_xyz[5][3][6] = 1'b0; zoom_xyz[6][3][6] = 1'b0; zoom_xyz[7][3][6] = 1'b0;
                zoom_xyz[0][4][6] = 1'b0; zoom_xyz[1][4][6] = 1'b0; zoom_xyz[2][4][6] = 1'b0; zoom_xyz[3][4][6] = 1'b0; zoom_xyz[4][4][6] = 1'b0; zoom_xyz[5][4][6] = 1'b0; zoom_xyz[6][4][6] = 1'b0; zoom_xyz[7][4][6] = 1'b0;
                zoom_xyz[0][5][6] = 1'b0; zoom_xyz[1][5][6] = 1'b0; zoom_xyz[2][5][6] = 1'b0; zoom_xyz[3][5][6] = 1'b0; zoom_xyz[4][5][6] = 1'b0; zoom_xyz[5][5][6] = 1'b0; zoom_xyz[6][5][6] = 1'b0; zoom_xyz[7][5][6] = 1'b0;
                zoom_xyz[0][6][6] = 1'b0; zoom_xyz[1][6][6] = 1'b0; zoom_xyz[2][6][6] = 1'b0; zoom_xyz[3][6][6] = 1'b0; zoom_xyz[4][6][6] = 1'b0; zoom_xyz[5][6][6] = 1'b0; zoom_xyz[6][6][6] = 1'b0; zoom_xyz[7][6][6] = 1'b0;
                zoom_xyz[0][7][6] = 1'b0; zoom_xyz[1][7][6] = 1'b0; zoom_xyz[2][7][6] = 1'b0; zoom_xyz[3][7][6] = 1'b0; zoom_xyz[4][7][6] = 1'b0; zoom_xyz[5][7][6] = 1'b0; zoom_xyz[6][7][6] = 1'b0; zoom_xyz[7][7][6] = 1'b0;
                zoom_xyz[0][0][7] = 1'b0; zoom_xyz[1][0][7] = 1'b0; zoom_xyz[2][0][7] = 1'b0; zoom_xyz[3][0][7] = 1'b0; zoom_xyz[4][0][7] = 1'b0; zoom_xyz[5][0][7] = 1'b0; zoom_xyz[6][0][7] = 1'b0; zoom_xyz[7][0][7] = 1'b0;
                zoom_xyz[0][1][7] = 1'b0; zoom_xyz[1][1][7] = 1'b0; zoom_xyz[2][1][7] = 1'b0; zoom_xyz[3][1][7] = 1'b0; zoom_xyz[4][1][7] = 1'b0; zoom_xyz[5][1][7] = 1'b0; zoom_xyz[6][1][7] = 1'b0; zoom_xyz[7][1][7] = 1'b0;
                zoom_xyz[0][2][7] = 1'b0; zoom_xyz[1][2][7] = 1'b0; zoom_xyz[2][2][7] = 1'b0; zoom_xyz[3][2][7] = 1'b0; zoom_xyz[4][2][7] = 1'b0; zoom_xyz[5][2][7] = 1'b0; zoom_xyz[6][2][7] = 1'b0; zoom_xyz[7][2][7] = 1'b0;
                zoom_xyz[0][3][7] = 1'b0; zoom_xyz[1][3][7] = 1'b0; zoom_xyz[2][3][7] = 1'b0; zoom_xyz[3][3][7] = 1'b0; zoom_xyz[4][3][7] = 1'b0; zoom_xyz[5][3][7] = 1'b0; zoom_xyz[6][3][7] = 1'b0; zoom_xyz[7][3][7] = 1'b0;
                zoom_xyz[0][4][7] = 1'b0; zoom_xyz[1][4][7] = 1'b0; zoom_xyz[2][4][7] = 1'b0; zoom_xyz[3][4][7] = 1'b0; zoom_xyz[4][4][7] = 1'b0; zoom_xyz[5][4][7] = 1'b0; zoom_xyz[6][4][7] = 1'b0; zoom_xyz[7][4][7] = 1'b0;
                zoom_xyz[0][5][7] = 1'b0; zoom_xyz[1][5][7] = 1'b0; zoom_xyz[2][5][7] = 1'b0; zoom_xyz[3][5][7] = 1'b0; zoom_xyz[4][5][7] = 1'b0; zoom_xyz[5][5][7] = 1'b0; zoom_xyz[6][5][7] = 1'b0; zoom_xyz[7][5][7] = 1'b0;
                zoom_xyz[0][6][7] = 1'b0; zoom_xyz[1][6][7] = 1'b0; zoom_xyz[2][6][7] = 1'b0; zoom_xyz[3][6][7] = 1'b0; zoom_xyz[4][6][7] = 1'b0; zoom_xyz[5][6][7] = 1'b0; zoom_xyz[6][6][7] = 1'b0; zoom_xyz[7][6][7] = 1'b0;
                zoom_xyz[0][7][7] = 1'b0; zoom_xyz[1][7][7] = 1'b0; zoom_xyz[2][7][7] = 1'b0; zoom_xyz[3][7][7] = 1'b0; zoom_xyz[4][7][7] = 1'b0; zoom_xyz[5][7][7] = 1'b0; zoom_xyz[6][7][7] = 1'b0; zoom_xyz[7][7][7] = 1'b0;
            end
            3'd4: begin     
                zoom_xyz[0][0][0] = 1'b0; zoom_xyz[1][0][0] = 1'b0; zoom_xyz[2][0][0] = 1'b0; zoom_xyz[3][0][0] = 1'b0; zoom_xyz[4][0][0] = 1'b0; zoom_xyz[5][0][0] = 1'b0; zoom_xyz[6][0][0] = 1'b0; zoom_xyz[7][0][0] = 1'b0;
                zoom_xyz[0][1][0] = 1'b0; zoom_xyz[1][1][0] = 1'b0; zoom_xyz[2][1][0] = 1'b0; zoom_xyz[3][1][0] = 1'b0; zoom_xyz[4][1][0] = 1'b0; zoom_xyz[5][1][0] = 1'b0; zoom_xyz[6][1][0] = 1'b0; zoom_xyz[7][1][0] = 1'b0;
                zoom_xyz[0][2][0] = 1'b0; zoom_xyz[1][2][0] = 1'b0; zoom_xyz[2][2][0] = 1'b0; zoom_xyz[3][2][0] = 1'b0; zoom_xyz[4][2][0] = 1'b0; zoom_xyz[5][2][0] = 1'b0; zoom_xyz[6][2][0] = 1'b0; zoom_xyz[7][2][0] = 1'b0;
                zoom_xyz[0][3][0] = 1'b0; zoom_xyz[1][3][0] = 1'b0; zoom_xyz[2][3][0] = 1'b0; zoom_xyz[3][3][0] = 1'b0; zoom_xyz[4][3][0] = 1'b0; zoom_xyz[5][3][0] = 1'b0; zoom_xyz[6][3][0] = 1'b0; zoom_xyz[7][3][0] = 1'b0;
                zoom_xyz[0][4][0] = 1'b0; zoom_xyz[1][4][0] = 1'b0; zoom_xyz[2][4][0] = 1'b0; zoom_xyz[3][4][0] = 1'b0; zoom_xyz[4][4][0] = 1'b0; zoom_xyz[5][4][0] = 1'b0; zoom_xyz[6][4][0] = 1'b0; zoom_xyz[7][4][0] = 1'b0;
                zoom_xyz[0][5][0] = 1'b0; zoom_xyz[1][5][0] = 1'b0; zoom_xyz[2][5][0] = 1'b0; zoom_xyz[3][5][0] = 1'b0; zoom_xyz[4][5][0] = 1'b0; zoom_xyz[5][5][0] = 1'b0; zoom_xyz[6][5][0] = 1'b0; zoom_xyz[7][5][0] = 1'b0;
                zoom_xyz[0][6][0] = 1'b0; zoom_xyz[1][6][0] = 1'b0; zoom_xyz[2][6][0] = 1'b0; zoom_xyz[3][6][0] = 1'b0; zoom_xyz[4][6][0] = 1'b0; zoom_xyz[5][6][0] = 1'b0; zoom_xyz[6][6][0] = 1'b0; zoom_xyz[7][6][0] = 1'b0;
                zoom_xyz[0][7][0] = 1'b0; zoom_xyz[1][7][0] = 1'b0; zoom_xyz[2][7][0] = 1'b0; zoom_xyz[3][7][0] = 1'b0; zoom_xyz[4][7][0] = 1'b0; zoom_xyz[5][7][0] = 1'b0; zoom_xyz[6][7][0] = 1'b0; zoom_xyz[7][7][0] = 1'b0;
                zoom_xyz[0][0][1] = 1'b0; zoom_xyz[1][0][1] = 1'b0; zoom_xyz[2][0][1] = 1'b0; zoom_xyz[3][0][1] = 1'b0; zoom_xyz[4][0][1] = 1'b0; zoom_xyz[5][0][1] = 1'b0; zoom_xyz[6][0][1] = 1'b0; zoom_xyz[7][0][1] = 1'b0;
                zoom_xyz[0][1][1] = 1'b0; zoom_xyz[1][1][1] = 1'b0; zoom_xyz[2][1][1] = 1'b0; zoom_xyz[3][1][1] = 1'b0; zoom_xyz[4][1][1] = 1'b0; zoom_xyz[5][1][1] = 1'b0; zoom_xyz[6][1][1] = 1'b0; zoom_xyz[7][1][1] = 1'b0;
                zoom_xyz[0][2][1] = 1'b0; zoom_xyz[1][2][1] = 1'b0; zoom_xyz[2][2][1] = 1'b0; zoom_xyz[3][2][1] = 1'b0; zoom_xyz[4][2][1] = 1'b0; zoom_xyz[5][2][1] = 1'b0; zoom_xyz[6][2][1] = 1'b0; zoom_xyz[7][2][1] = 1'b0;
                zoom_xyz[0][3][1] = 1'b0; zoom_xyz[1][3][1] = 1'b0; zoom_xyz[2][3][1] = 1'b0; zoom_xyz[3][3][1] = 1'b0; zoom_xyz[4][3][1] = 1'b0; zoom_xyz[5][3][1] = 1'b0; zoom_xyz[6][3][1] = 1'b0; zoom_xyz[7][3][1] = 1'b0;
                zoom_xyz[0][4][1] = 1'b0; zoom_xyz[1][4][1] = 1'b0; zoom_xyz[2][4][1] = 1'b0; zoom_xyz[3][4][1] = 1'b0; zoom_xyz[4][4][1] = 1'b0; zoom_xyz[5][4][1] = 1'b0; zoom_xyz[6][4][1] = 1'b0; zoom_xyz[7][4][1] = 1'b0;
                zoom_xyz[0][5][1] = 1'b0; zoom_xyz[1][5][1] = 1'b0; zoom_xyz[2][5][1] = 1'b0; zoom_xyz[3][5][1] = 1'b0; zoom_xyz[4][5][1] = 1'b0; zoom_xyz[5][5][1] = 1'b0; zoom_xyz[6][5][1] = 1'b0; zoom_xyz[7][5][1] = 1'b0;
                zoom_xyz[0][6][1] = 1'b0; zoom_xyz[1][6][1] = 1'b0; zoom_xyz[2][6][1] = 1'b0; zoom_xyz[3][6][1] = 1'b0; zoom_xyz[4][6][1] = 1'b0; zoom_xyz[5][6][1] = 1'b0; zoom_xyz[6][6][1] = 1'b0; zoom_xyz[7][6][1] = 1'b0;
                zoom_xyz[0][7][1] = 1'b0; zoom_xyz[1][7][1] = 1'b0; zoom_xyz[2][7][1] = 1'b0; zoom_xyz[3][7][1] = 1'b0; zoom_xyz[4][7][1] = 1'b0; zoom_xyz[5][7][1] = 1'b0; zoom_xyz[6][7][1] = 1'b0; zoom_xyz[7][7][1] = 1'b0;
                zoom_xyz[0][0][2] = 1'b0; zoom_xyz[1][0][2] = 1'b0; zoom_xyz[2][0][2] = 1'b0; zoom_xyz[3][0][2] = 1'b0; zoom_xyz[4][0][2] = 1'b0; zoom_xyz[5][0][2] = 1'b0; zoom_xyz[6][0][2] = 1'b0; zoom_xyz[7][0][2] = 1'b0;
                zoom_xyz[0][1][2] = 1'b0; zoom_xyz[1][1][2] = 1'b0; zoom_xyz[2][1][2] = 1'b0; zoom_xyz[3][1][2] = 1'b0; zoom_xyz[4][1][2] = 1'b0; zoom_xyz[5][1][2] = 1'b0; zoom_xyz[6][1][2] = 1'b0; zoom_xyz[7][1][2] = 1'b0;
                zoom_xyz[0][2][2] = 1'b0; zoom_xyz[1][2][2] = 1'b0; zoom_xyz[2][2][2] = 1'b0; zoom_xyz[3][2][2] = 1'b0; zoom_xyz[4][2][2] = 1'b0; zoom_xyz[5][2][2] = 1'b0; zoom_xyz[6][2][2] = 1'b0; zoom_xyz[7][2][2] = 1'b0;
                zoom_xyz[0][3][2] = 1'b0; zoom_xyz[1][3][2] = 1'b0; zoom_xyz[2][3][2] = 1'b0; zoom_xyz[3][3][2] = 1'b0; zoom_xyz[4][3][2] = 1'b0; zoom_xyz[5][3][2] = 1'b0; zoom_xyz[6][3][2] = 1'b0; zoom_xyz[7][3][2] = 1'b0;
                zoom_xyz[0][4][2] = 1'b0; zoom_xyz[1][4][2] = 1'b0; zoom_xyz[2][4][2] = 1'b0; zoom_xyz[3][4][2] = 1'b0; zoom_xyz[4][4][2] = 1'b0; zoom_xyz[5][4][2] = 1'b0; zoom_xyz[6][4][2] = 1'b0; zoom_xyz[7][4][2] = 1'b0;
                zoom_xyz[0][5][2] = 1'b0; zoom_xyz[1][5][2] = 1'b0; zoom_xyz[2][5][2] = 1'b0; zoom_xyz[3][5][2] = 1'b0; zoom_xyz[4][5][2] = 1'b0; zoom_xyz[5][5][2] = 1'b0; zoom_xyz[6][5][2] = 1'b0; zoom_xyz[7][5][2] = 1'b0;
                zoom_xyz[0][6][2] = 1'b0; zoom_xyz[1][6][2] = 1'b0; zoom_xyz[2][6][2] = 1'b0; zoom_xyz[3][6][2] = 1'b0; zoom_xyz[4][6][2] = 1'b0; zoom_xyz[5][6][2] = 1'b0; zoom_xyz[6][6][2] = 1'b0; zoom_xyz[7][6][2] = 1'b0;
                zoom_xyz[0][7][2] = 1'b0; zoom_xyz[1][7][2] = 1'b0; zoom_xyz[2][7][2] = 1'b0; zoom_xyz[3][7][2] = 1'b0; zoom_xyz[4][7][2] = 1'b0; zoom_xyz[5][7][2] = 1'b0; zoom_xyz[6][7][2] = 1'b0; zoom_xyz[7][7][2] = 1'b0;
                zoom_xyz[0][0][3] = 1'b0; zoom_xyz[1][0][3] = 1'b0; zoom_xyz[2][0][3] = 1'b0; zoom_xyz[3][0][3] = 1'b0; zoom_xyz[4][0][3] = 1'b0; zoom_xyz[5][0][3] = 1'b0; zoom_xyz[6][0][3] = 1'b0; zoom_xyz[7][0][3] = 1'b0;
                zoom_xyz[0][1][3] = 1'b0; zoom_xyz[1][1][3] = 1'b0; zoom_xyz[2][1][3] = 1'b0; zoom_xyz[3][1][3] = 1'b0; zoom_xyz[4][1][3] = 1'b0; zoom_xyz[5][1][3] = 1'b0; zoom_xyz[6][1][3] = 1'b0; zoom_xyz[7][1][3] = 1'b0;
                zoom_xyz[0][2][3] = 1'b0; zoom_xyz[1][2][3] = 1'b0; zoom_xyz[2][2][3] = 1'b0; zoom_xyz[3][2][3] = 1'b0; zoom_xyz[4][2][3] = 1'b0; zoom_xyz[5][2][3] = 1'b0; zoom_xyz[6][2][3] = 1'b0; zoom_xyz[7][2][3] = 1'b0;
                zoom_xyz[0][3][3] = 1'b0; zoom_xyz[1][3][3] = 1'b0; zoom_xyz[2][3][3] = 1'b0; zoom_xyz[3][3][3] = 1'b1; zoom_xyz[4][3][3] = 1'b1; zoom_xyz[5][3][3] = 1'b0; zoom_xyz[6][3][3] = 1'b0; zoom_xyz[7][3][3] = 1'b0;
                zoom_xyz[0][4][3] = 1'b0; zoom_xyz[1][4][3] = 1'b0; zoom_xyz[2][4][3] = 1'b0; zoom_xyz[3][4][3] = 1'b1; zoom_xyz[4][4][3] = 1'b1; zoom_xyz[5][4][3] = 1'b0; zoom_xyz[6][4][3] = 1'b0; zoom_xyz[7][4][3] = 1'b0;
                zoom_xyz[0][5][3] = 1'b0; zoom_xyz[1][5][3] = 1'b0; zoom_xyz[2][5][3] = 1'b0; zoom_xyz[3][5][3] = 1'b0; zoom_xyz[4][5][3] = 1'b0; zoom_xyz[5][5][3] = 1'b0; zoom_xyz[6][5][3] = 1'b0; zoom_xyz[7][5][3] = 1'b0;
                zoom_xyz[0][6][3] = 1'b0; zoom_xyz[1][6][3] = 1'b0; zoom_xyz[2][6][3] = 1'b0; zoom_xyz[3][6][3] = 1'b0; zoom_xyz[4][6][3] = 1'b0; zoom_xyz[5][6][3] = 1'b0; zoom_xyz[6][6][3] = 1'b0; zoom_xyz[7][6][3] = 1'b0;
                zoom_xyz[0][7][3] = 1'b0; zoom_xyz[1][7][3] = 1'b0; zoom_xyz[2][7][3] = 1'b0; zoom_xyz[3][7][3] = 1'b0; zoom_xyz[4][7][3] = 1'b0; zoom_xyz[5][7][3] = 1'b0; zoom_xyz[6][7][3] = 1'b0; zoom_xyz[7][7][3] = 1'b0;
                zoom_xyz[0][0][4] = 1'b0; zoom_xyz[1][0][4] = 1'b0; zoom_xyz[2][0][4] = 1'b0; zoom_xyz[3][0][4] = 1'b0; zoom_xyz[4][0][4] = 1'b0; zoom_xyz[5][0][4] = 1'b0; zoom_xyz[6][0][4] = 1'b0; zoom_xyz[7][0][4] = 1'b0;
                zoom_xyz[0][1][4] = 1'b0; zoom_xyz[1][1][4] = 1'b0; zoom_xyz[2][1][4] = 1'b0; zoom_xyz[3][1][4] = 1'b0; zoom_xyz[4][1][4] = 1'b0; zoom_xyz[5][1][4] = 1'b0; zoom_xyz[6][1][4] = 1'b0; zoom_xyz[7][1][4] = 1'b0;
                zoom_xyz[0][2][4] = 1'b0; zoom_xyz[1][2][4] = 1'b0; zoom_xyz[2][2][4] = 1'b0; zoom_xyz[3][2][4] = 1'b0; zoom_xyz[4][2][4] = 1'b0; zoom_xyz[5][2][4] = 1'b0; zoom_xyz[6][2][4] = 1'b0; zoom_xyz[7][2][4] = 1'b0;
                zoom_xyz[0][3][4] = 1'b0; zoom_xyz[1][3][4] = 1'b0; zoom_xyz[2][3][4] = 1'b0; zoom_xyz[3][3][4] = 1'b1; zoom_xyz[4][3][4] = 1'b1; zoom_xyz[5][3][4] = 1'b0; zoom_xyz[6][3][4] = 1'b0; zoom_xyz[7][3][4] = 1'b0;
                zoom_xyz[0][4][4] = 1'b0; zoom_xyz[1][4][4] = 1'b0; zoom_xyz[2][4][4] = 1'b0; zoom_xyz[3][4][4] = 1'b1; zoom_xyz[4][4][4] = 1'b1; zoom_xyz[5][4][4] = 1'b0; zoom_xyz[6][4][4] = 1'b0; zoom_xyz[7][4][4] = 1'b0;
                zoom_xyz[0][5][4] = 1'b0; zoom_xyz[1][5][4] = 1'b0; zoom_xyz[2][5][4] = 1'b0; zoom_xyz[3][5][4] = 1'b0; zoom_xyz[4][5][4] = 1'b0; zoom_xyz[5][5][4] = 1'b0; zoom_xyz[6][5][4] = 1'b0; zoom_xyz[7][5][4] = 1'b0;
                zoom_xyz[0][6][4] = 1'b0; zoom_xyz[1][6][4] = 1'b0; zoom_xyz[2][6][4] = 1'b0; zoom_xyz[3][6][4] = 1'b0; zoom_xyz[4][6][4] = 1'b0; zoom_xyz[5][6][4] = 1'b0; zoom_xyz[6][6][4] = 1'b0; zoom_xyz[7][6][4] = 1'b0;
                zoom_xyz[0][7][4] = 1'b0; zoom_xyz[1][7][4] = 1'b0; zoom_xyz[2][7][4] = 1'b0; zoom_xyz[3][7][4] = 1'b0; zoom_xyz[4][7][4] = 1'b0; zoom_xyz[5][7][4] = 1'b0; zoom_xyz[6][7][4] = 1'b0; zoom_xyz[7][7][4] = 1'b0;
                zoom_xyz[0][0][5] = 1'b0; zoom_xyz[1][0][5] = 1'b0; zoom_xyz[2][0][5] = 1'b0; zoom_xyz[3][0][5] = 1'b0; zoom_xyz[4][0][5] = 1'b0; zoom_xyz[5][0][5] = 1'b0; zoom_xyz[6][0][5] = 1'b0; zoom_xyz[7][0][5] = 1'b0;
                zoom_xyz[0][1][5] = 1'b0; zoom_xyz[1][1][5] = 1'b0; zoom_xyz[2][1][5] = 1'b0; zoom_xyz[3][1][5] = 1'b0; zoom_xyz[4][1][5] = 1'b0; zoom_xyz[5][1][5] = 1'b0; zoom_xyz[6][1][5] = 1'b0; zoom_xyz[7][1][5] = 1'b0;
                zoom_xyz[0][2][5] = 1'b0; zoom_xyz[1][2][5] = 1'b0; zoom_xyz[2][2][5] = 1'b0; zoom_xyz[3][2][5] = 1'b0; zoom_xyz[4][2][5] = 1'b0; zoom_xyz[5][2][5] = 1'b0; zoom_xyz[6][2][5] = 1'b0; zoom_xyz[7][2][5] = 1'b0;
                zoom_xyz[0][3][5] = 1'b0; zoom_xyz[1][3][5] = 1'b0; zoom_xyz[2][3][5] = 1'b0; zoom_xyz[3][3][5] = 1'b0; zoom_xyz[4][3][5] = 1'b0; zoom_xyz[5][3][5] = 1'b0; zoom_xyz[6][3][5] = 1'b0; zoom_xyz[7][3][5] = 1'b0;
                zoom_xyz[0][4][5] = 1'b0; zoom_xyz[1][4][5] = 1'b0; zoom_xyz[2][4][5] = 1'b0; zoom_xyz[3][4][5] = 1'b0; zoom_xyz[4][4][5] = 1'b0; zoom_xyz[5][4][5] = 1'b0; zoom_xyz[6][4][5] = 1'b0; zoom_xyz[7][4][5] = 1'b0;
                zoom_xyz[0][5][5] = 1'b0; zoom_xyz[1][5][5] = 1'b0; zoom_xyz[2][5][5] = 1'b0; zoom_xyz[3][5][5] = 1'b0; zoom_xyz[4][5][5] = 1'b0; zoom_xyz[5][5][5] = 1'b0; zoom_xyz[6][5][5] = 1'b0; zoom_xyz[7][5][5] = 1'b0;
                zoom_xyz[0][6][5] = 1'b0; zoom_xyz[1][6][5] = 1'b0; zoom_xyz[2][6][5] = 1'b0; zoom_xyz[3][6][5] = 1'b0; zoom_xyz[4][6][5] = 1'b0; zoom_xyz[5][6][5] = 1'b0; zoom_xyz[6][6][5] = 1'b0; zoom_xyz[7][6][5] = 1'b0;
                zoom_xyz[0][7][5] = 1'b0; zoom_xyz[1][7][5] = 1'b0; zoom_xyz[2][7][5] = 1'b0; zoom_xyz[3][7][5] = 1'b0; zoom_xyz[4][7][5] = 1'b0; zoom_xyz[5][7][5] = 1'b0; zoom_xyz[6][7][5] = 1'b0; zoom_xyz[7][7][5] = 1'b0;
                zoom_xyz[0][0][6] = 1'b0; zoom_xyz[1][0][6] = 1'b0; zoom_xyz[2][0][6] = 1'b0; zoom_xyz[3][0][6] = 1'b0; zoom_xyz[4][0][6] = 1'b0; zoom_xyz[5][0][6] = 1'b0; zoom_xyz[6][0][6] = 1'b0; zoom_xyz[7][0][6] = 1'b0;
                zoom_xyz[0][1][6] = 1'b0; zoom_xyz[1][1][6] = 1'b0; zoom_xyz[2][1][6] = 1'b0; zoom_xyz[3][1][6] = 1'b0; zoom_xyz[4][1][6] = 1'b0; zoom_xyz[5][1][6] = 1'b0; zoom_xyz[6][1][6] = 1'b0; zoom_xyz[7][1][6] = 1'b0;
                zoom_xyz[0][2][6] = 1'b0; zoom_xyz[1][2][6] = 1'b0; zoom_xyz[2][2][6] = 1'b0; zoom_xyz[3][2][6] = 1'b0; zoom_xyz[4][2][6] = 1'b0; zoom_xyz[5][2][6] = 1'b0; zoom_xyz[6][2][6] = 1'b0; zoom_xyz[7][2][6] = 1'b0;
                zoom_xyz[0][3][6] = 1'b0; zoom_xyz[1][3][6] = 1'b0; zoom_xyz[2][3][6] = 1'b0; zoom_xyz[3][3][6] = 1'b0; zoom_xyz[4][3][6] = 1'b0; zoom_xyz[5][3][6] = 1'b0; zoom_xyz[6][3][6] = 1'b0; zoom_xyz[7][3][6] = 1'b0;
                zoom_xyz[0][4][6] = 1'b0; zoom_xyz[1][4][6] = 1'b0; zoom_xyz[2][4][6] = 1'b0; zoom_xyz[3][4][6] = 1'b0; zoom_xyz[4][4][6] = 1'b0; zoom_xyz[5][4][6] = 1'b0; zoom_xyz[6][4][6] = 1'b0; zoom_xyz[7][4][6] = 1'b0;
                zoom_xyz[0][5][6] = 1'b0; zoom_xyz[1][5][6] = 1'b0; zoom_xyz[2][5][6] = 1'b0; zoom_xyz[3][5][6] = 1'b0; zoom_xyz[4][5][6] = 1'b0; zoom_xyz[5][5][6] = 1'b0; zoom_xyz[6][5][6] = 1'b0; zoom_xyz[7][5][6] = 1'b0;
                zoom_xyz[0][6][6] = 1'b0; zoom_xyz[1][6][6] = 1'b0; zoom_xyz[2][6][6] = 1'b0; zoom_xyz[3][6][6] = 1'b0; zoom_xyz[4][6][6] = 1'b0; zoom_xyz[5][6][6] = 1'b0; zoom_xyz[6][6][6] = 1'b0; zoom_xyz[7][6][6] = 1'b0;
                zoom_xyz[0][7][6] = 1'b0; zoom_xyz[1][7][6] = 1'b0; zoom_xyz[2][7][6] = 1'b0; zoom_xyz[3][7][6] = 1'b0; zoom_xyz[4][7][6] = 1'b0; zoom_xyz[5][7][6] = 1'b0; zoom_xyz[6][7][6] = 1'b0; zoom_xyz[7][7][6] = 1'b0;
                zoom_xyz[0][0][7] = 1'b0; zoom_xyz[1][0][7] = 1'b0; zoom_xyz[2][0][7] = 1'b0; zoom_xyz[3][0][7] = 1'b0; zoom_xyz[4][0][7] = 1'b0; zoom_xyz[5][0][7] = 1'b0; zoom_xyz[6][0][7] = 1'b0; zoom_xyz[7][0][7] = 1'b0;
                zoom_xyz[0][1][7] = 1'b0; zoom_xyz[1][1][7] = 1'b0; zoom_xyz[2][1][7] = 1'b0; zoom_xyz[3][1][7] = 1'b0; zoom_xyz[4][1][7] = 1'b0; zoom_xyz[5][1][7] = 1'b0; zoom_xyz[6][1][7] = 1'b0; zoom_xyz[7][1][7] = 1'b0;
                zoom_xyz[0][2][7] = 1'b0; zoom_xyz[1][2][7] = 1'b0; zoom_xyz[2][2][7] = 1'b0; zoom_xyz[3][2][7] = 1'b0; zoom_xyz[4][2][7] = 1'b0; zoom_xyz[5][2][7] = 1'b0; zoom_xyz[6][2][7] = 1'b0; zoom_xyz[7][2][7] = 1'b0;
                zoom_xyz[0][3][7] = 1'b0; zoom_xyz[1][3][7] = 1'b0; zoom_xyz[2][3][7] = 1'b0; zoom_xyz[3][3][7] = 1'b0; zoom_xyz[4][3][7] = 1'b0; zoom_xyz[5][3][7] = 1'b0; zoom_xyz[6][3][7] = 1'b0; zoom_xyz[7][3][7] = 1'b0;
                zoom_xyz[0][4][7] = 1'b0; zoom_xyz[1][4][7] = 1'b0; zoom_xyz[2][4][7] = 1'b0; zoom_xyz[3][4][7] = 1'b0; zoom_xyz[4][4][7] = 1'b0; zoom_xyz[5][4][7] = 1'b0; zoom_xyz[6][4][7] = 1'b0; zoom_xyz[7][4][7] = 1'b0;
                zoom_xyz[0][5][7] = 1'b0; zoom_xyz[1][5][7] = 1'b0; zoom_xyz[2][5][7] = 1'b0; zoom_xyz[3][5][7] = 1'b0; zoom_xyz[4][5][7] = 1'b0; zoom_xyz[5][5][7] = 1'b0; zoom_xyz[6][5][7] = 1'b0; zoom_xyz[7][5][7] = 1'b0;
                zoom_xyz[0][6][7] = 1'b0; zoom_xyz[1][6][7] = 1'b0; zoom_xyz[2][6][7] = 1'b0; zoom_xyz[3][6][7] = 1'b0; zoom_xyz[4][6][7] = 1'b0; zoom_xyz[5][6][7] = 1'b0; zoom_xyz[6][6][7] = 1'b0; zoom_xyz[7][6][7] = 1'b0;
                zoom_xyz[0][7][7] = 1'b0; zoom_xyz[1][7][7] = 1'b0; zoom_xyz[2][7][7] = 1'b0; zoom_xyz[3][7][7] = 1'b0; zoom_xyz[4][7][7] = 1'b0; zoom_xyz[5][7][7] = 1'b0; zoom_xyz[6][7][7] = 1'b0; zoom_xyz[7][7][7] = 1'b0;
            end
            3'd5: begin     
                zoom_xyz[0][0][0] = 1'b0; zoom_xyz[1][0][0] = 1'b0; zoom_xyz[2][0][0] = 1'b0; zoom_xyz[3][0][0] = 1'b0; zoom_xyz[4][0][0] = 1'b0; zoom_xyz[5][0][0] = 1'b0; zoom_xyz[6][0][0] = 1'b0; zoom_xyz[7][0][0] = 1'b0;
                zoom_xyz[0][1][0] = 1'b0; zoom_xyz[1][1][0] = 1'b0; zoom_xyz[2][1][0] = 1'b0; zoom_xyz[3][1][0] = 1'b0; zoom_xyz[4][1][0] = 1'b0; zoom_xyz[5][1][0] = 1'b0; zoom_xyz[6][1][0] = 1'b0; zoom_xyz[7][1][0] = 1'b0;
                zoom_xyz[0][2][0] = 1'b0; zoom_xyz[1][2][0] = 1'b0; zoom_xyz[2][2][0] = 1'b0; zoom_xyz[3][2][0] = 1'b0; zoom_xyz[4][2][0] = 1'b0; zoom_xyz[5][2][0] = 1'b0; zoom_xyz[6][2][0] = 1'b0; zoom_xyz[7][2][0] = 1'b0;
                zoom_xyz[0][3][0] = 1'b0; zoom_xyz[1][3][0] = 1'b0; zoom_xyz[2][3][0] = 1'b0; zoom_xyz[3][3][0] = 1'b0; zoom_xyz[4][3][0] = 1'b0; zoom_xyz[5][3][0] = 1'b0; zoom_xyz[6][3][0] = 1'b0; zoom_xyz[7][3][0] = 1'b0;
                zoom_xyz[0][4][0] = 1'b0; zoom_xyz[1][4][0] = 1'b0; zoom_xyz[2][4][0] = 1'b0; zoom_xyz[3][4][0] = 1'b0; zoom_xyz[4][4][0] = 1'b0; zoom_xyz[5][4][0] = 1'b0; zoom_xyz[6][4][0] = 1'b0; zoom_xyz[7][4][0] = 1'b0;
                zoom_xyz[0][5][0] = 1'b0; zoom_xyz[1][5][0] = 1'b0; zoom_xyz[2][5][0] = 1'b0; zoom_xyz[3][5][0] = 1'b0; zoom_xyz[4][5][0] = 1'b0; zoom_xyz[5][5][0] = 1'b0; zoom_xyz[6][5][0] = 1'b0; zoom_xyz[7][5][0] = 1'b0;
                zoom_xyz[0][6][0] = 1'b0; zoom_xyz[1][6][0] = 1'b0; zoom_xyz[2][6][0] = 1'b0; zoom_xyz[3][6][0] = 1'b0; zoom_xyz[4][6][0] = 1'b0; zoom_xyz[5][6][0] = 1'b0; zoom_xyz[6][6][0] = 1'b0; zoom_xyz[7][6][0] = 1'b0;
                zoom_xyz[0][7][0] = 1'b0; zoom_xyz[1][7][0] = 1'b0; zoom_xyz[2][7][0] = 1'b0; zoom_xyz[3][7][0] = 1'b0; zoom_xyz[4][7][0] = 1'b0; zoom_xyz[5][7][0] = 1'b0; zoom_xyz[6][7][0] = 1'b0; zoom_xyz[7][7][0] = 1'b0;
                zoom_xyz[0][0][1] = 1'b0; zoom_xyz[1][0][1] = 1'b0; zoom_xyz[2][0][1] = 1'b0; zoom_xyz[3][0][1] = 1'b0; zoom_xyz[4][0][1] = 1'b0; zoom_xyz[5][0][1] = 1'b0; zoom_xyz[6][0][1] = 1'b0; zoom_xyz[7][0][1] = 1'b0;
                zoom_xyz[0][1][1] = 1'b0; zoom_xyz[1][1][1] = 1'b0; zoom_xyz[2][1][1] = 1'b0; zoom_xyz[3][1][1] = 1'b0; zoom_xyz[4][1][1] = 1'b0; zoom_xyz[5][1][1] = 1'b0; zoom_xyz[6][1][1] = 1'b0; zoom_xyz[7][1][1] = 1'b0;
                zoom_xyz[0][2][1] = 1'b0; zoom_xyz[1][2][1] = 1'b0; zoom_xyz[2][2][1] = 1'b0; zoom_xyz[3][2][1] = 1'b0; zoom_xyz[4][2][1] = 1'b0; zoom_xyz[5][2][1] = 1'b0; zoom_xyz[6][2][1] = 1'b0; zoom_xyz[7][2][1] = 1'b0;
                zoom_xyz[0][3][1] = 1'b0; zoom_xyz[1][3][1] = 1'b0; zoom_xyz[2][3][1] = 1'b0; zoom_xyz[3][3][1] = 1'b0; zoom_xyz[4][3][1] = 1'b0; zoom_xyz[5][3][1] = 1'b0; zoom_xyz[6][3][1] = 1'b0; zoom_xyz[7][3][1] = 1'b0;
                zoom_xyz[0][4][1] = 1'b0; zoom_xyz[1][4][1] = 1'b0; zoom_xyz[2][4][1] = 1'b0; zoom_xyz[3][4][1] = 1'b0; zoom_xyz[4][4][1] = 1'b0; zoom_xyz[5][4][1] = 1'b0; zoom_xyz[6][4][1] = 1'b0; zoom_xyz[7][4][1] = 1'b0;
                zoom_xyz[0][5][1] = 1'b0; zoom_xyz[1][5][1] = 1'b0; zoom_xyz[2][5][1] = 1'b0; zoom_xyz[3][5][1] = 1'b0; zoom_xyz[4][5][1] = 1'b0; zoom_xyz[5][5][1] = 1'b0; zoom_xyz[6][5][1] = 1'b0; zoom_xyz[7][5][1] = 1'b0;
                zoom_xyz[0][6][1] = 1'b0; zoom_xyz[1][6][1] = 1'b0; zoom_xyz[2][6][1] = 1'b0; zoom_xyz[3][6][1] = 1'b0; zoom_xyz[4][6][1] = 1'b0; zoom_xyz[5][6][1] = 1'b0; zoom_xyz[6][6][1] = 1'b0; zoom_xyz[7][6][1] = 1'b0;
                zoom_xyz[0][7][1] = 1'b0; zoom_xyz[1][7][1] = 1'b0; zoom_xyz[2][7][1] = 1'b0; zoom_xyz[3][7][1] = 1'b0; zoom_xyz[4][7][1] = 1'b0; zoom_xyz[5][7][1] = 1'b0; zoom_xyz[6][7][1] = 1'b0; zoom_xyz[7][7][1] = 1'b0;
                zoom_xyz[0][0][2] = 1'b0; zoom_xyz[1][0][2] = 1'b0; zoom_xyz[2][0][2] = 1'b0; zoom_xyz[3][0][2] = 1'b0; zoom_xyz[4][0][2] = 1'b0; zoom_xyz[5][0][2] = 1'b0; zoom_xyz[6][0][2] = 1'b0; zoom_xyz[7][0][2] = 1'b0;
                zoom_xyz[0][1][2] = 1'b0; zoom_xyz[1][1][2] = 1'b0; zoom_xyz[2][1][2] = 1'b0; zoom_xyz[3][1][2] = 1'b0; zoom_xyz[4][1][2] = 1'b0; zoom_xyz[5][1][2] = 1'b0; zoom_xyz[6][1][2] = 1'b0; zoom_xyz[7][1][2] = 1'b0;
                zoom_xyz[0][2][2] = 1'b0; zoom_xyz[1][2][2] = 1'b0; zoom_xyz[2][2][2] = 1'b1; zoom_xyz[3][2][2] = 1'b1; zoom_xyz[4][2][2] = 1'b1; zoom_xyz[5][2][2] = 1'b1; zoom_xyz[6][2][2] = 1'b0; zoom_xyz[7][2][2] = 1'b0;
                zoom_xyz[0][3][2] = 1'b0; zoom_xyz[1][3][2] = 1'b0; zoom_xyz[2][3][2] = 1'b1; zoom_xyz[3][3][2] = 1'b1; zoom_xyz[4][3][2] = 1'b1; zoom_xyz[5][3][2] = 1'b1; zoom_xyz[6][3][2] = 1'b0; zoom_xyz[7][3][2] = 1'b0;
                zoom_xyz[0][4][2] = 1'b0; zoom_xyz[1][4][2] = 1'b0; zoom_xyz[2][4][2] = 1'b1; zoom_xyz[3][4][2] = 1'b1; zoom_xyz[4][4][2] = 1'b1; zoom_xyz[5][4][2] = 1'b1; zoom_xyz[6][4][2] = 1'b0; zoom_xyz[7][4][2] = 1'b0;
                zoom_xyz[0][5][2] = 1'b0; zoom_xyz[1][5][2] = 1'b0; zoom_xyz[2][5][2] = 1'b1; zoom_xyz[3][5][2] = 1'b1; zoom_xyz[4][5][2] = 1'b1; zoom_xyz[5][5][2] = 1'b1; zoom_xyz[6][5][2] = 1'b0; zoom_xyz[7][5][2] = 1'b0;
                zoom_xyz[0][6][2] = 1'b0; zoom_xyz[1][6][2] = 1'b0; zoom_xyz[2][6][2] = 1'b0; zoom_xyz[3][6][2] = 1'b0; zoom_xyz[4][6][2] = 1'b0; zoom_xyz[5][6][2] = 1'b0; zoom_xyz[6][6][2] = 1'b0; zoom_xyz[7][6][2] = 1'b0;
                zoom_xyz[0][7][2] = 1'b0; zoom_xyz[1][7][2] = 1'b0; zoom_xyz[2][7][2] = 1'b0; zoom_xyz[3][7][2] = 1'b0; zoom_xyz[4][7][2] = 1'b0; zoom_xyz[5][7][2] = 1'b0; zoom_xyz[6][7][2] = 1'b0; zoom_xyz[7][7][2] = 1'b0;
                zoom_xyz[0][0][3] = 1'b0; zoom_xyz[1][0][3] = 1'b0; zoom_xyz[2][0][3] = 1'b0; zoom_xyz[3][0][3] = 1'b0; zoom_xyz[4][0][3] = 1'b0; zoom_xyz[5][0][3] = 1'b0; zoom_xyz[6][0][3] = 1'b0; zoom_xyz[7][0][3] = 1'b0;
                zoom_xyz[0][1][3] = 1'b0; zoom_xyz[1][1][3] = 1'b0; zoom_xyz[2][1][3] = 1'b0; zoom_xyz[3][1][3] = 1'b0; zoom_xyz[4][1][3] = 1'b0; zoom_xyz[5][1][3] = 1'b0; zoom_xyz[6][1][3] = 1'b0; zoom_xyz[7][1][3] = 1'b0;
                zoom_xyz[0][2][3] = 1'b0; zoom_xyz[1][2][3] = 1'b0; zoom_xyz[2][2][3] = 1'b1; zoom_xyz[3][2][3] = 1'b1; zoom_xyz[4][2][3] = 1'b1; zoom_xyz[5][2][3] = 1'b1; zoom_xyz[6][2][3] = 1'b0; zoom_xyz[7][2][3] = 1'b0;
                zoom_xyz[0][3][3] = 1'b0; zoom_xyz[1][3][3] = 1'b0; zoom_xyz[2][3][3] = 1'b1; zoom_xyz[3][3][3] = 1'b0; zoom_xyz[4][3][3] = 1'b0; zoom_xyz[5][3][3] = 1'b1; zoom_xyz[6][3][3] = 1'b0; zoom_xyz[7][3][3] = 1'b0;
                zoom_xyz[0][4][3] = 1'b0; zoom_xyz[1][4][3] = 1'b0; zoom_xyz[2][4][3] = 1'b1; zoom_xyz[3][4][3] = 1'b0; zoom_xyz[4][4][3] = 1'b0; zoom_xyz[5][4][3] = 1'b1; zoom_xyz[6][4][3] = 1'b0; zoom_xyz[7][4][3] = 1'b0;
                zoom_xyz[0][5][3] = 1'b0; zoom_xyz[1][5][3] = 1'b0; zoom_xyz[2][5][3] = 1'b1; zoom_xyz[3][5][3] = 1'b1; zoom_xyz[4][5][3] = 1'b1; zoom_xyz[5][5][3] = 1'b1; zoom_xyz[6][5][3] = 1'b0; zoom_xyz[7][5][3] = 1'b0;
                zoom_xyz[0][6][3] = 1'b0; zoom_xyz[1][6][3] = 1'b0; zoom_xyz[2][6][3] = 1'b0; zoom_xyz[3][6][3] = 1'b0; zoom_xyz[4][6][3] = 1'b0; zoom_xyz[5][6][3] = 1'b0; zoom_xyz[6][6][3] = 1'b0; zoom_xyz[7][6][3] = 1'b0;
                zoom_xyz[0][7][3] = 1'b0; zoom_xyz[1][7][3] = 1'b0; zoom_xyz[2][7][3] = 1'b0; zoom_xyz[3][7][3] = 1'b0; zoom_xyz[4][7][3] = 1'b0; zoom_xyz[5][7][3] = 1'b0; zoom_xyz[6][7][3] = 1'b0; zoom_xyz[7][7][3] = 1'b0;
                zoom_xyz[0][0][4] = 1'b0; zoom_xyz[1][0][4] = 1'b0; zoom_xyz[2][0][4] = 1'b0; zoom_xyz[3][0][4] = 1'b0; zoom_xyz[4][0][4] = 1'b0; zoom_xyz[5][0][4] = 1'b0; zoom_xyz[6][0][4] = 1'b0; zoom_xyz[7][0][4] = 1'b0;
                zoom_xyz[0][1][4] = 1'b0; zoom_xyz[1][1][4] = 1'b0; zoom_xyz[2][1][4] = 1'b0; zoom_xyz[3][1][4] = 1'b0; zoom_xyz[4][1][4] = 1'b0; zoom_xyz[5][1][4] = 1'b0; zoom_xyz[6][1][4] = 1'b0; zoom_xyz[7][1][4] = 1'b0;
                zoom_xyz[0][2][4] = 1'b0; zoom_xyz[1][2][4] = 1'b0; zoom_xyz[2][2][4] = 1'b1; zoom_xyz[3][2][4] = 1'b1; zoom_xyz[4][2][4] = 1'b1; zoom_xyz[5][2][4] = 1'b1; zoom_xyz[6][2][4] = 1'b0; zoom_xyz[7][2][4] = 1'b0;
                zoom_xyz[0][3][4] = 1'b0; zoom_xyz[1][3][4] = 1'b0; zoom_xyz[2][3][4] = 1'b1; zoom_xyz[3][3][4] = 1'b0; zoom_xyz[4][3][4] = 1'b0; zoom_xyz[5][3][4] = 1'b1; zoom_xyz[6][3][4] = 1'b0; zoom_xyz[7][3][4] = 1'b0;
                zoom_xyz[0][4][4] = 1'b0; zoom_xyz[1][4][4] = 1'b0; zoom_xyz[2][4][4] = 1'b1; zoom_xyz[3][4][4] = 1'b0; zoom_xyz[4][4][4] = 1'b0; zoom_xyz[5][4][4] = 1'b1; zoom_xyz[6][4][4] = 1'b0; zoom_xyz[7][4][4] = 1'b0;
                zoom_xyz[0][5][4] = 1'b0; zoom_xyz[1][5][4] = 1'b0; zoom_xyz[2][5][4] = 1'b1; zoom_xyz[3][5][4] = 1'b1; zoom_xyz[4][5][4] = 1'b1; zoom_xyz[5][5][4] = 1'b1; zoom_xyz[6][5][4] = 1'b0; zoom_xyz[7][5][4] = 1'b0;
                zoom_xyz[0][6][4] = 1'b0; zoom_xyz[1][6][4] = 1'b0; zoom_xyz[2][6][4] = 1'b0; zoom_xyz[3][6][4] = 1'b0; zoom_xyz[4][6][4] = 1'b0; zoom_xyz[5][6][4] = 1'b0; zoom_xyz[6][6][4] = 1'b0; zoom_xyz[7][6][4] = 1'b0;
                zoom_xyz[0][7][4] = 1'b0; zoom_xyz[1][7][4] = 1'b0; zoom_xyz[2][7][4] = 1'b0; zoom_xyz[3][7][4] = 1'b0; zoom_xyz[4][7][4] = 1'b0; zoom_xyz[5][7][4] = 1'b0; zoom_xyz[6][7][4] = 1'b0; zoom_xyz[7][7][4] = 1'b0;
                zoom_xyz[0][0][5] = 1'b0; zoom_xyz[1][0][5] = 1'b0; zoom_xyz[2][0][5] = 1'b0; zoom_xyz[3][0][5] = 1'b0; zoom_xyz[4][0][5] = 1'b0; zoom_xyz[5][0][5] = 1'b0; zoom_xyz[6][0][5] = 1'b0; zoom_xyz[7][0][5] = 1'b0;
                zoom_xyz[0][1][5] = 1'b0; zoom_xyz[1][1][5] = 1'b0; zoom_xyz[2][1][5] = 1'b0; zoom_xyz[3][1][5] = 1'b0; zoom_xyz[4][1][5] = 1'b0; zoom_xyz[5][1][5] = 1'b0; zoom_xyz[6][1][5] = 1'b0; zoom_xyz[7][1][5] = 1'b0;
                zoom_xyz[0][2][5] = 1'b0; zoom_xyz[1][2][5] = 1'b0; zoom_xyz[2][2][5] = 1'b1; zoom_xyz[3][2][5] = 1'b1; zoom_xyz[4][2][5] = 1'b1; zoom_xyz[5][2][5] = 1'b1; zoom_xyz[6][2][5] = 1'b0; zoom_xyz[7][2][5] = 1'b0;
                zoom_xyz[0][3][5] = 1'b0; zoom_xyz[1][3][5] = 1'b0; zoom_xyz[2][3][5] = 1'b1; zoom_xyz[3][3][5] = 1'b1; zoom_xyz[4][3][5] = 1'b1; zoom_xyz[5][3][5] = 1'b1; zoom_xyz[6][3][5] = 1'b0; zoom_xyz[7][3][5] = 1'b0;
                zoom_xyz[0][4][5] = 1'b0; zoom_xyz[1][4][5] = 1'b0; zoom_xyz[2][4][5] = 1'b1; zoom_xyz[3][4][5] = 1'b1; zoom_xyz[4][4][5] = 1'b1; zoom_xyz[5][4][5] = 1'b1; zoom_xyz[6][4][5] = 1'b0; zoom_xyz[7][4][5] = 1'b0;
                zoom_xyz[0][5][5] = 1'b0; zoom_xyz[1][5][5] = 1'b0; zoom_xyz[2][5][5] = 1'b1; zoom_xyz[3][5][5] = 1'b1; zoom_xyz[4][5][5] = 1'b1; zoom_xyz[5][5][5] = 1'b1; zoom_xyz[6][5][5] = 1'b0; zoom_xyz[7][5][5] = 1'b0;
                zoom_xyz[0][6][5] = 1'b0; zoom_xyz[1][6][5] = 1'b0; zoom_xyz[2][6][5] = 1'b0; zoom_xyz[3][6][5] = 1'b0; zoom_xyz[4][6][5] = 1'b0; zoom_xyz[5][6][5] = 1'b0; zoom_xyz[6][6][5] = 1'b0; zoom_xyz[7][6][5] = 1'b0;
                zoom_xyz[0][7][5] = 1'b0; zoom_xyz[1][7][5] = 1'b0; zoom_xyz[2][7][5] = 1'b0; zoom_xyz[3][7][5] = 1'b0; zoom_xyz[4][7][5] = 1'b0; zoom_xyz[5][7][5] = 1'b0; zoom_xyz[6][7][5] = 1'b0; zoom_xyz[7][7][5] = 1'b0;
                zoom_xyz[0][0][6] = 1'b0; zoom_xyz[1][0][6] = 1'b0; zoom_xyz[2][0][6] = 1'b0; zoom_xyz[3][0][6] = 1'b0; zoom_xyz[4][0][6] = 1'b0; zoom_xyz[5][0][6] = 1'b0; zoom_xyz[6][0][6] = 1'b0; zoom_xyz[7][0][6] = 1'b0;
                zoom_xyz[0][1][6] = 1'b0; zoom_xyz[1][1][6] = 1'b0; zoom_xyz[2][1][6] = 1'b0; zoom_xyz[3][1][6] = 1'b0; zoom_xyz[4][1][6] = 1'b0; zoom_xyz[5][1][6] = 1'b0; zoom_xyz[6][1][6] = 1'b0; zoom_xyz[7][1][6] = 1'b0;
                zoom_xyz[0][2][6] = 1'b0; zoom_xyz[1][2][6] = 1'b0; zoom_xyz[2][2][6] = 1'b0; zoom_xyz[3][2][6] = 1'b0; zoom_xyz[4][2][6] = 1'b0; zoom_xyz[5][2][6] = 1'b0; zoom_xyz[6][2][6] = 1'b0; zoom_xyz[7][2][6] = 1'b0;
                zoom_xyz[0][3][6] = 1'b0; zoom_xyz[1][3][6] = 1'b0; zoom_xyz[2][3][6] = 1'b0; zoom_xyz[3][3][6] = 1'b0; zoom_xyz[4][3][6] = 1'b0; zoom_xyz[5][3][6] = 1'b0; zoom_xyz[6][3][6] = 1'b0; zoom_xyz[7][3][6] = 1'b0;
                zoom_xyz[0][4][6] = 1'b0; zoom_xyz[1][4][6] = 1'b0; zoom_xyz[2][4][6] = 1'b0; zoom_xyz[3][4][6] = 1'b0; zoom_xyz[4][4][6] = 1'b0; zoom_xyz[5][4][6] = 1'b0; zoom_xyz[6][4][6] = 1'b0; zoom_xyz[7][4][6] = 1'b0;
                zoom_xyz[0][5][6] = 1'b0; zoom_xyz[1][5][6] = 1'b0; zoom_xyz[2][5][6] = 1'b0; zoom_xyz[3][5][6] = 1'b0; zoom_xyz[4][5][6] = 1'b0; zoom_xyz[5][5][6] = 1'b0; zoom_xyz[6][5][6] = 1'b0; zoom_xyz[7][5][6] = 1'b0;
                zoom_xyz[0][6][6] = 1'b0; zoom_xyz[1][6][6] = 1'b0; zoom_xyz[2][6][6] = 1'b0; zoom_xyz[3][6][6] = 1'b0; zoom_xyz[4][6][6] = 1'b0; zoom_xyz[5][6][6] = 1'b0; zoom_xyz[6][6][6] = 1'b0; zoom_xyz[7][6][6] = 1'b0;
                zoom_xyz[0][7][6] = 1'b0; zoom_xyz[1][7][6] = 1'b0; zoom_xyz[2][7][6] = 1'b0; zoom_xyz[3][7][6] = 1'b0; zoom_xyz[4][7][6] = 1'b0; zoom_xyz[5][7][6] = 1'b0; zoom_xyz[6][7][6] = 1'b0; zoom_xyz[7][7][6] = 1'b0;
                zoom_xyz[0][0][7] = 1'b0; zoom_xyz[1][0][7] = 1'b0; zoom_xyz[2][0][7] = 1'b0; zoom_xyz[3][0][7] = 1'b0; zoom_xyz[4][0][7] = 1'b0; zoom_xyz[5][0][7] = 1'b0; zoom_xyz[6][0][7] = 1'b0; zoom_xyz[7][0][7] = 1'b0;
                zoom_xyz[0][1][7] = 1'b0; zoom_xyz[1][1][7] = 1'b0; zoom_xyz[2][1][7] = 1'b0; zoom_xyz[3][1][7] = 1'b0; zoom_xyz[4][1][7] = 1'b0; zoom_xyz[5][1][7] = 1'b0; zoom_xyz[6][1][7] = 1'b0; zoom_xyz[7][1][7] = 1'b0;
                zoom_xyz[0][2][7] = 1'b0; zoom_xyz[1][2][7] = 1'b0; zoom_xyz[2][2][7] = 1'b0; zoom_xyz[3][2][7] = 1'b0; zoom_xyz[4][2][7] = 1'b0; zoom_xyz[5][2][7] = 1'b0; zoom_xyz[6][2][7] = 1'b0; zoom_xyz[7][2][7] = 1'b0;
                zoom_xyz[0][3][7] = 1'b0; zoom_xyz[1][3][7] = 1'b0; zoom_xyz[2][3][7] = 1'b0; zoom_xyz[3][3][7] = 1'b0; zoom_xyz[4][3][7] = 1'b0; zoom_xyz[5][3][7] = 1'b0; zoom_xyz[6][3][7] = 1'b0; zoom_xyz[7][3][7] = 1'b0;
                zoom_xyz[0][4][7] = 1'b0; zoom_xyz[1][4][7] = 1'b0; zoom_xyz[2][4][7] = 1'b0; zoom_xyz[3][4][7] = 1'b0; zoom_xyz[4][4][7] = 1'b0; zoom_xyz[5][4][7] = 1'b0; zoom_xyz[6][4][7] = 1'b0; zoom_xyz[7][4][7] = 1'b0;
                zoom_xyz[0][5][7] = 1'b0; zoom_xyz[1][5][7] = 1'b0; zoom_xyz[2][5][7] = 1'b0; zoom_xyz[3][5][7] = 1'b0; zoom_xyz[4][5][7] = 1'b0; zoom_xyz[5][5][7] = 1'b0; zoom_xyz[6][5][7] = 1'b0; zoom_xyz[7][5][7] = 1'b0;
                zoom_xyz[0][6][7] = 1'b0; zoom_xyz[1][6][7] = 1'b0; zoom_xyz[2][6][7] = 1'b0; zoom_xyz[3][6][7] = 1'b0; zoom_xyz[4][6][7] = 1'b0; zoom_xyz[5][6][7] = 1'b0; zoom_xyz[6][6][7] = 1'b0; zoom_xyz[7][6][7] = 1'b0;
                zoom_xyz[0][7][7] = 1'b0; zoom_xyz[1][7][7] = 1'b0; zoom_xyz[2][7][7] = 1'b0; zoom_xyz[3][7][7] = 1'b0; zoom_xyz[4][7][7] = 1'b0; zoom_xyz[5][7][7] = 1'b0; zoom_xyz[6][7][7] = 1'b0; zoom_xyz[7][7][7] = 1'b0;
            end
            3'd6: begin     
                zoom_xyz[0][0][0] = 1'b0; zoom_xyz[1][0][0] = 1'b0; zoom_xyz[2][0][0] = 1'b0; zoom_xyz[3][0][0] = 1'b0; zoom_xyz[4][0][0] = 1'b0; zoom_xyz[5][0][0] = 1'b0; zoom_xyz[6][0][0] = 1'b0; zoom_xyz[7][0][0] = 1'b0;
                zoom_xyz[0][1][0] = 1'b0; zoom_xyz[1][1][0] = 1'b0; zoom_xyz[2][1][0] = 1'b0; zoom_xyz[3][1][0] = 1'b0; zoom_xyz[4][1][0] = 1'b0; zoom_xyz[5][1][0] = 1'b0; zoom_xyz[6][1][0] = 1'b0; zoom_xyz[7][1][0] = 1'b0;
                zoom_xyz[0][2][0] = 1'b0; zoom_xyz[1][2][0] = 1'b0; zoom_xyz[2][2][0] = 1'b0; zoom_xyz[3][2][0] = 1'b0; zoom_xyz[4][2][0] = 1'b0; zoom_xyz[5][2][0] = 1'b0; zoom_xyz[6][2][0] = 1'b0; zoom_xyz[7][2][0] = 1'b0;
                zoom_xyz[0][3][0] = 1'b0; zoom_xyz[1][3][0] = 1'b0; zoom_xyz[2][3][0] = 1'b0; zoom_xyz[3][3][0] = 1'b0; zoom_xyz[4][3][0] = 1'b0; zoom_xyz[5][3][0] = 1'b0; zoom_xyz[6][3][0] = 1'b0; zoom_xyz[7][3][0] = 1'b0;
                zoom_xyz[0][4][0] = 1'b0; zoom_xyz[1][4][0] = 1'b0; zoom_xyz[2][4][0] = 1'b0; zoom_xyz[3][4][0] = 1'b0; zoom_xyz[4][4][0] = 1'b0; zoom_xyz[5][4][0] = 1'b0; zoom_xyz[6][4][0] = 1'b0; zoom_xyz[7][4][0] = 1'b0;
                zoom_xyz[0][5][0] = 1'b0; zoom_xyz[1][5][0] = 1'b0; zoom_xyz[2][5][0] = 1'b0; zoom_xyz[3][5][0] = 1'b0; zoom_xyz[4][5][0] = 1'b0; zoom_xyz[5][5][0] = 1'b0; zoom_xyz[6][5][0] = 1'b0; zoom_xyz[7][5][0] = 1'b0;
                zoom_xyz[0][6][0] = 1'b0; zoom_xyz[1][6][0] = 1'b0; zoom_xyz[2][6][0] = 1'b0; zoom_xyz[3][6][0] = 1'b0; zoom_xyz[4][6][0] = 1'b0; zoom_xyz[5][6][0] = 1'b0; zoom_xyz[6][6][0] = 1'b0; zoom_xyz[7][6][0] = 1'b0;
                zoom_xyz[0][7][0] = 1'b0; zoom_xyz[1][7][0] = 1'b0; zoom_xyz[2][7][0] = 1'b0; zoom_xyz[3][7][0] = 1'b0; zoom_xyz[4][7][0] = 1'b0; zoom_xyz[5][7][0] = 1'b0; zoom_xyz[6][7][0] = 1'b0; zoom_xyz[7][7][0] = 1'b0;
                zoom_xyz[0][0][1] = 1'b0; zoom_xyz[1][0][1] = 1'b0; zoom_xyz[2][0][1] = 1'b0; zoom_xyz[3][0][1] = 1'b0; zoom_xyz[4][0][1] = 1'b0; zoom_xyz[5][0][1] = 1'b0; zoom_xyz[6][0][1] = 1'b0; zoom_xyz[7][0][1] = 1'b0;
                zoom_xyz[0][1][1] = 1'b0; zoom_xyz[1][1][1] = 1'b1; zoom_xyz[2][1][1] = 1'b1; zoom_xyz[3][1][1] = 1'b1; zoom_xyz[4][1][1] = 1'b1; zoom_xyz[5][1][1] = 1'b1; zoom_xyz[6][1][1] = 1'b1; zoom_xyz[7][1][1] = 1'b0;
                zoom_xyz[0][2][1] = 1'b0; zoom_xyz[1][2][1] = 1'b1; zoom_xyz[2][2][1] = 1'b1; zoom_xyz[3][2][1] = 1'b1; zoom_xyz[4][2][1] = 1'b1; zoom_xyz[5][2][1] = 1'b1; zoom_xyz[6][2][1] = 1'b1; zoom_xyz[7][2][1] = 1'b0;
                zoom_xyz[0][3][1] = 1'b0; zoom_xyz[1][3][1] = 1'b1; zoom_xyz[2][3][1] = 1'b1; zoom_xyz[3][3][1] = 1'b1; zoom_xyz[4][3][1] = 1'b1; zoom_xyz[5][3][1] = 1'b1; zoom_xyz[6][3][1] = 1'b1; zoom_xyz[7][3][1] = 1'b0;
                zoom_xyz[0][4][1] = 1'b0; zoom_xyz[1][4][1] = 1'b1; zoom_xyz[2][4][1] = 1'b1; zoom_xyz[3][4][1] = 1'b1; zoom_xyz[4][4][1] = 1'b1; zoom_xyz[5][4][1] = 1'b1; zoom_xyz[6][4][1] = 1'b1; zoom_xyz[7][4][1] = 1'b0;
                zoom_xyz[0][5][1] = 1'b0; zoom_xyz[1][5][1] = 1'b1; zoom_xyz[2][5][1] = 1'b1; zoom_xyz[3][5][1] = 1'b1; zoom_xyz[4][5][1] = 1'b1; zoom_xyz[5][5][1] = 1'b1; zoom_xyz[6][5][1] = 1'b1; zoom_xyz[7][5][1] = 1'b0;
                zoom_xyz[0][6][1] = 1'b0; zoom_xyz[1][6][1] = 1'b1; zoom_xyz[2][6][1] = 1'b1; zoom_xyz[3][6][1] = 1'b1; zoom_xyz[4][6][1] = 1'b1; zoom_xyz[5][6][1] = 1'b1; zoom_xyz[6][6][1] = 1'b1; zoom_xyz[7][6][1] = 1'b0;
                zoom_xyz[0][7][1] = 1'b0; zoom_xyz[1][7][1] = 1'b0; zoom_xyz[2][7][1] = 1'b0; zoom_xyz[3][7][1] = 1'b0; zoom_xyz[4][7][1] = 1'b0; zoom_xyz[5][7][1] = 1'b0; zoom_xyz[6][7][1] = 1'b0; zoom_xyz[7][7][1] = 1'b0;
                zoom_xyz[0][0][2] = 1'b0; zoom_xyz[1][0][2] = 1'b0; zoom_xyz[2][0][2] = 1'b0; zoom_xyz[3][0][2] = 1'b0; zoom_xyz[4][0][2] = 1'b0; zoom_xyz[5][0][2] = 1'b0; zoom_xyz[6][0][2] = 1'b0; zoom_xyz[7][0][2] = 1'b0;
                zoom_xyz[0][1][2] = 1'b0; zoom_xyz[1][1][2] = 1'b1; zoom_xyz[2][1][2] = 1'b1; zoom_xyz[3][1][2] = 1'b1; zoom_xyz[4][1][2] = 1'b1; zoom_xyz[5][1][2] = 1'b1; zoom_xyz[6][1][2] = 1'b1; zoom_xyz[7][1][2] = 1'b0;
                zoom_xyz[0][2][2] = 1'b0; zoom_xyz[1][2][2] = 1'b1; zoom_xyz[2][2][2] = 1'b0; zoom_xyz[3][2][2] = 1'b0; zoom_xyz[4][2][2] = 1'b0; zoom_xyz[5][2][2] = 1'b0; zoom_xyz[6][2][2] = 1'b1; zoom_xyz[7][2][2] = 1'b0;
                zoom_xyz[0][3][2] = 1'b0; zoom_xyz[1][3][2] = 1'b1; zoom_xyz[2][3][2] = 1'b0; zoom_xyz[3][3][2] = 1'b0; zoom_xyz[4][3][2] = 1'b0; zoom_xyz[5][3][2] = 1'b0; zoom_xyz[6][3][2] = 1'b1; zoom_xyz[7][3][2] = 1'b0;
                zoom_xyz[0][4][2] = 1'b0; zoom_xyz[1][4][2] = 1'b1; zoom_xyz[2][4][2] = 1'b0; zoom_xyz[3][4][2] = 1'b0; zoom_xyz[4][4][2] = 1'b0; zoom_xyz[5][4][2] = 1'b0; zoom_xyz[6][4][2] = 1'b1; zoom_xyz[7][4][2] = 1'b0;
                zoom_xyz[0][5][2] = 1'b0; zoom_xyz[1][5][2] = 1'b1; zoom_xyz[2][5][2] = 1'b0; zoom_xyz[3][5][2] = 1'b0; zoom_xyz[4][5][2] = 1'b0; zoom_xyz[5][5][2] = 1'b0; zoom_xyz[6][5][2] = 1'b1; zoom_xyz[7][5][2] = 1'b0;
                zoom_xyz[0][6][2] = 1'b0; zoom_xyz[1][6][2] = 1'b1; zoom_xyz[2][6][2] = 1'b1; zoom_xyz[3][6][2] = 1'b1; zoom_xyz[4][6][2] = 1'b1; zoom_xyz[5][6][2] = 1'b1; zoom_xyz[6][6][2] = 1'b1; zoom_xyz[7][6][2] = 1'b0;
                zoom_xyz[0][7][2] = 1'b0; zoom_xyz[1][7][2] = 1'b0; zoom_xyz[2][7][2] = 1'b0; zoom_xyz[3][7][2] = 1'b0; zoom_xyz[4][7][2] = 1'b0; zoom_xyz[5][7][2] = 1'b0; zoom_xyz[6][7][2] = 1'b0; zoom_xyz[7][7][2] = 1'b0;
                zoom_xyz[0][0][3] = 1'b0; zoom_xyz[1][0][3] = 1'b0; zoom_xyz[2][0][3] = 1'b0; zoom_xyz[3][0][3] = 1'b0; zoom_xyz[4][0][3] = 1'b0; zoom_xyz[5][0][3] = 1'b0; zoom_xyz[6][0][3] = 1'b0; zoom_xyz[7][0][3] = 1'b0;
                zoom_xyz[0][1][3] = 1'b0; zoom_xyz[1][1][3] = 1'b1; zoom_xyz[2][1][3] = 1'b1; zoom_xyz[3][1][3] = 1'b1; zoom_xyz[4][1][3] = 1'b1; zoom_xyz[5][1][3] = 1'b1; zoom_xyz[6][1][3] = 1'b1; zoom_xyz[7][1][3] = 1'b0;
                zoom_xyz[0][2][3] = 1'b0; zoom_xyz[1][2][3] = 1'b1; zoom_xyz[2][2][3] = 1'b0; zoom_xyz[3][2][3] = 1'b0; zoom_xyz[4][2][3] = 1'b0; zoom_xyz[5][2][3] = 1'b0; zoom_xyz[6][2][3] = 1'b1; zoom_xyz[7][2][3] = 1'b0;
                zoom_xyz[0][3][3] = 1'b0; zoom_xyz[1][3][3] = 1'b1; zoom_xyz[2][3][3] = 1'b0; zoom_xyz[3][3][3] = 1'b0; zoom_xyz[4][3][3] = 1'b0; zoom_xyz[5][3][3] = 1'b0; zoom_xyz[6][3][3] = 1'b1; zoom_xyz[7][3][3] = 1'b0;
                zoom_xyz[0][4][3] = 1'b0; zoom_xyz[1][4][3] = 1'b1; zoom_xyz[2][4][3] = 1'b0; zoom_xyz[3][4][3] = 1'b0; zoom_xyz[4][4][3] = 1'b0; zoom_xyz[5][4][3] = 1'b0; zoom_xyz[6][4][3] = 1'b1; zoom_xyz[7][4][3] = 1'b0;
                zoom_xyz[0][5][3] = 1'b0; zoom_xyz[1][5][3] = 1'b1; zoom_xyz[2][5][3] = 1'b0; zoom_xyz[3][5][3] = 1'b0; zoom_xyz[4][5][3] = 1'b0; zoom_xyz[5][5][3] = 1'b0; zoom_xyz[6][5][3] = 1'b1; zoom_xyz[7][5][3] = 1'b0;
                zoom_xyz[0][6][3] = 1'b0; zoom_xyz[1][6][3] = 1'b1; zoom_xyz[2][6][3] = 1'b1; zoom_xyz[3][6][3] = 1'b1; zoom_xyz[4][6][3] = 1'b1; zoom_xyz[5][6][3] = 1'b1; zoom_xyz[6][6][3] = 1'b1; zoom_xyz[7][6][3] = 1'b0;
                zoom_xyz[0][7][3] = 1'b0; zoom_xyz[1][7][3] = 1'b0; zoom_xyz[2][7][3] = 1'b0; zoom_xyz[3][7][3] = 1'b0; zoom_xyz[4][7][3] = 1'b0; zoom_xyz[5][7][3] = 1'b0; zoom_xyz[6][7][3] = 1'b0; zoom_xyz[7][7][3] = 1'b0;
                zoom_xyz[0][0][4] = 1'b0; zoom_xyz[1][0][4] = 1'b0; zoom_xyz[2][0][4] = 1'b0; zoom_xyz[3][0][4] = 1'b0; zoom_xyz[4][0][4] = 1'b0; zoom_xyz[5][0][4] = 1'b0; zoom_xyz[6][0][4] = 1'b0; zoom_xyz[7][0][4] = 1'b0;
                zoom_xyz[0][1][4] = 1'b0; zoom_xyz[1][1][4] = 1'b1; zoom_xyz[2][1][4] = 1'b1; zoom_xyz[3][1][4] = 1'b1; zoom_xyz[4][1][4] = 1'b1; zoom_xyz[5][1][4] = 1'b1; zoom_xyz[6][1][4] = 1'b1; zoom_xyz[7][1][4] = 1'b0;
                zoom_xyz[0][2][4] = 1'b0; zoom_xyz[1][2][4] = 1'b1; zoom_xyz[2][2][4] = 1'b0; zoom_xyz[3][2][4] = 1'b0; zoom_xyz[4][2][4] = 1'b0; zoom_xyz[5][2][4] = 1'b0; zoom_xyz[6][2][4] = 1'b1; zoom_xyz[7][2][4] = 1'b0;
                zoom_xyz[0][3][4] = 1'b0; zoom_xyz[1][3][4] = 1'b1; zoom_xyz[2][3][4] = 1'b0; zoom_xyz[3][3][4] = 1'b0; zoom_xyz[4][3][4] = 1'b0; zoom_xyz[5][3][4] = 1'b0; zoom_xyz[6][3][4] = 1'b1; zoom_xyz[7][3][4] = 1'b0;
                zoom_xyz[0][4][4] = 1'b0; zoom_xyz[1][4][4] = 1'b1; zoom_xyz[2][4][4] = 1'b0; zoom_xyz[3][4][4] = 1'b0; zoom_xyz[4][4][4] = 1'b0; zoom_xyz[5][4][4] = 1'b0; zoom_xyz[6][4][4] = 1'b1; zoom_xyz[7][4][4] = 1'b0;
                zoom_xyz[0][5][4] = 1'b0; zoom_xyz[1][5][4] = 1'b1; zoom_xyz[2][5][4] = 1'b0; zoom_xyz[3][5][4] = 1'b0; zoom_xyz[4][5][4] = 1'b0; zoom_xyz[5][5][4] = 1'b0; zoom_xyz[6][5][4] = 1'b1; zoom_xyz[7][5][4] = 1'b0;
                zoom_xyz[0][6][4] = 1'b0; zoom_xyz[1][6][4] = 1'b1; zoom_xyz[2][6][4] = 1'b1; zoom_xyz[3][6][4] = 1'b1; zoom_xyz[4][6][4] = 1'b1; zoom_xyz[5][6][4] = 1'b1; zoom_xyz[6][6][4] = 1'b1; zoom_xyz[7][6][4] = 1'b0;
                zoom_xyz[0][7][4] = 1'b0; zoom_xyz[1][7][4] = 1'b0; zoom_xyz[2][7][4] = 1'b0; zoom_xyz[3][7][4] = 1'b0; zoom_xyz[4][7][4] = 1'b0; zoom_xyz[5][7][4] = 1'b0; zoom_xyz[6][7][4] = 1'b0; zoom_xyz[7][7][4] = 1'b0;
                zoom_xyz[0][0][5] = 1'b0; zoom_xyz[1][0][5] = 1'b0; zoom_xyz[2][0][5] = 1'b0; zoom_xyz[3][0][5] = 1'b0; zoom_xyz[4][0][5] = 1'b0; zoom_xyz[5][0][5] = 1'b0; zoom_xyz[6][0][5] = 1'b0; zoom_xyz[7][0][5] = 1'b0;
                zoom_xyz[0][1][5] = 1'b0; zoom_xyz[1][1][5] = 1'b1; zoom_xyz[2][1][5] = 1'b1; zoom_xyz[3][1][5] = 1'b1; zoom_xyz[4][1][5] = 1'b1; zoom_xyz[5][1][5] = 1'b1; zoom_xyz[6][1][5] = 1'b1; zoom_xyz[7][1][5] = 1'b0;
                zoom_xyz[0][2][5] = 1'b0; zoom_xyz[1][2][5] = 1'b1; zoom_xyz[2][2][5] = 1'b0; zoom_xyz[3][2][5] = 1'b0; zoom_xyz[4][2][5] = 1'b0; zoom_xyz[5][2][5] = 1'b0; zoom_xyz[6][2][5] = 1'b1; zoom_xyz[7][2][5] = 1'b0;
                zoom_xyz[0][3][5] = 1'b0; zoom_xyz[1][3][5] = 1'b1; zoom_xyz[2][3][5] = 1'b0; zoom_xyz[3][3][5] = 1'b0; zoom_xyz[4][3][5] = 1'b0; zoom_xyz[5][3][5] = 1'b0; zoom_xyz[6][3][5] = 1'b1; zoom_xyz[7][3][5] = 1'b0;
                zoom_xyz[0][4][5] = 1'b0; zoom_xyz[1][4][5] = 1'b1; zoom_xyz[2][4][5] = 1'b0; zoom_xyz[3][4][5] = 1'b0; zoom_xyz[4][4][5] = 1'b0; zoom_xyz[5][4][5] = 1'b0; zoom_xyz[6][4][5] = 1'b1; zoom_xyz[7][4][5] = 1'b0;
                zoom_xyz[0][5][5] = 1'b0; zoom_xyz[1][5][5] = 1'b1; zoom_xyz[2][5][5] = 1'b0; zoom_xyz[3][5][5] = 1'b0; zoom_xyz[4][5][5] = 1'b0; zoom_xyz[5][5][5] = 1'b0; zoom_xyz[6][5][5] = 1'b1; zoom_xyz[7][5][5] = 1'b0;
                zoom_xyz[0][6][5] = 1'b0; zoom_xyz[1][6][5] = 1'b1; zoom_xyz[2][6][5] = 1'b1; zoom_xyz[3][6][5] = 1'b1; zoom_xyz[4][6][5] = 1'b1; zoom_xyz[5][6][5] = 1'b1; zoom_xyz[6][6][5] = 1'b1; zoom_xyz[7][6][5] = 1'b0;
                zoom_xyz[0][7][5] = 1'b0; zoom_xyz[1][7][5] = 1'b0; zoom_xyz[2][7][5] = 1'b0; zoom_xyz[3][7][5] = 1'b0; zoom_xyz[4][7][5] = 1'b0; zoom_xyz[5][7][5] = 1'b0; zoom_xyz[6][7][5] = 1'b0; zoom_xyz[7][7][5] = 1'b0;
                zoom_xyz[0][0][6] = 1'b0; zoom_xyz[1][0][6] = 1'b0; zoom_xyz[2][0][6] = 1'b0; zoom_xyz[3][0][6] = 1'b0; zoom_xyz[4][0][6] = 1'b0; zoom_xyz[5][0][6] = 1'b0; zoom_xyz[6][0][6] = 1'b0; zoom_xyz[7][0][6] = 1'b0;
                zoom_xyz[0][1][6] = 1'b0; zoom_xyz[1][1][6] = 1'b1; zoom_xyz[2][1][6] = 1'b1; zoom_xyz[3][1][6] = 1'b1; zoom_xyz[4][1][6] = 1'b1; zoom_xyz[5][1][6] = 1'b1; zoom_xyz[6][1][6] = 1'b1; zoom_xyz[7][1][6] = 1'b0;
                zoom_xyz[0][2][6] = 1'b0; zoom_xyz[1][2][6] = 1'b1; zoom_xyz[2][2][6] = 1'b1; zoom_xyz[3][2][6] = 1'b1; zoom_xyz[4][2][6] = 1'b1; zoom_xyz[5][2][6] = 1'b1; zoom_xyz[6][2][6] = 1'b1; zoom_xyz[7][2][6] = 1'b0;
                zoom_xyz[0][3][6] = 1'b0; zoom_xyz[1][3][6] = 1'b1; zoom_xyz[2][3][6] = 1'b1; zoom_xyz[3][3][6] = 1'b1; zoom_xyz[4][3][6] = 1'b1; zoom_xyz[5][3][6] = 1'b1; zoom_xyz[6][3][6] = 1'b1; zoom_xyz[7][3][6] = 1'b0;
                zoom_xyz[0][4][6] = 1'b0; zoom_xyz[1][4][6] = 1'b1; zoom_xyz[2][4][6] = 1'b1; zoom_xyz[3][4][6] = 1'b1; zoom_xyz[4][4][6] = 1'b1; zoom_xyz[5][4][6] = 1'b1; zoom_xyz[6][4][6] = 1'b1; zoom_xyz[7][4][6] = 1'b0;
                zoom_xyz[0][5][6] = 1'b0; zoom_xyz[1][5][6] = 1'b1; zoom_xyz[2][5][6] = 1'b1; zoom_xyz[3][5][6] = 1'b1; zoom_xyz[4][5][6] = 1'b1; zoom_xyz[5][5][6] = 1'b1; zoom_xyz[6][5][6] = 1'b1; zoom_xyz[7][5][6] = 1'b0;
                zoom_xyz[0][6][6] = 1'b0; zoom_xyz[1][6][6] = 1'b1; zoom_xyz[2][6][6] = 1'b1; zoom_xyz[3][6][6] = 1'b1; zoom_xyz[4][6][6] = 1'b1; zoom_xyz[5][6][6] = 1'b1; zoom_xyz[6][6][6] = 1'b1; zoom_xyz[7][6][6] = 1'b0;
                zoom_xyz[0][7][6] = 1'b0; zoom_xyz[1][7][6] = 1'b0; zoom_xyz[2][7][6] = 1'b0; zoom_xyz[3][7][6] = 1'b0; zoom_xyz[4][7][6] = 1'b0; zoom_xyz[5][7][6] = 1'b0; zoom_xyz[6][7][6] = 1'b0; zoom_xyz[7][7][6] = 1'b0;
                zoom_xyz[0][0][7] = 1'b0; zoom_xyz[1][0][7] = 1'b0; zoom_xyz[2][0][7] = 1'b0; zoom_xyz[3][0][7] = 1'b0; zoom_xyz[4][0][7] = 1'b0; zoom_xyz[5][0][7] = 1'b0; zoom_xyz[6][0][7] = 1'b0; zoom_xyz[7][0][7] = 1'b0;
                zoom_xyz[0][1][7] = 1'b0; zoom_xyz[1][1][7] = 1'b0; zoom_xyz[2][1][7] = 1'b0; zoom_xyz[3][1][7] = 1'b0; zoom_xyz[4][1][7] = 1'b0; zoom_xyz[5][1][7] = 1'b0; zoom_xyz[6][1][7] = 1'b0; zoom_xyz[7][1][7] = 1'b0;
                zoom_xyz[0][2][7] = 1'b0; zoom_xyz[1][2][7] = 1'b0; zoom_xyz[2][2][7] = 1'b0; zoom_xyz[3][2][7] = 1'b0; zoom_xyz[4][2][7] = 1'b0; zoom_xyz[5][2][7] = 1'b0; zoom_xyz[6][2][7] = 1'b0; zoom_xyz[7][2][7] = 1'b0;
                zoom_xyz[0][3][7] = 1'b0; zoom_xyz[1][3][7] = 1'b0; zoom_xyz[2][3][7] = 1'b0; zoom_xyz[3][3][7] = 1'b0; zoom_xyz[4][3][7] = 1'b0; zoom_xyz[5][3][7] = 1'b0; zoom_xyz[6][3][7] = 1'b0; zoom_xyz[7][3][7] = 1'b0;
                zoom_xyz[0][4][7] = 1'b0; zoom_xyz[1][4][7] = 1'b0; zoom_xyz[2][4][7] = 1'b0; zoom_xyz[3][4][7] = 1'b0; zoom_xyz[4][4][7] = 1'b0; zoom_xyz[5][4][7] = 1'b0; zoom_xyz[6][4][7] = 1'b0; zoom_xyz[7][4][7] = 1'b0;
                zoom_xyz[0][5][7] = 1'b0; zoom_xyz[1][5][7] = 1'b0; zoom_xyz[2][5][7] = 1'b0; zoom_xyz[3][5][7] = 1'b0; zoom_xyz[4][5][7] = 1'b0; zoom_xyz[5][5][7] = 1'b0; zoom_xyz[6][5][7] = 1'b0; zoom_xyz[7][5][7] = 1'b0;
                zoom_xyz[0][6][7] = 1'b0; zoom_xyz[1][6][7] = 1'b0; zoom_xyz[2][6][7] = 1'b0; zoom_xyz[3][6][7] = 1'b0; zoom_xyz[4][6][7] = 1'b0; zoom_xyz[5][6][7] = 1'b0; zoom_xyz[6][6][7] = 1'b0; zoom_xyz[7][6][7] = 1'b0;
                zoom_xyz[0][7][7] = 1'b0; zoom_xyz[1][7][7] = 1'b0; zoom_xyz[2][7][7] = 1'b0; zoom_xyz[3][7][7] = 1'b0; zoom_xyz[4][7][7] = 1'b0; zoom_xyz[5][7][7] = 1'b0; zoom_xyz[6][7][7] = 1'b0; zoom_xyz[7][7][7] = 1'b0;
            end
            3'd7: begin     
                zoom_xyz[0][0][0] = 1'b1; zoom_xyz[1][0][0] = 1'b1; zoom_xyz[2][0][0] = 1'b1; zoom_xyz[3][0][0] = 1'b1; zoom_xyz[4][0][0] = 1'b1; zoom_xyz[5][0][0] = 1'b1; zoom_xyz[6][0][0] = 1'b1; zoom_xyz[7][0][0] = 1'b1;
                zoom_xyz[0][1][0] = 1'b1; zoom_xyz[1][1][0] = 1'b1; zoom_xyz[2][1][0] = 1'b1; zoom_xyz[3][1][0] = 1'b1; zoom_xyz[4][1][0] = 1'b1; zoom_xyz[5][1][0] = 1'b1; zoom_xyz[6][1][0] = 1'b1; zoom_xyz[7][1][0] = 1'b1;
                zoom_xyz[0][2][0] = 1'b1; zoom_xyz[1][2][0] = 1'b1; zoom_xyz[2][2][0] = 1'b1; zoom_xyz[3][2][0] = 1'b1; zoom_xyz[4][2][0] = 1'b1; zoom_xyz[5][2][0] = 1'b1; zoom_xyz[6][2][0] = 1'b1; zoom_xyz[7][2][0] = 1'b1;
                zoom_xyz[0][3][0] = 1'b1; zoom_xyz[1][3][0] = 1'b1; zoom_xyz[2][3][0] = 1'b1; zoom_xyz[3][3][0] = 1'b1; zoom_xyz[4][3][0] = 1'b1; zoom_xyz[5][3][0] = 1'b1; zoom_xyz[6][3][0] = 1'b1; zoom_xyz[7][3][0] = 1'b1;
                zoom_xyz[0][4][0] = 1'b1; zoom_xyz[1][4][0] = 1'b1; zoom_xyz[2][4][0] = 1'b1; zoom_xyz[3][4][0] = 1'b1; zoom_xyz[4][4][0] = 1'b1; zoom_xyz[5][4][0] = 1'b1; zoom_xyz[6][4][0] = 1'b1; zoom_xyz[7][4][0] = 1'b1;
                zoom_xyz[0][5][0] = 1'b1; zoom_xyz[1][5][0] = 1'b1; zoom_xyz[2][5][0] = 1'b1; zoom_xyz[3][5][0] = 1'b1; zoom_xyz[4][5][0] = 1'b1; zoom_xyz[5][5][0] = 1'b1; zoom_xyz[6][5][0] = 1'b1; zoom_xyz[7][5][0] = 1'b1;
                zoom_xyz[0][6][0] = 1'b1; zoom_xyz[1][6][0] = 1'b1; zoom_xyz[2][6][0] = 1'b1; zoom_xyz[3][6][0] = 1'b1; zoom_xyz[4][6][0] = 1'b1; zoom_xyz[5][6][0] = 1'b1; zoom_xyz[6][6][0] = 1'b1; zoom_xyz[7][6][0] = 1'b1;
                zoom_xyz[0][7][0] = 1'b1; zoom_xyz[1][7][0] = 1'b1; zoom_xyz[2][7][0] = 1'b1; zoom_xyz[3][7][0] = 1'b1; zoom_xyz[4][7][0] = 1'b1; zoom_xyz[5][7][0] = 1'b1; zoom_xyz[6][7][0] = 1'b1; zoom_xyz[7][7][0] = 1'b1;
                zoom_xyz[0][0][1] = 1'b1; zoom_xyz[1][0][1] = 1'b1; zoom_xyz[2][0][1] = 1'b1; zoom_xyz[3][0][1] = 1'b1; zoom_xyz[4][0][1] = 1'b1; zoom_xyz[5][0][1] = 1'b1; zoom_xyz[6][0][1] = 1'b1; zoom_xyz[7][0][1] = 1'b1;
                zoom_xyz[0][1][1] = 1'b1; zoom_xyz[1][1][1] = 1'b0; zoom_xyz[2][1][1] = 1'b0; zoom_xyz[3][1][1] = 1'b0; zoom_xyz[4][1][1] = 1'b0; zoom_xyz[5][1][1] = 1'b0; zoom_xyz[6][1][1] = 1'b0; zoom_xyz[7][1][1] = 1'b1;
                zoom_xyz[0][2][1] = 1'b1; zoom_xyz[1][2][1] = 1'b0; zoom_xyz[2][2][1] = 1'b0; zoom_xyz[3][2][1] = 1'b0; zoom_xyz[4][2][1] = 1'b0; zoom_xyz[5][2][1] = 1'b0; zoom_xyz[6][2][1] = 1'b0; zoom_xyz[7][2][1] = 1'b1;
                zoom_xyz[0][3][1] = 1'b1; zoom_xyz[1][3][1] = 1'b0; zoom_xyz[2][3][1] = 1'b0; zoom_xyz[3][3][1] = 1'b0; zoom_xyz[4][3][1] = 1'b0; zoom_xyz[5][3][1] = 1'b0; zoom_xyz[6][3][1] = 1'b0; zoom_xyz[7][3][1] = 1'b1;
                zoom_xyz[0][4][1] = 1'b1; zoom_xyz[1][4][1] = 1'b0; zoom_xyz[2][4][1] = 1'b0; zoom_xyz[3][4][1] = 1'b0; zoom_xyz[4][4][1] = 1'b0; zoom_xyz[5][4][1] = 1'b0; zoom_xyz[6][4][1] = 1'b0; zoom_xyz[7][4][1] = 1'b1;
                zoom_xyz[0][5][1] = 1'b1; zoom_xyz[1][5][1] = 1'b0; zoom_xyz[2][5][1] = 1'b0; zoom_xyz[3][5][1] = 1'b0; zoom_xyz[4][5][1] = 1'b0; zoom_xyz[5][5][1] = 1'b0; zoom_xyz[6][5][1] = 1'b0; zoom_xyz[7][5][1] = 1'b1;
                zoom_xyz[0][6][1] = 1'b1; zoom_xyz[1][6][1] = 1'b0; zoom_xyz[2][6][1] = 1'b0; zoom_xyz[3][6][1] = 1'b0; zoom_xyz[4][6][1] = 1'b0; zoom_xyz[5][6][1] = 1'b0; zoom_xyz[6][6][1] = 1'b0; zoom_xyz[7][6][1] = 1'b1;
                zoom_xyz[0][7][1] = 1'b1; zoom_xyz[1][7][1] = 1'b1; zoom_xyz[2][7][1] = 1'b1; zoom_xyz[3][7][1] = 1'b1; zoom_xyz[4][7][1] = 1'b1; zoom_xyz[5][7][1] = 1'b1; zoom_xyz[6][7][1] = 1'b1; zoom_xyz[7][7][1] = 1'b1;
                zoom_xyz[0][0][2] = 1'b1; zoom_xyz[1][0][2] = 1'b1; zoom_xyz[2][0][2] = 1'b1; zoom_xyz[3][0][2] = 1'b1; zoom_xyz[4][0][2] = 1'b1; zoom_xyz[5][0][2] = 1'b1; zoom_xyz[6][0][2] = 1'b1; zoom_xyz[7][0][2] = 1'b1;
                zoom_xyz[0][1][2] = 1'b1; zoom_xyz[1][1][2] = 1'b0; zoom_xyz[2][1][2] = 1'b0; zoom_xyz[3][1][2] = 1'b0; zoom_xyz[4][1][2] = 1'b0; zoom_xyz[5][1][2] = 1'b0; zoom_xyz[6][1][2] = 1'b0; zoom_xyz[7][1][2] = 1'b1;
                zoom_xyz[0][2][2] = 1'b1; zoom_xyz[1][2][2] = 1'b0; zoom_xyz[2][2][2] = 1'b0; zoom_xyz[3][2][2] = 1'b0; zoom_xyz[4][2][2] = 1'b0; zoom_xyz[5][2][2] = 1'b0; zoom_xyz[6][2][2] = 1'b0; zoom_xyz[7][2][2] = 1'b1;
                zoom_xyz[0][3][2] = 1'b1; zoom_xyz[1][3][2] = 1'b0; zoom_xyz[2][3][2] = 1'b0; zoom_xyz[3][3][2] = 1'b0; zoom_xyz[4][3][2] = 1'b0; zoom_xyz[5][3][2] = 1'b0; zoom_xyz[6][3][2] = 1'b0; zoom_xyz[7][3][2] = 1'b1;
                zoom_xyz[0][4][2] = 1'b1; zoom_xyz[1][4][2] = 1'b0; zoom_xyz[2][4][2] = 1'b0; zoom_xyz[3][4][2] = 1'b0; zoom_xyz[4][4][2] = 1'b0; zoom_xyz[5][4][2] = 1'b0; zoom_xyz[6][4][2] = 1'b0; zoom_xyz[7][4][2] = 1'b1;
                zoom_xyz[0][5][2] = 1'b1; zoom_xyz[1][5][2] = 1'b0; zoom_xyz[2][5][2] = 1'b0; zoom_xyz[3][5][2] = 1'b0; zoom_xyz[4][5][2] = 1'b0; zoom_xyz[5][5][2] = 1'b0; zoom_xyz[6][5][2] = 1'b0; zoom_xyz[7][5][2] = 1'b1;
                zoom_xyz[0][6][2] = 1'b1; zoom_xyz[1][6][2] = 1'b0; zoom_xyz[2][6][2] = 1'b0; zoom_xyz[3][6][2] = 1'b0; zoom_xyz[4][6][2] = 1'b0; zoom_xyz[5][6][2] = 1'b0; zoom_xyz[6][6][2] = 1'b0; zoom_xyz[7][6][2] = 1'b1;
                zoom_xyz[0][7][2] = 1'b1; zoom_xyz[1][7][2] = 1'b1; zoom_xyz[2][7][2] = 1'b1; zoom_xyz[3][7][2] = 1'b1; zoom_xyz[4][7][2] = 1'b1; zoom_xyz[5][7][2] = 1'b1; zoom_xyz[6][7][2] = 1'b1; zoom_xyz[7][7][2] = 1'b1;
                zoom_xyz[0][0][3] = 1'b1; zoom_xyz[1][0][3] = 1'b1; zoom_xyz[2][0][3] = 1'b1; zoom_xyz[3][0][3] = 1'b1; zoom_xyz[4][0][3] = 1'b1; zoom_xyz[5][0][3] = 1'b1; zoom_xyz[6][0][3] = 1'b1; zoom_xyz[7][0][3] = 1'b1;
                zoom_xyz[0][1][3] = 1'b1; zoom_xyz[1][1][3] = 1'b0; zoom_xyz[2][1][3] = 1'b0; zoom_xyz[3][1][3] = 1'b0; zoom_xyz[4][1][3] = 1'b0; zoom_xyz[5][1][3] = 1'b0; zoom_xyz[6][1][3] = 1'b0; zoom_xyz[7][1][3] = 1'b1;
                zoom_xyz[0][2][3] = 1'b1; zoom_xyz[1][2][3] = 1'b0; zoom_xyz[2][2][3] = 1'b0; zoom_xyz[3][2][3] = 1'b0; zoom_xyz[4][2][3] = 1'b0; zoom_xyz[5][2][3] = 1'b0; zoom_xyz[6][2][3] = 1'b0; zoom_xyz[7][2][3] = 1'b1;
                zoom_xyz[0][3][3] = 1'b1; zoom_xyz[1][3][3] = 1'b0; zoom_xyz[2][3][3] = 1'b0; zoom_xyz[3][3][3] = 1'b0; zoom_xyz[4][3][3] = 1'b0; zoom_xyz[5][3][3] = 1'b0; zoom_xyz[6][3][3] = 1'b0; zoom_xyz[7][3][3] = 1'b1;
                zoom_xyz[0][4][3] = 1'b1; zoom_xyz[1][4][3] = 1'b0; zoom_xyz[2][4][3] = 1'b0; zoom_xyz[3][4][3] = 1'b0; zoom_xyz[4][4][3] = 1'b0; zoom_xyz[5][4][3] = 1'b0; zoom_xyz[6][4][3] = 1'b0; zoom_xyz[7][4][3] = 1'b1;
                zoom_xyz[0][5][3] = 1'b1; zoom_xyz[1][5][3] = 1'b0; zoom_xyz[2][5][3] = 1'b0; zoom_xyz[3][5][3] = 1'b0; zoom_xyz[4][5][3] = 1'b0; zoom_xyz[5][5][3] = 1'b0; zoom_xyz[6][5][3] = 1'b0; zoom_xyz[7][5][3] = 1'b1;
                zoom_xyz[0][6][3] = 1'b1; zoom_xyz[1][6][3] = 1'b0; zoom_xyz[2][6][3] = 1'b0; zoom_xyz[3][6][3] = 1'b0; zoom_xyz[4][6][3] = 1'b0; zoom_xyz[5][6][3] = 1'b0; zoom_xyz[6][6][3] = 1'b0; zoom_xyz[7][6][3] = 1'b1;
                zoom_xyz[0][7][3] = 1'b1; zoom_xyz[1][7][3] = 1'b1; zoom_xyz[2][7][3] = 1'b1; zoom_xyz[3][7][3] = 1'b1; zoom_xyz[4][7][3] = 1'b1; zoom_xyz[5][7][3] = 1'b1; zoom_xyz[6][7][3] = 1'b1; zoom_xyz[7][7][3] = 1'b1;
                zoom_xyz[0][0][4] = 1'b1; zoom_xyz[1][0][4] = 1'b1; zoom_xyz[2][0][4] = 1'b1; zoom_xyz[3][0][4] = 1'b1; zoom_xyz[4][0][4] = 1'b1; zoom_xyz[5][0][4] = 1'b1; zoom_xyz[6][0][4] = 1'b1; zoom_xyz[7][0][4] = 1'b1;
                zoom_xyz[0][1][4] = 1'b1; zoom_xyz[1][1][4] = 1'b0; zoom_xyz[2][1][4] = 1'b0; zoom_xyz[3][1][4] = 1'b0; zoom_xyz[4][1][4] = 1'b0; zoom_xyz[5][1][4] = 1'b0; zoom_xyz[6][1][4] = 1'b0; zoom_xyz[7][1][4] = 1'b1;
                zoom_xyz[0][2][4] = 1'b1; zoom_xyz[1][2][4] = 1'b0; zoom_xyz[2][2][4] = 1'b0; zoom_xyz[3][2][4] = 1'b0; zoom_xyz[4][2][4] = 1'b0; zoom_xyz[5][2][4] = 1'b0; zoom_xyz[6][2][4] = 1'b0; zoom_xyz[7][2][4] = 1'b1;
                zoom_xyz[0][3][4] = 1'b1; zoom_xyz[1][3][4] = 1'b0; zoom_xyz[2][3][4] = 1'b0; zoom_xyz[3][3][4] = 1'b0; zoom_xyz[4][3][4] = 1'b0; zoom_xyz[5][3][4] = 1'b0; zoom_xyz[6][3][4] = 1'b0; zoom_xyz[7][3][4] = 1'b1;
                zoom_xyz[0][4][4] = 1'b1; zoom_xyz[1][4][4] = 1'b0; zoom_xyz[2][4][4] = 1'b0; zoom_xyz[3][4][4] = 1'b0; zoom_xyz[4][4][4] = 1'b0; zoom_xyz[5][4][4] = 1'b0; zoom_xyz[6][4][4] = 1'b0; zoom_xyz[7][4][4] = 1'b1;
                zoom_xyz[0][5][4] = 1'b1; zoom_xyz[1][5][4] = 1'b0; zoom_xyz[2][5][4] = 1'b0; zoom_xyz[3][5][4] = 1'b0; zoom_xyz[4][5][4] = 1'b0; zoom_xyz[5][5][4] = 1'b0; zoom_xyz[6][5][4] = 1'b0; zoom_xyz[7][5][4] = 1'b1;
                zoom_xyz[0][6][4] = 1'b1; zoom_xyz[1][6][4] = 1'b0; zoom_xyz[2][6][4] = 1'b0; zoom_xyz[3][6][4] = 1'b0; zoom_xyz[4][6][4] = 1'b0; zoom_xyz[5][6][4] = 1'b0; zoom_xyz[6][6][4] = 1'b0; zoom_xyz[7][6][4] = 1'b1;
                zoom_xyz[0][7][4] = 1'b1; zoom_xyz[1][7][4] = 1'b1; zoom_xyz[2][7][4] = 1'b1; zoom_xyz[3][7][4] = 1'b1; zoom_xyz[4][7][4] = 1'b1; zoom_xyz[5][7][4] = 1'b1; zoom_xyz[6][7][4] = 1'b1; zoom_xyz[7][7][4] = 1'b1;
                zoom_xyz[0][0][5] = 1'b1; zoom_xyz[1][0][5] = 1'b1; zoom_xyz[2][0][5] = 1'b1; zoom_xyz[3][0][5] = 1'b1; zoom_xyz[4][0][5] = 1'b1; zoom_xyz[5][0][5] = 1'b1; zoom_xyz[6][0][5] = 1'b1; zoom_xyz[7][0][5] = 1'b1;
                zoom_xyz[0][1][5] = 1'b1; zoom_xyz[1][1][5] = 1'b0; zoom_xyz[2][1][5] = 1'b0; zoom_xyz[3][1][5] = 1'b0; zoom_xyz[4][1][5] = 1'b0; zoom_xyz[5][1][5] = 1'b0; zoom_xyz[6][1][5] = 1'b0; zoom_xyz[7][1][5] = 1'b1;
                zoom_xyz[0][2][5] = 1'b1; zoom_xyz[1][2][5] = 1'b0; zoom_xyz[2][2][5] = 1'b0; zoom_xyz[3][2][5] = 1'b0; zoom_xyz[4][2][5] = 1'b0; zoom_xyz[5][2][5] = 1'b0; zoom_xyz[6][2][5] = 1'b0; zoom_xyz[7][2][5] = 1'b1;
                zoom_xyz[0][3][5] = 1'b1; zoom_xyz[1][3][5] = 1'b0; zoom_xyz[2][3][5] = 1'b0; zoom_xyz[3][3][5] = 1'b0; zoom_xyz[4][3][5] = 1'b0; zoom_xyz[5][3][5] = 1'b0; zoom_xyz[6][3][5] = 1'b0; zoom_xyz[7][3][5] = 1'b1;
                zoom_xyz[0][4][5] = 1'b1; zoom_xyz[1][4][5] = 1'b0; zoom_xyz[2][4][5] = 1'b0; zoom_xyz[3][4][5] = 1'b0; zoom_xyz[4][4][5] = 1'b0; zoom_xyz[5][4][5] = 1'b0; zoom_xyz[6][4][5] = 1'b0; zoom_xyz[7][4][5] = 1'b1;
                zoom_xyz[0][5][5] = 1'b1; zoom_xyz[1][5][5] = 1'b0; zoom_xyz[2][5][5] = 1'b0; zoom_xyz[3][5][5] = 1'b0; zoom_xyz[4][5][5] = 1'b0; zoom_xyz[5][5][5] = 1'b0; zoom_xyz[6][5][5] = 1'b0; zoom_xyz[7][5][5] = 1'b1;
                zoom_xyz[0][6][5] = 1'b1; zoom_xyz[1][6][5] = 1'b0; zoom_xyz[2][6][5] = 1'b0; zoom_xyz[3][6][5] = 1'b0; zoom_xyz[4][6][5] = 1'b0; zoom_xyz[5][6][5] = 1'b0; zoom_xyz[6][6][5] = 1'b0; zoom_xyz[7][6][5] = 1'b1;
                zoom_xyz[0][7][5] = 1'b1; zoom_xyz[1][7][5] = 1'b1; zoom_xyz[2][7][5] = 1'b1; zoom_xyz[3][7][5] = 1'b1; zoom_xyz[4][7][5] = 1'b1; zoom_xyz[5][7][5] = 1'b1; zoom_xyz[6][7][5] = 1'b1; zoom_xyz[7][7][5] = 1'b1;
                zoom_xyz[0][0][6] = 1'b1; zoom_xyz[1][0][6] = 1'b1; zoom_xyz[2][0][6] = 1'b1; zoom_xyz[3][0][6] = 1'b1; zoom_xyz[4][0][6] = 1'b1; zoom_xyz[5][0][6] = 1'b1; zoom_xyz[6][0][6] = 1'b1; zoom_xyz[7][0][6] = 1'b1;
                zoom_xyz[0][1][6] = 1'b1; zoom_xyz[1][1][6] = 1'b0; zoom_xyz[2][1][6] = 1'b0; zoom_xyz[3][1][6] = 1'b0; zoom_xyz[4][1][6] = 1'b0; zoom_xyz[5][1][6] = 1'b0; zoom_xyz[6][1][6] = 1'b0; zoom_xyz[7][1][6] = 1'b1;
                zoom_xyz[0][2][6] = 1'b1; zoom_xyz[1][2][6] = 1'b0; zoom_xyz[2][2][6] = 1'b0; zoom_xyz[3][2][6] = 1'b0; zoom_xyz[4][2][6] = 1'b0; zoom_xyz[5][2][6] = 1'b0; zoom_xyz[6][2][6] = 1'b0; zoom_xyz[7][2][6] = 1'b1;
                zoom_xyz[0][3][6] = 1'b1; zoom_xyz[1][3][6] = 1'b0; zoom_xyz[2][3][6] = 1'b0; zoom_xyz[3][3][6] = 1'b0; zoom_xyz[4][3][6] = 1'b0; zoom_xyz[5][3][6] = 1'b0; zoom_xyz[6][3][6] = 1'b0; zoom_xyz[7][3][6] = 1'b1;
                zoom_xyz[0][4][6] = 1'b1; zoom_xyz[1][4][6] = 1'b0; zoom_xyz[2][4][6] = 1'b0; zoom_xyz[3][4][6] = 1'b0; zoom_xyz[4][4][6] = 1'b0; zoom_xyz[5][4][6] = 1'b0; zoom_xyz[6][4][6] = 1'b0; zoom_xyz[7][4][6] = 1'b1;
                zoom_xyz[0][5][6] = 1'b1; zoom_xyz[1][5][6] = 1'b0; zoom_xyz[2][5][6] = 1'b0; zoom_xyz[3][5][6] = 1'b0; zoom_xyz[4][5][6] = 1'b0; zoom_xyz[5][5][6] = 1'b0; zoom_xyz[6][5][6] = 1'b0; zoom_xyz[7][5][6] = 1'b1;
                zoom_xyz[0][6][6] = 1'b1; zoom_xyz[1][6][6] = 1'b0; zoom_xyz[2][6][6] = 1'b0; zoom_xyz[3][6][6] = 1'b0; zoom_xyz[4][6][6] = 1'b0; zoom_xyz[5][6][6] = 1'b0; zoom_xyz[6][6][6] = 1'b0; zoom_xyz[7][6][6] = 1'b1;
                zoom_xyz[0][7][6] = 1'b1; zoom_xyz[1][7][6] = 1'b1; zoom_xyz[2][7][6] = 1'b1; zoom_xyz[3][7][6] = 1'b1; zoom_xyz[4][7][6] = 1'b1; zoom_xyz[5][7][6] = 1'b1; zoom_xyz[6][7][6] = 1'b1; zoom_xyz[7][7][6] = 1'b1;
                zoom_xyz[0][0][7] = 1'b1; zoom_xyz[1][0][7] = 1'b1; zoom_xyz[2][0][7] = 1'b1; zoom_xyz[3][0][7] = 1'b1; zoom_xyz[4][0][7] = 1'b1; zoom_xyz[5][0][7] = 1'b1; zoom_xyz[6][0][7] = 1'b1; zoom_xyz[7][0][7] = 1'b1;
                zoom_xyz[0][1][7] = 1'b1; zoom_xyz[1][1][7] = 1'b1; zoom_xyz[2][1][7] = 1'b1; zoom_xyz[3][1][7] = 1'b1; zoom_xyz[4][1][7] = 1'b1; zoom_xyz[5][1][7] = 1'b1; zoom_xyz[6][1][7] = 1'b1; zoom_xyz[7][1][7] = 1'b1;
                zoom_xyz[0][2][7] = 1'b1; zoom_xyz[1][2][7] = 1'b1; zoom_xyz[2][2][7] = 1'b1; zoom_xyz[3][2][7] = 1'b1; zoom_xyz[4][2][7] = 1'b1; zoom_xyz[5][2][7] = 1'b1; zoom_xyz[6][2][7] = 1'b1; zoom_xyz[7][2][7] = 1'b1;
                zoom_xyz[0][3][7] = 1'b1; zoom_xyz[1][3][7] = 1'b1; zoom_xyz[2][3][7] = 1'b1; zoom_xyz[3][3][7] = 1'b1; zoom_xyz[4][3][7] = 1'b1; zoom_xyz[5][3][7] = 1'b1; zoom_xyz[6][3][7] = 1'b1; zoom_xyz[7][3][7] = 1'b1;
                zoom_xyz[0][4][7] = 1'b1; zoom_xyz[1][4][7] = 1'b1; zoom_xyz[2][4][7] = 1'b1; zoom_xyz[3][4][7] = 1'b1; zoom_xyz[4][4][7] = 1'b1; zoom_xyz[5][4][7] = 1'b1; zoom_xyz[6][4][7] = 1'b1; zoom_xyz[7][4][7] = 1'b1;
                zoom_xyz[0][5][7] = 1'b1; zoom_xyz[1][5][7] = 1'b1; zoom_xyz[2][5][7] = 1'b1; zoom_xyz[3][5][7] = 1'b1; zoom_xyz[4][5][7] = 1'b1; zoom_xyz[5][5][7] = 1'b1; zoom_xyz[6][5][7] = 1'b1; zoom_xyz[7][5][7] = 1'b1;
                zoom_xyz[0][6][7] = 1'b1; zoom_xyz[1][6][7] = 1'b1; zoom_xyz[2][6][7] = 1'b1; zoom_xyz[3][6][7] = 1'b1; zoom_xyz[4][6][7] = 1'b1; zoom_xyz[5][6][7] = 1'b1; zoom_xyz[6][6][7] = 1'b1; zoom_xyz[7][6][7] = 1'b1;
                zoom_xyz[0][7][7] = 1'b1; zoom_xyz[1][7][7] = 1'b1; zoom_xyz[2][7][7] = 1'b1; zoom_xyz[3][7][7] = 1'b1; zoom_xyz[4][7][7] = 1'b1; zoom_xyz[5][7][7] = 1'b1; zoom_xyz[6][7][7] = 1'b1; zoom_xyz[7][7][7] = 1'b1;
            end

            default: begin     
                zoom_xyz[0][0][0] = 1'b1; zoom_xyz[1][0][0] = 1'b1; zoom_xyz[2][0][0] = 1'b1; zoom_xyz[3][0][0] = 1'b1; zoom_xyz[4][0][0] = 1'b1; zoom_xyz[5][0][0] = 1'b1; zoom_xyz[6][0][0] = 1'b1; zoom_xyz[7][0][0] = 1'b1;
                zoom_xyz[0][1][0] = 1'b1; zoom_xyz[1][1][0] = 1'b1; zoom_xyz[2][1][0] = 1'b1; zoom_xyz[3][1][0] = 1'b1; zoom_xyz[4][1][0] = 1'b1; zoom_xyz[5][1][0] = 1'b1; zoom_xyz[6][1][0] = 1'b1; zoom_xyz[7][1][0] = 1'b1;
                zoom_xyz[0][2][0] = 1'b1; zoom_xyz[1][2][0] = 1'b1; zoom_xyz[2][2][0] = 1'b1; zoom_xyz[3][2][0] = 1'b1; zoom_xyz[4][2][0] = 1'b1; zoom_xyz[5][2][0] = 1'b1; zoom_xyz[6][2][0] = 1'b1; zoom_xyz[7][2][0] = 1'b1;
                zoom_xyz[0][3][0] = 1'b1; zoom_xyz[1][3][0] = 1'b1; zoom_xyz[2][3][0] = 1'b1; zoom_xyz[3][3][0] = 1'b1; zoom_xyz[4][3][0] = 1'b1; zoom_xyz[5][3][0] = 1'b1; zoom_xyz[6][3][0] = 1'b1; zoom_xyz[7][3][0] = 1'b1;
                zoom_xyz[0][4][0] = 1'b1; zoom_xyz[1][4][0] = 1'b1; zoom_xyz[2][4][0] = 1'b1; zoom_xyz[3][4][0] = 1'b1; zoom_xyz[4][4][0] = 1'b1; zoom_xyz[5][4][0] = 1'b1; zoom_xyz[6][4][0] = 1'b1; zoom_xyz[7][4][0] = 1'b1;
                zoom_xyz[0][5][0] = 1'b1; zoom_xyz[1][5][0] = 1'b1; zoom_xyz[2][5][0] = 1'b1; zoom_xyz[3][5][0] = 1'b1; zoom_xyz[4][5][0] = 1'b1; zoom_xyz[5][5][0] = 1'b1; zoom_xyz[6][5][0] = 1'b1; zoom_xyz[7][5][0] = 1'b1;
                zoom_xyz[0][6][0] = 1'b1; zoom_xyz[1][6][0] = 1'b1; zoom_xyz[2][6][0] = 1'b1; zoom_xyz[3][6][0] = 1'b1; zoom_xyz[4][6][0] = 1'b1; zoom_xyz[5][6][0] = 1'b1; zoom_xyz[6][6][0] = 1'b1; zoom_xyz[7][6][0] = 1'b1;
                zoom_xyz[0][7][0] = 1'b1; zoom_xyz[1][7][0] = 1'b1; zoom_xyz[2][7][0] = 1'b1; zoom_xyz[3][7][0] = 1'b1; zoom_xyz[4][7][0] = 1'b1; zoom_xyz[5][7][0] = 1'b1; zoom_xyz[6][7][0] = 1'b1; zoom_xyz[7][7][0] = 1'b1;
                zoom_xyz[0][0][1] = 1'b1; zoom_xyz[1][0][1] = 1'b1; zoom_xyz[2][0][1] = 1'b1; zoom_xyz[3][0][1] = 1'b1; zoom_xyz[4][0][1] = 1'b1; zoom_xyz[5][0][1] = 1'b1; zoom_xyz[6][0][1] = 1'b1; zoom_xyz[7][0][1] = 1'b1;
                zoom_xyz[0][1][1] = 1'b1; zoom_xyz[1][1][1] = 1'b0; zoom_xyz[2][1][1] = 1'b0; zoom_xyz[3][1][1] = 1'b0; zoom_xyz[4][1][1] = 1'b0; zoom_xyz[5][1][1] = 1'b0; zoom_xyz[6][1][1] = 1'b0; zoom_xyz[7][1][1] = 1'b1;
                zoom_xyz[0][2][1] = 1'b1; zoom_xyz[1][2][1] = 1'b0; zoom_xyz[2][2][1] = 1'b0; zoom_xyz[3][2][1] = 1'b0; zoom_xyz[4][2][1] = 1'b0; zoom_xyz[5][2][1] = 1'b0; zoom_xyz[6][2][1] = 1'b0; zoom_xyz[7][2][1] = 1'b1;
                zoom_xyz[0][3][1] = 1'b1; zoom_xyz[1][3][1] = 1'b0; zoom_xyz[2][3][1] = 1'b0; zoom_xyz[3][3][1] = 1'b0; zoom_xyz[4][3][1] = 1'b0; zoom_xyz[5][3][1] = 1'b0; zoom_xyz[6][3][1] = 1'b0; zoom_xyz[7][3][1] = 1'b1;
                zoom_xyz[0][4][1] = 1'b1; zoom_xyz[1][4][1] = 1'b0; zoom_xyz[2][4][1] = 1'b0; zoom_xyz[3][4][1] = 1'b0; zoom_xyz[4][4][1] = 1'b0; zoom_xyz[5][4][1] = 1'b0; zoom_xyz[6][4][1] = 1'b0; zoom_xyz[7][4][1] = 1'b1;
                zoom_xyz[0][5][1] = 1'b1; zoom_xyz[1][5][1] = 1'b0; zoom_xyz[2][5][1] = 1'b0; zoom_xyz[3][5][1] = 1'b0; zoom_xyz[4][5][1] = 1'b0; zoom_xyz[5][5][1] = 1'b0; zoom_xyz[6][5][1] = 1'b0; zoom_xyz[7][5][1] = 1'b1;
                zoom_xyz[0][6][1] = 1'b1; zoom_xyz[1][6][1] = 1'b0; zoom_xyz[2][6][1] = 1'b0; zoom_xyz[3][6][1] = 1'b0; zoom_xyz[4][6][1] = 1'b0; zoom_xyz[5][6][1] = 1'b0; zoom_xyz[6][6][1] = 1'b0; zoom_xyz[7][6][1] = 1'b1;
                zoom_xyz[0][7][1] = 1'b1; zoom_xyz[1][7][1] = 1'b1; zoom_xyz[2][7][1] = 1'b1; zoom_xyz[3][7][1] = 1'b1; zoom_xyz[4][7][1] = 1'b1; zoom_xyz[5][7][1] = 1'b1; zoom_xyz[6][7][1] = 1'b1; zoom_xyz[7][7][1] = 1'b1;
                zoom_xyz[0][0][2] = 1'b1; zoom_xyz[1][0][2] = 1'b1; zoom_xyz[2][0][2] = 1'b1; zoom_xyz[3][0][2] = 1'b1; zoom_xyz[4][0][2] = 1'b1; zoom_xyz[5][0][2] = 1'b1; zoom_xyz[6][0][2] = 1'b1; zoom_xyz[7][0][2] = 1'b1;
                zoom_xyz[0][1][2] = 1'b1; zoom_xyz[1][1][2] = 1'b0; zoom_xyz[2][1][2] = 1'b0; zoom_xyz[3][1][2] = 1'b0; zoom_xyz[4][1][2] = 1'b0; zoom_xyz[5][1][2] = 1'b0; zoom_xyz[6][1][2] = 1'b0; zoom_xyz[7][1][2] = 1'b1;
                zoom_xyz[0][2][2] = 1'b1; zoom_xyz[1][2][2] = 1'b0; zoom_xyz[2][2][2] = 1'b0; zoom_xyz[3][2][2] = 1'b0; zoom_xyz[4][2][2] = 1'b0; zoom_xyz[5][2][2] = 1'b0; zoom_xyz[6][2][2] = 1'b0; zoom_xyz[7][2][2] = 1'b1;
                zoom_xyz[0][3][2] = 1'b1; zoom_xyz[1][3][2] = 1'b0; zoom_xyz[2][3][2] = 1'b0; zoom_xyz[3][3][2] = 1'b0; zoom_xyz[4][3][2] = 1'b0; zoom_xyz[5][3][2] = 1'b0; zoom_xyz[6][3][2] = 1'b0; zoom_xyz[7][3][2] = 1'b1;
                zoom_xyz[0][4][2] = 1'b1; zoom_xyz[1][4][2] = 1'b0; zoom_xyz[2][4][2] = 1'b0; zoom_xyz[3][4][2] = 1'b0; zoom_xyz[4][4][2] = 1'b0; zoom_xyz[5][4][2] = 1'b0; zoom_xyz[6][4][2] = 1'b0; zoom_xyz[7][4][2] = 1'b1;
                zoom_xyz[0][5][2] = 1'b1; zoom_xyz[1][5][2] = 1'b0; zoom_xyz[2][5][2] = 1'b0; zoom_xyz[3][5][2] = 1'b0; zoom_xyz[4][5][2] = 1'b0; zoom_xyz[5][5][2] = 1'b0; zoom_xyz[6][5][2] = 1'b0; zoom_xyz[7][5][2] = 1'b1;
                zoom_xyz[0][6][2] = 1'b1; zoom_xyz[1][6][2] = 1'b0; zoom_xyz[2][6][2] = 1'b0; zoom_xyz[3][6][2] = 1'b0; zoom_xyz[4][6][2] = 1'b0; zoom_xyz[5][6][2] = 1'b0; zoom_xyz[6][6][2] = 1'b0; zoom_xyz[7][6][2] = 1'b1;
                zoom_xyz[0][7][2] = 1'b1; zoom_xyz[1][7][2] = 1'b1; zoom_xyz[2][7][2] = 1'b1; zoom_xyz[3][7][2] = 1'b1; zoom_xyz[4][7][2] = 1'b1; zoom_xyz[5][7][2] = 1'b1; zoom_xyz[6][7][2] = 1'b1; zoom_xyz[7][7][2] = 1'b1;
                zoom_xyz[0][0][3] = 1'b1; zoom_xyz[1][0][3] = 1'b1; zoom_xyz[2][0][3] = 1'b1; zoom_xyz[3][0][3] = 1'b1; zoom_xyz[4][0][3] = 1'b1; zoom_xyz[5][0][3] = 1'b1; zoom_xyz[6][0][3] = 1'b1; zoom_xyz[7][0][3] = 1'b1;
                zoom_xyz[0][1][3] = 1'b1; zoom_xyz[1][1][3] = 1'b0; zoom_xyz[2][1][3] = 1'b0; zoom_xyz[3][1][3] = 1'b0; zoom_xyz[4][1][3] = 1'b0; zoom_xyz[5][1][3] = 1'b0; zoom_xyz[6][1][3] = 1'b0; zoom_xyz[7][1][3] = 1'b1;
                zoom_xyz[0][2][3] = 1'b1; zoom_xyz[1][2][3] = 1'b0; zoom_xyz[2][2][3] = 1'b0; zoom_xyz[3][2][3] = 1'b0; zoom_xyz[4][2][3] = 1'b0; zoom_xyz[5][2][3] = 1'b0; zoom_xyz[6][2][3] = 1'b0; zoom_xyz[7][2][3] = 1'b1;
                zoom_xyz[0][3][3] = 1'b1; zoom_xyz[1][3][3] = 1'b0; zoom_xyz[2][3][3] = 1'b0; zoom_xyz[3][3][3] = 1'b0; zoom_xyz[4][3][3] = 1'b0; zoom_xyz[5][3][3] = 1'b0; zoom_xyz[6][3][3] = 1'b0; zoom_xyz[7][3][3] = 1'b1;
                zoom_xyz[0][4][3] = 1'b1; zoom_xyz[1][4][3] = 1'b0; zoom_xyz[2][4][3] = 1'b0; zoom_xyz[3][4][3] = 1'b0; zoom_xyz[4][4][3] = 1'b0; zoom_xyz[5][4][3] = 1'b0; zoom_xyz[6][4][3] = 1'b0; zoom_xyz[7][4][3] = 1'b1;
                zoom_xyz[0][5][3] = 1'b1; zoom_xyz[1][5][3] = 1'b0; zoom_xyz[2][5][3] = 1'b0; zoom_xyz[3][5][3] = 1'b0; zoom_xyz[4][5][3] = 1'b0; zoom_xyz[5][5][3] = 1'b0; zoom_xyz[6][5][3] = 1'b0; zoom_xyz[7][5][3] = 1'b1;
                zoom_xyz[0][6][3] = 1'b1; zoom_xyz[1][6][3] = 1'b0; zoom_xyz[2][6][3] = 1'b0; zoom_xyz[3][6][3] = 1'b0; zoom_xyz[4][6][3] = 1'b0; zoom_xyz[5][6][3] = 1'b0; zoom_xyz[6][6][3] = 1'b0; zoom_xyz[7][6][3] = 1'b1;
                zoom_xyz[0][7][3] = 1'b1; zoom_xyz[1][7][3] = 1'b1; zoom_xyz[2][7][3] = 1'b1; zoom_xyz[3][7][3] = 1'b1; zoom_xyz[4][7][3] = 1'b1; zoom_xyz[5][7][3] = 1'b1; zoom_xyz[6][7][3] = 1'b1; zoom_xyz[7][7][3] = 1'b1;
                zoom_xyz[0][0][4] = 1'b1; zoom_xyz[1][0][4] = 1'b1; zoom_xyz[2][0][4] = 1'b1; zoom_xyz[3][0][4] = 1'b1; zoom_xyz[4][0][4] = 1'b1; zoom_xyz[5][0][4] = 1'b1; zoom_xyz[6][0][4] = 1'b1; zoom_xyz[7][0][4] = 1'b1;
                zoom_xyz[0][1][4] = 1'b1; zoom_xyz[1][1][4] = 1'b0; zoom_xyz[2][1][4] = 1'b0; zoom_xyz[3][1][4] = 1'b0; zoom_xyz[4][1][4] = 1'b0; zoom_xyz[5][1][4] = 1'b0; zoom_xyz[6][1][4] = 1'b0; zoom_xyz[7][1][4] = 1'b1;
                zoom_xyz[0][2][4] = 1'b1; zoom_xyz[1][2][4] = 1'b0; zoom_xyz[2][2][4] = 1'b0; zoom_xyz[3][2][4] = 1'b0; zoom_xyz[4][2][4] = 1'b0; zoom_xyz[5][2][4] = 1'b0; zoom_xyz[6][2][4] = 1'b0; zoom_xyz[7][2][4] = 1'b1;
                zoom_xyz[0][3][4] = 1'b1; zoom_xyz[1][3][4] = 1'b0; zoom_xyz[2][3][4] = 1'b0; zoom_xyz[3][3][4] = 1'b0; zoom_xyz[4][3][4] = 1'b0; zoom_xyz[5][3][4] = 1'b0; zoom_xyz[6][3][4] = 1'b0; zoom_xyz[7][3][4] = 1'b1;
                zoom_xyz[0][4][4] = 1'b1; zoom_xyz[1][4][4] = 1'b0; zoom_xyz[2][4][4] = 1'b0; zoom_xyz[3][4][4] = 1'b0; zoom_xyz[4][4][4] = 1'b0; zoom_xyz[5][4][4] = 1'b0; zoom_xyz[6][4][4] = 1'b0; zoom_xyz[7][4][4] = 1'b1;
                zoom_xyz[0][5][4] = 1'b1; zoom_xyz[1][5][4] = 1'b0; zoom_xyz[2][5][4] = 1'b0; zoom_xyz[3][5][4] = 1'b0; zoom_xyz[4][5][4] = 1'b0; zoom_xyz[5][5][4] = 1'b0; zoom_xyz[6][5][4] = 1'b0; zoom_xyz[7][5][4] = 1'b1;
                zoom_xyz[0][6][4] = 1'b1; zoom_xyz[1][6][4] = 1'b0; zoom_xyz[2][6][4] = 1'b0; zoom_xyz[3][6][4] = 1'b0; zoom_xyz[4][6][4] = 1'b0; zoom_xyz[5][6][4] = 1'b0; zoom_xyz[6][6][4] = 1'b0; zoom_xyz[7][6][4] = 1'b1;
                zoom_xyz[0][7][4] = 1'b1; zoom_xyz[1][7][4] = 1'b1; zoom_xyz[2][7][4] = 1'b1; zoom_xyz[3][7][4] = 1'b1; zoom_xyz[4][7][4] = 1'b1; zoom_xyz[5][7][4] = 1'b1; zoom_xyz[6][7][4] = 1'b1; zoom_xyz[7][7][4] = 1'b1;
                zoom_xyz[0][0][5] = 1'b1; zoom_xyz[1][0][5] = 1'b1; zoom_xyz[2][0][5] = 1'b1; zoom_xyz[3][0][5] = 1'b1; zoom_xyz[4][0][5] = 1'b1; zoom_xyz[5][0][5] = 1'b1; zoom_xyz[6][0][5] = 1'b1; zoom_xyz[7][0][5] = 1'b1;
                zoom_xyz[0][1][5] = 1'b1; zoom_xyz[1][1][5] = 1'b0; zoom_xyz[2][1][5] = 1'b0; zoom_xyz[3][1][5] = 1'b0; zoom_xyz[4][1][5] = 1'b0; zoom_xyz[5][1][5] = 1'b0; zoom_xyz[6][1][5] = 1'b0; zoom_xyz[7][1][5] = 1'b1;
                zoom_xyz[0][2][5] = 1'b1; zoom_xyz[1][2][5] = 1'b0; zoom_xyz[2][2][5] = 1'b0; zoom_xyz[3][2][5] = 1'b0; zoom_xyz[4][2][5] = 1'b0; zoom_xyz[5][2][5] = 1'b0; zoom_xyz[6][2][5] = 1'b0; zoom_xyz[7][2][5] = 1'b1;
                zoom_xyz[0][3][5] = 1'b1; zoom_xyz[1][3][5] = 1'b0; zoom_xyz[2][3][5] = 1'b0; zoom_xyz[3][3][5] = 1'b0; zoom_xyz[4][3][5] = 1'b0; zoom_xyz[5][3][5] = 1'b0; zoom_xyz[6][3][5] = 1'b0; zoom_xyz[7][3][5] = 1'b1;
                zoom_xyz[0][4][5] = 1'b1; zoom_xyz[1][4][5] = 1'b0; zoom_xyz[2][4][5] = 1'b0; zoom_xyz[3][4][5] = 1'b0; zoom_xyz[4][4][5] = 1'b0; zoom_xyz[5][4][5] = 1'b0; zoom_xyz[6][4][5] = 1'b0; zoom_xyz[7][4][5] = 1'b1;
                zoom_xyz[0][5][5] = 1'b1; zoom_xyz[1][5][5] = 1'b0; zoom_xyz[2][5][5] = 1'b0; zoom_xyz[3][5][5] = 1'b0; zoom_xyz[4][5][5] = 1'b0; zoom_xyz[5][5][5] = 1'b0; zoom_xyz[6][5][5] = 1'b0; zoom_xyz[7][5][5] = 1'b1;
                zoom_xyz[0][6][5] = 1'b1; zoom_xyz[1][6][5] = 1'b0; zoom_xyz[2][6][5] = 1'b0; zoom_xyz[3][6][5] = 1'b0; zoom_xyz[4][6][5] = 1'b0; zoom_xyz[5][6][5] = 1'b0; zoom_xyz[6][6][5] = 1'b0; zoom_xyz[7][6][5] = 1'b1;
                zoom_xyz[0][7][5] = 1'b1; zoom_xyz[1][7][5] = 1'b1; zoom_xyz[2][7][5] = 1'b1; zoom_xyz[3][7][5] = 1'b1; zoom_xyz[4][7][5] = 1'b1; zoom_xyz[5][7][5] = 1'b1; zoom_xyz[6][7][5] = 1'b1; zoom_xyz[7][7][5] = 1'b1;
                zoom_xyz[0][0][6] = 1'b1; zoom_xyz[1][0][6] = 1'b1; zoom_xyz[2][0][6] = 1'b1; zoom_xyz[3][0][6] = 1'b1; zoom_xyz[4][0][6] = 1'b1; zoom_xyz[5][0][6] = 1'b1; zoom_xyz[6][0][6] = 1'b1; zoom_xyz[7][0][6] = 1'b1;
                zoom_xyz[0][1][6] = 1'b1; zoom_xyz[1][1][6] = 1'b0; zoom_xyz[2][1][6] = 1'b0; zoom_xyz[3][1][6] = 1'b0; zoom_xyz[4][1][6] = 1'b0; zoom_xyz[5][1][6] = 1'b0; zoom_xyz[6][1][6] = 1'b0; zoom_xyz[7][1][6] = 1'b1;
                zoom_xyz[0][2][6] = 1'b1; zoom_xyz[1][2][6] = 1'b0; zoom_xyz[2][2][6] = 1'b0; zoom_xyz[3][2][6] = 1'b0; zoom_xyz[4][2][6] = 1'b0; zoom_xyz[5][2][6] = 1'b0; zoom_xyz[6][2][6] = 1'b0; zoom_xyz[7][2][6] = 1'b1;
                zoom_xyz[0][3][6] = 1'b1; zoom_xyz[1][3][6] = 1'b0; zoom_xyz[2][3][6] = 1'b0; zoom_xyz[3][3][6] = 1'b0; zoom_xyz[4][3][6] = 1'b0; zoom_xyz[5][3][6] = 1'b0; zoom_xyz[6][3][6] = 1'b0; zoom_xyz[7][3][6] = 1'b1;
                zoom_xyz[0][4][6] = 1'b1; zoom_xyz[1][4][6] = 1'b0; zoom_xyz[2][4][6] = 1'b0; zoom_xyz[3][4][6] = 1'b0; zoom_xyz[4][4][6] = 1'b0; zoom_xyz[5][4][6] = 1'b0; zoom_xyz[6][4][6] = 1'b0; zoom_xyz[7][4][6] = 1'b1;
                zoom_xyz[0][5][6] = 1'b1; zoom_xyz[1][5][6] = 1'b0; zoom_xyz[2][5][6] = 1'b0; zoom_xyz[3][5][6] = 1'b0; zoom_xyz[4][5][6] = 1'b0; zoom_xyz[5][5][6] = 1'b0; zoom_xyz[6][5][6] = 1'b0; zoom_xyz[7][5][6] = 1'b1;
                zoom_xyz[0][6][6] = 1'b1; zoom_xyz[1][6][6] = 1'b0; zoom_xyz[2][6][6] = 1'b0; zoom_xyz[3][6][6] = 1'b0; zoom_xyz[4][6][6] = 1'b0; zoom_xyz[5][6][6] = 1'b0; zoom_xyz[6][6][6] = 1'b0; zoom_xyz[7][6][6] = 1'b1;
                zoom_xyz[0][7][6] = 1'b1; zoom_xyz[1][7][6] = 1'b1; zoom_xyz[2][7][6] = 1'b1; zoom_xyz[3][7][6] = 1'b1; zoom_xyz[4][7][6] = 1'b1; zoom_xyz[5][7][6] = 1'b1; zoom_xyz[6][7][6] = 1'b1; zoom_xyz[7][7][6] = 1'b1;
                zoom_xyz[0][0][7] = 1'b1; zoom_xyz[1][0][7] = 1'b1; zoom_xyz[2][0][7] = 1'b1; zoom_xyz[3][0][7] = 1'b1; zoom_xyz[4][0][7] = 1'b1; zoom_xyz[5][0][7] = 1'b1; zoom_xyz[6][0][7] = 1'b1; zoom_xyz[7][0][7] = 1'b1;
                zoom_xyz[0][1][7] = 1'b1; zoom_xyz[1][1][7] = 1'b1; zoom_xyz[2][1][7] = 1'b1; zoom_xyz[3][1][7] = 1'b1; zoom_xyz[4][1][7] = 1'b1; zoom_xyz[5][1][7] = 1'b1; zoom_xyz[6][1][7] = 1'b1; zoom_xyz[7][1][7] = 1'b1;
                zoom_xyz[0][2][7] = 1'b1; zoom_xyz[1][2][7] = 1'b1; zoom_xyz[2][2][7] = 1'b1; zoom_xyz[3][2][7] = 1'b1; zoom_xyz[4][2][7] = 1'b1; zoom_xyz[5][2][7] = 1'b1; zoom_xyz[6][2][7] = 1'b1; zoom_xyz[7][2][7] = 1'b1;
                zoom_xyz[0][3][7] = 1'b1; zoom_xyz[1][3][7] = 1'b1; zoom_xyz[2][3][7] = 1'b1; zoom_xyz[3][3][7] = 1'b1; zoom_xyz[4][3][7] = 1'b1; zoom_xyz[5][3][7] = 1'b1; zoom_xyz[6][3][7] = 1'b1; zoom_xyz[7][3][7] = 1'b1;
                zoom_xyz[0][4][7] = 1'b1; zoom_xyz[1][4][7] = 1'b1; zoom_xyz[2][4][7] = 1'b1; zoom_xyz[3][4][7] = 1'b1; zoom_xyz[4][4][7] = 1'b1; zoom_xyz[5][4][7] = 1'b1; zoom_xyz[6][4][7] = 1'b1; zoom_xyz[7][4][7] = 1'b1;
                zoom_xyz[0][5][7] = 1'b1; zoom_xyz[1][5][7] = 1'b1; zoom_xyz[2][5][7] = 1'b1; zoom_xyz[3][5][7] = 1'b1; zoom_xyz[4][5][7] = 1'b1; zoom_xyz[5][5][7] = 1'b1; zoom_xyz[6][5][7] = 1'b1; zoom_xyz[7][5][7] = 1'b1;
                zoom_xyz[0][6][7] = 1'b1; zoom_xyz[1][6][7] = 1'b1; zoom_xyz[2][6][7] = 1'b1; zoom_xyz[3][6][7] = 1'b1; zoom_xyz[4][6][7] = 1'b1; zoom_xyz[5][6][7] = 1'b1; zoom_xyz[6][6][7] = 1'b1; zoom_xyz[7][6][7] = 1'b1;
                zoom_xyz[0][7][7] = 1'b1; zoom_xyz[1][7][7] = 1'b1; zoom_xyz[2][7][7] = 1'b1; zoom_xyz[3][7][7] = 1'b1; zoom_xyz[4][7][7] = 1'b1; zoom_xyz[5][7][7] = 1'b1; zoom_xyz[6][7][7] = 1'b1; zoom_xyz[7][7][7] = 1'b1;
            end

        endcase

        if(count == 23'b11111_11111_11111_11111_111) begin//every second
            next_state = state + 1'b1;
        end
        else begin
            next_state = state;
        end
    end

endmodule