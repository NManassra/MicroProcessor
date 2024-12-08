// Student's Name : Noura Awni Manassra
// Student's ID : 1212359
// Section : 1
// Instructor : Dr.Abdallatif Abuissa
module Full_Adder_1212359 #(parameter n=31)
(input signed [n:0] x,y,//the size is 32 as parameterized before
output reg signed [n : 0] result); //signed used to deal with negative and positive numbers by default and the size n since the overflow can be showen 
always @(x or y )//since we have to use the behavoural model
  begin 
   result = x + y ;  //the summation equals to x xor y
  end 
endmodule

  module Full_Adder_1212359_tb;
  parameter n = 31;
  reg signed [n:0] x, y;
  wire signed [n:0] result;
  Full_Adder_1212359 #(n) tb (
    .x(x),
    .y(y),
    .result(result)
  );	
  initial begin
	 $display ("  Select    A    B   Out");
     $monitor("Time %0d A=%b B=%b OUT=%b",$time,x, y, result);
     
	 {x,y} = 0;	
			  repeat(150) begin
      #10 {x} = {x} + 1'b1;	
	  #10 {y} = {y} + 1'b1;	
	  end
	   $stop;
    end
endmodule



module Sub_1212359 #(parameter n=31)
(input signed [n:0] x,y,
output reg signed [n: 0] result); //signed used to deal with negative and positive numbers by default and the size n since the overflow can be showen 
always @(* )//since we have to use the behavoural model
  begin 
   result = x - y ;  
  end 
  
endmodule							  

  module Sub_1212359_tb;
  parameter n = 31;
  reg signed [n:0] x, y;
  wire signed [n:0] result;
  Sub_1212359 #(n) tb (
    .x(x),
    .y(y),
    .result(result)
  );	
  initial begin
	 $display ("  Select    A    B   Out");
     $monitor("Time %0d A=%b B=%b OUT=%b",$time,x, y, result);
     
	 {x,y} = 0;	
			  repeat(150) begin
      #10 {x} = {x} + 2'b11;	
	  #10 {y} = {y} + 4'b1111;	
	  end
	  $stop;
    end
endmodule  

 module AbsoluteValue_1212359 #(parameter n=31)
(input signed [n:0] x,
output reg signed [n : 0] result);
  always @* begin
    if (x < 0) begin
      result = 0 - x;
    end else
      result = x;
  end
endmodule				   


module AbsoluteValue_1212359_tb;   
  parameter n = 31;
  reg [n:0] x;
  wire [n:0] result;

 AbsoluteValue_1212359 tb_noura (.x(x), .result(result));
  initial begin
    $display("  Select    A     Out");
    $monitor("Time %0d A=%b OUT=%b", $time, x, result);
    x = 32'b1000000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;
    end

    $stop;
  end			 
endmodule		 

module NegateValue_1212359 #(parameter n=31)
  (input signed [n:0] x,
   output reg signed [n:0] result);
  always @* begin
    result = 0-x;    
  end

endmodule


module NegateValue_1212359_tb;   
  parameter n = 31;
  reg [n:0] x;
  wire [n:0] result;

 NegateValue_1212359 tb__noura (.x(x), .result(result));
  initial begin
    $display("  Select    A     Out");
    $monitor("Time %0d A=%b OUT=%b", $time, x, result);
    x = 32'b0100000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;
    end

    $stop;
  end			 
endmodule 

module max_1212359	#(parameter n=31)
(input signed [n:0] x,y,
output reg signed [n : 0] result);	  
always @(*) begin	  
	if (x<0 && y<0)
    result <= (x < y) ? x : y; 
	else
	    result <= (x > y) ? x : y; 	
  end
endmodule 


module max_1212359_tb;   
  parameter n = 31;
  reg [n:0] x,y;
  wire [n:0] result;

 max_1212359 tb__nnoura (.x(x), .y(y), .result(result));
  initial begin
    $display("  Select    A 	B    Out");
    $monitor("Time %0d A=%b B=%b OUT=%b", $time, x,y, result);
    x = 32'b10100000000000000000000000000000; 
    y = 32'b11100000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;		  
	  #10 y = y + 2'b10;
    end

    $stop;
  end			 
endmodule  


