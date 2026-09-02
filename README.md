# CF_LDO_1V8

> **Draft for review — text extraction only.** Figure rebuild did not pass, so this file is not a complete datasheet. Cypress/process leftovers may still be present. Do not treat this as a released spec.

- Vendor block: `s8ldo`
- Pages merged: 49/49
- Skipped or invalid caches:
- (none)

---


> 1.8 V LDO Regulator

## Overview

The s8ldo hard IP is an analog Low Drop-Out type regulator for the Touch Screen Sub-system of M0S8 Gen4 Touch Screen chip. It provides 3mA of regulated current with high PSRR. It has programmable output voltage ranging from 2.3V to 3.6V. It can also be bypassed. This LDO is used in the Gen4 Touch Screen Sub-system, and therefore classified as an ASSP. This IP is designed for the power supply range of 2.6V-5.5V. A potential reuse for this IP block has not been identified.

The s8ldo HardIP block is a low dropout regulator (LDO) designed for the Gen4 Touch Screen Sub-System. It regulates an external supply from 2.6V to 5.5V down to a range of 2.3V to 3.6V in 100mV steps, with a maximum output current of 3mA, a dropout voltage of 150mV, a start-up time of 15us, a phase margin of 45 degrees, and a gain margin of 12dB. It supports active, sleep, and bypass power modes, with active power consumption of 450uA. The LDO has a DC gain of 40dB, a ripple of 10mV at 100mV supply noise, and a line regulation of 1.15%V. The Vccts temperature coefficient is 60uV/C, and the simulation temperature range is -40C to 100C. The LDO core and bypass caps total area is 343,500 um2. In bypass mode, the VDDA voltage must be limited to 3.6V.

The block generates a 1V8 reference voltage with trimming capability and supports multiple power modes and interface requirements.

This page lists the table of contents for a document covering technical specifications, integration information, and operating procedures for a block named CF_LDO_1V8.

A block named CF_LDO_1V8 is associated with output voltage options and trim options, with a reference voltage and a bypass capacitor block.

The CF_LDO_1V8 block is a hard IP block for which the requirements are set by the NPP Definition team to determine the performance and functionality needed for all target products. It has a documented history of revisions with specific reasons for updates, including initial BROS, schedule updates, spec updates, and removal of obsolete references. The block is associated with a behavioral model approved by BMRB and has a set of defined pins.

The block is used with Gen4 Touch Screen Sub-System and includes Analog IP blocks such as S8TSSAR HardIP Block Requirements Objective Spec and S8PUMP HardIP Block Requirements Objective Spec, referenced in the document for block requirements and preparation.

The document lists various methodologies, references, and specifications related to IP block development, DFT, deliverables, naming conventions, best practices, and related memos for the CF_LDO_1V8 block.

The PM system is enabled for an online FMEA.  See the following help and background.  Contact NPDIS if there are further questions on how to use this tool. http://pm.cypress.com/cyplm/help/helpContents/risks.html SXE-280 FMEA, via PM System-Current View

CF_LDO_1V8 is a low drop-out voltage regulator used in M0S8 Gen4 Touch Screen device to regulate external Vdda supply, providing regulated voltage for Touch Screen Sub-System components, with programmable output between 2.3V and 3.6V in 100mV steps, including a special 50mV step for 2.45V default setting, and capable of being bypassed or disabled. It uses an N-type transistor in source follower configuration with a pumped gate voltage to compensate for Vtn drop, filtered to approximately 5mV, and operates without an external bypass capacitor.

The LDO regulator does not require any in-rush current control during initial system startup as the Current spike is well within the 500mA peak current spec. The output voltage is programmable via 4 program bits. Programmable range is from 2.3V to 3.6V with 100mV steps (there is one setting that sets the regulator output to 2.45V). There is also 4-bits of trim provided. Trim steps are 17mV (8 positive steps and 7 negative steps). Interface to this IP is in LV domain (VCCD and VCCDHIB). Control signals are level shifted to VDDA or VPUMP (internal pumped supply) inside the IP. The current users of the s8ldo are listed in the below table as well as their load requirements. The following Trim table defines the fine grain factory trim range; the trim must be kept from the user in hidden flash rows. The 4-bit trim is used to trim the regulated output VCCTS as close to 2.45V (within +/-5.5mV) the mini-mod will have to be used for this trimming. Please note that table below assumes a typical trim step of 11mv but step size could be up to 17mV.

The evidence provides programming options for adjusting the output voltage of the CF_LDO_1V8 block using trim and prog control bits. The trim settings adjust the output voltage in 11mV increments from -44mV to +88mV, while the prog settings set the regulated output voltage from 2.30V to 3.60V in 0.10V steps. A minimum of 150mV drop out is required to meet performance specifications.

The block supports programmable ngate capacitance with values 60pF, 75pF, and 90pF (default), which affects PSRR and load regulation. It has multiple operation modes including sleep, bypass, active normal, active low power, and DFT mode, with specific pin configurations. DFT functionality controls load resistors for Vccts and Vccts_d with various resistor values.

The CF_LDO_1V8 block uses DFT controls dft[2:0] to set load resistors for Vccts and Vccts_d with specific resistance and current values, and DFT controls dft<4:3> to select output options including clk_by16, Vccts, and Vccts_d with associated supply ranges. It has no timing requirements, requires digital control signals at LV Vccd or Vcchib level, and requires dft_en high to enable DFT mode.

The CF_LDO_1V8 block operates in system power modes Active and Sleep, has no reset or initialization requirements, can be turned off to reduce leakage current, and has trim and prog options for output voltage adjustment. It is testable with test resistors for load regulation testing and has no registers. The output can be shorted to ground in Sleep mode and bypassed if desired.

The block has no wounding options or planned derivatives. It must be placed more than 100um away from I/O injectors. The external Vdda connection must use a 100um wide metal-5 power bus to allow 5mV IR drop. The LDO output must be routed to the Touch Screen Sub-System with a 60um wide metal-5 power bus for <5mV IR drop. Thirteen bypass caps for Vccts and four for Vccts_d are required. No other block can connect to the LDO Power bus. The analog lines vref_1v and isrc_2p5u must be fully shielded with LDO local vssa. The block complies with BMRB requirements, and its BMRB review was held on 09/19/2011. ENH-114 is the BMRB memo, and ENH-110 is the XZ table for behavioral model checks.

This evidence describes the CF_LDO_1V8 block's integration requirements, including shielding, power bus connections, and clamp requirements, as well as power constraints and other considerations.

The block is a low-dropout regulator with specific input and output connections, operating under defined conditions, and includes features like trim and bypass capabilities.

The block is a low-dropout regulator for a 1V8 output, with integration details and prerequisites for a Gen4 touch screen application. It has a DDC name of s8ldo, library name of s8ldo, and is part of HardIP_PublicCells. It requires scs8hvla, scs8lsa, and s8rf as prerequisite IP, and has no additional requirements.

The block generates a trimmed reference voltage and has specific performance characteristics including area, power supply rejection, active and sleep currents, load and line regulation, drop-out voltage, accuracy, and start-up time compared to other devices.

The document outlines simulation and verification strategies for the CF_LDO_1V8 block, detailing AC and DC simulations including gain, bandwidth, phase margin, PSRR, and operating point evaluations over various conditions.

This evidence describes various simulation requirements for power management blocks including line regulation, load regulation, Monte Carlo mismatch, temperature coefficient, and transient ripple rejection ratio simulations, all of which must be conducted over process, voltage, temperature, and load variations to verify regulator performance.

3 startup/power-up simulations required: VCC slow ramp with max load, slow ramp with large transient load spike, and stable VCC transition from disabled to active; checks for startup times, non-monotonic startup, metastable conditions, current spikes, overshoots/undershoots over PVT; Monte Carlo mismatch simulations for metastable states and startup failure due to mismatch; extreme PVT simulations for DC and transient startup; transient bobble noise and brownout noise simulations for power supply variations.

The evidence describes various simulation checks for regulator behavior, including transient transitions, output ripple, device saturation, stress checks, and floating node simulations across process, voltage, and temperature conditions.

The block minimizes leakage currents in standby mode, requires package parasitics for all external signals, must include external reference circuits if used, and addresses electromigration, layout checks, convergence issues, and component matching for analog circuits.

This evidence describes the simulation and verification methodology for a low-dropout regulator (LDO) block, including test bench implementations for various simulation types such as AC, DC, transient, and Monte Carlo, as well as the use of extracted netlists and device mismatch analysis.

The block does not include laser or metop elements and uses register bits for programmability. It has no ESD structures but requires ESD clamps on outputs. It supports line and load regulation characterization with internal load resistors for testing. Electromigration analysis ensures metal widths meet 0.57mA/um at 100C for M1/M2. Noise analysis includes full chip parasitic and package parasitics with inductance. The output Vccts is routed to TSS's DFT mux. The block follows layout best practices and uses Cypress standard verification flow.

The block generates a trimmed reference voltage and requires trimming of the Bandgap to 1.024V and the reference current to 2.4uA before characterization. It supports a 5mA load during Bobble and Brown-out tests with supply voltages of 2.6V and 5.5V, and is tested under 3mA load with external supply voltages of 2.6V and 5.5V. Load regulation and line regulation are measured in mV/mA and mV/V respectively, with the output observed through s8pwrsysm0s8 and internal test resistors. The block's output is monitored during Bobble, Brown-out, and Current Transient Characterization tests for recovery and ripple.

The LDO block is trimmed to produce a specific voltage output, with measurements taken under various conditions including different supply voltages, current loads, and temperatures to assess load and line regulation.

Line regulation is defined as the change in output voltage divided by the change in power supply. Line regulation should be measured for supply external voltages ranging from 2.6V to 5.5V for VCCTS_D=2.45V and from 3.75V to 5.5V for VCCTS_D=3.6V, with a supply current load of 1mA using a DFT resistor load, at temperatures of -40ºC, 25ºC, and 100ºC. A production test (DC.21) checks the VDDA power good rising trip point, requiring a supply ramp at VDDA where the output of the VDDA monitor circuit toggles by VDDA=1.5V, with the status read from the LDO_CONFIG register (Bit 28, address=0x401100C4) indicating VDDA presence if set to '1'. This test is also measured at -40ºC, 25ºC, and 100ºC. Additional production tests are added for 100% analog coverage, as documented in QSI-123, with test limits based on 5 sigma values from good dies. Bench measurement of line and load regulation requires specific equipment including an Agilent E3631A power supply, two HP 34401A multimeters, a Keithley 236 SMU, a T2420 temperature forcing unit, a K-type thermocouple, and a Fluke 52 II thermometer. Testing setup requires data points at -40ºC, 25ºC, and 100ºC for analog regulator line and load regulation. Load regulation measurements include supply external voltages of 2.6V, 3.75V, and 5.5V with supply current loads of 0.05mA, 1.0mA, 4.0mA, 12.0mA, 20.0mA, and 25.0mA.

The block requires external voltages of 2.6V and 5.5V, supports current loads from 75uA to 9.8mA using DFT resistor loads, and has Vccts output set to 2.45V and 3.6V. It is tested with a power supply, multimeters, a temperature forcing unit, and other equipment across specific temperatures and voltage conditions, including a program and trim process for output voltage settings.

The LDO will be enabled, and the Vccts output will be monitored through the DFT output. Spec is defined as the time it takes for Vccts output to reach it's 99%. A Precision Temperature Forcing Unit (T2420) will be used to test across three different temperatures (-40ºC, 25ºC and 100ºC). A K-type thermocouple will be taped to the part's socket and connected to a thermometer (Fluke 52 II) to accurately read the part's environment temperature. During the Brown-out test the voltage supply will be dropped from the nominal voltage to a very low level which is varied between 0V and 1.6V. During this time the output of the regulator needs to be monitored to see if it is recovering after every voltage supply drop. VDDA will be set to 2.6V, 3.75, and 5.5V. The low level was manually varied between 0V and 1.6V in order to pass through all voltage levels. The output must be loaded with 3mA load using DFT resistors. During the Bobble test the voltage supply will be dropped from the nominal voltage to a very high level which is varied between 3V and 5.5V. During this time the output of the regulator needs to be monitored to see if it is recovering after every voltage supply increase.

The VDDA voltage is set to 2.6V with a high level varied between 3.5V and 5.5V; the output requires a 3mA load using DFT resistors, and testing is conducted at temperatures of -40ºC, 25ºC, and 100ºC with a K-type thermocouple and Fluke 52 II thermometer.

The block supports 100% functional coverage through specific tests including line regulation, load regulation, trim, program, and low voltage detect. The LDO output must be routed through the TS subsystem DFT muxes and directly observed. The low voltage detect can be observed by reading the LDO_CONFIG register (Bit 28, address=0x401100C4), where VDDA presence is indicated by a "1" in that bit. Tests include trimming the LDO output to 2.45V, programming the output from 2.35V to 3.6V, and trimming until the LVD trips.

