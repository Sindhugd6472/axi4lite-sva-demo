module my_axi4lite_peripheral (
  input  logic ACLK,
  input  logic ARESETn,

  input  logic [31:0] AWADDR,
  input  logic [2:0]  AWPROT,
  input  logic        AWVALID,
  output logic        AWREADY,

  input  logic [31:0] WDATA,
  input  logic [3:0]  WSTRB,
  input  logic        WVALID,
  output logic        WREADY,

  output logic [1:0]  BRESP,
  output logic        BVALID,
  input  logic        BREADY,

  input  logic [31:0] ARADDR,
  input  logic [2:0]  ARPROT,
  input  logic        ARVALID,
  output logic        ARREADY,

  output logic [31:0] RDATA,
  output logic [1:0]  RRESP,
  output logic        RVALID,
  input  logic        RREADY
);

  always_comb begin
    AWREADY = 1'b1;
    WREADY  = 1'b1;
    ARREADY = 1'b1;
    BVALID  = 1'b0;
    BRESP   = 2'b00;
    RVALID  = 1'b0;
    RRESP   = 2'b00;
    RDATA   = '0;
  end

endmodule
