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
   	bit flag;
  
       
  always @(posedge clk) begin
      if (rst == 1'b1)
        flag = 1'b0;
      else 
        flag =1'b1;
  	end
/////// Assumptionss//////////////////////
  
  	// 1)  Assume write enable is not active when rst = 1
  	writeEnOff_rst_on: assume property(@(posedge clk)((!flag) |-> (!writeEn))); 
   	
    // 2) Assume write enable is not active when rst = 1
    readEnOff_rst_on: assume property(@(posedge clk)((!flag) |-> (!readEn))); 
 	
   	// 3) Assume read enable is not active when empty is active
    readEnoff_empty: assume property(@(posedge clk)((empty) |-> (!readEn))); 
   	
    // 4) Assume write enable is not active when full is active
  	writEnoff_full: assume property(@(posedge clk)((full) |-> (!writeEn))); 

/////// Assertions //////////////////////
   
	// 1) The property assures that if FIFO is full then write enable signal must not be active.
    full_notWriteEn : assert property (@(posedge clk) disable iff (rst) (full |-> (!writeEn))) $info("The write enable signal is active when the FIFO is not full");
    else $error(" Asserion fail writeEn_ON_notFULL");

  	// 2) The property assures that if FIFO is empty then read enable signal must not be active.
    empty_notReadEn : assert property (@(posedge clk) disable iff (rst) (empty |-> (!readEn))) $info("The read enable signal is active when the FIFO is not empty");
        else $error(" Asserion fail readEn_ON_notEmpty");

  	// 3) The property assures that write pointer increments when a write operation happen
    wrPtr_increm_writeEn_on : assert property (@(posedge clk) disable iff (rst) (writeEn && (!full) |=> wrPtr == ($past(wrPtr) + 1'b1))) $info("The write pointer increment when a write operation happen.");
        else $error(" Asserion fail wrPtr_increm_writeEn_ON");
      
 	// 4) The property assures that read pointer increments when a read operation happen.
    rdPtr_increm_readEn_on : assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) |=> rdPtr == ($past(rdPtr) + 1'b1))) $info("The read pointer increment when a read operation happen.");
        else $error(" Asserion fail rdPtr_increm_readEn_ON"); 

      // 5) The property assures that wrPtrNext increments when a write operation happen
    wrPtrNext_increm_writeEn_on : assert property (@(posedge clk) disable iff (rst) (writeEn && (!full) |-> wrPtrNext == (wrPtr + 1'b1))) $info("The write pointer increment when a write operation happen.");
        else $error(" Asserion fail wrPtr_increm_writeEn_ON_NEXT");
      
   	// 6) The property assures that rdPtrNext  increments when a read operation happen.
    rdPtrNext_increm_rdEn_on : assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) |-> rdPtrNext == (rdPtr + 1'b1))) $info("The read pointer increment when a read operation happen.");
        else $error(" Asserion fail rdPtr_increm_readEn_ON_NEXT"); 
   
  	// 7) The property assures that wrPtr is stable if a write doesn't occur.
    wr_en_off_wr_ptr_stable : assert property (@(posedge clk) disable iff(rst) ((!writeEn) |=> $stable(wrPtr))) $info("The write pointer is stable.");
        else $error(" Asserion fail wrEn_OFF_wrPtr_stable"); 

 	// 8) The property assures that rdPtrNext is stable if a read doesn't occur.
    rd_en_off_rd_ptr_stable : assert property (@(posedge clk) disable iff(rst) ((!readEn) |=> $stable(rdPtr))) $info("The read pointer is stable.");
        else $error(" Asserion fail rdEn_OFF_rdPtr_stable");

   	// 9) After reset the read and write pointers must have the same value and be 0
      rst_rdPtr_wrPtr_zero:assert property (@(posedge clk) ($rose(flag) |-> (rdPtr == '0 && wrPtr == '0))) $info("After reset the read and write pointers have the same value and be 0");
      else $error(" Asserion fail"); 
       
 	/* 10) After reset is active read enable is off until a write operation happens.
   	rst_readEnOff_until_writeEn_on:assert property (@(posedge clk) ($fell(rst) |-> (!readEn throughout ((writeEn && !full)) ))) $info("After reset is active read enable is off until a write operation happen");
	else $error(" Asserion fail");    NOTA: VA PARA DOCUMENTACION*/
      
  	// 11) The full and empty flags can never be active at the same time 
    never_full_and_empty : assert property (@(posedge clk) disable iff(rst) ((1'b1) |-> (!(full && empty)))) $info("Full and Empty are not active at the same time");
        else $error(" Asserion fail Full and Empty are active at the same time");

  	// 12) When wrPtrNext reaches max value wraps around to 0
    wrPtrNext_maxvalue_reset0 : assert property (@(posedge clk) disable iff (rst)  (writeEn && (!full) && ($past(wrPtrNext[PtrWidth-1:0] == (Depth - 1'b1)))) |-> wrPtrNext[PtrWidth-1:0] == '0) $info("The write pointer next return to zero");
        else $error(" Asserion fail wrPtrNext_maxvalue_reset0");
      
  	// 13) When rdPtrNext reaches max value wraps around to 0
    rdPtrNext_maxvalue_reset0 : assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) && ($past(rdPtrNext[PtrWidth-1:0] == (Depth - 1'b1)))) |-> rdPtrNext[PtrWidth-1:0] == '0) $info("The read pointer next return to zero");
        else $error(" Asserion fail rdPtrNext_maxvalue_reset0"); 
    
	// 14) When wrPtr reaches max value wraps around to 0    
    wrPtr_maxvalue_reset0: assert property (@(posedge clk) disable iff (rst) (writeEn && (!full) && (wrPtr[PtrWidth-1:0] == (Depth - 1'b1))) |=> wrPtr[PtrWidth-1:0] == '0) $info("The write pointer return to zero");
        else $error(" Asserion fail wrPtr_maxvalue_reset0");
      
   	// 15) When rdPtr reaches max value wraps around to 0    
    rdPtr_maxvalue_reset0: assert property (@(posedge clk) disable iff (rst) (readEn && (!empty) && (rdPtr[PtrWidth-1:0] == (Depth - 1'b1))) |=> rdPtr[PtrWidth-1:0] == '0) $info("The read pointer return to zero");
        else $error(" Asserion fail rdPtr_maxvalue_reset0"); 

   	// 16) Empty signal active after reset
      empty_on_whenreset: assert property (@(posedge clk) ($rose(flag)) |-> empty == 1'b1) $info("Empty signal active when reset");
        else $error(" Asserion fail empty_ON_whenreset"); 

   	// 17) Full signal off after reset
    full_off_whenreset: assert property (@(posedge clk) ($rose(flag)) |-> full == 1'b0) $info("Full signal off when reset");
        else $error(" Asserion fail empty_ON_whenreset"); 
      
  	// 18)This property verifies writeData was writen correctly when the writeEn is activated
      write_correctly: assert property (@(posedge clk) disable iff (rst)(writeEn && !full)|->((mem[wrPtr[PtrWidth-1:0]]) == writeData)) $info("writeData was writen correctly when the writeEn is activated"); else $error(" Asserion fail"); 
        
   	// 19) This property verifies readData was read correctly when readEn is activated
      read_correctly: assert property (@(posedge clk) disable iff (rst)(readEn && !full)|->((mem[rdPtr[PtrWidth-1:0]]) == readData)) $info("readData was read correctly when the readEn is activated"); else $error(" Asserion fail"); 
        
  	// 20) The property assures that FIFO memory value is stable if writeEn is not active
   	fifo_stable_when_writeEnoff: assert property (@(posedge clk) disable iff (rst)(!writeEn)|->($stable(mem[wrPtr[PtrWidth-1:0]]))) $info("FIFO memory value is stable when writeEn is not active"); else $error(" Asserion fail"); 
          
/////// Cover properties//////////////////////
        
 	// 1) Cover that the FIFO becomes full
    fifo_full:cover property (@(posedge clk)(full));  
      
   	// 2) Cover that the FIFO becomes empty
   	fifo_empty:cover property (@(posedge clk)(empty));
  
   	// 3) Cover that the write enable signal is asserted when the FIFO is not full
	fifo_notFull:cover property (@(posedge clk)(writeEn && !full));
  
  	// 4) Cover that the read enable signal is asserted when the FIFO is not empty
	fifo_notEmpty:cover property (@(posedge clk) (readEn && !empty));
     
   	// 5) All the memory was read
    write_all_address: cover property (@(posedge clk) (writeEn) |-> (rdPtr == tb_wr_ptr_ndc));
    
   	// 6) All the memory was read
    read_all_address : cover property (@(posedge clk) (readEn) |-> (rdPtr == tb_rd_ptr_ndc));
      
   	// 7) Cover what could happen if the write enable signal is asserted when the FIFO is full
	writeEn_fifo_full:cover property (@(posedge clk)(writeEn && full));
  
  	// 8) Cover what could happen if the read enable signal is asserted when the FIFO is empty
	readEn_fifo_empty:cover property (@(posedge clk) (readEn && empty));
   
   	// 9) Read and write at the same time.
      write_and_read:cover property (@(posedge clk) (writeEn && readEn));

   	// 10) Read and write at the same time while the memory is full.
    write_and_read_mem_full : cover property (@(posedge clk) (full) |-> (readEn && writeEn));
  
  	// 11) Read and write at the same time while the memory is empty.
    write_and_read_mem_empty : cover property (@(posedge clk) (empty) |-> (readEn && writeEn));
      
    	// 12) Cover a sequence when FIFO becomes full and then no full
      fifo_full_no_full:cover property (@(posedge clk)(full == 1'b1)##[0:$](full == 1'b0));  
  
 	// 13) Cover a sequence when FIFO becomes empty and then no empty
        fifo_empty_no_empty:cover property (@(posedge clk)(empty == 1'b1)##[0:$](empty == 1'b0)##[0:$] (empty == 1'b1));
endmodule


bind fifo fv_fifo fv_fifo_inst(.*);
