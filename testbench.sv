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

  string test_name;
  initial begin
    AWADDR='0; AWPROT='0; AWVALID=0;
    WDATA='0; WSTRB='0; WVALID=0;
    BREADY=0; ARADDR='0; ARPROT='0; ARVALID=0; RREADY=0;
    if (!$value$plusargs("TEST=%s", test_name)) test_name = "PASS_SMOKE";
    repeat (2) @(negedge ACLK);
    ARESETn = 1;
    @(negedge ACLK);
    case (test_name)
      "PASS_SMOKE": begin
        AWVALID=1; AWADDR='h10;
        @(negedge ACLK); AWVALID=0;
      end
      "FAIL_AW_PAYLOAD_CHANGE": begin
        force dut.AWREADY = 0; AWVALID=1;
        @(negedge ACLK); AWADDR='h80;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_AW_VALID_DROP_DURING_STALL": begin
        force dut.AWREADY = 0; AWVALID=1;
        @(negedge ACLK); AWVALID=0;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_W_PAYLOAD_CHANGE": begin
        force dut.WREADY = 0; WVALID=1;
        @(negedge ACLK); WDATA='h80;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_W_VALID_DROP_DURING_STALL": begin
        force dut.WREADY = 0; WVALID=1;
        @(negedge ACLK); WVALID=0;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_B_PAYLOAD_CHANGE": begin
        BREADY=0; force dut.BVALID = 1;
        @(negedge ACLK); force dut.BRESP = 2'b10;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_B_VALID_DROP_DURING_STALL": begin
        BREADY=0; force dut.BVALID = 1;
        @(negedge ACLK); force dut.BVALID = 0;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_AR_PAYLOAD_CHANGE": begin
        force dut.ARREADY = 0; ARVALID=1;
        @(negedge ACLK); ARADDR='h80;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_AR_VALID_DROP_DURING_STALL": begin
        force dut.ARREADY = 0; ARVALID=1;
        @(negedge ACLK); ARVALID=0;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_R_PAYLOAD_CHANGE": begin
        RREADY=0; force dut.RVALID = 1;
        @(negedge ACLK); force dut.RDATA = 'h80;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_R_VALID_DROP_DURING_STALL": begin
        RREADY=0; force dut.RVALID = 1;
        @(negedge ACLK); force dut.RVALID = 0;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_AW_PAYLOAD_CHANGE_AT_HANDSHAKE": begin
        force dut.AWREADY = 0; AWVALID=1;
        @(negedge ACLK); force dut.AWREADY = 1; AWADDR='h80;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_W_PAYLOAD_CHANGE_AT_HANDSHAKE": begin
        force dut.WREADY = 0; WVALID=1;
        @(negedge ACLK); force dut.WREADY = 1; WDATA='h80;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_B_PAYLOAD_CHANGE_AT_HANDSHAKE": begin
        BREADY=0; force dut.BVALID = 1;
        @(negedge ACLK); BREADY=1; force dut.BRESP = 2'b10;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_AR_PAYLOAD_CHANGE_AT_HANDSHAKE": begin
        force dut.ARREADY = 0; ARVALID=1;
        @(negedge ACLK); force dut.ARREADY = 1; ARADDR='h80;
        repeat (2) @(negedge ACLK);
      end
      "FAIL_R_PAYLOAD_CHANGE_AT_HANDSHAKE": begin
        RREADY=0; force dut.RVALID = 1;
        @(negedge ACLK); RREADY=1; force dut.RDATA = 'h80;
        repeat (2) @(negedge ACLK);
      end
      default: $fatal(1, "Unknown TEST=%s", test_name);
    endcase
    repeat (2) @(negedge ACLK);
    $display("Completed %s (FAIL_* tests must report an assertion failure)", test_name);
    $finish;
  end
endmodule
