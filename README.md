# LED-Cube
Led cube with 3D pong game and some fancy light show implementation on Xilinx Digilent Basys 3 Artix-7 FPGA Board.

## Introduction
Pong is a video game developed by Atari in 1972. The game Atari developed was a sports game that simulates table tennis. The player controls an in-game paddle by moving it vertically across the left or right side of the screen. They can compete against another player controlling a second paddle on the opposing side. We made a pong game in 3D. In this game, instead of just trying to protect one 1D line, players must protect a 2D surface. Also, the paddles will become 2D, so the player will have to move in four directions: up, down, left, and right. But how do we make the game 3D? Since using VR is too difficult and expensive, we came up an idea of using led cube. We plan to let one player stand at one side and the other stand at the opposite side, add they can both play fantastic 3D game in real world. Also, we implement a simple function and let the player can also compete with our machine.
## Getting Started
### Prerequisites
* Xilinx Digilent Basys 3 Artix-7 FPGA Board.
* [Vivado Design Suite - HLx Editions](https://www.xilinx.com/support/download.html)
* Several electronic component
  * 3mm red led * 128
  * 3mm blue led * 384
  * 74HC595 Shift Register * 9
  * KN2222A transistor * 16
  * 220Ω resistance * 64
  * Copper wire
  * Jumper wire
  * Breadboard
* A keyboard.

## System specification

### Top module
![](https://i.imgur.com/CUaCFid.png)

### Circuit Diagram
![](https://i.imgur.com/xzvYMmV.png)
(ref: https://github.com/itsharryle/LED_CUBE)

## Reference
[Arduino 8x8x8光立方，從無到有一步步教你製作光立方。 - Derek Wu](https://crazymaker.com.tw/arduino-8x8x8-led-cube/) <br>
[How to make a 8x8x8 LED Cube at Home - Tapendra Mandal ](https://www.youtube.com/watch?v=mN5JWQUfrxY) <br>
[bogini's project](https://github.com/bogini/Pong) <br>
[itsharryle's project](https://github.com/itsharryle/LED_CUBE/tree/master/CUBE)
