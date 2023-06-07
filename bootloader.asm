org 0x7c00	 ; Set origin to 0x7c00

bits 16		; 16-bit real mode

start:
	jmp main	; Jump to main code

; Bootloader code starts here

main:
	mov ax, 0x07C0  ; Set up data segment
	mov ds, ax
	mov es, ax
	
	mov si, hello_msg   ; Print a welcome message
	call print_string
	
	mov si, prompt_msg  ; Print a prompt message
	call print_string
	
	call read_char	  ; Read a character from keyboard
	
	mov si, newline	 ; Move cursor to the next line
	call print_string
	
	mov si, echo_msg	; Print the character that was entered
	call print_string
	
	call print_char	 ; Print the character
	
	jmp $			   ; Infinite loop
	
; Print a null-terminated string
print_string:
	lodsb			   ; Load the next character
	or al, al		   ; Check for null terminator
	jz end_print_string ; If null, end of string
	
	call print_char	 ; Print the character
	jmp print_string	; Repeat for the next character
	
end_print_string:
	ret

; Print a character in AL
print_char:
	mov ah, 0x0E		; BIOS teletype function
	int 0x10			; Call BIOS interrupt
	
	ret

; Read a character from the keyboard
read_char:
	mov ah, 0		   ; BIOS keyboard input function
	int 0x16			; Call BIOS interrupt
	
	ret

; Data section

hello_msg db "Welcome to My Bootloader!", 0
prompt_msg db "Enter a character: ", 0
echo_msg db "You entered: ", 0
newline db 0x0D, 0x0A, 0	 ; CR LF null terminator

times 510-($-$$) db 0	; Pad the bootloader to 510 bytes
dw 0xAA55			   ; Boot signature at 511-512 bytes
