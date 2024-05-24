module fifo_buff(datain,clk,en,rst,rd,wr,dataout,empty,full);
  input clk,en,rst,rd,wr;
  input[31:0]datain;
  output empty,full;
  output reg [31:0]dataout;
  reg [2:0]count=0;
  reg [31:0]fifo[7:0];
  reg [2:0] rdcnt=0,wrcnt=0;
  assign empty=(count==0)?1'b1:1'b0;
  assign full=(count==8)?1'b1:1'b0;
  always@(posedge clk)begin
    
    if(en==0);
    else
      begin
        if(rst)begin
          rdcnt=0;
          wrcnt=0;
        end
        else if (rd==1'b1 && count!=0)begin
          dataout=fifo[rdcnt];
          rdcnt=rdcnt+1;
        end
        else if(wr==1'b1 &&  count<8)begin
          fifo[wrcnt]=datain;
          wrcnt=wrcnt+1;
        end
        
        else;
      end
    
    if(wrcnt==8)
      wrcnt=0;
    else if(rdcnt==8)
      rdcnt=0;
    else;
    
    if(rdcnt > wrcnt)
      count=rdcnt-wrcnt;
    else if(wrcnt > rdcnt)
      count=wrcnt-rdcnt;
    
    else;
    
  end
endmodule