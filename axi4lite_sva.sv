module axi4lite_sva (
  input logic ACLK,
  input logic ARESETn,
  input logic ARADDR,
  input logic ARPROT,
  input logic ARREADY,
  input logic ARVALID,
  input logic AWADDR,
  input logic AWPROT,
  input logic AWREADY,
  input logic AWVALID,
  input logic BREADY,
  input logic BRESP,
  input logic BVALID,
  input logic RDATA,
  input logic RREADY,
  input logic RRESP,
  input logic RVALID,
  input logic WDATA,
  input logic WREADY,
  input logic WSTRB,
  input logic WVALID
);

  // ========= Generated properties =========
`include "axi4lite_props.sv"

endmodule
