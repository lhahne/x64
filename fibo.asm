;     for osx
;     brew install yasm
;     yasm -f macho64 fibo.asm && clang fibo.o  -o fibo && ./fibo 5

;     a nice tutorial for people http://cs.lmu.edu/~ray/notes/nasmtutorial/


        global   _main
        extern   _atoi
        extern   _printf
        default  rel

        section  .text
_main:
        push     rbx                    ; we don't ever use this, but it is necesary
                                        ; to align the stack so we can call stuff
        dec      rdi                    ; argc-1, since we don't count program name
        cmp      rdi, 1
        jne      incorrectArgs

        mov      rdi, [rsi+rdi*8]       ; argv[rdi]
        call     _atoi                  ; now rax has the int value of arg

        mov      rdi, rax
        call     fib

        lea      rdi, [format]
        mov      rsi, rax
        mov      rax, 0
        call     _printf

        jmp      done

fib:
        cmp      rdi, 0
        jbe      return0
        cmp      rdi, 1
        je       return1

        dec      rdi
        push     rdi
        call     fib
        pop      rdi

        push     rax
        dec      rdi
        call     fib

        pop      rdi
        add      rax, rdi
        ret
return1:
        mov      rax, 1
        ret
return0:
        mov      rax, 0
        ret

incorrectArgs:
        lea      rdi, [error]
        xor      rax, rax
        call     _printf

done:
        pop      rbx                    ; undoes the stupid push at the beginning
        mov      rax, 0
        ret

        section  .data
format: db       "%i", 10, 0
error:  db       "Need exactly one arg: the number of the fibonacci number to be computed", 10, 0
