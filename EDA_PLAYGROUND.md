# EDA Playground quick run (AXI4-Lite SVA demo)

1) Create a new EDA Playground.
2) Language: SystemVerilog.
3) Simulator: Questa/ModelSim (or any SV simulator that supports SVA).
4) Create tabs with these exact filenames:
   - testbench.sv
   - design.sv
   - axi4lite_props.sv
   - axi4lite_sva.sv
   - bind_axi4lite.sv

Important: In SystemVerilog mode, EDA Playground compiles testbench.sv and design.sv by default; extra tabs may not compile unless you `include them. [web:901][web:904]
So at the top of testbench.sv, add:
  `include "axi4lite_props.sv"
  `include "axi4lite_sva.sv"
  `include "bind_axi4lite.sv"

Run Options:
- +TEST=PASS_SMOKE
- Or any FAIL_* test to intentionally trip one assertion.
