//SevenSegmentEncoder.v 
//
//
//
// by Rahul Marathe
// 29th September 2017
// 
//

 module sseg_encoder                               //Declare a Module for Seven Segment Encoder
#(parameter SEG_POLARITY=1)                        //Default Parameter SEG_POLARITY 
(input [3:0] bcd_in,           
output reg [6:0] sseg_out );                       //Module works on Two bcd digits and a Output Seven Digits corresponding to 9 Outputs
always@(bcd_in)                                    //Check for every change in bcd
begin
	if(SEG_POLARITY)                           //For SEG_POLARITY ==1
	begin
		case(bcd_in)
			0:sseg_out<=7'b0111111;     //SEVEN SEGMENT OUTPUT =0
			1:sseg_out<=7'b0000110;     //SEVEN SEGMENT OUTPUT =1
			2:sseg_out<=7'b1011011;     //SEVEN SEGMENT OUTPUT =2
			3:sseg_out<=7'b1001111;     //SEVEN SEGMENT OUTPUT =3
			4:sseg_out<=7'b1100110;     //SEVEN SEGMENT OUTPUT =4
			5:sseg_out<=7'b1101101;     //SEVEN SEGMENT OUTPUT =5
			6:sseg_out<=7'b1111100;     //SEVEN SEGMENT OUTPUT =6
			7:sseg_out<=7'b0000111;     //SEVEN SEGMENT OUTPUT =7
			8:sseg_out<=7'b1111111;     //SEVEN SEGMENT OUTPUT =8
			9:sseg_out<=7'b1100111;     //SEVEN SEGMENT OUTPUT =9
			default;                    //ILLEGAL OUTPUTS
		endcase
	end
else 
	begin
		case(bcd_in)
			0:sseg_out<=~7'b0111111;	//SEVEN SEGMENT OUTPUT =0
			1:sseg_out<=~7'b0000110; 	//SEVEN SEGMENT OUTPUT =1
			2:sseg_out<=~7'b1011011; 	//SEVEN SEGMENT OUTPUT =2
			3:sseg_out<=~7'b1001111; 	//SEVEN SEGMENT OUTPUT =3
			4:sseg_out<=~7'b1100110; 	//SEVEN SEGMENT OUTPUT =4
			5:sseg_out<=~7'b1101101; 	//SEVEN SEGMENT OUTPUT =5
			6:sseg_out<=~7'b1111100; 	//SEVEN SEGMENT OUTPUT =6	
			7:sseg_out<=~7'b0000111; 	//SEVEN SEGMENT OUTPUT =7
			8:sseg_out<=~7'b1111111; 	//SEVEN SEGMENT OUTPUT =8
			9:sseg_out<=~7'b1100111; 	//SEVEN SEGMENT OUTPUT =9
			default;                        //ILLEGAL OUTPUTS
		endcase
	end
end
endmodule
