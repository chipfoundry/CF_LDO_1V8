`timescale 1ns / 1ps

module tb_CF_LDO_1V8;
    reg vdda;
    reg vssa;
    reg vcchib;
    reg isrc_2p5u;
    reg vref_1v;
    reg pd;
    reg bypass;
    reg rst_system_act_nonret_n;
    reg en_dft;
    reg ldo_pwrmode;
    reg vpwr;
    reg vgnd;
    reg [4:0] dft;
    reg [3:0] prog;
    reg [3:0] trim;
    reg [1:0] ldo_ngate_trim;
    wire vdda_low_n;
    wire vccts;
    wire vccts_d;
    wire isolate_ahv;
    wire ldo_dft_out;

    integer errors;

    CF_LDO_1V8 dut (
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
        .vgnd(vgnd),
        .vccts_d(vccts_d),
        .vpwr(vpwr),
        .vcchib(vcchib),
        .en_dft(en_dft),
        .isolate_ahv(isolate_ahv),
        .ldo_dft_out(ldo_dft_out),
        .ldo_pwrmode(ldo_pwrmode),
        .ldo_ngate_trim(ldo_ngate_trim)
    );

    task check;
        input exp_low_n;
        input exp_vccts;
        input exp_dft;
        input [255:0] label;
        begin
            if (vdda_low_n !== exp_low_n || vccts !== exp_vccts || vccts_d !== exp_vccts
                || ldo_dft_out !== exp_dft || isolate_ahv !== 1'b0) begin
                $display("FAIL %0s low_n=%b vccts=%b vccts_d=%b dft_out=%b isolate=%b",
                    label, vdda_low_n, vccts, vccts_d, ldo_dft_out, isolate_ahv);
                errors = errors + 1;
            end else begin
                $display("PASS %0s", label);
            end
        end
    endtask

    initial begin
        errors = 0;
        vdda = 0;
        vssa = 0;
        vpwr = 1;
        vgnd = 0;
        vcchib = 0;
        isrc_2p5u = 0;
        vref_1v = 0;
        pd = 1;
        bypass = 0;
        rst_system_act_nonret_n = 0;
        en_dft = 0;
        ldo_pwrmode = 0;
        dft = 5'b0;
        prog = 0;
        trim = 0;
        ldo_ngate_trim = 0;
        #1;
        check(0, 0, 0, "powerdown holds outputs 0");

        pd = 0;
        rst_system_act_nonret_n = 1;
        vdda = 1;
        vref_1v = 1;
        #1;
        check(1, 1, 0, "regulated outputs high");

        vdda = 0;
        #1;
        check(0, 0, 0, "supply low clears outputs");

        vdda = 1;
        vref_1v = 0;
        bypass = 1;
        #1;
        check(1, 1, 0, "bypass follows vdda");

        en_dft = 1;
        dft = 5'b00001;
        #1;
        check(1, 1, 1, "dft copies dft[0]");

        rst_system_act_nonret_n = 0;
        #1;
        check(0, 0, 0, "reset clears outputs");

        if (errors == 0)
            $display("ALL PASS");
        else
            $display("FAILED %0d", errors);
        $finish;
    end
endmodule
