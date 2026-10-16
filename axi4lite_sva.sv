module axi4lite_sva (
  input logic ACLK,
  input logic ARESETn,
  input logic [31:0] ARADDR,
  input logic [2:0] ARPROT,
  input logic ARREADY,
  input logic ARVALID,
  input logic [31:0] AWADDR,
  input logic [2:0] AWPROT,
  input logic AWREADY,
  input logic AWVALID,
  input logic BREADY,
  input logic [1:0] BRESP,
  input logic BVALID,
  input logic [31:0] RDATA,
  input logic RREADY,
  input logic [1:0] RRESP,
  input logic RVALID,
  input logic [31:0] WDATA,
  input logic WREADY,
  input logic [3:0] WSTRB,
  input logic WVALID
);

  // ========= Generated properties =========
`include "axi4lite_props.sv"

endmodule
