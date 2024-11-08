#include "icm_20948.h"
#include <stdio.h>
#include <stdint.h>

extern I2C_HandleTypeDef hi2c1;

#define ICM20948_I2C	&hi2c1

static float gyro_scale_factor_;
static float accel_scale_factor_;

void ICM_WriteOneByte(uint8_t reg, uint8_t Data);
static void     icm20948_select_user_bank(userbank ub);

static uint8_t  icm20948_read_reg8(userbank ub, uint8_t RegAddr);
static void     icm20948_write_reg8(userbank ub, uint8_t RegAddr, uint8_t Val);

static uint8_t  read_single_ak09916_reg(uint8_t reg);
static void     write_single_ak09916_reg(uint8_t reg, uint8_t val);


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
void ICM_WriteOneByte(uint8_t reg, uint8_t Data) // ***
{
    HAL_StatusTypeDef status;
    uint8_t txData[2];

    reg = reg & 0x7F; // Clear the MSB to indicate write operation

    // Prepare the data to be transmitted
    txData[0] = reg;  // Register address
    txData[1] = Data; // Data to be written

    //Transmit the data via I2C
    status = HAL_I2C_Master_Transmit(ICM20948_I2C, ICM20948_ID, txData, 2, HAL_MAX_DELAY);

    if(status != HAL_OK) {
        // Handle error here
    }
}


/*
static void     icm20948_select_user_bank(userbank ub) {
	uint8_t WriteReg = ub & 0x30;

	HAL_I2C_Mem_Write(ICM20948_I2C, ICM20948_ID, REG_BANK_SEL, 1, WriteReg, 1, 100);

}
*/
static void     icm20948_select_user_bank(userbank ub) {
	ICM_WriteOneByte(0x7F, ub);

}


/**
 * @brief çalışan kod
 *
 * @param
 * @param
 *
 * @return
 */
/*
static uint8_t  icm20948_read_reg8(userbank ub, uint8_t RegAddr) {
	uint8_t read_reg = READ | RegAddr;
	uint8_t reg_val;

	icm20948_select_user_bank(ub);

	status = HAL_I2C_Mem_Read(ICM20948_I2C, ICM20948_ID, read_reg, 1, &reg_val, 1, TIMEOUT);

	if(status == HAL_OK)
	{
		return reg_val;
	}
	else
	{
		return 0;
	}

}
*/


/**
 * @brief deneme kodu
 *
 * @param
 * @param
 *
 * @return
 */
static uint8_t  icm20948_read_reg8(userbank ub, uint8_t RegAddr) {
	HAL_StatusTypeDef status;

	uint8_t read_reg = RegAddr;
	uint8_t reg_val;

	icm20948_select_user_bank(ub);

	status = HAL_I2C_Mem_Read(ICM20948_I2C, ICM20948_ID, read_reg, 1, &reg_val, 1, TIMEOUT);

	if(status == HAL_OK)
	{
		return reg_val;
	}
	else
	{
		return 0;
	}

}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
static void     icm20948_write_reg8(userbank ub, uint8_t RegAddr, uint8_t Val) {

	icm20948_select_user_bank(ub);

	HAL_I2C_Mem_Write(ICM20948_I2C, ICM20948_ID, RegAddr, 1, &Val, 1, TIMEOUT);
}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
static uint8_t  read_single_ak09916_reg(uint8_t reg) {

	icm20948_write_reg8(ub_3, B3_I2C_SLV0_ADDR, READ | MAG_SLAVE_ADDR); //READ -> 1000 0000, MAG_SLAVE_ADDR -> 0000 1100
	icm20948_write_reg8(ub_3, B3_I2C_SLV0_REG, reg);   // reg -> I2C slave 0 register address from where to begin data transfer.
	icm20948_write_reg8(ub_3, B3_I2C_SLV0_CTRL, 0x81); // 1000 0001 -> Enable reading data from this slave, Number of bytes to be read from I2C slave 0.

	HAL_Delay(1);

	/*
	 * Sensor data read from external I2C devices via the I2C master interface. The data stored
	 * is controlled by the I2C_SLV(0-4)_ADDR, I2C_SLV(0-4)_REG, and I2C_SLV(0-4)_CTRL registers.
	 */
	return icm20948_read_reg8(ub_0, B0_EXT_SLV_SENS_DATA_00);
}



