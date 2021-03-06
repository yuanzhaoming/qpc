;/***************************************************************************/
; * @file     startup_stm32h743xx.s for IAR ARM assembler
; * @brief    CMSIS Cortex-M7 Core Device Startup File for STM32H74xx devices
; * @version  CMSIS 5.0.1
; * @date     2018-Jan-29
; *
; * @description
; * Created from the CMSIS template for the specified device
; * Quantum Leaps, www.state-machine.com
; *
; * @note
; * The function assert_failed defined at the end of this file defines
; * the error/assertion handling policy for the application and might
; * need to be customized for each project. This function is defined in
; * assembly to re-set the stack pointer, in case it is corrupted by the
; * time assert_failed is called.
; *
;/******************** (C) COPYRIGHT 2017 STMicroelectronics ********************
;* File Name          : startup_stm32h743xx.s
;* Author             : MCD Application Team
;* version            : V1.2.0
;* Date               : 29-December-2017
;* Description        : STM32H743xx devices vector table for EWARM toolchain.
;*                      This module performs:
;*                      - Set the initial SP
;*                      - Set the initial PC == _iar_program_start,
;*                      - Set the vector table entries with the exceptions ISR
;*                        address.
;*                      - Branches to main in the C library (which eventually
;*                        calls main()).
;*                      After Reset the Cortex-M processor is in Thread mode,
;*                      priority is Privileged, and the Stack is set to Main.
;********************************************************************************
;*
;* Redistribution and use in source and binary forms, with or without modification,
;* are permitted provided that the following conditions are met:
;*   1. Redistributions of source code must retain the above copyright notice,
;*      this list of conditions and the following disclaimer.
;*   2. Redistributions in binary form must reproduce the above copyright notice,
;*      this list of conditions and the following disclaimer in the documentation
;*      and/or other materials provided with the distribution.
;*   3. Neither the name of STMicroelectronics nor the names of its contributors
;*      may be used to endorse or promote products derived from this software
;*      without specific prior written permission.
;*
;* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
;* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
;* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;*
;*******************************************************************************
;
;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbol _program_start or
; a user defined start symbol.
; To override the cstartup defined in the library, simply add your modified
; version to the workbench project.
;
; The vector table is normally located at address 0.
; When debugging in RAM, it can be located in RAM, aligned to at least 2^6.
; The name "__vector_table" has special meaning for C-SPY:
; it is where the SP start value is found, and the NVIC vector
; table register (VTOR) is initialized to this address if != 0.
;
; Cortex-M version
;---------------------------------------------------------------------------*/

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        PUBLIC  __vector_table
        PUBLIC  __Vectors
        PUBLIC  __Vectors_End
        PUBLIC  __Vectors_Size

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
        DATA
