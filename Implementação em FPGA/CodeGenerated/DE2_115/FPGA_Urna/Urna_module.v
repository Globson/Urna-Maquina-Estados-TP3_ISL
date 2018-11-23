module Urna_module(C1,C2,C3,C4,Nulo,Clock,Digit,Valid,Finish,Status);
  input wire Clock,Valid,Finish;
  input wire [3:0]Digit;
  output reg [7:0]Nulo = 8'b00000000;
  output reg [7:0]C1 = 8'b00000000;
  output reg [7:0]C2 = 8'b00000000;
  output reg [7:0]C3 = 8'b00000000;
  output reg [7:0]C4 = 8'b00000000;
  output reg Status = 0;
  reg [3:0]Estado = 4'b0000;

always @ (posedge Clock) begin
    if(~Finish)begin
        case (Estado)
          4'b0000: //E0
            begin
              if((Digit[3]==0)&(Digit[2]==0)&(Digit[1]==1)&(Digit[0]==1)&(Valid))begin  //3
                 Estado <= 4'b0001;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end

          4'b0001: //E1
            begin
              if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==0)&(Digit[0]==0)&(Valid))begin    //4
                 Estado <= 4'b0010;
              end
              else if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==0)&(Digit[0]==1)&(Valid))begin   //5
                 Estado <= 4'b0011;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end

          4'b0010: //E2
            begin
              if((Digit[3]==1)&(Digit[2]==0)&(Digit[1]==0)&(Digit[0]==1)&(Valid))begin   //9
                 Estado <= 4'b0100;
              end
              else if((Digit[3]==1)&(Digit[2]==0)&(Digit[1]==0)&(Digit[0]==0)&(Valid))begin   //8
                 Estado <= 4'b0101;
              end
              else if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==1)&(Digit[0]==1)&(Valid))begin   //7
                 Estado <= 4'b0110;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end

          4'b0011: //E3
            begin
              if((Digit[3]==0)&(Digit[2]==0)&(Digit[1]==0)&(Digit[0]==0)&(Valid))begin    //0
                 Estado <= 4'b0111;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end

        //////////////////////////////////////Votos Begin --->>>>>>>>

          4'b0100: //E4
            begin
              if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==0)&(Digit[0]==0)&(Valid))begin    //4
                 C1 <= C1 + 8'b00000001;       //Voto no Samuel-3494
                 Status <= 1;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end

          4'b0101: //E5
            begin
              if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==0)&(Digit[0]==1)&(Valid))begin    //5
                C2 <= C2 + 8'b00000001;       //Voto no Yuri-3485
                Status <= 1;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end

          4'b0110: //E6
            begin
              if((Digit[3]==0)&(Digit[2]==0)&(Digit[1]==1)&(Digit[0]==0)&(Valid))begin    //2
                C3 <= C3 + 8'b00000001;       //Voto no William-3472
                Status <= 1;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end

          4'b0111: //E7
            begin
              if((Digit[3]==0)&(Digit[2]==1)&(Digit[1]==0)&(Digit[0]==0)&(Valid))begin   //4
                C4 <= C4 + 8'b00000001;       //Voto no Marcos-3504
                Status <= 1;
              end
              else if(Valid)begin
                  Estado <= 4'b1000;
              end
            end
      	  4'b1000: //E8
            begin           //Voto nulo.
              Nulo <= Nulo + 8'b00000001;
              Status <= 1;
            end
        endcase
    end
    if(Finish) begin
        Status <= 0;
        /*Nulo <= 8'b00000000;
        C1 <= 8'b00000000;
        C2 <= 8'b00000000;
        C3 <= 8'b00000000;
        C4 <= 8'b00000000;*/
        Estado <= 4'b0000;
    end
end
endmodule