/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */

static void     write_single_ak09916_reg(uint8_t reg, uint8_t val) {

	icm20948_write_reg8(ub_3, B3_I2C_SLV0_ADDR, WRITE | MAG_SLAVE_ADDR);
	icm20948_write_reg8(ub_3, B3_I2C_SLV0_REG, reg);
	icm20948_write_reg8(ub_3, B3_I2C_SLV0_DO, val);
	icm20948_write_reg8(ub_3, B3_I2C_SLV0_CTRL, 0x81);
}


/***************************************************************************************************************************************************************/

/**
 * @brief Register to indicate to user which device is being accessed.
 *		  The value for ICM-20948 is 0xEA.
 *
 *	Name:        WHO_AM_I
 *	Address:     0 (00h)
 *	Type:        USR0
 *	Bank:        0
 *	Serial IF:   R
 *	Reset Value: 0xEA
 *
 *	NOTE: The device will come up in sleep mode upon power-up.
 *
 * @param none
 * @param none
 *
 * @return
 */
HAL_StatusTypeDef icm20948_who_am_i(void) {

	uint8_t icm20948_id = icm20948_read_reg8(ub_0, B0_WHO_AM_I);

	if (icm20948_id == 0xEA)
	{
		printf("ICM device ID matched\n");
		return HAL_OK;
	}
	else
	{
		printf("ICM device ID does not match\n");
		return HAL_ERROR;
	}
}

/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
uint8_t ak09916_who_am_i(void) {

	uint8_t ak09916_id = read_single_ak09916_reg(MAG_WIA2);

	if (ak09916_id == AK09916_ID)
	{
		return true;
	}
	else
	{
		return false;
	}
}

/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
HAL_StatusTypeDef icm20948_init(void) {
	while(icm20948_who_am_i())

	icm20948_device_reset();
	icm20948_wakeup();

	icm20948_clock_source(0);
	icm20948_odr_align_en();

	icm20948_gyro_sample_rate_divider(255);
	icm20948_accel_sample_rate_divider(0);

	icm20948_gyro_low_pass_filter(GYRO_DLPFCFG_0);
	icm20948_accel_low_pass_filter(ACCEL_DLPFCFG_0);

	//icm20948_gyro_calibration();
	//icm20948_accel_calibration();

	icm20948_gyro_full_scale_select(_250dps);
	icm20948_accel_full_scale_select(_2g);

	return HAL_OK;
}


/**
 * @brief IMU reset
 *
 * @param
 * @param
 *
 * @return
 */
void icm20948_device_reset(void) {

	icm20948_write_reg8(ub_0, B0_PWR_MGMT_1, 0xC1);
	HAL_Delay(100);

	printf("ICM 20948 has been reset\n");
}


/**
 * @brief Exit from Sleep Mode
 *
 * @param
 * @param
 *
 * @return
 */
void icm20948_wakeup(void) {
	uint8_t NewVal = icm20948_read_reg8(ub_0, B0_PWR_MGMT_1);

	NewVal &= 0xBF;
	icm20948_write_reg8(ub_0, B0_PWR_MGMT_1, NewVal);
	HAL_Delay(100);

	printf("ICM 20948 device has been awakened\n");
}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
void icm20948_clock_source(uint8_t source) {
	uint8_t NewVal = icm20948_read_reg8(ub_0, B0_PWR_MGMT_1);

	NewVal |= source;

	icm20948_write_reg8(ub_0, B0_PWR_MGMT_1, NewVal);

	printf("ICM 20948 clock source: %d\n", NewVal);
}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
HAL_StatusTypeDef ak09916_init(void) {
	icm20948_i2c_master_reset();
	icm20948_i2c_master_enable();
	icm20948_i2c_clk_frq(I2C_MST_CLK_7);

	while (!ak09916_who_am_i());

	ak09916_soft_reset();
	ak09916_operation_mode_setting(continuous_measurement_100hz);

	return HAL_OK;
}