This page contains records and posting sheet instructions, not block functionality details.

This evidence is a page from a document detailing the IP deliverables worksheet for an LDO block named S8LDO. It includes information about the IP's name, type, ownership, and related personnel. The specific block in question, CF_LDO_1V8, is not described in the text; only its pin list is provided. The evidence does not contain any functional, architectural, or integration details about the block, only the pin names.

LDO regulator for Gen4 touch screen

The evidence item is a page header stating 'APPENDIX 2 - Supporting Documents (If Applicable)' followed by 'N/A'.

The evidence details various revisions and updates to the CF_LDO_1V8 block, including initial specification, updates to the datasheet, production test information, symbol views, and area corrections, with no functional changes noted in some revisions.

This page is a document history table that shows various revisions, ECN numbers, and descriptions of changes made to the document. It lists multiple revisions with ECN numbers and corresponding change descriptions. The table shows that the document has undergone several updates, including changes to specifications, removal of obsolete references, and formatting changes.

This evidence describes a worksheet for block documentation and specifications, including sections for public cells, pin lists, operating conditions, DC and AC specs, and detailed data. It provides instructions for filling in the worksheet and the required fields for each section.

The evidence shows the CF_LDO_1V8 block is part of a project schedule for a design with multiple milestones, including IPS1, IPS2, IPS3, and IPS4, each with current schedule, cycle time, and baseline cycle time, as well as a list of other project elements.

The block is a low-dropout regulator with an output voltage of 1.8V that includes a bypass capacitor interface and features for power management and testability.

This block provides a 1.8V low-dropout regulator with specified area and bypass capacitor requirements.

The block is a low-dropout regulator that generates a trimmed reference voltage and includes control inputs for power mode and trim settings.

The block is a low-dropout regulator (LDO) that provides a regulated 1.8V supply output and features multiple power rails and control inputs for various operational modes, including power-down, bypass, and trimming options.

The evidence specifies operating conditions for a low-dropout (LDO) voltage regulator and its bypass capacitor, including power supply ranges, temperature range, reference current, and reference voltage values.

LDO output voltage specifications including typical and worst-case values, step sizes, output current capabilities, load and line regulation, temperature coefficients, and trip points for power good and isolation signals

The block provides a reference voltage and specifies detailed performance metrics for the amplifier, including DC gain, phase margin, gain margin, and PSRR at various frequencies for VCCTS and VCCTS_D outputs. It also defines startup times, maximum output capacitance, and rise/fall times for specific outputs.

### Function

It provides 3mA of regulated current with high PSRR.

regulates an external supply from 2.6V to 5.5V down to 2.3V to 3.6V in 100mV steps with a maximum output current of 3mA and a dropout voltage of 150mV

The block generates a 1V8 reference voltage with trimming capability.

The block generates a 1.8V output voltage.

The block generates a trimmed reference voltage.

It regulates the external Vdda supply to power Touch Screen Sub-System components, providing a programmable output voltage between 2.3V and 3.6V in 100mV steps with a special 50mV step for the default 2.45V setting, and can be bypassed or disabled.

The block generates a regulated output voltage that can be adjusted via trim and prog control settings, with the default output voltage set to 2.45V and a minimum of 150mV drop out required to meet specifications.

The block generates a trimmed reference voltage and operates in system power modes Active and Sleep, can be turned off to reduce leakage current, and has trim and prog options for output voltage adjustment.

The CF_LDO_1V8 block generates a trimmed reference voltage and requires specific power and shielding conditions for accurate operation.

It provides a regulated output voltage.

The block is a low-dropout regulator that provides a 1V8 output voltage.

The block generates a trimmed reference voltage and requires AC and DC simulations to evaluate gain, bandwidth, phase margin, gain margin, power supply rejection ratio, and operating point over all process, voltage, temperature, and load conditions.

The block generates a trimmed reference voltage and operates in multiple modes including active, hibernate, and standby modes.

Minimizes leakage currents in standby mode and ensures critical nodes do not charge to unwanted states by preventing floating nodes from affecting them.

The block generates a trimmed reference voltage and its output is monitored for recovery after voltage supply variations and for ripples during load switching, with the load set to 5mA for Bobble and Brown-out tests and 3mA for DC test conditions.

The block is trimmed to bring the LDO output as close to 3.6V as possible for some tests and to 2.45V or 3.6V for others, and it supplies a stable output voltage under varying load and line conditions.

The block generates a trimmed reference voltage and monitors VDDA power good status, with the VDDA monitor circuit toggling by VDDA=1.5V and the status read from the LDO_CONFIG register (Bit 28, address=0x401100C4) indicating VDDA presence if set to '1'.

The block supplies external voltages of 2.6V and 5.5V, supplies current loads from 75uA to 9.8mA using DFT resistor loads, and sets Vccts output to 2.45V and 3.6V.

The block outputs a 2.6V voltage with a 3mA load requirement using DFT resistors.

The block generates a trimmed reference voltage and supports output programming from 2.35V to 3.6V, with low voltage detect functionality that trips when the LDO is trimmed to a specific threshold.

regulates voltage for Gen4 touch screen

The block is part of a project schedule for a design with multiple milestones.

It generates a 1.8V reference voltage from a higher input voltage and includes a bypass capacitor interface for stability and power management features.

The block generates a regulated 1.8V supply and provides a reference voltage for the LDO, with options for power-down, bypass mode, and fine trimming of the output voltage.

The block generates a 1.00352 to 1.04448 V reference voltage for LDO operation and requires specific power supply and temperature conditions for operation.

provides a trimmed reference voltage output with adjustable settings and supports multiple power modes

## Installation

Install the released package with IPM:

```bash
ipm install CF_LDO_1V8
```

Use the files under `hdl/gl/` as blackbox declarations, `layout/lef/` for physical integration, `layout/gds/` for the public abstract, and `timing/lib/` for available characterized views. The public GDS is an abstract; ChipFoundry substitutes protected full geometry during tapeout.

## Features