__vector_table
        DCD     sfe(CSTACK)
        DCD     Reset_Handler               ; Reset Handler
        DCD     NMI_Handler                 ; NMI Handler
        DCD     HardFault_Handler           ; Hard Fault Handler
        DCD     MemManage_Handler           ; The MPU fault handler
        DCD     BusFault_Handler            ; The bus fault handler
        DCD     UsageFault_Handler          ; The usage fault handler
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     SVC_Handler                 ; SVCall handler
        DCD     DebugMon_Handler            ; Debug monitor handler
        DCD     0                           ; Reserved
        DCD     PendSV_Handler              ; The PendSV handler
        DCD     SysTick_Handler             ; The SysTick handler

        ; IRQ handlers...
        DCD     WWDG_IRQHandler             ; Window WatchDog Interrupt ( wwdg1_it)
        DCD     PVD_AVD_IRQHandler          ; PVD/AVD through EXTI Line detection
        DCD     TAMP_STAMP_IRQHandler       ; Tamper and TimeStamps through EXTI line
        DCD     RTC_WKUP_IRQHandler         ; RTC Wakeup through the EXTI line
        DCD     FLASH_IRQHandler            ; FLASH
        DCD     RCC_IRQHandler              ; RCC
        DCD     EXTI0_IRQHandler            ; EXTI Line0
        DCD     EXTI1_IRQHandler            ; EXTI Line1
        DCD     EXTI2_IRQHandler            ; EXTI Line2
        DCD     EXTI3_IRQHandler            ; EXTI Line3
        DCD     EXTI4_IRQHandler            ; EXTI Line4
        DCD     DMA1_Stream0_IRQHandler     ; DMA1 Stream 0
        DCD     DMA1_Stream1_IRQHandler     ; DMA1 Stream 1
        DCD     DMA1_Stream2_IRQHandler     ; DMA1 Stream 2
        DCD     DMA1_Stream3_IRQHandler     ; DMA1 Stream 3
        DCD     DMA1_Stream4_IRQHandler     ; DMA1 Stream 4
        DCD     DMA1_Stream5_IRQHandler     ; DMA1 Stream 5
        DCD     DMA1_Stream6_IRQHandler     ; DMA1 Stream 6
        DCD     ADC_IRQHandler              ; ADC1, ADC2
        DCD     FDCAN1_IT0_IRQHandler       ; FDCAN1 interrupt line 0
        DCD     FDCAN2_IT0_IRQHandler       ; FDCAN2 interrupt line 0
        DCD     FDCAN1_IT1_IRQHandler       ; FDCAN1 interrupt line 1
        DCD     FDCAN2_IT1_IRQHandler       ; FDCAN2 interrupt line 1
        DCD     EXTI9_5_IRQHandler          ; External Line[9:5]s
        DCD     TIM1_BRK_IRQHandler         ; TIM1 Break interrupt
        DCD     TIM1_UP_IRQHandler          ; TIM1 Update
        DCD     TIM1_TRG_COM_IRQHandler     ; TIM1 Trigger and Commutation Interrupt
        DCD     TIM1_CC_IRQHandler          ; TIM1 Capture Compare
        DCD     TIM2_IRQHandler             ; TIM2
        DCD     TIM3_IRQHandler             ; TIM3
        DCD     TIM4_IRQHandler             ; TIM4
        DCD     I2C1_EV_IRQHandler          ; I2C1 Event
        DCD     I2C1_ER_IRQHandler          ; I2C1 Error
        DCD     I2C2_EV_IRQHandler          ; I2C2 Event
        DCD     I2C2_ER_IRQHandler          ; I2C2 Error
        DCD     SPI1_IRQHandler             ; SPI1
        DCD     SPI2_IRQHandler             ; SPI2
        DCD     USART1_IRQHandler           ; USART1
        DCD     USART2_IRQHandler           ; USART2
        DCD     USART3_IRQHandler           ; USART3
        DCD     EXTI15_10_IRQHandler        ; External Line[15:10]
        DCD     RTC_Alarm_IRQHandler        ; RTC Alarm (A and B) through EXTI Line
        DCD     0                           ; Reserved
        DCD     TIM8_BRK_TIM12_IRQHandler   ; TIM8 Break Interrupt and TIM12 global interrupt
        DCD     TIM8_UP_TIM13_IRQHandler    ; TIM8 Update Interrupt and TIM13 global interrupt
        DCD     TIM8_TRG_COM_TIM14_IRQHandler ; TIM8 Trigger and Commutation Interrupt and TIM14 glob
        DCD     TIM8_CC_IRQHandler          ; TIM8 Capture Compare Interrupt
        DCD     DMA1_Stream7_IRQHandler     ; DMA1 Stream7
        DCD     FMC_IRQHandler              ; FMC
        DCD     SDMMC1_IRQHandler           ; SDMMC1
        DCD     TIM5_IRQHandler             ; TIM5
        DCD     SPI3_IRQHandler             ; SPI3
        DCD     UART4_IRQHandler            ; UART4
        DCD     UART5_IRQHandler            ; UART5
        DCD     TIM6_DAC_IRQHandler         ; TIM6 and DAC1&2 underrun errors
        DCD     TIM7_IRQHandler             ; TIM7
        DCD     DMA2_Stream0_IRQHandler     ; DMA2 Stream 0
        DCD     DMA2_Stream1_IRQHandler     ; DMA2 Stream 1
        DCD     DMA2_Stream2_IRQHandler     ; DMA2 Stream 2
        DCD     DMA2_Stream3_IRQHandler     ; DMA2 Stream 3
        DCD     DMA2_Stream4_IRQHandler     ; DMA2 Stream 4
        DCD     ETH_IRQHandler              ; Ethernet
        DCD     ETH_WKUP_IRQHandler         ; Ethernet Wakeup through EXTI line
        DCD     FDCAN_CAL_IRQHandler        ; FDCAN calibration unit interrupt
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     DMA2_Stream5_IRQHandler     ; DMA2 Stream 5
        DCD     DMA2_Stream6_IRQHandler     ; DMA2 Stream 6
        DCD     DMA2_Stream7_IRQHandler     ; DMA2 Stream 7
        DCD     USART6_IRQHandler           ; USART6
        DCD     I2C3_EV_IRQHandler          ; I2C3 event
        DCD     I2C3_ER_IRQHandler          ; I2C3 error
        DCD     OTG_HS_EP1_OUT_IRQHandler   ; USB OTG HS End Point 1 Out
        DCD     OTG_HS_EP1_IN_IRQHandler    ; USB OTG HS End Point 1 In
        DCD     OTG_HS_WKUP_IRQHandler      ; USB OTG HS Wakeup through EXTI
        DCD     OTG_HS_IRQHandler           ; USB OTG HS
        DCD     DCMI_IRQHandler             ; DCMI
        DCD     0                           ; Reserved
        DCD     RNG_IRQHandler              ; Rng
        DCD     FPU_IRQHandler              ; FPU
        DCD     UART7_IRQHandler            ; UART7
        DCD     UART8_IRQHandler            ; UART8
        DCD     SPI4_IRQHandler             ; SPI4
        DCD     SPI5_IRQHandler             ; SPI5
        DCD     SPI6_IRQHandler             ; SPI6
        DCD     SAI1_IRQHandler             ; SAI1
        DCD     LTDC_IRQHandler             ; LTDC
        DCD     LTDC_ER_IRQHandler          ; LTDC error
        DCD     DMA2D_IRQHandler            ; DMA2D
        DCD     SAI2_IRQHandler             ; SAI2
        DCD     QUADSPI_IRQHandler          ; QUADSPI
        DCD     LPTIM1_IRQHandler           ; LPTIM1
        DCD     CEC_IRQHandler              ; HDMI_CEC
        DCD     I2C4_EV_IRQHandler          ; I2C4 Event
        DCD     I2C4_ER_IRQHandler          ; I2C4 Error
        DCD     SPDIF_RX_IRQHandler         ; SPDIF_RX
        DCD     OTG_FS_EP1_OUT_IRQHandler   ; USB OTG FS End Point 1 Out
        DCD     OTG_FS_EP1_IN_IRQHandler    ; USB OTG FS End Point 1 In
        DCD     OTG_FS_WKUP_IRQHandler      ; USB OTG FS Wakeup through EXTI
        DCD     OTG_FS_IRQHandler           ; USB OTG FS
        DCD     DMAMUX1_OVR_IRQHandler      ; DMAMUX1 Overrun interrupt
        DCD     HRTIM1_Master_IRQHandler    ; HRTIM Master Timer global Interrupts
        DCD     HRTIM1_TIMA_IRQHandler      ; HRTIM Timer A global Interrupt
        DCD     HRTIM1_TIMB_IRQHandler      ; HRTIM Timer B global Interrupt
        DCD     HRTIM1_TIMC_IRQHandler      ; HRTIM Timer C global Interrupt
        DCD     HRTIM1_TIMD_IRQHandler      ; HRTIM Timer D global Interrupt
        DCD     HRTIM1_TIME_IRQHandler      ; HRTIM Timer E global Interrupt
        DCD     HRTIM1_FLT_IRQHandler       ; HRTIM Fault global Interrupt
        DCD     DFSDM1_FLT0_IRQHandler      ; DFSDM Filter0 Interrupt
        DCD     DFSDM1_FLT1_IRQHandler      ; DFSDM Filter1 Interrupt
        DCD     DFSDM1_FLT2_IRQHandler      ; DFSDM Filter2 Interrupt
        DCD     DFSDM1_FLT3_IRQHandler      ; DFSDM Filter3 Interrupt
        DCD     SAI3_IRQHandler             ; SAI3 global Interrupt
        DCD     SWPMI1_IRQHandler           ; Serial Wire Interface 1 global interrupt
        DCD     TIM15_IRQHandler            ; TIM15 global Interrupt
        DCD     TIM16_IRQHandler            ; TIM16 global Interrupt
        DCD     TIM17_IRQHandler            ; TIM17 global Interrupt
        DCD     MDIOS_WKUP_IRQHandler       ; MDIOS Wakeup  Interrupt
        DCD     MDIOS_IRQHandler            ; MDIOS global Interrupt
        DCD     JPEG_IRQHandler             ; JPEG global Interrupt
        DCD     MDMA_IRQHandler             ; MDMA global Interrupt
        DCD     0                           ; Reserved
        DCD     SDMMC2_IRQHandler           ; SDMMC2 global Interrupt
        DCD     HSEM1_IRQHandler            ; HSEM1 global Interrupt
        DCD     0                           ; Reserved
        DCD     ADC3_IRQHandler             ; ADC3 global Interrupt
        DCD     DMAMUX2_OVR_IRQHandler      ; DMAMUX Overrun interrupt
        DCD     BDMA_Channel0_IRQHandler    ; BDMA Channel 0 global Interrupt
        DCD     BDMA_Channel1_IRQHandler    ; BDMA Channel 1 global Interrupt
        DCD     BDMA_Channel2_IRQHandler    ; BDMA Channel 2 global Interrupt
        DCD     BDMA_Channel3_IRQHandler    ; BDMA Channel 3 global Interrupt
        DCD     BDMA_Channel4_IRQHandler    ; BDMA Channel 4 global Interrupt
        DCD     BDMA_Channel5_IRQHandler    ; BDMA Channel 5 global Interrupt
        DCD     BDMA_Channel6_IRQHandler    ; BDMA Channel 6 global Interrupt
        DCD     BDMA_Channel7_IRQHandler    ; BDMA Channel 7 global Interrupt
        DCD     COMP1_IRQHandler            ; COMP1 global Interrupt
        DCD     LPTIM2_IRQHandler           ; LP TIM2 global interrupt
        DCD     LPTIM3_IRQHandler           ; LP TIM3 global interrupt
        DCD     LPTIM4_IRQHandler           ; LP TIM4 global interrupt
        DCD     LPTIM5_IRQHandler           ; LP TIM5 global interrupt
        DCD     LPUART1_IRQHandler          ; LP UART1 interrupt
        DCD     0                           ; Reserved
        DCD     CRS_IRQHandler              ; Clock Recovery Global Interrupt
        DCD     0                           ; Reserved
        DCD     SAI4_IRQHandler             ; SAI4 global interrupt
        DCD     0                           ; Reserved
        DCD     0                           ; Reserved
        DCD     WAKEUP_PIN_IRQHandler       ; Interrupt for all 6 wake-up pins

