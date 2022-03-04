
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
