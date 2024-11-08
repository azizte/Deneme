################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../sources/Invn/Devices/Drivers/Ak0991x/Ak0991x.c 

OBJS += \
./sources/Invn/Devices/Drivers/Ak0991x/Ak0991x.o 

C_DEPS += \
./sources/Invn/Devices/Drivers/Ak0991x/Ak0991x.d 


# Each subdirectory must supply rules for building sources it contributes
sources/Invn/Devices/Drivers/Ak0991x/%.o sources/Invn/Devices/Drivers/Ak0991x/%.su sources/Invn/Devices/Drivers/Ak0991x/%.cyclo: ../sources/Invn/Devices/Drivers/Ak0991x/%.c sources/Invn/Devices/Drivers/Ak0991x/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/Sensor/IMU/Inc" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/sources/Invn/EmbUtils" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-sources-2f-Invn-2f-Devices-2f-Drivers-2f-Ak0991x

clean-sources-2f-Invn-2f-Devices-2f-Drivers-2f-Ak0991x:
	-$(RM) ./sources/Invn/Devices/Drivers/Ak0991x/Ak0991x.cyclo ./sources/Invn/Devices/Drivers/Ak0991x/Ak0991x.d ./sources/Invn/Devices/Drivers/Ak0991x/Ak0991x.o ./sources/Invn/Devices/Drivers/Ak0991x/Ak0991x.su

.PHONY: clean-sources-2f-Invn-2f-Devices-2f-Drivers-2f-Ak0991x

