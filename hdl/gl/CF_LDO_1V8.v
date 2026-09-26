// Structural PG wrapper. Analog leaf is CF_LDO_1V8_core.
// Customer rails are vpwr/vgnd. East-edge vccd/vssd are tied to those rails.
module CF_LDO_1V8 (
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
    vgnd,
    vccts_d,
    vpwr,
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
    input vgnd;
    output vccts_d;
    input vpwr;
    input vcchib;
    input en_dft;
    output isolate_ahv;
    output ldo_dft_out;
    input ldo_pwrmode;
    input [1:0] ldo_ngate_trim;
    CF_LDO_1V8_core u_core (
        .vdda_low_n(vdda_low_n),
        .vccts(vccts),
        .bypass(bypass),
        .dft(dft),
        .isrc_2p5u(isrc_2p5u),
        .prog(prog),
        .trim(trim),
        .rst_system_act_nonret_n(rst_system_act_nonret_n),
        .vdda(vdda),
        .pd(pd),
        .vref_1v(vref_1v),
        .vssa(vssa),
        .vssd(vgnd),
        .vccts_d(vccts_d),
        .vccd(vpwr),
        .vcchib(vcchib),
        .en_dft(en_dft),
        .isolate_ahv(isolate_ahv),
        .ldo_dft_out(ldo_dft_out),
        .ldo_pwrmode(ldo_pwrmode),
        .ldo_ngate_trim(ldo_ngate_trim)
    );
endmodule
