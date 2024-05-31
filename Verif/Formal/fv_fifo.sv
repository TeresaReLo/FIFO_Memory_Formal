module fv_fifo#(
  	parameter  DataWidth = 32,
  	parameter  Depth     = 8,
  	parameter PtrWidth  = $clog2(Depth)
)(
	input  logic                 clk,
  	input  logic                 rst,
  	input  logic                 writeEn,
  	input  logic [DataWidth-1:0] writeData,
  	input  logic                 readEn,
  	input logic [DataWidth-1:0] readData,
  	input logic                 full,
  	input logic                 empty,
  
  
  	logic [DataWidth-1:0] mem[Depth],
  	logic [PtrWidth:0] wrPtr, wrPtrNext,
  	logic [PtrWidth:0] rdPtr, rdPtrNext

);  
  

    	bit [PtrWidth-1:0] tb_wr_ptr_ndc; //No Deterministic Constant    
    	bit [PtrWidth-1:0] tb_rd_ptr_ndc; //No Deterministic Constant    
 
    	// Assumptions

    	// Assume write enable is not active when rst = 1
  	writeEnOff_rstOn: assume property(@(posedge clk)((rst) |-> (!writeEn))); 
     	// Assume write enable is not active when rst = 1
	readEnOff_rstOn: assume property(@(posedge clk)((rst) |-> (!readEn))); 


    	// Assertions
   
   	// writeEn_ON_notFULL.  
    	writeEn_ON_notFULL : assert property (@(posedge clk) disable iff (rst) (full |-> (!writeEn))) $info("The write enable signal is active when the FIFO is not full");
    	else $error(" Asserion fail writeEn_ON_notFULL");

    	// readEn_ON_notEmpty
    	readEn_ON_notEmpty : assert property (@(posedge clk) disable iff (rst) (empty |-> (!readEn))) $info("The read enable signal is active when the FIFO is not empty");
        else $error(" Asserion fail readEn_ON_notEmpty");

    	// wrPtr_increm_writeEn_ON_NEXT
    	wrPtr_increm_writeEn_ON_NEXT : assert property (@(posedge clk) disable iff (rst) (writeEn && (!full) |-> wrPtrNext == (wrPtr + 1'b1))) $info("The write pointer increment when a write operation happen.");
        else $error(" Asserion fail wrPtr_increm_writeEn_ON_NEXT");
      
    	// rdPtr_increm_readEn_ON_NEXT
    	rdPtr_increm_readEn_ON_NEXT : assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) |-> rdPtrNext == (rdPtr + 1'b1))) $info("The read pointer increment when a read operation happen.");
        else $error(" Asserion fail rdPtr_increm_readEn_ON_NEXT"); 
    
    	// wrPtr_increm_writeEn_ON
    	wrPtr_increm_writeEn_ON : assert property (@(posedge clk) disable iff (rst) (writeEn && (!full) |=> wrPtr == ($past(wrPtr) + 1'b1))) $info("The write pointer increment when a write operation happen.");
        else $error(" Asserion fail wrPtr_increm_writeEn_ON");
      
    	// rdPtr_increm_readEn_ON
    	rdPtr_increm_readEn_ON : assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) |=> rdPtr == ($past(rdPtr) + 1'b1))) $info("The read pointer increment when a read operation happen.");
        else $error(" Asserion fail rdPtr_increm_readEn_ON"); 

    	// The property assures that wrPtrNext is stable if a write doesn't occur.
    	wrEn_OFF_wrPtr_stable : assert property (@(posedge clk) disable iff(rst) ((!writeEn) |=> $stable(wrPtr))) $info("The write pointer is stable.");
        else $error(" Asserion fail wrEn_OFF_wrPtr_stable"); 

    	//The property assures that rdPtrNext is stable if a read doesn't occur.
    	rdEn_OFF_rdPtr_stable : assert property (@(posedge clk) disable iff(rst) ((!readEn) |=> $stable(rdPtr))) $info("The read pointer is stable.");
        else $error(" Asserion fail rdEn_OFF_rdPtr_stable");

	//rst_rdPtr_wrPtr_zero
     	rst_rdPtr_wrPtr_zero:assert property (@(posedge clk) (rst==1'b1 |-> (rdPtr == '0 && wrPtr == '0))) $info("After reset the read and write pointers have the same value and be 0");
      	else $error(" Asserion fail"); 
       
   	//rst_readEnOff_until_writeEnOn
   	rst_readEnOff_until_writeEnOn:assert property (@(posedge clk) ($fell(rst) |-> (!readEn throughout (rst or (writeEn && !full)) ))) $info("After reset is active read enable is off until a write operation happen");
	else $error(" Asserion fail");   
      
    	// The full and empty flags can never be active at the same time 
    	never_full_and_empty : assert property (@(posedge clk) disable iff(rst) ((1'b1) |-> (!(full && empty)))) $info("Full and Empty are not active at the same time");
        else $error(" Asserion fail Full and Empty are active at the same time");

    	//que el apuntador de escritura next al estar al maximo vuelva a 0
    	wrPtrNext_maxvalue_reset0 : assert property (@(posedge clk) disable iff (rst)  (writeEn && (!full) && ($past(wrPtrNext == (Depth - 1'b1)))) |-> wrPtrNext == '0) $info("The write pointer next return to zero");
        else $error(" Asserion fail wrPtrNext_maxvalue_reset0");
      
    	// que el apuntador de lectura next al estar al maximo vuelva a 0
    	rdPtrNext_maxvalue_reset0 : assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) && ($past(rdPtrNext == (Depth - 1'b1)))) |-> rdPtrNext == '0) $info("The read pointer next return to zero");
        else $error(" Asserion fail rdPtrNext_maxvalue_reset0"); 
    
    	// Que el apuntador de escritura al estar al maximo vuelva a 0    
    	wrPtr_maxvalue_reset0: assert property (@(posedge clk) disable iff (rst) (writeEn && (!full) && (wrPtr == (Depth - 1'b1))) |=> wrPtr == '0) $info("The write pointer return to zero");
        else $error(" Asserion fail wrPtr_maxvalue_reset0");
      
    	// Que el apuntador de lectura al estar al maximo vuelva a 0    
    	rdPtr_maxvalue_reset0: assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) && (rdPtr == (Depth - 1'b1))) |=> rdPtr == '0) $info("The read pointer return to zero");
        else $error(" Asserion fail rdPtr_maxvalue_reset0"); 


    	// Empty signal active after reset
    	empty_ON_whenreset: assert property (@(posedge clk) (rst) |-> empty == 1'b1) $info("Empty signal active when reset");
        else $error(" Asserion fail empty_ON_whenreset"); 

    	// Full signal off after reset
    	full_OFF_whenreset: assert property (@(posedge clk) (rst) |-> full == 1'b0) $info("Full signal off when reset");
        else $error(" Asserion fail empty_ON_whenreset"); 
      
    	// writeData was writen correctly when the writeEn is activated
      	write_correctly: assert property (@(posedge clk) disable iff (rst)(writeEn && !full)|->((mem[wrPtr[PtrWidth-1:0]]) == writeData)) $info("writeData was writen correctly when the writeEn is activated"); else $error(" Asserion fail"); 
        
	// readData was read correctly when the readEn is activated
      	read_correctly: assert property (@(posedge clk) disable iff (rst)(readEn && !full)|->((mem[rdPtr[PtrWidth-1:0]]) == readData)) $info("readData was read correctly when the readEn is activated"); else $error(" Asserion fail"); 
          
	// Cover properties
    	// All the memory was read
    	write_all_address: cover property (@(posedge clk) (writeEn) |-> (rdPtr == tb_wr_ptr_ndc));
    
    	// All the memory was read
    	read_all_address : cover property (@(posedge clk) (readEn) |-> (rdPtr == tb_rd_ptr_ndc));

   	// Read and write at the same time while the memory is full.
    	write_and_read_mem_full : cover property (@(posedge clk) (full) |-> (readEn && writeEn));
  
    	// Read and write at the same time while the memory is empty.
    	write_and_read_mem_empty : cover property (@(posedge clk) (empty) |-> (readEn && writeEn));

	// Cover that the FIFO becomes full
    	FIFO_full:cover property (@(posedge clk)(full));  

	// Cover that the FIFO becomes empty
   	FIFO_empty:cover property (@(posedge clk)(empty));
  
    	// Cover that the write enable signal is asserted when the FIFO is not full
	FIFO_notFull:cover property (@(posedge clk)(writeEn && !full));
  
    	// Cover that the read enable signal is asserted when the FIFO is not empty
	FIFO_notEmpty:cover property (@(posedge clk) (readEn && !empty));
 
  
endmodule


bind fifo fv_fifo fv_fifo_inst(.*);
