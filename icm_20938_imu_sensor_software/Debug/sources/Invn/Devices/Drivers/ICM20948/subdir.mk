################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948Augmented.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxCompassAkm.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxTransport.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseControl.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseDriver.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948DataConverter.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948Dmp3Driver.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948LoadFirmware.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948MPUFifoControl.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948SelfTest.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948Setup.c \
../sources/Invn/Devices/Drivers/ICM20948/Icm20948Transport.c 

OBJS += \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Augmented.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxCompassAkm.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxTransport.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseControl.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseDriver.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataConverter.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Dmp3Driver.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948LoadFirmware.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948MPUFifoControl.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948SelfTest.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Setup.o \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Transport.o 

C_DEPS += \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Augmented.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxCompassAkm.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxTransport.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseControl.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseDriver.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataConverter.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Dmp3Driver.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948LoadFirmware.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948MPUFifoControl.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948SelfTest.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Setup.d \
./sources/Invn/Devices/Drivers/ICM20948/Icm20948Transport.d 


# Each subdirectory must supply rules for building sources it contributes
sources/Invn/Devices/Drivers/ICM20948/%.o sources/Invn/Devices/Drivers/ICM20948/%.su sources/Invn/Devices/Drivers/ICM20948/%.cyclo: ../sources/Invn/Devices/Drivers/ICM20948/%.c sources/Invn/Devices/Drivers/ICM20948/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/Sensor/IMU/Inc" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/sources/Invn/EmbUtils" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-sources-2f-Invn-2f-Devices-2f-Drivers-2f-ICM20948

clean-sources-2f-Invn-2f-Devices-2f-Drivers-2f-ICM20948:
	-$(RM) ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Augmented.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Augmented.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Augmented.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Augmented.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxCompassAkm.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxCompassAkm.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxCompassAkm.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxCompassAkm.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxTransport.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxTransport.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxTransport.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948AuxTransport.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseControl.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseControl.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseControl.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseControl.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseDriver.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseDriver.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseDriver.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataBaseDriver.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataConverter.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataConverter.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataConverter.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948DataConverter.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Dmp3Driver.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Dmp3Driver.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Dmp3Driver.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Dmp3Driver.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948LoadFirmware.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948LoadFirmware.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948LoadFirmware.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948LoadFirmware.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948MPUFifoControl.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948MPUFifoControl.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948MPUFifoControl.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948MPUFifoControl.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948SelfTest.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948SelfTest.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948SelfTest.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948SelfTest.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Setup.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Setup.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Setup.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Setup.su ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Transport.cyclo ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Transport.d ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Transport.o ./sources/Invn/Devices/Drivers/ICM20948/Icm20948Transport.su

.PHONY: clean-sources-2f-Invn-2f-Devices-2f-Drivers-2f-ICM20948

