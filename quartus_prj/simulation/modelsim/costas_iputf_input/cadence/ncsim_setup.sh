
cp -f D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/NCO_nco_ii_0_sin.hex ./
cp -f D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/NCO_nco_ii_0_cos.hex ./

ncvlog      "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/submodules/NCO_nco_ii_0.v"                        -work nco_ii_0 -cdslib <<nco_ii_0>>
ncvlog      "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/NCO/NCO/simulation/NCO.v"                                                                               
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/dspba_library_package.vhd"                                                          
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/dspba_library.vhd"                                                                  
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_math_pkg_hpfir.vhd"                                                       
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_lib_pkg_hpfir.vhd"                                                        
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"                                    
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"                                          
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"                                        
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/auk_dspip_roundsat_hpfir.vhd"                                                       
ncvlog      "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/altera_avalon_sc_fifo.v"                                                            
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf_rtl_core.vhd"                                                               
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf_ast.vhd"                                                                    
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf.vhd"                                                                        
ncvhdl -v93 "D:/FPGAFiRe/FPGAprojects/costas/quartus_prj/ip_core/FIR_lpf/FIR_lpf_sim/FIR_lpf_tb.vhd"                                                                     
