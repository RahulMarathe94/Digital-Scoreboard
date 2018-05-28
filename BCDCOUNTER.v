//BCDCOUNTER.v
//
// 
// Rahul Marathe
// 28th Sept 2017
//
//

module bcd_counter_2digit
(
input clk,
input reset,
input increment,
input decrement,
input clear,
output reg [3:0]bcd1,
 output reg [3:0]bcd0
);
//
always @(posedge clk or posedge reset or clear )
begin            	      //Procedural Begin
			     // If Clear or reset is high
	if(reset || clear)
	begin
	bcd0<=0;
	bcd1<=0;
	end
   //INCREMENT LOGIC
		else if(increment)
		begin
		if(bcd0<9)          	      //CHECK IF LOWER DIGIT IS LESS THAN 9
			begin                 //IF LOWER BIT IS LESS THAN 9,INCREMENT IT
			bcd0<=bcd0+1;		
			bcd1<=bcd1;
			end                     
		else if(bcd1<9)			//ELSE CHECK UPPER DIGIT 
			begin                    
			bcd0<=0;	
			bcd1<=bcd1+1;           //INCREMENT UPPER DIGIT KEEPING LOWER ONE CONSTANT
			end                     
		else 
			begin                    
			bcd0<=bcd0;            //FOR BIT ROLL OVER
			bcd1<=bcd1;
			end                        
			end                        //INCREMENT BLOCK END
//DECREMENT LOGIC
		else if(decrement)
			begin
			if(bcd0>0)  		//CHECK IF LOWER BIT IS GREATER THAN 9
			begin                
			bcd0<=bcd0-1;		//DECREMENT LOWER BIT
			bcd1<=bcd1;
			end                   
		else				
			begin                     
			if(bcd1>0)		//CHECK IF UPPER BIT IS LOWER THAN 9 
			begin                   
			bcd0<=9;		//DECREMENT UPPER BIT LEAVING LOWER CONSTANT
			bcd1<=bcd1-1;
			end                  
		else
			begin                   //FOR BIT ROLL OVER
			bcd0<=bcd0;
			bcd1<=bcd1;
			end                   
			end                       //DECREMENT BLOCK END

//IF INCREMENT AND DECREMENT IS PRESSED AT THE SAME TIME
		else if(increment && decrement) 
			begin
			bcd0<=bcd0;
			bcd1<=bcd1;
			end
end 				               //PROCEDURAL END
endmodule
