// Bind AXI4-Lite SVA to DUT
// Option A (bind all instances): bind my_axi4lite_peripheral axi4lite_sva axi4lite_sva_i (.*);
// Option B (bind one instance):  bind tb.dut axi4lite_sva axi4lite_sva_i (.*);

`ifndef AXI4LITE_BIND_INSTANCE
  bind my_axi4lite_peripheral axi4lite_sva axi4lite_sva_i (.*);
`else
  bind tb.dut axi4lite_sva axi4lite_sva_i (.*);
`endif