/**
 * @brief X_angular_rate = GYRO_XOUT/Gyro_Sensitivity
 *
 * @param
 * @param
 *
 * @return
 */
void read_raw_data_gyro(icm_20948_gyro_data* data)
{
	HAL_StatusTypeDef ret = HAL_ERROR;
	uint8_t temp[6];

	icm20948_select_user_bank(ub_0);

	ret = HAL_I2C_Mem_Read(ICM20948_I2C, ICM20948_ID, B0_GYRO_XOUT_H , 1, temp, 6, TIMEOUT);

	if (ret == HAL_OK)
	{
		data->x = (int16_t)(temp[0] << 8 | temp[1]);
		data->y = (int16_t)(temp[2] << 8 | temp[3]);
		data->z = (int16_t)(temp[4] << 8 | temp[5]);

	}
}

/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
void read_data_gyro_dps(icm_20948_gyro_data* data)
{
	read_raw_data_gyro(data);

	data->x /= gyro_scale_factor_;
	data->y /= gyro_scale_factor_;
	data->z /= gyro_scale_factor_;
}

/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
HAL_StatusTypeDef read_raw_data_accel(icm_20948_accel_data* data)
{
	uint8_t ret, temp[6];

	icm20948_select_user_bank(ub_0);

	ret = HAL_I2C_Mem_Read(ICM20948_I2C, ICM20948_ID, B0_ACCEL_XOUT_H, 1, temp, 6, TIMEOUT);

	if (ret == HAL_OK)
	{
		data->x = (int16_t)(temp[0] << 8 | temp[1]);
		data->y = (int16_t)(temp[2] << 8 | temp[3]);
		data->z = (int16_t)(temp[4] << 8 | temp[5]);

	    data->x /= accel_scale_factor_;
		data->y /= accel_scale_factor_;
		data->z /= accel_scale_factor_;

		return HAL_OK;
	}
	return HAL_ERROR;
}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
/*
uint8_t ak09916_mag_read(ak09916_magno_data* data)
{
	HAL_StatusTypeDef ret;

	uint8_t temp[6];
	uint8_t dataReady, overFlow;

	dataReady = (read_single_ak09916_reg(MAG_ST1) & 0x01);
	if (!dataReady) return false;

	//temp = read_multiple_ak09916_reg(MAG_HXL, 6);
	//icm20948_select_user_bank(ub_3);
	//ret = HAL_I2C_Mem_Read(ICM20948_I2C, ICM20948_ID, MAG_HXL, 1, temp, 6, TIMEOUT);

	temp = read_multiple_ak09916_reg(MAG_HXL, 6);

	overFlow = read_single_ak09916_reg(MAG_ST2) & 0x08;
	if (overFlow) return false;


	if (ret == HAL_OK)
	{
		data->x = (int16_t)(temp[1] << 8 | temp[0]);
		data->y = (int16_t)(temp[3] << 8 | temp[2]);
		data->z = (int16_t)(temp[5] << 8 | temp[4]);
		return true;
	}
	return false;
}
*/

/*
uint8_t ak09916_mag_read_uT(ak09916_magno_data* data)
{
	ak09916_magno_data temp;
	uint8_t new_data = ak09916_mag_read(&temp);
	if(!new_data)	return false;

	data->x = (float)(temp.x * 0.15);
	data->y = (float)(temp.y * 0.15);
	data->z = (float)(temp.z * 0.15);

	return true;
}
*/

/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
void ak09916_soft_reset(void) {

	write_single_ak09916_reg(MAG_CNTL3, 0x01);
	HAL_Delay(100);
}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
void icm20948_sleep(void) {
	uint8_t NewVal = icm20948_read_reg8(ub_0, B0_PWR_MGMT_1);

	NewVal |= 0x40;

	icm20948_write_reg8(ub_0, B0_PWR_MGMT_1, NewVal);

	HAL_Delay(100);
}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
void icm20948_odr_align_en(void) {
	icm20948_write_reg8(ub_2, B2_ODR_ALIGN_EN, 0x01);

	printf("Output Data Range is enable\n");
}


/**
 * @brief
 *
 * @param
 * @param
 *
 * @return
 */
