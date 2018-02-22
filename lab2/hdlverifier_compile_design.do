# Create design library
vlib work
# Create and open project
project new . compile_project
project open compile_project
# Add source files to project
project addfile "C:/EELE466/GHC_DDC/lab2/full_cla_adder.vhd"
project addfile "C:/EELE466/GHC_DDC/lab2/cla_adder.vhd"
project addfile "C:/EELE466/GHC_DDC/lab2/mod_full_adder.vhd"
# Calculate compilation order
project calculateorder
set compcmd [project compileall -n]
# Close project
project close
# Compile all files and report error
if [catch {eval $compcmd}] {
    exit -code 1
}
