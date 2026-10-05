break _start
run
print &num
x/gx &num
next
info registers rbx
x/gx $rbx
next
info registers rax
next
info registers rax rdi
