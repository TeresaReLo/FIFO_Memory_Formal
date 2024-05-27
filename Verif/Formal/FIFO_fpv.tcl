clear -all
set design_top fifo_buff

analyze -sv -f rtl_verif.flist #lista de archivos que queremos compilar (RTL)
analyze -sv -f verif_fv.flist
elaborate -top $design_top -create_related_covers {precondition witness} -x_value 0
clock clk
reset ~arstn -non_resettable_regs 0