__Vectors_End

__Vectors       EQU   __vector_table
__Vectors_Size  EQU   __Vectors_End - __Vectors

;******************************************************************************
;
; Weak fault handlers...
;
        SECTION .text:CODE:REORDER:NOROOT(2)

;.............................................................................
        PUBWEAK Reset_Handler
        EXTERN  SystemInit
        EXTERN  __iar_program_start
Reset_Handler
        BL      SystemInit  ; CMSIS system initialization

        ; pre-fill the CSTACK with 0xDEADBEEF...................
        LDR     r0,=0xDEADBEEF
        MOV     r1,r0
        LDR     r2,=sfb(CSTACK)
        LDR     r3,=sfe(CSTACK)
Reset_stackInit_fill:
        STMIA   r2!,{r0,r1}
        CMP     r2,r3
        BLT.N   Reset_stackInit_fill

        BL      __iar_program_start ; IAR startup code
;.............................................................................
        PUBWEAK NMI_Handler
NMI_Handler
        MOVS    r0,#0
        MOVS    r1,#2       ; NMI exception number
        B       assert_failed
;.............................................................................
        PUBWEAK HardFault_Handler
HardFault_Handler
        MOVS    r0,#0
        MOVS    r1,#3       ; HardFault exception number
        B       assert_failed