void icm20948_gyro_low_pass_filter(uint8_t config)
{
	uint8_t newVal = icm20948_read_reg8(ub_2, B2_GYRO_CONFIG_1);

	newVal |= ((1125 / 1 + config) << 3);

	icm20948_write_reg8(ub_2, B2_GYRO_CONFIG_1, newVal);

	printf("ICM 20948 Gyroscope low pass filter configuration: %d\n", config);
}


/**
 * @brief
 *
 * @param
 *
 * @return
 */
void icm20948_accel_low_pass_filter(uint8_t config)
{
	uint8_t newVal = icm20948_read_reg8(ub_2, B2_ACCEL_CONFIG);

	newVal |= (config << 3);

	icm20948_write_reg8(ub_2, B2_ACCEL_CONFIG, newVal);

	printf("ICM 20948 Accelerometer low pass filter configuration: %d\n", config);
}


/**
 * @brief Gyro sample rate divider. Divides the internal sample rate to
 *        generate the sample rate that controls sensor data output rate,
 *        FIFO sample rate, and DMP sequence rate.
 *
 * NOTE: This register is only effective when FCHOICE = 1’b1 (FCHOICE_B register bit is 1’b0), and (0 < DLPF_CFG < 7).
 *
 *		 Name: GYRO_SMPLRT_DIV
 *		 Address: 0 (00h)
 *		 Type: USR2
 *		 Bank: 2
 *		 Serial IF: R/W
 *		 Reset Value: 0x00
 *
 * @param
 *
 * @return none
 */
void icm20948_gyro_sample_rate_divider(uint8_t divider)
{
	icm20948_write_reg8(ub_2, B2_GYRO_SMPLRT_DIV, 1.1 / (1 + divider));

	printf("ICM 20948 Gyroscope sample rate divider: %d\n", divider);
}


/**
 * @brief
 *
 *       Name: ACCEL_SMPLRT_DIV_1
 *       Address: 16 (10h)
 *       Type: USR2
 *       Bank: 2
 *       Serial IF: R/W
 *       Reset Value: 0x00
 *
 *       ACCEL_SMPLRT_DIV[11:8]: MSB for ACCEL sample rate div.
 *
 *       Name: ACCEL_SMPLRT_DIV_2
 *       Address: 17 (11h)
 *       Type: USR2
 *       Bank: 2
 *       Serial IF: R/W
 *       Reset Value: 0x00
 *
 *       ACCEL_SMPLRT_DIV[7:0]: LSB for ACCEL sample rate div.ODR is computed as follows:1.125 kHz/(1+ACCEL_SMPLRT_DIV[11:0])
 *
 * @param
 *
 * @return
 */
void icm20948_accel_sample_rate_divider(uint16_t divider)
{
	uint8_t accel_smplrt_divider_mbs = (uint8_t)(divider >> 8);
	uint8_t accel_smplrt_divider_lsb = (uint8_t)(0x0F & divider);

	icm20948_write_reg8(ub_2, B2_ACCEL_SMPLRT_DIV_1, accel_smplrt_divider_mbs);
	icm20948_write_reg8(ub_2, B2_ACCEL_SMPLRT_DIV_2, accel_smplrt_divider_lsb);

	printf("ICM 20948 Accelerometer sample rate divider: %d\n", divider);

}


/**
 * @brief
 *
 * @param
 *
 * @return
 */
void icm20948_gyro_full_scale_select(gyro_full_scale full_scale)
{
	uint8_t new_val = icm20948_read_reg8(ub_2, B2_GYRO_CONFIG_1);

	switch(full_scale)
	{
		case _250dps :
			new_val |= 0x00;
			gyro_scale_factor_ = 131.0f;
			break;
		case _500dps :
			new_val |= 0x02;
			gyro_scale_factor_ = 65.5f;
			break;
		case _1000dps :
			new_val |= 0x04;
			gyro_scale_factor_ = 32.8f;
			break;
		case _2000dps :
			new_val |= 0x06;
			gyro_scale_factor_ = 16.4f;
			break;
	}

	icm20948_write_reg8(ub_2, B2_GYRO_CONFIG_1, new_val);
}


/**
 * @brief
 *
 * @param
 *
 * @return
 */
