################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../sources/Invn/EmbUtils/DataConverter.c \
../sources/Invn/EmbUtils/ErrorHelper.c \
../sources/Invn/EmbUtils/InvProtocol.c \
../sources/Invn/EmbUtils/InvQueue.c \
../sources/Invn/EmbUtils/InvScheduler.c \
../sources/Invn/EmbUtils/Message.c \
../sources/Invn/EmbUtils/RingByteBuffer.c 

OBJS += \
./sources/Invn/EmbUtils/DataConverter.o \
./sources/Invn/EmbUtils/ErrorHelper.o \
./sources/Invn/EmbUtils/InvProtocol.o \
./sources/Invn/EmbUtils/InvQueue.o \
./sources/Invn/EmbUtils/InvScheduler.o \
./sources/Invn/EmbUtils/Message.o \
./sources/Invn/EmbUtils/RingByteBuffer.o 

C_DEPS += \
./sources/Invn/EmbUtils/DataConverter.d \
./sources/Invn/EmbUtils/ErrorHelper.d \
./sources/Invn/EmbUtils/InvProtocol.d \
./sources/Invn/EmbUtils/InvQueue.d \
./sources/Invn/EmbUtils/InvScheduler.d \
./sources/Invn/EmbUtils/Message.d \
./sources/Invn/EmbUtils/RingByteBuffer.d 


# Each subdirectory must supply rules for building sources it contributes
sources/Invn/EmbUtils/%.o sources/Invn/EmbUtils/%.su sources/Invn/EmbUtils/%.cyclo: ../sources/Invn/EmbUtils/%.c sources/Invn/EmbUtils/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/Sensor/IMU/Inc" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Model Sattelite Project/Model Sattelite IMU (ICM 20948) Sensor Software/icm_20938_imu_sensor_software/sources/Invn/EmbUtils" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-sources-2f-Invn-2f-EmbUtils

clean-sources-2f-Invn-2f-EmbUtils:
	-$(RM) ./sources/Invn/EmbUtils/DataConverter.cyclo ./sources/Invn/EmbUtils/DataConverter.d ./sources/Invn/EmbUtils/DataConverter.o ./sources/Invn/EmbUtils/DataConverter.su ./sources/Invn/EmbUtils/ErrorHelper.cyclo ./sources/Invn/EmbUtils/ErrorHelper.d ./sources/Invn/EmbUtils/ErrorHelper.o ./sources/Invn/EmbUtils/ErrorHelper.su ./sources/Invn/EmbUtils/InvProtocol.cyclo ./sources/Invn/EmbUtils/InvProtocol.d ./sources/Invn/EmbUtils/InvProtocol.o ./sources/Invn/EmbUtils/InvProtocol.su ./sources/Invn/EmbUtils/InvQueue.cyclo ./sources/Invn/EmbUtils/InvQueue.d ./sources/Invn/EmbUtils/InvQueue.o ./sources/Invn/EmbUtils/InvQueue.su ./sources/Invn/EmbUtils/InvScheduler.cyclo ./sources/Invn/EmbUtils/InvScheduler.d ./sources/Invn/EmbUtils/InvScheduler.o ./sources/Invn/EmbUtils/InvScheduler.su ./sources/Invn/EmbUtils/Message.cyclo ./sources/Invn/EmbUtils/Message.d ./sources/Invn/EmbUtils/Message.o ./sources/Invn/EmbUtils/Message.su ./sources/Invn/EmbUtils/RingByteBuffer.cyclo ./sources/Invn/EmbUtils/RingByteBuffer.d ./sources/Invn/EmbUtils/RingByteBuffer.o ./sources/Invn/EmbUtils/RingByteBuffer.su

.PHONY: clean-sources-2f-Invn-2f-EmbUtils

