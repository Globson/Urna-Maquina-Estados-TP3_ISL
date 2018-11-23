module temporizador(clockin, clockout);
    input clockin;
    output wire clockout;

    parameter n = 50000000;
    reg [n:0] cont;

    always@(posedge clockin)
    begin
        cont <= cont + 1;
    end

    assign clockout = cont[n];
endmodule
