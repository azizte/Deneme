################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../sources/Invn/DynamicProtocol/DynProtocol.c \
../sources/Invn/DynamicProtocol/DynProtocolTransportUart.c 

OBJS += \
./sources/Invn/DynamicProtocol/DynProtocol.o \
./sources/Invn/DynamicProtocol/DynProtocolTransportUart.o 

C_DEPS += \
./sources/Invn/DynamicProtocol/DynProtocol.d \
./sources/Invn/DynamicProtocol/DynProtocolTransportUart.d 


# Each subdirectory must supply rules for building sources it contributes
sources/Invn/DynamicProtocol/%.o sources/Invn/DynamicProtocol/%.su sources/Invn/DynamicProtocol/%.cyclo: ../sources/Invn/DynamicProtocol/%.c sources/Invn/DynamicProtocol/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/Sensor/IMU/Inc" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/sources/Invn/EmbUtils" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-sources-2f-Invn-2f-DynamicProtocol

clean-sources-2f-Invn-2f-DynamicProtocol:
	-$(RM) ./sources/Invn/DynamicProtocol/DynProtocol.cyclo ./sources/Invn/DynamicProtocol/DynProtocol.d ./sources/Invn/DynamicProtocol/DynProtocol.o ./sources/Invn/DynamicProtocol/DynProtocol.su ./sources/Invn/DynamicProtocol/DynProtocolTransportUart.cyclo ./sources/Invn/DynamicProtocol/DynProtocolTransportUart.d ./sources/Invn/DynamicProtocol/DynProtocolTransportUart.o ./sources/Invn/DynamicProtocol/DynProtocolTransportUart.su

.PHONY: clean-sources-2f-Invn-2f-DynamicProtocol

