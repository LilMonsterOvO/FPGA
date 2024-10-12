`timescale  1ns/1ns   //仿真的单位/仿真的精度
module uart_tb();
//parameter define
parameter  CLK_PERIOD = 20;//时钟周期为20ns
//reg define
reg            sys_clk  ;  //时钟信号
reg            sys_rst_n;  //复位信号
reg            uart_rxd ;  //UART接收端口
//wire define
wire           uart_txd ;  //UART发送端口
//*****************************************************
//**                    main code
//*****************************************************
//发送8'h55  8'b0101_0101等
initial begin
    sys_clk <= 1'b0;
    sys_rst_n <= 1'b0;
    uart_rxd <= 1'b1;
    #200
    sys_rst_n <= 1'b1;  
    #1000
    uart_rxd <= 1'b0;   //A起始位
    #8680
    uart_rxd <= 1'b1;   //D0
    #8680
    uart_rxd <= 1'b0;   //D1
    #8680
    uart_rxd <= 1'b0;   //D2
    #8680
    uart_rxd <= 1'b0;   //D3
    #8680
    uart_rxd <= 1'b0;   //D4
    #8680
    uart_rxd <= 1'b0;   //D5
    #8680
    uart_rxd <= 1'b1;   //D6
    #8680
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态 
	#1000
    uart_rxd <= 1'b0;   //B起始位
    #8680
    uart_rxd <= 1'b0;   //D0
    #8680       
    uart_rxd <= 1'b1;   //D1
    #8680       
    uart_rxd <= 1'b0;   //D2
    #8680       
    uart_rxd <= 1'b0;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
	#1000
    uart_rxd <= 1'b0;   //C起始位
    #8680
    uart_rxd <= 1'b1;   //D0
    #8680       
    uart_rxd <= 1'b1;   //D1
    #8680       
    uart_rxd <= 1'b0;   //D2
    #8680       
    uart_rxd <= 1'b0;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
	#1000
    uart_rxd <= 1'b0;   //D起始位
    #8680
    uart_rxd <= 1'b0;   //D0
    #8680       
    uart_rxd <= 1'b0;   //D1
    #8680       
    uart_rxd <= 1'b1;   //D2
    #8680       
    uart_rxd <= 1'b0;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
	#1000
    uart_rxd <= 1'b0;   //E起始位
    #8680
    uart_rxd <= 1'b1;   //D0
    #8680       
    uart_rxd <= 1'b0;   //D1
    #8680       
    uart_rxd <= 1'b1;   //D2
    #8680       
    uart_rxd <= 1'b0;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
	#1000
	uart_rxd <= 1'b0;   //F起始位
    #8680
    uart_rxd <= 1'b0;   //D0
    #8680
    uart_rxd <= 1'b1;   //D1
    #8680
    uart_rxd <= 1'b1;   //D2
    #8680
    uart_rxd <= 1'b0;   //D3
    #8680
    uart_rxd <= 1'b0;   //D4
    #8680
    uart_rxd <= 1'b0;   //D5
    #8680
    uart_rxd <= 1'b1;   //D6
    #8680
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态 
	#1000
    uart_rxd <= 1'b0;   //G起始位
    #8680
    uart_rxd <= 1'b1;   //D0
    #8680       
    uart_rxd <= 1'b1;   //D1
    #8680       
    uart_rxd <= 1'b1;   //D2
    #8680       
    uart_rxd <= 1'b0;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
	#1000
    uart_rxd <= 1'b0;   //H起始位
    #8680
    uart_rxd <= 1'b0;   //D0
    #8680       
    uart_rxd <= 1'b0;   //D1
    #8680       
    uart_rxd <= 1'b0;   //D2
    #8680       
    uart_rxd <= 1'b1;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
	#1000
    uart_rxd <= 1'b0;   //I起始位
    #8680
    uart_rxd <= 1'b1;   //D0
    #8680       
    uart_rxd <= 1'b0;   //D1
    #8680       
    uart_rxd <= 1'b0;   //D2
    #8680       
    uart_rxd <= 1'b1;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
	#1000
    uart_rxd <= 1'b0;   //J起始位
    #8680
    uart_rxd <= 1'b0;   //D0
    #8680       
    uart_rxd <= 1'b1;   //D1
    #8680       
    uart_rxd <= 1'b0;   //D2
    #8680       
    uart_rxd <= 1'b1;   //D3
    #8680       
    uart_rxd <= 1'b0;   //D4
    #8680       
    uart_rxd <= 1'b0;   //D5
    #8680       
    uart_rxd <= 1'b1;   //D6
    #8680       
    uart_rxd <= 1'b0;   //D7 
    #8680
    uart_rxd <= 1'b1;   //停止位
    #8680
    uart_rxd <= 1'b1;   //空闲状态
end
//50Mhz的时钟，周期则为1/50Mhz=20ns,所以每10ns，电平取反一次
always #(CLK_PERIOD/2) sys_clk = ~sys_clk;
//例化顶层模块
uart_fifo u_uart_fifo(
    .sys_clk      (sys_clk  ), 
    .sys_rst_n    (sys_rst_n),
    .uart_rxd     (uart_rxd ),
    .uart_txd     (uart_txd )
    );
endmodule