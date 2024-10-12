//****************************************Copyright (c)***********************************//

//----------------------------------------------------------------------------------------
// File name:           fifo_control
// Modified by:         郑州轻工业大学-刘浩然
// Last modified Date:  2024/10/10
// Last Version:        V1.1
// Descriptions:        FIFO控制模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2021/4/7 9:30:00
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module fifo_control(
	//系统信号
    input              	clk			,	//时钟信号
    input              	rst_n		,	//复位信号
	
	//UART相关信号
    input          	  	uart_rx_done,	// UART接收完成信号
    input      [7:0] 	uart_rx_data,	// UART接收到的数据
	input            	uart_tx_busy,	// UART忙信号
	output       		uart_tx_en 	,	// UART发送使能信号
    output     [7:0] 	uart_tx_data	// 要发送给UART的数据
    );

//parameter define
localparam TIMEOUT_THRESHOLD = 16'd50000;  	// 设置超时阈值（根据时钟频率调整）

//reg define
reg                 flag 	;
reg [15:0] timeout_cnt;		// 超时计数器定义

//wire define
wire     [7:0]      wr_data ;  	//写入FIFO的数据
wire             	wr_req	;	//写请求信号
wire                wr_full ;  	//写侧满信号
wire                wr_empty;  	//写侧空信号
wire     [7:0]      wr_usedw;  //写侧FIFO中的数据量
wire     [7:0]      rd_data	;	//读出FIFO的数据
wire     	        rd_req	;	//读请求信号
wire                rd_full ;  	//读侧满信号
wire                rd_empty;  	//读侧空信号
wire     [7:0]      rd_usedw;  //读侧FIFO中的数据量

//req信号处理
assign wr_req = uart_rx_done && (~wr_full);
assign rd_req = flag && (~uart_tx_busy) && (~rd_empty);
assign uart_tx_en = rd_req ;

//数据处理
assign wr_data = uart_rx_data;
assign uart_tx_data = rd_data;

//*****************************************************
//**                    main code
//*****************************************************

// 超时计数器逻辑，当一定时间未接收到数据时超时
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        timeout_cnt <= 16'd0;
    else if (uart_rx_done)
        timeout_cnt <= 16'd0;  // 接收到数据时，复位超时计数器
    else if (timeout_cnt < TIMEOUT_THRESHOLD)
        timeout_cnt <= timeout_cnt + 1'b1;  // 如果没接收到数据，开始计时
    else
        timeout_cnt <= timeout_cnt;  // 保持计数器值不变
end

// 控制读启动信号，超时时拉高flag
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        flag <= 1'b0;
    // 当超时计数器达到预设阈值时，表示没有新的数据到来，拉高flag
    else if (timeout_cnt == TIMEOUT_THRESHOLD - 1'b1)
        flag <= 1'b1;  // 超时后，拉高读启动信号
    else
        flag <= flag;  //否则保持
end

//根据传输字节的需要情况来拉高flag
/*always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        flag <= 0;
    else if(rd_usedw > 7)  //存满8个字节拉高flag
        flag <= 1;
    else if (rd_empty)
        flag <= 0;
end*/

//*****************************************************
//**                    fifo_ip例化
//*****************************************************

//FIFO_IP核
fifo	fifo_inst (
	.aclr 		( ~rst_n	),
	.data 		( wr_data 	),
	.rdclk 		( clk 		),
	.rdreq 		( rd_req 	),
	.wrclk 		( clk 		),
	.wrreq 		( wr_req 	),
	.q 			( rd_data	),
	.rdempty 	( rd_empty 	),
	.rdfull 	( rd_full 	),
	.rdusedw 	( rd_usedw 	),
	.wrempty 	( wr_empty 	),
	.wrfull 	( wr_full 	),
	.wrusedw 	( wr_usedw 	)
	);


endmodule    
    