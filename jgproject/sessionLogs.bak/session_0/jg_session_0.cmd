# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.09
# platform  : Linux 4.19.0-20-amd64
# version   : 2023.09 FCS 64 bits
# build date: 2023.09.27 19:40:18 UTC
# ----------------------------------------
# started   : 2024-06-10 20:53:42 UTC
# hostname  : joc047.(none)
# pid       : 35692
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:40265' '-style' 'windows' '-data' 'AAAA6HichY69CsJAEIS/Q+x9En8OBA0pJKAgKMEUtiISIRCJiFjY6KP6JpdxJUErB2Zmhx3YdUD8CCFg6NwlPVasyZhLU7ZySBjjmTBkxkjaN3qmpl4p+tswuNfHiR3fcJvnj0O3KbYV0eufnAsFRwYsqDSf2FNaWoopO+3O3HT3ykGbN2ojFBmt' '-proj' '/home/joc/Documents/FIFO_Memory_Formal/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/joc/Documents/FIFO_Memory_Formal/jgproject/.tmp/.initCmds.tcl' 'Verif/Formal/FIFO_fpv.tcl'
clear -all
set design_top fifo
#lista de archivos que queremos compilar (RTL)
analyze -sv -f rtl_verif.flist 