;.............................................................................
        PUBWEAK MemManage_Handler
MemManage_Handler
        MOVS    r0,#0
        MOVS    r1,#4       ; MemManage exception number
        B       assert_failed
;.............................................................................
        PUBWEAK BusFault_Handler
BusFault_Handler
        MOVS    r0,#0
        MOVS    r1,#5       ; BusFault exception number
        B       assert_failed
;.............................................................................
        PUBWEAK UsageFault_Handler
UsageFault_Handler
        MOVS    r0,#0
        MOVS    r1,#6       ; UsageFault exception number
        B       assert_failed


;******************************************************************************
;
; Weak non-fault handlers...
;

        PUBWEAK SVC_Handler
SVC_Handler
        MOVS    r0,#0
        MOVS    r1,#11      ; SVCall exception number
        B       assert_failed
;.............................................................................
        PUBWEAK DebugMon_Handler
DebugMon_Handler
        MOVS    r0,#0
        MOVS    r1,#12      ; DebugMon exception number
        B       assert_failed
;.............................................................................
        PUBWEAK PendSV_Handler
PendSV_Handler
        MOVS    r0,#0
        MOVS    r1,#14      ; PendSV exception number
        B       assert_failed
;.............................................................................
        PUBWEAK SysTick_Handler
SysTick_Handler
        MOVS    r0,#0
        MOVS    r1,#15      ; SysTick exception number
        B       assert_failed


