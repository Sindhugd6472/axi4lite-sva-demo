// ---- AW channel ----


// (1) Payload stable while stalled (only enforced if stall continues)
property p_AW_payload_stable_while_stalled;
  @(posedge ACLK) disable iff(!ARESETn)
    (AWVALID && !AWREADY) |-> ##1
            (!( AWVALID && !AWREADY ) || ({ AWADDR, AWPROT } == $past({ AWADDR, AWPROT })));

endproperty
a_AW_payload_stable_while_stalled: assert property(p_AW_payload_stable_while_stalled);



// (2) VALID sticky until handshake (if still stalled next cycle, VALID must still be 1)
property p_AW_valid_sticky_until_handshake;
  @(posedge ACLK) disable iff(!ARESETn)
    (AWVALID && !AWREADY) |=>
    AWVALID;
endproperty
a_AW_valid_sticky_until_handshake: assert property(p_AW_valid_sticky_until_handshake);




// ---- W channel ----


// (1) Payload stable while stalled (only enforced if stall continues)
property p_W_payload_stable_while_stalled;
  @(posedge ACLK) disable iff(!ARESETn)
    (WVALID && !WREADY) |-> ##1
            (!( WVALID && !WREADY ) || ({ WDATA, WSTRB } == $past({ WDATA, WSTRB })));

endproperty
a_W_payload_stable_while_stalled: assert property(p_W_payload_stable_while_stalled);



// (2) VALID sticky until handshake (if still stalled next cycle, VALID must still be 1)
property p_W_valid_sticky_until_handshake;
  @(posedge ACLK) disable iff(!ARESETn)
    (WVALID && !WREADY) |=>
    WVALID;
endproperty
a_W_valid_sticky_until_handshake: assert property(p_W_valid_sticky_until_handshake);




// ---- B channel ----


// (1) Payload stable while stalled (only enforced if stall continues)
property p_B_payload_stable_while_stalled;
  @(posedge ACLK) disable iff(!ARESETn)
    (BVALID && !BREADY) |-> ##1
            (!( BVALID && !BREADY ) || ({ BRESP } == $past({ BRESP })));

endproperty
a_B_payload_stable_while_stalled: assert property(p_B_payload_stable_while_stalled);



// (2) VALID sticky until handshake (if still stalled next cycle, VALID must still be 1)
property p_B_valid_sticky_until_handshake;
  @(posedge ACLK) disable iff(!ARESETn)
    (BVALID && !BREADY) |=>
    BVALID;
endproperty
a_B_valid_sticky_until_handshake: assert property(p_B_valid_sticky_until_handshake);




// ---- AR channel ----


// (1) Payload stable while stalled (only enforced if stall continues)
property p_AR_payload_stable_while_stalled;
  @(posedge ACLK) disable iff(!ARESETn)
    (ARVALID && !ARREADY) |-> ##1
            (!( ARVALID && !ARREADY ) || ({ ARADDR, ARPROT } == $past({ ARADDR, ARPROT })));

endproperty
a_AR_payload_stable_while_stalled: assert property(p_AR_payload_stable_while_stalled);



// (2) VALID sticky until handshake (if still stalled next cycle, VALID must still be 1)
property p_AR_valid_sticky_until_handshake;
  @(posedge ACLK) disable iff(!ARESETn)
    (ARVALID && !ARREADY) |=>
    ARVALID;
endproperty
a_AR_valid_sticky_until_handshake: assert property(p_AR_valid_sticky_until_handshake);




// ---- R channel ----


// (1) Payload stable while stalled (only enforced if stall continues)
property p_R_payload_stable_while_stalled;
  @(posedge ACLK) disable iff(!ARESETn)
    (RVALID && !RREADY) |-> ##1
            (!( RVALID && !RREADY ) || ({ RDATA, RRESP } == $past({ RDATA, RRESP })));

endproperty
a_R_payload_stable_while_stalled: assert property(p_R_payload_stable_while_stalled);



// (2) VALID sticky until handshake (if still stalled next cycle, VALID must still be 1)
property p_R_valid_sticky_until_handshake;
  @(posedge ACLK) disable iff(!ARESETn)
    (RVALID && !RREADY) |=>
    RVALID;
endproperty
a_R_valid_sticky_until_handshake: assert property(p_R_valid_sticky_until_handshake);




