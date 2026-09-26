`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_LDO_1V8_core.
// Drop this file in place of hdl/gl/CF_LDO_1V8_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * pd high, or rst_system_act_nonret_n low, clears the outputs.
//   * Otherwise vdda_low_n is high when vdda is high.
//   * vccts and vccts_d are high when vdda and vref_1v are high.
//   * bypass high makes vccts and vccts_d follow vdda.
//   * en_dft high copies dft[0] to ldo_dft_out. isolate_ahv stays low.
// Trim, prog, ldo_ngate_trim, ldo_pwrmode, vcchib, and isrc_2p5u are not modeled.
// vccd and vssd are supply inputs and are not generated.

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

    reg vdda_low_n;
    reg vccts;
    reg vccts_d;
    reg isolate_ahv;
    reg ldo_dft_out;

    wire run = (pd !== 1'b1) && (rst_system_act_nonret_n === 1'b1);

    always @* begin
        isolate_ahv = 1'b0;
        ldo_dft_out = 1'b0;
        vdda_low_n = 1'b0;
        vccts = 1'b0;
        vccts_d = 1'b0;
        if (run) begin
            vdda_low_n = (vdda === 1'b1);
            if (bypass === 1'b1) begin
                vccts = (vdda === 1'b1);
                vccts_d = (vdda === 1'b1);
            end else if ((vdda === 1'b1) && (vref_1v === 1'b1)) begin
                vccts = 1'b1;
                vccts_d = 1'b1;
            end
            if (en_dft === 1'b1)
                ldo_dft_out = dft[0];
        end
    end
endmodule
