
module ALU16BIT (
  input wire [15:0] A,
  input wire [15:0] B,
  input wire [3:0]  ALU_FUN,
  input wire        CLK,
  output reg [15:0] ALU_OUT,
  output reg        Arith_Flag,
  output reg        Logic_Flag,
  output reg        CMP_Flag,
  output reg        Shift_Flag
  );
  
  reg [15:0] result;
  reg        arith,logic,compar,shift;
  
  always @ (*)
  begin
    case (ALU_FUN)
      4'b0000 : begin
        result = A + B;
        arith = 1'b1;
        logic = 1'b0;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b0001 : begin
        result = A - B;
        arith = 1'b1;
        logic = 1'b0;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b0010 : begin
        result = A * B;
        arith = 1'b1;
        logic = 1'b0;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b0011 : begin
        result = A / B;
        arith = 1'b1;
        logic = 1'b0;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b0100 : begin
        result = A & B;
        arith = 1'b0;
        logic = 1'b1;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b0101 : begin
        result = A | B;
        arith = 1'b0;
        logic = 1'b1;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b0110 : begin
        result = ~(A & B);
        arith = 1'b0;
        logic = 1'b1;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b0111 : begin
        result = ~(A | B);
        arith = 1'b0;
        logic = 1'b1;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b1000 : begin
        result = A ^ B;
        arith = 1'b0;
        logic = 1'b1;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b1001 : begin
        result = ~(A ^ B);
        arith = 1'b0;
        logic = 1'b1;
        compar = 1'b0;
        shift = 1'b0;
      end
      4'b1010 : begin
        if (A == B)
          begin
            result = 16'h0001;
          end
        else
          begin
            result = 16'h0000;
          end
        arith = 1'b0;
        logic = 1'b0;
        compar = 1'b1;
        shift = 1'b0;
      end
      4'b1011 : begin
        if (A > B)
          begin
            result = 16'h0002;
          end
        else
          begin
            result = 16'h0000;
          end
        arith = 1'b0;
        logic = 1'b0;
        compar = 1'b1;
        shift = 1'b0;
      end
      4'b1100 : begin
        if (B > A)
          begin
            result = 16'h0003;
          end
        else
          begin
            result = 16'h0000;
          end
        arith = 1'b0;
        logic = 1'b0;
        compar = 1'b1;
        shift = 1'b0; 
      end
      4'b1101 : begin
        result = A >> 1'b1;
        arith = 1'b0;
        logic = 1'b0;
        compar = 1'b0;
        shift = 1'b1;
      end
      4'b1110 : begin
        result = A << 1'b1;
        arith = 1'b0;
        logic = 1'b0;
        compar = 1'b0;
        shift = 1'b1; 
      end
      default : begin
        result = 16'h0000;
        arith = 1'b0;
        logic = 1'b0;
        compar = 1'b0;
        shift = 1'b0;
      end
    endcase
  end
  
  always @ (posedge CLK)
  begin
    ALU_OUT <= result;
    Arith_Flag <= arith;
    Logic_Flag <= logic;
    CMP_Flag <= compar;
    Shift_Flag <= shift;
  end

endmodule


