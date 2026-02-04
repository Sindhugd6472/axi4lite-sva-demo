# AXI4-Lite SVA Demo (EDA Playground)

This repo demonstrates SystemVerilog Assertions for AXI4-Lite ready/valid rules:
- Payload must remain stable while stalled (VALID=1, READY=0)
- VALID must stay asserted until handshake

## Files
- design.sv: `my_axi4lite_peripheral` DUT
- testbench.sv: task-based TB, selects tests via `+TEST=<name>`
- axi4lite_props.sv: SVA properties (payload-stable + sticky)
- axi4lite_sva.sv: SVA wrapper
- bind_axi4lite.sv: bind wrapper module (avoids compilation-unit bind warnings)

## Run in EDA Playground
1. Create a SystemVerilog playground.
2. Add all 5 files as separate tabs with the same filenames.
3. In **Run Options**, set `+TEST=PASS_SMOKE` (or any test below).
4. Run (Questa/ModelSim-compatible simulator option).

## Tests
PASS:
- PASS_SMOKE (no assertion errors)

Intentional FAIL (each should show an "Assertion error"):
- FAIL_AW_PAYLOAD_CHANGE
- FAIL_AWVALID_DROP_DURING_STALL
- FAIL_W_PAYLOAD_CHANGE
- FAIL_WVALID_DROP_DURING_STALL
- FAIL_B_PAYLOAD_CHANGE
- FAIL_BVALID_DROP_DURING_STALL
- FAIL_AR_PAYLOAD_CHANGE
- FAIL_ARVALID_DROP_DURING_STALL
- FAIL_R_PAYLOAD_CHANGE
- FAIL_RVALID_DROP_DURING_STALL
