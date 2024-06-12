module fifo #(
  	parameter  DataWidth = 32,
  	parameter  Depth     = 8,
  	parameter PtrWidth  = $clog2(Depth)
) (
  	input  logic                 clk,
  	input  logic                 rst,
  	input  logic                 writeEn,
  	input  logic [DataWidth-1:0] writeData,
  	input  logic                 readEn,
  	output logic [DataWidth-1:0] readData,
  	output logic                 full,
  	output logic                 empty
);

  	logic [DataWidth-1:0] mem[Depth];
  	logic [PtrWidth:0] wrPtr, wrPtrNext;
  	logic [PtrWidth:0] rdPtr, rdPtrNext;

  	always_comb begin
    		wrPtrNext = wrPtr;
    		rdPtrNext = rdPtr;
		if (writeEn && (!full)) begin
      			wrPtrNext = wrPtr + 1;
    		end
		if (readEn && (!empty)) begin
      			rdPtrNext = rdPtr + 1;
    		end
  	end

	always_ff @(posedge clk or posedge rst) begin
    		if (rst) begin
      			wrPtr <= '0;
      			rdPtr <= '0;
    		end else begin
      			wrPtr <= wrPtrNext;
      			rdPtr <= rdPtrNext;
    		end
  	end
  
  	always_ff @(posedge clk or posedge rst) begin
 		if(rst) begin
			mem[wrPtr[PtrWidth-1:0]] <= mem[wrPtr[PtrWidth-1:0]];
		end else begin  
    			if (writeEn && !full) mem[wrPtr[PtrWidth-1:0]] <= writeData;
		end
	end

	always_comb begin
        	if(readEn && (!empty)) readData = (mem[rdPtr[PtrWidth-1:0]]);
            	else readData =(readData);
  	end

  	assign empty = (wrPtr[PtrWidth] == rdPtr[PtrWidth]) && (wrPtr[PtrWidth-1:0] == rdPtr[PtrWidth-1:0]);
  	assign full  = (wrPtr[PtrWidth] != rdPtr[PtrWidth]) && (wrPtr[PtrWidth-1:0] == rdPtr[PtrWidth-1:0]);

 
endmodule

