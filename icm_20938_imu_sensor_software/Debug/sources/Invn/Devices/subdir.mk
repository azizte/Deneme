################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../sources/Invn/Devices/Sensor.c 

OBJS += \
./sources/Invn/Devices/Sensor.o 

C_DEPS += \
./sources/Invn/Devices/Sensor.d 


# Each subdirectory must supply rules for building sources it contributes
sources/Invn/Devices/%.o sources/Invn/Devices/%.su sources/Invn/Devices/%.cyclo: ../sources/Invn/Devices/%.c sources/Invn/Devices/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/Sensor/IMU/Inc" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/sources/Invn/EmbUtils" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-sources-2f-Invn-2f-Devices

clean-sources-2f-Invn-2f-Devices:
	-$(RM) ./sources/Invn/Devices/Sensor.cyclo ./sources/Invn/Devices/Sensor.d ./sources/Invn/Devices/Sensor.o ./sources/Invn/Devices/Sensor.su

.PHONY: clean-sources-2f-Invn-2f-Devices

