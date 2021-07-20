// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : VexRiscv
// Git hash  : 301554ed50130998df7c9b3fa2a900ddbefe2027


`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

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


module VexRiscv (
  input      [31:0]   externalResetVector,
  input               timerInterrupt,
  input               softwareInterrupt,
  input      [31:0]   externalInterruptArray,
  output reg          iBusWishbone_CYC,
  output reg          iBusWishbone_STB,
  input               iBusWishbone_ACK,
  output              iBusWishbone_WE,
  output     [29:0]   iBusWishbone_ADR,
  input      [31:0]   iBusWishbone_DAT_MISO,
  output     [31:0]   iBusWishbone_DAT_MOSI,
  output     [3:0]    iBusWishbone_SEL,
  input               iBusWishbone_ERR,
  output     [2:0]    iBusWishbone_CTI,
  output     [1:0]    iBusWishbone_BTE,
  output              dBusWishbone_CYC,
  output              dBusWishbone_STB,
  input               dBusWishbone_ACK,
  output              dBusWishbone_WE,
  output     [29:0]   dBusWishbone_ADR,
  input      [31:0]   dBusWishbone_DAT_MISO,
  output     [31:0]   dBusWishbone_DAT_MOSI,
  output reg [3:0]    dBusWishbone_SEL,
  input               dBusWishbone_ERR,
  output     [2:0]    dBusWishbone_CTI,
  output     [1:0]    dBusWishbone_BTE,
  input               clk,
  input               reset
);
  wire                _zz_119;
  wire                _zz_120;
  wire                _zz_121;
  wire                _zz_122;
  wire                _zz_123;
  wire                _zz_124;
  wire                _zz_125;
  wire                _zz_126;
  reg                 _zz_127;
  reg        [31:0]   _zz_128;
  reg        [31:0]   _zz_129;
  reg        [31:0]   _zz_130;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                _zz_131;
  wire                _zz_132;
  wire                _zz_133;
  wire                _zz_134;
  wire                _zz_135;
  wire                _zz_136;
  wire                _zz_137;
  wire                _zz_138;
  wire                _zz_139;
  wire       [1:0]    _zz_140;
  wire                _zz_141;
  wire                _zz_142;
  wire                _zz_143;
  wire                _zz_144;
  wire                _zz_145;
  wire                _zz_146;
  wire                _zz_147;
  wire                _zz_148;
  wire                _zz_149;
  wire                _zz_150;
  wire                _zz_151;
  wire                _zz_152;
  wire       [1:0]    _zz_153;
  wire                _zz_154;
  wire       [0:0]    _zz_155;
  wire       [0:0]    _zz_156;
  wire       [0:0]    _zz_157;
  wire       [0:0]    _zz_158;
  wire       [0:0]    _zz_159;
  wire       [0:0]    _zz_160;
  wire       [0:0]    _zz_161;
  wire       [0:0]    _zz_162;
  wire       [0:0]    _zz_163;
  wire       [0:0]    _zz_164;
  wire       [0:0]    _zz_165;
  wire       [0:0]    _zz_166;
  wire       [0:0]    _zz_167;
  wire       [2:0]    _zz_168;
  wire       [2:0]    _zz_169;
  wire       [31:0]   _zz_170;
  wire       [0:0]    _zz_171;
  wire       [2:0]    _zz_172;
  wire       [4:0]    _zz_173;
  wire       [11:0]   _zz_174;
  wire       [11:0]   _zz_175;
  wire       [31:0]   _zz_176;
  wire       [31:0]   _zz_177;
  wire       [31:0]   _zz_178;
  wire       [31:0]   _zz_179;
  wire       [31:0]   _zz_180;
  wire       [31:0]   _zz_181;
  wire       [31:0]   _zz_182;
  wire       [31:0]   _zz_183;
  wire       [32:0]   _zz_184;
  wire       [19:0]   _zz_185;
  wire       [11:0]   _zz_186;
  wire       [11:0]   _zz_187;
  wire       [1:0]    _zz_188;
  wire       [1:0]    _zz_189;
  wire       [0:0]    _zz_190;
  wire       [5:0]    _zz_191;
  wire       [33:0]   _zz_192;
  wire       [32:0]   _zz_193;
  wire       [33:0]   _zz_194;
  wire       [32:0]   _zz_195;
  wire       [33:0]   _zz_196;
  wire       [32:0]   _zz_197;
  wire       [0:0]    _zz_198;
  wire       [32:0]   _zz_199;
  wire       [0:0]    _zz_200;
  wire       [31:0]   _zz_201;
  wire       [0:0]    _zz_202;
  wire       [0:0]    _zz_203;
  wire       [0:0]    _zz_204;
  wire       [0:0]    _zz_205;
  wire       [0:0]    _zz_206;
  wire       [0:0]    _zz_207;
  wire       [26:0]   _zz_208;
  wire                _zz_209;
  wire                _zz_210;
  wire       [1:0]    _zz_211;
  wire       [31:0]   _zz_212;
  wire       [31:0]   _zz_213;
  wire       [31:0]   _zz_214;
  wire                _zz_215;
  wire       [0:0]    _zz_216;
  wire       [13:0]   _zz_217;
  wire       [31:0]   _zz_218;
  wire       [31:0]   _zz_219;
  wire       [31:0]   _zz_220;
  wire                _zz_221;
  wire       [0:0]    _zz_222;
  wire       [7:0]    _zz_223;
  wire       [31:0]   _zz_224;
  wire       [31:0]   _zz_225;
  wire       [31:0]   _zz_226;
  wire                _zz_227;
  wire       [0:0]    _zz_228;
  wire       [1:0]    _zz_229;
  wire                _zz_230;
  wire       [0:0]    _zz_231;
  wire       [0:0]    _zz_232;
  wire                _zz_233;
  wire       [0:0]    _zz_234;
  wire       [23:0]   _zz_235;
  wire       [31:0]   _zz_236;
  wire                _zz_237;
  wire                _zz_238;
  wire       [0:0]    _zz_239;
  wire       [0:0]    _zz_240;
  wire       [0:0]    _zz_241;
  wire       [0:0]    _zz_242;
  wire                _zz_243;
  wire       [0:0]    _zz_244;
  wire       [19:0]   _zz_245;
  wire       [31:0]   _zz_246;
  wire       [31:0]   _zz_247;
  wire                _zz_248;
  wire                _zz_249;
  wire                _zz_250;
  wire       [2:0]    _zz_251;
  wire       [2:0]    _zz_252;
  wire                _zz_253;
  wire       [0:0]    _zz_254;
  wire       [16:0]   _zz_255;
  wire       [31:0]   _zz_256;
  wire       [31:0]   _zz_257;
  wire                _zz_258;
  wire                _zz_259;
  wire                _zz_260;
  wire       [0:0]    _zz_261;
  wire       [0:0]    _zz_262;
  wire                _zz_263;
  wire       [0:0]    _zz_264;
  wire       [0:0]    _zz_265;
  wire                _zz_266;
  wire       [0:0]    _zz_267;
  wire       [13:0]   _zz_268;
  wire       [31:0]   _zz_269;
  wire       [31:0]   _zz_270;
  wire                _zz_271;
  wire                _zz_272;
  wire       [0:0]    _zz_273;
  wire       [0:0]    _zz_274;
  wire       [0:0]    _zz_275;
  wire       [0:0]    _zz_276;
  wire                _zz_277;
  wire       [0:0]    _zz_278;
  wire       [10:0]   _zz_279;
  wire       [31:0]   _zz_280;
  wire       [31:0]   _zz_281;
  wire                _zz_282;
  wire                _zz_283;
  wire                _zz_284;
  wire       [0:0]    _zz_285;
  wire       [0:0]    _zz_286;
  wire                _zz_287;
  wire       [0:0]    _zz_288;
  wire       [7:0]    _zz_289;
  wire       [0:0]    _zz_290;
  wire       [3:0]    _zz_291;
  wire       [0:0]    _zz_292;
  wire       [0:0]    _zz_293;
  wire       [1:0]    _zz_294;
  wire       [1:0]    _zz_295;
  wire                _zz_296;
  wire       [0:0]    _zz_297;
  wire       [3:0]    _zz_298;
  wire       [31:0]   _zz_299;
  wire       [31:0]   _zz_300;
  wire       [31:0]   _zz_301;
  wire       [0:0]    _zz_302;
  wire       [0:0]    _zz_303;
  wire       [31:0]   _zz_304;
  wire       [31:0]   _zz_305;
  wire       [31:0]   _zz_306;
  wire                _zz_307;
  wire       [0:0]    _zz_308;
  wire       [1:0]    _zz_309;
  wire                _zz_310;
  wire       [2:0]    _zz_311;
  wire       [2:0]    _zz_312;
  wire                _zz_313;
  wire       [0:0]    _zz_314;
  wire       [0:0]    _zz_315;
  wire       [31:0]   _zz_316;
  wire       [31:0]   _zz_317;
  wire       [31:0]   _zz_318;
  wire       [31:0]   _zz_319;
  wire       [31:0]   _zz_320;
  wire       [31:0]   _zz_321;
  wire       [31:0]   _zz_322;
  wire                _zz_323;
  wire       [31:0]   _zz_324;
  wire                _zz_325;
  wire       [0:0]    _zz_326;
  wire       [0:0]    _zz_327;
  wire       [0:0]    _zz_328;
  wire       [0:0]    _zz_329;
  wire       [1:0]    _zz_330;
  wire       [1:0]    _zz_331;
  wire       [0:0]    _zz_332;
  wire       [0:0]    _zz_333;
  wire       [31:0]   _zz_334;
  wire       [31:0]   _zz_335;
  wire       [31:0]   _zz_336;
  wire       [31:0]   _zz_337;
  wire       [31:0]   _zz_338;
  wire       [31:0]   _zz_339;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [31:0]   decode_RS2;
  wire       [31:0]   decode_RS1;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_MUL;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_1;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_2;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_3;
  wire                decode_IS_CSR;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_4;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_5;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_6;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_7;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_8;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_9;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_12;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_13;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_14;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_15;
  wire                decode_MEMORY_STORE;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_RS2_SIGNED;
  wire                execute_IS_MUL;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_16;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_17;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_18;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_19;
  wire       [31:0]   _zz_20;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_21;
  wire       [31:0]   _zz_22;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_23;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_24;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_25;
  wire       [31:0]   _zz_26;
  wire                _zz_27;
  reg                 _zz_28;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_29;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_30;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_31;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_32;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_33;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_34;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_35;
  reg        [31:0]   _zz_36;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire       [31:0]   execute_MEMORY_READ_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire                execute_MMU_FAULT;
  wire       [31:0]   execute_MMU_RSP2_physicalAddress;
  wire                execute_MMU_RSP2_isIoAccess;
  wire                execute_MMU_RSP2_isPaging;
  wire                execute_MMU_RSP2_allowRead;
  wire                execute_MMU_RSP2_allowWrite;
  wire                execute_MMU_RSP2_allowExecute;
  wire                execute_MMU_RSP2_exception;
  wire                execute_MMU_RSP2_refilling;
  wire                execute_MMU_RSP2_bypassTranslation;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   decode_PC;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  wire                decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusCachedPlugin_fetcherHalt;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_isPaging;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  reg                 DBusSimplePlugin_memoryExceptionPort_valid;
  reg        [3:0]    DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire                DBusSimplePlugin_mmuBus_cmd_0_isValid;
  wire                DBusSimplePlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusSimplePlugin_mmuBus_cmd_0_virtualAddress;
  wire                DBusSimplePlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   DBusSimplePlugin_mmuBus_rsp_physicalAddress;
  wire                DBusSimplePlugin_mmuBus_rsp_isIoAccess;
  wire                DBusSimplePlugin_mmuBus_rsp_isPaging;
  wire                DBusSimplePlugin_mmuBus_rsp_allowRead;
  wire                DBusSimplePlugin_mmuBus_rsp_allowWrite;
  wire                DBusSimplePlugin_mmuBus_rsp_allowExecute;
  wire                DBusSimplePlugin_mmuBus_rsp_exception;
  wire                DBusSimplePlugin_mmuBus_rsp_refilling;
  wire                DBusSimplePlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusSimplePlugin_mmuBus_end;
  wire                DBusSimplePlugin_mmuBus_busy;
  reg                 DBusSimplePlugin_redoBranch_valid;
  wire       [31:0]   DBusSimplePlugin_redoBranch_payload;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                externalInterrupt;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_37;
  wire       [2:0]    _zz_38;
  wire                _zz_39;
  wire                _zz_40;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                _zz_41;
  wire                _zz_42;
  wire                _zz_43;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_44;
  wire                _zz_45;
  reg                 _zz_46;
  wire                _zz_47;
  reg                 _zz_48;
  reg        [31:0]   _zz_49;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_50;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [1:0]    dBus_cmd_payload_size;
  wire                dBus_rsp_ready;
  wire                dBus_rsp_error;
  wire       [31:0]   dBus_rsp_data;
  reg                 _zz_51;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_52;
  reg        [3:0]    _zz_53;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   execute_DBusSimplePlugin_rspShifted;
  wire                _zz_54;
  reg        [31:0]   _zz_55;
  wire                _zz_56;
  reg        [31:0]   _zz_57;
  reg        [31:0]   execute_DBusSimplePlugin_rspFormated;
  wire       [29:0]   _zz_58;
  wire                _zz_59;
  wire                _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                _zz_64;
  wire                _zz_65;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_66;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_67;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_68;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_69;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_70;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_71;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_72;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_73;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_74;
  reg        [31:0]   _zz_75;
  wire                _zz_76;
  reg        [19:0]   _zz_77;
  wire                _zz_78;
  reg        [19:0]   _zz_79;
  reg        [31:0]   _zz_80;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  reg        [31:0]   execute_LightShifterPlugin_shiftReg;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  reg        [31:0]   _zz_81;
  reg                 _zz_82;
  reg                 _zz_83;
  reg                 _zz_84;
  reg        [4:0]    _zz_85;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_86;
  reg                 _zz_87;
  reg                 _zz_88;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_89;
  reg        [10:0]   _zz_90;
  wire                _zz_91;
  reg        [19:0]   _zz_92;
  wire                _zz_93;
  reg        [18:0]   _zz_94;
  reg        [31:0]   _zz_95;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_96;
  wire                _zz_97;
  wire                _zz_98;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_99;
  wire                _zz_100;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg        [32:0]   execute_MulDivIterativePlugin_rs1;
  reg        [31:0]   execute_MulDivIterativePlugin_rs2;
  reg        [64:0]   execute_MulDivIterativePlugin_accumulator;
  reg                 execute_MulDivIterativePlugin_frontendOk;
  reg                 execute_MulDivIterativePlugin_mul_counter_willIncrement;
  reg                 execute_MulDivIterativePlugin_mul_counter_willClear;
  reg        [5:0]    execute_MulDivIterativePlugin_mul_counter_valueNext;
  reg        [5:0]    execute_MulDivIterativePlugin_mul_counter_value;
  wire                execute_MulDivIterativePlugin_mul_counter_willOverflowIfInc;
  wire                execute_MulDivIterativePlugin_mul_counter_willOverflow;
  wire                _zz_101;
  wire                _zz_102;
  reg        [32:0]   _zz_103;
  reg        [31:0]   externalInterruptArray_regNext;
  reg        [31:0]   _zz_104;
  wire       [31:0]   _zz_105;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_MEMORY_STORE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg        [31:0]   decode_to_execute_SRC1;
  reg        [31:0]   decode_to_execute_SRC2;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg                 execute_CsrPlugin_csr_2816;
  reg                 execute_CsrPlugin_csr_2944;
  reg                 execute_CsrPlugin_csr_3008;
  reg                 execute_CsrPlugin_csr_4032;
  reg        [31:0]   _zz_106;
  reg        [31:0]   _zz_107;
  reg        [31:0]   _zz_108;
  reg        [31:0]   _zz_109;
  reg        [31:0]   _zz_110;
  reg        [31:0]   _zz_111;
  reg        [31:0]   _zz_112;
  reg        [31:0]   _zz_113;
  reg        [31:0]   _zz_114;
  reg        [31:0]   _zz_115;
  reg        [2:0]    _zz_116;
  reg                 _zz_117;
  reg        [31:0]   iBusWishbone_DAT_MISO_regNext;
  wire                dBus_cmd_halfPipe_valid;
  wire                dBus_cmd_halfPipe_ready;
  wire                dBus_cmd_halfPipe_payload_wr;
  wire       [31:0]   dBus_cmd_halfPipe_payload_address;
  wire       [31:0]   dBus_cmd_halfPipe_payload_data;
  wire       [1:0]    dBus_cmd_halfPipe_payload_size;
  reg                 dBus_cmd_halfPipe_regs_valid;
  reg                 dBus_cmd_halfPipe_regs_ready;
  reg                 dBus_cmd_halfPipe_regs_payload_wr;
  reg        [31:0]   dBus_cmd_halfPipe_regs_payload_address;
  reg        [31:0]   dBus_cmd_halfPipe_regs_payload_data;
  reg        [1:0]    dBus_cmd_halfPipe_regs_payload_size;
  reg        [3:0]    _zz_118;
  `ifndef SYNTHESIS
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_1_string;
  reg [39:0] _zz_2_string;
  reg [39:0] _zz_3_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_4_string;
  reg [31:0] _zz_5_string;
  reg [31:0] _zz_6_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_7_string;
  reg [71:0] _zz_8_string;
  reg [71:0] _zz_9_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_10_string;
  reg [39:0] _zz_11_string;
  reg [39:0] _zz_12_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_13_string;
  reg [63:0] _zz_14_string;
  reg [63:0] _zz_15_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_16_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_17_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_18_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_21_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_23_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_24_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_25_string;
  reg [39:0] _zz_29_string;
  reg [31:0] _zz_30_string;
  reg [71:0] _zz_31_string;
  reg [39:0] _zz_32_string;
  reg [63:0] _zz_33_string;
  reg [23:0] _zz_34_string;
  reg [95:0] _zz_35_string;
  reg [95:0] _zz_66_string;
  reg [23:0] _zz_67_string;
  reg [63:0] _zz_68_string;
  reg [39:0] _zz_69_string;
  reg [71:0] _zz_70_string;
  reg [31:0] _zz_71_string;
  reg [39:0] _zz_72_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  `endif

  (* ram_style = "block" *) reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_131 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  assign _zz_132 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_133 = (execute_arbitration_isValid && execute_IS_MUL);
  assign _zz_134 = ((_zz_124 && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign _zz_135 = ((_zz_124 && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_136 = (execute_MulDivIterativePlugin_frontendOk && (! execute_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign _zz_137 = ({CsrPlugin_selfException_valid,DBusSimplePlugin_memoryExceptionPort_valid} != 2'b00);
  assign _zz_138 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_139 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_140 = execute_INSTRUCTION[29 : 28];
  assign _zz_141 = (! ((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (1'b0 || (! execute_arbitration_isStuckByOthers))));
  assign _zz_142 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_143 = (1'b1 || (! 1'b1));
  assign _zz_144 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_145 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_146 = (iBus_cmd_valid || (_zz_116 != 3'b000));
  assign _zz_147 = (! execute_arbitration_isStuckByOthers);
  assign _zz_148 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_149 = ((_zz_96 && 1'b1) && (! 1'b0));
  assign _zz_150 = ((_zz_97 && 1'b1) && (! 1'b0));
  assign _zz_151 = ((_zz_98 && 1'b1) && (! 1'b0));
  assign _zz_152 = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_153 = execute_INSTRUCTION[13 : 12];
  assign _zz_154 = execute_INSTRUCTION[13];
  assign _zz_155 = _zz_58[29 : 29];
  assign _zz_156 = _zz_58[28 : 28];
  assign _zz_157 = _zz_58[27 : 27];
  assign _zz_158 = _zz_58[24 : 24];
  assign _zz_159 = _zz_58[15 : 15];
  assign _zz_160 = _zz_58[11 : 11];
  assign _zz_161 = _zz_58[12 : 12];
  assign _zz_162 = _zz_58[5 : 5];
  assign _zz_163 = _zz_58[3 : 3];
  assign _zz_164 = _zz_58[18 : 18];
  assign _zz_165 = _zz_58[8 : 8];
  assign _zz_166 = _zz_58[4 : 4];
  assign _zz_167 = _zz_58[0 : 0];
  assign _zz_168 = (_zz_37 - 3'b001);
  assign _zz_169 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_170 = {29'd0, _zz_169};
  assign _zz_171 = execute_SRC_LESS;
  assign _zz_172 = 3'b100;
  assign _zz_173 = decode_INSTRUCTION[19 : 15];
  assign _zz_174 = decode_INSTRUCTION[31 : 20];
  assign _zz_175 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_176 = ($signed(_zz_177) + $signed(_zz_180));
  assign _zz_177 = ($signed(_zz_178) + $signed(_zz_179));
  assign _zz_178 = execute_SRC1;
  assign _zz_179 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_180 = (execute_SRC_USE_SUB_LESS ? _zz_181 : _zz_182);
  assign _zz_181 = 32'h00000001;
  assign _zz_182 = 32'h0;
  assign _zz_183 = (_zz_184 >>> 1);
  assign _zz_184 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_185 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_186 = execute_INSTRUCTION[31 : 20];
  assign _zz_187 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_188 = (_zz_99 & (~ _zz_189));
  assign _zz_189 = (_zz_99 - 2'b01);
  assign _zz_190 = execute_MulDivIterativePlugin_mul_counter_willIncrement;
  assign _zz_191 = {5'd0, _zz_190};
  assign _zz_192 = (_zz_194 + _zz_196);
  assign _zz_193 = (execute_MulDivIterativePlugin_rs2[0] ? execute_MulDivIterativePlugin_rs1 : 33'h0);
  assign _zz_194 = {{1{_zz_193[32]}}, _zz_193};
  assign _zz_195 = _zz_197;
  assign _zz_196 = {{1{_zz_195[32]}}, _zz_195};
  assign _zz_197 = (execute_MulDivIterativePlugin_accumulator >>> 32);
  assign _zz_198 = _zz_102;
  assign _zz_199 = {32'd0, _zz_198};
  assign _zz_200 = _zz_101;
  assign _zz_201 = {31'd0, _zz_200};
  assign _zz_202 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_203 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_204 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_205 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_206 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_207 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_208 = (iBus_cmd_payload_address >>> 5);
  assign _zz_209 = 1'b1;
  assign _zz_210 = 1'b1;
  assign _zz_211 = {_zz_40,_zz_39};
  assign _zz_212 = 32'h0000107f;
  assign _zz_213 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_214 = 32'h00002073;
  assign _zz_215 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_216 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_217 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_218) == 32'h00000003),{(_zz_219 == _zz_220),{_zz_221,{_zz_222,_zz_223}}}}}};
  assign _zz_218 = 32'h0000505f;
  assign _zz_219 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_220 = 32'h00000063;
  assign _zz_221 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_222 = ((decode_INSTRUCTION & 32'hfc00407f) == 32'h00000033);
  assign _zz_223 = {((decode_INSTRUCTION & 32'hfe00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & _zz_224) == 32'h00001013),{(_zz_225 == _zz_226),{_zz_227,{_zz_228,_zz_229}}}}}};
  assign _zz_224 = 32'hfc00705f;
  assign _zz_225 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_226 = 32'h00005033;
  assign _zz_227 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_228 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_229 = {((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073),((decode_INSTRUCTION & 32'hffffffff) == 32'h00000073)};
  assign _zz_230 = ((decode_INSTRUCTION & 32'h02000074) == 32'h02000030);
  assign _zz_231 = ((decode_INSTRUCTION & 32'h10003050) == 32'h00000050);
  assign _zz_232 = 1'b0;
  assign _zz_233 = (((decode_INSTRUCTION & _zz_236) == 32'h10000050) != 1'b0);
  assign _zz_234 = ({_zz_237,_zz_238} != 2'b00);
  assign _zz_235 = {({_zz_239,_zz_240} != 2'b00),{(_zz_241 != _zz_242),{_zz_243,{_zz_244,_zz_245}}}};
  assign _zz_236 = 32'h10403050;
  assign _zz_237 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_238 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_239 = _zz_63;
  assign _zz_240 = ((decode_INSTRUCTION & _zz_246) == 32'h00000004);
  assign _zz_241 = ((decode_INSTRUCTION & _zz_247) == 32'h00000040);
  assign _zz_242 = 1'b0;
  assign _zz_243 = ({_zz_248,_zz_249} != 2'b00);
  assign _zz_244 = (_zz_250 != 1'b0);
  assign _zz_245 = {(_zz_251 != _zz_252),{_zz_253,{_zz_254,_zz_255}}};
  assign _zz_246 = 32'h0000001c;
  assign _zz_247 = 32'h00000058;
  assign _zz_248 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz_249 = ((decode_INSTRUCTION & 32'h00403040) == 32'h00000040);
  assign _zz_250 = ((decode_INSTRUCTION & 32'h00007054) == 32'h00005010);
  assign _zz_251 = {(_zz_256 == _zz_257),{_zz_258,_zz_259}};
  assign _zz_252 = 3'b000;
  assign _zz_253 = ({_zz_260,{_zz_261,_zz_262}} != 3'b000);
  assign _zz_254 = (_zz_263 != 1'b0);
  assign _zz_255 = {(_zz_264 != _zz_265),{_zz_266,{_zz_267,_zz_268}}};
  assign _zz_256 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_257 = 32'h40001010;
  assign _zz_258 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00001010);
  assign _zz_259 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz_260 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz_261 = ((decode_INSTRUCTION & _zz_269) == 32'h00001010);
  assign _zz_262 = ((decode_INSTRUCTION & _zz_270) == 32'h00001010);
  assign _zz_263 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_264 = _zz_64;
  assign _zz_265 = 1'b0;
  assign _zz_266 = ({_zz_271,_zz_272} != 2'b00);
  assign _zz_267 = ({_zz_273,_zz_274} != 2'b00);
  assign _zz_268 = {(_zz_275 != _zz_276),{_zz_277,{_zz_278,_zz_279}}};
  assign _zz_269 = 32'h00003034;
  assign _zz_270 = 32'h02003054;
  assign _zz_271 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz_272 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz_273 = ((decode_INSTRUCTION & _zz_280) == 32'h00006000);
  assign _zz_274 = ((decode_INSTRUCTION & _zz_281) == 32'h00004000);
  assign _zz_275 = _zz_60;
  assign _zz_276 = 1'b0;
  assign _zz_277 = ({_zz_282,_zz_283} != 2'b00);
  assign _zz_278 = (_zz_284 != 1'b0);
  assign _zz_279 = {(_zz_285 != _zz_286),{_zz_287,{_zz_288,_zz_289}}};
  assign _zz_280 = 32'h00006004;
  assign _zz_281 = 32'h00005004;
  assign _zz_282 = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz_283 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz_284 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_285 = ((decode_INSTRUCTION & 32'h00000010) == 32'h00000010);
  assign _zz_286 = 1'b0;
  assign _zz_287 = (_zz_62 != 1'b0);
  assign _zz_288 = ({_zz_63,{_zz_290,_zz_291}} != 6'h0);
  assign _zz_289 = {({_zz_292,_zz_293} != 2'b00),{(_zz_294 != _zz_295),{_zz_296,{_zz_297,_zz_298}}}};
  assign _zz_290 = ((decode_INSTRUCTION & _zz_299) == 32'h00001010);
  assign _zz_291 = {(_zz_300 == _zz_301),{_zz_62,{_zz_302,_zz_303}}};
  assign _zz_292 = _zz_61;
  assign _zz_293 = ((decode_INSTRUCTION & _zz_304) == 32'h00000020);
  assign _zz_294 = {_zz_61,(_zz_305 == _zz_306)};
  assign _zz_295 = 2'b00;
  assign _zz_296 = ({_zz_307,{_zz_308,_zz_309}} != 4'b0000);
  assign _zz_297 = (_zz_310 != 1'b0);
  assign _zz_298 = {(_zz_311 != _zz_312),{_zz_313,{_zz_314,_zz_315}}};
  assign _zz_299 = 32'h00001010;
  assign _zz_300 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_301 = 32'h00002010;
  assign _zz_302 = (_zz_316 == _zz_317);
  assign _zz_303 = (_zz_318 == _zz_319);
  assign _zz_304 = 32'h00000070;
  assign _zz_305 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_306 = 32'h0;
  assign _zz_307 = ((decode_INSTRUCTION & _zz_320) == 32'h0);
  assign _zz_308 = (_zz_321 == _zz_322);
  assign _zz_309 = {_zz_60,_zz_323};
  assign _zz_310 = ((decode_INSTRUCTION & _zz_324) == 32'h0);
  assign _zz_311 = {_zz_325,{_zz_326,_zz_327}};
  assign _zz_312 = 3'b000;
  assign _zz_313 = ({_zz_328,_zz_329} != 2'b00);
  assign _zz_314 = (_zz_330 != _zz_331);
  assign _zz_315 = (_zz_332 != _zz_333);
  assign _zz_316 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz_317 = 32'h00000004;
  assign _zz_318 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_319 = 32'h0;
  assign _zz_320 = 32'h00000044;
  assign _zz_321 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz_322 = 32'h0;
  assign _zz_323 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz_324 = 32'h00000058;
  assign _zz_325 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz_326 = ((decode_INSTRUCTION & _zz_334) == 32'h00002010);
  assign _zz_327 = ((decode_INSTRUCTION & _zz_335) == 32'h40000030);
  assign _zz_328 = ((decode_INSTRUCTION & _zz_336) == 32'h00000004);
  assign _zz_329 = _zz_59;
  assign _zz_330 = {(_zz_337 == _zz_338),_zz_59};
  assign _zz_331 = 2'b00;
  assign _zz_332 = ((decode_INSTRUCTION & _zz_339) == 32'h00001008);
  assign _zz_333 = 1'b0;
  assign _zz_334 = 32'h00002014;
  assign _zz_335 = 32'h40004034;
  assign _zz_336 = 32'h00000014;
  assign _zz_337 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_338 = 32'h00000004;
  assign _zz_339 = 32'h00001048;
  always @ (posedge clk) begin
    if(_zz_209) begin
      _zz_128 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_210) begin
      _zz_129 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_28) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (_zz_119                                                     ), //i
    .io_cpu_prefetch_isValid                  (_zz_120                                                     ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt               ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]       ), //i
    .io_cpu_fetch_isValid                     (_zz_121                                                     ), //i
    .io_cpu_fetch_isStuck                     (_zz_122                                                     ), //i
    .io_cpu_fetch_isRemoved                   (_zz_123                                                     ), //i
    .io_cpu_fetch_pc                          (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]       ), //i
    .io_cpu_fetch_data                        (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]              ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                      ), //i
    .io_cpu_fetch_mmuRsp_isPaging             (IBusCachedPlugin_mmuBus_rsp_isPaging                        ), //i
    .io_cpu_fetch_mmuRsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                       ), //i
    .io_cpu_fetch_mmuRsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                      ), //i
    .io_cpu_fetch_mmuRsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute                    ), //i
    .io_cpu_fetch_mmuRsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                       ), //i
    .io_cpu_fetch_mmuRsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                       ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation    (IBusCachedPlugin_mmuBus_rsp_bypassTranslation               ), //i
    .io_cpu_fetch_physicalAddress             (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]   ), //o
    .io_cpu_decode_isValid                    (_zz_124                                                     ), //i
    .io_cpu_decode_isStuck                    (_zz_125                                                     ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss              ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error                  ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling           ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException           ), //o
    .io_cpu_decode_isUser                     (_zz_126                                                     ), //i
    .io_cpu_fill_valid                        (_zz_127                                                     ), //i
    .io_cpu_fill_payload                      (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //i
    .io_mem_cmd_valid                         (IBusCachedPlugin_cache_io_mem_cmd_valid                     ), //o
    .io_mem_cmd_ready                         (iBus_cmd_ready                                              ), //i
    .io_mem_cmd_payload_address               (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]     ), //o
    .io_mem_cmd_payload_size                  (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]         ), //o
    .io_mem_rsp_valid                         (iBus_rsp_valid                                              ), //i
    .io_mem_rsp_payload_data                  (iBus_rsp_payload_data[31:0]                                 ), //i
    .io_mem_rsp_payload_error                 (iBus_rsp_payload_error                                      ), //i
    .clk                                      (clk                                                         ), //i
    .reset                                    (reset                                                       )  //i
  );
  always @(*) begin
    case(_zz_211)
      2'b00 : begin
        _zz_130 = DBusSimplePlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_130 = CsrPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_130 = BranchPlugin_jumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL";
      default : decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_1)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_1_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_1_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_1_string = "ECALL";
      default : _zz_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_2_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_2_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_2_string = "ECALL";
      default : _zz_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_3_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_3_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_3_string = "ECALL";
      default : _zz_3_string = "?????";
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
    case(_zz_4)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_4_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_4_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_4_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_4_string = "JALR";
      default : _zz_4_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_5_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_5_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_5_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_5_string = "JALR";
      default : _zz_5_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_6_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_6_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_6_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_6_string = "JALR";
      default : _zz_6_string = "????";
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
    case(_zz_7)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_7_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_7_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_7_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_7_string = "SRA_1    ";
      default : _zz_7_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_8_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_8_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_8_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_8_string = "SRA_1    ";
      default : _zz_8_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_9_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_9_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_9_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_9_string = "SRA_1    ";
      default : _zz_9_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_10_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_10_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_10_string = "AND_1";
      default : _zz_10_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_11_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_11_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_11_string = "AND_1";
      default : _zz_11_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_12_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_12_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_12_string = "AND_1";
      default : _zz_12_string = "?????";
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
    case(_zz_13)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_13_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_13_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_13_string = "BITWISE ";
      default : _zz_13_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_14_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_14_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_14_string = "BITWISE ";
      default : _zz_14_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_15_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_15_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_15_string = "BITWISE ";
      default : _zz_15_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL";
      default : execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_16_string = "ECALL";
      default : _zz_16_string = "?????";
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
    case(_zz_17)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_17_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_17_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_17_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_17_string = "JALR";
      default : _zz_17_string = "????";
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
    case(_zz_18)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_18_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_18_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_18_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_18_string = "SRA_1    ";
      default : _zz_18_string = "?????????";
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
    case(_zz_21)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_21_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_21_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_21_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_21_string = "PC ";
      default : _zz_21_string = "???";
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
    case(_zz_23)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_23_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_23_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_23_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_23_string = "URS1        ";
      default : _zz_23_string = "????????????";
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
    case(_zz_24)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_24_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_24_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_24_string = "BITWISE ";
      default : _zz_24_string = "????????";
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
    case(_zz_25)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_25_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_25_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_25_string = "AND_1";
      default : _zz_25_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_29)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_29_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_29_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_29_string = "ECALL";
      default : _zz_29_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_30)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_30_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_30_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_30_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_30_string = "JALR";
      default : _zz_30_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_31)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_31_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_31_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_31_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_31_string = "SRA_1    ";
      default : _zz_31_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_32)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_32_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_32_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_32_string = "AND_1";
      default : _zz_32_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_33)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_33_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_33_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_33_string = "BITWISE ";
      default : _zz_33_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_34_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_34_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_34_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_34_string = "PC ";
      default : _zz_34_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_35_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_35_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_35_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_35_string = "URS1        ";
      default : _zz_35_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_66)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_66_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_66_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_66_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_66_string = "URS1        ";
      default : _zz_66_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_67)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_67_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_67_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_67_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_67_string = "PC ";
      default : _zz_67_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_68)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_68_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_68_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_68_string = "BITWISE ";
      default : _zz_68_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_69)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_69_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_69_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_69_string = "AND_1";
      default : _zz_69_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_70)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_70_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_70_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_70_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_70_string = "SRA_1    ";
      default : _zz_70_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_71)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_71_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_71_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_71_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_71_string = "JALR";
      default : _zz_71_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_72)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_72_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_72_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_72_string = "ECALL";
      default : _zz_72_string = "?????";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL";
      default : decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  `endif

  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2 = _zz_80;
  assign decode_SRC1 = _zz_75;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_RS2 = decode_RegFilePlugin_rs2Data;
  assign decode_RS1 = decode_RegFilePlugin_rs1Data;
  assign decode_IS_RS2_SIGNED = _zz_155[0];
  assign decode_IS_RS1_SIGNED = _zz_156[0];
  assign decode_IS_MUL = _zz_157[0];
  assign decode_ENV_CTRL = _zz_1;
  assign _zz_2 = _zz_3;
  assign decode_IS_CSR = _zz_158[0];
  assign decode_BRANCH_CTRL = _zz_4;
  assign _zz_5 = _zz_6;
  assign decode_SHIFT_CTRL = _zz_7;
  assign _zz_8 = _zz_9;
  assign decode_ALU_BITWISE_CTRL = _zz_10;
  assign _zz_11 = _zz_12;
  assign decode_SRC_LESS_UNSIGNED = _zz_159[0];
  assign decode_ALU_CTRL = _zz_13;
  assign _zz_14 = _zz_15;
  assign decode_MEMORY_STORE = _zz_160[0];
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign execute_ENV_CTRL = _zz_16;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_88;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_17;
  assign decode_RS2_USE = _zz_161[0];
  assign decode_RS1_USE = _zz_162[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_SHIFT_CTRL = _zz_18;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_19 = decode_PC;
  assign _zz_20 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_21;
  assign _zz_22 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_23;
  assign decode_SRC_USE_SUB_LESS = _zz_163[0];
  assign decode_SRC_ADD_ZERO = _zz_164[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_24;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_25;
  assign _zz_26 = execute_INSTRUCTION;
  assign _zz_27 = execute_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_28 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_28 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_165[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_212) == 32'h00001073),{(_zz_213 == _zz_214),{_zz_215,{_zz_216,_zz_217}}}}}}} != 21'h0);
  always @ (*) begin
    _zz_36 = execute_REGFILE_WRITE_DATA;
    if((execute_arbitration_isValid && execute_MEMORY_ENABLE))begin
      _zz_36 = execute_DBusSimplePlugin_rspFormated;
    end
    if(_zz_131)begin
      _zz_36 = _zz_81;
    end
    if(_zz_132)begin
      _zz_36 = execute_CsrPlugin_readData;
    end
    if(_zz_133)begin
      _zz_36 = ((execute_INSTRUCTION[13 : 12] == 2'b00) ? execute_MulDivIterativePlugin_accumulator[31 : 0] : execute_MulDivIterativePlugin_accumulator[63 : 32]);
    end
  end

  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign execute_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_REGFILE_WRITE_DATA = _zz_74;
  assign execute_MMU_FAULT = ((execute_MMU_RSP2_exception || ((! execute_MMU_RSP2_allowWrite) && execute_MEMORY_STORE)) || ((! execute_MMU_RSP2_allowRead) && (! execute_MEMORY_STORE)));
  assign execute_MMU_RSP2_physicalAddress = DBusSimplePlugin_mmuBus_rsp_physicalAddress;
  assign execute_MMU_RSP2_isIoAccess = DBusSimplePlugin_mmuBus_rsp_isIoAccess;
  assign execute_MMU_RSP2_isPaging = DBusSimplePlugin_mmuBus_rsp_isPaging;
  assign execute_MMU_RSP2_allowRead = DBusSimplePlugin_mmuBus_rsp_allowRead;
  assign execute_MMU_RSP2_allowWrite = DBusSimplePlugin_mmuBus_rsp_allowWrite;
  assign execute_MMU_RSP2_allowExecute = DBusSimplePlugin_mmuBus_rsp_allowExecute;
  assign execute_MMU_RSP2_exception = DBusSimplePlugin_mmuBus_rsp_exception;
  assign execute_MMU_RSP2_refilling = DBusSimplePlugin_mmuBus_rsp_refilling;
  assign execute_MMU_RSP2_bypassTranslation = DBusSimplePlugin_mmuBus_rsp_bypassTranslation;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  assign decode_MEMORY_ENABLE = _zz_166[0];
  assign decode_FLUSH_ALL = _zz_167[0];
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(_zz_134)begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_135)begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign execute_PC = decode_to_execute_PC;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusSimplePlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_82 || _zz_83)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)) != 1'b0))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decodeExceptionPort_valid)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(decodeExceptionPort_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_51)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_MEMORY_STORE)) && ((! dBus_rsp_ready) || (! _zz_51))))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_131)begin
      if((! execute_LightShifterPlugin_done))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_132)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_133)begin
      if(((! execute_MulDivIterativePlugin_frontendOk) || (! execute_MulDivIterativePlugin_mul_counter_willOverflowIfInc)))begin
        execute_arbitration_haltItself = 1'b1;
      end
      if(_zz_136)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(_zz_137)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(DBusSimplePlugin_redoBranch_valid)begin
      execute_arbitration_flushIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(DBusSimplePlugin_redoBranch_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_137)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_138)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_139)begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = execute_INSTRUCTION;
  assign lastStagePc = execute_PC;
  assign lastStageIsValid = execute_arbitration_isValid;
  assign lastStageIsFiring = execute_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode} != 2'b00))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_138)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_139)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_138)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_139)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_138)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_139)begin
      case(_zz_140)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusCachedPlugin_externalFlush = ({execute_arbitration_flushNext,decode_arbitration_flushNext} != 2'b00);
  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,DBusSimplePlugin_redoBranch_valid}} != 3'b000);
  assign _zz_37 = {BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusSimplePlugin_redoBranch_valid}};
  assign _zz_38 = (_zz_37 & (~ _zz_168));
  assign _zz_39 = _zz_38[1];
  assign _zz_40 = _zz_38[2];
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_130;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_170);
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch)begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_41 = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_41);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_41);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_42 = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_42);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_42);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected_2 || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_43 = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_43);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_43);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_44;
  assign _zz_44 = ((1'b0 && (! _zz_45)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_45 = _zz_46;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_45;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_47)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_47 = _zz_48;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_47;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_49;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if((! IBusCachedPlugin_pcValids_0))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_120 = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_121 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_122 = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_121;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign _zz_124 = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_125 = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_126 = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_135)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_134)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_127 = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_134)begin
      _zz_127 = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign _zz_119 = (decode_arbitration_isValid && decode_FLUSH_ALL);
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
    if((execute_MMU_FAULT || execute_MMU_RSP2_refilling))begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_51));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_52 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_52 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_52 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_52;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_53 = 4'b0001;
      end
      2'b01 : begin
        _zz_53 = 4'b0011;
      end
      default : begin
        _zz_53 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_53 <<< dBus_cmd_payload_address[1 : 0]);
  assign DBusSimplePlugin_mmuBus_cmd_0_isValid = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign DBusSimplePlugin_mmuBus_cmd_0_isStuck = execute_arbitration_isStuck;
  assign DBusSimplePlugin_mmuBus_cmd_0_virtualAddress = execute_SRC_ADD;
  assign DBusSimplePlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign DBusSimplePlugin_mmuBus_end = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign dBus_cmd_payload_address = DBusSimplePlugin_mmuBus_rsp_physicalAddress;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(execute_MMU_RSP2_refilling)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end else begin
      if(execute_MMU_FAULT)begin
        DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
      end
    end
    if(_zz_141)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(! execute_MMU_RSP2_refilling) begin
      if(execute_MMU_FAULT)begin
        DBusSimplePlugin_memoryExceptionPort_payload_code = (execute_MEMORY_STORE ? 4'b1111 : 4'b1101);
      end
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = execute_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusSimplePlugin_redoBranch_valid = 1'b0;
    if(execute_MMU_RSP2_refilling)begin
      DBusSimplePlugin_redoBranch_valid = 1'b1;
    end
    if(_zz_141)begin
      DBusSimplePlugin_redoBranch_valid = 1'b0;
    end
  end

  assign DBusSimplePlugin_redoBranch_payload = execute_PC;
  always @ (*) begin
    execute_DBusSimplePlugin_rspShifted = execute_MEMORY_READ_DATA;
    case(execute_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        execute_DBusSimplePlugin_rspShifted[7 : 0] = execute_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        execute_DBusSimplePlugin_rspShifted[15 : 0] = execute_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        execute_DBusSimplePlugin_rspShifted[7 : 0] = execute_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_54 = (execute_DBusSimplePlugin_rspShifted[7] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_55[31] = _zz_54;
    _zz_55[30] = _zz_54;
    _zz_55[29] = _zz_54;
    _zz_55[28] = _zz_54;
    _zz_55[27] = _zz_54;
    _zz_55[26] = _zz_54;
    _zz_55[25] = _zz_54;
    _zz_55[24] = _zz_54;
    _zz_55[23] = _zz_54;
    _zz_55[22] = _zz_54;
    _zz_55[21] = _zz_54;
    _zz_55[20] = _zz_54;
    _zz_55[19] = _zz_54;
    _zz_55[18] = _zz_54;
    _zz_55[17] = _zz_54;
    _zz_55[16] = _zz_54;
    _zz_55[15] = _zz_54;
    _zz_55[14] = _zz_54;
    _zz_55[13] = _zz_54;
    _zz_55[12] = _zz_54;
    _zz_55[11] = _zz_54;
    _zz_55[10] = _zz_54;
    _zz_55[9] = _zz_54;
    _zz_55[8] = _zz_54;
    _zz_55[7 : 0] = execute_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_56 = (execute_DBusSimplePlugin_rspShifted[15] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_57[31] = _zz_56;
    _zz_57[30] = _zz_56;
    _zz_57[29] = _zz_56;
    _zz_57[28] = _zz_56;
    _zz_57[27] = _zz_56;
    _zz_57[26] = _zz_56;
    _zz_57[25] = _zz_56;
    _zz_57[24] = _zz_56;
    _zz_57[23] = _zz_56;
    _zz_57[22] = _zz_56;
    _zz_57[21] = _zz_56;
    _zz_57[20] = _zz_56;
    _zz_57[19] = _zz_56;
    _zz_57[18] = _zz_56;
    _zz_57[17] = _zz_56;
    _zz_57[16] = _zz_56;
    _zz_57[15 : 0] = execute_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_153)
      2'b00 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_55;
      end
      2'b01 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_57;
      end
      default : begin
        execute_DBusSimplePlugin_rspFormated = execute_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = IBusCachedPlugin_mmuBus_rsp_physicalAddress[31];
  assign IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusSimplePlugin_mmuBus_rsp_physicalAddress = DBusSimplePlugin_mmuBus_cmd_0_virtualAddress;
  assign DBusSimplePlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusSimplePlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusSimplePlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusSimplePlugin_mmuBus_rsp_isIoAccess = DBusSimplePlugin_mmuBus_rsp_physicalAddress[31];
  assign DBusSimplePlugin_mmuBus_rsp_isPaging = 1'b0;
  assign DBusSimplePlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusSimplePlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusSimplePlugin_mmuBus_busy = 1'b0;
  assign _zz_59 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_60 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_61 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_62 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz_63 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_64 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_65 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00001000);
  assign _zz_58 = {(_zz_65 != 1'b0),{({_zz_65,_zz_64} != 2'b00),{(_zz_230 != 1'b0),{(_zz_231 != _zz_232),{_zz_233,{_zz_234,_zz_235}}}}}};
  assign _zz_66 = _zz_58[2 : 1];
  assign _zz_35 = _zz_66;
  assign _zz_67 = _zz_58[7 : 6];
  assign _zz_34 = _zz_67;
  assign _zz_68 = _zz_58[14 : 13];
  assign _zz_33 = _zz_68;
  assign _zz_69 = _zz_58[17 : 16];
  assign _zz_32 = _zz_69;
  assign _zz_70 = _zz_58[20 : 19];
  assign _zz_31 = _zz_70;
  assign _zz_71 = _zz_58[23 : 22];
  assign _zz_30 = _zz_71;
  assign _zz_72 = _zz_58[26 : 25];
  assign _zz_29 = _zz_72;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_128;
  assign decode_RegFilePlugin_rs2Data = _zz_129;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_27 && execute_arbitration_isFiring);
    if(_zz_73)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_26[11 : 7];
    if(_zz_73)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_36;
    if(_zz_73)begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

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
        _zz_74 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_74 = {31'd0, _zz_171};
      end
      default : begin
        _zz_74 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_75 = _zz_22;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_75 = {29'd0, _zz_172};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_75 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_75 = {27'd0, _zz_173};
      end
    endcase
  end

  assign _zz_76 = _zz_174[11];
  always @ (*) begin
    _zz_77[19] = _zz_76;
    _zz_77[18] = _zz_76;
    _zz_77[17] = _zz_76;
    _zz_77[16] = _zz_76;
    _zz_77[15] = _zz_76;
    _zz_77[14] = _zz_76;
    _zz_77[13] = _zz_76;
    _zz_77[12] = _zz_76;
    _zz_77[11] = _zz_76;
    _zz_77[10] = _zz_76;
    _zz_77[9] = _zz_76;
    _zz_77[8] = _zz_76;
    _zz_77[7] = _zz_76;
    _zz_77[6] = _zz_76;
    _zz_77[5] = _zz_76;
    _zz_77[4] = _zz_76;
    _zz_77[3] = _zz_76;
    _zz_77[2] = _zz_76;
    _zz_77[1] = _zz_76;
    _zz_77[0] = _zz_76;
  end

  assign _zz_78 = _zz_175[11];
  always @ (*) begin
    _zz_79[19] = _zz_78;
    _zz_79[18] = _zz_78;
    _zz_79[17] = _zz_78;
    _zz_79[16] = _zz_78;
    _zz_79[15] = _zz_78;
    _zz_79[14] = _zz_78;
    _zz_79[13] = _zz_78;
    _zz_79[12] = _zz_78;
    _zz_79[11] = _zz_78;
    _zz_79[10] = _zz_78;
    _zz_79[9] = _zz_78;
    _zz_79[8] = _zz_78;
    _zz_79[7] = _zz_78;
    _zz_79[6] = _zz_78;
    _zz_79[5] = _zz_78;
    _zz_79[4] = _zz_78;
    _zz_79[3] = _zz_78;
    _zz_79[2] = _zz_78;
    _zz_79[1] = _zz_78;
    _zz_79[0] = _zz_78;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_80 = _zz_20;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_80 = {_zz_77,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_80 = {_zz_79,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_80 = _zz_19;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_176;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_shiftReg : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == 4'b0000);
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_81 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_81 = _zz_183;
      end
    endcase
  end

  always @ (*) begin
    _zz_82 = 1'b0;
    if(_zz_84)begin
      if((_zz_85 == decode_INSTRUCTION[19 : 15]))begin
        _zz_82 = 1'b1;
      end
    end
    if(_zz_142)begin
      if(_zz_143)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_82 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_82 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_83 = 1'b0;
    if(_zz_84)begin
      if((_zz_85 == decode_INSTRUCTION[24 : 20]))begin
        _zz_83 = 1'b1;
      end
    end
    if(_zz_142)begin
      if(_zz_143)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_83 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_83 = 1'b0;
    end
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_86 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_86 == 3'b000)) begin
        _zz_87 = execute_BranchPlugin_eq;
    end else if((_zz_86 == 3'b001)) begin
        _zz_87 = (! execute_BranchPlugin_eq);
    end else if((((_zz_86 & 3'b101) == 3'b101))) begin
        _zz_87 = (! execute_SRC_LESS);
    end else begin
        _zz_87 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_88 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_88 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_88 = 1'b1;
      end
      default : begin
        _zz_88 = _zz_87;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_89 = _zz_185[19];
  always @ (*) begin
    _zz_90[10] = _zz_89;
    _zz_90[9] = _zz_89;
    _zz_90[8] = _zz_89;
    _zz_90[7] = _zz_89;
    _zz_90[6] = _zz_89;
    _zz_90[5] = _zz_89;
    _zz_90[4] = _zz_89;
    _zz_90[3] = _zz_89;
    _zz_90[2] = _zz_89;
    _zz_90[1] = _zz_89;
    _zz_90[0] = _zz_89;
  end

  assign _zz_91 = _zz_186[11];
  always @ (*) begin
    _zz_92[19] = _zz_91;
    _zz_92[18] = _zz_91;
    _zz_92[17] = _zz_91;
    _zz_92[16] = _zz_91;
    _zz_92[15] = _zz_91;
    _zz_92[14] = _zz_91;
    _zz_92[13] = _zz_91;
    _zz_92[12] = _zz_91;
    _zz_92[11] = _zz_91;
    _zz_92[10] = _zz_91;
    _zz_92[9] = _zz_91;
    _zz_92[8] = _zz_91;
    _zz_92[7] = _zz_91;
    _zz_92[6] = _zz_91;
    _zz_92[5] = _zz_91;
    _zz_92[4] = _zz_91;
    _zz_92[3] = _zz_91;
    _zz_92[2] = _zz_91;
    _zz_92[1] = _zz_91;
    _zz_92[0] = _zz_91;
  end

  assign _zz_93 = _zz_187[11];
  always @ (*) begin
    _zz_94[18] = _zz_93;
    _zz_94[17] = _zz_93;
    _zz_94[16] = _zz_93;
    _zz_94[15] = _zz_93;
    _zz_94[14] = _zz_93;
    _zz_94[13] = _zz_93;
    _zz_94[12] = _zz_93;
    _zz_94[11] = _zz_93;
    _zz_94[10] = _zz_93;
    _zz_94[9] = _zz_93;
    _zz_94[8] = _zz_93;
    _zz_94[7] = _zz_93;
    _zz_94[6] = _zz_93;
    _zz_94[5] = _zz_93;
    _zz_94[4] = _zz_93;
    _zz_94[3] = _zz_93;
    _zz_94[2] = _zz_93;
    _zz_94[1] = _zz_93;
    _zz_94[0] = _zz_93;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_95 = {{_zz_90,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_95 = {_zz_92,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_95 = {{_zz_94,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_95;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_96 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_97 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_98 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_99 = {CsrPlugin_selfException_valid,DBusSimplePlugin_memoryExceptionPort_valid};
  assign _zz_100 = _zz_188[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(_zz_137)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_0;
    if((CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute != 1'b0))begin
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
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = (1'b0 || 1'b0);
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773)begin
      if(execute_CSR_WRITE_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_833)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2816)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2944)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3008)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_4032)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_144)begin
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
    if(_zz_145)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(_zz_145)begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  always @ (*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(_zz_144)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_144)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_154)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @ (*) begin
    execute_MulDivIterativePlugin_mul_counter_willIncrement = 1'b0;
    if(_zz_133)begin
      if(_zz_136)begin
        execute_MulDivIterativePlugin_mul_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_MulDivIterativePlugin_mul_counter_willClear = 1'b0;
    if((! execute_arbitration_isStuck))begin
      execute_MulDivIterativePlugin_mul_counter_willClear = 1'b1;
    end
  end

  assign execute_MulDivIterativePlugin_mul_counter_willOverflowIfInc = (execute_MulDivIterativePlugin_mul_counter_value == 6'h20);
  assign execute_MulDivIterativePlugin_mul_counter_willOverflow = (execute_MulDivIterativePlugin_mul_counter_willOverflowIfInc && execute_MulDivIterativePlugin_mul_counter_willIncrement);
  always @ (*) begin
    if(execute_MulDivIterativePlugin_mul_counter_willOverflow)begin
      execute_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end else begin
      execute_MulDivIterativePlugin_mul_counter_valueNext = (execute_MulDivIterativePlugin_mul_counter_value + _zz_191);
    end
    if(execute_MulDivIterativePlugin_mul_counter_willClear)begin
      execute_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end
  end

  assign _zz_101 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_102 = ((execute_IS_MUL && _zz_101) || 1'b0);
  always @ (*) begin
    _zz_103[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_103[31 : 0] = execute_RS1;
  end

  assign _zz_105 = (_zz_104 & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_105 != 32'h0);
  assign _zz_23 = _zz_35;
  assign _zz_21 = _zz_34;
  assign _zz_15 = decode_ALU_CTRL;
  assign _zz_13 = _zz_33;
  assign _zz_24 = decode_to_execute_ALU_CTRL;
  assign _zz_12 = decode_ALU_BITWISE_CTRL;
  assign _zz_10 = _zz_32;
  assign _zz_25 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_9 = decode_SHIFT_CTRL;
  assign _zz_7 = _zz_31;
  assign _zz_18 = decode_to_execute_SHIFT_CTRL;
  assign _zz_6 = decode_BRANCH_CTRL;
  assign _zz_4 = _zz_30;
  assign _zz_17 = decode_to_execute_BRANCH_CTRL;
  assign _zz_3 = decode_ENV_CTRL;
  assign _zz_1 = _zz_29;
  assign _zz_16 = decode_to_execute_ENV_CTRL;
  assign decode_arbitration_isFlushed = ((execute_arbitration_flushNext != 1'b0) || ({execute_arbitration_flushIt,decode_arbitration_flushIt} != 2'b00));
  assign execute_arbitration_isFlushed = (1'b0 || (execute_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (1'b0 || execute_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || 1'b0);
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  always @ (*) begin
    _zz_106 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_106[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_106[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_106[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_107 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_107[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_107[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_107[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_108 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_108[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_108[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_108[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_109 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_109[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_110 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_110[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_110[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_111 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_111[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @ (*) begin
    _zz_112 = 32'h0;
    if(execute_CsrPlugin_csr_2816)begin
      _zz_112[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_113 = 32'h0;
    if(execute_CsrPlugin_csr_2944)begin
      _zz_113[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_114 = 32'h0;
    if(execute_CsrPlugin_csr_3008)begin
      _zz_114[31 : 0] = _zz_104;
    end
  end

  always @ (*) begin
    _zz_115 = 32'h0;
    if(execute_CsrPlugin_csr_4032)begin
      _zz_115[31 : 0] = _zz_105;
    end
  end

  assign execute_CsrPlugin_readData = ((((_zz_106 | _zz_107) | (_zz_108 | _zz_109)) | ((_zz_110 | _zz_111) | (_zz_112 | _zz_113))) | (_zz_114 | _zz_115));
  assign iBusWishbone_ADR = {_zz_208,_zz_116};
  assign iBusWishbone_CTI = ((_zz_116 == 3'b111) ? 3'b111 : 3'b010);
  assign iBusWishbone_BTE = 2'b00;
  assign iBusWishbone_SEL = 4'b1111;
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = 32'h0;
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    if(_zz_146)begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWishbone_STB = 1'b0;
    if(_zz_146)begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_117;
  assign iBus_rsp_payload_data = iBusWishbone_DAT_MISO_regNext;
  assign iBus_rsp_payload_error = 1'b0;
  assign dBus_cmd_halfPipe_valid = dBus_cmd_halfPipe_regs_valid;
  assign dBus_cmd_halfPipe_payload_wr = dBus_cmd_halfPipe_regs_payload_wr;
  assign dBus_cmd_halfPipe_payload_address = dBus_cmd_halfPipe_regs_payload_address;
  assign dBus_cmd_halfPipe_payload_data = dBus_cmd_halfPipe_regs_payload_data;
  assign dBus_cmd_halfPipe_payload_size = dBus_cmd_halfPipe_regs_payload_size;
  assign dBus_cmd_ready = dBus_cmd_halfPipe_regs_ready;
  assign dBusWishbone_ADR = (dBus_cmd_halfPipe_payload_address >>> 2);
  assign dBusWishbone_CTI = 3'b000;
  assign dBusWishbone_BTE = 2'b00;
  always @ (*) begin
    case(dBus_cmd_halfPipe_payload_size)
      2'b00 : begin
        _zz_118 = 4'b0001;
      end
      2'b01 : begin
        _zz_118 = 4'b0011;
      end
      default : begin
        _zz_118 = 4'b1111;
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = (_zz_118 <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
    if((! dBus_cmd_halfPipe_payload_wr))begin
      dBusWishbone_SEL = 4'b1111;
    end
  end

  assign dBusWishbone_WE = dBus_cmd_halfPipe_payload_wr;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_halfPipe_payload_data;
  assign dBus_cmd_halfPipe_ready = (dBus_cmd_halfPipe_valid && dBusWishbone_ACK);
  assign dBusWishbone_CYC = dBus_cmd_halfPipe_valid;
  assign dBusWishbone_STB = dBus_cmd_halfPipe_valid;
  assign dBus_rsp_ready = ((dBus_cmd_halfPipe_valid && (! dBusWishbone_WE)) && dBusWishbone_ACK);
  assign dBus_rsp_data = dBusWishbone_DAT_MISO;
  assign dBus_rsp_error = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_46 <= 1'b0;
      _zz_48 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_50;
      IBusCachedPlugin_rspCounter <= 32'h0;
      _zz_51 <= 1'b0;
      _zz_73 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      _zz_84 <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_MulDivIterativePlugin_frontendOk <= 1'b0;
      execute_MulDivIterativePlugin_mul_counter_value <= 6'h0;
      _zz_104 <= 32'h0;
      execute_arbitration_isValid <= 1'b0;
      _zz_116 <= 3'b000;
      _zz_117 <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction)begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if((IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate)))begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_46 <= 1'b0;
      end
      if(_zz_44)begin
        _zz_46 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_48 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_48 <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if((dBus_cmd_valid && dBus_cmd_ready))begin
        _zz_51 <= 1'b1;
      end
      if((! execute_arbitration_isStuck))begin
        _zz_51 <= 1'b0;
      end
      _zz_73 <= 1'b0;
      if(_zz_131)begin
        if(_zz_147)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      _zz_84 <= (_zz_27 && execute_arbitration_isFiring);
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_148)begin
        if(_zz_149)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_150)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_151)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_138)begin
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
      if(_zz_139)begin
        case(_zz_140)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_98,{_zz_97,_zz_96}} != 3'b000) || CsrPlugin_thirdPartyWake);
      if(((execute_arbitration_isValid && (! 1'b0)) && (1'b0 || execute_IS_MUL)))begin
        execute_MulDivIterativePlugin_frontendOk <= 1'b1;
      end
      if(execute_arbitration_isMoving)begin
        execute_MulDivIterativePlugin_frontendOk <= 1'b0;
      end
      execute_MulDivIterativePlugin_mul_counter_value <= execute_MulDivIterativePlugin_mul_counter_valueNext;
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_202[0];
          CsrPlugin_mstatus_MIE <= _zz_203[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_205[0];
          CsrPlugin_mie_MTIE <= _zz_206[0];
          CsrPlugin_mie_MSIE <= _zz_207[0];
        end
      end
      if(execute_CsrPlugin_csr_3008)begin
        if(execute_CsrPlugin_writeEnable)begin
          _zz_104 <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      if(_zz_146)begin
        if(iBusWishbone_ACK)begin
          _zz_116 <= (_zz_116 + 3'b001);
        end
      end
      _zz_117 <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if(_zz_152)begin
        dBus_cmd_halfPipe_regs_valid <= dBus_cmd_valid;
        dBus_cmd_halfPipe_regs_ready <= (! dBus_cmd_valid);
      end else begin
        dBus_cmd_halfPipe_regs_valid <= (! dBus_cmd_halfPipe_ready);
        dBus_cmd_halfPipe_regs_ready <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_49 <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if((! execute_arbitration_isStuckByOthers))begin
      execute_LightShifterPlugin_shiftReg <= _zz_36;
    end
    if(_zz_131)begin
      if(_zz_147)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    _zz_85 <= _zz_26[11 : 7];
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(execute_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decodeExceptionPort_payload_badAddr;
    end
    if(_zz_137)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_100 ? DBusSimplePlugin_memoryExceptionPort_payload_code : CsrPlugin_selfException_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_100 ? DBusSimplePlugin_memoryExceptionPort_payload_badAddr : CsrPlugin_selfException_payload_badAddr);
    end
    if(_zz_148)begin
      if(_zz_149)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_150)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_151)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_138)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= execute_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if(_zz_133)begin
      if(_zz_136)begin
        execute_MulDivIterativePlugin_rs2 <= (execute_MulDivIterativePlugin_rs2 >>> 1);
        execute_MulDivIterativePlugin_accumulator <= ({_zz_192,execute_MulDivIterativePlugin_accumulator[31 : 0]} >>> 1);
      end
    end
    if((! execute_MulDivIterativePlugin_frontendOk))begin
      execute_MulDivIterativePlugin_accumulator <= 65'h0;
      execute_MulDivIterativePlugin_rs1 <= ((_zz_102 ? (~ _zz_103) : _zz_103) + _zz_199);
      execute_MulDivIterativePlugin_rs2 <= ((_zz_101 ? (~ execute_RS2) : execute_RS2) + _zz_201);
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if(((! execute_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_execute)))begin
      decode_to_execute_PC <= _zz_19;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_14;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_8;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_5;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_22;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_20;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3008 <= (decode_INSTRUCTION[31 : 20] == 12'hbc0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_4032 <= (decode_INSTRUCTION[31 : 20] == 12'hfc0);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_204[0];
      end
    end
    if(execute_CsrPlugin_csr_773)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
        CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
      end
    end
    if(execute_CsrPlugin_csr_833)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    iBusWishbone_DAT_MISO_regNext <= iBusWishbone_DAT_MISO;
    if(_zz_152)begin
      dBus_cmd_halfPipe_regs_payload_wr <= dBus_cmd_payload_wr;
      dBus_cmd_halfPipe_regs_payload_address <= dBus_cmd_payload_address;
      dBus_cmd_halfPipe_regs_payload_data <= dBus_cmd_payload_data;
      dBus_cmd_halfPipe_regs_payload_size <= dBus_cmd_payload_size;
    end
  end


endmodule

module InstructionCache (
  input               io_flush,
  input               io_cpu_prefetch_isValid,
  output reg          io_cpu_prefetch_haltIt,
  input      [31:0]   io_cpu_prefetch_pc,
  input               io_cpu_fetch_isValid,
  input               io_cpu_fetch_isStuck,
  input               io_cpu_fetch_isRemoved,
  input      [31:0]   io_cpu_fetch_pc,
  output     [31:0]   io_cpu_fetch_data,
  input      [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input               io_cpu_fetch_mmuRsp_isIoAccess,
  input               io_cpu_fetch_mmuRsp_isPaging,
  input               io_cpu_fetch_mmuRsp_allowRead,
  input               io_cpu_fetch_mmuRsp_allowWrite,
  input               io_cpu_fetch_mmuRsp_allowExecute,
  input               io_cpu_fetch_mmuRsp_exception,
  input               io_cpu_fetch_mmuRsp_refilling,
  input               io_cpu_fetch_mmuRsp_bypassTranslation,
  output     [31:0]   io_cpu_fetch_physicalAddress,
  input               io_cpu_decode_isValid,
  input               io_cpu_decode_isStuck,
  input      [31:0]   io_cpu_decode_pc,
  output     [31:0]   io_cpu_decode_physicalAddress,
  output     [31:0]   io_cpu_decode_data,
  output              io_cpu_decode_cacheMiss,
  output              io_cpu_decode_error,
  output              io_cpu_decode_mmuRefilling,
  output              io_cpu_decode_mmuException,
  input               io_cpu_decode_isUser,
  input               io_cpu_fill_valid,
  input      [31:0]   io_cpu_fill_payload,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [2:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset
);
  reg        [31:0]   _zz_9;
  reg        [24:0]   _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire       [0:0]    _zz_13;
  wire       [0:0]    _zz_14;
  wire       [24:0]   _zz_15;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [4:0]    lineLoader_flushCounter;
  reg                 _zz_3;
  reg                 lineLoader_cmdSent;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [3:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [22:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [6:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire       [6:0]    _zz_4;
  wire                _zz_5;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [3:0]    _zz_6;
  wire                _zz_7;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [22:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [24:0]   _zz_8;
  wire                fetchStage_hit_hits_0;
  wire                fetchStage_hit_valid;
  wire                fetchStage_hit_error;
  wire       [31:0]   fetchStage_hit_data;
  wire       [31:0]   fetchStage_hit_word;
  reg        [31:0]   io_cpu_fetch_data_regNextWhen;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  reg                 decodeStage_hit_valid;
  reg                 decodeStage_hit_error;
  (* ram_style = "block" *) reg [31:0] banks_0 [0:127];
  (* ram_style = "block" *) reg [24:0] ways_0_tags [0:15];

  assign _zz_11 = (! lineLoader_flushCounter[4]);
  assign _zz_12 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_13 = _zz_8[0 : 0];
  assign _zz_14 = _zz_8[1 : 1];
  assign _zz_15 = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_9 <= banks_0[_zz_4];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_15;
    end
  end

  always @ (posedge clk) begin
    if(_zz_7) begin
      _zz_10 <= ways_0_tags[_zz_6];
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_2 = 1'b1;
    end
  end

  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == 3'b111))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_11)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_3))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if((! lineLoader_valid))begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[4]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[4] ? lineLoader_address[8 : 5] : lineLoader_flushCounter[3 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[4];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 9];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[8 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_4 = io_cpu_prefetch_pc[8 : 2];
  assign _zz_5 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = _zz_9;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_6 = io_cpu_prefetch_pc[8 : 5];
  assign _zz_7 = (! io_cpu_fetch_isStuck);
  assign _zz_8 = _zz_10;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_13[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_14[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_8[24 : 2];
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuRsp_physicalAddress[31 : 9]));
  assign fetchStage_hit_valid = (fetchStage_hit_hits_0 != 1'b0);
  assign fetchStage_hit_error = fetchStage_read_waysValues_0_tag_error;
  assign fetchStage_hit_data = fetchStage_read_banksValue_0_data;
  assign fetchStage_hit_word = fetchStage_hit_data;
  assign io_cpu_fetch_data = fetchStage_hit_word;
  assign io_cpu_decode_data = io_cpu_fetch_data_regNextWhen;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @ (posedge clk) begin
    if(reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
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
      if(_zz_12)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
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
    if(_zz_11)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 5'h01);
    end
    _zz_3 <= lineLoader_flushCounter[4];
    if(_zz_12)begin
      lineLoader_flushCounter <= 5'h0;
    end
    if((! io_cpu_decode_isStuck))begin
      io_cpu_fetch_data_regNextWhen <= io_cpu_fetch_data;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_valid <= fetchStage_hit_valid;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_error <= fetchStage_hit_error;
    end
  end


endmodule