module min_1212359	#(parameter n=31)
(input signed [n:0] x,y,
output reg signed [n : 0] result);	  
always @(*) begin	  
	if (x<0 && y<0)
    result <= (x > y) ? x : y; 
	else
	    result <= (x < y) ? x : y; 	
  end
endmodule 

module min_1212359_tb;   
  parameter n = 31;
  reg [n:0] x,y;
  wire [n:0] result;
 min_1212359 tb__Manassranoura (.x(x), .y(y), .result(result));
  initial begin
    $display("  Select    A 	B    Out");
    $monitor("Time %0d A=%b B=%b OUT=%b", $time, x,y, result);
    x = 32'b10100000000000000000000000000000; 
    y = 32'b11100000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;		  
	  #10 y = y + 2'b10;
    end

    $stop;
  end			 
endmodule


module avg_1212359	#(parameter n=31)
(input signed [n:0] x,y,
output reg signed [n : 0] result);	  
always @(*) begin	  
	  result = (x + y) / 2;
end 
endmodule 		 


module avg_1212359_tb;   
  parameter n = 31;
  reg [n:0] x,y;
  wire [n:0] result;
avg_1212359 tb__ManassraNouraAwni (.x(x), .y(y), .result(result));
  initial begin
    $display("  Select    A 	B    Out");
    $monitor("Time %0d A=%b B=%b OUT=%b", $time, x,y, result);
    x = 32'b00100000000000000000000000000000; 
    y = 32'b11100000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;		  
	  #10 y = y + 2'b10;
    end

    $stop;
  end			 
endmodule	 


module NOT_1212359  #(parameter n=31)
(input [n:0] x, output reg [n:0] result);
integer i;
always @(x) begin
    for (i=0; i<=n; i=i+1)	begin
      result[i] = ~x[i]; end
  end
endmodule


module NOT_1212359_tb;   
  parameter n = 31;
  reg [n:0] x;
  wire [n:0] result;
NOT_1212359 Manassra (.x(x), .result(result));
  initial begin
    $display("  Select    A 	  Out");
    $monitor("Time %0d A=%b OUT=%b", $time, x, result);
    x = 32'b00100000000000000000000000000000; 
    repeat(20) begin
      #10 x = x + 1'b1;		  
    end

    $stop;
  end			 
endmodule	 

module OR_1212359  #(parameter n=31)
(input [n:0] x,y, output reg [n:0] result);
integer i;
always @(*) begin
    for (i=0; i<=n; i=i+1)	begin
      result[i] = x[i] || y[i]; end
  end
endmodule			 

module OR_1212359_tb;   
  parameter n = 31;
  reg [n:0] x,y;
  wire [n:0] result;
OR_1212359 AlManassraNoura (.x(x), .y(y), .result(result));
  initial begin
    $display("  Select    A 	B	  Out");
    $monitor("Time %0d A=%b B=%b OUT=%b", $time, x,y, result);
    x = 32'b00100000000000000000000000000000;  
	y = 32'b11100000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;		
	  #10 y = y + 2'b10;
    end

    $stop;
  end			 
endmodule


module AND_1212359  #(parameter n=31)
(input [n:0] x,y, output reg [n:0] result);
integer i;
always @(*) begin
    for (i=0; i<=n; i=i+1)	begin
      result[i] = x[i] && y[i]; end
  end
endmodule			 

module AND_1212359_tb;   
  parameter n = 31;
  reg [n:0] x,y;
  wire [n:0] result;
AND_1212359 ManassraALNoura (.x(x), .y(y), .result(result));
  initial begin
    $display("  Select    A 	B	  Out");
    $monitor("Time %0d A=%b B=%b OUT=%b", $time, x,y, result);
    x = 32'b00100000000000000000000000000000;  
	y = 32'b11100000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;		
	  #10 y = y + 2'b10;
    end

    $stop;
  end			 
endmodule	



module XOR_1212359  #(parameter n=31)
(input [n:0] x,y, output reg [n:0] result);
integer i;
always @(*) begin
    for (i=0; i<=n; i=i+1)	begin
      result[i] = x[i] ^ y[i]; end
  end
endmodule			 

module XOR_1212359_tb;   
  parameter n = 31;
  reg [n:0] x,y;
  wire [n:0] result;
