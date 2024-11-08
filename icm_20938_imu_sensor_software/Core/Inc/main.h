/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */


/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/

/* USER CODE BEGIN Private defines */
typedef struct {
	float X;
	float Y;
	float Z;
} accel_data_t;

typedef struct {
	float X;
	float Y;
	float Z;
} gyro_data_t;

typedef struct {
	float X;
	float Y;
	float Z;
} magno_data_t;

typedef enum {
	/* Application signals */
	CONN_OK_SIG,
	CONN_FAULT_SIG,
	INIT_OK_SIG,
	INIT_ERR_SIG,
	MEAS_OK_SIG,
	MEAS_ERROR_SIG,
	CLEAR_SIG,
	/* Internal activity signals */
	ENTRY_SIG,
	EXIT_SIG
} imu_signal_t;

typedef enum  {
	IDLE,
	INIT,
	MEASUREMENT,
	INIT_ERROR,
	CONN_ERROR,
	MEAS_ERROR
} imu_state_t;

typedef struct {
	uint8_t      sensor_id;
	accel_data_t accel_data;
	gyro_data_t  gyro_data;
	magno_data_t magno_data;
	uint8_t      connection_status;
	imu_state_t  acctive_state;
} imu_t;

/* Generic (Super) event structrure */
typedef struct {
	uint8_t sig;
} event_t;

/* For system generated event */
typedef struct {
	event_t super;
	uint8_t ss;
} imu_sys_event_t;

/* For tick event */
typedef struct {
	event_t super;
} tick_event_t;

typedef enum {
	EVENT_HANDLED,
	EVENT_IGNORED,
	EVENT_TRANSITION
} event_status_t;

void imu_init(imu_t *mobj);
event_status_t imu_state_machine(imu_t *const mobj, event_t const *const e);

/*
typedef enum {

};
*/

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
