//****************************************Copyright (c)***********************************//
                             
//----------------------------------------------------------------------------------------
// File name:           uart_fifo
// Modified by:         郑州轻工业大学-刘浩然
// Last modified Date:  2024/10/7 
// Last Version:        V1.0
// Descriptions:        FIFO结合UART通信
//----------------------------------------------------------------------------------------
// File name:           uart_loopback
// Created by:          正点原子
// Created date:        2023年2月16日14:20:02
// Version:             V1.0
// Descriptions:        串口实验
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module uart_fifo(
    input            sys_clk  ,   	//外部50MHz时钟
    input            sys_rst_n,   	//系外部复位信号，低有效
		
    //UART端口    	
    input            uart_rxd ,   	//UART接收端口
    output           uart_txd     	//UART发送端口
    );	
//parameter define	
parameter CLK_FREQ = 50000000	;    	//定义系统时钟频率
parameter UART_BPS = 115200  	;    	//定义串口波特率
//wire define	
wire         	uart_rx_done	;     	//UART接收完成信号
wire    [7:0]  	uart_rx_data	;     	//UART接收数据
wire    [7:0]  	uart_tx_data	;     	//UART发送数据
wire            uart_tx_en  	; 	  	//端口使能
wire            uart_tx_busy  	; 	  	//端口BUSY

//*****************************************************
//**                    main code
//*****************************************************

//串口接收模块
uart_rx #(
    .CLK_FREQ  (CLK_FREQ),
    .UART_BPS  (UART_BPS)
    )    
    u_uart_rx(
    .clk           (sys_clk     ),
    .rst_n         (sys_rst_n   ),
    .uart_rxd      (uart_rxd    ),
    .uart_rx_done  (uart_rx_done),
    .uart_rx_data  (uart_rx_data)
    );
	
//FIFO控制模块
fifo_control u_fifo_control(
	.clk			(sys_clk		),
    .rst_n			(sys_rst_n		),       	
    .uart_rx_done	(uart_rx_done	),
	.uart_rx_data   (uart_rx_data	),
	.uart_tx_busy   (uart_tx_busy	),
	.uart_tx_en 	(uart_tx_en 	),
	.uart_tx_data   (uart_tx_data	)
    );

//串口发送模块
uart_tx #(
    .CLK_FREQ  (CLK_FREQ),
    .UART_BPS  (UART_BPS)
    )    
    u_uart_tx(
    .clk          (sys_clk     	),
    .rst_n        (sys_rst_n   	),
    .uart_tx_en   (uart_tx_en	),
    .uart_tx_data (uart_tx_data	),
    .uart_txd     (uart_txd    	),
    .uart_tx_busy (uart_tx_busy	)
    );
    
endmodule