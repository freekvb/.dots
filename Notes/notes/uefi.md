# uefi


##### Both 'silent' and 'small' uefi/systemd_boot installed

One "EFI system partition" is required for UEFI firmware.

(Unless it has the CSM (BIOS-emulation) mode enabled and you specifically
intend to boot the system in BIOS-emulation mode. However, you should always
choose native UEFI boot mode if it's available – it's not nearly as finicky on
new machines as it used to be on 10-year-old devices, and it's soon going to be
the only mode available.)
