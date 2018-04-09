global _start, _kmain
extern kmain, start_ctors, end_ctors, start_dtors, end_dtors


%define MULTIBOOT_HEADER_MAGIC	0x1badb002
%define MULTIBOOT_HEADER_FLAGS	0X00000003
%define CHECKSUM -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADERS_FLAGS)

; -- entry point --
_start:
	jmp	start

; -- multiboot header --
align 4

multiboot_header:
dd MULTIBOOT_HEADER_MAGIC
dd MULTIBOOT_HEADER_FLAGS
dd CHECKSUM

; -- end | multiboot header

start:
	push ebx ;insert ebx register into the stack to save it

static_ctors_loop:
	mov ebx, start_ctors
	jmp .test

.body:
	call [ebx] ; call to ebx dereferenced value to start_ctors label
	add ebx, 4 ; jump into the next sector by adding 4 in stack

.test:
	cmp ebx, end_ctors ; check if devices already finalized to boot
	jb .body

	call kmain :use qemu kmain routine to start OS

static_dtors_loop:
	mov ebx, start_dtors
	jmp .test

	.body:
		call [ebx]
		add ebx, 4

	.test:
		cmp ebx, end_dtors
		jb .body

				cli ; finalize the interruptions
				hlt ; halt the CPU