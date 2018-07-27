# DEBUG: default is without debug information (=0). in order to enable it use DEBUG=1
#LOG_LEVEL: defines the level of logging which will be purged to the default output port.
#	LOG_LEVEL_NONE 0 
#	LOG_LEVEL_NOTICE 10 
#	LOG_LEVEL_ERROR 20 
#	LOG_LEVEL_WARNING 30 
#	LOG_LEVEL_INFO 40 
#	LOG_LEVEL_VERBOSE 50

#USE_COHERENT_MEM: This flag determines whether to include the coherent memory region in the BL memory map or not. It should be set to 0.

#MARVELL_SECURE_BOOT: build trusted(=1)/non trusted(=0) image, default is non trusted.

#DDR_TOPOLOGY: For Armada37x0 only, the DDR topology map index, default is 0.
#Supported Options:
#	DDR3 1CS (0): DB-88F3720-DDR3-Modular (512MB); EspressoBIN (512MB)
#	DDR4 1CS (1): DB-88F3720-DDR4-Modular (512MB)
#	DDR3 2CS (2): EspressoBIN (1GB)
#	DDR4 2CS (3): DB-88F3720-DDR4-Modular (4GB)
#	DDR3 1CS (4): DB-88F3720-DDR3-Modular (1GB)
#	DDR3 2CS (5): DB-88F3720-DDR3-Modular (2GB)

#CLOCKSPRESET: For Armada37x0 only, the clock tree configuration preset including CPU and DDR frequency,
#	default is CPU_800_DDR_800.
#	CPU_600_DDR_600 - CPU at 600 MHz, DDR at 600 MHz
#	CPU_800_DDR_800 - CPU at 800 MHz, DDR at 800 MHz
#	CPU_1000_DDR_800 - CPU at 1000 MHz, DDR at 800 MHz
#	CPU_1200_DDR_750 - CPU at 1200 MHz, DDR at 750 MHz

#BOOTDEV: For Armada37x0 only, the flash boot device, default is SPINOR,
#	Currently, Armada37x0 only supports SPINOR, SPINAND, EMMCNORM and SATA:
#	SPINOR - SPI NOR flash boot
#	SPINAND - SPI NAND flash boot
#	EMMCNORM - eMMC Download Mode
#		Download boot loader or program code from eMMC flash into CM3 or CA53 Requires full initialization and command sequence
#	SATA - SATA device boot

#PARTNUM: For Armada37x0 only, the boot partition number, default is 0. To boot from eMMC, the value
#	should be aligned with the parameter in U-Boot with name of CONFIG_SYS_MMC_ENV_PART, whose value by default is 1. For detail about CONFIG_SYS_MMC_ENV_PART, please refer to U-Boot build instructions.

#WTMI_IMG: For Armada37x0 only, the path of the WTMI image can point to a image which does
#	nothing, a image which supports EFUSE or a customized CM3 firmware image, the default is “tools/wtp/wtmi/build/wtmi.bin” which supports EFUSE.

#WTP: For Armada37x0 only, use this parameter to point to wtptools source code directory, which
#	could be found as a3700_utils.zip in the release. Usage example: WTP=/path/to/a3700_utils

#PLAT: 
#Supported MARVELL_PLATFORM are:
#	a3700
#	a70x0
#	a70x0_cust (for customers)
#	a80x0
#	a80x0_mcbin (for MacciatoBin)

#make DEBUG=1 USE_COHERENT_MEM=0 LOG_LEVEL=20 PLAT=a3700 all fip

cur_path=`dirname $0`
source ${cur_path}/../envsetup.sh

rm -rf build
make DEBUG=1 USE_COHERENT_MEM=0 LOG_LEVEL=20 SECURE=0 CLOCKSPRESET=CPU_800_DDR_800 \
        DDR_TOPOLOGY=5 BOOTDEV=SPINOR PARTNUM=0 PLAT=a3700 all fip
