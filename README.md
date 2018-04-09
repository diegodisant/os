# CaptaincodeOS

This is one operating system based on x86-32 architecture, builded with Posix API, is compatible with new PCs by x86-64 arch and its retro-compatibility.

    The goal of this little project is to build a real operating system with 32 bit arch

## Specifications

- Code base on C++
- 32 bit arch
- Boot process with grub loader
- Modular system drivers
- UNIX Style
- Multitask
- ELF executables in user-space
- Devices and modules
    + IDE disks
    + DOS partitions
    + Clock
    + EXT2 (read only mode)
    + Boch VBE
- User space
    + API Posix
    + LibC
    + Run shell process and executables