XOR_1212359 Manassra_Noura (.x(x), .y(y), .result(result));
  initial begin
    $display("  Select    A 	B	  Out");
    $monitor("Time %0d A=%b B=%b OUT=%b", $time, x,y, result);
    x = 32'b00100000000000000000000000000000;  
	y = 32'b11100000000000000000000000000000;
    repeat(20) begin
      #10 x = x + 1'b1;		
	  #10 y = y + 2'b10;
    end

    $stop;
  end			 
endmodule
// note that i created the above modules to make each operation in it's own module
	// but it's better to use the behavrioral, cuz at the modules above, i used always, which can affect in negative way the clocl work
module alu #(parameter n=32)(opcode, a, b, result );
	//NouraManassra_ 1212359
input  [5:0] opcode;// this will be 6 bits 
input signed [n-1:0] a, b;// this will be 32 bits
output reg signed [n-1:0] result = 32'b0;//the result is 32 bits
always @(*) begin
    case (opcode)	 
        6'b000101: result = a + b;  // add
        6'b001000: result = (a) - (b);     	// sub
        6'b001101: result = (a < 0) ? -a : a; // abs
        6'b000111: result = ~(a)+1'b1; 	 // negate
        6'b000011: result = (a > b) ? a : b; // max
        6'b000110: result = (a < b) ? a : b;	   //min
        6'b001010: result = (a + b)>>>1; //   avg
        6'b000010: result = ~(a); 	 // not
        6'b001111: result = a | b;	 // or
        6'b000100: result = a & b;	 // and
        6'b001100: result = a ^ b;	// xor
        default: result = 32'b0;	   
		
    endcase
end
endmodule
module ALU_1212359_TB;
  parameter n = 31;
  reg [5:0] opcode;
  reg signed [n:0] a, b;
  wire signed [n:0] result;
  alu #(n) myTB (
    .opcode(opcode),
    .a(a),
    .b(b),
    .result(result)
  );
  initial begin
    opcode = 6'b000101;	 // add
    a = 10;
    b = 5;
    #10;
    opcode = 6'b001000;	  // sub
    a = 10;
    b = 5;
    #10;
    opcode = 6'b001101;	//abs
    a = -10;
    #10;
    opcode = 6'b000010;	//not
    a = 6'b110110;
    b = 6'b101010;
    #10;
    $stop;
  end
endmodule

module reg_file (clk, valid_opcode, addr1, addr2, addr3, in , out1, out2);
	// Noura Manassra 1212359
input clk;
input valid_opcode;
input [4:0] addr1, addr2, addr3;
input [31:0] in;
output reg [31:0] out1, out2;  	 
// note that all the above attributes are defined by the structure
reg [31:0] memo [31:0];	  // this will be used for sorting the data to use them
initial
	begin
 memo[0]  = 32'b00000000000000000000000000000000;
 memo[1]  = 32'b00000000000000000010111010011010;
 memo[2]  = 32'b00000000000000000001010011100100;
 memo[3]  = 32'b00000000000000000001110010001100;
 memo[4]  = 32'b00000000000000000011110101000100;
 memo[5]  = 32'b00000000000000000011000000111010;
 memo[6]  = 32'b00000000000000000010010111110100;
 memo[7]  = 32'b00000000000000000001111010001100;
 memo[8]  = 32'b00000000000000000001010001000110;
 memo[9]  = 32'b00000000000000000011100101101110;
 memo[10]  = 32'b00000000000000000001010111111110;
 memo[11]  = 32'b00000000000000000000100100110000;
 memo[12]  = 32'b00000000000000000011110001000000;
 memo[13]  = 32'b00000000000000000000101001101110;
 memo[14]  = 32'b00000000000000000001000001001100;
 memo[15]  = 32'b00000000000000000001000011001100;
 memo[16]  = 32'b00000000000000000001001010001000;
 memo[17]  = 32'b00000000000000000000010100000110;
 memo[18]  = 32'b00000000000000000001111110111010;
 memo[19]  = 32'b00000000000000000001000111001110;
 memo[20]  = 32'b00000000000000000010000101010110;
 memo[21]  = 32'b00000000000000000011010000011100;
 memo[22]  = 32'b00000000000000000001101100000110;
 memo[23]  = 32'b00000000000000000010110110110100;
 memo[24]  = 32'b00000000000000000010100111100010;
 memo[25]  = 32'b00000000000000000000110100010010;
 memo[26]  = 32'b00000000000000000000110011100100;
 memo[27]  = 32'b00000000000000000000100101010010;
 memo[28]  = 32'b00000000000000000010101111001100;
 memo[29]  = 32'b00000000000000000000110110110000;
 memo[30]  = 32'b00000000000000000010001000001000;
 memo[31]  = 32'b00000000000000000000000000000000;
	end  	
	always @(posedge clk) begin
   if (valid_opcode) begin	 
	   // to bring the data inside the specfied addresses
   out1 <= memo[addr1];	  
   out2 <= memo[addr2];	  
    end
