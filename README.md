# Bootloader

This is a simple bootloader written in NASM assembly language. It is designed to be placed in the first sector of a bootable disk and executed during the boot process. The bootloader displays a welcome message, prompts the user to enter a character, and then displays the entered character on the screen.

## Prerequisites

To assemble the bootloader code, you need to have NASM (Netwide Assembler) installed on your system. You can download NASM from the official website: [https://www.nasm.us/](https://www.nasm.us/)

## Building the Bootloader

To assemble the bootloader code, follow these steps:

1. Save the provided code in a file called `bootloader.asm`.
2. Open a terminal or command prompt.
3. Navigate to the directory where the `bootloader.asm` file is located.
4. Run the following command to assemble the code:

   ```
   nasm -f bin bootloader.asm -o bootloader.bin
   ```

   This command will use NASM to assemble the code into a binary file called `bootloader.bin`.

## Running the Bootloader

Once you have the `bootloader.bin` file, you can run it using an emulator or write it to the first sector of a bootable disk.

### Running with an Emulator

You can use an x86 emulator, such as QEMU, to run the bootloader. Follow these steps:

1. Install QEMU on your system if you haven't already. You can download QEMU from the official website: [https://www.qemu.org/](https://www.qemu.org/)
2. Open a terminal or command prompt.
3. Navigate to the directory where the `bootloader.bin` file is located.
4. Run the following command to start the emulator and execute the bootloader:

   ```
   qemu-system-x86_64 -drive format=raw,file=bootloader.bin
   ```

   This command will launch the emulator and load the `bootloader.bin` file as the bootable disk.

### Writing to a Bootable Disk

If you want to run the bootloader on real hardware, you can write the `bootloader.bin` file to the first sector of a bootable disk, such as a USB drive. Be cautious when performing disk operations, as it can erase or damage existing data.

**Important: Writing to a disk will erase its contents. Make sure to back up any important data before proceeding.**

Follow these steps to write the bootloader to a bootable disk:

1. Insert a blank bootable disk, such as a USB drive, into your computer.
2. Open a terminal or command prompt.
3. Identify the device name of the bootable disk. On Linux, you can use the `lsblk` command or the `fdisk -l` command to list available disks. On Windows, you can use the `diskpart` utility or third-party tools like Rufus.
4. Make sure you have the correct device name and double-check that it is the desired bootable disk.
5. Run the following command to write the bootloader to the bootable disk (replace `/dev/sdx` with the correct device name):

   ```
   dd if=bootloader.bin of=/dev/sdx bs=512 count=1
   ```

   This command will use the `dd` utility to write the `bootloader.bin` file to the first sector of the bootable disk.

   **Note:** Be extremely careful to specify the correct device name to avoid accidentally overwriting important data.

## License

This code is provided under the MIT License. See the [LICENSE](LICENSE) file for details.
