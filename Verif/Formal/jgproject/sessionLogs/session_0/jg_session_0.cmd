# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.09
# platform  : Linux 4.19.0-20-amd64
# version   : 2023.09 FCS 64 bits
# build date: 2023.09.27 19:40:18 UTC
# ----------------------------------------
# started   : 2024-06-10 20:04:21 UTC
# hostname  : joc047.(none)
# pid       : 33303
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:44311' '-style' 'windows' '-data' 'AAAAznicY2RgYLCp////PwMYMFcBCQEGHwZfhiAGVyDpzxAGpBkYnBhMGYwYLBgMGBwYDIGkHhgbMViCSSMgz4qgCjBgfAChGWwYGZABY2ADCs3AwApTCFcCxBIMbgyeQOzPEM+QxlDAUAY0vYQhmSEHrAIApcsU2A==' '-proj' '/home/joc/Documents/FIFO_Memory_Formal/Verif/Formal/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/joc/Documents/FIFO_Memory_Formal/Verif/Formal/jgproject/.tmp/.initCmds.tcl' 'FIFO_fpv.tcl'
clear -all
set design_top fifo
#lista de archivos que queremos compilar (RTL)
analyze -sv -f rtl_verif.flist 
analyze -sv -f verif_fv.flist
elaborate -top $design_top -create_related_covers {precondition witness} -x_value 0
clock clk
reset rst -non_resettable_regs 0