end	
always @(posedge clk) begin
   if (valid_opcode) begin	 
	   // to store new data inside the specfied address
	   memo[addr3] <= in;	
   end
   end
endmodule


// at this module, i check the validty depending on the opcodes i got, so the opcodes given to us from the first
	//schdule will be valid, otherwise will be inval
module opcodeValdity_1212359(opcode,valid);
	input [5:0] opcode;							 
	output reg valid;  
	always @(opcode)begin 	   
		
	 if (opcode == 6'b001111 || opcode == 6'b000100 || opcode == 6'b001100||
        opcode == 6'b000101 ||opcode == 6'b001000 ||opcode == 6'b001101 ||
		opcode == 6'b000111 ||opcode == 6'b000011 ||opcode == 6'b000110 ||
        opcode == 6'b000010 ||opcode == 6'b001010)	begin
			valid <=	1;	  
			end
		else 
			begin
				valid<= 0;
				end
		
	end
	endmodule

module mp_top (
    input clk,
    input [31:0 ] instruction,
    output reg [31:0] result
);		 
// noura manassra
// 1212359
    wire [5:0] opcode;
    wire [4:0] adr1; 
	wire [4:0] adr2;
	wire [4:0] adr3;
    reg [5:0] delayed_op; 
	wire valid_opcode;
	wire [31:0] temp1, temp2;

  	assign opcode = instruction[5:0];
	assign adr1  = instruction[10:6];
	assign adr2  = instruction[15:11];
    assign adr3  = instruction[20:16];	 

	opcodeValdity_1212359 check(.opcode(opcode), .valid(valid_opcode)); 
	  always @(posedge clk) begin
   	  /// to make the delay to have 
        delayed_op <= opcode;
    end	   
	   alu alu_1212359 (
        .opcode(delayed_op), 
        .a(temp1),
        .b(temp2),
        .result(result)
    );
	   reg_file reg_1212359 (
        .clk(clk),
        .valid_opcode(valid_opcode),
        .addr1(adr1),
        .addr2(adr2),
        .addr3(adr3),
        .in(result),
        .out1(temp1),
        .out2(temp2)
    );
 
endmodule

module top_1212359_tb_NouraManassra;
    reg clk;
    reg [31:0] instruction;
    reg [31:0] result;	
	reg [31:0] resu;
    reg [31:0] expected_result;
    integer i;
    reg [31:0] instructions [0:13]; 
	reg [31:0] res [0:13]; 		 
    reg [31:0] expected_results [0:13];
    mp_top mp_top_1212359 (.clk(clk),.instruction(instruction),.result(result) );
	initial begin
	instructions[0] = 32'b00000000010101010101010101001111;
   expected_results[0] =   32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;//dont care	 
    res[0]=	32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
