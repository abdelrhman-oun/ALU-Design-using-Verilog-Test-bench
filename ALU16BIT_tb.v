
`timescale 1us/100ns

module ALU16BIT_tb () ;
  
  reg  [15:0] A_tb,B_tb;
  reg  [3:0]  ALU_FUN_tb;
  reg         CLK_tb;
  wire [15:0] ALU_OUT_tb;
  wire        Arith_Flag_tb,Logic_Flag_tb,CMP_Flag_tb,Shift_Flag_tb;
  
initial
  begin
    $dumpfile("ALU_16bit.vcd") ;
    $dumpvars ;
    //initial values
    A_tb = 16'd0;
    B_tb = 16'd0;
    ALU_FUN_tb = 4'b0000;
    CLK_tb = 1'b0;
    
    $display ("TEST CASE 1") ;  // test addition Function
    #3
    ALU_FUN_tb = 4'b0000;
    A_tb = 16'd25;
    B_tb = 16'd40;
    #7
    if ((ALU_OUT_tb != 16'd65) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 1 IS FAILED") ;
    else
      $display ("TEST CASE 1 IS PASSED") ;
      
      
    $display ("TEST CASE 2") ;  // test addition Function
    #3
    ALU_FUN_tb = 4'b0000;
    A_tb = 16'd33;
    B_tb = 16'd26;
    #7
    if ((ALU_OUT_tb != 16'd59) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 2 IS FAILED") ;
    else
      $display ("TEST CASE 2 IS PASSED") ;
      
      
    $display ("TEST CASE 3") ;  // test subtraction Function +ve result
    #3
    ALU_FUN_tb = 4'b0001;
    A_tb = 16'd40;
    B_tb = 16'd25;
    #7
    if ((ALU_OUT_tb != 16'd15) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 3 IS FAILED") ;
    else
      $display ("TEST CASE 3 IS PASSED") ;
    
    
    $display ("TEST CASE 4") ;  // test subtraction Function -ve result
    #3
    ALU_FUN_tb = 4'b0001;
    A_tb = 16'd50;
    B_tb = 16'd66;
    #7
    if ((ALU_OUT_tb != -16'd16) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 4 IS FAILED") ;
    else
      $display ("TEST CASE 4 IS PASSED") ;  
      
    
    $display ("TEST CASE 5") ;  // test multiplication Function
    #3
    ALU_FUN_tb = 4'b0010;
    A_tb = 16'd05;
    B_tb = 16'd12;
    #7
    if ((ALU_OUT_tb != 16'd60) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 5 IS FAILED") ;
    else
      $display ("TEST CASE 5 IS PASSED") ;
      
      
    $display ("TEST CASE 6") ;  // test Division Function
    #3
    ALU_FUN_tb = 4'b0011;
    A_tb = 16'd60;
    B_tb = 16'd05;
    #7
    if ((ALU_OUT_tb != 16'd12) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 6 IS FAILED") ;
    else
      $display ("TEST CASE 6 IS PASSED") ;
      
      
    $display ("TEST CASE 7") ;  // test Division Function
    #3
    ALU_FUN_tb = 4'b0011;
    A_tb = 16'd66;
    B_tb = 16'd05;
    #7
    if ((ALU_OUT_tb != 16'd13) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 7 IS FAILED") ;
    else
      $display ("TEST CASE 7 IS PASSED") ;
    
    
    $display ("TEST CASE 8") ;  // test Bitwise AND Function
    #3
    ALU_FUN_tb = 4'b0100;
    A_tb = 16'h75FA;
    B_tb = 16'h32A9;
    #7
    if ((ALU_OUT_tb != 16'h30A8) && (Logic_Flag_tb == 1'b1))
      $display ("TEST CASE 8 IS FAILED") ;
    else
      $display ("TEST CASE 8 IS PASSED") ;
      
      
    $display ("TEST CASE 9") ;  // test Bitwise OR Function
    #3
    ALU_FUN_tb = 4'b0101;
    A_tb = 16'hAB02;
    B_tb = 16'hF523;
    #7
    if ((ALU_OUT_tb != 16'hFF23) && (Logic_Flag_tb == 1'b1))
      $display ("TEST CASE 9 IS FAILED") ;
    else
      $display ("TEST CASE 9 IS PASSED") ;
      
      
    $display ("TEST CASE 10") ;  // test Bitwise NAND Function
    #3
    ALU_FUN_tb = 4'b0110;
    A_tb = 16'hAB02;
    B_tb = 16'hF523;
    #7
    if ((ALU_OUT_tb != 16'h5EFD) && (Logic_Flag_tb == 1'b1))
      $display ("TEST CASE 10 IS FAILED") ;
    else
      $display ("TEST CASE 10 IS PASSED") ;
      
      
    $display ("TEST CASE 11") ;  // test Bitwise NOR Function
    #3
    ALU_FUN_tb = 4'b0111;
    A_tb = 16'hC561;
    B_tb = 16'hD87F;
    #7
    if ((ALU_OUT_tb != 16'h2280) && (Logic_Flag_tb == 1'b1))
      $display ("TEST CASE 11 IS FAILED") ;
    else
      $display ("TEST CASE 11 IS PASSED") ;
      
      
    $display ("TEST CASE 12") ;  // test Bitwise XOR Function
    #3
    ALU_FUN_tb = 4'b1000;
    A_tb = 16'hC561;
    B_tb = 16'hD87F;
    #7
    if ((ALU_OUT_tb != 16'h1D1E) && (Logic_Flag_tb == 1'b1))
      $display ("TEST CASE 12 IS FAILED") ;
    else
      $display ("TEST CASE 12 IS PASSED") ;
      
      
    $display ("TEST CASE 13") ;  // test Bitwise XNOR Function
    #3
    ALU_FUN_tb = 4'b1001;
    A_tb = 16'hDE54;
    B_tb = 16'h618C;
    #7
    if ((ALU_OUT_tb != 16'h4027) && (Logic_Flag_tb == 1'b1))
      $display ("TEST CASE 13 IS FAILED") ;
    else
      $display ("TEST CASE 13 IS PASSED") ;
      
    
    $display ("TEST CASE 14") ;  // test compare Function equal
    #3
    ALU_FUN_tb = 4'b1010;
    A_tb = 16'd15;
    B_tb = 16'd15;
    #7
    if ((ALU_OUT_tb != 16'd1) && (CMP_Flag_tb == 1'b1))
      $display ("TEST CASE 14 IS FAILED") ;
    else
      $display ("TEST CASE 14 IS PASSED") ;
      
      
    $display ("TEST CASE 15") ;  // test compare Function NOTequal
    #3
    ALU_FUN_tb = 4'b1010;
    A_tb = 16'd20;
    B_tb = 16'd15;
    #7
    if ((ALU_OUT_tb != 16'd0) && (CMP_Flag_tb == 1'b1))
      $display ("TEST CASE 15 IS FAILED") ;
    else
      $display ("TEST CASE 15 IS PASSED") ;
      
    
    $display ("TEST CASE 16") ;  // test compare Function greater than
    #3
    ALU_FUN_tb = 4'b1011;
    A_tb = 16'd20;
    B_tb = 16'd15;
    #7
    if ((ALU_OUT_tb != 16'd2) && (CMP_Flag_tb == 1'b1))
      $display ("TEST CASE 16 IS FAILED") ;
    else
      $display ("TEST CASE 16 IS PASSED") ;
      
      
    $display ("TEST CASE 17") ;  // test compare Function NOT greater than
    #3
    ALU_FUN_tb = 4'b1011;
    A_tb = 16'd06;
    B_tb = 16'd25;
    #7
    if ((ALU_OUT_tb != 16'd0) && (CMP_Flag_tb == 1'b1))
      $display ("TEST CASE 17 IS FAILED") ;
    else
      $display ("TEST CASE 17 IS PASSED") ;
      
      
      $display ("TEST CASE 18") ;  // test compare Function less than
    #3
    ALU_FUN_tb = 4'b1100;
    A_tb = 16'd07;
    B_tb = 16'd26;
    #7
    if ((ALU_OUT_tb != 16'd3) && (CMP_Flag_tb == 1'b1))
      $display ("TEST CASE 18 IS FAILED") ;
    else
      $display ("TEST CASE 18 IS PASSED") ;
      
      
    $display ("TEST CASE 19") ;  // test compare Function NOT less than
    #3
    ALU_FUN_tb = 4'b1100;
    A_tb = 16'd27;
    B_tb = 16'd08;
    #7
    if ((ALU_OUT_tb != 16'd0) && (CMP_Flag_tb == 1'b1))
      $display ("TEST CASE 19 IS FAILED") ;
    else
      $display ("TEST CASE 19 IS PASSED") ;
      
      
    $display ("TEST CASE 20") ;  // test shift right Function
    #3
    ALU_FUN_tb = 4'b1101;
    A_tb = 16'hFF51;
    B_tb = 16'h0000;
    #7
    if ((ALU_OUT_tb != 16'h7FA8) && (Shift_Flag_tb == 1'b1))
      $display ("TEST CASE 20 IS FAILED") ;
    else
      $display ("TEST CASE 20 IS PASSED") ;
    
    
    $display ("TEST CASE 21") ;  // test shift left Function
    #3
    ALU_FUN_tb = 4'b1110;
    A_tb = 16'hFF51;
    B_tb = 16'h0000;
    #7
    if ((ALU_OUT_tb != 16'hFEA2) && (Shift_Flag_tb == 1'b1))
      $display ("TEST CASE 21 IS FAILED") ;
    else
      $display ("TEST CASE 21 IS PASSED") ;
      
    
    $display ("TEST CASE 22") ;  // test undefined input
    #3
    ALU_FUN_tb = 4'b1111;
    A_tb = 16'hFF51;
    B_tb = 16'hFFFF;
    #7
    if ((ALU_OUT_tb != 16'h0000) && (Shift_Flag_tb == 1'b1) && (CMP_Flag_tb == 1'b1) && (Logic_Flag_tb == 1'b1) && (Arith_Flag_tb == 1'b1))
      $display ("TEST CASE 22 IS FAILED") ;
    else
      $display ("TEST CASE 22 IS PASSED") ;
    
    
    #100
    $finish ;        
  end

// Clock Generator  
  always #5 CLK_tb = !CLK_tb ;

// instaniate design instance 
  ALU16BIT DUT (
    .A(A_tb),
    .B(B_tb), 
    .ALU_FUN(ALU_FUN_tb),
    .CLK(CLK_tb),
    .ALU_OUT(ALU_OUT_tb),
    .Arith_Flag(Arith_Flag_tb),
    .Logic_Flag(Logic_Flag_tb),
    .CMP_Flag(CMP_Flag_tb),
    .Shift_Flag(Shift_Flag_tb)
  );
  
endmodule  

  



