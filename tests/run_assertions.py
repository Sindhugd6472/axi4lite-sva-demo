"""Run positive smoke and require each negative case to trip its named assertion."""
import subprocess

subprocess.run(["verilator", "--binary", "--timing", "--assert", "-j", "2", "-Wno-fatal", "--top-module", "tb", "-I.", "design.sv", "axi4lite_sva.sv", "bind_axi4lite.sv", "testbench.sv"], check=True)
subprocess.run(["./obj_dir/Vtb", "+TEST=PASS_SMOKE"], check=True)
for channel in ["AW", "W", "B", "AR", "R"]:
    for suffix, assertion in [("PAYLOAD_CHANGE_AT_HANDSHAKE", "payload_stable_while_stalled"), ("PAYLOAD_CHANGE", "payload_stable_while_stalled"), ("VALID_DROP_DURING_STALL", "valid_sticky_until_handshake")]:
        name = f"FAIL_{channel}_{suffix}"
        result = subprocess.run(["./obj_dir/Vtb", f"+TEST={name}"], text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        if result.returncode == 0 or f"a_{channel}_{assertion}" not in result.stdout:
            raise SystemExit(f"Expected assertion missing for {name}: {result.stdout}")
        print(f"PASS: {name} triggered its expected assertion")
