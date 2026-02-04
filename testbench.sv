module tb;
  logic ACLK = 0;
  logic ARESETn = 0;

  logic [31:0] AWADDR; logic [2:0] AWPROT; logic AWVALID; logic AWREADY;
  logic [31:0] WDATA;  logic [3:0] WSTRB;  logic WVALID;  logic WREADY;
  logic [1:0]  BRESP;  logic BVALID; logic BREADY;
  logic [31:0] ARADDR; logic [2:0] ARPROT; logic ARVALID; logic ARREADY;
  logic [31:0] RDATA;  logic [1:0] RRESP;  logic RVALID;  logic RREADY;

  my_axi4lite_peripheral dut (.*);

  always #5 ACLK = ~ACLK;

  initial begin
    AWADDR='0; AWPROT='0; AWVALID=0;
    WDATA='0; WSTRB='0; WVALID=0;
    BREADY=0;
    ARADDR='0; ARPROT='0; ARVALID=0;
    RREADY=0;

    #20 ARESETn = 1;
    #20 AWVALID = 1; AWADDR = 32'h10; AWPROT = 3'b000;
    #10 AWVALID = 0;
    #50 $finish;
  end
endmodule
