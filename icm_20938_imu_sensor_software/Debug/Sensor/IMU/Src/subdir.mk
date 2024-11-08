################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Sensor/IMU/Src/ICM_20948_C.c \
../Sensor/IMU/Src/icm_20948.c 

OBJS += \
./Sensor/IMU/Src/ICM_20948_C.o \
./Sensor/IMU/Src/icm_20948.o 

C_DEPS += \
./Sensor/IMU/Src/ICM_20948_C.d \
./Sensor/IMU/Src/icm_20948.d 


# Each subdirectory must supply rules for building sources it contributes
Sensor/IMU/Src/%.o Sensor/IMU/Src/%.su Sensor/IMU/Src/%.cyclo: ../Sensor/IMU/Src/%.c Sensor/IMU/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/Sensor/IMU/Inc" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Sensor-2f-IMU-2f-Src

clean-Sensor-2f-IMU-2f-Src:
	-$(RM) ./Sensor/IMU/Src/ICM_20948_C.cyclo ./Sensor/IMU/Src/ICM_20948_C.d ./Sensor/IMU/Src/ICM_20948_C.o ./Sensor/IMU/Src/ICM_20948_C.su ./Sensor/IMU/Src/icm_20948.cyclo ./Sensor/IMU/Src/icm_20948.d ./Sensor/IMU/Src/icm_20948.o ./Sensor/IMU/Src/icm_20948.su

.PHONY: clean-Sensor-2f-IMU-2f-Src

