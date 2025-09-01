FROM debian:stable-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    qemu-system-x86 x11vnc xvfb fluxbox \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY disks/ /app/disks/
# nothing else baked in; we’ll mount ./shared at runtime

# Expose VNC for VGA
EXPOSE 5901

# Default: boot the VHD; map host ./shared as a DOS drive (vvfat)
# Notes:
#  - format=vpc because .vhd is the VirtualPC/VHD format
#  - Change -cpu if you need 386/486 timing behavior for tools
CMD ["qemu-system-i386",
     "-cpu", "486",
     "-m", "64",
     "-rtc", "base=localtime",
     "-drive", "file=/app/disks/tandy-build.vhd,format=vpc,if=ide",
     "-drive", "file=fat:rw:/app/shared,format=raw,if=ide,index=1,media=disk",   # becomes D: or E: in DOS
     "-net", "user",
     "-net", "nic,model=pcnet",
     "-vnc", "0.0.0.0:1",
     "-soundhw", "sb16"
]
