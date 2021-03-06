transcript on
if ![file isdirectory costas_iputf_libs] {
	file mkdir costas_iputf_libs
}

if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {d:/altera/16.0/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {d:/altera/16.0/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {d:/altera/16.0/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {d:/altera/16.0/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {d:/altera/16.0/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {d:/altera/16.0/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {d:/altera/16.0/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {d:/altera/16.0/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {d:/altera/16.0/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {d:/altera/16.0/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {d:/altera/16.0/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {d:/altera/16.0/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib costas_iputf_libs/nco_ii_0
vmap nco_ii_0 ./costas_iputf_libs/nco_ii_0
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 

file copy -force D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/NCO_nco_ii_0_sin.hex ./
file copy -force D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/NCO_nco_ii_0_cos.hex ./

vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/sid_2c_1p.v"                    -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_nco_fxx.v"                  -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_gar.v"                      -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_nco_apr_dxx.v"              -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_dxx_g.v"                    -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_nco_as_m_cen.v"             -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_altqmcpipe.v"               -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_nco_mob_rw.v"               -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_nco_isdr.v"                 -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/segment_arr_tdl.v"              -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_nco_pxx.v"                  -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/segment_sel.v"                  -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_dxx.v"                      -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/mentor/asj_xnqg.v"                     -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/NCO_nco_ii_0.v"                        -work nco_ii_0
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/NCO.v"                                                          
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/dspba_library_package.vhd"                                     
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/dspba_library.vhd"                                             
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_math_pkg_hpfir.vhd"                                  
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_lib_pkg_hpfir.vhd"                                   
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"               
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"                     
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"                   
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_roundsat_hpfir.vhd"                                  
vlog "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/altera_avalon_sc_fifo.v"                                       
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf_rtl_core.vhd"                                          
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf_ast.vhd"                                               
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf.vhd"                                                   
vcom "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf_tb.vhd"                                                

##vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf.vo}
vlib FIR_lpf
vmap FIR_lpf FIR_lpf
vlog -vlog01compat -work FIR_lpf +incdir+D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/rtl {D:/FPGAFiRe/FPGAprojects/costas/rtl/key_filter.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/rtl {D:/FPGAFiRe/FPGAprojects/costas/rtl/add.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/sim {D:/FPGAFiRe/FPGAprojects/costas/sim/tb_bpsk.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/rtl {D:/FPGAFiRe/FPGAprojects/costas/rtl/phase_detect.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/rtl {D:/FPGAFiRe/FPGAprojects/costas/rtl/random_seq.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/rtl {D:/FPGAFiRe/FPGAprojects/costas/rtl/bpsk.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/rtl {D:/FPGAFiRe/FPGAprojects/costas/rtl/LoopFilter.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/rtl {D:/FPGAFiRe/FPGAprojects/costas/rtl/costas.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/mul {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/mul/mul.v}
vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/db {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/db/mult_2jq.v}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/dspba_library_package.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/auk_dspip_math_pkg_hpfir.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/auk_dspip_avalon_streaming_controller_hpfir.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/auk_dspip_roundsat_hpfir.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/dspba_library.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/auk_dspip_lib_pkg_hpfir.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/auk_dspip_avalon_streaming_source_hpfir.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/FIR_lpf_0002_rtl_core.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/auk_dspip_avalon_streaming_sink_hpfir.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/FIR_lpf_0002_ast.vhd}
vcom -93 -work FIR_lpf {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf/FIR_lpf_0002.vhd}

vlog -vlog01compat -work work +incdir+D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/../sim {D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/../sim/tb_costas.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L FIR_lpf -L nco_ii_0 -voptargs="+acc"  tb_costas

add wave *
view structure
view signals
run 1 us
