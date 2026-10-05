break _start
run
print &numbers
x/5gx &numbers
next
info registers rbx
next
info registers rcx
next
info registers rax
p/x $rbx + $rcx * 8 + 8
next
info registers rax rdi
