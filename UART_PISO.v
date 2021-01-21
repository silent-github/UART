module uart_piso(tx_datain,shift,clk,load_data,databit);
input shift,clk;
input load_data;
input [7:0]tx_datain;
output databit;
reg [7:0]serial_data_store;

always @(posedge clk)
 begin
  if(load_data)
   begin
   serial_data_store<=tx_datain;
   end
     else
     begin
     serial_data_store[7]<=1'b0;
     serial_data_store[6]<=serial_data_store[7];
     serial_data_store[5]<=serial_data_store[6];
     serial_data_store[4]<=serial_data_store[5];
     serial_data_store[3]<=serial_data_store[4];
     serial_data_store[2]<=serial_data_store[3];
     serial_data_store[1]<=serial_data_store[2];
     serial_data_store[0]<=serial_data_store[1];
     end    
    
end
assign databit=serial_data_store[0];
endmodule
  
