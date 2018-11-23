`include "Urna_module.v"
module testbench();
  reg Valid, Finish, Clock, Reset;
  reg [3:0]Digit;
  wire [7:0]Nulo;
  wire [7:0]C1;
  wire [7:0]C2;
  wire [7:0]C3;
  wire [7:0]C4;
  wire Status;
  Urna_module UrnaAUX(.C1(C1),.C2(C2),.C3(C3),.C4(C4),.Nulo(Nulo),.Clock(Clock),.Digit(Digit),.Valid(Valid),.Finish(Finish),.Status(Status), .Reset(Reset));
  always
    #1 Clock <= ~Clock;
  initial begin
    $dumpfile("testdump.vcd");
    $dumpvars(0, testbench);
    $display("Testbech da Urna Eletronica iniciado!");
    $monitor("Novo voto detectado! \nC1:  %d\nC2:  %d\nC3:  %d\nC4:  %d\nNulo:%d\n", C1, C2, C3, C4, Nulo);
  end
  initial begin
    Clock = 0;
    Digit = 4'b0000;
    Valid = 0;
    Finish = 0;
    Reset = 0;
//Reset e Finish
    #1 Finish = 1;
    #1 Finish = 0;

//Voto Samuel
    #2 Valid = 1;
    #1 Digit = 4'b0011;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0100;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b1001;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0100;
    #1 Valid = 0;
/////////////////////////////////////
//Reset e Finish
    #1 Finish = 1;
    #1 Finish = 0;
//Voto Yuri
    #2 Valid = 1;
    #1 Digit = 4'b0011;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0100;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b1000;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0101;
    #1 Valid = 0;
///////////////////////////////////////
//Reset e Finish
    #1 Finish = 1;
    #1 Finish = 0;
//Voto Samuel
    #2 Valid = 1;
    #1 Digit = 4'b0011;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0100;
    #1 Valid = 0;                             ////Segundo voto para samuel


    #2 Valid = 1;
    #1 Digit = 4'b1001;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0100;
    #1 Valid = 0;
/////////////////////////////////////
//Reset e Finish
    #1 Finish = 1;
    #1 Finish = 0;
//Voto William
    #2 Valid = 1;
    #1 Digit = 4'b0011;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0100;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0111;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0010;
    #1 Valid = 0;
/////////////////////////////////////
//Reset e Finish
    #1 Finish = 1;
    #1 Finish = 0;
//Voto Marcos
    #2 Valid = 1;
    #1 Digit = 4'b0011;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0101;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0000;
    #1 Valid = 0;


    #2 Valid = 1;
    #1 Digit = 4'b0100;
    #1 Valid = 0;
///////////////////////////////////
//Reset e Finish
    #1 Finish = 1;
    #1 Finish = 0;


//Voto Nulo
    #2 Valid = 1;
    #1 Digit = 4'b0011;
    #1 Valid = 0;
    #2 Valid = 1;



    #1 Digit = 4'b0000;
    #1 Valid = 0;
    #2 Valid = 1;

///////////////////////////////////
//Reset e Finish
    #1 Reset = 1;
    #1 Reset = 0;

    $finish;
  end
endmodule