;******************************************************************************
;
; Weak IRQ handlers...
;

        PUBWEAK WWDG_IRQHandler
        PUBWEAK PVD_AVD_IRQHandler
        PUBWEAK TAMP_STAMP_IRQHandler
        PUBWEAK RTC_WKUP_IRQHandler
        PUBWEAK FLASH_IRQHandler
        PUBWEAK RCC_IRQHandler
        PUBWEAK EXTI0_IRQHandler
        PUBWEAK EXTI1_IRQHandler
        PUBWEAK EXTI2_IRQHandler
        PUBWEAK EXTI3_IRQHandler
        PUBWEAK EXTI4_IRQHandler
        PUBWEAK DMA1_Stream0_IRQHandler
        PUBWEAK DMA1_Stream1_IRQHandler
        PUBWEAK DMA1_Stream2_IRQHandler
        PUBWEAK DMA1_Stream3_IRQHandler
        PUBWEAK DMA1_Stream4_IRQHandler
        PUBWEAK DMA1_Stream5_IRQHandler
        PUBWEAK DMA1_Stream6_IRQHandler
        PUBWEAK ADC_IRQHandler
        PUBWEAK FDCAN1_IT0_IRQHandler
        PUBWEAK FDCAN2_IT0_IRQHandler
        PUBWEAK FDCAN1_IT1_IRQHandler
        PUBWEAK FDCAN2_IT1_IRQHandler
        PUBWEAK EXTI9_5_IRQHandler
        PUBWEAK TIM1_BRK_IRQHandler
        PUBWEAK TIM1_UP_IRQHandler
        PUBWEAK TIM1_TRG_COM_IRQHandler
        PUBWEAK TIM1_CC_IRQHandler
        PUBWEAK TIM2_IRQHandler
        PUBWEAK TIM3_IRQHandler
        PUBWEAK TIM4_IRQHandler
        PUBWEAK I2C1_EV_IRQHandler
        PUBWEAK I2C1_ER_IRQHandler
        PUBWEAK I2C2_EV_IRQHandler
        PUBWEAK I2C2_ER_IRQHandler
        PUBWEAK SPI1_IRQHandler
        PUBWEAK SPI2_IRQHandler
        PUBWEAK USART1_IRQHandler
        PUBWEAK USART2_IRQHandler
        PUBWEAK USART3_IRQHandler
        PUBWEAK EXTI15_10_IRQHandler
        PUBWEAK RTC_Alarm_IRQHandler
        PUBWEAK TIM8_BRK_TIM12_IRQHandler
        PUBWEAK TIM8_UP_TIM13_IRQHandler
        PUBWEAK TIM8_TRG_COM_TIM14_IRQHandler
        PUBWEAK TIM8_CC_IRQHandler
        PUBWEAK DMA1_Stream7_IRQHandler
        PUBWEAK FMC_IRQHandler
        PUBWEAK SDMMC1_IRQHandler
        PUBWEAK TIM5_IRQHandler
        PUBWEAK SPI3_IRQHandler
        PUBWEAK UART4_IRQHandler
        PUBWEAK UART5_IRQHandler
        PUBWEAK TIM6_DAC_IRQHandler
        PUBWEAK TIM7_IRQHandler
        PUBWEAK DMA2_Stream0_IRQHandler
        PUBWEAK DMA2_Stream1_IRQHandler
        PUBWEAK DMA2_Stream2_IRQHandler
        PUBWEAK DMA2_Stream3_IRQHandler
        PUBWEAK DMA2_Stream4_IRQHandler
        PUBWEAK ETH_IRQHandler
        PUBWEAK ETH_WKUP_IRQHandler
        PUBWEAK FDCAN_CAL_IRQHandler
        PUBWEAK DMA2_Stream5_IRQHandler
        PUBWEAK DMA2_Stream6_IRQHandler
        PUBWEAK DMA2_Stream7_IRQHandler
        PUBWEAK USART6_IRQHandler
        PUBWEAK I2C3_EV_IRQHandler
        PUBWEAK I2C3_ER_IRQHandler
        PUBWEAK OTG_HS_EP1_OUT_IRQHandler
        PUBWEAK OTG_HS_EP1_IN_IRQHandler
        PUBWEAK OTG_HS_WKUP_IRQHandler
        PUBWEAK OTG_HS_IRQHandler
        PUBWEAK DCMI_IRQHandler
        PUBWEAK RNG_IRQHandler
        PUBWEAK FPU_IRQHandler
        PUBWEAK UART7_IRQHandler
        PUBWEAK UART8_IRQHandler
        PUBWEAK SPI4_IRQHandler
        PUBWEAK SPI5_IRQHandler
        PUBWEAK SPI6_IRQHandler
        PUBWEAK SAI1_IRQHandler
        PUBWEAK LTDC_IRQHandler
        PUBWEAK LTDC_ER_IRQHandler
        PUBWEAK DMA2D_IRQHandler
        PUBWEAK SAI2_IRQHandler
        PUBWEAK QUADSPI_IRQHandler
        PUBWEAK LPTIM1_IRQHandler
        PUBWEAK CEC_IRQHandler
        PUBWEAK I2C4_EV_IRQHandler
        PUBWEAK I2C4_ER_IRQHandler
        PUBWEAK SPDIF_RX_IRQHandler
        PUBWEAK OTG_FS_EP1_OUT_IRQHandler
        PUBWEAK OTG_FS_EP1_IN_IRQHandler
        PUBWEAK OTG_FS_WKUP_IRQHandler
        PUBWEAK OTG_FS_IRQHandler
        PUBWEAK DMAMUX1_OVR_IRQHandler
        PUBWEAK HRTIM1_Master_IRQHandler
        PUBWEAK HRTIM1_TIMA_IRQHandler
        PUBWEAK HRTIM1_TIMB_IRQHandler
        PUBWEAK HRTIM1_TIMC_IRQHandler
        PUBWEAK HRTIM1_TIMD_IRQHandler
        PUBWEAK HRTIM1_TIME_IRQHandler
        PUBWEAK HRTIM1_FLT_IRQHandler
        PUBWEAK DFSDM1_FLT0_IRQHandler
        PUBWEAK DFSDM1_FLT1_IRQHandler
        PUBWEAK DFSDM1_FLT2_IRQHandler
        PUBWEAK DFSDM1_FLT3_IRQHandler
        PUBWEAK SAI3_IRQHandler
        PUBWEAK SWPMI1_IRQHandler
        PUBWEAK TIM15_IRQHandler
        PUBWEAK TIM16_IRQHandler
        PUBWEAK TIM17_IRQHandler
        PUBWEAK MDIOS_WKUP_IRQHandler
        PUBWEAK MDIOS_IRQHandler
        PUBWEAK JPEG_IRQHandler
        PUBWEAK MDMA_IRQHandler
        PUBWEAK SDMMC2_IRQHandler
        PUBWEAK HSEM1_IRQHandler
        PUBWEAK ADC3_IRQHandler
        PUBWEAK DMAMUX2_OVR_IRQHandler
        PUBWEAK BDMA_Channel0_IRQHandler
        PUBWEAK BDMA_Channel1_IRQHandler
        PUBWEAK BDMA_Channel2_IRQHandler
        PUBWEAK BDMA_Channel3_IRQHandler
        PUBWEAK BDMA_Channel4_IRQHandler
        PUBWEAK BDMA_Channel5_IRQHandler
        PUBWEAK BDMA_Channel6_IRQHandler
        PUBWEAK BDMA_Channel7_IRQHandler
        PUBWEAK COMP1_IRQHandler
        PUBWEAK LPTIM2_IRQHandler
        PUBWEAK LPTIM3_IRQHandler
        PUBWEAK LPTIM4_IRQHandler
        PUBWEAK LPTIM5_IRQHandler
        PUBWEAK LPUART1_IRQHandler
        PUBWEAK CRS_IRQHandler
        PUBWEAK SAI4_IRQHandler
        PUBWEAK WAKEUP_PIN_IRQHandler