prove -bg -property {<embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:witness1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:precondition1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:witness1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:precondition1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn <embedded>::fifo.fv_fifo_inst.full_notWriteEn:witness1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn:precondition1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn <embedded>::fifo.fv_fifo_inst.empty_notReadEn:witness1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:witness1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:precondition1 <embedded>::fifo.fv_fifo_inst.never_full_and_empty <embedded>::fifo.fv_fifo_inst.never_full_and_empty:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset <embedded>::fifo.fv_fifo_inst.full_off_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.write_correctly <embedded>::fifo.fv_fifo_inst.write_correctly:witness1 <embedded>::fifo.fv_fifo_inst.write_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.read_correctly <embedded>::fifo.fv_fifo_inst.read_correctly:witness1 <embedded>::fifo.fv_fifo_inst.read_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:witness1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_full <embedded>::fifo.fv_fifo_inst.fifo_empty <embedded>::fifo.fv_fifo_inst.fifo_notFull <embedded>::fifo.fv_fifo_inst.fifo_notEmpty <embedded>::fifo.fv_fifo_inst.write_all_address <embedded>::fifo.fv_fifo_inst.read_all_address <embedded>::fifo.fv_fifo_inst.writeEn_fifo_full <embedded>::fifo.fv_fifo_inst.readEn_fifo_empty <embedded>::fifo.fv_fifo_inst.write_and_read <embedded>::fifo.fv_fifo_inst.write_and_read_mem_full <embedded>::fifo.fv_fifo_inst.write_and_read_mem_empty <embedded>::fifo.fv_fifo_inst.fifo_full_no_full <embedded>::fifo.fv_fifo_inst.fifo_empty_no_empty}
visualize -violation -property <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff -new_window
include FIFO_fpv.tcl
prove -bg -property {<embedded>::fifo.fv_fifo_inst.writEnoff_full:witness1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:precondition1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn <embedded>::fifo.fv_fifo_inst.full_notWriteEn:witness1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn:precondition1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn <embedded>::fifo.fv_fifo_inst.empty_notReadEn:witness1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:witness1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:precondition1 <embedded>::fifo.fv_fifo_inst.never_full_and_empty <embedded>::fifo.fv_fifo_inst.never_full_and_empty:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset <embedded>::fifo.fv_fifo_inst.full_off_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.write_correctly <embedded>::fifo.fv_fifo_inst.write_correctly:witness1 <embedded>::fifo.fv_fifo_inst.write_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.read_correctly <embedded>::fifo.fv_fifo_inst.read_correctly:witness1 <embedded>::fifo.fv_fifo_inst.read_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:witness1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_full <embedded>::fifo.fv_fifo_inst.fifo_empty <embedded>::fifo.fv_fifo_inst.fifo_notFull <embedded>::fifo.fv_fifo_inst.fifo_notEmpty <embedded>::fifo.fv_fifo_inst.write_all_address <embedded>::fifo.fv_fifo_inst.read_all_address <embedded>::fifo.fv_fifo_inst.writeEn_fifo_full <embedded>::fifo.fv_fifo_inst.readEn_fifo_empty <embedded>::fifo.fv_fifo_inst.write_and_read <embedded>::fifo.fv_fifo_inst.write_and_read_mem_full <embedded>::fifo.fv_fifo_inst.write_and_read_mem_empty <embedded>::fifo.fv_fifo_inst.fifo_full_no_full <embedded>::fifo.fv_fifo_inst.fifo_empty_no_empty}
visualize -violation -property <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff -new_window
include FIFO_fpv.tcl
prove -bg -property {<embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff}
prove -bg -property {<embedded>::fifo.fv_fifo_inst.write_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.read_correctly <embedded>::fifo.fv_fifo_inst.read_correctly:witness1 <embedded>::fifo.fv_fifo_inst.read_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:witness1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_full <embedded>::fifo.fv_fifo_inst.fifo_empty <embedded>::fifo.fv_fifo_inst.fifo_notFull <embedded>::fifo.fv_fifo_inst.fifo_notEmpty <embedded>::fifo.fv_fifo_inst.write_all_address <embedded>::fifo.fv_fifo_inst.read_all_address <embedded>::fifo.fv_fifo_inst.writeEn_fifo_full <embedded>::fifo.fv_fifo_inst.readEn_fifo_empty <embedded>::fifo.fv_fifo_inst.write_and_read <embedded>::fifo.fv_fifo_inst.write_and_read_mem_full <embedded>::fifo.fv_fifo_inst.write_and_read_mem_empty <embedded>::fifo.fv_fifo_inst.fifo_full_no_full <embedded>::fifo.fv_fifo_inst.fifo_empty_no_empty}
visualize -violation -property <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff -new_window
include FIFO_fpv.tcl
prove -bg -property {<embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:witness1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:precondition1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:witness1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:precondition1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn <embedded>::fifo.fv_fifo_inst.full_notWriteEn:witness1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn:precondition1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn <embedded>::fifo.fv_fifo_inst.empty_notReadEn:witness1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:witness1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:precondition1 <embedded>::fifo.fv_fifo_inst.never_full_and_empty <embedded>::fifo.fv_fifo_inst.never_full_and_empty:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset <embedded>::fifo.fv_fifo_inst.full_off_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.write_correctly <embedded>::fifo.fv_fifo_inst.write_correctly:witness1 <embedded>::fifo.fv_fifo_inst.write_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.read_correctly <embedded>::fifo.fv_fifo_inst.read_correctly:witness1 <embedded>::fifo.fv_fifo_inst.read_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:witness1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_full <embedded>::fifo.fv_fifo_inst.fifo_empty <embedded>::fifo.fv_fifo_inst.fifo_notFull <embedded>::fifo.fv_fifo_inst.fifo_notEmpty <embedded>::fifo.fv_fifo_inst.write_all_address <embedded>::fifo.fv_fifo_inst.read_all_address <embedded>::fifo.fv_fifo_inst.writeEn_fifo_full <embedded>::fifo.fv_fifo_inst.readEn_fifo_empty <embedded>::fifo.fv_fifo_inst.write_and_read <embedded>::fifo.fv_fifo_inst.write_and_read_mem_full <embedded>::fifo.fv_fifo_inst.write_and_read_mem_empty <embedded>::fifo.fv_fifo_inst.fifo_full_no_full <embedded>::fifo.fv_fifo_inst.fifo_empty_no_empty}
visualize -violation -property <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff -new_window
include FIFO_fpv.tcl
prove -bg -property {<embedded>::fifo.fv_fifo_inst.writEnoff_full:witness1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:precondition1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn <embedded>::fifo.fv_fifo_inst.full_notWriteEn:witness1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn:precondition1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn <embedded>::fifo.fv_fifo_inst.empty_notReadEn:witness1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:witness1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:precondition1 <embedded>::fifo.fv_fifo_inst.never_full_and_empty <embedded>::fifo.fv_fifo_inst.never_full_and_empty:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset <embedded>::fifo.fv_fifo_inst.full_off_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.write_correctly <embedded>::fifo.fv_fifo_inst.write_correctly:witness1 <embedded>::fifo.fv_fifo_inst.write_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.read_correctly <embedded>::fifo.fv_fifo_inst.read_correctly:witness1 <embedded>::fifo.fv_fifo_inst.read_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:witness1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_full <embedded>::fifo.fv_fifo_inst.fifo_empty <embedded>::fifo.fv_fifo_inst.fifo_notFull <embedded>::fifo.fv_fifo_inst.fifo_notEmpty <embedded>::fifo.fv_fifo_inst.write_all_address <embedded>::fifo.fv_fifo_inst.read_all_address <embedded>::fifo.fv_fifo_inst.writeEn_fifo_full <embedded>::fifo.fv_fifo_inst.readEn_fifo_empty <embedded>::fifo.fv_fifo_inst.write_and_read <embedded>::fifo.fv_fifo_inst.write_and_read_mem_full <embedded>::fifo.fv_fifo_inst.write_and_read_mem_empty <embedded>::fifo.fv_fifo_inst.fifo_full_no_full <embedded>::fifo.fv_fifo_inst.fifo_empty_no_empty}
visualize -violation -property <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff -new_window
include FIFO_fpv.tcl
prove -bg -property {<embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:witness1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:precondition1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:witness1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:precondition1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn <embedded>::fifo.fv_fifo_inst.full_notWriteEn:witness1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn:precondition1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn <embedded>::fifo.fv_fifo_inst.empty_notReadEn:witness1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:witness1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:precondition1 <embedded>::fifo.fv_fifo_inst.never_full_and_empty <embedded>::fifo.fv_fifo_inst.never_full_and_empty:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset <embedded>::fifo.fv_fifo_inst.full_off_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.write_correctly <embedded>::fifo.fv_fifo_inst.write_correctly:witness1 <embedded>::fifo.fv_fifo_inst.write_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.read_correctly <embedded>::fifo.fv_fifo_inst.read_correctly:witness1 <embedded>::fifo.fv_fifo_inst.read_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:witness1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_full <embedded>::fifo.fv_fifo_inst.fifo_empty <embedded>::fifo.fv_fifo_inst.fifo_notFull <embedded>::fifo.fv_fifo_inst.fifo_notEmpty <embedded>::fifo.fv_fifo_inst.write_all_address <embedded>::fifo.fv_fifo_inst.read_all_address <embedded>::fifo.fv_fifo_inst.writeEn_fifo_full <embedded>::fifo.fv_fifo_inst.readEn_fifo_empty <embedded>::fifo.fv_fifo_inst.write_and_read <embedded>::fifo.fv_fifo_inst.write_and_read_mem_full <embedded>::fifo.fv_fifo_inst.write_and_read_mem_empty <embedded>::fifo.fv_fifo_inst.fifo_full_no_full <embedded>::fifo.fv_fifo_inst.fifo_empty_no_empty}
visualize -violation -property <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff -new_window
include FIFO_fpv.tcl
prove -bg -property {<embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.writeEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:witness1 <embedded>::fifo.fv_fifo_inst.readEnOff_rst_on:precondition1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:witness1 <embedded>::fifo.fv_fifo_inst.readEnoff_empty:precondition1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:witness1 <embedded>::fifo.fv_fifo_inst.writEnoff_full:precondition1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn <embedded>::fifo.fv_fifo_inst.full_notWriteEn:witness1 <embedded>::fifo.fv_fifo_inst.full_notWriteEn:precondition1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn <embedded>::fifo.fv_fifo_inst.empty_notReadEn:witness1 <embedded>::fifo.fv_fifo_inst.empty_notReadEn:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_increm_readEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_increm_writeEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_increm_rdEn_on:precondition1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.wr_en_off_wr_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:witness1 <embedded>::fifo.fv_fifo_inst.rd_en_off_rd_ptr_stable:precondition1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:witness1 <embedded>::fifo.fv_fifo_inst.rst_rdPtr_wrPtr_zero:precondition1 <embedded>::fifo.fv_fifo_inst.never_full_and_empty <embedded>::fifo.fv_fifo_inst.never_full_and_empty:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtrNext_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.wrPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:witness1 <embedded>::fifo.fv_fifo_inst.rdPtr_maxvalue_reset0:precondition1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.empty_on_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset <embedded>::fifo.fv_fifo_inst.full_off_whenreset:witness1 <embedded>::fifo.fv_fifo_inst.full_off_whenreset:precondition1 <embedded>::fifo.fv_fifo_inst.write_correctly <embedded>::fifo.fv_fifo_inst.write_correctly:witness1 <embedded>::fifo.fv_fifo_inst.write_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.read_correctly <embedded>::fifo.fv_fifo_inst.read_correctly:witness1 <embedded>::fifo.fv_fifo_inst.read_correctly:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:witness1 <embedded>::fifo.fv_fifo_inst.fifo_stable_when_writeEnoff:precondition1 <embedded>::fifo.fv_fifo_inst.fifo_full <embedded>::fifo.fv_fifo_inst.fifo_empty <embedded>::fifo.fv_fifo_inst.fifo_notFull <embedded>::fifo.fv_fifo_inst.fifo_notEmpty <embedded>::fifo.fv_fifo_inst.write_all_address <embedded>::fifo.fv_fifo_inst.read_all_address <embedded>::fifo.fv_fifo_inst.writeEn_fifo_full <embedded>::fifo.fv_fifo_inst.readEn_fifo_empty <embedded>::fifo.fv_fifo_inst.write_and_read <embedded>::fifo.fv_fifo_inst.write_and_read_mem_full <embedded>::fifo.fv_fifo_inst.write_and_read_mem_empty <embedded>::fifo.fv_fifo_inst.fifo_full_no_full <embedded>::fifo.fv_fifo_inst.fifo_empty_no_empty}