- 3mA (typ) high PSRR Analog LDO regulator
- VDDA input range 2.6V to 5.5V
- PSRR (0-100MHz, typ load of 3mA): –20dB
- Drop-out voltage (150mV nom): 100-200mV@ 2.6V ext
- Power consumption 400uA typ & 450uA worst case
- Programmable output voltage: 2.3-3.6V
- Start-up time of 15 us.
- 343,5ksq-um total area for LDO core and bypass caps
- Load regulation of 2.81 mV/mA @ 2.45V output
- Line regulation of 1.15%/V
- Crude monitoring circuits for VDDA and VCCHIB.
- output current 3 mA
- PSRR 150mV @(0-100MHz) w 3mA load -20 dB
- start-up time to 99% final voltage 15 us
- phase margin 45 degrees
- gain margin 12 dB
- power modes Active, sleep, bypass
- active power (Max estimate) @ Target Frequencies 450uA
- DC gain 40dB
- ripple (@100mV supply noise) 10mV
- LDO program output range 2.3-3.6V
- LDO drop out voltage 150mV
- line regulation 1.15%V
- load regulation + ripple 2.81mV/mA
- Vccts temperature coefficient 60uV/C
- simulation temperature range -40C to 100C
- VDDA external voltage range 2.6-5.5V
- can be configured to regulate an external supply (2.6V – 5.5V) down to 2.3V-3.6V range with 100mV steps
- bypass mode available with VDDA limited to 3.6V
- 1V8 reference voltage generation
- trimming capability
- multiple power modes support
- It supports programmable output voltage options.
- It supports trim options for the output voltage.
- The block has a behavioral model approved by BMRB.
- The block has a set of defined pins.
- 4 bits are available to set the output in 100mV steps between 2.3 and 3.6V
- 50mV step for the default 2.45V setting
- can be bypassed
- can be disabled
- The output voltage is programmable via 4 program bits. Programmable range is from 2.3V to 3.6V with 100mV steps (there is one setting that sets the regulator output to 2.45V). There is also 4-bits of trim provided. Trim steps are 17mV (8 positive steps and 7 negative steps).
- The 4-bit trim is used to trim the regulated output VCCTS as close to 2.45V (within +/-5.5mV) the mini-mod will have to be used for this trimming. Please note that table below assumes a typical trim step of 11mv but step size could be up to 17mV.
- s8tssar 10-bit SAR ADC 0.5mA VCCTS
- s8tsrx Touch screen RX Channels 2.5mA VCCTS
- s8tsmux + shield driver* Touch screen TX mux 0.9mA VCCTS D
- s8pump** Pump 0.05mA VCCTS D
- The block supports trim settings to adjust the output voltage in 11mV increments from -44mV to +88mV.
- The block supports prog settings to set the regulated output voltage from 2.30V to 3.60V in 0.10V steps, with 2.45V as the default.
- The block requires a minimum of 150mV drop out to meet PSRR and load regulation specifications.
- ngate capacitance is programmable via ngate_cap_trim[1:0] with values 60pF, 75pF, and 90pF (default) affecting PSRR and load regulation
- supports operation modes: sleep, bypass, active normal, active low power, and DFT mode
- DFT functionality controls load resistors for Vccts and Vccts_d with resistor values 250, 499, 997, 2003 for Vccts and 642, 1274, 2552, 5089 for Vccts_d
- Supports DFT controls dft[2:0] to set load resistors for Vccts and Vccts_d with resistance values 4004Ω, 7993Ω, 16016Ω, 32033Ω and current values 240μA, 120μA, 60μA, 30μA
- Supports DFT controls dft<4:3> to select output options SPARE, clk_by16, Vccts, Vccts_d with supply ranges 0 - VCCD, 2.30 – 3.60v, 2.25 – 3.55v
- Has no timing requirements
- Requires digital control signals at LV Vccd or Vcchib level
- Requires dft_en high to enable DFT mode
- The block has no reset and initialization requirements
- The LDO can be bypassed if desired
- In the Sleep mode, the output of the LDO can be shorted to ground through internal test resistors
- There are 2 independent output regulator trim options, namely trim and prog
- The trim<3:0> bus is used as part of the production trim procedure, the regulator is trimmed as close to 2.450V as possible, this way any variation seen in the users output programmability, is seen at the higher end of the program range where it will not matter.  The step size for the trim is 11mV (typ)
- The prog<3:0> bus is used by the user/customer to program the output of the regulator from 2.3V to 3.6V in increments of 100mV (expect for a special setting
- The output of the LDO, Vccts and vccts_d, will be routed to the touch screen DFT muxes, making the regulator outputs observable
- The output of the power good monitor is registered, and can also be observed
- There will be test resistors, which can load the output of the regulator from 75uA to 10mA (at 2.45V setting) with various sizes resistors; this will allow simple and fast testing of line and load regulation tests
- There are no registers inside the block
- The block has no wounding options or planned derivatives.
- It must be placed more than 100um away from I/O injectors.
- The external Vdda connection must use a 100um wide metal-5 power bus to allow 5mV IR drop.
- The LDO output must be routed to the Touch Screen Sub-System with a 60um wide metal-5 power bus for <5mV IR drop.
- Thirteen bypass caps for Vccts and four for Vccts_d are required.
- No other block can connect to the LDO Power bus.
- The analog lines vref_1v and isrc_2p5u must be fully shielded with LDO local vssa.
- The block complies with BMRB requirements.
- Its BMRB review was held on 09/19/2011.
- ENH-114 is the BMRB memo.
- ENH-110 is the XZ table for behavioral model checks.
- sensitive blocks shielded with a metal 3 bus connected to ground
- IP placed inside a deep nwell with DNW extended to IP boundary
- metal 5 VDDA and VCCTS power busses connected to the pass element
- external power clamps added to VCCTS and VCCTS_D at chip level using VSSA and VSSD
- IR drop from Vdda pin to block must be very low <5mV
- IR drop from IP block to TSS must be very low <5mV
- bandgap reference must be properly shielded for accurate operation
- It has a trim input for voltage adjustment.
- It includes a bypass input for external capacitance.
- It supports a programmable input.
- It has a reset input for system reset.
- It features a dft input for design for test purposes.
- It provides an ldo_dft_out output for test signals.
- It has a ldo_pwrmode input for power mode control.
- It includes an ldo_ngate_trim input for gate trim adjustment.
- The block is designed for a Gen4 touch screen application.
- The block is part of the HardIP_PublicCells top cell.
- The block has an area of 193+151K um2
- The block requires no external bypass capacitor
- The block has a power supply rejection of 52dB at 10 kHz
- The block has a power supply rejection of 20dB at 10 MHz
- The block has an active regulator current of 450uA
- The block has a sleep-by current of 5nA
- The block has a load regulation of 2.81mV/mA
- The block has a line regulation of 1.6mV/V
- The block has a drop-out voltage of 140-150mV
- The block has an accuracy of +/-1%
- The block has a start-up time of Tsu=15us and Twu=2us
- AC simulations to quantify open loop gain, bandwidth, phase margin, and gain margin over all process, voltage, temperature, and load conditions
- Power supply rejection ratio (PSRR) simulations to determine the impact of power supply noise on the output over all process, voltage, temperature, and output load current and capacitance variations
- DC operating point simulations
- Line regulation quantifies the effect of power supply voltage changes on the output over all process, temperature, and load variations.
- Load regulation quantifies the effect of load variations on the output over all process, voltage, and temperature conditions.
- Monte Carlo simulations apply device mismatches to all matched devices to determine output regulation accuracy over voltage, temperature, and load range.
- Temperature coefficient simulations quantify the effect of temperature on the output over all process, voltage, and load variations when a specific temperature coefficient is required.
- Transient ripple rejection ratio simulations apply a transient ripple of particular magnitude and frequency to the power supply to evaluate its effect on the output, with simulations run for sawtooth and pulse waveforms over all process, voltage, temperature, and load conditions.
- 3 startup/power-up simulations required: VCC slow ramp with max load, slow ramp with large transient load spike, and stable VCC transition from disabled to active; checks for startup times, non-monotonic startup, metastable conditions, current spikes, overshoots/undershoots over PVT
- Monte Carlo mismatch simulations for metastable states and startup failure due to mismatch
- extreme PVT simulations for DC and transient startup
- transient bobble noise simulation for power supply bobble effect on output
- transient brownout noise simulation for power supply brownout effect on output
- Operates in active, hibernate, and standby modes
- Handles transient standb  y-to-active and active-to-standby transitions
- Supports transient output ripple checks for AC and DC current load profiles
- Monitors gate overdrive margin for subthreshold conditions
- Checks saturation margin for transistors in saturation region
- Requires simulations for gate oxide stress, junction stress, and technology limits
- Checks for unexpected floating nodes or DC paths in the circuit
- Performs standby simulations
- Operates in active mode and standby mode where leakage currents must be minimized
- Requires bond wire and package parasitics for all signals connected to external pads including external VCC, external VSS, and regulator output
- Includes coupling effects between pins for external high impedance nodes
- Uses external reference circuits such as bandgap references for regulator operation
- Must assess impact of component matching on circuit performance before tape out
- The block is part of a simulation and verification methodology involving AC, DC, transient, and Monte Carlo simulations.
- Monte Carlo simulations are run for important test cases.
- The block uses extracted netlists for all simulations.
- The block is used in a test bench for linear regulation, load regulation, power-down, and supply noise testing.
- The block supports brownout and bobble testing.
- The block is implemented with a behavioral model verified by mixed signal simulations.
- The block is an analog block toolkit where logic equivalency checking is not possible.
- Supports line and load regulation characterization
- Has internal load resistors capable of loading the LDO from a few uA to a few mA
- Output Vccts is routed to TSS's DFT mux
- Uses register bits for programmability
- The block requires the Bandgap to be trimmed to 1.024V and the reference current to 2.4uA before characterization.
- The block supports a 5mA load during Bobble and Brown-out tests.
- The block is tested under external supply voltages of 2.6V and 5.5V.
- The block is tested under a 3mA load using DFT resistor loads.
- The block's output is observed through s8pwrsysm0s8 and internal test resistors for load regulation and line regulation measurements.
- The block is subjected to Bobble test where the voltage supply is varied +/- 250mV from min and max values (2.6V and 5.5V, respectively) with a 5mA load.
- The block is subjected to Brown-out test where the voltage supply is dropped to a low level between 0V and 2.0V with a 5mA load.
- The block is subjected to Current Transient Characterization where internal test loads are switched from min to max values and vice versa to monitor for ripples.
- The block requires trimming to bring LDO output as close to 2.45V as possible for production test DC.2: Vccts_2p45_wc.
- The block is characterized with a 5mA load and 3mA load for different tests.
- Supplies external voltages of 2.6V and 5.5V
- Supplies current load of 3 mA using DFT resistor loads
- Supports load current variation from 75uA to 10mA using DFT resistor load
- Supports supply external voltages of 2.6V and 5.5V for VCCTS=2.45V, and 3.75V and 5.5V for VCCTS=3.6V
- Supports supply external voltages range of 2.6V-5.5V for VCCTS=2.45V, and 3.75V-5.5V for VCCTS=3.6V
- Supports supply current load of 3mA using DFT resistor load
- Operates at -40ºC, 25ºC, and 100ºC
- Measures line regulation for supply external voltages ranging from 2.6V to 5.5V for VCCTS_D=2.45V and from 3.75V to 5.5V for VCCTS_D=3.6V
- Measures line regulation with a supply current load of 1mA using a DFT resistor load
- Measures line regulation at -40ºC, 25ºC, and 100ºC
- Measures VDDA power good rising trip point with a supply ramp at VDDA
- Measures the output of the VDDA monitor circuit toggling by VDDA=1.5V
- Reads VDDA status from the LDO_CONFIG register (Bit 28, address=0x401100C4) indicating presence if set to '1'
- Measures line and load regulation at -40ºC, 25ºC, and 100ºC
- Measures load regulation for supply external voltages of 2.6V, 3.75V, and 5.5V
- Measures load regulation for supply current loads of 0.05mA, 1.0mA, 4.0mA, 12.0mA, 20.0mA, and 25.0mA
- Supplies current loads from 75uA to 9.8mA using DFT resistor loads
- Vccts output set to 2.45V and 3.6V
- The LDO will be enabled, and the Vccts output will be monitored through the DFT output. Spec is defined as the time it takes for Vccts output to reach it's 99%.
- A Precision Temperature Forcing Unit (T2420) will be used to test across three different temperatures (-40ºC, 25ºC and 100ºC). A K-type thermocouple will be taped to the part's socket and connected to a thermometer (Fluke 52 II) to accurately read the part's environment temperature.
- During the Brown-out test the voltage supply will be dropped from the nominal voltage to a very low level which is varied between 0V and 1.6V. During this time the output of the regulator needs to be monitored to see if it is recovering after every voltage supply drop.
- VDDA will be set to 2.6V, 3.75, and 5.5V. The low level was manually varied between 0V and 1.6V in order to pass through all voltage levels. The output must be loaded with 3mA load using DFT resistors.
- During the Bobble test the voltage supply will be dropped from the nominal voltage to a very high level which is varied between 3V and 5.5V. During this time the output of the regulator needs to be monitored to see if it is recovering after every voltage supply increase.
- The output must be loaded with a 3mA load using DFT resistors.
- The high level was manually varied between 3.5V and 5.5V
- Line regulation with min/max DFT load
- Load regulation with min/max DFT load
- Trim LDO output to 2.45V
- Program LDO output from 2.35V to 3.6V
- Trim LDO until LVD trips
- LDO output must be routed through TS subsystem DFT muxes and directly observed
- Low voltage detect observed by reading LDO_CONFIG register (Bit 28, address=0x401100C4) where VDDA presence is indicated by a "1" in that bit
- The block has a 1V8 reference voltage output.
- The block supports a bypass pin for external capacitor connection.
- The block includes a trim pin for reference voltage adjustment.
- The block has an enable pin for power mode control.
- The block features a programmable pin for configuration.
- The block has a system reset pin for active non-retention control.
- The block includes a DFT pin for design for test.
- The block has a current source pin for 2.5uA output.
- The block includes a power down pin for shutdown control.
- The block has an isolation pin for high-voltage domain protection.
- The block features a DFT output pin for test signals.
- The block has a power mode pin for LDO operation control.
- The block includes a gate trim pin for LDO performance tuning.
- The block has multiple power and ground pins for various domains (vdda, vssa, vssd, vccts, vccts_d, vccd, vcchib).
- It includes a bypass capacitor interface for stability.
- It has features for power management and testability.
- The block generates a trimmed reference voltage.
- The block requires 13 bypass caps for VCCTS and 4 bypass caps for VCCTS_D outputs in Gen4.
- The total area of the LDO circuit and bypass caps is 343,5ksq-um.
- The block includes control inputs for power mode and trim settings.
- It has a regulated 1.8V supply output (vccts and vccts_d) for quiet analog and digital applications.
- It supports a reference voltage (vref_1v) and a reference current (isrc_2p5u) for the LDO.
- It has a power-down input (pd) with 1 for power down and 0 for power up.
- It includes a bypass mode (bypass) with 1 for bypass LDO output and 0 for regulated mode.
- It has a fine trim input (trim[3:0]) for voltage adjustment in +/-11mV steps.
- It provides a load control and dft mux control (dft[4:0]) for testing purposes.
- It has a program voltage input (prog[3:0]) for output programming (2.4 - 3.6V).
- It supports LDO power mode control (ldo_pwrmode) and ngate capacitor trim (ldo_ngate_trim<1:0>).
- It includes a power good monitor (vdda_low_n) for VDDA on Vcchib and a power good monitor (isolate_ahv) for VDDD on VDDA.
- It has a reference current input (isrc_2p5u) and a reference voltage input (vref_1v) for the LDO.
- It has an LDO dft output (ldo_dft_out) for testing.
- It includes a reset signal input (rst_system_act_nonret_n) indicating system reset, deep sleep, or hibernate modes.
- The block supports an external power supply (VDDA) of 2.6 to 5.5 V
- The block supports a low voltage supply (VCCD) of 1.65 to 1.95 V
- The block operates within a junction temperature range of -40 to 100 °C
- The block provides a reference current for slow and fast modes of 2.27 to 2.52 µA
- The block generates a reference voltage for LDO of 1.00352 to 1.04448 V
- outputs a typical 2.45V voltage (DC.1) with a worst-case range of 2.41V to 2.49V (DC.2)
- outputs a maximum 3.6V voltage (DC.3) with a worst-case range of 3.55V to 3.67V
- has a step size of 80mV to 120mV for the LDO output (DC.6)
- has a step size of 9mV to 17mV for the LDO trim (DC.7)
- can deliver up to 3mA of output current (DC.8) with a digital output current capability of up to 1mA (DC.9)
- has a load regulation of 2.81mV/mA for VCCTS (DC.16) and 150mV/mA for VCCTS_D (DC.17)
- has a line regulation of 1.15%/V for VCCTS (DC.18) and VCCTS_D (DC.19)
- has a temperature coefficient of 200uV/C (DC.20)
- has a VDDA power good rising trip point of 1V to 1.5V (DC.21) and a falling trip point of 500mV to 1100mV (DC.26)
- has a VDDA/VDDD power good hysteresis of 100mV (DC.27)
- has a rising trip point for isolate_ahv of 450mV to 900mV (DC.23) and a falling trip point of 450mV to 900mV (DC.24)
- The block has a DC gain of the amplifier of 40 dB
- The block has a phase margin of the amplifier of 45 degrees
- The block has a gain margin of the amplifier of -12 dB
- The block has a PSRR at 1kHz for VCCTS of -20 dB
- The block has a PSRR at 10kHz for VCCTS of -20 dB
- The block has a PSRR at 100kHz for VCCTS of -20 dB
- The block has a PSRR at 1MHz for VCCTS of -20 dB
- The block has a PSRR at 10MHz for VCCTS of -20 dB
- The block has a PSRR at 100MHz for VCCTS of -20 dB
- The block has a PSRR at 1kHz for VCCTS_D of -20 dB
- The block has a PSRR at 10kHz for VCCTS_D of -20 dB
- The block has a PSRR at 100kHz for VCCTS_D of -20 dB
- The block has a PSRR at 1MHz for VCCTS_D of -20 dB
- The block has a PSRR at 10MHz for VCCTS_D of -20 dB
- The block has a PSRR at 100MHz for VCCTS_D of -20 dB
- The block has a VCCTS start-up time to 99% of final value of 15 us
- The block has a maximum output capacitance on VCCTS other than bypass cap of 400 nF
- The block has a Trise_isolate_ahv of 50 ns
- The block has a Tfall_isolate_ahv of 50 ns
- The block has a Trise_vdda_low_n of 5 ns
- The block has a Tfall_vdda_low_n of 5 ns

### Architecture

- block description
- truth tables
- block pin list
- timing requirements and diagrams
- block level interfaces
- reset and initialization
- interface to bus architectures
- test modes
- register definitions
- trim information
- power architecture and modes
- block derivative strategy
- block behavioral model requirements
- It includes a reference voltage output (vref_1v).
- It has a bypass capacitor block (CF_LDO_1V8_bypass_cap) with inputs cap_in and vssa.
- uses an N-type transistor as a series regulator in source follower configuration
- gate of the N-type driver is pumped to compensate for the Vtn drop from gate to source
- pumped voltage is filtered to approximately 5mV
- does not have the benefit of an external bypass capacitor
- Interface to this IP is in LV domain (VCCD and VCCDHIB). Control signals are level shifted to VDDA or VPUMP (internal pumped supply) inside the IP.
- ngate cap trim affects bandwidth, reducing load regulation while increasing PSRR at high frequencies
- The TSS operates only in the system power modes Active and Sleep (i.e. when the main regulators are on). The TSS itself has operating modes: Low Power, Ready and Sensing. There is no need to cut the power to the TSS by means of an in-line power switch. In addition to disabling the TSS with a control signal, the analog LDO can be turned off, substantially reducing leakage current (although increasing wake-up time). In a cell-phone application, the VDDA supply line will be shut off by the PMIC if ultra-low power consumption is required
- Simulations must be run with reference voltage circuit (or equivalent) and package parasitics
- All relevant transistors in deep inversion region need to be checked for subthreshold conditions
- All relevant transistors designed to operate in saturation region need to be checked for saturation margin
- Transistors in saturation region have a higher saturation margin to keep linearized model approximations valid
- Requires package parasitics to be implemented for all signals connected to external pads
- Must include external reference circuits for regulator operation if applicable
- Must analyze electromigration and power supply voltage drops prior to layout
- Must check for shielding, matching, supply connections, and proximity to noisy circuits like ESD diodes or IO circuits
- Must set certain options in the test stimulus file to address convergence issues when incorporating post layout extractions and package parasitics
- The block is an analog block toolkit.
- The block has a behavioral model that is verified by running mixed signal simulations and comparing to the schematic representation.
- No Laser/Metops part of the block
- Spare elements added as per analog layout best practices
- No ESD structures inside the block
- All high current nets analyzed for electromigration to meet 0.57mA/um at 100C for M1/M2
- The block is a low-dropout regulator (LDO) with a 1V8 reference voltage output.
- The block includes a bypass capacitor connection for stability.
- The block has a programmable configuration option via the 'prog' pin.
- The block supports a 2.5uA current source output through the 'isrc_2p5u' pin.
- The block has a reference voltage output of 1V8 via the 'vref_1v' pin.
- The block features a trim pin to adjust the reference voltage.
- The block includes multiple power and ground pins for different domains, such as vdda, vssa, vssd, vccts, vccts_d, vccd, and vcchib.
- The block has a DFT (Design for Test) pin for testing purposes.
- The block supports an enable pin for controlling the power mode.
- The block includes a system reset pin for active non-retention control.
- The block has a size of 270x270 um.
- The block has a size of 273.881x273.861 um.
- The block has a size of 193Ksq-um.
- The bypass cap has a size of 94.62x93.62=8858sq-um for 1 unit bypass cap.
- It has multiple power rails including vdda, vssd, vssa, vccd, vcchib, vccts, and vccts_d.
- It includes a bypass capacitor (s8ldo/s8ldo_bypass_cap) with cap_in connected to the LDO output and vssa as ground.
- It has a reference voltage input (vref_1v) and a reference current input (isrc_2p5u) for the LDO.
- It has a fine trim input (trim[3:0]) for voltage adjustment in +/-11mV steps.
- It has a bypass mode input (bypass) that when set to 1 bypasses the LDO output.
- It has a power-down input (pd) that when set to 1 powers down the LDO.
- It includes a dft control (dft[4:0]) for load control and dft mux control.
- It has a program voltage input (prog[3:0]) for output programming (2.4 - 3.6V).
- The block has a DC gain of the amplifier of 41.1 dB
- The block has a phase margin of the amplifier of 86.8 degrees
- The block has a gain margin of the amplifier of -46.3 dB
- The block has a PSRR at 1kHz for VCCTS of -51.9 dB
- The block has a PSRR at 10kHz for VCCTS of -50.3 dB
- The block has a PSRR at 100kHz for VCCTS of -41.8 dB
- The block has a PSRR at 1MHz for VCCTS of -24.4 dB
- The block has a PSRR at 10MHz for VCCTS of -22.3 dB
- The block has a PSRR at 100MHz for VCCTS of -23.2 dB
- The block has a PSRR at 1kHz for VCCTS_D of -43.1 dB
- The block has a PSRR at 10kHz for VCCTS_D of -42.5 dB
- The block has a PSRR at 100kHz for VCCTS_D of -39.2 dB
- The block has a PSRR at 1MHz for VCCTS_D of -24.1 dB
- The block has a PSRR at 10MHz for VCCTS_D of -23.5 dB
- The block has a PSRR at 100MHz for VCCTS_D of -27.7 dB
- The block has a VCCTS start-up time to 99% of final value of 14.8 us
- The block has a Trise_isolate_ahv of 6.8 ns
- The block has a Tfall_isolate_ahv of 9.1 ns
- The block has a Trise_vdda_low_n of 0.2 ns
- The block has a Tfall_vdda_low_n of 0.4 ns

### Variants

- CF_LDO_1V8
- CF_LDO_1V8_bypass_cap

## Block Diagram

No source-backed figure of this type was present.

## Pin Description

| Variant | Pin | Direction | Width | Active level | Domain | Description / constraints | Source |
|---|---|---|---:|---|---|---|---|
| All / unspecified | `vdda` | inout | 1 |  |  | VDDA will be set to 2.6V.  The high level was manually varied between 3.5V and 5.5V in order to pass through all voltage levels. The output must be loaded with 3mA load using DFT resistors. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vssa` | inout | 1 |  |  | A K-type thermocouple will be taped to the part’s socket and connected to a thermometer (Fluke 52 II) to accurately read the part’s environment temperature. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vref_1v` | output | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `bypass` | inout | 1 |  |  | The IP is placed inside a deep nwell, it must be assumed that deep nwell (DNW) is extended out to the boundary of the IP; the minimum DNW to DNW spacing must be observed at the boundary of the IP. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vdda_low_n` | inout | 1 |  |  | The IP will have sensitive blocks shielded with a metal 3 bus (connected to ground), therefore it is permissible to route over this IP. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vccts` | inout | 1 |  |  | External power clamps must be added to the VCCTS and VCCTS_D in the chip level, as there are no clamps within the IP.  VSSA must be used for VCCTS and VSSD must be used for VCCTS_D. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `dft` | inout | 1 |  |  | Metal 5 VDDA and VCCTS power busses needs to be connected to the pass element (ie they must not be only routed to block PR boundary). | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `isrc_2p5u` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `prog` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `trim` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `rst_system_act_nonret_n` | inout | 1 |  |  | Active low signal on the vcchib supply which indicates if the system is in reset, deep sleep or hibernate modes | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `pd` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vssd` | inout | 1 |  |  | VSSA must be used for VCCTS and VSSD must be used for VCCTS_D. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vccts_d` | inout | 1 |  |  | External power clamps must be added to the VCCTS and VCCTS_D in the chip level, as there are no clamps within the IP.  VSSA must be used for VCCTS and VSSD must be used for VCCTS_D. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vccd` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `vcchib` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `en_dft` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `isolate_ahv` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `ldo_dft_out` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `ldo_pwrmode` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| All / unspecified | `ldo_ngate_trim` | inout | 1 |  |  | The bandgap reference must be properly shielded for accurate operation. | [src-6795e94640f3a9db] [src-a272b7b79181b903] |
| `CF_LDO_1V8` | `vccts` | output | 1 |  |  | 2.3V to 3.6V with 100mV steps (there is one setting that sets the regulator output to 2.45V) | [src-6795e94640f3a9db] |
| `CF_LDO_1V8` | `vccts_d` | output | 1 |  |  | 2.3V to 3.6V with 100mV steps (there is one setting that sets the regulator output to 2.45V) | [src-6795e94640f3a9db] |
| `CF_LDO_1V8` | `prog` | input | 4 |  |  | 4 program bits.  Programmable range is from 2.3V to 3.6V with 100mV steps (there is one setting that sets the regulator output to 2.45V).  There is also 4-bits of trim provided.  Trim steps are 17mV (8 positive steps and 7 negative steps). | [src-6795e94640f3a9db] |
| `CF_LDO_1V8` | `trim` | input | 4 |  |  | 4-bit trim is used to trim the regulated output VCCTS as close to 2.45V (within +/-5.5mV) the mini-mod will have to be used for this trimming. Please note that table below assumes a typical trim step of 11mv but step size could be up to 17mV. | [src-6795e94640f3a9db] |
| `CF_LDO_1V8` | `vref_1v` | input | 60 |  |  | Analog line between reference system and LDO | [src-6795e94640f3a9db] |
| `CF_LDO_1V8` | `isrc_2p5u` | input | 60 |  |  | Analog line between reference system and LDO | [src-6795e94640f3a9db] |
| `CF_LDO_1V8_bypass_cap` | `cap_in` | input | 1 |  |  | Input of the bypass cap (output of the LDO) | [src-a272b7b79181b903] |
| `CF_LDO_1V8_bypass_cap` | `vssa` | input | 1 |  |  | Ground | [src-a272b7b79181b903] |

## Specifications

### Electrical

| Parameter | Symbol | Min | Typ | Max / Value | Unit | Conditions | Source |
|---|---|---:|---:|---:|---|---|---|
| Iout |  |  |  | 3mA |  |  | [src-6795e94640f3a9db] |
| PSRR |  |  | -20dB |  |  |  | [src-6795e94640f3a9db] |
| Vdd |  | 2.6V |  | 5.5V |  |  | [src-6795e94640f3a9db] |
| Vdrop |  | 100mV |  | 200mV |  |  | [src-6795e94640f3a9db] |
| Pd |  |  | 400uA | 450uA |  |  | [src-6795e94640f3a9db] |
| Vout |  | 2.3V |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| tstart |  |  |  | 15 us |  |  | [src-6795e94640f3a9db] |
| LoadReg |  |  |  | 2.81 mV/mA |  |  | [src-6795e94640f3a9db] |
| LineReg |  |  |  | 1.15%/V |  |  | [src-6795e94640f3a9db] |
| Output current |  |  |  | 3 mA |  |  | [src-6795e94640f3a9db] |
| PSRR 150mV @(0-100MHz) w 3mA load. |  |  |  | -20 dB |  |  | [src-6795e94640f3a9db] |
| Start-up time to 99% final voltage |  |  |  | 15 us |  |  | [src-6795e94640f3a9db] |
| Phase margin |  |  |  | 45 degrees |  |  | [src-6795e94640f3a9db] |
| Gain margin |  |  |  | 12 dB |  |  | [src-6795e94640f3a9db] |
| Active Power (Max estimate)@ Target Frequencies |  |  |  | 450uA |  |  | [src-6795e94640f3a9db] |
| DC Gain |  |  |  | 40dB |  |  | [src-6795e94640f3a9db] |
| Ripple (@100mV supply noise) |  |  |  | 10mV |  |  | [src-6795e94640f3a9db] |
| LDO program output range |  |  |  | 2.3-3.6V |  |  | [src-6795e94640f3a9db] |
| LDO Drop out Voltage |  |  |  | 150mV |  |  | [src-6795e94640f3a9db] |
| Line regulation |  |  |  | 1.15%V |  |  | [src-6795e94640f3a9db] |
| Load regulation + Ripple |  |  |  | 2.81mV/mA |  |  | [src-6795e94640f3a9db] |
| Vccts temperature coefficient |  |  |  | 60uV/C |  |  | [src-6795e94640f3a9db] |
| Simulation Temperature Range |  |  |  | -40C to 100C |  |  | [src-6795e94640f3a9db] |
| VDDA external Voltage range |  |  |  | 2.6-5.5V |  |  | [src-6795e94640f3a9db] |
| Output current (typ) |  |  |  | 3 mA |  |  | [src-6795e94640f3a9db] |
| Vccts |  |  |  | N/A | N/A |  | [src-6795e94640f3a9db] |
| Icc active |  |  |  | N/A | N/A |  | [src-6795e94640f3a9db] |
| vdda |  |  |  | 3-10V |  |  | [src-6795e94640f3a9db:p10] |
| output_voltage |  | 2.3V |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| trim_step |  | 17mV |  | 17mV |  |  | [src-6795e94640f3a9db] |
| trim_range |  | -5.5mV |  | 5.5mV |  |  | [src-6795e94640f3a9db] |
| inrush_current |  |  |  | 500mA |  |  | [src-6795e94640f3a9db] |
| ngate_cap_trim |  |  |  | 60pF |  |  | [src-6795e94640f3a9db] |
| dft |  |  |  | 250 |  |  | [src-6795e94640f3a9db] |
| electromigration requirement |  |  |  | 0.57mA/um | mA/um | at 100C; for M1/M2 | [src-6795e94640f3a9db] |
| load regulation |  |  |  | mV/mA | mV/mA |  | [src-6795e94640f3a9db] |
| Vccts_2p45_typ |  |  |  | 2.445 | V | ROOM temp | [src-a272b7b79181b903:p8] |
| Vccts_2p45_wc |  | 2.41 |  | 2.49 | V | various; Trim at room, and measure at cold/hot.  This spec includes BG, reference buffer and LDO errors. (2) Char data in QVR-317 | [src-a272b7b79181b903:p8] |
| Vccts_3p6_wc |  | 3.55 |  | 3.67 | V | various; Use the same trim that is done at 2.45V, room, and measure at cold/hot.  This spec includes BG, reference buffer and LDO errors. (2) Char data in QVR-317 | [src-a272b7b79181b903:p8] |
| Vccts_d_typ |  | 2.4 |  | 2.5 | V | various; Direct Measurement, | [src-a272b7b79181b903:p8] |
| Vccts_d_max |  | 3.5 |  | 3.7 | V | various; Direct Measurement, | [src-a272b7b79181b903:p8] |
| Prog step size |  | 80 |  | 120 | mV | various; Direct Measurement | [src-a272b7b79181b903:p8] |
| trim_step size |  | 9 |  | 17 | mV | varius; Direct Measurement (this is a bench measurement due to MGB being greater than variation).  Measure with a current load of 1.5mA | [src-a272b7b79181b903:p8] |
| Iout_vccts |  |  |  | 3 | mA | various; Indirect Measurement by monitoring current through VDDA supply (target spec is 3mA, we're capable of delivering 6-7mA with degraded PSRR) | [src-a272b7b79181b903:p8] |
| Iout_vccts_d |  |  |  | 1 | mA | various; Indirect Measurement by monitoring current through VDDA supply (target spec is 3mA, we're capable of delivering 6-7mA with degraded PSRR) | [src-a272b7b79181b903:p8] |
| I_active2p6norm |  |  |  | 342 | uA | 2.6/ff/100C; Direct Measurement | [src-a272b7b79181b903:p8] |
| I_active5p5norm |  |  |  | 380 | uA | 5.5/ff/100C; Direct Measurement | [src-a272b7b79181b903:p8] |
| I_active2p6low |  |  |  | 244 | uA | 2.6/ff/100C; Direct Measurement | [src-a272b7b79181b903:p8] |
| I_active5p5low |  |  |  | 274 | uA | 5.5/ff/100C; Direct Measurement | [src-a272b7b79181b903:p8] |
| I_leakage_max |  |  |  | 65 | nA | Leak, 100C; IP level leakage measurement is not possible at chip level | [src-a272b7b79181b903:p8] |
| I_leakage_typ |  |  |  | 7 | nA | tt_leak, 25C; IP level leakage measurement is not possible at chip level | [src-a272b7b79181b903:p8] |
| Ld_reg |  |  |  | 1.44 | mV/mA | LRHC SF 100; Direct Measurement,See the doc file. | [src-a272b7b79181b903:p8] |
| Ld_reg_d |  |  |  | 123.6 | mV/mA | LRHC SF 100; Direct Measurement (requires min 125uA load present,upto 1mA load) | [src-a272b7b79181b903:p8] |
| LN_reg |  |  |  | 0.21 | %/V | LRHC SF 100; Direct Measurement,See the doc file. | [src-a272b7b79181b903:p8] |
| Ct |  |  |  | 54 | uV/C | 2.6/LRHC/FS; Direct Measurement | [src-a272b7b79181b903:p8] |
| VDDA trip |  |  |  | 1.43 | V | Direct measurement,See the doc file. | [src-a272b7b79181b903:p8] |
| Vr_Isolate_ahv |  | 450 |  | 900 | mV | various | [src-a272b7b79181b903:p8] |
| Vf_isolate_ahv |  | 450 |  | 900 | mV | various | [src-a272b7b79181b903:p8] |
| VDDA trip |  | 500 |  | 1100 | mV | various | [src-a272b7b79181b903:p8] |
| Vmon hyst |  |  |  | 120 | mV | various | [src-a272b7b79181b903:p8] |
| Cbypass |  |  |  | 22.3 | pF | extRC | [src-a272b7b79181b903:p8] |

### Physical

| Parameter | Symbol | Min | Typ | Max / Value | Unit | Conditions | Source |
|---|---|---:|---:|---:|---|---|---|
| Area |  |  |  | 343,5ksq-um |  |  | [src-6795e94640f3a9db] |
| LDO core and bypass caps total area |  |  |  | 343,500 um2 |  |  | [src-6795e94640f3a9db] |
| Area/mA |  |  |  | 0.112 Kum2/mA |  |  | [src-6795e94640f3a9db] |
| total area of the LDO circuit and bypass caps |  |  |  | 343,500um^2 |  |  | [src-6795e94640f3a9db] |
| Block Size (um x um) |  |  |  | 270x270 |  |  | [src-a272b7b79181b903] |
| size of 1 unit bypass cap |  |  |  | *size of 1 unit bypass cap |  |  | [src-a272b7b79181b903] |
| bypass caps used for VCCTS |  |  |  | 13 |  |  | [src-a272b7b79181b903] |
| bypass caps used for VCCTS_D outputs |  |  |  | 4 |  |  | [src-a272b7b79181b903] |

### Power

| Parameter | Symbol | Min | Typ | Max / Value | Unit | Conditions | Source |
|---|---|---:|---:|---:|---|---|---|
| trim[3:0] |  |  |  | -44mV | mV | 0011; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | -33mV | mV | 0100; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | -22mV | mV | 0101; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | -11mV | mV | 0110; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | Default (prog) | mV | 0111; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +11mV | mV | 1000; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +22mV | mV | 1001; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +33mV | mV | 1010; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +44mV | mV | 1011; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +55mV | mV | 1100; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +66mV | mV | 1101; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +77mV | mV | 1110; trim[3:0] | [src-6795e94640f3a9db] |
| trim[3:0] |  |  |  | +88mV | mV | 1111; trim[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.30V | V | 0000; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.40V | V | 0001; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.45V (default) | V | 0010; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.50V | V | 0011; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.60V | V | 0100; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.70V | V | 0101; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.80V | V | 0110; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 2.90V | V | 0111; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 3.00V | V | 1000; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 3.10V | V | 1001; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 3.20V | V | 1010; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 3.30V | V | 1011; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 3.40V | V | 1100; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 3.50V | V | 1101; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | 3.60V | V | 1110; prog[3:0] | [src-6795e94640f3a9db] |
| prog[3:0] |  |  |  | n/a | V | 1111; prog[3:0] | [src-6795e94640f3a9db] |
| vccts |  |  |  | 2.3V to 3.6V | V | tss regulated; vccts | [src-6795e94640f3a9db] |
| vccts |  |  |  | 2.45V | V | default; vccts | [src-6795e94640f3a9db] |
| vccts |  |  |  | 150mV | mV | minimum drop out; vccts | [src-6795e94640f3a9db] |
| DFT mode enabled condition |  |  |  | dft_en must be high |  |  | [src-6795e94640f3a9db] |
| DFT controls independence |  |  |  | DFT controls <2:0> and <4:3> are independent of each other. |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 100 setting |  |  |  | 4004, 240A** |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 101 setting |  |  |  | 7993, 120A** |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 110 setting |  |  | 16016, 60A** | 16016, 60A** |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 111 setting |  |  | 32033, 30A** | 32033, 30A** |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 100 setting note |  |  |  | To save area, instead of resistors, current sinks are used for these settings. |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 101 setting note |  |  |  | To save area, instead of resistors, current sinks are used for these settings. |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 110 setting note |  |  |  | To save area, instead of resistors, current sinks are used for these settings. |  |  | [src-6795e94640f3a9db] |
| dft[2:0] 111 setting note |  |  |  | To save area, instead of resistors, current sinks are used for these settings. |  |  | [src-6795e94640f3a9db] |
| dft<4:3> 00 setting |  |  |  | SPARE, SPARE |  |  | [src-6795e94640f3a9db] |
| dft<4:3> 01 setting |  |  |  | clk by16 *, 0 - VCCD |  |  | [src-6795e94640f3a9db] |
| dft<4:3> 10 setting |  | 2.30 | 2.30 – 3.60v | 3.60 |  |  | [src-6795e94640f3a9db] |
| dft<4:3> 11 setting |  | 2.25 | 2.25 – 3.55v | 3.55 |  |  | [src-6795e94640f3a9db] |
| dft<4:3> 01 setting note |  |  |  | 1/16th of the oscillator frequency (of the local pump). |  |  | [src-6795e94640f3a9db] |
| LDO output in Sleep mode |  |  |  | shorted to ground through internal test resistors |  |  | [src-6795e94640f3a9db] |
| LDO output range for prog<3:0> bus |  | 2.3V |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| LDO trim step size for trim<3:0> bus |  |  |  | 11mV (typ) |  |  | [src-6795e94640f3a9db] |
| LDO test resistor load range |  |  |  | 75uA to 10mA (at 2.45V setting) |  |  | [src-6795e94640f3a9db] |
| LDO trim target voltage |  |  |  | 2.450V |  |  | [src-6795e94640f3a9db] |
| VDDA minimum |  |  |  | 2.6V | V | VDDA is greater than the minimum 2.6V | [src-6795e94640f3a9db] |
| VDDA maximum |  |  |  | 2.45V | V | to allow increase in SNR where VDDA is greater than the minimum 2.6V | [src-6795e94640f3a9db] |
| vdda connection metal width |  |  |  | 100um | um |  | [src-6795e94640f3a9db] |
| vdda connection IR drop |  |  |  | 5mV | mV |  | [src-6795e94640f3a9db] |
| LDO output metal width |  |  |  | 60um | um |  | [src-6795e94640f3a9db] |
| LDO output IR drop |  |  |  | <5mV | mV |  | [src-6795e94640f3a9db] |
| bypass caps for Vccts |  |  |  | 13 | bypass caps (s8ldo_bypass_cap) |  | [src-6795e94640f3a9db] |
| bypass caps for Vccts_d |  |  |  | 4 | bypass caps |  | [src-6795e94640f3a9db] |
| LDO placement from I/O injectors |  |  |  | 100um | um |  | [src-6795e94640f3a9db] |
| vref_1v shielding |  |  |  | fully shielded (cage) with the LDO local “vssa” |  |  | [src-6795e94640f3a9db] |
| isrc_2p5u shielding |  |  |  | fully shielded (cage) with the LDO local “vssa” |  |  | [src-6795e94640f3a9db] |
| IR drop |  |  |  | <5mV |  |  | [src-6795e94640f3a9db] |
| External Bypass Cap |  |  |  | 1uF |  |  | [src-6795e94640f3a9db] |
| Power Supply Reject 10 kHz |  |  |  | 70 dB |  |  | [src-6795e94640f3a9db] |
| Power Supply Reject 10Mhz |  |  |  | 25 dB |  |  | [src-6795e94640f3a9db] |
| Active Regulator Current |  |  |  | 50 uA |  |  | [src-6795e94640f3a9db] |
| sleep-by Current |  |  |  | 1u |  |  | [src-6795e94640f3a9db] |
| Load regulation |  |  |  | 200uV/mA* |  |  | [src-6795e94640f3a9db] |
| Line regulation |  |  |  | 200uV/V* |  |  | [src-6795e94640f3a9db] |
| Drop-out Voltage |  |  |  | 40 mV*** |  |  | [src-6795e94640f3a9db] |
| Accuracy |  |  |  | +/- 1% |  |  | [src-6795e94640f3a9db] |
| Start-up Time |  |  |  | 2 us |  |  | [src-6795e94640f3a9db] |
| VCC slow ramp rate |  |  |  | > 1ms |  |  | [src-6795e94640f3a9db] |
| transient load current spike |  |  |  | ~10ns |  |  | [src-6795e94640f3a9db] |
| VCC ramp up duration |  |  |  | sometime during the VCC ramp up |  |  | [src-6795e94640f3a9db] |
| PVT conditions |  | all process, voltage, and temperature variations |  |  |  |  | [src-6795e94640f3a9db] |
| voltage and temperature extreme conditions |  |  |  | obtained from the product VCC baseline specification |  |  | [src-6795e94640f3a9db] |
| voltage range |  | minimum | nominal | maximum |  |  | [src-6795e94640f3a9db] |
| voltage threshold |  | approximately a threshold voltage above ground |  |  |  |  | [src-6795e94640f3a9db] |
| leakage currents |  |  |  | leakage currents |  |  | [src-6795e94640f3a9db] |
| floating nodes |  |  |  | floating nodes |  |  | [src-6795e94640f3a9db] |
| VCC |  |  |  | VCC |  |  | [src-6795e94640f3a9db] |
| VSS |  |  |  | VSS |  |  | [src-6795e94640f3a9db] |
| regulator output |  |  |  | regulator output |  |  | [src-6795e94640f3a9db] |
| stability |  |  |  | stability |  |  | [src-6795e94640f3a9db] |
| PSRR |  |  |  | PSRR |  |  | [src-6795e94640f3a9db] |
| startup |  |  |  | startup |  |  | [src-6795e94640f3a9db] |
| powerup |  |  |  | powerup |  |  | [src-6795e94640f3a9db] |
| external resistor divider |  |  |  | external resistor divider |  |  | [src-6795e94640f3a9db] |
| external high impedance node |  |  |  | external high impedance node |  |  | [src-6795e94640f3a9db] |
| coupling effects between pins |  |  |  | coupling effects between pins |  |  | [src-6795e94640f3a9db] |
| bandgap reference |  |  |  | bandgap reference |  |  | [src-6795e94640f3a9db] |
| reference startup |  |  |  | reference startup |  |  | [src-6795e94640f3a9db] |
| overshoot |  |  |  | overshoot |  |  | [src-6795e94640f3a9db] |
| accuracy variations |  |  |  | accuracy variations |  |  | [src-6795e94640f3a9db] |
| electromigration |  |  |  | electromigration |  |  | [src-6795e94640f3a9db] |
| power supply voltage drops |  |  |  | power supply voltage drops |  |  | [src-6795e94640f3a9db] |
| shielding |  |  |  | shielding |  |  | [src-6795e94640f3a9db] |
| matching |  |  |  | matching |  |  | [src-6795e94640f3a9db] |
| supply connections |  |  |  | supply connections |  |  | [src-6795e94640f3a9db] |
| ESD diodes |  |  |  | ESD diodes |  |  | [src-6795e94640f3a9db] |
| IO circuits |  |  |  | IO circuits |  |  | [src-6795e94640f3a9db] |
| resistor ratio |  |  |  | resistor ratio |  |  | [src-6795e94640f3a9db] |
| two input transistors of an op amp |  |  |  | two input transistors of an op amp |  |  | [src-6795e94640f3a9db] |
| legs of a current mirror |  |  |  | legs of a current mirror |  |  | [src-6795e94640f3a9db] |
| Vccts_3p6_wc |  |  |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| Load regulation test conditions |  |  |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| Line regulation test conditions |  |  |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| VCCTS_D |  |  |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| VDDA power good rising trip point |  |  |  | 1.5V |  |  | [src-6795e94640f3a9db] |
| vdda |  |  |  | 1.8, 1.9, 2.0, 3.3, 4.0 and 5.6V | V | 1.8, 1.9, 2.0, 3.3, 4.0 and 5.6V | [src-6795e94640f3a9db:p31] |
| vdda |  |  |  | 2.6 and 5.5V | V | 2.6 and 5.5V | [src-6795e94640f3a9db:p31] |
| vdda |  |  |  | 2.6V | V | 2.6V | [src-6795e94640f3a9db:p31] |
| vccts |  |  |  | 2.45 and 3.6V | V | 2.45 and 3.6V | [src-6795e94640f3a9db:p31] |
| vccts |  |  |  | 2.45V | V | 2.45V | [src-6795e94640f3a9db:p31] |
| vccts |  |  |  | 3.6V | V | 3.6V | [src-6795e94640f3a9db:p31] |
| vdda |  |  |  | 3.75V | V | 3.75V | [src-6795e94640f3a9db:p31] |
| vccts |  |  |  | 2.3V to 3.6V | V | 2.3V to 3.6V | [src-6795e94640f3a9db:p31] |
| vdda |  |  |  | 2.6V |  |  | [src-6795e94640f3a9db:p33] |

### Other

| Parameter | Symbol | Min | Typ | Max / Value | Unit | Conditions | Source |
|---|---|---:|---:|---:|---|---|---|
| 4.4.3 |  |  |  | DC Specifications and Production Test |  |  | [src-6795e94640f3a9db] |
| 4.4.4 |  |  |  | AC Specifications and Production Test |  |  | [src-6795e94640f3a9db] |
| 4.4.5 |  |  |  | EROS Specification Compliance |  |  | [src-6795e94640f3a9db] |
| 4.5 |  |  |  | IP Integration Information |  |  | [src-6795e94640f3a9db] |
| 4.5.1 |  |  |  | Known Integration Targets |  |  | [src-6795e94640f3a9db] |
| 4.5.2 |  |  |  | Prerequisite IP |  |  | [src-6795e94640f3a9db] |
| 4.5.3 |  |  |  | Additional requirements |  |  | [src-6795e94640f3a9db] |
| DDC Name |  |  |  | S8LDO |  |  | [src-6795e94640f3a9db] |
| IP (Hard/Soft/Firm)/Category/COE |  |  |  | Hard |  |  | [src-6795e94640f3a9db] |
| IP Owner (init) |  |  |  | QSI, ENH, JSSJ |  |  | [src-6795e94640f3a9db] |
| Customer, Lead Product PM (init) |  |  |  | TIW |  |  | [src-6795e94640f3a9db] |
| CIC Lead (init) |  |  |  | GHOS |  |  | [src-6795e94640f3a9db] |
| IP Librarian (init):: |  |  |  | JFE |  |  | [src-6795e94640f3a9db] |
| COE Lead (init) |  |  |  | JJS |  |  | [src-6795e94640f3a9db] |

### Accuracy

| Parameter | Symbol | Min | Typ | Max / Value | Unit | Conditions | Source |
|---|---|---:|---:|---:|---|---|---|
| Gain |  |  |  | not specified in evidence |  |  | [src-6795e94640f3a9db] |
| Gain Bandwidth |  |  |  | not specified in evidence |  |  | [src-6795e94640f3a9db] |
| Phase Margin |  |  |  | not specified in evidence |  |  | [src-6795e94640f3a9db] |
| Gain Margin |  |  |  | not specified in evidence |  |  | [src-6795e94640f3a9db] |
| open loop gain |  |  |  | not specified in evidence |  |  | [src-6795e94640f3a9db] |
| bandwidth |  |  |  | not specified in evidence |  |  | [src-6795e94640f3a9db] |
| PSRR |  |  |  | not specified in evidence |  |  | [src-6795e94640f3a9db] |
| DC gain of the amplifier |  |  |  | 40 |  |  | [src-a272b7b79181b903] |
| Phase margin of the amplifier |  |  |  | 45 |  |  | [src-a272b7b79181b903] |
| Gain margin of the amplifier |  |  |  | -12 |  |  | [src-a272b7b79181b903] |
| PSRR at 1kHz for VCCTS |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 10kHz for VCCTS |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 100kHz for VCCTS |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 1MHz for VCCTS |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 10MHz for VCCTS |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 100MHz for VCCTS |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 1kHz for VCCTS_D |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 10kHz for VCCTS_D |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 100kHz for VCCTS_D |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 1MHz for VCCTS_D |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 10MHz for VCCTS_D |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| PSRR at 100MHz for VCCTS_D |  |  |  | -20 |  |  | [src-a272b7b79181b903] |
| VCCTS Start-up time to 99% of final value (BG buffer started at the same time) |  |  |  | 14.8 |  |  | [src-a272b7b79181b903] |
| VCCTS Start-up time to 99% of final value (BG buffer started 5us before) |  |  |  | 10.3 |  |  | [src-a272b7b79181b903] |
| Max output capacitance on VCCTS other than bypass cap. |  |  |  | 400 |  |  | [src-a272b7b79181b903] |
| Trise_isolate_ahv (Rise time for isolate_ahv output) |  |  |  | 27.7 |  |  | [src-a272b7b79181b903] |
| Tfall_isolate_ahv (Fall time for isolate_ahv output) |  |  |  | 44.5 |  |  | [src-a272b7b79181b903] |
| Trise_vdda_low_n (Rise time for vdda_low_n output) |  |  |  | 1.2 |  |  | [src-a272b7b79181b903] |
| Tfall_vdda_low_n (Fall time for vdda_low_n output) |  |  |  | 6.2 |  |  | [src-a272b7b79181b903] |

### Operating Condition

| Parameter | Symbol | Min | Typ | Max / Value | Unit | Conditions | Source |
|---|---|---:|---:|---:|---|---|---|
| active mode |  |  |  | active mode |  |  | [src-6795e94640f3a9db] |
| standby mode |  |  |  | standby mode |  |  | [src-6795e94640f3a9db] |
| bond wire |  |  |  | bond wire |  |  | [src-6795e94640f3a9db] |
| package parasitics |  |  |  | package parasitics |  |  | [src-6795e94640f3a9db] |
| transient simulations |  |  |  | transient simulations |  |  | [src-6795e94640f3a9db] |
| post layout extractions |  |  |  | post layout extractions |  |  | [src-6795e94640f3a9db] |
| package parasitics (RLC) |  |  |  | package parasitics (RLC) |  |  | [src-6795e94640f3a9db] |
| convergence issues |  |  |  | convergence issues |  |  | [src-6795e94640f3a9db] |
| test temperatures |  |  |  | -40ºC, 25ºC, 100ºC |  |  | [src-6795e94640f3a9db] |
| voltage supply drop |  |  |  | 0V to 1.6V |  |  | [src-6795e94640f3a9db] |
| VDDA values |  |  |  | 2.6V, 3.75, 5.5V |  |  | [src-6795e94640f3a9db] |
| 3mA load |  |  |  | 3mA |  |  | [src-6795e94640f3a9db] |
| voltage supply increase |  |  |  | 3V to 5.5V |  |  | [src-6795e94640f3a9db] |
| LDO output voltage range |  | 2.35V |  | 3.6V |  |  | [src-6795e94640f3a9db] |
| LDO trim voltage |  |  |  | 2.45V |  |  | [src-6795e94640f3a9db] |
| LDO low voltage detect threshold |  |  |  | LVD trips |  |  | [src-6795e94640f3a9db] |
| vpwre |  |  |  | 2.6 | V | min; 2.6;5.5;V | [src-a272b7b79181b903] |
| vpwre |  |  |  | 5.5 | V | max; 2.6;5.5;V | [src-a272b7b79181b903] |
| vpwr |  |  |  | 1.65 | V | min; 1.65;1.95;V | [src-a272b7b79181b903] |
| vpwr |  |  |  | 1.95 | V | max; 1.65;1.95;V | [src-a272b7b79181b903] |
| Temp_i |  |  |  | -40 | oC | min; -40;100;oC | [src-a272b7b79181b903] |
| Temp_i |  |  |  | 100 | oC | max; -40;100;oC | [src-a272b7b79181b903] |
| Iref |  |  |  | 2.27 | uA | min; 2.27;2.52;uA | [src-a272b7b79181b903] |
| Iref |  |  |  | 2.52 | uA | max; 2.27;2.52;uA | [src-a272b7b79181b903] |
| Vref |  |  |  | 1.00352 | V | min; 1.00352;1.04448;V | [src-a272b7b79181b903] |
| Vref |  |  |  | 1.04448 | V | max; 1.00352;1.04448;V | [src-a272b7b79181b903] |

### Timing

| Parameter | Symbol | Min | Typ | Max / Value | Unit | Conditions | Source |
|---|---|---:|---:|---:|---|---|---|
| 99% Vccts output |  |  |  | 99% |  |  | [src-6795e94640f3a9db] |

### Operating Modes and Sequences

#### bypass

It can also be bypassed. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### Power Modes

Active, sleep, bypass [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS1

Level BROS [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS2

Level BROS update [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS3

Level BROS update [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS4

CHAR data [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### bypass

bypassed, or disabled if desired [src-6795e94640f3a9db:p10]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- The block can be bypassed, or disabled if desired.

#### regulation

500mA peak current spec. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### trim[3:0]

Default (prog) [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### pd

1
0
X
X
Sleep mode: Amplifier is off vccts and vccts_d are allowed to float. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### pd

1
1
X
X
Bypass mode.  Amplifier in sleep, vccts = vccts_d = VDDA. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### pd

0
X
0
0
Active – normal [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### pd

0
X
1
0
Active – low power [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### pd

0
X
X
1
DFT mode (active mode) [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft[2:0] 100

100
4004
240A** [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft[2:0] 101

101
7993
120A** [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft[2:0] 110

110
16016
60A** [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft[2:0] 111

111
32033
30A** [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft<4:3> 00

00
SPARE
SPARE [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft<4:3> 01

01
clk by16 *
0 - VCCD [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft<4:3> 10

10
Vccts
2.30 – 3.60v [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft<4:3> 11

11
Vccts d
2.25 – 3.55v [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### dft_en high

In order for DFT mode to be enabled, dft_en must be high. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### TSS operating modes

Low Power, Ready and Sensing [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### TSS power modes

Active and Sleep [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO power mode behavior

In a cell-phone application, the VDDA supply line will be shut off by the PMIC if ultra-low power consumption is required.  The LDO can be bypassed if desired. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO bypass option

The LDO can be bypassed if desired. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO test resistor load

this will allow simple and fast testing of line and load regulation tests. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO output observable

The output of the LDO, Vccts and vccts_d, will be routed to the touch screen DFT muxes (refer to ink#164), making the regulator outputs observable. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO power good monitor

The output of the power good monitor is registered, and can also be observed. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### TSS disable method

In addition to disabling the TSS with a control signal, the analog LDO can be turned off, substantially reducing leakage current (although increasing wake-up time). [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO output shorting in Sleep mode

In the Sleep mode, the output of the LDO can be shorted to ground through internal test resistors. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO trim range

The trim<3:0> bus is used as part of the production trim procedure, the regulator is trimmed as close to 2.450V as possible, this way any variation seen in the users output programmability, is seen at the higher end of the program range where it will not matter. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO prog range

The prog<3:0> bus is used by the user/customer to program the output of the regulator from 2.3V to 3.6V in increments of 100mV (expect for a special setting [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO trim step size

The step size for the trim is 11mV (typ). [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO test resistor load

this will allow simple and fast testing of line and load regulation tests. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO bypass option

The LDO can be bypassed if desired. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO power good monitor

The output of the power good monitor is registered, and can also be observed. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### TSS disable method

In addition to disabling the TSS with a control signal, the analog LDO can be turned off, substantially reducing leakage current (although increasing wake-up time). [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO output shorting in Sleep mode

In the Sleep mode, the output of the LDO can be shorted to ground through internal test resistors. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO trim range

The trim<3:0> bus is used as part of the production trim procedure, the regulator is trimmed as close to 2.450V as possible, this way any variation seen in the users output programmability, is seen at the higher end of the program range where it will not matter. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO prog range

The prog<3:0> bus is used by the user/customer to program the output of the regulator from 2.3V to 3.6V in increments of 100mV (expect for a special setting [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO trim step size

The step size for the trim is 11mV (typ). [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### 4.4.3

DC Specifications and Production Test [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### 4.4.4

AC Specifications and Production Test [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### 4.4.5

EROS Specification Compliance [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### 4.5

IP Integration Information [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### 4.5.1

Known Integration Targets [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### 4.5.2

Prerequisite IP [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### 4.5.3

Additional requirements [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### Active

LDO will be active/bypassed for active and sleep modes. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### Hibernate

LDO is off for hibernate and deep sleeps modes. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### AC Simulations

Gain, Gain Bandwidth, Phase Margin, Gain Margin [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### AC Power Supply Rejection Ratio Simulations

Power supply rejection ratio (PSRR) simulations are required to determine the impact of power supply noise on the output of the regulator over all process, voltage, temperature, and output load current and capacitance variations. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### DC Operating Point Simulations

N/A [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### VCC slow ramp rate with maximum load current

VCC slow ramp rate of > 1ms with a load current equal to its maximum spec value at the stable regulated voltage [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### VCC slow ramp rate with transient load current spike

slow VCC ramp rate >1ms with a very large fast (~10ns) transient load current spike (~3x maximum spec load current). [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### VCC stable to active mode transition

stable VCC with the regulator disabled going to an active state (standby to active mode) [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### VCC slow ramp rate with mismatch

device mismatch implementation of matched devices for determining if Meta stable states exist as well as startup failure problems due to mismatch [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### PVT extreme conditions

extreme PVT conditions with relaxed specifications [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### power supply bobble

power supply bobble on the output of the regulator [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### power supply brownout

power supply brownout on the output of the regulator [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### active

most regulators have more than one mode of operation. for example, you may have an active mode, hibernate mode (low power mode) and standby mode. the effect of transition from one mode to the other, standby to active or active to standby, specifically, must be observed and analyzed to insure proper functionality occurs and unwanted overshoots and undershoots are eliminated. these simulations must be performed over all process, voltage and temperature conditions. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### hibernate

most regulators have more than one mode of operation. for example, you may have an active mode, hibernate mode (low power mode) and standby mode. the effect of transition from one mode to the other, standby to active or active to standby, specifically, must be observed and analyzed to insure proper functionality occurs and unwanted overshoots and undershoots are eliminated. these simulations must be performed over all process, voltage and temperature conditions. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### standby

most regulators have more than one mode of operation. for example, you may have an active mode, hibernate mode (low power mode) and standby mode. the effect of transition from one mode to the other, standby to active or active to standby, specifically, must be observed and analyzed to insure proper functionality occurs and unwanted overshoots and undershoots are eliminated. these simulations must be performed over all process, voltage and temperature conditions. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### active mode

Most simulations usually consist of the regulator operating in an active mode,  [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### standby mode

in standby mode where the regulator is considered off, there are still leakage currents, which become significant in low power applications and must be minimized during this particular mode. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### transient simulations

All transient simulations must be run with these package parasitics included. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### post layout extractions

When incorporating post layout extractions and/or package parasitics (RLC), convergence issues are somewhat common and need certain .options set in the test stimulus file. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### matching

Analog circuits often depend on two or more components being matched, for example a resistor ratio, the two input transistors of an op amp or the legs of a current mirror. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

ac [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

dc [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

bobble [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

brown [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

transient [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

monte [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

quality [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### S8LDO

X [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### regulation characterization

Line and Load regulation characterization [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### VDDA power good rising trip point

The output of VDDA monitor circuit should toggle latest by VDDA=1.5V. The output can be read from the LDO_CONFIG register (Bit 28, address= 0x401100C4), VDDA is present if this register has “1” in it. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### program

1.8, 1.9, 2.0, 3.3, 4.0 and 5.6V [src-6795e94640f3a9db:p31]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### trim

2.45V [src-6795e94640f3a9db:p31]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### trim

3.6V [src-6795e94640f3a9db:p31]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### program

2.3V to 3.6V [src-6795e94640f3a9db:p31]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### program

3.75V [src-6795e94640f3a9db:p31]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### Brown-out

the voltage supply will be dropped from the nominal voltage to a very low level which is varied between 0V and 1.6V. During this time the output of the regulator needs to be monitored to see if it is recovering after every voltage supply drop. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### Bobble

the voltage supply will be dropped from the nominal voltage to a very high level which is varied between 3V and 5.5V. During this time the output of the regulator needs to be monitored to see if it is recovering after every voltage supply increase. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### test

A Precision Temperature Forcing Unit (T2420) will be used to test across three different temperatures (-40ºC, 25ºC and 100ºC). A K-type thermocouple will be taped to the part’s socket and connected to a thermometer (Fluke 52 II) to accurately read the part’s environment temperature. [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO line regulation

Line regulation with min/max DFT load [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### LDO load regulation

Load regulation with min/max DFT load [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### AIP 4.0 compatible

IP is now AIP 4.0 compatible [src-6795e94640f3a9db]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- No change to BROS .doc or any specs or sim results.

#### BROS **

BROS ** [src-a272b7b79181b903]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS1

IPS1 [src-a272b7b79181b903]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS2

IPS2 [src-a272b7b79181b903]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS3

IPS3 [src-a272b7b79181b903]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### IPS4

IPS4 [src-a272b7b79181b903]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### normal mode

Active current cons at 2.6V supply, normal mode [src-a272b7b79181b903:p8]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### low power mode

Active current cons at 2.6V supply, low power mode [src-a272b7b79181b903:p8]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.

#### low power mode

Active current cons at 5.5V supply, low power mode [src-a272b7b79181b903:p8]

**Entry conditions**
- None stated.

**Behavior**
- None stated.

**Exit conditions**
- None stated.


### Integration Requirements

- general integration requirements
- package requirements
- timing constraints
- Requires digital control signals at LV Vccd or Vcchib level
- This block will be fully testable.  The output of the LDO, Vccts and vccts_d, will be routed to the touch screen DFT muxes (refer to ink#164), making the regulator outputs observable. The output of the power good monitor is registered, and can also be observed.  There will be test resistors, which can load the output of the regulator from 75uA to 10mA (at 2.45V setting) with various sizes resistors; this will allow simple and fast testing of line and load regulation tests
- The block must be placed more than 100um away from I/O injectors.
- The external Vdda connection must use a 100um wide metal-5 power bus.
- The LDO output must be routed to the Touch Screen Sub-System using a 60um wide metal-5 power bus.
- Thirteen bypass caps for Vccts and four for Vccts_d are required.
- No other block is allowed to connect to the LDO Power bus.
- The analog line vref_1v must be fully shielded with the LDO local vssa.
- The analog line isrc_2p5u must be fully shielded with the LDO local vssa.
- sensitive blocks shielded with a metal 3 bus connected to ground
- IP placed inside a deep nwell with DNW extended to IP boundary
- metal 5 VDDA and VCCTS power busses connected to the pass element
- external power clamps added to VCCTS and VCCTS_D at chip level using VSSA and VSSD
- IR drop from Vdda pin to block must be very low <5mV
- IR drop from IP block to TSS must be very low <5mV
- bandgap reference must be properly shielded for accurate operation
- The block has a DDC name of s8ldo.
- The block has a library name of s8ldo.
- The block has a PM ID of 68426.
- The block is integrated with known targets including M0S8 Gen4 Touch Screen.
- The block requires scs8hvla, scs8lsa, and s8rf as prerequisite IP.
- The block has no additional requirements.
- Must be performed over all process, voltage, temperature and load conditions
- Must be performed over all process, voltage, temperature and load variations
- Must run all transient simulations with package parasitics included
- Must include coupling effects between pins if external components are used
- Must realize regulator simulations with external reference circuit in place if used
- Must analyze for electromigration and power supply voltage drops prior to layout
- Must check for shielding, matching, supply connections and proximity to noisy circuits like ESD diodes or IO circuits
- The block is used in test benches for various simulation types including AC, DC, transient, and Monte Carlo.
- Requires ESD clamps on outputs Vccts and Vccts_d to all other regulated supplies
- Uses Cypress standard verification flow
- Simulation results referenced in ENH#074, ENH#075, ENH#076, ENH#085, ENH#087, ENH#089
- The block requires trimming of the Bandgap to 1.024V and the reference current to 2.4uA before any characterization.
- The block is tested under specific conditions: supply external voltages of 2.6V and 5.5V and supply current load of 3 mA using DFT resistor loads.
- Part must be trimmed at room temperature
- Part must be trimmed to bring LDO output as close to 3.6V as possible for some tests
- Part must be trimmed to give either 2.45V or 3.6V output for other tests
- A Precision Temperature Forcing Unit (T2420) is used to test across three different temperatures (-40ºC, 25ºC and 100ºC). A K-type thermocouple is taped to the part’s socket and connected to a thermometer (Fluke 52 II) to accurately read the part’s environment temperature.
- The LDO output must be routed through the TS subsystem DFT muxes and directly observed
- The block requires a bypass capacitor connected to the 'bypass' pin for stability.
- The block must be connected to the appropriate power and ground domains (vdda, vssa, vssd, vccts, vccts_d, vccd, vcchib) as specified in the pin list.
- The block may require a reference voltage input for the 'vref_1v' pin.
- The block includes a DFT pin for testing, which may need to be connected to a test circuit.
- The block has a 'pd' pin for power down control, which must be driven to the appropriate state for shutdown operation.
- It requires a reference voltage (vref_1v) and a reference current (isrc_2p5u) for proper operation.
- It requires a power-down signal (pd) and a bypass signal (bypass) to control operational modes.
- It requires a reset signal (rst_system_act_nonret_n) indicating system reset, deep sleep, or hibernate modes.
- It has an output (vdda_low_n) for VDDA power good monitor on Vcchib.
- It has an output (isolate_ahv) for VDDD power good monitor on VDDA.
- It includes a DFT output (ldo_dft_out) for testing.
- The block requires an external power supply (VDDA) of 2.6 to 5.5 V
- The block requires a low voltage supply (VCCD) of 1.65 to 1.95 V
- The block requires a junction temperature range of -40 to 100 °C
- The block requires a bypass capacitor for VCCTS output

## Timing Diagram

No source-backed figure of this type was present.

## Limitations and Open Issues

- in bypass mode, VDDA must be limited to 3.6V
- The LDO regulator does not require any in-rush current control during initial system startup as the Current spike is well within the 500mA peak current spec.
- The block requires a minimum of 150mV drop out to meet PSRR and load regulation specifications.
- ngate cap has less effect on frequencies 1MHz and lower
- PSRR and load regulation values are measured under specific conditions: Vdda=2.65±50mVpp @10MHz, Vccts=2.45V for PSRR; Vdda=2.6V, Vccts=2.45V, 1mA load change to 1125uA from 125uA for load regulation
- DFT controls dft[2:0] and dft<4:3> are independent of each other
- To save area, current sinks are used instead of resistors for DFT settings
- M0S8 platform does not apply PVT compensation; Bulk pins have not been separated
- DFT mode requires dft_en to be high
- No timing requirements for this IP block
- DFT output options include clk_by16 as 1/16th of the oscillator frequency (of the local pump) and Vccts and Vccts_d at specific supply ranges, 2.30 – 3.60v and 2.25 – 3.55v respectively.
- This is a low level IP; there is no standard interface for bus architectures
- The LDO can be bypassed if desired
- It is expressly forbidden for any block not defined in this BROS to use any output of the s8ldo regulator.
- no specific timing constraints for this block
- no bus interface physical interface requirements
- The LDO is off for hibernate and deep sleep modes and active/bypassed for active and sleep modes
- PSRR is very poor
- AC simulations must be performed over all process, voltage, temperature and load conditions
- PSRR simulations must be performed over all process, voltage, temperature and load variations
- Must be performed over all process, voltage, temperature and load conditions
- Temperature coefficient simulations are only performed when a positive or negative temperature coefficient is required for the output of the regulator.
- simulations must be performed over all process, voltage, and temperature variations
- Monte Carlo simulations must be performed using nominal process (TT), over voltage and temperature range
- voltage and temperature extreme conditions to be obtained from product VCC baseline specification with help from appropriate product engineers
- power supply is bobbled for all conditions between minimum, maximum and nominal and regulator output observed for any weird, unstable behavior
- power supply to regulator brought down from min, max, nom to approximately a threshold voltage above ground and then brought back to min, max, nom, with output settling back to regulated voltage in startup time with such power supply noise conditions
- voltage and temperature extreme conditions will need to be obtained from the product VCC baseline specification with help from the appropriate product engineers
- power supply to the regulator is brought down from min, max, nom to approximately a threshold voltage above ground and then brought back to min, max, nom. The output of the regulator must settle back to its regulated voltage in a startup time with such power supply noise conditions.
- Simulations must be performed over all process, temperature, and load variations
- Simulations must be performed over all process, voltage and temperature conditions
- Simulations must be monitored for all DC operating point simulations, including Monte Carlo analysis
- Nanosim simulations must be completed to check for any unexpected floating nodes or DC paths in the circuit
- Stress checks require simulations for gate oxide stress, junction stress or other relevant technology limits for proper reliability
- Transient standb  y-to-active and active-to-standby transitions must be observed and analyzed to insure proper functionality occurs and unwanted overshoots and undershoots are eliminated
- Transistor gate overdrive margin needs to be quantified because the lower the gate overdrive margin, the higher will be the accuracy hit due to mismatches
- A higher saturation margin also means that all approximations for linearized model of transistors assumed during the design stage will remain valid and applicable
- The lower the saturation margin, the higher the probability that the open loop gain of the amplifier will start to crater at some corner
- All relevant transistors meant to be in deep inversion region need to be checked for subthreshold conditions
- All relevant transistors that are designed to operate in the saturation region need to be checked for saturation margin
- Simulations must be run in order to check the transistors gate oxide stress, junction stress or other relevant technology limits for proper reliability
- Leakage currents become significant in low power applications and must be minimized in standby mode
- Package parasitics can have detrimental effects on stability, PSRR and startup/powerup conditions
- Convergence issues are somewhat common when incorporating post layout extractions and package parasitics and require certain .options set in the test stimulus file
- Real world devices on silicon will never be perfectly matched, impacting overall circuit performance
- The block is an analog block toolkit and LEC (Logic Equivalency Checking) is not possible.
- Output Vccts and Vccts_d must have ESD clamps to all other regulated supplies
- All high current nets must meet 0.57mA/um for M1/M2 at 100C for electromigration
- The block must be trimmed to bring LDO output as close to 2.45V as possible for production test DC.2: Vccts_2p45_wc.
- Load regulation is measured with change in output voltage divided by change in load current
- Line regulation is measured with change in output voltage divided by change in power supply
- VCCTS and VCCTS_D output voltages are either 2.45V or 3.6V
- VCCTS_D output voltages are either 2.45V or 3.6V
- The low voltage detect can be observed by reading LDO_CONFIG register (Bit 28, address=0x401100C4), where VDDA presence is indicated by a "1" in that bit.
- The block's reference voltage output is fixed at 1V8 and may not be adjustable without the trim pin.
- The block has a 2.5uA current source output that is fixed and not adjustable.
- The block requires specific power and ground domains (vdda, vssa, vssd, vccts, vccts_d, vccd, vcchib) for proper operation.
- The block includes a DFT pin that is intended for test purposes and may not be used in normal operation.
- The block has multiple pins for different functions (e.g., 'isolate_ahv', 'ldo_dft_out', 'ldo_pwrmode', 'ldo_ngate_trim') that may require specific handling during integration.
- In Gen4, 13 bypass caps are used for VCCTS and 4 bypass caps are used for VCCTS_D outputs.
- The reference voltage (vref_1v) and reference current (isrc_2p5u) inputs are Hi-Z when not in use.
- The bypass mode input (bypass) is SCTP:1 when not in use.
- The power-down input (pd) is SCTP:1 when not in use.
- The dft control (dft[4:0]) is 0 when not in use.
- The program voltage input (prog[3:0]) is 0 when not in use.
- The en_dft input is 0 when not in use.
- The ldo_pwrmode and ldo_ngate_trim inputs are X when not in use.
- The ldo_dft_out output is Hi-Z when not in use.
- The block must operate within a junction temperature range of -40 to 100 °C
- The block must have an external power supply (VDDA) of 2.6 to 5.5 V
- The block must have a low voltage supply (VCCD) of 1.65 to 1.95 V
- The block must have a reference current for slow and fast modes of 2.27 to 2.52 µA
- The block must generate a reference voltage for LDO of 1.00352 to 1.04448 V
- load regulation requires a minimum 125uA load present (DC.17) and must settle to 2.81mV in 800ns for a 1mA load change (DC.16)
- the LDO must be trimmed using minimod which is sub 1mV accurate (1)
- the spec includes variations from all error sources: BG variation, BG temp-co, Reference Buffer offset, Reference buffer temp-co, LDO variations and temp-co (2)
- IP level leakage measurement is not possible at chip level (DC.14, DC.15)
- load regulation will be tested by applying built in load resistors to the output of the regulator (3)
- PSRR at 100 MHz for VCCTS and VCCTS_D cannot be measured at chip level due to noise coupling issues
- VCCTS start-up time measurements are not possible at chip level
- PSRR for VCCTS is worst-case at maximum load of 3mA, improving for lower current
- Measurement of PSRR at 100 MHz is not possible at chip level because injected noise to VDDA couples to VDDD and subsequently to IO, overwhelming the noise to be measured in LDO output
- **ERROR — vref_1v:** Conflicting pin definition: output[1] vs inout[1] [src-6795e94640f3a9db]
- **ERROR — vdda_low_n:** Conflicting pin definition: inout[1] vs output[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vccts:** Conflicting pin definition: inout[1] vs output[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — bypass:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — dft:** Conflicting pin definition: inout[1] vs input[5] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — isrc_2p5u:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — prog:** Conflicting pin definition: inout[1] vs input[4] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — trim:** Conflicting pin definition: inout[1] vs input[4] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — rst_system_act_nonret_n:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vdda:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — pd:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vref_1v:** Conflicting pin definition: output[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vssa:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vssd:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vccts_d:** Conflicting pin definition: inout[1] vs output[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vccd:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vcchib:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — en_dft:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — isolate_ahv:** Conflicting pin definition: inout[1] vs output[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — ldo_dft_out:** Conflicting pin definition: inout[1] vs output[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — ldo_pwrmode:** Conflicting pin definition: inout[1] vs input[1] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — ldo_ngate_trim:** Conflicting pin definition: inout[1] vs input[2] [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — vdda:** Conflicting values (None, None, None, '3-10V', None) vs (None, None, None, '2.6-5.5V', None) [src-6795e94640f3a9db:p10]
- **ERROR — trim_step:** Conflicting values ('17mV', None, None, '17mV', None) vs ('11mV', None, '17mV', None, None) [src-6795e94640f3a9db]
- **ERROR — ngate_cap_trim:** Conflicting values (None, None, None, '60pF', None) vs (None, None, None, '75pF', None) [src-6795e94640f3a9db]
- **ERROR — ngate_cap_trim:** Conflicting values (None, None, None, '60pF', None) vs (None, None, None, '90pF', None) [src-6795e94640f3a9db]
- **ERROR — dft:** Conflicting values (None, None, None, '250\uf057', None) vs (None, None, None, '499\uf057', None) [src-6795e94640f3a9db]
- **ERROR — dft:** Conflicting values (None, None, None, '250\uf057', None) vs (None, None, None, '997\uf057', None) [src-6795e94640f3a9db]
- **ERROR — dft:** Conflicting values (None, None, None, '250\uf057', None) vs (None, None, None, '2003\uf057', None) [src-6795e94640f3a9db]
- **ERROR — Area:** Conflicting values (None, None, None, '343,5ksq-um', None) vs (None, None, None, '16.1 Kum2', None) [src-6795e94640f3a9db]
- **ERROR — VCC slow ramp rate:** Conflicting values (None, None, None, '> 1ms', None) vs (None, None, None, '>1ms', None) [src-6795e94640f3a9db]
- **ERROR — transient load current spike:** Conflicting values (None, None, None, '~10ns', None) vs (None, None, None, '~3x maximum spec load current', None) [src-6795e94640f3a9db]
- **ERROR — voltage range:** Conflicting values ('minimum', 'nominal', 'maximum', None, None) vs ('min', 'nom', 'max', None, None) [src-6795e94640f3a9db]
- **ERROR — line regulation:** Conflicting values (None, None, None, '1.15%V', None) vs (None, None, None, 'mv/V', 'mv/V') [src-6795e94640f3a9db]
- **ERROR — Load regulation:** Conflicting values (None, None, None, '200uV/mA*', None) vs (None, None, None, '3.6V', None) [src-6795e94640f3a9db]
- **ERROR — Line regulation:** Conflicting values (None, None, None, '200uV/V*', None) vs (None, None, None, '3.6V', None) [src-6795e94640f3a9db]
- **ERROR — Load regulation:** Conflicting values (None, None, None, '200uV/mA*', None) vs (None, None, None, '3.6V', None) [src-6795e94640f3a9db]
- **ERROR — Line regulation:** Conflicting values (None, None, None, '200uV/V*', None) vs (None, None, None, '3.6V', None) [src-6795e94640f3a9db]
- **ERROR — Line Regulation:** Conflicting values (None, None, None, '200uV/V*', None) vs ('2.6V-5.5V for VCCTS_D=2.45V, and 3.75V- 5.5V for VCCTS_D=3.6V', None, '2.6V-5.5V for VCCTS_D=2.45V, and 3.75V- 5.5V for VCCTS_D=3.6V', '2.6V-5.5V for VCCTS_D=2.45V, and 3.75V- 5.5V for VCCTS_D=3.6V', None) [src-6795e94640f3a9db]
- **ERROR — Line Regulation:** Conflicting values (None, None, None, '200uV/V*', None) vs ('0.05mA', None, '25.0mA', '2.6, 3.75, and 5.5V', None) [src-6795e94640f3a9db]
- **ERROR — VDDA power good rising trip point:** Conflicting values (None, None, '1.5V', None, None) vs (None, None, None, '-40ºC, 25ºC and 100ºC', None) [src-6795e94640f3a9db]
- **ERROR — vdda:** Conflicting values (None, None, None, '2.6V', None) vs ('3.5V', None, '5.5V', None, None) [src-6795e94640f3a9db:p33]
- **ERROR — vdda:** Conflicting values (None, None, None, '2.6V', None) vs (None, None, None, '3mA', None) [src-6795e94640f3a9db:p33]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '273.881x273.861', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '273.881x273.861', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '193Ksq-um', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '193Ksq-um', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '350K', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '350K', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '350K', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '94.62x93.62=8858sq-um*', None) [src-a272b7b79181b903]
- **ERROR — Block Size (um x um):** Conflicting values (None, None, None, '270x270', None) vs (None, None, None, '94.62x93.62=8858sq-um*', None) [src-a272b7b79181b903]
- **ERROR — Total area of the LDO circuit and bypass caps:** Conflicting values (None, None, None, '343,500um^2', None) vs (None, None, None, '343,5ksq-um', None) [src-6795e94640f3a9db] [src-a272b7b79181b903]
- **ERROR — LN_reg:** Conflicting values (None, None, None, '0.21', '%/V') vs (None, None, None, '0.65', '%/V') [src-a272b7b79181b903:p8]

## Evidence Index

Source markers identify immutable, hash-addressed operator evidence and page numbers. Original source filenames and vendor branding are intentionally not included in the customer package.

- `src-6795e94640f3a9db` page 10
- `src-6795e94640f3a9db` page 31
- `src-6795e94640f3a9db` page 33
- `src-6795e94640f3a9db` page n/a
- `src-a272b7b79181b903` page 8
- `src-a272b7b79181b903` page n/a

## Tapeout History

This package is not marked silicon-proven unless its IPM metadata explicitly states otherwise. The customer package contains abstract integration views; protected full layout is merged by ChipFoundry during the tapeout flow.