WWDG_IRQHandler
PVD_AVD_IRQHandler
TAMP_STAMP_IRQHandler
RTC_WKUP_IRQHandler
FLASH_IRQHandler
RCC_IRQHandler
EXTI0_IRQHandler
EXTI1_IRQHandler
EXTI2_IRQHandler
EXTI3_IRQHandler
EXTI4_IRQHandler
DMA1_Stream0_IRQHandler
DMA1_Stream1_IRQHandler
DMA1_Stream2_IRQHandler
DMA1_Stream3_IRQHandler
DMA1_Stream4_IRQHandler
DMA1_Stream5_IRQHandler
DMA1_Stream6_IRQHandler
ADC_IRQHandler
FDCAN1_IT0_IRQHandler
FDCAN2_IT0_IRQHandler
FDCAN1_IT1_IRQHandler
FDCAN2_IT1_IRQHandler
EXTI9_5_IRQHandler
TIM1_BRK_IRQHandler
TIM1_UP_IRQHandler
TIM1_TRG_COM_IRQHandler
TIM1_CC_IRQHandler
TIM2_IRQHandler
TIM3_IRQHandler
TIM4_IRQHandler
I2C1_EV_IRQHandler
I2C1_ER_IRQHandler
I2C2_EV_IRQHandler
I2C2_ER_IRQHandler
SPI1_IRQHandler
SPI2_IRQHandler
USART1_IRQHandler
USART2_IRQHandler
USART3_IRQHandler
EXTI15_10_IRQHandler
RTC_Alarm_IRQHandler
TIM8_BRK_TIM12_IRQHandler
TIM8_UP_TIM13_IRQHandler
TIM8_TRG_COM_TIM14_IRQHandler
TIM8_CC_IRQHandler
DMA1_Stream7_IRQHandler
FMC_IRQHandler
SDMMC1_IRQHandler
TIM5_IRQHandler
SPI3_IRQHandler
UART4_IRQHandler
UART5_IRQHandler
TIM6_DAC_IRQHandler
TIM7_IRQHandler
DMA2_Stream0_IRQHandler
DMA2_Stream1_IRQHandler
DMA2_Stream2_IRQHandler
DMA2_Stream3_IRQHandler
DMA2_Stream4_IRQHandler
ETH_IRQHandler
ETH_WKUP_IRQHandler
FDCAN_CAL_IRQHandler
DMA2_Stream5_IRQHandler
DMA2_Stream6_IRQHandler
DMA2_Stream7_IRQHandler
USART6_IRQHandler
I2C3_EV_IRQHandler
I2C3_ER_IRQHandler
OTG_HS_EP1_OUT_IRQHandler
OTG_HS_EP1_IN_IRQHandler
OTG_HS_WKUP_IRQHandler
OTG_HS_IRQHandler
DCMI_IRQHandler
RNG_IRQHandler
FPU_IRQHandler
UART7_IRQHandler
UART8_IRQHandler
SPI4_IRQHandler
SPI5_IRQHandler
SPI6_IRQHandler
SAI1_IRQHandler
LTDC_IRQHandler
LTDC_ER_IRQHandler
DMA2D_IRQHandler
SAI2_IRQHandler
QUADSPI_IRQHandler
LPTIM1_IRQHandler
CEC_IRQHandler
I2C4_EV_IRQHandler
I2C4_ER_IRQHandler
SPDIF_RX_IRQHandler
OTG_FS_EP1_OUT_IRQHandler
OTG_FS_EP1_IN_IRQHandler
OTG_FS_WKUP_IRQHandler
OTG_FS_IRQHandler
DMAMUX1_OVR_IRQHandler
HRTIM1_Master_IRQHandler
HRTIM1_TIMA_IRQHandler
HRTIM1_TIMB_IRQHandler
HRTIM1_TIMC_IRQHandler
HRTIM1_TIMD_IRQHandler
HRTIM1_TIME_IRQHandler
HRTIM1_FLT_IRQHandler
DFSDM1_FLT0_IRQHandler
DFSDM1_FLT1_IRQHandler
DFSDM1_FLT2_IRQHandler
DFSDM1_FLT3_IRQHandler
SAI3_IRQHandler
SWPMI1_IRQHandler
TIM15_IRQHandler
TIM16_IRQHandler
TIM17_IRQHandler
MDIOS_WKUP_IRQHandler
MDIOS_IRQHandler
JPEG_IRQHandler
MDMA_IRQHandler
SDMMC2_IRQHandler
HSEM1_IRQHandler
ADC3_IRQHandler
DMAMUX2_OVR_IRQHandler
BDMA_Channel0_IRQHandler
BDMA_Channel1_IRQHandler
BDMA_Channel2_IRQHandler
BDMA_Channel3_IRQHandler
BDMA_Channel4_IRQHandler
BDMA_Channel5_IRQHandler
BDMA_Channel6_IRQHandler
BDMA_Channel7_IRQHandler
COMP1_IRQHandler
LPTIM2_IRQHandler
LPTIM3_IRQHandler
LPTIM4_IRQHandler
LPTIM5_IRQHandler
LPUART1_IRQHandler
CRS_IRQHandler
SAI4_IRQHandler
WAKEUP_PIN_IRQHandler

        MOVS    r0,#0
        MOVS    r1,#0xFF
        B       assert_failed


;*****************************************************************************
; The function assert_failed defines the error/assertion handling policy
; for the application. After making sure that the stack is OK, this function
; calls Q_onAssert, which should NOT return (typically reset the CPU).
;
; NOTE: the function Q_onAssert should NOT return.
;
; The C proptotype of the assert_failed() and Q_onAssert() functions are:
; void assert_failed(char const *file, int line);
; void Q_onAssert   (char const *file, int line);
;*****************************************************************************
        PUBLIC  assert_failed
        EXTERN  Q_onAssert
assert_failed
        LDR    r2,=sfe(CSTACK)   ; load the original top of stack
        MOV    sp,r2             ; re-set the SP in case of stack overflow
        BL     Q_onAssert        ; call the application-specific handler

        B      .                 ; should not be reached, but just in case...


        END                      ; end of module

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