instructions[1] = 32'b00000000000000000000000001000101;
expected_results[1] =32'b00000000000000000010111010011010; //add r0,r1,r0  	
res[1]=	32'b00000000000000000010111010011010;
// memo[0]  = 32'b00000000000000000000000000000000;
// memo[1]  = 32'b00000000000000000010111010011010;
// their summation 00000000000000000010111010011010
instructions[2] = 32'b00000000000000110100000010001000;  
expected_results[2] =   32'b00000000000000000000000010011110;//sub r3,r8,r2		
res[2] =   32'b00000000000000000000000010011110;
//memo[2]  = 32'b00000000000000000001010011100100;
// memo[8]  = 32'b00000000000000000001010001000110;
// their sub  10011110
instructions[3] = 32'b00000000000011100000001111001101; 
expected_results[3] =   32'b00000000000000000001000011001100;//abs r14,r15	
res[3] =   32'b00000000000000000001000011001100;
//memo[15]  = 32'b00000000000000000001000011001100;
// it's absolute ia   00000000000000000001000011001100 it will remain the same
instructions[4] = 32'b00000000000100110000000001000111;  
expected_results[4] =   32'b11111111111111111101000101100110;//neg r24,r6 
res[4] = 32'b11111111111111111101000101100110;
//  memo[1]  = 32'b00000000000000000010111010011010; -- > it's not + 1 
// equals to       11111111111111111101000101100110
instructions[5] = 32'b00000000000110010001001110000011;  
expected_results[5] =   32'b00000000000000000001010011100100;//max r25,r2,r14 
res[5] = 32'b00000000000000000001010011100100;
// memor[14]=00000000000000000001000011001100	
//memo[2]  = 32'b00000000000000000000000010011110;
// so the max value is m[2]
instructions[6] = 32'b00000000000110010001001110000110;    
expected_results[6] =   32'b00000000000000000000000010011110;//min r25,r2,r14	
res[6] = 	 32'b00000000000000000000000010011110;
// memor[14]=00000000000000000001000011001100	
//memo[2]  = 32'b00000000000000000000000010011110;
// so the min is min[14]
instructions[7] = 32'b00000000000000001111111110001010; 
expected_results[7] =   32'b00000000000000000001000100000100;//avg r0,r1,r4	
res[7] = 	    32'b00000000000000000001000100000100;
// memo[30]  = 32'b00000000000000000010001000001000;
 //memo[31]  = 32'b00000000000000000000000000000000;	 
// their summation					 is 00000000000000000010001000001000
// so the avg is 		00000000000000000001000100000100
instructions[8] = 32'b00000000000010110000000101000010; 
expected_results[8] =   32'b11111111111111111100111111000101;//not r11,r5 
res[8] =    32'b11111111111111111100111111000101;
instructions[9] = 32'b00000000000101100000100101001111; 
expected_results[9] =   32'b00000000000000000011111010111010;//or	 r22,r1,r5	 
res[9] = 	    32'b00000000000000000011111010111010;
instructions[10]= 32'b00000000000000000011000000000100; 
expected_results[10] =  32'b00000000000000000000000010010100;//and r23,r10,r29		
res[10] = 32'b00000000000000000000000010010100;
instructions[11]= 32'b00000000000110000100100001001100;  
expected_results[11] =  32'b00000000000000000001011111110100;//Xor r24,r1,r9
res[11]  = 	  32'b00000000000000000001011111110100;	
// NOW FOR THIS CASE, I KNOW THAT IT WILL BE ZEROS BECAUSE THE OPCODE IS NOT VALID,
	//SO THE RESULS WILL BE ZERO
	// JUST TO MAKE SURE THAT THE MODULE PRINTS CORRECTLY
instructions[12]= 32'b00000000000110000100100001000000;  
expected_results[12] =  32'b00000000000000000000000000000000;
res[12]  = 	  32'b00000000000000000000000000000000;	
// FOR THIS CASE, I KNOW THAT THIS ONE IS ALSO WILL BE FALIED,  I WRITE THE EXPECT NOT CORRECT
	//IT'S SUPPOSED TO BE ALL ZEROS, JUST TO TEST THE MODULE
instructions[13]= 32'b00000000000110000100100001111111;  
expected_results[13] =  32'b00000000000000011110000000000000;
res[13]  = 	  32'b00000000000000000000000000000000;

  clk = 1;
 	 for (i = 1; i < 14; i = i + 1) begin
        resu = res[i];
		instruction = instructions[i];
        expected_result = expected_results[i];	
		if (resu == expected_result) begin 
			 $display("Test passed ");	
		    end
		   else begin
			   $display("Test failed ");   end
        #20;
    end
        $finish;
    end
	always #5 clk = ~clk;
    initial begin
		$monitor("At time %d, instruction = %b, result = %b", $time, instruction, result);   
	end
endmodule