break _start
run
print &numbers
x/4gx &numbers
next
info registers rbx
next
info registers rax
p/x $rbx + 8
next
info registers rax rdi
