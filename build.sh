
# compile C code to object code
function compile_c {
    for i in $@ ; do
        printf "compiling %s ... " $i
        gcc $i -I lib -c -m32 -o $i.o
        printf "done! (%s.o)\n\0" $i 
    done
}

compile_c */*.c # compile C source files to object files
gcc -m32 -o awkward-vm */*.o # link and compile C code

printf "launch awkward-vm? [ y/N ]: "
read launch

if [[ $launch == "y" ]] ; then 
    exec awkward-vm $@ # launch with args
fi