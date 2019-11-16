#!/bin/sh
when=`date '+%Y%m%d-%H%M'`
mkdir bkp-$when
cd bkp-$when
avrdude -c stk500v2 -p atmega2560 -b115200 -P /dev/cu.usbmodem14501  -vvv -n  -U eeprom:r:eeprom.hex:i  -U flash:r:flash.hex:i  -U lfuse:r:lfuse.hex:i  -U hfuse:r:hfuse.hex:i  -U efuse:r:efuse.hex:i  -U lock:r:lock.hex:i  -U calibration:r:calibration.hex:i  -U signature:r:signature.hex:i 2>&1 | tee backup.log 2>&1
cd ..
