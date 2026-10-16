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
- `PASS_SMOKE`: no assertion errors

FAIL (expected assertion failure; each test intentionally violates one rule):

| +TEST= | Should fail assertion |
|---|---|
| FAIL_AW_PAYLOAD_CHANGE | `a_AW_payload_stable_while_stalled` |
| FAIL_AW_VALID_DROP_DURING_STALL | `a_AW_valid_sticky_until_handshake` |
| FAIL_W_PAYLOAD_CHANGE | `a_W_payload_stable_while_stalled` |
| FAIL_W_VALID_DROP_DURING_STALL | `a_W_valid_sticky_until_handshake` |
| FAIL_B_PAYLOAD_CHANGE | `a_B_payload_stable_while_stalled` |
| FAIL_B_VALID_DROP_DURING_STALL | `a_B_valid_sticky_until_handshake` |
| FAIL_AR_PAYLOAD_CHANGE | `a_AR_payload_stable_while_stalled` |
| FAIL_AR_VALID_DROP_DURING_STALL | `a_AR_valid_sticky_until_handshake` |
| FAIL_R_PAYLOAD_CHANGE | `a_R_payload_stable_while_stalled` |
| FAIL_R_VALID_DROP_DURING_STALL | `a_R_valid_sticky_until_handshake` |

## Automated assertion checks

Run `python3 tests/run_assertions.py` with Verilator and a C++ toolchain installed. It builds with assertions enabled, requires PASS_SMOKE to succeed, and requires all fifteen FAIL cases (including payload changes on each channel's handshake cycle) to trigger their specifically named assertion. Negative-case nonzero exits are expected. The checker preserves complete bus widths and checks payload stability through the handshake cycle after a stall. This DUT is a stimulus fixture, not a functional AXI memory.