void icm20948_accel_full_scale_select(accel_full_scale full_scale)
{
	uint8_t new_val = icm20948_read_reg8(ub_2, B2_ACCEL_CONFIG);

	switch(full_scale)
	{
		case _2g :
			new_val |= 0x00;
			accel_scale_factor_ = 16384.0f; //Sensitivity Scale Factor -> ACCEL_FS=0
			break;
		case _4g :
			new_val |= 0x02;
			accel_scale_factor_ = 8192.0f; //Sensitivity Scale Factor -
			break;
		case _8g :
			new_val |= 0x04;
			accel_scale_factor_ = 4096.0f; // Sensitivity Scale Factor
			break;
		case _16g :
			new_val |= 0x06;
			accel_scale_factor_ = 2048.0f; // Sensitivity Scale Factor
			break;
	}

	icm20948_write_reg8(ub_2, B2_ACCEL_CONFIG, new_val);
}


/**
 * @brief
 *
 * @param
 *
 * @return
 */
void icm20948_i2c_master_reset(void)
{
	uint8_t temp = icm20948_read_reg8(ub_0, B0_USER_CTRL);

	temp |= 0x2;

	icm20948_write_reg8(ub_0, B0_USER_CTRL, temp);
}


/**
 * @brief
 *
 * @param
 *
 * @return
 */
void icm20948_i2c_master_enable(void)
{
	uint8_t temp = icm20948_read_reg8(ub_0, B0_USER_CTRL);

	temp |= 0x20;

	icm20948_write_reg8(ub_0, B0_USER_CTRL, temp);
	HAL_Delay(100);
}


/**
 * @brief
 *
 * @param
 *
 * @return
 */
void icm20948_i2c_clk_frq(uint8_t config)
{
	uint8_t temp = icm20948_read_reg8(ub_3, B3_I2C_MST_CTRL);

	temp |= config;

	icm20948_write_reg8(ub_3, B3_I2C_MST_CTRL, temp);
}


/**
 * @brief
 *
 * @param
 *
 * @return
 */
void ak09916_operation_mode_setting(operation_mode mode)
{
	write_single_ak09916_reg(MAG_CNTL2, mode);
	HAL_Delay(100);
}


void icm20948_dmp_enable(void) {
	uint8_t temp = icm20948_read_reg8(ub_0, B0_USER_CTRL);

	temp |= 0x80;

	icm20948_write_reg8(ub_0, B0_USER_CTRL, temp);
}

void icm20948_fifo_enable(void) {
	uint8_t temp = icm20948_read_reg8(ub_0, B0_USER_CTRL);

	temp |= 0x40;

	icm20948_write_reg8(ub_0, B0_USER_CTRL, temp);
}

void icm20948_accel_fifo_enable(void) {
	uint8_t temp = icm20948_read_reg8(ub_0, B0_FIFO_EN_2);

	temp |= 0x10;

	icm20948_write_reg8(ub_0, B0_FIFO_EN_2, temp);
}

void icm20948_gyrox_fifo_enable(void) {
	uint8_t temp = icm20948_read_reg8(ub_0, B0_FIFO_EN_2);

	temp |= 0x2;

	icm20948_write_reg8(ub_0, B0_FIFO_EN_2, temp);
}

void icm20948_gyroy_fifo_enable(void) {
	uint8_t temp = icm20948_read_reg8(ub_0, B0_FIFO_EN_2);

	temp |= 0x4;

	icm20948_write_reg8(ub_0, B0_FIFO_EN_2, temp);
}

void icm20948_gyroz_fifo_enable(void) {
	uint8_t temp = icm20948_read_reg8(ub_0, B0_FIFO_EN_2);

	temp |= 0x8;

	icm20948_write_reg8(ub_0, B0_FIFO_EN_2, temp);
}

void icm20948_temp_fifo_enable(void) {
	uint8_t temp = icm20948_read_reg8(ub_0, B0_FIFO_EN_2);

	temp |= 0x1;

	icm20948_write_reg8(ub_0, B0_FIFO_EN_2, temp);
}

/**
 * @brief
 *
 * @param
 *
 * @return
 */
