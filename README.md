# Stopwatch-System-using-HDL
The project aims to design, implement, and verify the functionality of a stopwatch system using HDL (SystemVerilog IEEE 1800-2017), the De0-Nano FPGA development platform, and the necessary supporting hardware.


## In this project, I implmented a stopwatch system using SystemVerilog. The stopwatch is designed to display 4 digits, 2 for minutes and 2 for seconds: M1M0:S1S0. The minimum starting value of the stopwatch is 10:20, while the maximum value of this stopwatch is 49:30. 

## The stopwatch has multiple inputs as follows:
1) DIP switch for starting and pausing the count operation. 
2) DIP switch for toggling between the count up and count down modes. 
3) DIP switch for speeding up the watch rate so that the watch will count two digits each second.
4) DIP switch for slowing down the watch rate so that the watch will advance one digit each two seconds.
5) Push button for resetting.
6) Push button for adding (or subtracting) 2 minutes each time it is pressed (add2 button). The adding or subtracting is allowed while counting and while paused.

    a) Count-up mode: adding 2 minutes each time it is pressed.
    
    b) Count-down mode: subtracting 2 minutes each time it is pressed.

## The System Design:
![Circuittttttttt](https://user-images.githubusercontent.com/58476343/220156895-a488efcb-2bc4-416e-8e87-995051a1c0b9.jpg)


## Demo <a name="demo"></a>

https://user-images.githubusercontent.com/58476343/220156630-2d7ac2c4-3c68-4b2d-b5d4-03c5431df58b.mp4

