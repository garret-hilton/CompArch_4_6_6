# Create design library
vlib work
# Create and open project
project new . compile_project
project open compile_project
# Add source files to project
project addfile "C:/EELE466/GHC_DDC/lab1/full_adder.vhd"
project addfile "C:/EELE466/GHC_DDC/lab1/rca_eight_bit.vhd"
# Calculate compilation order
project calculateorder
set compcmd [project compileall -n]
# Close project
project close
# Compile all files and report error
if [catch {eval $compcmd}] {
    exit -code 1
}
