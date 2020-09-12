// Generator : SpinalHDL v1.3.8    git head : 57d97088b91271a094cebad32ed86479199955df
// Date      : 28/08/2020, 07:50:35
// Component : VexRiscv


`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_WFI 2'b10
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

module InstructionCache (
      input   io_flush,
      input   io_cpu_prefetch_isValid,
      output reg  io_cpu_prefetch_haltIt,
      input  [31:0] io_cpu_prefetch_pc,
      input   io_cpu_fetch_isValid,
      input   io_cpu_fetch_isStuck,
      input   io_cpu_fetch_isRemoved,
      input  [31:0] io_cpu_fetch_pc,
      output [31:0] io_cpu_fetch_data,
      output  io_cpu_fetch_mmuBus_cmd_isValid,
      output [31:0] io_cpu_fetch_mmuBus_cmd_virtualAddress,
      output  io_cpu_fetch_mmuBus_cmd_bypassTranslation,
      input  [31:0] io_cpu_fetch_mmuBus_rsp_physicalAddress,
      input   io_cpu_fetch_mmuBus_rsp_isIoAccess,
      input   io_cpu_fetch_mmuBus_rsp_allowRead,
      input   io_cpu_fetch_mmuBus_rsp_allowWrite,
      input   io_cpu_fetch_mmuBus_rsp_allowExecute,
      input   io_cpu_fetch_mmuBus_rsp_exception,
      input   io_cpu_fetch_mmuBus_rsp_refilling,
      output  io_cpu_fetch_mmuBus_end,
      input   io_cpu_fetch_mmuBus_busy,
      output [31:0] io_cpu_fetch_physicalAddress,
      output  io_cpu_fetch_cacheMiss,
      output  io_cpu_fetch_error,
      output  io_cpu_fetch_mmuRefilling,
      output  io_cpu_fetch_mmuException,
      input   io_cpu_fetch_isUser,
      output  io_cpu_fetch_haltIt,
      input   io_cpu_decode_isValid,
      input   io_cpu_decode_isStuck,
      input  [31:0] io_cpu_decode_pc,
      output [31:0] io_cpu_decode_physicalAddress,
      output [31:0] io_cpu_decode_data,
      input   io_cpu_fill_valid,
      input  [31:0] io_cpu_fill_payload,
      output  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output [31:0] io_mem_cmd_payload_address,
      output [2:0] io_mem_cmd_payload_size,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload_data,
      input   io_mem_rsp_payload_error,
      input   clk,
      input   reset);
  reg [21:0] _zz_10_;
  reg [31:0] _zz_11_;
  wire  _zz_12_;
  wire  _zz_13_;
  wire [0:0] _zz_14_;
  wire [0:0] _zz_15_;
  wire [21:0] _zz_16_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  lineLoader_fire;
  reg  lineLoader_valid;
  (* keep , syn_keep *) reg [31:0] lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg  lineLoader_hadError;
  reg  lineLoader_flushPending;
  reg [7:0] lineLoader_flushCounter;
  reg  _zz_3_;
  reg  lineLoader_cmdSent;
  reg  lineLoader_wayToAllocate_willIncrement;
  wire  lineLoader_wayToAllocate_willClear;
  wire  lineLoader_wayToAllocate_willOverflowIfInc;
  wire  lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg [2:0] lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire  lineLoader_write_tag_0_valid;
  wire [6:0] lineLoader_write_tag_0_payload_address;
  wire  lineLoader_write_tag_0_payload_data_valid;
  wire  lineLoader_write_tag_0_payload_data_error;
  wire [19:0] lineLoader_write_tag_0_payload_data_address;
  wire  lineLoader_write_data_0_valid;
  wire [9:0] lineLoader_write_data_0_payload_address;
  wire [31:0] lineLoader_write_data_0_payload_data;
  wire  _zz_4_;
  wire [6:0] _zz_5_;
  wire  _zz_6_;
  wire  fetchStage_read_waysValues_0_tag_valid;
  wire  fetchStage_read_waysValues_0_tag_error;
  wire [19:0] fetchStage_read_waysValues_0_tag_address;
  wire [21:0] _zz_7_;
  wire [9:0] _zz_8_;
  wire  _zz_9_;
  wire [31:0] fetchStage_read_waysValues_0_data;
  wire  fetchStage_hit_hits_0;
  wire  fetchStage_hit_valid;
  wire  fetchStage_hit_error;
  wire [31:0] fetchStage_hit_data;
  wire [31:0] fetchStage_hit_word;
  (* ram_style = "block" *) reg [21:0] ways_0_tags [0:127];
  (* ram_style = "block" *) reg [31:0] ways_0_datas [0:1023];
  assign _zz_12_ = (! lineLoader_flushCounter[7]);
  assign _zz_13_ = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_14_ = _zz_7_[0 : 0];
  assign _zz_15_ = _zz_7_[1 : 1];
  assign _zz_16_ = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_16_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_6_) begin
      _zz_10_ <= ways_0_tags[_zz_5_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_) begin
      ways_0_datas[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_9_) begin
      _zz_11_ <= ways_0_datas[_zz_8_];
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_2_ = 1'b1;
    end
  end

  assign io_cpu_fetch_haltIt = io_cpu_fetch_mmuBus_busy;
  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == (3'b111)))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_12_)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_3_))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],(5'b00000)};
  assign io_mem_cmd_payload_size = (3'b101);
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if((! lineLoader_valid))begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign _zz_4_ = 1'b1;
  assign lineLoader_write_tag_0_valid = ((_zz_4_ && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && _zz_4_);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_5_ = io_cpu_prefetch_pc[11 : 5];
  assign _zz_6_ = (! io_cpu_fetch_isStuck);
  assign _zz_7_ = _zz_10_;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_14_[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_15_[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_7_[21 : 2];
  assign _zz_8_ = io_cpu_prefetch_pc[11 : 2];
  assign _zz_9_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = _zz_11_;
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_valid = (fetchStage_hit_hits_0 != (1'b0));
  assign fetchStage_hit_error = fetchStage_read_waysValues_0_tag_error;
  assign fetchStage_hit_data = fetchStage_read_waysValues_0_data;
  assign fetchStage_hit_word = fetchStage_hit_data;
  assign io_cpu_fetch_data = fetchStage_hit_word;
  assign io_cpu_fetch_mmuBus_cmd_isValid = io_cpu_fetch_isValid;
  assign io_cpu_fetch_mmuBus_cmd_virtualAddress = io_cpu_fetch_pc;
  assign io_cpu_fetch_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_fetch_mmuBus_end = ((! io_cpu_fetch_isStuck) || io_cpu_fetch_isRemoved);
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuBus_rsp_physicalAddress;
  assign io_cpu_fetch_cacheMiss = (! fetchStage_hit_valid);
  assign io_cpu_fetch_error = fetchStage_hit_error;
  assign io_cpu_fetch_mmuRefilling = io_cpu_fetch_mmuBus_rsp_refilling;
  assign io_cpu_fetch_mmuException = ((! io_cpu_fetch_mmuBus_rsp_refilling) && (io_cpu_fetch_mmuBus_rsp_exception || (! io_cpu_fetch_mmuBus_rsp_allowExecute)));
  always @ (posedge clk) begin
    if(reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= (3'b000);
    end else begin
      if(lineLoader_fire)begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire)begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid)begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush)begin
        lineLoader_flushPending <= 1'b1;
      end
      if(_zz_13_)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + (3'b001));
        if(io_mem_rsp_payload_error)begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(io_cpu_fill_valid)begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(_zz_12_)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + (8'b00000001));
    end
    _zz_3_ <= lineLoader_flushCounter[7];
    if(_zz_13_)begin
      lineLoader_flushCounter <= (8'b00000000);
    end
  end

endmodule

module DataCache (
      input   io_cpu_execute_isValid,
      input  [31:0] io_cpu_execute_address,
      input   io_cpu_execute_args_wr,
      input  [31:0] io_cpu_execute_args_data,
      input  [1:0] io_cpu_execute_args_size,
      input   io_cpu_memory_isValid,
      input   io_cpu_memory_isStuck,
      input   io_cpu_memory_isRemoved,
      output  io_cpu_memory_isWrite,
      input  [31:0] io_cpu_memory_address,
      output  io_cpu_memory_mmuBus_cmd_isValid,
      output [31:0] io_cpu_memory_mmuBus_cmd_virtualAddress,
      output  io_cpu_memory_mmuBus_cmd_bypassTranslation,
      input  [31:0] io_cpu_memory_mmuBus_rsp_physicalAddress,
      input   io_cpu_memory_mmuBus_rsp_isIoAccess,
      input   io_cpu_memory_mmuBus_rsp_allowRead,
      input   io_cpu_memory_mmuBus_rsp_allowWrite,
      input   io_cpu_memory_mmuBus_rsp_allowExecute,
      input   io_cpu_memory_mmuBus_rsp_exception,
      input   io_cpu_memory_mmuBus_rsp_refilling,
      output  io_cpu_memory_mmuBus_end,
      input   io_cpu_memory_mmuBus_busy,
      input   io_cpu_writeBack_isValid,
      input   io_cpu_writeBack_isStuck,
      input   io_cpu_writeBack_isUser,
      output reg  io_cpu_writeBack_haltIt,
      output  io_cpu_writeBack_isWrite,
      output reg [31:0] io_cpu_writeBack_data,
      input  [31:0] io_cpu_writeBack_address,
      output  io_cpu_writeBack_mmuException,
      output  io_cpu_writeBack_unalignedAccess,
      output reg  io_cpu_writeBack_accessError,
      output reg  io_cpu_redo,
      input   io_cpu_flush_valid,
      output reg  io_cpu_flush_ready,
      output reg  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output reg  io_mem_cmd_payload_wr,
      output reg [31:0] io_mem_cmd_payload_address,
      output [31:0] io_mem_cmd_payload_data,
      output [3:0] io_mem_cmd_payload_mask,
      output reg [2:0] io_mem_cmd_payload_length,
      output reg  io_mem_cmd_payload_last,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload_data,
      input   io_mem_rsp_payload_error,
      input   clk,
      input   reset);
  reg [21:0] _zz_10_;
  reg [31:0] _zz_11_;
  wire  _zz_12_;
  wire  _zz_13_;
  wire  _zz_14_;
  wire  _zz_15_;
  wire  _zz_16_;
  wire  _zz_17_;
  wire [0:0] _zz_18_;
  wire [0:0] _zz_19_;
  wire [0:0] _zz_20_;
  wire [2:0] _zz_21_;
  wire [1:0] _zz_22_;
  wire [21:0] _zz_23_;
  reg  _zz_1_;
  reg  _zz_2_;
  wire  haltCpu;
  reg  tagsReadCmd_valid;
  reg [6:0] tagsReadCmd_payload;
  reg  tagsWriteCmd_valid;
  reg [0:0] tagsWriteCmd_payload_way;
  reg [6:0] tagsWriteCmd_payload_address;
  reg  tagsWriteCmd_payload_data_valid;
  reg  tagsWriteCmd_payload_data_error;
  reg [19:0] tagsWriteCmd_payload_data_address;
  reg  tagsWriteLastCmd_valid;
  reg [0:0] tagsWriteLastCmd_payload_way;
  reg [6:0] tagsWriteLastCmd_payload_address;
  reg  tagsWriteLastCmd_payload_data_valid;
  reg  tagsWriteLastCmd_payload_data_error;
  reg [19:0] tagsWriteLastCmd_payload_data_address;
  reg  dataReadCmd_valid;
  reg [9:0] dataReadCmd_payload;
  reg  dataWriteCmd_valid;
  reg [0:0] dataWriteCmd_payload_way;
  reg [9:0] dataWriteCmd_payload_address;
  reg [31:0] dataWriteCmd_payload_data;
  reg [3:0] dataWriteCmd_payload_mask;
  wire  _zz_3_;
  wire  ways_0_tagsReadRsp_valid;
  wire  ways_0_tagsReadRsp_error;
  wire [19:0] ways_0_tagsReadRsp_address;
  wire [21:0] _zz_4_;
  wire  _zz_5_;
  wire [31:0] ways_0_dataReadRsp;
  reg [3:0] _zz_6_;
  wire [3:0] stage0_mask;
  wire [0:0] stage0_colisions;
  reg  stageA_request_wr;
  reg [31:0] stageA_request_data;
  reg [1:0] stageA_request_size;
  reg [3:0] stageA_mask;
  wire  stageA_wayHits_0;
  reg [0:0] stage0_colisions_regNextWhen;
  wire [0:0] _zz_7_;
  wire [0:0] stageA_colisions;
  reg  stageB_request_wr;
  reg [31:0] stageB_request_data;
  reg [1:0] stageB_request_size;
  reg  stageB_mmuRspFreeze;
  reg [31:0] stageB_mmuRsp_physicalAddress;
  reg  stageB_mmuRsp_isIoAccess;
  reg  stageB_mmuRsp_allowRead;
  reg  stageB_mmuRsp_allowWrite;
  reg  stageB_mmuRsp_allowExecute;
  reg  stageB_mmuRsp_exception;
  reg  stageB_mmuRsp_refilling;
  reg  stageB_tagsReadRsp_0_valid;
  reg  stageB_tagsReadRsp_0_error;
  reg [19:0] stageB_tagsReadRsp_0_address;
  reg [31:0] stageB_dataReadRsp_0;
  wire [0:0] _zz_8_;
  reg [0:0] stageB_waysHits;
  wire  stageB_waysHit;
  wire [31:0] stageB_dataMux;
  reg [3:0] stageB_mask;
  reg [0:0] stageB_colisions;
  reg  stageB_loaderValid;
  reg  stageB_flusher_valid;
  wire [31:0] stageB_requestDataBypass;
  wire  stageB_isAmo;
  reg  stageB_memCmdSent;
  wire [0:0] _zz_9_;
  reg  loader_valid;
  reg  loader_counter_willIncrement;
  wire  loader_counter_willClear;
  reg [2:0] loader_counter_valueNext;
  reg [2:0] loader_counter_value;
  wire  loader_counter_willOverflowIfInc;
  wire  loader_counter_willOverflow;
  reg [0:0] loader_waysAllocator;
  reg  loader_error;
  (* ram_style = "block" *) reg [21:0] ways_0_tags [0:127];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol0 [0:1023];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol1 [0:1023];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol2 [0:1023];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_24_;
  reg [7:0] _zz_25_;
  reg [7:0] _zz_26_;
  reg [7:0] _zz_27_;
  assign _zz_12_ = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  assign _zz_13_ = (((stageB_mmuRsp_refilling || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign _zz_14_ = (stageB_waysHit || (stageB_request_wr && (! stageB_isAmo)));
  assign _zz_15_ = (loader_valid && io_mem_rsp_valid);
  assign _zz_16_ = ((((io_cpu_flush_valid && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
  assign _zz_17_ = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign _zz_18_ = _zz_4_[0 : 0];
  assign _zz_19_ = _zz_4_[1 : 1];
  assign _zz_20_ = loader_counter_willIncrement;
  assign _zz_21_ = {2'd0, _zz_20_};
  assign _zz_22_ = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_23_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_3_) begin
      _zz_10_ <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_23_;
    end
  end

  always @ (*) begin
    _zz_11_ = {_zz_27_, _zz_26_, _zz_25_, _zz_24_};
  end
  always @ (posedge clk) begin
    if(_zz_5_) begin
      _zz_24_ <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_25_ <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_26_ <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_27_ <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1_) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1_) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1_) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1_) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      _zz_2_ = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_3_ = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_4_ = _zz_10_;
  assign ways_0_tagsReadRsp_valid = _zz_18_[0];
  assign ways_0_tagsReadRsp_error = _zz_19_[0];
  assign ways_0_tagsReadRsp_address = _zz_4_[21 : 2];
  assign _zz_5_ = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRsp = _zz_11_;
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    if(_zz_12_)begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsReadCmd_payload = (7'bxxxxxxx);
    if(_zz_12_)begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @ (*) begin
    dataReadCmd_valid = 1'b0;
    if(_zz_12_)begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataReadCmd_payload = (10'bxxxxxxxxxx);
    if(_zz_12_)begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @ (*) begin
    tagsWriteCmd_valid = 1'b0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
    end
    if(_zz_13_)begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_way = (1'bx);
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_way = (1'b1);
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_address = (7'bxxxxxxx);
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_error = (loader_error || io_mem_rsp_payload_error);
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_address = (20'bxxxxxxxxxxxxxxxxxxxx);
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @ (*) begin
    dataWriteCmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          if((stageB_request_wr && stageB_waysHit))begin
            dataWriteCmd_valid = 1'b1;
          end
        end
      end
    end
    if(_zz_13_)begin
      dataWriteCmd_valid = 1'b0;
    end
    if(_zz_15_)begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_way = (1'bx);
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_way = stageB_waysHits;
        end
      end
    end
    if(_zz_15_)begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_address = (10'bxxxxxxxxxx);
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
        end
      end
    end
    if(_zz_15_)begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_data = stageB_requestDataBypass;
        end
      end
    end
    if(_zz_15_)begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_mask = (4'bxxxx);
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          dataWriteCmd_payload_mask = stageB_mask;
        end
      end
    end
    if(_zz_15_)begin
      dataWriteCmd_payload_mask = (4'b1111);
    end
  end

  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_6_ = (4'b0001);
      end
      2'b01 : begin
        _zz_6_ = (4'b0011);
      end
      default : begin
        _zz_6_ = (4'b1111);
      end
    endcase
  end

  assign stage0_mask = (_zz_6_ <<< io_cpu_execute_address[1 : 0]);
  assign stage0_colisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_execute_address[11 : 2])) && ((stage0_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  assign io_cpu_memory_mmuBus_cmd_isValid = io_cpu_memory_isValid;
  assign io_cpu_memory_mmuBus_cmd_virtualAddress = io_cpu_memory_address;
  assign io_cpu_memory_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_memory_mmuBus_end = ((! io_cpu_memory_isStuck) || io_cpu_memory_isRemoved);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_wayHits_0 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign _zz_7_[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == io_cpu_memory_address[11 : 2])) && ((stageA_mask & dataWriteCmd_payload_mask) != (4'b0000)));
  assign stageA_colisions = (stage0_colisions_regNextWhen | _zz_7_);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign _zz_8_[0] = stageA_wayHits_0;
  assign stageB_waysHit = (stageB_waysHits != (1'b0));
  assign stageB_dataMux = stageB_dataReadRsp_0;
  always @ (*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(! _zz_14_) begin
          if(io_mem_cmd_ready)begin
            stageB_loaderValid = 1'b1;
          end
        end
      end
    end
    if(_zz_13_)begin
      stageB_loaderValid = 1'b0;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      io_cpu_writeBack_haltIt = 1'b1;
    end
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        if((stageB_request_wr ? io_mem_cmd_ready : io_mem_rsp_valid))begin
          io_cpu_writeBack_haltIt = 1'b0;
        end
      end else begin
        if(_zz_14_)begin
          if(((! stageB_request_wr) || io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end
      end
    end
    if(_zz_13_)begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(_zz_16_)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  assign stageB_requestDataBypass = stageB_request_data;
  assign stageB_isAmo = 1'b0;
  always @ (*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_14_)begin
          if((((! stageB_request_wr) || stageB_isAmo) && ((stageB_colisions & stageB_waysHits) != (1'b0))))begin
            io_cpu_redo = 1'b1;
          end
        end
      end
    end
    if((io_cpu_writeBack_isValid && stageB_mmuRsp_refilling))begin
      io_cpu_redo = 1'b1;
    end
    if(loader_valid)begin
      io_cpu_redo = 1'b1;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_mmuRsp_isIoAccess)begin
      io_cpu_writeBack_accessError = (io_mem_rsp_valid && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = ((stageB_waysHits & _zz_9_) != (1'b0));
    end
  end

  assign io_cpu_writeBack_mmuException = (io_cpu_writeBack_isValid && ((stageB_mmuRsp_exception || ((! stageB_mmuRsp_allowWrite) && stageB_request_wr)) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_isAmo))));
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && (((stageB_request_size == (2'b10)) && (stageB_mmuRsp_physicalAddress[1 : 0] != (2'b00))) || ((stageB_request_size == (2'b01)) && (stageB_mmuRsp_physicalAddress[0 : 0] != (1'b0)))));
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @ (*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_valid = (! stageB_memCmdSent);
      end else begin
        if(_zz_14_)begin
          if(stageB_request_wr)begin
            io_mem_cmd_valid = 1'b1;
          end
        end else begin
          if((! stageB_memCmdSent))begin
            io_mem_cmd_valid = 1'b1;
          end
        end
      end
    end
    if(_zz_13_)begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_address = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
      end else begin
        if(_zz_14_)begin
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
        end else begin
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],(5'b00000)};
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_length = (3'bxxx);
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_length = (3'b000);
      end else begin
        if(_zz_14_)begin
          io_mem_cmd_payload_length = (3'b000);
        end else begin
          io_mem_cmd_payload_length = (3'b111);
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_last = 1'bx;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_last = 1'b1;
      end else begin
        if(_zz_14_)begin
          io_mem_cmd_payload_last = 1'b1;
        end else begin
          io_mem_cmd_payload_last = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(! _zz_14_) begin
          io_mem_cmd_payload_wr = 1'b0;
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  always @ (*) begin
    if(stageB_mmuRsp_isIoAccess)begin
      io_cpu_writeBack_data = io_mem_rsp_payload_data;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  assign _zz_9_[0] = stageB_tagsReadRsp_0_error;
  always @ (*) begin
    loader_counter_willIncrement = 1'b0;
    if(_zz_15_)begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == (3'b111));
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_21_);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = (3'b000);
    end
  end

  always @ (posedge clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if((! io_cpu_memory_isStuck))begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_data <= io_cpu_execute_args_data;
      stageA_request_size <= io_cpu_execute_args_size;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_mask <= stage0_mask;
    end
    if((! io_cpu_memory_isStuck))begin
      stage0_colisions_regNextWhen <= stage0_colisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
    end
    if(_zz_17_)begin
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuBus_rsp_isIoAccess;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuBus_rsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuBus_rsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuBus_rsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuBus_rsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuBus_rsp_refilling;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHits <= _zz_8_;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_colisions <= stageA_colisions;
    end
    if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
      $display("ERROR writeBack stuck by another plugin is not allowed");
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      stageB_flusher_valid <= 1'b1;
      stageB_mmuRsp_physicalAddress <= (32'b00000000000000000000000000000000);
      stageB_memCmdSent <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= (3'b000);
      loader_waysAllocator <= (1'b1);
      loader_error <= 1'b0;
    end else begin
      if(_zz_17_)begin
        stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuBus_rsp_physicalAddress;
      end
      if(stageB_flusher_valid)begin
        if((stageB_mmuRsp_physicalAddress[11 : 5] != (7'b1111111)))begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + (7'b0000001));
        end else begin
          stageB_flusher_valid <= 1'b0;
        end
      end
      if(_zz_16_)begin
        stageB_mmuRsp_physicalAddress[11 : 5] <= (7'b0000000);
        stageB_flusher_valid <= 1'b1;
      end
      if(io_mem_cmd_ready)begin
        stageB_memCmdSent <= 1'b1;
      end
      if((! io_cpu_writeBack_isStuck))begin
        stageB_memCmdSent <= 1'b0;
      end
      if(stageB_loaderValid)begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(_zz_15_)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_counter_willOverflow)begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
      end
      if((! loader_valid))begin
        loader_waysAllocator <= _zz_22_[0:0];
      end
    end
  end

endmodule

module VexRiscv (
      input  [31:0] externalResetVector,
      input   timerInterrupt,
      input   softwareInterrupt,
      input  [31:0] externalInterruptArray,
      input   debug_bus_cmd_valid,
      output reg  debug_bus_cmd_ready,
      input   debug_bus_cmd_payload_wr,
      input  [7:0] debug_bus_cmd_payload_address,
      input  [31:0] debug_bus_cmd_payload_data,
      output reg [31:0] debug_bus_rsp_data,
      output  debug_resetOut,
      output reg  iBusWishbone_CYC,
      output reg  iBusWishbone_STB,
      input   iBusWishbone_ACK,
      output  iBusWishbone_WE,
      output [29:0] iBusWishbone_ADR,
      input  [31:0] iBusWishbone_DAT_MISO,
      output [31:0] iBusWishbone_DAT_MOSI,
      output [3:0] iBusWishbone_SEL,
      input   iBusWishbone_ERR,
      output [1:0] iBusWishbone_BTE,
      output [2:0] iBusWishbone_CTI,
      output  dBusWishbone_CYC,
      output  dBusWishbone_STB,
      input   dBusWishbone_ACK,
      output  dBusWishbone_WE,
      output [29:0] dBusWishbone_ADR,
      input  [31:0] dBusWishbone_DAT_MISO,
      output [31:0] dBusWishbone_DAT_MOSI,
      output [3:0] dBusWishbone_SEL,
      input   dBusWishbone_ERR,
      output [1:0] dBusWishbone_BTE,
      output [2:0] dBusWishbone_CTI,
      input   clk,
      input   reset,
      input   debugReset);
  wire  _zz_179_;
  wire  _zz_180_;
  wire  _zz_181_;
  wire  _zz_182_;
  wire  _zz_183_;
  wire  _zz_184_;
  wire  _zz_185_;
  wire [31:0] _zz_186_;
  reg  _zz_187_;
  wire  _zz_188_;
  wire [31:0] _zz_189_;
  wire  _zz_190_;
  wire [31:0] _zz_191_;
  reg  _zz_192_;
  wire  _zz_193_;
  wire  _zz_194_;
  wire [31:0] _zz_195_;
  wire  _zz_196_;
  wire  _zz_197_;
  reg [31:0] _zz_198_;
  reg [31:0] _zz_199_;
  reg [31:0] _zz_200_;
  wire  IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_error;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuException;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_haltIt;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_data;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire  IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire [31:0] IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire [2:0] IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire  dataCache_1__io_cpu_memory_isWrite;
  wire  dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  wire [31:0] dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  wire  dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  wire  dataCache_1__io_cpu_memory_mmuBus_end;
  wire  dataCache_1__io_cpu_writeBack_haltIt;
  wire [31:0] dataCache_1__io_cpu_writeBack_data;
  wire  dataCache_1__io_cpu_writeBack_mmuException;
  wire  dataCache_1__io_cpu_writeBack_unalignedAccess;
  wire  dataCache_1__io_cpu_writeBack_accessError;
  wire  dataCache_1__io_cpu_writeBack_isWrite;
  wire  dataCache_1__io_cpu_flush_ready;
  wire  dataCache_1__io_cpu_redo;
  wire  dataCache_1__io_mem_cmd_valid;
  wire  dataCache_1__io_mem_cmd_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_payload_length;
  wire  dataCache_1__io_mem_cmd_payload_last;
  wire  _zz_201_;
  wire  _zz_202_;
  wire  _zz_203_;
  wire  _zz_204_;
  wire  _zz_205_;
  wire  _zz_206_;
  wire  _zz_207_;
  wire  _zz_208_;
  wire  _zz_209_;
  wire  _zz_210_;
  wire  _zz_211_;
  wire  _zz_212_;
  wire  _zz_213_;
  wire  _zz_214_;
  wire  _zz_215_;
  wire  _zz_216_;
  wire  _zz_217_;
  wire [1:0] _zz_218_;
  wire  _zz_219_;
  wire  _zz_220_;
  wire  _zz_221_;
  wire  _zz_222_;
  wire  _zz_223_;
  wire  _zz_224_;
  wire  _zz_225_;
  wire  _zz_226_;
  wire  _zz_227_;
  wire  _zz_228_;
  wire  _zz_229_;
  wire  _zz_230_;
  wire [1:0] _zz_231_;
  wire  _zz_232_;
  wire  _zz_233_;
  wire [5:0] _zz_234_;
  wire  _zz_235_;
  wire  _zz_236_;
  wire  _zz_237_;
  wire  _zz_238_;
  wire  _zz_239_;
  wire  _zz_240_;
  wire [4:0] _zz_241_;
  wire [1:0] _zz_242_;
  wire [1:0] _zz_243_;
  wire [1:0] _zz_244_;
  wire  _zz_245_;
  wire [1:0] _zz_246_;
  wire [0:0] _zz_247_;
  wire [0:0] _zz_248_;
  wire [32:0] _zz_249_;
  wire [31:0] _zz_250_;
  wire [32:0] _zz_251_;
  wire [0:0] _zz_252_;
  wire [0:0] _zz_253_;
  wire [51:0] _zz_254_;
  wire [51:0] _zz_255_;
  wire [51:0] _zz_256_;
  wire [32:0] _zz_257_;
  wire [51:0] _zz_258_;
  wire [49:0] _zz_259_;
  wire [51:0] _zz_260_;
  wire [49:0] _zz_261_;
  wire [51:0] _zz_262_;
  wire [2:0] _zz_263_;
  wire [31:0] _zz_264_;
  wire [0:0] _zz_265_;
  wire [0:0] _zz_266_;
  wire [0:0] _zz_267_;
  wire [0:0] _zz_268_;
  wire [0:0] _zz_269_;
  wire [0:0] _zz_270_;
  wire [0:0] _zz_271_;
  wire [0:0] _zz_272_;
  wire [0:0] _zz_273_;
  wire [0:0] _zz_274_;
  wire [0:0] _zz_275_;
  wire [0:0] _zz_276_;
  wire [0:0] _zz_277_;
  wire [0:0] _zz_278_;
  wire [4:0] _zz_279_;
  wire [2:0] _zz_280_;
  wire [31:0] _zz_281_;
  wire [2:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire [11:0] _zz_285_;
  wire [11:0] _zz_286_;
  wire [11:0] _zz_287_;
  wire [31:0] _zz_288_;
  wire [19:0] _zz_289_;
  wire [11:0] _zz_290_;
  wire [2:0] _zz_291_;
  wire [2:0] _zz_292_;
  wire [0:0] _zz_293_;
  wire [2:0] _zz_294_;
  wire [4:0] _zz_295_;
  wire [11:0] _zz_296_;
  wire [11:0] _zz_297_;
  wire [31:0] _zz_298_;
  wire [31:0] _zz_299_;
  wire [31:0] _zz_300_;
  wire [31:0] _zz_301_;
  wire [31:0] _zz_302_;
  wire [31:0] _zz_303_;
  wire [31:0] _zz_304_;
  wire [11:0] _zz_305_;
  wire [19:0] _zz_306_;
  wire [11:0] _zz_307_;
  wire [2:0] _zz_308_;
  wire [1:0] _zz_309_;
  wire [1:0] _zz_310_;
  wire [65:0] _zz_311_;
  wire [65:0] _zz_312_;
  wire [31:0] _zz_313_;
  wire [31:0] _zz_314_;
  wire [0:0] _zz_315_;
  wire [5:0] _zz_316_;
  wire [32:0] _zz_317_;
  wire [32:0] _zz_318_;
  wire [31:0] _zz_319_;
  wire [31:0] _zz_320_;
  wire [32:0] _zz_321_;
  wire [32:0] _zz_322_;
  wire [32:0] _zz_323_;
  wire [0:0] _zz_324_;
  wire [32:0] _zz_325_;
  wire [0:0] _zz_326_;
  wire [32:0] _zz_327_;
  wire [0:0] _zz_328_;
  wire [31:0] _zz_329_;
  wire [0:0] _zz_330_;
  wire [0:0] _zz_331_;
  wire [0:0] _zz_332_;
  wire [0:0] _zz_333_;
  wire [0:0] _zz_334_;
  wire [0:0] _zz_335_;
  wire [0:0] _zz_336_;
  wire [26:0] _zz_337_;
  wire  _zz_338_;
  wire  _zz_339_;
  wire [2:0] _zz_340_;
  wire [31:0] _zz_341_;
  wire [31:0] _zz_342_;
  wire [31:0] _zz_343_;
  wire  _zz_344_;
  wire [0:0] _zz_345_;
  wire [13:0] _zz_346_;
  wire [31:0] _zz_347_;
  wire [31:0] _zz_348_;
  wire [31:0] _zz_349_;
  wire  _zz_350_;
  wire [0:0] _zz_351_;
  wire [7:0] _zz_352_;
  wire [31:0] _zz_353_;
  wire [31:0] _zz_354_;
  wire [31:0] _zz_355_;
  wire  _zz_356_;
  wire [0:0] _zz_357_;
  wire [1:0] _zz_358_;
  wire  _zz_359_;
  wire  _zz_360_;
  wire [6:0] _zz_361_;
  wire [4:0] _zz_362_;
  wire  _zz_363_;
  wire [4:0] _zz_364_;
  wire [0:0] _zz_365_;
  wire [7:0] _zz_366_;
  wire  _zz_367_;
  wire [0:0] _zz_368_;
  wire [0:0] _zz_369_;
  wire [31:0] _zz_370_;
  wire [31:0] _zz_371_;
  wire  _zz_372_;
  wire  _zz_373_;
  wire [0:0] _zz_374_;
  wire [0:0] _zz_375_;
  wire  _zz_376_;
  wire [0:0] _zz_377_;
  wire [26:0] _zz_378_;
  wire [31:0] _zz_379_;
  wire  _zz_380_;
  wire  _zz_381_;
  wire  _zz_382_;
  wire [1:0] _zz_383_;
  wire [1:0] _zz_384_;
  wire  _zz_385_;
  wire [0:0] _zz_386_;
  wire [22:0] _zz_387_;
  wire [31:0] _zz_388_;
  wire [31:0] _zz_389_;
  wire [31:0] _zz_390_;
  wire [31:0] _zz_391_;
  wire  _zz_392_;
  wire [4:0] _zz_393_;
  wire [4:0] _zz_394_;
  wire  _zz_395_;
  wire [0:0] _zz_396_;
  wire [19:0] _zz_397_;
  wire [31:0] _zz_398_;
  wire [31:0] _zz_399_;
  wire  _zz_400_;
  wire [0:0] _zz_401_;
  wire [1:0] _zz_402_;
  wire  _zz_403_;
  wire  _zz_404_;
  wire [0:0] _zz_405_;
  wire [0:0] _zz_406_;
  wire [1:0] _zz_407_;
  wire [1:0] _zz_408_;
  wire  _zz_409_;
  wire [0:0] _zz_410_;
  wire [16:0] _zz_411_;
  wire [31:0] _zz_412_;
  wire [31:0] _zz_413_;
  wire [31:0] _zz_414_;
  wire  _zz_415_;
  wire  _zz_416_;
  wire [31:0] _zz_417_;
  wire [31:0] _zz_418_;
  wire [31:0] _zz_419_;
  wire [31:0] _zz_420_;
  wire  _zz_421_;
  wire [0:0] _zz_422_;
  wire [0:0] _zz_423_;
  wire [2:0] _zz_424_;
  wire [2:0] _zz_425_;
  wire  _zz_426_;
  wire [0:0] _zz_427_;
  wire [14:0] _zz_428_;
  wire [31:0] _zz_429_;
  wire [31:0] _zz_430_;
  wire [31:0] _zz_431_;
  wire [31:0] _zz_432_;
  wire [31:0] _zz_433_;
  wire [31:0] _zz_434_;
  wire [31:0] _zz_435_;
  wire  _zz_436_;
  wire [0:0] _zz_437_;
  wire [0:0] _zz_438_;
  wire [0:0] _zz_439_;
  wire [0:0] _zz_440_;
  wire  _zz_441_;
  wire [0:0] _zz_442_;
  wire [12:0] _zz_443_;
  wire [31:0] _zz_444_;
  wire [31:0] _zz_445_;
  wire [31:0] _zz_446_;
  wire [0:0] _zz_447_;
  wire [3:0] _zz_448_;
  wire [0:0] _zz_449_;
  wire [2:0] _zz_450_;
  wire [1:0] _zz_451_;
  wire [1:0] _zz_452_;
  wire  _zz_453_;
  wire [0:0] _zz_454_;
  wire [9:0] _zz_455_;
  wire [31:0] _zz_456_;
  wire [31:0] _zz_457_;
  wire [31:0] _zz_458_;
  wire  _zz_459_;
  wire [0:0] _zz_460_;
  wire [0:0] _zz_461_;
  wire [31:0] _zz_462_;
  wire [31:0] _zz_463_;
  wire [31:0] _zz_464_;
  wire  _zz_465_;
  wire  _zz_466_;
  wire [31:0] _zz_467_;
  wire [31:0] _zz_468_;
  wire [31:0] _zz_469_;
  wire [31:0] _zz_470_;
  wire [31:0] _zz_471_;
  wire [31:0] _zz_472_;
  wire [0:0] _zz_473_;
  wire [3:0] _zz_474_;
  wire [0:0] _zz_475_;
  wire [0:0] _zz_476_;
  wire  _zz_477_;
  wire [0:0] _zz_478_;
  wire [6:0] _zz_479_;
  wire [31:0] _zz_480_;
  wire [31:0] _zz_481_;
  wire [31:0] _zz_482_;
  wire [31:0] _zz_483_;
  wire [31:0] _zz_484_;
  wire [31:0] _zz_485_;
  wire [31:0] _zz_486_;
  wire [31:0] _zz_487_;
  wire [31:0] _zz_488_;
  wire [0:0] _zz_489_;
  wire [1:0] _zz_490_;
  wire [31:0] _zz_491_;
  wire [31:0] _zz_492_;
  wire [1:0] _zz_493_;
  wire [1:0] _zz_494_;
  wire  _zz_495_;
  wire [0:0] _zz_496_;
  wire [4:0] _zz_497_;
  wire [31:0] _zz_498_;
  wire [31:0] _zz_499_;
  wire [31:0] _zz_500_;
  wire [31:0] _zz_501_;
  wire [31:0] _zz_502_;
  wire [31:0] _zz_503_;
  wire [31:0] _zz_504_;
  wire [31:0] _zz_505_;
  wire [31:0] _zz_506_;
  wire [31:0] _zz_507_;
  wire [31:0] _zz_508_;
  wire  _zz_509_;
  wire [0:0] _zz_510_;
  wire [0:0] _zz_511_;
  wire  _zz_512_;
  wire [0:0] _zz_513_;
  wire [1:0] _zz_514_;
  wire [31:0] _zz_515_;
  wire [31:0] _zz_516_;
  wire  _zz_517_;
  wire  _zz_518_;
  wire [31:0] _zz_519_;
  wire [31:0] _zz_520_;
  wire  _zz_521_;
  wire [0:0] _zz_522_;
  wire [3:0] _zz_523_;
  wire [31:0] _zz_524_;
  wire [31:0] _zz_525_;
  wire  _zz_526_;
  wire  _zz_527_;
  wire  _zz_528_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_1_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_2_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_3_;
  wire [31:0] execute_MUL_LL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_4_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_5_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_6_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_7_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_8_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_9_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_10_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_11_;
  wire  memory_IS_MUL;
  wire  execute_IS_MUL;
  wire  decode_IS_MUL;
  wire  decode_IS_CSR;
  wire [31:0] execute_SHIFT_RIGHT;
  wire  decode_IS_RS2_SIGNED;
  wire  decode_DO_EBREAK;
  wire  decode_IS_DIV;
  wire [33:0] memory_MUL_HH;
  wire [33:0] execute_MUL_HH;
  wire  decode_SRC2_FORCE_ZERO;
  wire [51:0] memory_MUL_LOW;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire  decode_PREDICTION_HAD_BRANCHED2;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_12_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_14_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_15_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_16_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_17_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_18_;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_19_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_20_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_21_;
  wire  memory_MEMORY_WR;
  wire  decode_MEMORY_WR;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  decode_CSR_WRITE_OPCODE;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  decode_IS_RS1_SIGNED;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_22_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_23_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_24_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_25_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_26_;
  wire [33:0] execute_MUL_HL;
  wire  decode_MEMORY_MANAGMENT;
  wire  execute_BRANCH_DO;
  wire [31:0] memory_PC;
  wire [33:0] execute_MUL_LH;
  wire [31:0] execute_BRANCH_CALC;
  wire  decode_CSR_READ_OPCODE;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  execute_IS_RS1_SIGNED;
  wire  execute_IS_DIV;
  wire  execute_IS_RS2_SIGNED;
  wire  memory_IS_DIV;
  wire  writeBack_IS_MUL;
  wire [33:0] writeBack_MUL_HH;
  wire [51:0] writeBack_MUL_LOW;
  wire [33:0] memory_MUL_HL;
  wire [33:0] memory_MUL_LH;
  wire [31:0] memory_MUL_LL;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_27_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_28_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_29_;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_BRANCH_DO;
  wire [31:0] execute_PC;
  wire [31:0] execute_RS1;
  wire  execute_BRANCH_COND_RESULT;
  wire  execute_PREDICTION_HAD_BRANCHED2;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_30_;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  reg [31:0] _zz_31_;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  reg [31:0] decode_RS2;
  reg [31:0] decode_RS1;
  wire [31:0] memory_SHIFT_RIGHT;
  reg [31:0] _zz_32_;
  wire `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_33_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_34_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_35_;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_36_;
  wire  execute_IS_RVC;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_37_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_38_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_39_;
  wire [31:0] _zz_40_;
  wire  _zz_41_;
  reg  _zz_42_;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire  decode_LEGAL_INSTRUCTION;
  wire  decode_INSTRUCTION_READY;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_43_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_44_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_45_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_46_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_47_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_48_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_49_;
  reg [31:0] _zz_50_;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire  writeBack_MEMORY_WR;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire  writeBack_MEMORY_ENABLE;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire  memory_MEMORY_ENABLE;
  wire  execute_MEMORY_MANAGMENT;
  wire [31:0] execute_RS2;
  wire  execute_MEMORY_WR;
  wire [31:0] execute_SRC_ADD;
  wire  execute_MEMORY_ENABLE;
  wire [31:0] execute_INSTRUCTION;
  wire  decode_MEMORY_ENABLE;
  wire  decode_FLUSH_ALL;
  reg  IBusCachedPlugin_rsp_issueDetected;
  reg  IBusCachedPlugin_rsp_issueDetected_2;
  reg  IBusCachedPlugin_rsp_issueDetected_1;
  reg  IBusCachedPlugin_rsp_issueDetected_0;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_51_;
  reg [31:0] _zz_52_;
  reg [31:0] _zz_53_;
  wire [31:0] decode_PC;
  wire [31:0] decode_INSTRUCTION;
  wire  decode_IS_RVC;
  wire [31:0] writeBack_PC;
  wire [31:0] writeBack_INSTRUCTION;
  reg  decode_arbitration_haltItself;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  wire  decode_arbitration_flushIt;
  reg  decode_arbitration_flushNext;
  reg  decode_arbitration_isValid;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  reg  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushIt;
  reg  execute_arbitration_flushNext;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  wire  memory_arbitration_flushIt;
  reg  memory_arbitration_flushNext;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  reg  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  reg  writeBack_arbitration_flushIt;
  reg  writeBack_arbitration_flushNext;
  reg  writeBack_arbitration_isValid;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring;
  wire [31:0] lastStageInstruction /* verilator public */ ;
  wire [31:0] lastStagePc /* verilator public */ ;
  wire  lastStageIsValid /* verilator public */ ;
  wire  lastStageIsFiring /* verilator public */ ;
  reg  IBusCachedPlugin_fetcherHalt;
  reg  IBusCachedPlugin_fetcherflushIt;
  reg  IBusCachedPlugin_incomingInstruction;
  wire  IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire [31:0] IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  wire  IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire  IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire  IBusCachedPlugin_pcValids_0;
  wire  IBusCachedPlugin_pcValids_1;
  wire  IBusCachedPlugin_pcValids_2;
  wire  IBusCachedPlugin_pcValids_3;
  wire  IBusCachedPlugin_redoBranch_valid;
  wire [31:0] IBusCachedPlugin_redoBranch_payload;
  reg  IBusCachedPlugin_decodeExceptionPort_valid;
  reg [3:0] IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire [31:0] IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire  IBusCachedPlugin_mmuBus_cmd_isValid;
  wire [31:0] IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire  IBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire [31:0] IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire  IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire  IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire  IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire  IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire  IBusCachedPlugin_mmuBus_rsp_exception;
  wire  IBusCachedPlugin_mmuBus_rsp_refilling;
  wire  IBusCachedPlugin_mmuBus_end;
  wire  IBusCachedPlugin_mmuBus_busy;
  wire  DBusCachedPlugin_mmuBus_cmd_isValid;
  wire [31:0] DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire  DBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire [31:0] DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire  DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire  DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire  DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire  DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire  DBusCachedPlugin_mmuBus_rsp_exception;
  wire  DBusCachedPlugin_mmuBus_rsp_refilling;
  wire  DBusCachedPlugin_mmuBus_end;
  wire  DBusCachedPlugin_mmuBus_busy;
  reg  DBusCachedPlugin_redoBranch_valid;
  wire [31:0] DBusCachedPlugin_redoBranch_payload;
  reg  DBusCachedPlugin_exceptionBus_valid;
  reg [3:0] DBusCachedPlugin_exceptionBus_payload_code;
  wire [31:0] DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg  _zz_54_;
  wire  decodeExceptionPort_valid;
  wire [3:0] decodeExceptionPort_payload_code;
  wire [31:0] decodeExceptionPort_payload_badAddr;
  wire  BranchPlugin_jumpInterface_valid;
  wire [31:0] BranchPlugin_jumpInterface_payload;
  reg  CsrPlugin_inWfi /* verilator public */ ;
  reg  CsrPlugin_thirdPartyWake;
  reg  CsrPlugin_jumpInterface_valid;
  reg [31:0] CsrPlugin_jumpInterface_payload;
  wire  CsrPlugin_exceptionPendings_0;
  wire  CsrPlugin_exceptionPendings_1;
  wire  CsrPlugin_exceptionPendings_2;
  wire  CsrPlugin_exceptionPendings_3;
  wire  externalInterrupt;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  CsrPlugin_forceMachineWire;
  reg  CsrPlugin_selfException_valid;
  reg [3:0] CsrPlugin_selfException_payload_code;
  wire [31:0] CsrPlugin_selfException_payload_badAddr;
  reg  CsrPlugin_allowInterrupts;
  reg  CsrPlugin_allowException;
  reg  IBusCachedPlugin_injectionPort_valid;
  reg  IBusCachedPlugin_injectionPort_ready;
  wire [31:0] IBusCachedPlugin_injectionPort_payload;
  wire  IBusCachedPlugin_jump_pcLoad_valid;
  wire [31:0] IBusCachedPlugin_jump_pcLoad_payload;
  wire [4:0] _zz_55_;
  wire [4:0] _zz_56_;
  wire  _zz_57_;
  wire  _zz_58_;
  wire  _zz_59_;
  wire  _zz_60_;
  wire  IBusCachedPlugin_fetchPc_output_valid;
  wire  IBusCachedPlugin_fetchPc_output_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_output_payload;
  reg [31:0] IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusCachedPlugin_fetchPc_corrected;
  reg  IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg  IBusCachedPlugin_fetchPc_booted;
  reg  IBusCachedPlugin_fetchPc_inc;
  reg [31:0] IBusCachedPlugin_fetchPc_pc;
  reg [31:0] IBusCachedPlugin_decodePc_pcReg /* verilator public */ ;
  wire [31:0] IBusCachedPlugin_decodePc_pcPlus;
  reg  IBusCachedPlugin_decodePc_injectedDecode;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg  IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_0_inputSample;
  wire  IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg  IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_1_inputSample;
  wire  _zz_61_;
  wire  _zz_62_;
  wire  _zz_63_;
  wire  _zz_64_;
  reg  _zz_65_;
  reg  IBusCachedPlugin_iBusRsp_readyForError;
  wire  IBusCachedPlugin_iBusRsp_output_valid;
  wire  IBusCachedPlugin_iBusRsp_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire  IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire  IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire  IBusCachedPlugin_decompressor_output_valid;
  wire  IBusCachedPlugin_decompressor_output_ready;
  wire [31:0] IBusCachedPlugin_decompressor_output_payload_pc;
  wire  IBusCachedPlugin_decompressor_output_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_decompressor_output_payload_rsp_inst;
  wire  IBusCachedPlugin_decompressor_output_payload_isRvc;
  reg  IBusCachedPlugin_decompressor_bufferValid;
  reg [15:0] IBusCachedPlugin_decompressor_bufferData;
  wire [31:0] IBusCachedPlugin_decompressor_raw;
  wire  IBusCachedPlugin_decompressor_isRvc;
  wire [15:0] _zz_66_;
  reg [31:0] IBusCachedPlugin_decompressor_decompressed;
  wire [4:0] _zz_67_;
  wire [4:0] _zz_68_;
  wire [11:0] _zz_69_;
  wire  _zz_70_;
  reg [11:0] _zz_71_;
  wire  _zz_72_;
  reg [9:0] _zz_73_;
  wire [20:0] _zz_74_;
  wire  _zz_75_;
  reg [14:0] _zz_76_;
  wire  _zz_77_;
  reg [2:0] _zz_78_;
  wire  _zz_79_;
  reg [9:0] _zz_80_;
  wire [20:0] _zz_81_;
  wire  _zz_82_;
  reg [4:0] _zz_83_;
  wire [12:0] _zz_84_;
  wire [4:0] _zz_85_;
  wire [4:0] _zz_86_;
  wire [4:0] _zz_87_;
  wire  _zz_88_;
  reg [2:0] _zz_89_;
  reg [2:0] _zz_90_;
  wire  _zz_91_;
  reg [6:0] _zz_92_;
  reg  IBusCachedPlugin_decompressor_bufferFill;
  wire  IBusCachedPlugin_injector_decodeInput_valid;
  wire  IBusCachedPlugin_injector_decodeInput_ready;
  wire [31:0] IBusCachedPlugin_injector_decodeInput_payload_pc;
  wire  IBusCachedPlugin_injector_decodeInput_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  wire  IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  reg  _zz_93_;
  reg [31:0] _zz_94_;
  reg  _zz_95_;
  reg [31:0] _zz_96_;
  reg  _zz_97_;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg  IBusCachedPlugin_injector_decodeRemoved;
  reg [31:0] IBusCachedPlugin_injector_formal_rawInDecode;
  wire  _zz_98_;
  reg [18:0] _zz_99_;
  wire  _zz_100_;
  reg [10:0] _zz_101_;
  wire  _zz_102_;
  reg [18:0] _zz_103_;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  reg [31:0] iBus_cmd_payload_address;
  wire [2:0] iBus_cmd_payload_size;
  wire  iBus_rsp_valid;
  wire [31:0] iBus_rsp_payload_data;
  wire  iBus_rsp_payload_error;
  wire [31:0] _zz_104_;
  reg [31:0] IBusCachedPlugin_rspCounter;
  wire  IBusCachedPlugin_s0_tightlyCoupledHit;
  reg  IBusCachedPlugin_s1_tightlyCoupledHit;
  wire  IBusCachedPlugin_rsp_iBusRspOutputHalt;
  reg  IBusCachedPlugin_rsp_redoFetch;
  wire  dBus_cmd_valid;
  wire  dBus_cmd_ready;
  wire  dBus_cmd_payload_wr;
  wire [31:0] dBus_cmd_payload_address;
  wire [31:0] dBus_cmd_payload_data;
  wire [3:0] dBus_cmd_payload_mask;
  wire [2:0] dBus_cmd_payload_length;
  wire  dBus_cmd_payload_last;
  wire  dBus_rsp_valid;
  wire [31:0] dBus_rsp_payload_data;
  wire  dBus_rsp_payload_error;
  wire  dataCache_1__io_mem_cmd_s2mPipe_valid;
  wire  dataCache_1__io_mem_cmd_s2mPipe_ready;
  wire  dataCache_1__io_mem_cmd_s2mPipe_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_s2mPipe_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_s2mPipe_payload_length;
  wire  dataCache_1__io_mem_cmd_s2mPipe_payload_last;
  reg  dataCache_1__io_mem_cmd_s2mPipe_rValid;
  reg  dataCache_1__io_mem_cmd_s2mPipe_rData_wr;
  reg [31:0] dataCache_1__io_mem_cmd_s2mPipe_rData_address;
  reg [31:0] dataCache_1__io_mem_cmd_s2mPipe_rData_data;
  reg [3:0] dataCache_1__io_mem_cmd_s2mPipe_rData_mask;
  reg [2:0] dataCache_1__io_mem_cmd_s2mPipe_rData_length;
  reg  dataCache_1__io_mem_cmd_s2mPipe_rData_last;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  wire  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid;
  reg  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  reg [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  reg [31:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  reg [3:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  reg [2:0] dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  reg  dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  wire [31:0] _zz_105_;
  reg [31:0] DBusCachedPlugin_rspCounter;
  wire [1:0] execute_DBusCachedPlugin_size;
  reg [31:0] _zz_106_;
  reg [31:0] writeBack_DBusCachedPlugin_rspShifted;
  wire  _zz_107_;
  reg [31:0] _zz_108_;
  wire  _zz_109_;
  reg [31:0] _zz_110_;
  reg [31:0] writeBack_DBusCachedPlugin_rspFormated;
  wire [32:0] _zz_111_;
  wire  _zz_112_;
  wire  _zz_113_;
  wire  _zz_114_;
  wire  _zz_115_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_116_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_117_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_118_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_119_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_120_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_121_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_122_;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  reg  lastStageRegFileWrite_valid /* verilator public */ ;
  wire [4:0] lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire [31:0] lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg  _zz_123_;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_124_;
  reg [31:0] _zz_125_;
  wire  _zz_126_;
  reg [19:0] _zz_127_;
  wire  _zz_128_;
  reg [19:0] _zz_129_;
  reg [31:0] _zz_130_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  wire [4:0] execute_FullBarrelShifterPlugin_amplitude;
  reg [31:0] _zz_131_;
  wire [31:0] execute_FullBarrelShifterPlugin_reversed;
  reg [31:0] _zz_132_;
  reg  _zz_133_;
  reg  _zz_134_;
  reg  _zz_135_;
  reg [4:0] _zz_136_;
  reg [31:0] _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  wire  _zz_142_;
  wire  _zz_143_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_144_;
  reg  _zz_145_;
  reg  _zz_146_;
  wire  execute_BranchPlugin_missAlignedTarget;
  reg [31:0] execute_BranchPlugin_branch_src1;
  reg [31:0] execute_BranchPlugin_branch_src2;
  wire  _zz_147_;
  reg [19:0] _zz_148_;
  wire  _zz_149_;
  reg [10:0] _zz_150_;
  wire  _zz_151_;
  reg [18:0] _zz_152_;
  wire [31:0] execute_BranchPlugin_branchAdder;
  reg [1:0] CsrPlugin_misa_base;
  reg [25:0] CsrPlugin_misa_extensions;
  reg [1:0] CsrPlugin_mtvec_mode;
  reg [29:0] CsrPlugin_mtvec_base;
  reg [31:0] CsrPlugin_mepc;
  reg  CsrPlugin_mstatus_MIE;
  reg  CsrPlugin_mstatus_MPIE;
  reg [1:0] CsrPlugin_mstatus_MPP;
  reg  CsrPlugin_mip_MEIP;
  reg  CsrPlugin_mip_MTIP;
  reg  CsrPlugin_mip_MSIP;
  reg  CsrPlugin_mie_MEIE;
  reg  CsrPlugin_mie_MTIE;
  reg  CsrPlugin_mie_MSIE;
  reg [31:0] CsrPlugin_mscratch;
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mtval;
  reg [63:0] CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg [63:0] CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire  _zz_153_;
  wire  _zz_154_;
  wire  _zz_155_;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire [1:0] _zz_156_;
  wire  _zz_157_;
  reg  CsrPlugin_interrupt_valid;
  reg [3:0] CsrPlugin_interrupt_code /* verilator public */ ;
  reg [1:0] CsrPlugin_interrupt_targetPrivilege;
  wire  CsrPlugin_exception;
  reg  CsrPlugin_lastStageWasWfi;
  reg  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptJump /* verilator public */ ;
  reg  CsrPlugin_hadException;
  reg [1:0] CsrPlugin_targetPrivilege;
  reg [3:0] CsrPlugin_trapCause;
  reg [1:0] CsrPlugin_xtvec_mode;
  reg [29:0] CsrPlugin_xtvec_base;
  reg  execute_CsrPlugin_wfiWake;
  wire  execute_CsrPlugin_blockedBySideEffects;
  reg  execute_CsrPlugin_illegalAccess;
  reg  execute_CsrPlugin_illegalInstruction;
  reg [31:0] execute_CsrPlugin_readData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  wire [31:0] execute_CsrPlugin_readToWriteData;
  reg [31:0] execute_CsrPlugin_writeData;
  wire [11:0] execute_CsrPlugin_csrAddress;
  reg  execute_MulPlugin_aSigned;
  reg  execute_MulPlugin_bSigned;
  wire [31:0] execute_MulPlugin_a;
  wire [31:0] execute_MulPlugin_b;
  wire [15:0] execute_MulPlugin_aULow;
  wire [15:0] execute_MulPlugin_bULow;
  wire [16:0] execute_MulPlugin_aSLow;
  wire [16:0] execute_MulPlugin_bSLow;
  wire [16:0] execute_MulPlugin_aHigh;
  wire [16:0] execute_MulPlugin_bHigh;
  wire [65:0] writeBack_MulPlugin_result;
  reg [32:0] memory_DivPlugin_rs1;
  reg [31:0] memory_DivPlugin_rs2;
  reg [64:0] memory_DivPlugin_accumulator;
  wire  memory_DivPlugin_frontendOk;
  reg  memory_DivPlugin_div_needRevert;
  reg  memory_DivPlugin_div_counter_willIncrement;
  reg  memory_DivPlugin_div_counter_willClear;
  reg [5:0] memory_DivPlugin_div_counter_valueNext;
  reg [5:0] memory_DivPlugin_div_counter_value;
  wire  memory_DivPlugin_div_counter_willOverflowIfInc;
  wire  memory_DivPlugin_div_counter_willOverflow;
  reg  memory_DivPlugin_div_done;
  reg [31:0] memory_DivPlugin_div_result;
  wire [31:0] _zz_158_;
  wire [32:0] _zz_159_;
  wire [32:0] _zz_160_;
  wire [31:0] _zz_161_;
  wire  _zz_162_;
  wire  _zz_163_;
  reg [32:0] _zz_164_;
  reg [31:0] externalInterruptArray_regNext;
  reg [31:0] _zz_165_;
  wire [31:0] _zz_166_;
  reg  DebugPlugin_firstCycle;
  reg  DebugPlugin_secondCycle;
  reg  DebugPlugin_resetIt;
  reg  DebugPlugin_haltIt;
  reg  DebugPlugin_stepIt;
  reg  DebugPlugin_isPipBusy;
  reg  DebugPlugin_godmode;
  reg  DebugPlugin_haltedByBreak;
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  _zz_167_;
  reg  _zz_168_;
  reg  DebugPlugin_resetIt_regNext;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg [31:0] execute_to_memory_BRANCH_CALC;
  reg  decode_to_execute_IS_RVC;
  reg [33:0] execute_to_memory_MUL_LH;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  execute_to_memory_BRANCH_DO;
  reg  decode_to_execute_MEMORY_MANAGMENT;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg [33:0] execute_to_memory_MUL_HL;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg  decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg  decode_to_execute_MEMORY_WR;
  reg  execute_to_memory_MEMORY_WR;
  reg  memory_to_writeBack_MEMORY_WR;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg  decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg [51:0] memory_to_writeBack_MUL_LOW;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg [33:0] execute_to_memory_MUL_HH;
  reg [33:0] memory_to_writeBack_MUL_HH;
  reg  decode_to_execute_IS_DIV;
  reg  execute_to_memory_IS_DIV;
  reg  decode_to_execute_DO_EBREAK;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg [31:0] execute_to_memory_SHIFT_RIGHT;
  reg  decode_to_execute_IS_CSR;
  reg  decode_to_execute_IS_MUL;
  reg  execute_to_memory_IS_MUL;
  reg  memory_to_writeBack_IS_MUL;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg [31:0] decode_to_execute_RS2;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg [31:0] execute_to_memory_MUL_LL;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg [31:0] decode_to_execute_RS1;
  reg [2:0] _zz_169_;
  reg [2:0] _zz_170_;
  reg  _zz_171_;
  reg [31:0] iBusWishbone_DAT_MISO_regNext;
  reg [2:0] _zz_172_;
  wire  _zz_173_;
  wire  _zz_174_;
  wire  _zz_175_;
  wire  _zz_176_;
  wire  _zz_177_;
  reg  _zz_178_;
  reg [31:0] dBusWishbone_DAT_MISO_regNext;
  `ifndef SYNTHESIS
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_1__string;
  reg [39:0] _zz_2__string;
  reg [39:0] _zz_3__string;
  reg [31:0] _zz_4__string;
  reg [31:0] _zz_5__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_6__string;
  reg [23:0] _zz_7__string;
  reg [23:0] _zz_8__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_9__string;
  reg [95:0] _zz_10__string;
  reg [95:0] _zz_11__string;
  reg [39:0] _zz_12__string;
  reg [39:0] _zz_13__string;
  reg [39:0] _zz_14__string;
  reg [39:0] _zz_15__string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_16__string;
  reg [39:0] _zz_17__string;
  reg [39:0] _zz_18__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_19__string;
  reg [63:0] _zz_20__string;
  reg [63:0] _zz_21__string;
  reg [71:0] _zz_22__string;
  reg [71:0] _zz_23__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_24__string;
  reg [71:0] _zz_25__string;
  reg [71:0] _zz_26__string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_27__string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_28__string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_29__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_30__string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_33__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_34__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_36__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_37__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_38__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_39__string;
  reg [23:0] _zz_43__string;
  reg [31:0] _zz_44__string;
  reg [95:0] _zz_45__string;
  reg [71:0] _zz_46__string;
  reg [39:0] _zz_47__string;
  reg [39:0] _zz_48__string;
  reg [63:0] _zz_49__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_51__string;
  reg [63:0] _zz_116__string;
  reg [39:0] _zz_117__string;
  reg [39:0] _zz_118__string;
  reg [71:0] _zz_119__string;
  reg [95:0] _zz_120__string;
  reg [31:0] _zz_121__string;
  reg [23:0] _zz_122__string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  `endif

  (* ram_style = "block" *) reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_201_ = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_202_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_203_ = 1'b1;
  assign _zz_204_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_205_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_206_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_207_ = ((_zz_181_ && IBusCachedPlugin_cache_io_cpu_fetch_error) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign _zz_208_ = ((_zz_181_ && IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign _zz_209_ = ((_zz_181_ && IBusCachedPlugin_cache_io_cpu_fetch_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_0));
  assign _zz_210_ = ((_zz_181_ && IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling) && (! 1'b0));
  assign _zz_211_ = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != (2'b00));
  assign _zz_212_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
  assign _zz_213_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_214_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_215_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_216_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_217_ = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign _zz_218_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_219_ = (IBusCachedPlugin_iBusRsp_output_valid && IBusCachedPlugin_iBusRsp_output_ready);
  assign _zz_220_ = ((! (((! IBusCachedPlugin_decompressor_isRvc) && (! IBusCachedPlugin_iBusRsp_output_payload_pc[1])) && (! IBusCachedPlugin_decompressor_bufferValid))) && (! ((IBusCachedPlugin_decompressor_isRvc && IBusCachedPlugin_iBusRsp_output_payload_pc[1]) && IBusCachedPlugin_decompressor_output_ready)));
  assign _zz_221_ = (! IBusCachedPlugin_iBusRsp_readyForError);
  assign _zz_222_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_223_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_224_ = (1'b0 || (! 1'b1));
  assign _zz_225_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_226_ = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_227_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_228_ = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_229_ = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign _zz_230_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_231_ = execute_INSTRUCTION[13 : 12];
  assign _zz_232_ = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_233_ = (! memory_arbitration_isStuck);
  assign _zz_234_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_235_ = (iBus_cmd_valid || (_zz_170_ != (3'b000)));
  assign _zz_236_ = (_zz_197_ && (! dataCache_1__io_mem_cmd_s2mPipe_ready));
  assign _zz_237_ = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_238_ = ((_zz_153_ && 1'b1) && (! 1'b0));
  assign _zz_239_ = ((_zz_154_ && 1'b1) && (! 1'b0));
  assign _zz_240_ = ((_zz_155_ && 1'b1) && (! 1'b0));
  assign _zz_241_ = {_zz_66_[1 : 0],_zz_66_[15 : 13]};
  assign _zz_242_ = _zz_66_[6 : 5];
  assign _zz_243_ = _zz_66_[11 : 10];
  assign _zz_244_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_245_ = execute_INSTRUCTION[13];
  assign _zz_246_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_247_ = _zz_111_[29 : 29];
  assign _zz_248_ = _zz_111_[7 : 7];
  assign _zz_249_ = ($signed(_zz_251_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_250_ = _zz_249_[31 : 0];
  assign _zz_251_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_252_ = _zz_111_[8 : 8];
  assign _zz_253_ = _zz_111_[30 : 30];
  assign _zz_254_ = ($signed(_zz_255_) + $signed(_zz_260_));
  assign _zz_255_ = ($signed(_zz_256_) + $signed(_zz_258_));
  assign _zz_256_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_257_ = {1'b0,memory_MUL_LL};
  assign _zz_258_ = {{19{_zz_257_[32]}}, _zz_257_};
  assign _zz_259_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_260_ = {{2{_zz_259_[49]}}, _zz_259_};
  assign _zz_261_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_262_ = {{2{_zz_261_[49]}}, _zz_261_};
  assign _zz_263_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_264_ = {29'd0, _zz_263_};
  assign _zz_265_ = _zz_111_[23 : 23];
  assign _zz_266_ = _zz_111_[27 : 27];
  assign _zz_267_ = _zz_111_[16 : 16];
  assign _zz_268_ = _zz_111_[0 : 0];
  assign _zz_269_ = _zz_111_[28 : 28];
  assign _zz_270_ = _zz_111_[10 : 10];
  assign _zz_271_ = _zz_111_[15 : 15];
  assign _zz_272_ = _zz_111_[21 : 21];
  assign _zz_273_ = _zz_111_[13 : 13];
  assign _zz_274_ = _zz_111_[3 : 3];
  assign _zz_275_ = _zz_111_[26 : 26];
  assign _zz_276_ = _zz_111_[14 : 14];
  assign _zz_277_ = _zz_111_[9 : 9];
  assign _zz_278_ = _zz_111_[6 : 6];
  assign _zz_279_ = (_zz_55_ - (5'b00001));
  assign _zz_280_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_281_ = {29'd0, _zz_280_};
  assign _zz_282_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_283_ = {29'd0, _zz_282_};
  assign _zz_284_ = {{_zz_76_,_zz_66_[6 : 2]},(12'b000000000000)};
  assign _zz_285_ = {{{(4'b0000),_zz_66_[8 : 7]},_zz_66_[12 : 9]},(2'b00)};
  assign _zz_286_ = {{{(4'b0000),_zz_66_[8 : 7]},_zz_66_[12 : 9]},(2'b00)};
  assign _zz_287_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_288_ = {{_zz_99_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_289_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_290_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_291_ = (writeBack_MEMORY_WR ? (3'b111) : (3'b101));
  assign _zz_292_ = (writeBack_MEMORY_WR ? (3'b110) : (3'b100));
  assign _zz_293_ = execute_SRC_LESS;
  assign _zz_294_ = (execute_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_295_ = execute_INSTRUCTION[19 : 15];
  assign _zz_296_ = execute_INSTRUCTION[31 : 20];
  assign _zz_297_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_298_ = ($signed(_zz_299_) + $signed(_zz_302_));
  assign _zz_299_ = ($signed(_zz_300_) + $signed(_zz_301_));
  assign _zz_300_ = execute_SRC1;
  assign _zz_301_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_302_ = (execute_SRC_USE_SUB_LESS ? _zz_303_ : _zz_304_);
  assign _zz_303_ = (32'b00000000000000000000000000000001);
  assign _zz_304_ = (32'b00000000000000000000000000000000);
  assign _zz_305_ = execute_INSTRUCTION[31 : 20];
  assign _zz_306_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_307_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_308_ = (execute_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_309_ = (_zz_156_ & (~ _zz_310_));
  assign _zz_310_ = (_zz_156_ - (2'b01));
  assign _zz_311_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_312_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_313_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_314_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_315_ = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_316_ = {5'd0, _zz_315_};
  assign _zz_317_ = {1'd0, memory_DivPlugin_rs2};
  assign _zz_318_ = {_zz_158_,(! _zz_160_[32])};
  assign _zz_319_ = _zz_160_[31:0];
  assign _zz_320_ = _zz_159_[31:0];
  assign _zz_321_ = _zz_322_;
  assign _zz_322_ = _zz_323_;
  assign _zz_323_ = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_161_) : _zz_161_)} + _zz_325_);
  assign _zz_324_ = memory_DivPlugin_div_needRevert;
  assign _zz_325_ = {32'd0, _zz_324_};
  assign _zz_326_ = _zz_163_;
  assign _zz_327_ = {32'd0, _zz_326_};
  assign _zz_328_ = _zz_162_;
  assign _zz_329_ = {31'd0, _zz_328_};
  assign _zz_330_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_331_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_332_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_333_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_334_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_335_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_336_ = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_337_ = (iBus_cmd_payload_address >>> 5);
  assign _zz_338_ = 1'b1;
  assign _zz_339_ = 1'b1;
  assign _zz_340_ = {_zz_58_,{_zz_60_,_zz_59_}};
  assign _zz_341_ = (32'b00000000000000000001000001111111);
  assign _zz_342_ = (decode_INSTRUCTION & (32'b00000000000000000010000001111111));
  assign _zz_343_ = (32'b00000000000000000010000001110011);
  assign _zz_344_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011));
  assign _zz_345_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011));
  assign _zz_346_ = {((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_347_) == (32'b00000000000000000000000000000011)),{(_zz_348_ == _zz_349_),{_zz_350_,{_zz_351_,_zz_352_}}}}}};
  assign _zz_347_ = (32'b00000000000000000101000001011111);
  assign _zz_348_ = (decode_INSTRUCTION & (32'b00000000000000000111000001111011));
  assign _zz_349_ = (32'b00000000000000000000000001100011);
  assign _zz_350_ = ((decode_INSTRUCTION & (32'b00000000000000000110000001111111)) == (32'b00000000000000000000000000001111));
  assign _zz_351_ = ((decode_INSTRUCTION & (32'b11111100000000000000000001111111)) == (32'b00000000000000000000000000110011));
  assign _zz_352_ = {((decode_INSTRUCTION & (32'b00000001111100000111000001111111)) == (32'b00000000000000000101000000001111)),{((decode_INSTRUCTION & (32'b10111100000000000111000001111111)) == (32'b00000000000000000101000000010011)),{((decode_INSTRUCTION & _zz_353_) == (32'b00000000000000000001000000010011)),{(_zz_354_ == _zz_355_),{_zz_356_,{_zz_357_,_zz_358_}}}}}};
  assign _zz_353_ = (32'b11111100000000000011000001111111);
  assign _zz_354_ = (decode_INSTRUCTION & (32'b10111110000000000111000001111111));
  assign _zz_355_ = (32'b00000000000000000101000000110011);
  assign _zz_356_ = ((decode_INSTRUCTION & (32'b10111110000000000111000001111111)) == (32'b00000000000000000000000000110011));
  assign _zz_357_ = ((decode_INSTRUCTION & (32'b11011111111111111111111111111111)) == (32'b00010000001000000000000001110011));
  assign _zz_358_ = {((decode_INSTRUCTION & (32'b11111111111011111111111111111111)) == (32'b00000000000000000000000001110011)),((decode_INSTRUCTION & (32'b11111111111111111111111111111111)) == (32'b00010000010100000000000001110011))};
  assign _zz_359_ = (_zz_66_[11 : 10] == (2'b01));
  assign _zz_360_ = ((_zz_66_[11 : 10] == (2'b11)) && (_zz_66_[6 : 5] == (2'b00)));
  assign _zz_361_ = (7'b0000000);
  assign _zz_362_ = _zz_66_[6 : 2];
  assign _zz_363_ = _zz_66_[12];
  assign _zz_364_ = _zz_66_[11 : 7];
  assign _zz_365_ = decode_INSTRUCTION[31];
  assign _zz_366_ = decode_INSTRUCTION[19 : 12];
  assign _zz_367_ = decode_INSTRUCTION[20];
  assign _zz_368_ = decode_INSTRUCTION[31];
  assign _zz_369_ = decode_INSTRUCTION[7];
  assign _zz_370_ = (decode_INSTRUCTION & (32'b00000000000000000000000001110000));
  assign _zz_371_ = (32'b00000000000000000000000000100000);
  assign _zz_372_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_373_ = ((decode_INSTRUCTION & (32'b00000010000000000100000001100100)) == (32'b00000010000000000100000000100000));
  assign _zz_374_ = ((decode_INSTRUCTION & (32'b00000010000000000100000001110100)) == (32'b00000010000000000000000000110000));
  assign _zz_375_ = (1'b0);
  assign _zz_376_ = (((decode_INSTRUCTION & _zz_379_) == (32'b00000000000000000100000000001000)) != (1'b0));
  assign _zz_377_ = ({_zz_380_,_zz_381_} != (2'b00));
  assign _zz_378_ = {(_zz_382_ != (1'b0)),{(_zz_383_ != _zz_384_),{_zz_385_,{_zz_386_,_zz_387_}}}};
  assign _zz_379_ = (32'b00000000000000000100000001001000);
  assign _zz_380_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010000)) == (32'b00000000000000000010000000000000));
  assign _zz_381_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_382_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100));
  assign _zz_383_ = {_zz_114_,(_zz_388_ == _zz_389_)};
  assign _zz_384_ = (2'b00);
  assign _zz_385_ = ((_zz_390_ == _zz_391_) != (1'b0));
  assign _zz_386_ = (_zz_392_ != (1'b0));
  assign _zz_387_ = {(_zz_393_ != _zz_394_),{_zz_395_,{_zz_396_,_zz_397_}}};
  assign _zz_388_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011100));
  assign _zz_389_ = (32'b00000000000000000000000000000100);
  assign _zz_390_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_391_ = (32'b00000000000000000000000001000000);
  assign _zz_392_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000100000));
  assign _zz_393_ = {(_zz_398_ == _zz_399_),{_zz_400_,{_zz_401_,_zz_402_}}};
  assign _zz_394_ = (5'b00000);
  assign _zz_395_ = ({_zz_403_,_zz_404_} != (2'b00));
  assign _zz_396_ = ({_zz_405_,_zz_406_} != (2'b00));
  assign _zz_397_ = {(_zz_407_ != _zz_408_),{_zz_409_,{_zz_410_,_zz_411_}}};
  assign _zz_398_ = (decode_INSTRUCTION & (32'b00000000000000000010000001000000));
  assign _zz_399_ = (32'b00000000000000000010000001000000);
  assign _zz_400_ = ((decode_INSTRUCTION & _zz_412_) == (32'b00000000000000000001000001000000));
  assign _zz_401_ = (_zz_413_ == _zz_414_);
  assign _zz_402_ = {_zz_415_,_zz_416_};
  assign _zz_403_ = ((decode_INSTRUCTION & _zz_417_) == (32'b00000000000000000000000000100000));
  assign _zz_404_ = ((decode_INSTRUCTION & _zz_418_) == (32'b00000000000000000000000000100000));
  assign _zz_405_ = (_zz_419_ == _zz_420_);
  assign _zz_406_ = _zz_115_;
  assign _zz_407_ = {_zz_421_,_zz_115_};
  assign _zz_408_ = (2'b00);
  assign _zz_409_ = ({_zz_422_,_zz_423_} != (2'b00));
  assign _zz_410_ = (_zz_424_ != _zz_425_);
  assign _zz_411_ = {_zz_426_,{_zz_427_,_zz_428_}};
  assign _zz_412_ = (32'b00000000000000000001000001000000);
  assign _zz_413_ = (decode_INSTRUCTION & (32'b00000000000100000000000001000000));
  assign _zz_414_ = (32'b00000000000000000000000001000000);
  assign _zz_415_ = ((decode_INSTRUCTION & _zz_429_) == (32'b00000000000000000000000001000000));
  assign _zz_416_ = ((decode_INSTRUCTION & _zz_430_) == (32'b00000000000000000000000000000000));
  assign _zz_417_ = (32'b00000000000000000000000000110100);
  assign _zz_418_ = (32'b00000000000000000000000001100100);
  assign _zz_419_ = (decode_INSTRUCTION & (32'b00000000000000000000000000010100));
  assign _zz_420_ = (32'b00000000000000000000000000000100);
  assign _zz_421_ = ((decode_INSTRUCTION & _zz_431_) == (32'b00000000000000000000000000000100));
  assign _zz_422_ = (_zz_432_ == _zz_433_);
  assign _zz_423_ = (_zz_434_ == _zz_435_);
  assign _zz_424_ = {_zz_436_,{_zz_437_,_zz_438_}};
  assign _zz_425_ = (3'b000);
  assign _zz_426_ = (_zz_113_ != (1'b0));
  assign _zz_427_ = (_zz_439_ != _zz_440_);
  assign _zz_428_ = {_zz_441_,{_zz_442_,_zz_443_}};
  assign _zz_429_ = (32'b00000000000000000000000001010000);
  assign _zz_430_ = (32'b00000000000000000000000000111000);
  assign _zz_431_ = (32'b00000000000000000000000001000100);
  assign _zz_432_ = (decode_INSTRUCTION & (32'b00000000000000000111000000110100));
  assign _zz_433_ = (32'b00000000000000000101000000010000);
  assign _zz_434_ = (decode_INSTRUCTION & (32'b00000010000000000111000001100100));
  assign _zz_435_ = (32'b00000000000000000101000000100000);
  assign _zz_436_ = ((decode_INSTRUCTION & (32'b01000000000000000011000001010100)) == (32'b01000000000000000001000000010000));
  assign _zz_437_ = ((decode_INSTRUCTION & _zz_444_) == (32'b00000000000000000001000000010000));
  assign _zz_438_ = ((decode_INSTRUCTION & _zz_445_) == (32'b00000000000000000001000000010000));
  assign _zz_439_ = ((decode_INSTRUCTION & _zz_446_) == (32'b00000000000100000000000001010000));
  assign _zz_440_ = (1'b0);
  assign _zz_441_ = ({_zz_114_,{_zz_447_,_zz_448_}} != (6'b000000));
  assign _zz_442_ = ({_zz_449_,_zz_450_} != (4'b0000));
  assign _zz_443_ = {(_zz_451_ != _zz_452_),{_zz_453_,{_zz_454_,_zz_455_}}};
  assign _zz_444_ = (32'b00000000000000000111000000110100);
  assign _zz_445_ = (32'b00000010000000000111000001010100);
  assign _zz_446_ = (32'b00010000000100000011000001010000);
  assign _zz_447_ = ((decode_INSTRUCTION & _zz_456_) == (32'b00000000000000000001000000010000));
  assign _zz_448_ = {(_zz_457_ == _zz_458_),{_zz_459_,{_zz_460_,_zz_461_}}};
  assign _zz_449_ = ((decode_INSTRUCTION & _zz_462_) == (32'b00000000000000000000000000000000));
  assign _zz_450_ = {(_zz_463_ == _zz_464_),{_zz_465_,_zz_466_}};
  assign _zz_451_ = {(_zz_467_ == _zz_468_),(_zz_469_ == _zz_470_)};
  assign _zz_452_ = (2'b00);
  assign _zz_453_ = ((_zz_471_ == _zz_472_) != (1'b0));
  assign _zz_454_ = ({_zz_473_,_zz_474_} != (5'b00000));
  assign _zz_455_ = {(_zz_475_ != _zz_476_),{_zz_477_,{_zz_478_,_zz_479_}}};
  assign _zz_456_ = (32'b00000000000000000001000000010000);
  assign _zz_457_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_458_ = (32'b00000000000000000010000000010000);
  assign _zz_459_ = ((decode_INSTRUCTION & _zz_480_) == (32'b00000000000000000000000000010000));
  assign _zz_460_ = (_zz_481_ == _zz_482_);
  assign _zz_461_ = (_zz_483_ == _zz_484_);
  assign _zz_462_ = (32'b00000000000000000000000001000100);
  assign _zz_463_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_464_ = (32'b00000000000000000000000000000000);
  assign _zz_465_ = ((decode_INSTRUCTION & _zz_485_) == (32'b00000000000000000010000000000000));
  assign _zz_466_ = ((decode_INSTRUCTION & _zz_486_) == (32'b00000000000000000001000000000000));
  assign _zz_467_ = (decode_INSTRUCTION & (32'b00010000001000000011000001010000));
  assign _zz_468_ = (32'b00010000000000000000000001010000);
  assign _zz_469_ = (decode_INSTRUCTION & (32'b00010000000100000011000001010000));
  assign _zz_470_ = (32'b00000000000000000000000001010000);
  assign _zz_471_ = (decode_INSTRUCTION & (32'b00000000000100000011000001010000));
  assign _zz_472_ = (32'b00000000000000000000000001010000);
  assign _zz_473_ = (_zz_487_ == _zz_488_);
  assign _zz_474_ = {_zz_112_,{_zz_489_,_zz_490_}};
  assign _zz_475_ = (_zz_491_ == _zz_492_);
  assign _zz_476_ = (1'b0);
  assign _zz_477_ = (_zz_113_ != (1'b0));
  assign _zz_478_ = (_zz_493_ != _zz_494_);
  assign _zz_479_ = {_zz_495_,{_zz_496_,_zz_497_}};
  assign _zz_480_ = (32'b00000000000000000000000001010000);
  assign _zz_481_ = (decode_INSTRUCTION & (32'b00000000000000000000000000001100));
  assign _zz_482_ = (32'b00000000000000000000000000000100);
  assign _zz_483_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign _zz_484_ = (32'b00000000000000000000000000000000);
  assign _zz_485_ = (32'b00000000000000000110000000000100);
  assign _zz_486_ = (32'b00000000000000000101000000000100);
  assign _zz_487_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000000));
  assign _zz_488_ = (32'b00000000000000000000000001000000);
  assign _zz_489_ = ((decode_INSTRUCTION & _zz_498_) == (32'b00000000000000000100000000100000));
  assign _zz_490_ = {(_zz_499_ == _zz_500_),(_zz_501_ == _zz_502_)};
  assign _zz_491_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_492_ = (32'b00000000000000000000000000000000);
  assign _zz_493_ = {(_zz_503_ == _zz_504_),(_zz_505_ == _zz_506_)};
  assign _zz_494_ = (2'b00);
  assign _zz_495_ = ((_zz_507_ == _zz_508_) != (1'b0));
  assign _zz_496_ = (_zz_509_ != (1'b0));
  assign _zz_497_ = {(_zz_510_ != _zz_511_),{_zz_512_,{_zz_513_,_zz_514_}}};
  assign _zz_498_ = (32'b00000000000000000100000000100000);
  assign _zz_499_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110000));
  assign _zz_500_ = (32'b00000000000000000000000000010000);
  assign _zz_501_ = (decode_INSTRUCTION & (32'b00000010000000000000000000100000));
  assign _zz_502_ = (32'b00000000000000000000000000100000);
  assign _zz_503_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_504_ = (32'b00000000000000000001000001010000);
  assign _zz_505_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_506_ = (32'b00000000000000000010000001010000);
  assign _zz_507_ = (decode_INSTRUCTION & (32'b00000000000000000101000001001000));
  assign _zz_508_ = (32'b00000000000000000001000000001000);
  assign _zz_509_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_510_ = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000));
  assign _zz_511_ = (1'b0);
  assign _zz_512_ = ({(_zz_515_ == _zz_516_),{_zz_517_,_zz_518_}} != (3'b000));
  assign _zz_513_ = ((_zz_519_ == _zz_520_) != (1'b0));
  assign _zz_514_ = {(_zz_521_ != (1'b0)),({_zz_522_,_zz_523_} != (5'b00000))};
  assign _zz_515_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_516_ = (32'b00000000000000000000000001000000);
  assign _zz_517_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_518_ = ((decode_INSTRUCTION & (32'b01000000000000000000000000110100)) == (32'b01000000000000000000000000110000));
  assign _zz_519_ = (decode_INSTRUCTION & (32'b00000000000000000100000000010100));
  assign _zz_520_ = (32'b00000000000000000100000000010000);
  assign _zz_521_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_522_ = _zz_112_;
  assign _zz_523_ = {((decode_INSTRUCTION & (32'b00000000000000000010000000110000)) == (32'b00000000000000000010000000010000)),{((decode_INSTRUCTION & (32'b00000000000000000001000000110000)) == (32'b00000000000000000000000000010000)),{((decode_INSTRUCTION & _zz_524_) == (32'b00000000000000000010000000100000)),((decode_INSTRUCTION & _zz_525_) == (32'b00000000000000000000000000100000))}}};
  assign _zz_524_ = (32'b00000010000000000010000001100000);
  assign _zz_525_ = (32'b00000010000000000011000000100000);
  assign _zz_526_ = execute_INSTRUCTION[31];
  assign _zz_527_ = execute_INSTRUCTION[31];
  assign _zz_528_ = execute_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_338_) begin
      _zz_198_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_339_) begin
      _zz_199_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_42_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush(_zz_179_),
    .io_cpu_prefetch_isValid(_zz_180_),
    .io_cpu_prefetch_haltIt(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt),
    .io_cpu_prefetch_pc(IBusCachedPlugin_iBusRsp_stages_0_input_payload),
    .io_cpu_fetch_isValid(_zz_181_),
    .io_cpu_fetch_isStuck(_zz_182_),
    .io_cpu_fetch_isRemoved(IBusCachedPlugin_fetcherflushIt),
    .io_cpu_fetch_pc(IBusCachedPlugin_iBusRsp_stages_1_input_payload),
    .io_cpu_fetch_data(IBusCachedPlugin_cache_io_cpu_fetch_data),
    .io_cpu_fetch_mmuBus_cmd_isValid(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid),
    .io_cpu_fetch_mmuBus_cmd_virtualAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation),
    .io_cpu_fetch_mmuBus_rsp_physicalAddress(IBusCachedPlugin_mmuBus_rsp_physicalAddress),
    .io_cpu_fetch_mmuBus_rsp_isIoAccess(IBusCachedPlugin_mmuBus_rsp_isIoAccess),
    .io_cpu_fetch_mmuBus_rsp_allowRead(IBusCachedPlugin_mmuBus_rsp_allowRead),
    .io_cpu_fetch_mmuBus_rsp_allowWrite(IBusCachedPlugin_mmuBus_rsp_allowWrite),
    .io_cpu_fetch_mmuBus_rsp_allowExecute(IBusCachedPlugin_mmuBus_rsp_allowExecute),
    .io_cpu_fetch_mmuBus_rsp_exception(IBusCachedPlugin_mmuBus_rsp_exception),
    .io_cpu_fetch_mmuBus_rsp_refilling(IBusCachedPlugin_mmuBus_rsp_refilling),
    .io_cpu_fetch_mmuBus_end(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end),
    .io_cpu_fetch_mmuBus_busy(IBusCachedPlugin_mmuBus_busy),
    .io_cpu_fetch_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_cpu_fetch_cacheMiss(IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss),
    .io_cpu_fetch_error(IBusCachedPlugin_cache_io_cpu_fetch_error),
    .io_cpu_fetch_mmuRefilling(IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling),
    .io_cpu_fetch_mmuException(IBusCachedPlugin_cache_io_cpu_fetch_mmuException),
    .io_cpu_fetch_isUser(_zz_183_),
    .io_cpu_fetch_haltIt(IBusCachedPlugin_cache_io_cpu_fetch_haltIt),
    .io_cpu_decode_isValid(_zz_184_),
    .io_cpu_decode_isStuck(_zz_185_),
    .io_cpu_decode_pc(_zz_186_),
    .io_cpu_decode_physicalAddress(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_cpu_decode_data(IBusCachedPlugin_cache_io_cpu_decode_data),
    .io_cpu_fill_valid(_zz_187_),
    .io_cpu_fill_payload(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_mem_cmd_valid(IBusCachedPlugin_cache_io_mem_cmd_valid),
    .io_mem_cmd_ready(iBus_cmd_ready),
    .io_mem_cmd_payload_address(IBusCachedPlugin_cache_io_mem_cmd_payload_address),
    .io_mem_cmd_payload_size(IBusCachedPlugin_cache_io_mem_cmd_payload_size),
    .io_mem_rsp_valid(iBus_rsp_valid),
    .io_mem_rsp_payload_data(iBus_rsp_payload_data),
    .io_mem_rsp_payload_error(iBus_rsp_payload_error),
    .clk(clk),
    .reset(reset) 
  );
  DataCache dataCache_1_ ( 
    .io_cpu_execute_isValid(_zz_188_),
    .io_cpu_execute_address(_zz_189_),
    .io_cpu_execute_args_wr(execute_MEMORY_WR),
    .io_cpu_execute_args_data(_zz_106_),
    .io_cpu_execute_args_size(execute_DBusCachedPlugin_size),
    .io_cpu_memory_isValid(_zz_190_),
    .io_cpu_memory_isStuck(memory_arbitration_isStuck),
    .io_cpu_memory_isRemoved(memory_arbitration_removeIt),
    .io_cpu_memory_isWrite(dataCache_1__io_cpu_memory_isWrite),
    .io_cpu_memory_address(_zz_191_),
    .io_cpu_memory_mmuBus_cmd_isValid(dataCache_1__io_cpu_memory_mmuBus_cmd_isValid),
    .io_cpu_memory_mmuBus_cmd_virtualAddress(dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress),
    .io_cpu_memory_mmuBus_cmd_bypassTranslation(dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation),
    .io_cpu_memory_mmuBus_rsp_physicalAddress(DBusCachedPlugin_mmuBus_rsp_physicalAddress),
    .io_cpu_memory_mmuBus_rsp_isIoAccess(_zz_192_),
    .io_cpu_memory_mmuBus_rsp_allowRead(DBusCachedPlugin_mmuBus_rsp_allowRead),
    .io_cpu_memory_mmuBus_rsp_allowWrite(DBusCachedPlugin_mmuBus_rsp_allowWrite),
    .io_cpu_memory_mmuBus_rsp_allowExecute(DBusCachedPlugin_mmuBus_rsp_allowExecute),
    .io_cpu_memory_mmuBus_rsp_exception(DBusCachedPlugin_mmuBus_rsp_exception),
    .io_cpu_memory_mmuBus_rsp_refilling(DBusCachedPlugin_mmuBus_rsp_refilling),
    .io_cpu_memory_mmuBus_end(dataCache_1__io_cpu_memory_mmuBus_end),
    .io_cpu_memory_mmuBus_busy(DBusCachedPlugin_mmuBus_busy),
    .io_cpu_writeBack_isValid(_zz_193_),
    .io_cpu_writeBack_isStuck(writeBack_arbitration_isStuck),
    .io_cpu_writeBack_isUser(_zz_194_),
    .io_cpu_writeBack_haltIt(dataCache_1__io_cpu_writeBack_haltIt),
    .io_cpu_writeBack_isWrite(dataCache_1__io_cpu_writeBack_isWrite),
    .io_cpu_writeBack_data(dataCache_1__io_cpu_writeBack_data),
    .io_cpu_writeBack_address(_zz_195_),
    .io_cpu_writeBack_mmuException(dataCache_1__io_cpu_writeBack_mmuException),
    .io_cpu_writeBack_unalignedAccess(dataCache_1__io_cpu_writeBack_unalignedAccess),
    .io_cpu_writeBack_accessError(dataCache_1__io_cpu_writeBack_accessError),
    .io_cpu_redo(dataCache_1__io_cpu_redo),
    .io_cpu_flush_valid(_zz_196_),
    .io_cpu_flush_ready(dataCache_1__io_cpu_flush_ready),
    .io_mem_cmd_valid(dataCache_1__io_mem_cmd_valid),
    .io_mem_cmd_ready(_zz_197_),
    .io_mem_cmd_payload_wr(dataCache_1__io_mem_cmd_payload_wr),
    .io_mem_cmd_payload_address(dataCache_1__io_mem_cmd_payload_address),
    .io_mem_cmd_payload_data(dataCache_1__io_mem_cmd_payload_data),
    .io_mem_cmd_payload_mask(dataCache_1__io_mem_cmd_payload_mask),
    .io_mem_cmd_payload_length(dataCache_1__io_mem_cmd_payload_length),
    .io_mem_cmd_payload_last(dataCache_1__io_mem_cmd_payload_last),
    .io_mem_rsp_valid(dBus_rsp_valid),
    .io_mem_rsp_payload_data(dBus_rsp_payload_data),
    .io_mem_rsp_payload_error(dBus_rsp_payload_error),
    .clk(clk),
    .reset(reset) 
  );
  always @(*) begin
    case(_zz_340_)
      3'b000 : begin
        _zz_200_ = DBusCachedPlugin_redoBranch_payload;
      end
      3'b001 : begin
        _zz_200_ = CsrPlugin_jumpInterface_payload;
      end
      3'b010 : begin
        _zz_200_ = BranchPlugin_jumpInterface_payload;
      end
      3'b011 : begin
        _zz_200_ = IBusCachedPlugin_redoBranch_payload;
      end
      default : begin
        _zz_200_ = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_1_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_1__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_1__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_1__string = "AND_1";
      default : _zz_1__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_2__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_2__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_2__string = "AND_1";
      default : _zz_2__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_3__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_3__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_3__string = "AND_1";
      default : _zz_3__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_4__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_4__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_4__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_4__string = "JALR";
      default : _zz_4__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_5__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_5__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_5__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_5__string = "JALR";
      default : _zz_5__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_6__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_6__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_6__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_6__string = "PC ";
      default : _zz_6__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_7__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_7__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_7__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_7__string = "PC ";
      default : _zz_7__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_8__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_8__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_8__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_8__string = "PC ";
      default : _zz_8__string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_9__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_9__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_9__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_9__string = "URS1        ";
      default : _zz_9__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_10__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_10__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_10__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_10__string = "URS1        ";
      default : _zz_10__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_11__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_11__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_11__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_11__string = "URS1        ";
      default : _zz_11__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_12__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_12__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_12__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_12__string = "ECALL";
      default : _zz_12__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_13__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_13__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_13__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_13__string = "ECALL";
      default : _zz_13__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_14__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_14__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_14__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_14__string = "ECALL";
      default : _zz_14__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_15__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_15__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_15__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_15__string = "ECALL";
      default : _zz_15__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : decode_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL";
      default : decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_16__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_16__string = "ECALL";
      default : _zz_16__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_17__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_17__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_17__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_17__string = "ECALL";
      default : _zz_17__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_18__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_18__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_18__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_18__string = "ECALL";
      default : _zz_18__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_19__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_19__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_19__string = "BITWISE ";
      default : _zz_19__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_20__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_20__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_20__string = "BITWISE ";
      default : _zz_20__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_21__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_21__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_21__string = "BITWISE ";
      default : _zz_21__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_22_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_22__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_22__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_22__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_22__string = "SRA_1    ";
      default : _zz_22__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_23_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_23__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_23__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_23__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_23__string = "SRA_1    ";
      default : _zz_23__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_24_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_24__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_24__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_24__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_24__string = "SRA_1    ";
      default : _zz_24__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_25_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_25__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_25__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_25__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_25__string = "SRA_1    ";
      default : _zz_25__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_26_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_26__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_26__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_26__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_26__string = "SRA_1    ";
      default : _zz_26__string = "?????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_27_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_27__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_27__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_27__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_27__string = "ECALL";
      default : _zz_27__string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL";
      default : execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_28_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_28__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_28__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_28__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_28__string = "ECALL";
      default : _zz_28__string = "?????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : writeBack_ENV_CTRL_string = "ECALL";
      default : writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_29_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_29__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_29__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_29__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_29__string = "ECALL";
      default : _zz_29__string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_30_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_30__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_30__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_30__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_30__string = "JALR";
      default : _zz_30__string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_33_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_33__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_33__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_33__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_33__string = "SRA_1    ";
      default : _zz_33__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_34_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_34__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_34__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_34__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_34__string = "SRA_1    ";
      default : _zz_34__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_36_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_36__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_36__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_36__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_36__string = "PC ";
      default : _zz_36__string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_37_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_37__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_37__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_37__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_37__string = "URS1        ";
      default : _zz_37__string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_38_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_38__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_38__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_38__string = "BITWISE ";
      default : _zz_38__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_39_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_39__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_39__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_39__string = "AND_1";
      default : _zz_39__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_43_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_43__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_43__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_43__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_43__string = "PC ";
      default : _zz_43__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_44_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_44__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_44__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_44__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_44__string = "JALR";
      default : _zz_44__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_45_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_45__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_45__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_45__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_45__string = "URS1        ";
      default : _zz_45__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_46_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_46__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_46__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_46__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_46__string = "SRA_1    ";
      default : _zz_46__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_47_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_47__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_47__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_47__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_47__string = "ECALL";
      default : _zz_47__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_48_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_48__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_48__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_48__string = "AND_1";
      default : _zz_48__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_49_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_49__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_49__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_49__string = "BITWISE ";
      default : _zz_49__string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_51_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_51__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_51__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_51__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_51__string = "JALR";
      default : _zz_51__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_116_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_116__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_116__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_116__string = "BITWISE ";
      default : _zz_116__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_117_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_117__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_117__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_117__string = "AND_1";
      default : _zz_117__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_118_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_118__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_118__string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_118__string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_118__string = "ECALL";
      default : _zz_118__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_119_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_119__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_119__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_119__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_119__string = "SRA_1    ";
      default : _zz_119__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_120_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_120__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_120__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_120__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_120__string = "URS1        ";
      default : _zz_120__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_121_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_121__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_121__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_121__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_121__string = "JALR";
      default : _zz_121__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_122_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_122__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_122__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_122__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_122__string = "PC ";
      default : _zz_122__string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : decode_to_execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL";
      default : decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : execute_to_memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL";
      default : execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_to_writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  `endif

  assign decode_ALU_BITWISE_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_4_ = _zz_5_;
  assign decode_SRC2_CTRL = _zz_6_;
  assign _zz_7_ = _zz_8_;
  assign decode_SRC1_CTRL = _zz_9_;
  assign _zz_10_ = _zz_11_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_247_[0];
  assign decode_IS_CSR = _zz_248_[0];
  assign execute_SHIFT_RIGHT = _zz_250_;
  assign decode_IS_RS2_SIGNED = _zz_252_[0];
  assign decode_DO_EBREAK = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0));
  assign decode_IS_DIV = _zz_253_[0];
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign memory_MUL_LOW = ($signed(_zz_254_) + $signed(_zz_262_));
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_189_[1 : 0];
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign _zz_12_ = _zz_13_;
  assign _zz_14_ = _zz_15_;
  assign decode_ENV_CTRL = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_264_);
  assign decode_ALU_CTRL = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_265_[0];
  assign execute_REGFILE_WRITE_DATA = _zz_124_;
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign decode_SRC_LESS_UNSIGNED = _zz_266_[0];
  assign decode_IS_RS1_SIGNED = _zz_267_[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_268_[0];
  assign _zz_22_ = _zz_23_;
  assign decode_SHIFT_CTRL = _zz_24_;
  assign _zz_25_ = _zz_26_;
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign decode_MEMORY_MANAGMENT = _zz_269_[0];
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_PC = execute_to_memory_PC;
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_270_[0];
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_271_[0];
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_27_;
  assign execute_ENV_CTRL = _zz_28_;
  assign writeBack_ENV_CTRL = _zz_29_;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_COND_RESULT = _zz_146_;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_30_;
  assign decode_RS2_USE = _zz_272_[0];
  assign decode_RS1_USE = _zz_273_[0];
  always @ (*) begin
    _zz_31_ = execute_REGFILE_WRITE_DATA;
    if(_zz_201_)begin
      _zz_31_ = execute_CsrPlugin_readData;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_135_)begin
      if((_zz_136_ == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_137_;
      end
    end
    if(_zz_202_)begin
      if(_zz_203_)begin
        if(_zz_139_)begin
          decode_RS2 = _zz_50_;
        end
      end
    end
    if(_zz_204_)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_141_)begin
          decode_RS2 = _zz_32_;
        end
      end
    end
    if(_zz_205_)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_143_)begin
          decode_RS2 = _zz_31_;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_135_)begin
      if((_zz_136_ == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_137_;
      end
    end
    if(_zz_202_)begin
      if(_zz_203_)begin
        if(_zz_138_)begin
          decode_RS1 = _zz_50_;
        end
      end
    end
    if(_zz_204_)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_140_)begin
          decode_RS1 = _zz_32_;
        end
      end
    end
    if(_zz_205_)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_142_)begin
          decode_RS1 = _zz_31_;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_32_ = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_32_ = _zz_132_;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_32_ = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_206_)begin
      _zz_32_ = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_33_;
  assign execute_SHIFT_CTRL = _zz_34_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_35_ = execute_PC;
  assign execute_SRC2_CTRL = _zz_36_;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_SRC1_CTRL = _zz_37_;
  assign decode_SRC_USE_SUB_LESS = _zz_274_[0];
  assign decode_SRC_ADD_ZERO = _zz_275_[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_38_;
  assign execute_SRC2 = _zz_130_;
  assign execute_SRC1 = _zz_125_;
  assign execute_ALU_BITWISE_CTRL = _zz_39_;
  assign _zz_40_ = writeBack_INSTRUCTION;
  assign _zz_41_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_42_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_42_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_decompressor_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_276_[0];
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_341_) == (32'b00000000000000000001000001110011)),{(_zz_342_ == _zz_343_),{_zz_344_,{_zz_345_,_zz_346_}}}}}}} != (21'b000000000000000000000));
  assign decode_INSTRUCTION_READY = 1'b1;
  always @ (*) begin
    _zz_50_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_50_ = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_246_)
        2'b00 : begin
          _zz_50_ = _zz_313_;
        end
        default : begin
          _zz_50_ = _zz_314_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_277_[0];
  assign decode_FLUSH_ALL = _zz_278_[0];
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected = IBusCachedPlugin_rsp_issueDetected_2;
    if(_zz_207_)begin
      IBusCachedPlugin_rsp_issueDetected = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(_zz_208_)begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected_0;
    if(_zz_209_)begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_0 = 1'b0;
    if(_zz_210_)begin
      IBusCachedPlugin_rsp_issueDetected_0 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_51_;
  always @ (*) begin
    _zz_52_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_52_ = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_53_ = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      _zz_53_ = IBusCachedPlugin_predictionJumpInterface_payload;
    end
    if(IBusCachedPlugin_redoBranch_valid)begin
      _zz_53_ = IBusCachedPlugin_redoBranch_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
    case(_zz_169_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      3'b011 : begin
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_133_ || _zz_134_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts))begin
      decode_arbitration_haltByOther = decode_arbitration_isValid;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_211_)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(_zz_168_)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_redoBranch_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_211_)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if((_zz_196_ && (! dataCache_1__io_cpu_flush_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(((dataCache_1__io_cpu_redo && execute_arbitration_isValid) && execute_MEMORY_ENABLE))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_212_)begin
      if((! execute_CsrPlugin_wfiWake))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_201_)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(_zz_213_)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_213_)begin
      if(_zz_214_)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_213_)begin
      if(_zz_214_)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if(_zz_206_)begin
      if(((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1__io_cpu_writeBack_haltIt)begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_215_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_216_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != (4'b0000)))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_215_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_216_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_213_)begin
      if(_zz_214_)begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_217_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetcherflushIt = 1'b0;
    if(({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != (4'b0000)))begin
      IBusCachedPlugin_fetcherflushIt = 1'b1;
    end
    if((IBusCachedPlugin_predictionJumpInterface_valid && decode_arbitration_isFiring))begin
      IBusCachedPlugin_fetcherflushIt = 1'b1;
    end
    if(_zz_213_)begin
      if(_zz_214_)begin
        IBusCachedPlugin_fetcherflushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_valid)begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
    if((IBusCachedPlugin_decompressor_bufferValid && (IBusCachedPlugin_decompressor_bufferData[1 : 0] != (2'b11))))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    _zz_54_ = 1'b0;
    if(DebugPlugin_godmode)begin
      _zz_54_ = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_inWfi = 1'b0;
    if(_zz_212_)begin
      CsrPlugin_inWfi = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_215_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_216_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_215_)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_216_)begin
      case(_zz_218_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode)begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,{IBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}}} != (5'b00000));
  assign _zz_55_ = {IBusCachedPlugin_predictionJumpInterface_valid,{IBusCachedPlugin_redoBranch_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}}};
  assign _zz_56_ = (_zz_55_ & (~ _zz_279_));
  assign _zz_57_ = _zz_56_[3];
  assign _zz_58_ = _zz_56_[4];
  assign _zz_59_ = (_zz_56_[1] || _zz_57_);
  assign _zz_60_ = (_zz_56_[2] || _zz_57_);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_200_;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_corrected = 1'b0;
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_corrected = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_281_);
    if(IBusCachedPlugin_fetchPc_inc)begin
      IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
  end

  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  assign IBusCachedPlugin_decodePc_pcPlus = (IBusCachedPlugin_decodePc_pcReg + _zz_283_);
  always @ (*) begin
    IBusCachedPlugin_decodePc_injectedDecode = 1'b0;
    if((_zz_169_ != (3'b000)))begin
      IBusCachedPlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_inputSample = 1'b1;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_61_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_61_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_61_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_fetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
    if((IBusCachedPlugin_rsp_issueDetected || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_62_ = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_62_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_62_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_63_;
  assign _zz_63_ = ((1'b0 && (! _zz_64_)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_64_ = _zz_65_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_64_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if((IBusCachedPlugin_decompressor_bufferValid && IBusCachedPlugin_decompressor_isRvc))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_decompressor_raw = (IBusCachedPlugin_decompressor_bufferValid ? {IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[15 : 0],IBusCachedPlugin_decompressor_bufferData} : {IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[31 : 16],(IBusCachedPlugin_iBusRsp_output_payload_pc[1] ? IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[31 : 16] : IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[15 : 0])});
  assign IBusCachedPlugin_decompressor_isRvc = (IBusCachedPlugin_decompressor_raw[1 : 0] != (2'b11));
  assign _zz_66_ = IBusCachedPlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusCachedPlugin_decompressor_decompressed = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(_zz_241_)
      5'b00000 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{{(2'b00),_zz_66_[10 : 7]},_zz_66_[12 : 11]},_zz_66_[5]},_zz_66_[6]},(2'b00)},(5'b00010)},(3'b000)},_zz_68_},(7'b0010011)};
      end
      5'b00010 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_69_,_zz_67_},(3'b010)},_zz_68_},(7'b0000011)};
      end
      5'b00110 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_69_[11 : 5],_zz_68_},_zz_67_},(3'b010)},_zz_69_[4 : 0]},(7'b0100011)};
      end
      5'b01000 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_71_,_zz_66_[11 : 7]},(3'b000)},_zz_66_[11 : 7]},(7'b0010011)};
      end
      5'b01001 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_74_[20],_zz_74_[10 : 1]},_zz_74_[11]},_zz_74_[19 : 12]},_zz_86_},(7'b1101111)};
      end
      5'b01010 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_71_,(5'b00000)},(3'b000)},_zz_66_[11 : 7]},(7'b0010011)};
      end
      5'b01011 : begin
        IBusCachedPlugin_decompressor_decompressed = ((_zz_66_[11 : 7] == (5'b00010)) ? {{{{{{{{{_zz_78_,_zz_66_[4 : 3]},_zz_66_[5]},_zz_66_[2]},_zz_66_[6]},(4'b0000)},_zz_66_[11 : 7]},(3'b000)},_zz_66_[11 : 7]},(7'b0010011)} : {{_zz_284_[31 : 12],_zz_66_[11 : 7]},(7'b0110111)});
      end
      5'b01100 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{((_zz_66_[11 : 10] == (2'b10)) ? _zz_92_ : {{(1'b0),(_zz_359_ || _zz_360_)},(5'b00000)}),(((! _zz_66_[11]) || _zz_88_) ? _zz_66_[6 : 2] : _zz_68_)},_zz_67_},_zz_90_},_zz_67_},(_zz_88_ ? (7'b0010011) : (7'b0110011))};
      end
      5'b01101 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_81_[20],_zz_81_[10 : 1]},_zz_81_[11]},_zz_81_[19 : 12]},_zz_85_},(7'b1101111)};
      end
      5'b01110 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{_zz_84_[12],_zz_84_[10 : 5]},_zz_85_},_zz_67_},(3'b000)},_zz_84_[4 : 1]},_zz_84_[11]},(7'b1100011)};
      end
      5'b01111 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{_zz_84_[12],_zz_84_[10 : 5]},_zz_85_},_zz_67_},(3'b001)},_zz_84_[4 : 1]},_zz_84_[11]},(7'b1100011)};
      end
      5'b10000 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{(7'b0000000),_zz_66_[6 : 2]},_zz_66_[11 : 7]},(3'b001)},_zz_66_[11 : 7]},(7'b0010011)};
      end
      5'b10010 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{(4'b0000),_zz_66_[3 : 2]},_zz_66_[12]},_zz_66_[6 : 4]},(2'b00)},_zz_87_},(3'b010)},_zz_66_[11 : 7]},(7'b0000011)};
      end
      5'b10100 : begin
        IBusCachedPlugin_decompressor_decompressed = ((_zz_66_[12 : 2] == (11'b10000000000)) ? (32'b00000000000100000000000001110011) : ((_zz_66_[6 : 2] == (5'b00000)) ? {{{{(12'b000000000000),_zz_66_[11 : 7]},(3'b000)},(_zz_66_[12] ? _zz_86_ : _zz_85_)},(7'b1100111)} : {{{{{_zz_361_,_zz_362_},(_zz_363_ ? _zz_364_ : _zz_85_)},(3'b000)},_zz_66_[11 : 7]},(7'b0110011)}));
      end
      5'b10110 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_285_[11 : 5],_zz_66_[6 : 2]},_zz_87_},(3'b010)},_zz_286_[4 : 0]},(7'b0100011)};
      end
      default : begin
      end
    endcase
  end

  assign _zz_67_ = {(2'b01),_zz_66_[9 : 7]};
  assign _zz_68_ = {(2'b01),_zz_66_[4 : 2]};
  assign _zz_69_ = {{{{(5'b00000),_zz_66_[5]},_zz_66_[12 : 10]},_zz_66_[6]},(2'b00)};
  assign _zz_70_ = _zz_66_[12];
  always @ (*) begin
    _zz_71_[11] = _zz_70_;
    _zz_71_[10] = _zz_70_;
    _zz_71_[9] = _zz_70_;
    _zz_71_[8] = _zz_70_;
    _zz_71_[7] = _zz_70_;
    _zz_71_[6] = _zz_70_;
    _zz_71_[5] = _zz_70_;
    _zz_71_[4 : 0] = _zz_66_[6 : 2];
  end

  assign _zz_72_ = _zz_66_[12];
  always @ (*) begin
    _zz_73_[9] = _zz_72_;
    _zz_73_[8] = _zz_72_;
    _zz_73_[7] = _zz_72_;
    _zz_73_[6] = _zz_72_;
    _zz_73_[5] = _zz_72_;
    _zz_73_[4] = _zz_72_;
    _zz_73_[3] = _zz_72_;
    _zz_73_[2] = _zz_72_;
    _zz_73_[1] = _zz_72_;
    _zz_73_[0] = _zz_72_;
  end

  assign _zz_74_ = {{{{{{{{_zz_73_,_zz_66_[8]},_zz_66_[10 : 9]},_zz_66_[6]},_zz_66_[7]},_zz_66_[2]},_zz_66_[11]},_zz_66_[5 : 3]},(1'b0)};
  assign _zz_75_ = _zz_66_[12];
  always @ (*) begin
    _zz_76_[14] = _zz_75_;
    _zz_76_[13] = _zz_75_;
    _zz_76_[12] = _zz_75_;
    _zz_76_[11] = _zz_75_;
    _zz_76_[10] = _zz_75_;
    _zz_76_[9] = _zz_75_;
    _zz_76_[8] = _zz_75_;
    _zz_76_[7] = _zz_75_;
    _zz_76_[6] = _zz_75_;
    _zz_76_[5] = _zz_75_;
    _zz_76_[4] = _zz_75_;
    _zz_76_[3] = _zz_75_;
    _zz_76_[2] = _zz_75_;
    _zz_76_[1] = _zz_75_;
    _zz_76_[0] = _zz_75_;
  end

  assign _zz_77_ = _zz_66_[12];
  always @ (*) begin
    _zz_78_[2] = _zz_77_;
    _zz_78_[1] = _zz_77_;
    _zz_78_[0] = _zz_77_;
  end

  assign _zz_79_ = _zz_66_[12];
  always @ (*) begin
    _zz_80_[9] = _zz_79_;
    _zz_80_[8] = _zz_79_;
    _zz_80_[7] = _zz_79_;
    _zz_80_[6] = _zz_79_;
    _zz_80_[5] = _zz_79_;
    _zz_80_[4] = _zz_79_;
    _zz_80_[3] = _zz_79_;
    _zz_80_[2] = _zz_79_;
    _zz_80_[1] = _zz_79_;
    _zz_80_[0] = _zz_79_;
  end

  assign _zz_81_ = {{{{{{{{_zz_80_,_zz_66_[8]},_zz_66_[10 : 9]},_zz_66_[6]},_zz_66_[7]},_zz_66_[2]},_zz_66_[11]},_zz_66_[5 : 3]},(1'b0)};
  assign _zz_82_ = _zz_66_[12];
  always @ (*) begin
    _zz_83_[4] = _zz_82_;
    _zz_83_[3] = _zz_82_;
    _zz_83_[2] = _zz_82_;
    _zz_83_[1] = _zz_82_;
    _zz_83_[0] = _zz_82_;
  end

  assign _zz_84_ = {{{{{_zz_83_,_zz_66_[6 : 5]},_zz_66_[2]},_zz_66_[11 : 10]},_zz_66_[4 : 3]},(1'b0)};
  assign _zz_85_ = (5'b00000);
  assign _zz_86_ = (5'b00001);
  assign _zz_87_ = (5'b00010);
  assign _zz_88_ = (_zz_66_[11 : 10] != (2'b11));
  always @ (*) begin
    case(_zz_242_)
      2'b00 : begin
        _zz_89_ = (3'b000);
      end
      2'b01 : begin
        _zz_89_ = (3'b100);
      end
      2'b10 : begin
        _zz_89_ = (3'b110);
      end
      default : begin
        _zz_89_ = (3'b111);
      end
    endcase
  end

  always @ (*) begin
    case(_zz_243_)
      2'b00 : begin
        _zz_90_ = (3'b101);
      end
      2'b01 : begin
        _zz_90_ = (3'b101);
      end
      2'b10 : begin
        _zz_90_ = (3'b111);
      end
      default : begin
        _zz_90_ = _zz_89_;
      end
    endcase
  end

  assign _zz_91_ = _zz_66_[12];
  always @ (*) begin
    _zz_92_[6] = _zz_91_;
    _zz_92_[5] = _zz_91_;
    _zz_92_[4] = _zz_91_;
    _zz_92_[3] = _zz_91_;
    _zz_92_[2] = _zz_91_;
    _zz_92_[1] = _zz_91_;
    _zz_92_[0] = _zz_91_;
  end

  assign IBusCachedPlugin_decompressor_output_valid = (IBusCachedPlugin_decompressor_isRvc ? (IBusCachedPlugin_decompressor_bufferValid || IBusCachedPlugin_iBusRsp_output_valid) : (IBusCachedPlugin_iBusRsp_output_valid && (IBusCachedPlugin_decompressor_bufferValid || (! IBusCachedPlugin_iBusRsp_output_payload_pc[1]))));
  assign IBusCachedPlugin_decompressor_output_payload_pc = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign IBusCachedPlugin_decompressor_output_payload_isRvc = IBusCachedPlugin_decompressor_isRvc;
  assign IBusCachedPlugin_decompressor_output_payload_rsp_inst = (IBusCachedPlugin_decompressor_isRvc ? IBusCachedPlugin_decompressor_decompressed : IBusCachedPlugin_decompressor_raw);
  assign IBusCachedPlugin_iBusRsp_output_ready = ((! IBusCachedPlugin_decompressor_output_valid) || (! (((! IBusCachedPlugin_decompressor_output_ready) || ((IBusCachedPlugin_decompressor_isRvc && (! IBusCachedPlugin_iBusRsp_output_payload_pc[1])) && (IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11)))) || (((! IBusCachedPlugin_decompressor_isRvc) && IBusCachedPlugin_decompressor_bufferValid) && (IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11))))));
  always @ (*) begin
    IBusCachedPlugin_decompressor_bufferFill = 1'b0;
    if(_zz_219_)begin
      if(_zz_220_)begin
        IBusCachedPlugin_decompressor_bufferFill = 1'b1;
      end
    end
  end

  assign IBusCachedPlugin_decompressor_output_ready = ((1'b0 && (! IBusCachedPlugin_injector_decodeInput_valid)) || IBusCachedPlugin_injector_decodeInput_ready);
  assign IBusCachedPlugin_injector_decodeInput_valid = _zz_93_;
  assign IBusCachedPlugin_injector_decodeInput_payload_pc = _zz_94_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_error = _zz_95_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_inst = _zz_96_;
  assign IBusCachedPlugin_injector_decodeInput_payload_isRvc = _zz_97_;
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_0;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = (IBusCachedPlugin_injector_decodeInput_valid && (! IBusCachedPlugin_injector_decodeRemoved));
    case(_zz_169_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_98_ = _zz_287_[11];
  always @ (*) begin
    _zz_99_[18] = _zz_98_;
    _zz_99_[17] = _zz_98_;
    _zz_99_[16] = _zz_98_;
    _zz_99_[15] = _zz_98_;
    _zz_99_[14] = _zz_98_;
    _zz_99_[13] = _zz_98_;
    _zz_99_[12] = _zz_98_;
    _zz_99_[11] = _zz_98_;
    _zz_99_[10] = _zz_98_;
    _zz_99_[9] = _zz_98_;
    _zz_99_[8] = _zz_98_;
    _zz_99_[7] = _zz_98_;
    _zz_99_[6] = _zz_98_;
    _zz_99_[5] = _zz_98_;
    _zz_99_[4] = _zz_98_;
    _zz_99_[3] = _zz_98_;
    _zz_99_[2] = _zz_98_;
    _zz_99_[1] = _zz_98_;
    _zz_99_[0] = _zz_98_;
  end

  assign IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_288_[31]));
  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_100_ = _zz_289_[19];
  always @ (*) begin
    _zz_101_[10] = _zz_100_;
    _zz_101_[9] = _zz_100_;
    _zz_101_[8] = _zz_100_;
    _zz_101_[7] = _zz_100_;
    _zz_101_[6] = _zz_100_;
    _zz_101_[5] = _zz_100_;
    _zz_101_[4] = _zz_100_;
    _zz_101_[3] = _zz_100_;
    _zz_101_[2] = _zz_100_;
    _zz_101_[1] = _zz_100_;
    _zz_101_[0] = _zz_100_;
  end

  assign _zz_102_ = _zz_290_[11];
  always @ (*) begin
    _zz_103_[18] = _zz_102_;
    _zz_103_[17] = _zz_102_;
    _zz_103_[16] = _zz_102_;
    _zz_103_[15] = _zz_102_;
    _zz_103_[14] = _zz_102_;
    _zz_103_[13] = _zz_102_;
    _zz_103_[12] = _zz_102_;
    _zz_103_[11] = _zz_102_;
    _zz_103_[10] = _zz_102_;
    _zz_103_[9] = _zz_102_;
    _zz_103_[8] = _zz_102_;
    _zz_103_[7] = _zz_102_;
    _zz_103_[6] = _zz_102_;
    _zz_103_[5] = _zz_102_;
    _zz_103_[4] = _zz_102_;
    _zz_103_[3] = _zz_102_;
    _zz_103_[2] = _zz_102_;
    _zz_103_[1] = _zz_102_;
    _zz_103_[0] = _zz_102_;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_101_,{{{_zz_365_,_zz_366_},_zz_367_},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_103_,{{{_zz_368_,_zz_369_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_180_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_181_ = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_182_ = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_183_ = (CsrPlugin_privilege == (2'b00));
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_210_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_208_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_221_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b0;
    end
  end

  always @ (*) begin
    _zz_187_ = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling));
    if(_zz_208_)begin
      _zz_187_ = 1'b1;
    end
    if(_zz_221_)begin
      _zz_187_ = 1'b0;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_209_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_207_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = (4'bxxxx);
    if(_zz_209_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1100);
    end
    if(_zz_207_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b0001);
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_1_input_payload[31 : 2],(2'b00)};
  assign IBusCachedPlugin_redoBranch_valid = IBusCachedPlugin_rsp_redoFetch;
  assign IBusCachedPlugin_redoBranch_payload = decode_PC;
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_fetch_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  assign IBusCachedPlugin_mmuBus_cmd_isValid = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_virtualAddress = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_cmd_bypassTranslation = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  assign IBusCachedPlugin_mmuBus_end = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  assign _zz_179_ = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1__io_mem_cmd_s2mPipe_valid = (dataCache_1__io_mem_cmd_valid || dataCache_1__io_mem_cmd_s2mPipe_rValid);
  assign _zz_197_ = (! dataCache_1__io_mem_cmd_s2mPipe_rValid);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_wr = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_wr : dataCache_1__io_mem_cmd_payload_wr);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_address = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_address : dataCache_1__io_mem_cmd_payload_address);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_data = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_data : dataCache_1__io_mem_cmd_payload_data);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_mask = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_mask : dataCache_1__io_mem_cmd_payload_mask);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_length = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_length : dataCache_1__io_mem_cmd_payload_length);
  assign dataCache_1__io_mem_cmd_s2mPipe_payload_last = (dataCache_1__io_mem_cmd_s2mPipe_rValid ? dataCache_1__io_mem_cmd_s2mPipe_rData_last : dataCache_1__io_mem_cmd_payload_last);
  assign dataCache_1__io_mem_cmd_s2mPipe_ready = ((1'b1 && (! dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid)) || dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready);
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  assign dBus_cmd_valid = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_valid;
  assign dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  assign dBus_cmd_payload_address = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  assign dBus_cmd_payload_last = dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign _zz_188_ = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign _zz_189_ = execute_SRC_ADD;
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_106_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_106_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_106_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign _zz_196_ = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign _zz_190_ = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign _zz_191_ = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_isValid = dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_virtualAddress = dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_cmd_bypassTranslation = dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  always @ (*) begin
    _zz_192_ = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((_zz_54_ && (! dataCache_1__io_cpu_memory_isWrite)))begin
      _zz_192_ = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = dataCache_1__io_cpu_memory_mmuBus_end;
  assign _zz_193_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_194_ = (CsrPlugin_privilege == (2'b00));
  assign _zz_195_ = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(_zz_222_)begin
      if(dataCache_1__io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(_zz_222_)begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_redo)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_code = (4'bxxxx);
    if(_zz_222_)begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_291_};
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_292_};
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? (4'b1111) : (4'b1101));
      end
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1__io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_107_ = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_108_[31] = _zz_107_;
    _zz_108_[30] = _zz_107_;
    _zz_108_[29] = _zz_107_;
    _zz_108_[28] = _zz_107_;
    _zz_108_[27] = _zz_107_;
    _zz_108_[26] = _zz_107_;
    _zz_108_[25] = _zz_107_;
    _zz_108_[24] = _zz_107_;
    _zz_108_[23] = _zz_107_;
    _zz_108_[22] = _zz_107_;
    _zz_108_[21] = _zz_107_;
    _zz_108_[20] = _zz_107_;
    _zz_108_[19] = _zz_107_;
    _zz_108_[18] = _zz_107_;
    _zz_108_[17] = _zz_107_;
    _zz_108_[16] = _zz_107_;
    _zz_108_[15] = _zz_107_;
    _zz_108_[14] = _zz_107_;
    _zz_108_[13] = _zz_107_;
    _zz_108_[12] = _zz_107_;
    _zz_108_[11] = _zz_107_;
    _zz_108_[10] = _zz_107_;
    _zz_108_[9] = _zz_107_;
    _zz_108_[8] = _zz_107_;
    _zz_108_[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_109_ = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_110_[31] = _zz_109_;
    _zz_110_[30] = _zz_109_;
    _zz_110_[29] = _zz_109_;
    _zz_110_[28] = _zz_109_;
    _zz_110_[27] = _zz_109_;
    _zz_110_[26] = _zz_109_;
    _zz_110_[25] = _zz_109_;
    _zz_110_[24] = _zz_109_;
    _zz_110_[23] = _zz_109_;
    _zz_110_[22] = _zz_109_;
    _zz_110_[21] = _zz_109_;
    _zz_110_[20] = _zz_109_;
    _zz_110_[19] = _zz_109_;
    _zz_110_[18] = _zz_109_;
    _zz_110_[17] = _zz_109_;
    _zz_110_[16] = _zz_109_;
    _zz_110_[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_244_)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_108_;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_110_;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = IBusCachedPlugin_mmuBus_rsp_physicalAddress[31];
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_physicalAddress[31];
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  assign _zz_112_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_113_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_114_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_115_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_111_ = {({_zz_112_,(_zz_370_ == _zz_371_)} != (2'b00)),{({_zz_112_,_zz_372_} != (2'b00)),{(_zz_373_ != (1'b0)),{(_zz_374_ != _zz_375_),{_zz_376_,{_zz_377_,_zz_378_}}}}}};
  assign _zz_116_ = _zz_111_[2 : 1];
  assign _zz_49_ = _zz_116_;
  assign _zz_117_ = _zz_111_[5 : 4];
  assign _zz_48_ = _zz_117_;
  assign _zz_118_ = _zz_111_[12 : 11];
  assign _zz_47_ = _zz_118_;
  assign _zz_119_ = _zz_111_[18 : 17];
  assign _zz_46_ = _zz_119_;
  assign _zz_120_ = _zz_111_[20 : 19];
  assign _zz_45_ = _zz_120_;
  assign _zz_121_ = _zz_111_[25 : 24];
  assign _zz_44_ = _zz_121_;
  assign _zz_122_ = _zz_111_[32 : 31];
  assign _zz_43_ = _zz_122_;
  assign decodeExceptionPort_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = (4'b0010);
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_198_;
  assign decode_RegFilePlugin_rs2Data = _zz_199_;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_41_ && writeBack_arbitration_isFiring);
    if(_zz_123_)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  assign lastStageRegFileWrite_payload_address = _zz_40_[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_50_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_124_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_124_ = {31'd0, _zz_293_};
      end
      default : begin
        _zz_124_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_125_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_125_ = {29'd0, _zz_294_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_125_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_125_ = {27'd0, _zz_295_};
      end
    endcase
  end

  assign _zz_126_ = _zz_296_[11];
  always @ (*) begin
    _zz_127_[19] = _zz_126_;
    _zz_127_[18] = _zz_126_;
    _zz_127_[17] = _zz_126_;
    _zz_127_[16] = _zz_126_;
    _zz_127_[15] = _zz_126_;
    _zz_127_[14] = _zz_126_;
    _zz_127_[13] = _zz_126_;
    _zz_127_[12] = _zz_126_;
    _zz_127_[11] = _zz_126_;
    _zz_127_[10] = _zz_126_;
    _zz_127_[9] = _zz_126_;
    _zz_127_[8] = _zz_126_;
    _zz_127_[7] = _zz_126_;
    _zz_127_[6] = _zz_126_;
    _zz_127_[5] = _zz_126_;
    _zz_127_[4] = _zz_126_;
    _zz_127_[3] = _zz_126_;
    _zz_127_[2] = _zz_126_;
    _zz_127_[1] = _zz_126_;
    _zz_127_[0] = _zz_126_;
  end

  assign _zz_128_ = _zz_297_[11];
  always @ (*) begin
    _zz_129_[19] = _zz_128_;
    _zz_129_[18] = _zz_128_;
    _zz_129_[17] = _zz_128_;
    _zz_129_[16] = _zz_128_;
    _zz_129_[15] = _zz_128_;
    _zz_129_[14] = _zz_128_;
    _zz_129_[13] = _zz_128_;
    _zz_129_[12] = _zz_128_;
    _zz_129_[11] = _zz_128_;
    _zz_129_[10] = _zz_128_;
    _zz_129_[9] = _zz_128_;
    _zz_129_[8] = _zz_128_;
    _zz_129_[7] = _zz_128_;
    _zz_129_[6] = _zz_128_;
    _zz_129_[5] = _zz_128_;
    _zz_129_[4] = _zz_128_;
    _zz_129_[3] = _zz_128_;
    _zz_129_[2] = _zz_128_;
    _zz_129_[1] = _zz_128_;
    _zz_129_[0] = _zz_128_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_130_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_130_ = {_zz_127_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_130_ = {_zz_129_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_130_ = _zz_35_;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_298_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_131_[0] = execute_SRC1[31];
    _zz_131_[1] = execute_SRC1[30];
    _zz_131_[2] = execute_SRC1[29];
    _zz_131_[3] = execute_SRC1[28];
    _zz_131_[4] = execute_SRC1[27];
    _zz_131_[5] = execute_SRC1[26];
    _zz_131_[6] = execute_SRC1[25];
    _zz_131_[7] = execute_SRC1[24];
    _zz_131_[8] = execute_SRC1[23];
    _zz_131_[9] = execute_SRC1[22];
    _zz_131_[10] = execute_SRC1[21];
    _zz_131_[11] = execute_SRC1[20];
    _zz_131_[12] = execute_SRC1[19];
    _zz_131_[13] = execute_SRC1[18];
    _zz_131_[14] = execute_SRC1[17];
    _zz_131_[15] = execute_SRC1[16];
    _zz_131_[16] = execute_SRC1[15];
    _zz_131_[17] = execute_SRC1[14];
    _zz_131_[18] = execute_SRC1[13];
    _zz_131_[19] = execute_SRC1[12];
    _zz_131_[20] = execute_SRC1[11];
    _zz_131_[21] = execute_SRC1[10];
    _zz_131_[22] = execute_SRC1[9];
    _zz_131_[23] = execute_SRC1[8];
    _zz_131_[24] = execute_SRC1[7];
    _zz_131_[25] = execute_SRC1[6];
    _zz_131_[26] = execute_SRC1[5];
    _zz_131_[27] = execute_SRC1[4];
    _zz_131_[28] = execute_SRC1[3];
    _zz_131_[29] = execute_SRC1[2];
    _zz_131_[30] = execute_SRC1[1];
    _zz_131_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_131_ : execute_SRC1);
  always @ (*) begin
    _zz_132_[0] = memory_SHIFT_RIGHT[31];
    _zz_132_[1] = memory_SHIFT_RIGHT[30];
    _zz_132_[2] = memory_SHIFT_RIGHT[29];
    _zz_132_[3] = memory_SHIFT_RIGHT[28];
    _zz_132_[4] = memory_SHIFT_RIGHT[27];
    _zz_132_[5] = memory_SHIFT_RIGHT[26];
    _zz_132_[6] = memory_SHIFT_RIGHT[25];
    _zz_132_[7] = memory_SHIFT_RIGHT[24];
    _zz_132_[8] = memory_SHIFT_RIGHT[23];
    _zz_132_[9] = memory_SHIFT_RIGHT[22];
    _zz_132_[10] = memory_SHIFT_RIGHT[21];
    _zz_132_[11] = memory_SHIFT_RIGHT[20];
    _zz_132_[12] = memory_SHIFT_RIGHT[19];
    _zz_132_[13] = memory_SHIFT_RIGHT[18];
    _zz_132_[14] = memory_SHIFT_RIGHT[17];
    _zz_132_[15] = memory_SHIFT_RIGHT[16];
    _zz_132_[16] = memory_SHIFT_RIGHT[15];
    _zz_132_[17] = memory_SHIFT_RIGHT[14];
    _zz_132_[18] = memory_SHIFT_RIGHT[13];
    _zz_132_[19] = memory_SHIFT_RIGHT[12];
    _zz_132_[20] = memory_SHIFT_RIGHT[11];
    _zz_132_[21] = memory_SHIFT_RIGHT[10];
    _zz_132_[22] = memory_SHIFT_RIGHT[9];
    _zz_132_[23] = memory_SHIFT_RIGHT[8];
    _zz_132_[24] = memory_SHIFT_RIGHT[7];
    _zz_132_[25] = memory_SHIFT_RIGHT[6];
    _zz_132_[26] = memory_SHIFT_RIGHT[5];
    _zz_132_[27] = memory_SHIFT_RIGHT[4];
    _zz_132_[28] = memory_SHIFT_RIGHT[3];
    _zz_132_[29] = memory_SHIFT_RIGHT[2];
    _zz_132_[30] = memory_SHIFT_RIGHT[1];
    _zz_132_[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_133_ = 1'b0;
    if(_zz_223_)begin
      if(_zz_224_)begin
        if(_zz_138_)begin
          _zz_133_ = 1'b1;
        end
      end
    end
    if(_zz_225_)begin
      if(_zz_226_)begin
        if(_zz_140_)begin
          _zz_133_ = 1'b1;
        end
      end
    end
    if(_zz_227_)begin
      if(_zz_228_)begin
        if(_zz_142_)begin
          _zz_133_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_133_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_134_ = 1'b0;
    if(_zz_223_)begin
      if(_zz_224_)begin
        if(_zz_139_)begin
          _zz_134_ = 1'b1;
        end
      end
    end
    if(_zz_225_)begin
      if(_zz_226_)begin
        if(_zz_141_)begin
          _zz_134_ = 1'b1;
        end
      end
    end
    if(_zz_227_)begin
      if(_zz_228_)begin
        if(_zz_143_)begin
          _zz_134_ = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_134_ = 1'b0;
    end
  end

  assign _zz_138_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_139_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_140_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_141_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_142_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_143_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_144_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_144_ == (3'b000))) begin
        _zz_145_ = execute_BranchPlugin_eq;
    end else if((_zz_144_ == (3'b001))) begin
        _zz_145_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_144_ & (3'b101)) == (3'b101)))) begin
        _zz_145_ = (! execute_SRC_LESS);
    end else begin
        _zz_145_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_146_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_146_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_146_ = 1'b1;
      end
      default : begin
        _zz_146_ = _zz_145_;
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_147_ = _zz_305_[11];
  always @ (*) begin
    _zz_148_[19] = _zz_147_;
    _zz_148_[18] = _zz_147_;
    _zz_148_[17] = _zz_147_;
    _zz_148_[16] = _zz_147_;
    _zz_148_[15] = _zz_147_;
    _zz_148_[14] = _zz_147_;
    _zz_148_[13] = _zz_147_;
    _zz_148_[12] = _zz_147_;
    _zz_148_[11] = _zz_147_;
    _zz_148_[10] = _zz_147_;
    _zz_148_[9] = _zz_147_;
    _zz_148_[8] = _zz_147_;
    _zz_148_[7] = _zz_147_;
    _zz_148_[6] = _zz_147_;
    _zz_148_[5] = _zz_147_;
    _zz_148_[4] = _zz_147_;
    _zz_148_[3] = _zz_147_;
    _zz_148_[2] = _zz_147_;
    _zz_148_[1] = _zz_147_;
    _zz_148_[0] = _zz_147_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_148_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_150_,{{{_zz_526_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_152_,{{{_zz_527_,_zz_528_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_308_};
        end
      end
    endcase
  end

  assign _zz_149_ = _zz_306_[19];
  always @ (*) begin
    _zz_150_[10] = _zz_149_;
    _zz_150_[9] = _zz_149_;
    _zz_150_[8] = _zz_149_;
    _zz_150_[7] = _zz_149_;
    _zz_150_[6] = _zz_149_;
    _zz_150_[5] = _zz_149_;
    _zz_150_[4] = _zz_149_;
    _zz_150_[3] = _zz_149_;
    _zz_150_[2] = _zz_149_;
    _zz_150_[1] = _zz_149_;
    _zz_150_[0] = _zz_149_;
  end

  assign _zz_151_ = _zz_307_[11];
  always @ (*) begin
    _zz_152_[18] = _zz_151_;
    _zz_152_[17] = _zz_151_;
    _zz_152_[16] = _zz_151_;
    _zz_152_[15] = _zz_151_;
    _zz_152_[14] = _zz_151_;
    _zz_152_[13] = _zz_151_;
    _zz_152_[12] = _zz_151_;
    _zz_152_[11] = _zz_151_;
    _zz_152_[10] = _zz_151_;
    _zz_152_[9] = _zz_151_;
    _zz_152_[8] = _zz_151_;
    _zz_152_[7] = _zz_151_;
    _zz_152_[6] = _zz_151_;
    _zz_152_[5] = _zz_151_;
    _zz_152_[4] = _zz_151_;
    _zz_152_[3] = _zz_151_;
    _zz_152_[2] = _zz_151_;
    _zz_152_[1] = _zz_151_;
    _zz_152_[0] = _zz_151_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign _zz_153_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_154_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_155_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_156_ = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_157_ = _zz_309_[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_211_)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && IBusCachedPlugin_pcValids_3);
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != (3'b000)))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = (30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b111100010001 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b111100010100 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b101100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b101110000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001100000101 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b110011000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b101100000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b111100010011 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000011 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b111111000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b110000000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001100000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b111100010010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b101110000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b110010000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000010 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      default : begin
      end
    endcase
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(_zz_229_)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_230_)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = (4'bxxxx);
    if(_zz_229_)begin
      CsrPlugin_selfException_payload_code = (4'b0010);
    end
    if(_zz_230_)begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = (4'b1000);
        end
        default : begin
          CsrPlugin_selfException_payload_code = (4'b1011);
        end
      endcase
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  always @ (*) begin
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_readData[31 : 0] = _zz_165_;
      end
      12'b001100000000 : begin
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'b111100010001 : begin
        execute_CsrPlugin_readData[3 : 0] = (4'b1011);
      end
      12'b111100010100 : begin
      end
      12'b001101000001 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'b101100000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[31 : 0];
      end
      12'b101110000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[63 : 32];
      end
      12'b001101000100 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'b001100000101 : begin
        execute_CsrPlugin_readData[31 : 2] = CsrPlugin_mtvec_base;
        execute_CsrPlugin_readData[1 : 0] = CsrPlugin_mtvec_mode;
      end
      12'b110011000000 : begin
        execute_CsrPlugin_readData[12 : 0] = (13'b1000000000000);
        execute_CsrPlugin_readData[25 : 20] = (6'b100000);
      end
      12'b101100000010 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_minstret[31 : 0];
      end
      12'b111100010011 : begin
        execute_CsrPlugin_readData[5 : 0] = (6'b100001);
      end
      12'b001101000011 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mtval;
      end
      12'b111111000000 : begin
        execute_CsrPlugin_readData[31 : 0] = _zz_166_;
      end
      12'b110000000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[31 : 0];
      end
      12'b001100000001 : begin
        execute_CsrPlugin_readData[31 : 30] = CsrPlugin_misa_base;
        execute_CsrPlugin_readData[25 : 0] = CsrPlugin_misa_extensions;
      end
      12'b001101000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mscratch;
      end
      12'b111100010010 : begin
        execute_CsrPlugin_readData[4 : 0] = (5'b10110);
      end
      12'b001100000100 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'b101110000010 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_minstret[63 : 32];
      end
      12'b110010000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[63 : 32];
      end
      12'b001101000010 : begin
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_245_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_231_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_231_)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_311_) + $signed(_zz_312_));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_206_)begin
      if(_zz_232_)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_233_)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == (6'b100001));
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_316_);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_158_ = memory_DivPlugin_rs1[31 : 0];
  assign _zz_159_ = {memory_DivPlugin_accumulator[31 : 0],_zz_158_[31]};
  assign _zz_160_ = (_zz_159_ - _zz_317_);
  assign _zz_161_ = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_162_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_163_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_164_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_164_[31 : 0] = execute_RS1;
  end

  assign _zz_166_ = (_zz_165_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_166_ != (32'b00000000000000000000000000000000));
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_234_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusCachedPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_167_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_234_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusCachedPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusCachedPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_26_ = decode_SHIFT_CTRL;
  assign _zz_23_ = execute_SHIFT_CTRL;
  assign _zz_24_ = _zz_46_;
  assign _zz_34_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_33_ = execute_to_memory_SHIFT_CTRL;
  assign _zz_21_ = decode_ALU_CTRL;
  assign _zz_19_ = _zz_49_;
  assign _zz_38_ = decode_to_execute_ALU_CTRL;
  assign _zz_18_ = decode_ENV_CTRL;
  assign _zz_15_ = execute_ENV_CTRL;
  assign _zz_13_ = memory_ENV_CTRL;
  assign _zz_16_ = _zz_47_;
  assign _zz_28_ = decode_to_execute_ENV_CTRL;
  assign _zz_27_ = execute_to_memory_ENV_CTRL;
  assign _zz_29_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_11_ = decode_SRC1_CTRL;
  assign _zz_9_ = _zz_45_;
  assign _zz_37_ = decode_to_execute_SRC1_CTRL;
  assign _zz_8_ = decode_SRC2_CTRL;
  assign _zz_6_ = _zz_43_;
  assign _zz_36_ = decode_to_execute_SRC2_CTRL;
  assign _zz_5_ = decode_BRANCH_CTRL;
  assign _zz_51_ = _zz_44_;
  assign _zz_30_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_3_ = decode_ALU_BITWISE_CTRL;
  assign _zz_1_ = _zz_48_;
  assign _zz_39_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != (3'b000)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != (4'b0000)));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != (2'b00)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != (3'b000)));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != (1'b0)) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != (2'b00)));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != (1'b0)));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (*) begin
    IBusCachedPlugin_injectionPort_ready = 1'b0;
    case(_zz_169_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
      end
      3'b011 : begin
      end
      3'b100 : begin
        IBusCachedPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign iBusWishbone_ADR = {_zz_337_,_zz_170_};
  assign iBusWishbone_CTI = ((_zz_170_ == (3'b111)) ? (3'b111) : (3'b010));
  assign iBusWishbone_BTE = (2'b00);
  assign iBusWishbone_SEL = (4'b1111);
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    if(_zz_235_)begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWishbone_STB = 1'b0;
    if(_zz_235_)begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_171_;
  assign iBus_rsp_payload_data = iBusWishbone_DAT_MISO_regNext;
  assign iBus_rsp_payload_error = 1'b0;
  assign _zz_177_ = (dBus_cmd_payload_length != (3'b000));
  assign _zz_173_ = dBus_cmd_valid;
  assign _zz_175_ = dBus_cmd_payload_wr;
  assign _zz_176_ = (_zz_172_ == dBus_cmd_payload_length);
  assign dBus_cmd_ready = (_zz_174_ && (_zz_175_ || _zz_176_));
  assign dBusWishbone_ADR = ((_zz_177_ ? {{dBus_cmd_payload_address[31 : 5],_zz_172_},(2'b00)} : {dBus_cmd_payload_address[31 : 2],(2'b00)}) >>> 2);
  assign dBusWishbone_CTI = (_zz_177_ ? (_zz_176_ ? (3'b111) : (3'b010)) : (3'b000));
  assign dBusWishbone_BTE = (2'b00);
  assign dBusWishbone_SEL = (_zz_175_ ? dBus_cmd_payload_mask : (4'b1111));
  assign dBusWishbone_WE = _zz_175_;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_payload_data;
  assign _zz_174_ = (_zz_173_ && dBusWishbone_ACK);
  assign dBusWishbone_CYC = _zz_173_;
  assign dBusWishbone_STB = _zz_173_;
  assign dBus_rsp_valid = _zz_178_;
  assign dBus_rsp_payload_data = dBusWishbone_DAT_MISO_regNext;
  assign dBus_rsp_payload_error = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      IBusCachedPlugin_decodePc_pcReg <= externalResetVector;
      _zz_65_ <= 1'b0;
      IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      _zz_93_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_104_;
      IBusCachedPlugin_rspCounter <= (32'b00000000000000000000000000000000);
      dataCache_1__io_mem_cmd_s2mPipe_rValid <= 1'b0;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid <= 1'b0;
      DBusCachedPlugin_rspCounter <= _zz_105_;
      DBusCachedPlugin_rspCounter <= (32'b00000000000000000000000000000000);
      _zz_123_ <= 1'b1;
      _zz_135_ <= 1'b0;
      CsrPlugin_misa_base <= (2'b01);
      CsrPlugin_misa_extensions <= (26'b00000000000000000001000010);
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_lastStageWasWfi <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      memory_DivPlugin_div_counter_value <= (6'b000000);
      _zz_165_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_169_ <= (3'b000);
      memory_to_writeBack_REGFILE_WRITE_DATA <= (32'b00000000000000000000000000000000);
      memory_to_writeBack_INSTRUCTION <= (32'b00000000000000000000000000000000);
      _zz_170_ <= (3'b000);
      _zz_171_ <= 1'b0;
      _zz_172_ <= (3'b000);
      _zz_178_ <= 1'b0;
    end else begin
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if((IBusCachedPlugin_fetchPc_corrected || IBusCachedPlugin_fetchPc_pcRegPropagate))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetcherflushIt) || IBusCachedPlugin_fetchPc_pcRegPropagate)))begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if((decode_arbitration_isFiring && (! IBusCachedPlugin_decodePc_injectedDecode)))begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_decodePc_pcPlus;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt)))begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_jump_pcLoad_payload;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        _zz_65_ <= 1'b0;
      end
      if(_zz_63_)begin
        _zz_65_ <= IBusCachedPlugin_iBusRsp_stages_0_output_valid;
      end
      if((IBusCachedPlugin_decompressor_output_valid && IBusCachedPlugin_decompressor_output_ready))begin
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_219_)begin
        if(_zz_220_)begin
          IBusCachedPlugin_decompressor_bufferValid <= 1'b1;
        end else begin
          IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
        end
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if(IBusCachedPlugin_decompressor_output_ready)begin
        _zz_93_ <= IBusCachedPlugin_decompressor_output_valid;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        _zz_93_ <= 1'b0;
      end
      if((! 1'b0))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b1;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + (32'b00000000000000000000000000000001));
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        dataCache_1__io_mem_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_236_)begin
        dataCache_1__io_mem_cmd_s2mPipe_rValid <= dataCache_1__io_mem_cmd_valid;
      end
      if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
        dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rValid <= dataCache_1__io_mem_cmd_s2mPipe_valid;
      end
      if(dBus_rsp_valid)begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + (32'b00000000000000000000000000000001));
      end
      _zz_123_ <= 1'b0;
      _zz_135_ <= (_zz_41_ && writeBack_arbitration_isFiring);
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_237_)begin
        if(_zz_238_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_239_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_240_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_lastStageWasWfi <= (writeBack_arbitration_isFiring && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_215_)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_216_)begin
        case(_zz_218_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_155_,{_zz_154_,_zz_153_}} != (3'b000)) || CsrPlugin_thirdPartyWake);
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_32_;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if((((! IBusCachedPlugin_iBusRsp_output_ready) && (IBusCachedPlugin_decompressor_output_valid && IBusCachedPlugin_decompressor_output_ready)) && (! IBusCachedPlugin_fetcherflushIt)))begin
        IBusCachedPlugin_fetchPc_pcReg[1] <= 1'b1;
      end
      case(_zz_169_)
        3'b000 : begin
          if(IBusCachedPlugin_injectionPort_valid)begin
            _zz_169_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_169_ <= (3'b010);
        end
        3'b010 : begin
          _zz_169_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_169_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_169_ <= (3'b000);
        end
        default : begin
        end
      endcase
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_165_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_330_[0];
            CsrPlugin_mstatus_MIE <= _zz_331_[0];
          end
        end
        12'b111100010001 : begin
        end
        12'b111100010100 : begin
        end
        12'b001101000001 : begin
        end
        12'b101100000000 : begin
        end
        12'b101110000000 : begin
        end
        12'b001101000100 : begin
        end
        12'b001100000101 : begin
        end
        12'b110011000000 : begin
        end
        12'b101100000010 : begin
        end
        12'b111100010011 : begin
        end
        12'b001101000011 : begin
        end
        12'b111111000000 : begin
        end
        12'b110000000000 : begin
        end
        12'b001100000001 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_misa_base <= execute_CsrPlugin_writeData[31 : 30];
            CsrPlugin_misa_extensions <= execute_CsrPlugin_writeData[25 : 0];
          end
        end
        12'b001101000000 : begin
        end
        12'b111100010010 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_333_[0];
            CsrPlugin_mie_MTIE <= _zz_334_[0];
            CsrPlugin_mie_MSIE <= _zz_335_[0];
          end
        end
        12'b101110000010 : begin
        end
        12'b110010000000 : begin
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(_zz_235_)begin
        if(iBusWishbone_ACK)begin
          _zz_170_ <= (_zz_170_ + (3'b001));
        end
      end
      _zz_171_ <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if((_zz_173_ && _zz_174_))begin
        _zz_172_ <= (_zz_172_ + (3'b001));
        if(_zz_176_)begin
          _zz_172_ <= (3'b000);
        end
      end
      _zz_178_ <= ((_zz_173_ && (! dBusWishbone_WE)) && dBusWishbone_ACK);
    end
  end

  always @ (posedge clk) begin
    if(_zz_219_)begin
      IBusCachedPlugin_decompressor_bufferData <= IBusCachedPlugin_iBusRsp_output_payload_rsp_inst[31 : 16];
    end
    if(IBusCachedPlugin_decompressor_output_ready)begin
      _zz_94_ <= IBusCachedPlugin_decompressor_output_payload_pc;
      _zz_95_ <= IBusCachedPlugin_decompressor_output_payload_rsp_error;
      _zz_96_ <= IBusCachedPlugin_decompressor_output_payload_rsp_inst;
      _zz_97_ <= IBusCachedPlugin_decompressor_output_payload_isRvc;
    end
    if(IBusCachedPlugin_injector_decodeInput_ready)begin
      IBusCachedPlugin_injector_formal_rawInDecode <= IBusCachedPlugin_decompressor_raw;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(_zz_236_)begin
      dataCache_1__io_mem_cmd_s2mPipe_rData_wr <= dataCache_1__io_mem_cmd_payload_wr;
      dataCache_1__io_mem_cmd_s2mPipe_rData_address <= dataCache_1__io_mem_cmd_payload_address;
      dataCache_1__io_mem_cmd_s2mPipe_rData_data <= dataCache_1__io_mem_cmd_payload_data;
      dataCache_1__io_mem_cmd_s2mPipe_rData_mask <= dataCache_1__io_mem_cmd_payload_mask;
      dataCache_1__io_mem_cmd_s2mPipe_rData_length <= dataCache_1__io_mem_cmd_payload_length;
      dataCache_1__io_mem_cmd_s2mPipe_rData_last <= dataCache_1__io_mem_cmd_payload_last;
    end
    if(dataCache_1__io_mem_cmd_s2mPipe_ready)begin
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_wr <= dataCache_1__io_mem_cmd_s2mPipe_payload_wr;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_address <= dataCache_1__io_mem_cmd_s2mPipe_payload_address;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_data <= dataCache_1__io_mem_cmd_s2mPipe_payload_data;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_mask <= dataCache_1__io_mem_cmd_s2mPipe_payload_mask;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_length <= dataCache_1__io_mem_cmd_s2mPipe_payload_length;
      dataCache_1__io_mem_cmd_s2mPipe_m2sPipe_rData_last <= dataCache_1__io_mem_cmd_s2mPipe_payload_last;
    end
    _zz_136_ <= _zz_40_[11 : 7];
    _zz_137_ <= _zz_50_;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(_zz_211_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_157_ ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_157_ ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(_zz_237_)begin
      if(_zz_238_)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_239_)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_240_)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_215_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if((memory_DivPlugin_div_counter_value == (6'b100000)))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_206_)begin
      if(_zz_232_)begin
        memory_DivPlugin_rs1[31 : 0] <= _zz_318_[31:0];
        memory_DivPlugin_accumulator[31 : 0] <= ((! _zz_160_[32]) ? _zz_319_ : _zz_320_);
        if((memory_DivPlugin_div_counter_value == (6'b100000)))begin
          memory_DivPlugin_div_result <= _zz_321_[31:0];
        end
      end
    end
    if(_zz_233_)begin
      memory_DivPlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_DivPlugin_rs1 <= ((_zz_163_ ? (~ _zz_164_) : _zz_164_) + _zz_327_);
      memory_DivPlugin_rs2 <= ((_zz_162_ ? (~ execute_RS2) : execute_RS2) + _zz_329_);
      memory_DivPlugin_div_needRevert <= ((_zz_163_ ^ (_zz_162_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_35_;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_25_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_22_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_31_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_20_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_53_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_52_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_17_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_14_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_12_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_10_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_7_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_4_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_2_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((_zz_169_ != (3'b000)))begin
      _zz_96_ <= IBusCachedPlugin_injectionPort_payload;
    end
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
      end
      12'b001100000000 : begin
      end
      12'b111100010001 : begin
      end
      12'b111100010100 : begin
      end
      12'b001101000001 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b101100000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mcycle[31 : 0] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b101110000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mcycle[63 : 32] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001101000100 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= _zz_332_[0];
        end
      end
      12'b001100000101 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
      12'b110011000000 : begin
      end
      12'b101100000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_minstret[31 : 0] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b111100010011 : begin
      end
      12'b001101000011 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtval <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b111111000000 : begin
      end
      12'b110000000000 : begin
      end
      12'b001100000001 : begin
      end
      12'b001101000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b111100010010 : begin
      end
      12'b001100000100 : begin
      end
      12'b101110000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_minstret[63 : 32] <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b110010000000 : begin
      end
      12'b001101000010 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mcause_interrupt <= _zz_336_[0];
          CsrPlugin_mcause_exceptionCode <= execute_CsrPlugin_writeData[3 : 0];
        end
      end
      default : begin
      end
    endcase
    iBusWishbone_DAT_MISO_regNext <= iBusWishbone_DAT_MISO;
    dBusWishbone_DAT_MISO_regNext <= dBusWishbone_DAT_MISO;
  end

  always @ (posedge clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000)) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_50_;
    end
    _zz_167_ <= debug_bus_cmd_payload_address[2];
    if(_zz_213_)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge clk) begin
    if(debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      _zz_168_ <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_234_)
          6'b000000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
            end
          end
          6'b000001 : begin
          end
          default : begin
          end
        endcase
      end
      if(_zz_213_)begin
        if(_zz_214_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_217_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_168_ <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
  end

endmodule

