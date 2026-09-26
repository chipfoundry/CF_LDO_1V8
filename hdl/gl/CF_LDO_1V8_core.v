// Empty blackbox stub for hierarchical integration LVS.
module CF_LDO_1V8_core (
    vdda_low_n,
    vccts,
    bypass,
    dft,
    isrc_2p5u,
    prog,
    trim,
    rst_system_act_nonret_n,
    vdda,
    pd,
    vref_1v,
    vssa,
    vssd,
    vccts_d,
    vccd,
    vcchib,
    en_dft,
    isolate_ahv,
    ldo_dft_out,
    ldo_pwrmode,
    ldo_ngate_trim
);
    output vdda_low_n;
    output vccts;
    input bypass;
    input [4:0] dft;
    input isrc_2p5u;
    input [3:0] prog;
    input [3:0] trim;
    input rst_system_act_nonret_n;
    input vdda;
    input pd;
    input vref_1v;
    input vssa;
    input vssd;
    output vccts_d;
    input vccd;
    input vcchib;
    input en_dft;
    output isolate_ahv;
    output ldo_dft_out;
    input ldo_pwrmode;
    input [1:0] ldo_ngate_trim;
endmodule
