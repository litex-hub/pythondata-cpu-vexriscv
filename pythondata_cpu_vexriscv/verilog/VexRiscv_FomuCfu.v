// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : VexRiscv
// Git hash  : aa12b0d45ab170fd03927c0d06fa62f6bd8e840f


`define Input2Kind_defaultEncoding_type [0:0]
`define Input2Kind_defaultEncoding_RS 1'b0
`define Input2Kind_defaultEncoding_IMM_I 1'b1

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

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11


module VexRiscv (
  input      [31:0]   externalResetVector,
  input               timerInterrupt,
  input               softwareInterrupt,
  output              CfuPlugin_bus_cmd_valid,
  input               CfuPlugin_bus_cmd_ready,
  output     [9:0]    CfuPlugin_bus_cmd_payload_function_id,
  output     [31:0]   CfuPlugin_bus_cmd_payload_inputs_0,
  output     [31:0]   CfuPlugin_bus_cmd_payload_inputs_1,
  input               CfuPlugin_bus_rsp_valid,
  output              CfuPlugin_bus_rsp_ready,
  input               CfuPlugin_bus_rsp_payload_response_ok,
  input      [31:0]   CfuPlugin_bus_rsp_payload_outputs_0,
  input      [31:0]   externalInterruptArray,
  input               debug_bus_cmd_valid,
  output reg          debug_bus_cmd_ready,
  input               debug_bus_cmd_payload_wr,
  input      [7:0]    debug_bus_cmd_payload_address,
  input      [31:0]   debug_bus_cmd_payload_data,
  output reg [31:0]   debug_bus_rsp_data,
  output              debug_resetOut,
  output              iBusWishbone_CYC,
  output              iBusWishbone_STB,
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
  input               reset,
  input               debugReset
);
  wire                _zz_151;
  wire                _zz_152;
  reg        [31:0]   _zz_153;
  reg        [31:0]   _zz_154;
  reg        [31:0]   _zz_155;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_156;
  wire                _zz_157;
  wire                _zz_158;
  wire                _zz_159;
  wire                _zz_160;
  wire                _zz_161;
  wire                _zz_162;
  wire                _zz_163;
  wire                _zz_164;
  wire                _zz_165;
  wire                _zz_166;
  wire                _zz_167;
  wire                _zz_168;
  wire       [1:0]    _zz_169;
  wire                _zz_170;
  wire                _zz_171;
  wire                _zz_172;
  wire                _zz_173;
  wire                _zz_174;
  wire                _zz_175;
  wire                _zz_176;
  wire                _zz_177;
  wire                _zz_178;
  wire                _zz_179;
  wire                _zz_180;
  wire                _zz_181;
  wire                _zz_182;
  wire       [5:0]    _zz_183;
  wire                _zz_184;
  wire                _zz_185;
  wire                _zz_186;
  wire                _zz_187;
  wire                _zz_188;
  wire                _zz_189;
  wire                _zz_190;
  wire       [1:0]    _zz_191;
  wire                _zz_192;
  wire       [0:0]    _zz_193;
  wire       [0:0]    _zz_194;
  wire       [0:0]    _zz_195;
  wire       [0:0]    _zz_196;
  wire       [0:0]    _zz_197;
  wire       [0:0]    _zz_198;
  wire       [0:0]    _zz_199;
  wire       [0:0]    _zz_200;
  wire       [0:0]    _zz_201;
  wire       [0:0]    _zz_202;
  wire       [0:0]    _zz_203;
  wire       [0:0]    _zz_204;
  wire       [0:0]    _zz_205;
  wire       [0:0]    _zz_206;
  wire       [0:0]    _zz_207;
  wire       [0:0]    _zz_208;
  wire       [0:0]    _zz_209;
  wire       [2:0]    _zz_210;
  wire       [2:0]    _zz_211;
  wire       [31:0]   _zz_212;
  wire       [2:0]    _zz_213;
  wire       [0:0]    _zz_214;
  wire       [2:0]    _zz_215;
  wire       [0:0]    _zz_216;
  wire       [2:0]    _zz_217;
  wire       [0:0]    _zz_218;
  wire       [2:0]    _zz_219;
  wire       [0:0]    _zz_220;
  wire       [2:0]    _zz_221;
  wire       [2:0]    _zz_222;
  wire       [0:0]    _zz_223;
  wire       [2:0]    _zz_224;
  wire       [4:0]    _zz_225;
  wire       [11:0]   _zz_226;
  wire       [11:0]   _zz_227;
  wire       [31:0]   _zz_228;
  wire       [31:0]   _zz_229;
  wire       [31:0]   _zz_230;
  wire       [31:0]   _zz_231;
  wire       [31:0]   _zz_232;
  wire       [31:0]   _zz_233;
  wire       [31:0]   _zz_234;
  wire       [31:0]   _zz_235;
  wire       [32:0]   _zz_236;
  wire       [19:0]   _zz_237;
  wire       [11:0]   _zz_238;
  wire       [11:0]   _zz_239;
  wire       [1:0]    _zz_240;
  wire       [1:0]    _zz_241;
  wire       [1:0]    _zz_242;
  wire       [1:0]    _zz_243;
  wire       [1:0]    _zz_244;
  wire       [1:0]    _zz_245;
  wire       [9:0]    _zz_246;
  wire       [7:0]    _zz_247;
  wire       [0:0]    _zz_248;
  wire       [5:0]    _zz_249;
  wire       [33:0]   _zz_250;
  wire       [32:0]   _zz_251;
  wire       [33:0]   _zz_252;
  wire       [32:0]   _zz_253;
  wire       [33:0]   _zz_254;
  wire       [32:0]   _zz_255;
  wire       [0:0]    _zz_256;
  wire       [5:0]    _zz_257;
  wire       [32:0]   _zz_258;
  wire       [31:0]   _zz_259;
  wire       [31:0]   _zz_260;
  wire       [32:0]   _zz_261;
  wire       [32:0]   _zz_262;
  wire       [32:0]   _zz_263;
  wire       [32:0]   _zz_264;
  wire       [0:0]    _zz_265;
  wire       [32:0]   _zz_266;
  wire       [0:0]    _zz_267;
  wire       [32:0]   _zz_268;
  wire       [0:0]    _zz_269;
  wire       [31:0]   _zz_270;
  wire       [0:0]    _zz_271;
  wire       [0:0]    _zz_272;
  wire       [0:0]    _zz_273;
  wire       [0:0]    _zz_274;
  wire       [0:0]    _zz_275;
  wire       [0:0]    _zz_276;
  wire                _zz_277;
  wire                _zz_278;
  wire       [1:0]    _zz_279;
  wire       [31:0]   _zz_280;
  wire       [31:0]   _zz_281;
  wire       [31:0]   _zz_282;
  wire                _zz_283;
  wire       [0:0]    _zz_284;
  wire       [13:0]   _zz_285;
  wire       [31:0]   _zz_286;
  wire       [31:0]   _zz_287;
  wire       [31:0]   _zz_288;
  wire                _zz_289;
  wire       [0:0]    _zz_290;
  wire       [7:0]    _zz_291;
  wire       [31:0]   _zz_292;
  wire       [31:0]   _zz_293;
  wire       [31:0]   _zz_294;
  wire                _zz_295;
  wire       [0:0]    _zz_296;
  wire       [1:0]    _zz_297;
  wire       [31:0]   _zz_298;
  wire       [31:0]   _zz_299;
  wire       [31:0]   _zz_300;
  wire       [0:0]    _zz_301;
  wire       [0:0]    _zz_302;
  wire       [2:0]    _zz_303;
  wire       [2:0]    _zz_304;
  wire                _zz_305;
  wire       [0:0]    _zz_306;
  wire       [26:0]   _zz_307;
  wire       [31:0]   _zz_308;
  wire       [0:0]    _zz_309;
  wire       [0:0]    _zz_310;
  wire                _zz_311;
  wire       [0:0]    _zz_312;
  wire       [22:0]   _zz_313;
  wire       [31:0]   _zz_314;
  wire                _zz_315;
  wire                _zz_316;
  wire       [0:0]    _zz_317;
  wire       [0:0]    _zz_318;
  wire       [0:0]    _zz_319;
  wire       [0:0]    _zz_320;
  wire                _zz_321;
  wire       [0:0]    _zz_322;
  wire       [18:0]   _zz_323;
  wire       [31:0]   _zz_324;
  wire       [31:0]   _zz_325;
  wire                _zz_326;
  wire                _zz_327;
  wire       [0:0]    _zz_328;
  wire       [1:0]    _zz_329;
  wire       [2:0]    _zz_330;
  wire       [2:0]    _zz_331;
  wire                _zz_332;
  wire       [0:0]    _zz_333;
  wire       [15:0]   _zz_334;
  wire       [31:0]   _zz_335;
  wire       [31:0]   _zz_336;
  wire       [31:0]   _zz_337;
  wire       [31:0]   _zz_338;
  wire       [31:0]   _zz_339;
  wire       [31:0]   _zz_340;
  wire       [31:0]   _zz_341;
  wire                _zz_342;
  wire                _zz_343;
  wire       [31:0]   _zz_344;
  wire       [31:0]   _zz_345;
  wire       [1:0]    _zz_346;
  wire       [1:0]    _zz_347;
  wire                _zz_348;
  wire       [0:0]    _zz_349;
  wire       [12:0]   _zz_350;
  wire       [31:0]   _zz_351;
  wire       [31:0]   _zz_352;
  wire       [31:0]   _zz_353;
  wire       [31:0]   _zz_354;
  wire       [0:0]    _zz_355;
  wire       [0:0]    _zz_356;
  wire       [0:0]    _zz_357;
  wire       [1:0]    _zz_358;
  wire       [0:0]    _zz_359;
  wire       [0:0]    _zz_360;
  wire                _zz_361;
  wire       [0:0]    _zz_362;
  wire       [9:0]    _zz_363;
  wire       [31:0]   _zz_364;
  wire       [31:0]   _zz_365;
  wire       [31:0]   _zz_366;
  wire       [31:0]   _zz_367;
  wire       [31:0]   _zz_368;
  wire       [31:0]   _zz_369;
  wire       [31:0]   _zz_370;
  wire       [31:0]   _zz_371;
  wire                _zz_372;
  wire                _zz_373;
  wire       [0:0]    _zz_374;
  wire       [1:0]    _zz_375;
  wire       [5:0]    _zz_376;
  wire       [5:0]    _zz_377;
  wire                _zz_378;
  wire       [0:0]    _zz_379;
  wire       [6:0]    _zz_380;
  wire       [31:0]   _zz_381;
  wire       [31:0]   _zz_382;
  wire       [31:0]   _zz_383;
  wire       [31:0]   _zz_384;
  wire                _zz_385;
  wire       [0:0]    _zz_386;
  wire       [2:0]    _zz_387;
  wire                _zz_388;
  wire       [0:0]    _zz_389;
  wire       [0:0]    _zz_390;
  wire       [1:0]    _zz_391;
  wire       [1:0]    _zz_392;
  wire                _zz_393;
  wire       [0:0]    _zz_394;
  wire       [3:0]    _zz_395;
  wire       [31:0]   _zz_396;
  wire       [31:0]   _zz_397;
  wire       [31:0]   _zz_398;
  wire                _zz_399;
  wire       [0:0]    _zz_400;
  wire       [0:0]    _zz_401;
  wire       [31:0]   _zz_402;
  wire       [31:0]   _zz_403;
  wire       [31:0]   _zz_404;
  wire                _zz_405;
  wire                _zz_406;
  wire                _zz_407;
  wire       [3:0]    _zz_408;
  wire       [3:0]    _zz_409;
  wire                _zz_410;
  wire       [0:0]    _zz_411;
  wire       [1:0]    _zz_412;
  wire       [31:0]   _zz_413;
  wire       [31:0]   _zz_414;
  wire       [31:0]   _zz_415;
  wire       [31:0]   _zz_416;
  wire       [31:0]   _zz_417;
  wire       [31:0]   _zz_418;
  wire       [31:0]   _zz_419;
  wire       [31:0]   _zz_420;
  wire                _zz_421;
  wire       [0:0]    _zz_422;
  wire       [1:0]    _zz_423;
  wire                _zz_424;
  wire       [2:0]    _zz_425;
  wire       [2:0]    _zz_426;
  wire                _zz_427;
  wire                _zz_428;
  wire       [31:0]   _zz_429;
  wire       [31:0]   _zz_430;
  wire       [31:0]   _zz_431;
  wire       [31:0]   _zz_432;
  wire       [31:0]   _zz_433;
  wire       [31:0]   _zz_434;
  wire       [31:0]   _zz_435;
  wire                _zz_436;
  wire                _zz_437;
  wire                _zz_438;
  wire                _zz_439;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire                writeBack_CfuPlugin_CFU_IN_FLIGHT;
  wire                execute_CfuPlugin_CFU_IN_FLIGHT;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [31:0]   decode_RS2;
  wire       [31:0]   decode_RS1;
  wire                decode_IS_DIV;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_MUL;
  wire       `Input2Kind_defaultEncoding_type decode_CfuPlugin_CFU_INPUT_2_KIND;
  wire       `Input2Kind_defaultEncoding_type _zz_1;
  wire       `Input2Kind_defaultEncoding_type _zz_2;
  wire       `Input2Kind_defaultEncoding_type _zz_3;
  wire                decode_CfuPlugin_CFU_ENABLE;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_4;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_5;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_6;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_7;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_8;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_9;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_10;
  wire                decode_IS_CSR;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_11;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_12;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_13;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_14;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_15;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_16;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_17;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_18;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_19;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_20;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_21;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_22;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_23;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_24;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_25;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_26;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_27;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_28;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_MUL;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                memory_IS_MUL;
  reg                 _zz_29;
  reg                 _zz_30;
  reg        [31:0]   _zz_31;
  wire                memory_CfuPlugin_CFU_IN_FLIGHT;
  wire       `Input2Kind_defaultEncoding_type execute_CfuPlugin_CFU_INPUT_2_KIND;
  wire       `Input2Kind_defaultEncoding_type _zz_32;
  wire                execute_CfuPlugin_CFU_ENABLE;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_33;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_34;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_35;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_36;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   _zz_37;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_38;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_39;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_40;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_41;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_42;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_43;
  wire       [31:0]   _zz_44;
  wire                _zz_45;
  reg                 _zz_46;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `Input2Kind_defaultEncoding_type _zz_47;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_48;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_49;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_50;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_51;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_52;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_53;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_54;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_55;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MMU_FAULT;
  wire       [31:0]   memory_MMU_RSP2_physicalAddress;
  wire                memory_MMU_RSP2_isIoAccess;
  wire                memory_MMU_RSP2_isPaging;
  wire                memory_MMU_RSP2_allowRead;
  wire                memory_MMU_RSP2_allowWrite;
  wire                memory_MMU_RSP2_allowExecute;
  wire                memory_MMU_RSP2_exception;
  wire                memory_MMU_RSP2_refilling;
  wire                memory_MMU_RSP2_bypassTranslation;
  wire       [31:0]   memory_PC;
  wire                memory_ALIGNEMENT_FAULT;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
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
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire                decode_MEMORY_ENABLE;
  reg        [31:0]   _zz_56;
  reg        [31:0]   _zz_57;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  reg                 memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  wire       [31:0]   iBus_cmd_payload_pc;
  wire                iBus_rsp_valid;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   iBus_rsp_payload_inst;
  wire                IBusSimplePlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusSimplePlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusSimplePlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusSimplePlugin_mmuBus_cmd_0_isValid;
  wire                IBusSimplePlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusSimplePlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusSimplePlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   IBusSimplePlugin_mmuBus_rsp_physicalAddress;
  wire                IBusSimplePlugin_mmuBus_rsp_isIoAccess;
  wire                IBusSimplePlugin_mmuBus_rsp_isPaging;
  wire                IBusSimplePlugin_mmuBus_rsp_allowRead;
  wire                IBusSimplePlugin_mmuBus_rsp_allowWrite;
  wire                IBusSimplePlugin_mmuBus_rsp_allowExecute;
  wire                IBusSimplePlugin_mmuBus_rsp_exception;
  wire                IBusSimplePlugin_mmuBus_rsp_refilling;
  wire                IBusSimplePlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusSimplePlugin_mmuBus_end;
  wire                IBusSimplePlugin_mmuBus_busy;
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
  reg                 BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                externalInterrupt;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CfuPlugin_joinException_valid;
  wire       [3:0]    CfuPlugin_joinException_payload_code;
  wire       [31:0]   CfuPlugin_joinException_payload_badAddr;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_58;
  wire       [2:0]    _zz_59;
  wire                _zz_60;
  wire                _zz_61;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  wire                IBusSimplePlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusSimplePlugin_fetchPc_redo_payload;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  reg                 IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_62;
  wire                _zz_63;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_64;
  wire                _zz_65;
  reg                 _zz_66;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_67;
  reg        [31:0]   _zz_68;
  reg                 _zz_69;
  reg        [31:0]   _zz_70;
  reg                 _zz_71;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_4;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  reg                 IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  reg        [31:0]   IBusSimplePlugin_mmu_joinCtx_physicalAddress;
  reg                 IBusSimplePlugin_mmu_joinCtx_isIoAccess;
  reg                 IBusSimplePlugin_mmu_joinCtx_isPaging;
  reg                 IBusSimplePlugin_mmu_joinCtx_allowRead;
  reg                 IBusSimplePlugin_mmu_joinCtx_allowWrite;
  reg                 IBusSimplePlugin_mmu_joinCtx_allowExecute;
  reg                 IBusSimplePlugin_mmu_joinCtx_exception;
  reg                 IBusSimplePlugin_mmu_joinCtx_refilling;
  reg                 IBusSimplePlugin_mmu_joinCtx_bypassTranslation;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  reg                 IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_72;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [1:0]    dBus_cmd_payload_size;
  wire                dBus_rsp_ready;
  wire                dBus_rsp_error;
  wire       [31:0]   dBus_rsp_data;
  wire                _zz_73;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_74;
  reg        [3:0]    _zz_75;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_76;
  reg        [31:0]   _zz_77;
  wire                _zz_78;
  reg        [31:0]   _zz_79;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [32:0]   _zz_80;
  wire                _zz_81;
  wire                _zz_82;
  wire                _zz_83;
  wire                _zz_84;
  wire                _zz_85;
  wire                _zz_86;
  wire                _zz_87;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_88;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_89;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_90;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_91;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_92;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_93;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_94;
  wire       `Input2Kind_defaultEncoding_type _zz_95;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_96;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_97;
  reg        [31:0]   _zz_98;
  wire                _zz_99;
  reg        [19:0]   _zz_100;
  wire                _zz_101;
  reg        [19:0]   _zz_102;
  reg        [31:0]   _zz_103;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  reg        [31:0]   _zz_104;
  reg                 _zz_105;
  reg                 _zz_106;
  reg                 _zz_107;
  reg        [4:0]    _zz_108;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_109;
  reg                 _zz_110;
  reg                 _zz_111;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_112;
  reg        [10:0]   _zz_113;
  wire                _zz_114;
  reg        [19:0]   _zz_115;
  wire                _zz_116;
  reg        [18:0]   _zz_117;
  reg        [31:0]   _zz_118;
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
  wire                _zz_119;
  wire                _zz_120;
  wire                _zz_121;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_122;
  wire                _zz_123;
  wire       [1:0]    _zz_124;
  wire                _zz_125;
  wire       [1:0]    _zz_126;
  wire                _zz_127;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
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
  wire                execute_CfuPlugin_schedule;
  reg                 execute_CfuPlugin_hold;
  reg                 execute_CfuPlugin_fired;
  wire       [9:0]    execute_CfuPlugin_functionsIds_0;
  wire                _zz_128;
  reg        [23:0]   _zz_129;
  reg        [31:0]   _zz_130;
  wire                memory_CfuPlugin_rsp_valid;
  reg                 memory_CfuPlugin_rsp_ready;
  wire                memory_CfuPlugin_rsp_payload_response_ok;
  wire       [31:0]   memory_CfuPlugin_rsp_payload_outputs_0;
  reg                 CfuPlugin_bus_rsp_s2mPipe_rValid;
  reg                 CfuPlugin_bus_rsp_s2mPipe_rData_response_ok;
  reg        [31:0]   CfuPlugin_bus_rsp_s2mPipe_rData_outputs_0;
  reg        [32:0]   memory_MulDivIterativePlugin_rs1;
  reg        [31:0]   memory_MulDivIterativePlugin_rs2;
  reg        [64:0]   memory_MulDivIterativePlugin_accumulator;
  wire                memory_MulDivIterativePlugin_frontendOk;
  reg                 memory_MulDivIterativePlugin_mul_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_mul_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_mul_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_mul_counter_value;
  wire                memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_mul_counter_willOverflow;
  reg                 memory_MulDivIterativePlugin_div_needRevert;
  reg                 memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_div_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_value;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg                 memory_MulDivIterativePlugin_div_done;
  reg        [31:0]   memory_MulDivIterativePlugin_div_result;
  wire       [31:0]   _zz_131;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_132;
  wire                _zz_133;
  wire                _zz_134;
  reg        [32:0]   _zz_135;
  reg        [31:0]   externalInterruptArray_regNext;
  reg        [31:0]   _zz_136;
  wire       [31:0]   _zz_137;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  reg                 DebugPlugin_haltedByBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_138;
  wire                DebugPlugin_allowEBreak;
  reg                 DebugPlugin_resetIt_regNext;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg                 decode_to_execute_CfuPlugin_CFU_ENABLE;
  reg        `Input2Kind_defaultEncoding_type decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 decode_to_execute_DO_EBREAK;
  reg                 execute_to_memory_ALIGNEMENT_FAULT;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg                 execute_to_memory_MMU_FAULT;
  reg        [31:0]   execute_to_memory_MMU_RSP2_physicalAddress;
  reg                 execute_to_memory_MMU_RSP2_isIoAccess;
  reg                 execute_to_memory_MMU_RSP2_isPaging;
  reg                 execute_to_memory_MMU_RSP2_allowRead;
  reg                 execute_to_memory_MMU_RSP2_allowWrite;
  reg                 execute_to_memory_MMU_RSP2_allowExecute;
  reg                 execute_to_memory_MMU_RSP2_exception;
  reg                 execute_to_memory_MMU_RSP2_refilling;
  reg                 execute_to_memory_MMU_RSP2_bypassTranslation;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 execute_to_memory_CfuPlugin_CFU_IN_FLIGHT;
  reg                 memory_to_writeBack_CfuPlugin_CFU_IN_FLIGHT;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg        [2:0]    _zz_139;
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
  reg        [31:0]   _zz_140;
  reg        [31:0]   _zz_141;
  reg        [31:0]   _zz_142;
  reg        [31:0]   _zz_143;
  reg        [31:0]   _zz_144;
  reg        [31:0]   _zz_145;
  reg        [31:0]   _zz_146;
  reg        [31:0]   _zz_147;
  reg        [31:0]   _zz_148;
  reg        [31:0]   _zz_149;
  wire                iBus_cmd_m2sPipe_valid;
  wire                iBus_cmd_m2sPipe_ready;
  wire       [31:0]   iBus_cmd_m2sPipe_payload_pc;
  reg                 iBus_cmd_m2sPipe_rValid;
  reg        [31:0]   iBus_cmd_m2sPipe_rData_pc;
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
  reg        [3:0]    _zz_150;
  `ifndef SYNTHESIS
  reg [39:0] decode_CfuPlugin_CFU_INPUT_2_KIND_string;
  reg [39:0] _zz_1_string;
  reg [39:0] _zz_2_string;
  reg [39:0] _zz_3_string;
  reg [39:0] _zz_4_string;
  reg [39:0] _zz_5_string;
  reg [39:0] _zz_6_string;
  reg [39:0] _zz_7_string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_8_string;
  reg [39:0] _zz_9_string;
  reg [39:0] _zz_10_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_11_string;
  reg [31:0] _zz_12_string;
  reg [31:0] _zz_13_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_14_string;
  reg [71:0] _zz_15_string;
  reg [71:0] _zz_16_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_17_string;
  reg [39:0] _zz_18_string;
  reg [39:0] _zz_19_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_20_string;
  reg [23:0] _zz_21_string;
  reg [23:0] _zz_22_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_23_string;
  reg [63:0] _zz_24_string;
  reg [63:0] _zz_25_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_26_string;
  reg [95:0] _zz_27_string;
  reg [95:0] _zz_28_string;
  reg [39:0] execute_CfuPlugin_CFU_INPUT_2_KIND_string;
  reg [39:0] _zz_32_string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_33_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_34_string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_35_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_36_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_38_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_40_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_41_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_42_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_43_string;
  reg [39:0] _zz_47_string;
  reg [39:0] _zz_48_string;
  reg [31:0] _zz_49_string;
  reg [71:0] _zz_50_string;
  reg [39:0] _zz_51_string;
  reg [23:0] _zz_52_string;
  reg [63:0] _zz_53_string;
  reg [95:0] _zz_54_string;
  reg [95:0] _zz_88_string;
  reg [63:0] _zz_89_string;
  reg [23:0] _zz_90_string;
  reg [39:0] _zz_91_string;
  reg [71:0] _zz_92_string;
  reg [31:0] _zz_93_string;
  reg [39:0] _zz_94_string;
  reg [39:0] _zz_95_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND_string;
  `endif

  (* ram_style = "block" *) reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_156 = (memory_arbitration_isValid && memory_IS_MUL);
  assign _zz_157 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_158 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  assign _zz_159 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_160 = ({decodeExceptionPort_valid,IBusSimplePlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_161 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_162 = ({CsrPlugin_selfException_valid,BranchPlugin_branchExceptionPort_valid} != 2'b00);
  assign _zz_163 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign _zz_164 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign _zz_165 = ({CfuPlugin_joinException_valid,DBusSimplePlugin_memoryExceptionPort_valid} != 2'b00);
  assign _zz_166 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_167 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_168 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_169 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_170 = ((IBusSimplePlugin_iBusRsp_stages_1_input_valid && (! IBusSimplePlugin_mmu_joinCtx_refilling)) && (IBusSimplePlugin_mmu_joinCtx_exception || (! IBusSimplePlugin_mmu_joinCtx_allowExecute)));
  assign _zz_171 = ((dBus_rsp_ready && dBus_rsp_error) && (! memory_MEMORY_STORE));
  assign _zz_172 = (! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers))));
  assign _zz_173 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_174 = (1'b1 || (! 1'b1));
  assign _zz_175 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_176 = (1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_177 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_178 = (1'b1 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_179 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_180 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_181 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_182 = (! memory_arbitration_isStuck);
  assign _zz_183 = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_184 = (! execute_arbitration_isStuckByOthers);
  assign _zz_185 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_186 = ((_zz_119 && 1'b1) && (! 1'b0));
  assign _zz_187 = ((_zz_120 && 1'b1) && (! 1'b0));
  assign _zz_188 = ((_zz_121 && 1'b1) && (! 1'b0));
  assign _zz_189 = (CfuPlugin_bus_rsp_ready && (! memory_CfuPlugin_rsp_ready));
  assign _zz_190 = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_191 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_192 = execute_INSTRUCTION[13];
  assign _zz_193 = _zz_80[31 : 31];
  assign _zz_194 = _zz_80[30 : 30];
  assign _zz_195 = _zz_80[29 : 29];
  assign _zz_196 = _zz_80[28 : 28];
  assign _zz_197 = _zz_80[26 : 26];
  assign _zz_198 = _zz_80[23 : 23];
  assign _zz_199 = _zz_80[15 : 15];
  assign _zz_200 = _zz_80[12 : 12];
  assign _zz_201 = _zz_80[11 : 11];
  assign _zz_202 = _zz_80[10 : 10];
  assign _zz_203 = _zz_80[32 : 32];
  assign _zz_204 = _zz_80[14 : 14];
  assign _zz_205 = _zz_80[4 : 4];
  assign _zz_206 = _zz_80[2 : 2];
  assign _zz_207 = _zz_80[18 : 18];
  assign _zz_208 = _zz_80[9 : 9];
  assign _zz_209 = _zz_80[3 : 3];
  assign _zz_210 = (_zz_58 - 3'b001);
  assign _zz_211 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_212 = {29'd0, _zz_211};
  assign _zz_213 = (IBusSimplePlugin_pending_value + _zz_215);
  assign _zz_214 = IBusSimplePlugin_pending_inc;
  assign _zz_215 = {2'd0, _zz_214};
  assign _zz_216 = IBusSimplePlugin_pending_dec;
  assign _zz_217 = {2'd0, _zz_216};
  assign _zz_218 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_219 = {2'd0, _zz_218};
  assign _zz_220 = IBusSimplePlugin_pending_dec;
  assign _zz_221 = {2'd0, _zz_220};
  assign _zz_222 = (memory_MEMORY_STORE ? 3'b110 : 3'b100);
  assign _zz_223 = execute_SRC_LESS;
  assign _zz_224 = 3'b100;
  assign _zz_225 = execute_INSTRUCTION[19 : 15];
  assign _zz_226 = execute_INSTRUCTION[31 : 20];
  assign _zz_227 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_228 = ($signed(_zz_229) + $signed(_zz_232));
  assign _zz_229 = ($signed(_zz_230) + $signed(_zz_231));
  assign _zz_230 = execute_SRC1;
  assign _zz_231 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_232 = (execute_SRC_USE_SUB_LESS ? _zz_233 : _zz_234);
  assign _zz_233 = 32'h00000001;
  assign _zz_234 = 32'h0;
  assign _zz_235 = (_zz_236 >>> 1);
  assign _zz_236 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_237 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_238 = execute_INSTRUCTION[31 : 20];
  assign _zz_239 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_240 = (_zz_122 & (~ _zz_241));
  assign _zz_241 = (_zz_122 - 2'b01);
  assign _zz_242 = (_zz_124 & (~ _zz_243));
  assign _zz_243 = (_zz_124 - 2'b01);
  assign _zz_244 = (_zz_126 & (~ _zz_245));
  assign _zz_245 = (_zz_126 - 2'b01);
  assign _zz_246 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[14 : 12]};
  assign _zz_247 = execute_INSTRUCTION[31 : 24];
  assign _zz_248 = memory_MulDivIterativePlugin_mul_counter_willIncrement;
  assign _zz_249 = {5'd0, _zz_248};
  assign _zz_250 = (_zz_252 + _zz_254);
  assign _zz_251 = (memory_MulDivIterativePlugin_rs2[0] ? memory_MulDivIterativePlugin_rs1 : 33'h0);
  assign _zz_252 = {{1{_zz_251[32]}}, _zz_251};
  assign _zz_253 = _zz_255;
  assign _zz_254 = {{1{_zz_253[32]}}, _zz_253};
  assign _zz_255 = (memory_MulDivIterativePlugin_accumulator >>> 32);
  assign _zz_256 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_257 = {5'd0, _zz_256};
  assign _zz_258 = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_259 = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_260 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_261 = {_zz_131,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_262 = _zz_263;
  assign _zz_263 = _zz_264;
  assign _zz_264 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_132) : _zz_132)} + _zz_266);
  assign _zz_265 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_266 = {32'd0, _zz_265};
  assign _zz_267 = _zz_134;
  assign _zz_268 = {32'd0, _zz_267};
  assign _zz_269 = _zz_133;
  assign _zz_270 = {31'd0, _zz_269};
  assign _zz_271 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_272 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_273 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_274 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_275 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_276 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_277 = 1'b1;
  assign _zz_278 = 1'b1;
  assign _zz_279 = {_zz_61,_zz_60};
  assign _zz_280 = 32'h0000106f;
  assign _zz_281 = (decode_INSTRUCTION & 32'h0000107f);
  assign _zz_282 = 32'h00001073;
  assign _zz_283 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002073);
  assign _zz_284 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_285 = {((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013),{((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & _zz_286) == 32'h00000003),{(_zz_287 == _zz_288),{_zz_289,{_zz_290,_zz_291}}}}}};
  assign _zz_286 = 32'h0000207f;
  assign _zz_287 = (decode_INSTRUCTION & 32'h0000505f);
  assign _zz_288 = 32'h00000003;
  assign _zz_289 = ((decode_INSTRUCTION & 32'h0000707b) == 32'h00000063);
  assign _zz_290 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_291 = {((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'hfc00305f) == 32'h00001013),{((decode_INSTRUCTION & _zz_292) == 32'h00005013),{(_zz_293 == _zz_294),{_zz_295,{_zz_296,_zz_297}}}}}};
  assign _zz_292 = 32'hbc00707f;
  assign _zz_293 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_294 = 32'h00005033;
  assign _zz_295 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_296 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_297 = {((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073),((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073)};
  assign _zz_298 = 32'h10103050;
  assign _zz_299 = (decode_INSTRUCTION & 32'h02004064);
  assign _zz_300 = 32'h02004020;
  assign _zz_301 = _zz_87;
  assign _zz_302 = _zz_86;
  assign _zz_303 = {_zz_87,{_zz_85,_zz_86}};
  assign _zz_304 = 3'b000;
  assign _zz_305 = (((decode_INSTRUCTION & _zz_308) == 32'h02000030) != 1'b0);
  assign _zz_306 = 1'b0;
  assign _zz_307 = {(_zz_84 != 1'b0),{(_zz_309 != _zz_310),{_zz_311,{_zz_312,_zz_313}}}};
  assign _zz_308 = 32'h02004074;
  assign _zz_309 = ((decode_INSTRUCTION & 32'h10103050) == 32'h00000050);
  assign _zz_310 = 1'b0;
  assign _zz_311 = (((decode_INSTRUCTION & _zz_314) == 32'h10000050) != 1'b0);
  assign _zz_312 = ({_zz_315,_zz_316} != 2'b00);
  assign _zz_313 = {({_zz_317,_zz_318} != 2'b00),{(_zz_319 != _zz_320),{_zz_321,{_zz_322,_zz_323}}}};
  assign _zz_314 = 32'h10403050;
  assign _zz_315 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_316 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_317 = _zz_83;
  assign _zz_318 = ((decode_INSTRUCTION & _zz_324) == 32'h00000004);
  assign _zz_319 = ((decode_INSTRUCTION & _zz_325) == 32'h00000040);
  assign _zz_320 = 1'b0;
  assign _zz_321 = ({_zz_326,_zz_327} != 2'b00);
  assign _zz_322 = ({_zz_328,_zz_329} != 3'b000);
  assign _zz_323 = {(_zz_330 != _zz_331),{_zz_332,{_zz_333,_zz_334}}};
  assign _zz_324 = 32'h0000001c;
  assign _zz_325 = 32'h00000058;
  assign _zz_326 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00005010);
  assign _zz_327 = ((decode_INSTRUCTION & 32'h02007064) == 32'h00005020);
  assign _zz_328 = ((decode_INSTRUCTION & _zz_335) == 32'h40001010);
  assign _zz_329 = {(_zz_336 == _zz_337),(_zz_338 == _zz_339)};
  assign _zz_330 = {(_zz_340 == _zz_341),{_zz_342,_zz_343}};
  assign _zz_331 = 3'b000;
  assign _zz_332 = ((_zz_344 == _zz_345) != 1'b0);
  assign _zz_333 = (_zz_85 != 1'b0);
  assign _zz_334 = {(_zz_346 != _zz_347),{_zz_348,{_zz_349,_zz_350}}};
  assign _zz_335 = 32'h40003054;
  assign _zz_336 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz_337 = 32'h00001010;
  assign _zz_338 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz_339 = 32'h00001010;
  assign _zz_340 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_341 = 32'h00000024;
  assign _zz_342 = ((decode_INSTRUCTION & 32'h00003034) == 32'h00001010);
  assign _zz_343 = ((decode_INSTRUCTION & 32'h02003054) == 32'h00001010);
  assign _zz_344 = (decode_INSTRUCTION & 32'h00001000);
  assign _zz_345 = 32'h00001000;
  assign _zz_346 = {(_zz_351 == _zz_352),(_zz_353 == _zz_354)};
  assign _zz_347 = 2'b00;
  assign _zz_348 = ({_zz_84,{_zz_355,_zz_356}} != 3'b000);
  assign _zz_349 = ({_zz_357,_zz_358} != 3'b000);
  assign _zz_350 = {(_zz_359 != _zz_360),{_zz_361,{_zz_362,_zz_363}}};
  assign _zz_351 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_352 = 32'h00002000;
  assign _zz_353 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_354 = 32'h00001000;
  assign _zz_355 = ((decode_INSTRUCTION & _zz_364) == 32'h00000020);
  assign _zz_356 = ((decode_INSTRUCTION & _zz_365) == 32'h00000020);
  assign _zz_357 = ((decode_INSTRUCTION & _zz_366) == 32'h00000040);
  assign _zz_358 = {(_zz_367 == _zz_368),(_zz_369 == _zz_370)};
  assign _zz_359 = ((decode_INSTRUCTION & _zz_371) == 32'h00000020);
  assign _zz_360 = 1'b0;
  assign _zz_361 = ({_zz_372,_zz_373} != 2'b00);
  assign _zz_362 = ({_zz_374,_zz_375} != 3'b000);
  assign _zz_363 = {(_zz_376 != _zz_377),{_zz_378,{_zz_379,_zz_380}}};
  assign _zz_364 = 32'h00000034;
  assign _zz_365 = 32'h00000064;
  assign _zz_366 = 32'h00000050;
  assign _zz_367 = (decode_INSTRUCTION & 32'h00000038);
  assign _zz_368 = 32'h0;
  assign _zz_369 = (decode_INSTRUCTION & 32'h00103040);
  assign _zz_370 = 32'h00000040;
  assign _zz_371 = 32'h00000020;
  assign _zz_372 = ((decode_INSTRUCTION & 32'h00000008) == 32'h00000008);
  assign _zz_373 = ((decode_INSTRUCTION & 32'h00000010) == 32'h00000010);
  assign _zz_374 = _zz_82;
  assign _zz_375 = {(_zz_381 == _zz_382),(_zz_383 == _zz_384)};
  assign _zz_376 = {_zz_83,{_zz_385,{_zz_386,_zz_387}}};
  assign _zz_377 = 6'h0;
  assign _zz_378 = ({_zz_82,_zz_388} != 2'b00);
  assign _zz_379 = ({_zz_389,_zz_390} != 2'b00);
  assign _zz_380 = {(_zz_391 != _zz_392),{_zz_393,{_zz_394,_zz_395}}};
  assign _zz_381 = (decode_INSTRUCTION & 32'h00000030);
  assign _zz_382 = 32'h00000010;
  assign _zz_383 = (decode_INSTRUCTION & 32'h02000060);
  assign _zz_384 = 32'h00000020;
  assign _zz_385 = ((decode_INSTRUCTION & _zz_396) == 32'h00001010);
  assign _zz_386 = (_zz_397 == _zz_398);
  assign _zz_387 = {_zz_399,{_zz_400,_zz_401}};
  assign _zz_388 = ((decode_INSTRUCTION & _zz_402) == 32'h00000020);
  assign _zz_389 = _zz_82;
  assign _zz_390 = (_zz_403 == _zz_404);
  assign _zz_391 = {_zz_405,_zz_406};
  assign _zz_392 = 2'b00;
  assign _zz_393 = (_zz_407 != 1'b0);
  assign _zz_394 = (_zz_408 != _zz_409);
  assign _zz_395 = {_zz_410,{_zz_411,_zz_412}};
  assign _zz_396 = 32'h00001010;
  assign _zz_397 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_398 = 32'h00002010;
  assign _zz_399 = ((decode_INSTRUCTION & _zz_413) == 32'h00000010);
  assign _zz_400 = (_zz_414 == _zz_415);
  assign _zz_401 = (_zz_416 == _zz_417);
  assign _zz_402 = 32'h00000070;
  assign _zz_403 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_404 = 32'h0;
  assign _zz_405 = ((decode_INSTRUCTION & _zz_418) == 32'h00006010);
  assign _zz_406 = ((decode_INSTRUCTION & _zz_419) == 32'h00004010);
  assign _zz_407 = ((decode_INSTRUCTION & _zz_420) == 32'h00002010);
  assign _zz_408 = {_zz_421,{_zz_422,_zz_423}};
  assign _zz_409 = 4'b0000;
  assign _zz_410 = (_zz_424 != 1'b0);
  assign _zz_411 = (_zz_425 != _zz_426);
  assign _zz_412 = {_zz_427,_zz_428};
  assign _zz_413 = 32'h00000050;
  assign _zz_414 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz_415 = 32'h00000004;
  assign _zz_416 = (decode_INSTRUCTION & 32'h00000024);
  assign _zz_417 = 32'h0;
  assign _zz_418 = 32'h00006014;
  assign _zz_419 = 32'h00005014;
  assign _zz_420 = 32'h00006014;
  assign _zz_421 = ((decode_INSTRUCTION & 32'h00000044) == 32'h0);
  assign _zz_422 = ((decode_INSTRUCTION & _zz_429) == 32'h0);
  assign _zz_423 = {(_zz_430 == _zz_431),(_zz_432 == _zz_433)};
  assign _zz_424 = ((decode_INSTRUCTION & 32'h00000058) == 32'h0);
  assign _zz_425 = {(_zz_434 == _zz_435),{_zz_436,_zz_437}};
  assign _zz_426 = 3'b000;
  assign _zz_427 = ({_zz_438,_zz_81} != 2'b00);
  assign _zz_428 = ({_zz_439,_zz_81} != 2'b00);
  assign _zz_429 = 32'h00000018;
  assign _zz_430 = (decode_INSTRUCTION & 32'h00006004);
  assign _zz_431 = 32'h00002000;
  assign _zz_432 = (decode_INSTRUCTION & 32'h00005004);
  assign _zz_433 = 32'h00001000;
  assign _zz_434 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_435 = 32'h00000040;
  assign _zz_436 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz_437 = ((decode_INSTRUCTION & 32'h40004034) == 32'h40000030);
  assign _zz_438 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_439 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  always @ (posedge clk) begin
    if(_zz_277) begin
      _zz_153 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_278) begin
      _zz_154 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_46) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_151                                                         ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_152                                                         ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk                      (clk                                                             ), //i
    .reset                    (reset                                                           )  //i
  );
  always @(*) begin
    case(_zz_279)
      2'b00 : begin
        _zz_155 = CsrPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_155 = DBusSimplePlugin_redoBranch_payload;
      end
      default : begin
        _zz_155 = BranchPlugin_jumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_CfuPlugin_CFU_INPUT_2_KIND)
      `Input2Kind_defaultEncoding_RS : decode_CfuPlugin_CFU_INPUT_2_KIND_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : decode_CfuPlugin_CFU_INPUT_2_KIND_string = "IMM_I";
      default : decode_CfuPlugin_CFU_INPUT_2_KIND_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_1)
      `Input2Kind_defaultEncoding_RS : _zz_1_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : _zz_1_string = "IMM_I";
      default : _zz_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `Input2Kind_defaultEncoding_RS : _zz_2_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : _zz_2_string = "IMM_I";
      default : _zz_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `Input2Kind_defaultEncoding_RS : _zz_3_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : _zz_3_string = "IMM_I";
      default : _zz_3_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_4_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_4_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_4_string = "ECALL";
      default : _zz_4_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_5_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_5_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_5_string = "ECALL";
      default : _zz_5_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_6_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_6_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_6_string = "ECALL";
      default : _zz_6_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_7_string = "ECALL";
      default : _zz_7_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL";
      default : decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_8_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_8_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_8_string = "ECALL";
      default : _zz_8_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_9_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_9_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_9_string = "ECALL";
      default : _zz_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_10_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_10_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_10_string = "ECALL";
      default : _zz_10_string = "?????";
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
    case(_zz_11)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_11_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_11_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_11_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_11_string = "JALR";
      default : _zz_11_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_12_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_12_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_12_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_12_string = "JALR";
      default : _zz_12_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_13_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_13_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_13_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_13_string = "JALR";
      default : _zz_13_string = "????";
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
    case(_zz_14)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_14_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_14_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_14_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_14_string = "SRA_1    ";
      default : _zz_14_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_15_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_15_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_15_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_15_string = "SRA_1    ";
      default : _zz_15_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_16_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_16_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_16_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_16_string = "SRA_1    ";
      default : _zz_16_string = "?????????";
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
    case(_zz_17)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_17_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_17_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_17_string = "AND_1";
      default : _zz_17_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_18_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_18_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_18_string = "AND_1";
      default : _zz_18_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_19_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_19_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_19_string = "AND_1";
      default : _zz_19_string = "?????";
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
    case(_zz_20)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_20_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_20_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_20_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_20_string = "PC ";
      default : _zz_20_string = "???";
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
    case(_zz_22)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_22_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_22_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_22_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_22_string = "PC ";
      default : _zz_22_string = "???";
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
    case(_zz_23)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_23_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_23_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_23_string = "BITWISE ";
      default : _zz_23_string = "????????";
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
    case(_zz_25)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_25_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_25_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_25_string = "BITWISE ";
      default : _zz_25_string = "????????";
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
    case(_zz_26)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_26_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_26_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_26_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_26_string = "URS1        ";
      default : _zz_26_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_27_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_27_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_27_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_27_string = "URS1        ";
      default : _zz_27_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_28_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_28_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_28_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_28_string = "URS1        ";
      default : _zz_28_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_CfuPlugin_CFU_INPUT_2_KIND)
      `Input2Kind_defaultEncoding_RS : execute_CfuPlugin_CFU_INPUT_2_KIND_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : execute_CfuPlugin_CFU_INPUT_2_KIND_string = "IMM_I";
      default : execute_CfuPlugin_CFU_INPUT_2_KIND_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_32)
      `Input2Kind_defaultEncoding_RS : _zz_32_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : _zz_32_string = "IMM_I";
      default : _zz_32_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_33)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_33_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_33_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_33_string = "ECALL";
      default : _zz_33_string = "?????";
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
    case(_zz_34)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_34_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_34_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_34_string = "ECALL";
      default : _zz_34_string = "?????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : writeBack_ENV_CTRL_string = "ECALL";
      default : writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_35_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_35_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_35_string = "ECALL";
      default : _zz_35_string = "?????";
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
    case(_zz_36)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_36_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_36_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_36_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_36_string = "JALR";
      default : _zz_36_string = "????";
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
    case(_zz_38)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_38_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_38_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_38_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_38_string = "SRA_1    ";
      default : _zz_38_string = "?????????";
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
    case(_zz_40)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_40_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_40_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_40_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_40_string = "PC ";
      default : _zz_40_string = "???";
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
    case(_zz_41)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_41_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_41_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_41_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_41_string = "URS1        ";
      default : _zz_41_string = "????????????";
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
    case(_zz_42)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_42_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_42_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_42_string = "BITWISE ";
      default : _zz_42_string = "????????";
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
    case(_zz_43)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_43_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_43_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_43_string = "AND_1";
      default : _zz_43_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      `Input2Kind_defaultEncoding_RS : _zz_47_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : _zz_47_string = "IMM_I";
      default : _zz_47_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_48)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_48_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_48_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_48_string = "ECALL";
      default : _zz_48_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_49_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_49_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_49_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_49_string = "JALR";
      default : _zz_49_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_50)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_50_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_50_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_50_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_50_string = "SRA_1    ";
      default : _zz_50_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_51)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_51_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_51_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_51_string = "AND_1";
      default : _zz_51_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_52)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_52_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_52_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_52_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_52_string = "PC ";
      default : _zz_52_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_53)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_53_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_53_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_53_string = "BITWISE ";
      default : _zz_53_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_54)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_54_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_54_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_54_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_54_string = "URS1        ";
      default : _zz_54_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_88)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_88_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_88_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_88_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_88_string = "URS1        ";
      default : _zz_88_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_89)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_89_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_89_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_89_string = "BITWISE ";
      default : _zz_89_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_90)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_90_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_90_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_90_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_90_string = "PC ";
      default : _zz_90_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_91)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_91_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_91_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_91_string = "AND_1";
      default : _zz_91_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_92)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_92_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_92_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_92_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_92_string = "SRA_1    ";
      default : _zz_92_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_93)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_93_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_93_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_93_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_93_string = "JALR";
      default : _zz_93_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_94)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_94_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_94_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_94_string = "ECALL";
      default : _zz_94_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_95)
      `Input2Kind_defaultEncoding_RS : _zz_95_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : _zz_95_string = "IMM_I";
      default : _zz_95_string = "?????";
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
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
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
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL";
      default : execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND)
      `Input2Kind_defaultEncoding_RS : decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND_string = "RS   ";
      `Input2Kind_defaultEncoding_IMM_I : decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND_string = "IMM_I";
      default : decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND_string = "?????";
    endcase
  end
  `endif

  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign writeBack_CfuPlugin_CFU_IN_FLIGHT = memory_to_writeBack_CfuPlugin_CFU_IN_FLIGHT;
  assign execute_CfuPlugin_CFU_IN_FLIGHT = ((execute_CfuPlugin_schedule || execute_CfuPlugin_hold) || execute_CfuPlugin_fired);
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_97;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_RS2 = decode_RegFilePlugin_rs2Data;
  assign decode_RS1 = decode_RegFilePlugin_rs1Data;
  assign decode_IS_DIV = _zz_193[0];
  assign decode_IS_RS2_SIGNED = _zz_194[0];
  assign decode_IS_RS1_SIGNED = _zz_195[0];
  assign decode_IS_MUL = _zz_196[0];
  assign decode_CfuPlugin_CFU_INPUT_2_KIND = _zz_1;
  assign _zz_2 = _zz_3;
  assign decode_CfuPlugin_CFU_ENABLE = _zz_197[0];
  assign _zz_4 = _zz_5;
  assign _zz_6 = _zz_7;
  assign decode_ENV_CTRL = _zz_8;
  assign _zz_9 = _zz_10;
  assign decode_IS_CSR = _zz_198[0];
  assign decode_BRANCH_CTRL = _zz_11;
  assign _zz_12 = _zz_13;
  assign decode_SHIFT_CTRL = _zz_14;
  assign _zz_15 = _zz_16;
  assign decode_ALU_BITWISE_CTRL = _zz_17;
  assign _zz_18 = _zz_19;
  assign decode_SRC_LESS_UNSIGNED = _zz_199[0];
  assign decode_MEMORY_STORE = _zz_200[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_201[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_202[0];
  assign decode_SRC2_CTRL = _zz_20;
  assign _zz_21 = _zz_22;
  assign decode_ALU_CTRL = _zz_23;
  assign _zz_24 = _zz_25;
  assign decode_SRC1_CTRL = _zz_26;
  assign _zz_27 = _zz_28;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_203[0];
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  always @ (*) begin
    _zz_29 = memory_CfuPlugin_CFU_IN_FLIGHT;
    if(memory_arbitration_isStuck)begin
      _zz_29 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_30 = execute_CfuPlugin_CFU_IN_FLIGHT;
    if(execute_arbitration_isStuck)begin
      _zz_30 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_31 = memory_REGFILE_WRITE_DATA;
    if(memory_CfuPlugin_CFU_IN_FLIGHT)begin
      _zz_31 = memory_CfuPlugin_rsp_payload_outputs_0;
    end
    if(_zz_156)begin
      _zz_31 = ((memory_INSTRUCTION[13 : 12] == 2'b00) ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_accumulator[63 : 32]);
    end
    if(_zz_157)begin
      _zz_31 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_CfuPlugin_CFU_IN_FLIGHT = execute_to_memory_CfuPlugin_CFU_IN_FLIGHT;
  assign execute_CfuPlugin_CFU_INPUT_2_KIND = _zz_32;
  assign execute_CfuPlugin_CFU_ENABLE = decode_to_execute_CfuPlugin_CFU_ENABLE;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_33;
  assign execute_ENV_CTRL = _zz_34;
  assign writeBack_ENV_CTRL = _zz_35;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_111;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_36;
  assign decode_RS2_USE = _zz_204[0];
  assign decode_RS1_USE = _zz_205[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_37 = execute_REGFILE_WRITE_DATA;
    if(_zz_158)begin
      _zz_37 = _zz_104;
    end
    if(_zz_159)begin
      _zz_37 = execute_CsrPlugin_readData;
    end
  end

  assign execute_SHIFT_CTRL = _zz_38;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_39 = execute_PC;
  assign execute_SRC2_CTRL = _zz_40;
  assign execute_SRC1_CTRL = _zz_41;
  assign decode_SRC_USE_SUB_LESS = _zz_206[0];
  assign decode_SRC_ADD_ZERO = _zz_207[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_42;
  assign execute_SRC2 = _zz_103;
  assign execute_SRC1 = _zz_98;
  assign execute_ALU_BITWISE_CTRL = _zz_43;
  assign _zz_44 = writeBack_INSTRUCTION;
  assign _zz_45 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_46 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_46 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_208[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000000b),{((decode_INSTRUCTION & _zz_280) == 32'h00000003),{(_zz_281 == _zz_282),{_zz_283,{_zz_284,_zz_285}}}}}}} != 21'h0);
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_55 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_55 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MMU_FAULT = execute_to_memory_MMU_FAULT;
  assign memory_MMU_RSP2_physicalAddress = execute_to_memory_MMU_RSP2_physicalAddress;
  assign memory_MMU_RSP2_isIoAccess = execute_to_memory_MMU_RSP2_isIoAccess;
  assign memory_MMU_RSP2_isPaging = execute_to_memory_MMU_RSP2_isPaging;
  assign memory_MMU_RSP2_allowRead = execute_to_memory_MMU_RSP2_allowRead;
  assign memory_MMU_RSP2_allowWrite = execute_to_memory_MMU_RSP2_allowWrite;
  assign memory_MMU_RSP2_allowExecute = execute_to_memory_MMU_RSP2_allowExecute;
  assign memory_MMU_RSP2_exception = execute_to_memory_MMU_RSP2_exception;
  assign memory_MMU_RSP2_refilling = execute_to_memory_MMU_RSP2_refilling;
  assign memory_MMU_RSP2_bypassTranslation = execute_to_memory_MMU_RSP2_bypassTranslation;
  assign memory_PC = execute_to_memory_PC;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
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
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = (((dBus_cmd_payload_size == 2'b10) && (dBus_cmd_payload_address[1 : 0] != 2'b00)) || ((dBus_cmd_payload_size == 2'b01) && (dBus_cmd_payload_address[0 : 0] != 1'b0)));
  assign decode_MEMORY_ENABLE = _zz_209[0];
  always @ (*) begin
    _zz_56 = execute_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_56 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_57 = memory_FORMAL_PC_NEXT;
    if(DBusSimplePlugin_redoBranch_valid)begin
      _zz_57 = DBusSimplePlugin_redoBranch_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusSimplePlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
    case(_zz_139)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_105 || _zz_106)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_160)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(_zz_160)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_73)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_158)begin
      if((! execute_LightShifterPlugin_done))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_159)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if((CfuPlugin_bus_cmd_valid && (! CfuPlugin_bus_cmd_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(_zz_161)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(_zz_162)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_161)begin
      if(_zz_163)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_162)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_161)begin
      if(_zz_163)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(memory_CfuPlugin_CFU_IN_FLIGHT)begin
      if((! memory_CfuPlugin_rsp_valid))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_156)begin
      if(((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc)))begin
        memory_arbitration_haltItself = 1'b1;
      end
      if(_zz_164)begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_157)begin
      if(((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(_zz_165)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_flushIt = 1'b0;
    if(DBusSimplePlugin_redoBranch_valid)begin
      memory_arbitration_flushIt = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(DBusSimplePlugin_redoBranch_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(_zz_165)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_166)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_167)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000))begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_166)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_167)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_161)begin
      if(_zz_163)begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_168)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_166)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_167)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_166)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_167)begin
      case(_zz_169)
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

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,DBusSimplePlugin_redoBranch_valid}} != 3'b000);
  assign _zz_58 = {BranchPlugin_jumpInterface_valid,{DBusSimplePlugin_redoBranch_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_59 = (_zz_58 & (~ _zz_210));
  assign _zz_60 = _zz_59[1];
  assign _zz_61 = _zz_59[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_155;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_fetchPc_redo_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_212);
    if(IBusSimplePlugin_fetchPc_redo_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_fetchPc_redo_payload;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_fetchPc_redo_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_mmu_joinCtx_refilling))begin
      IBusSimplePlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
    if(IBusSimplePlugin_iBusRsp_stages_0_input_valid)begin
      if(IBusSimplePlugin_mmuBus_rsp_refilling)begin
        IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
      end
      if(IBusSimplePlugin_mmuBus_rsp_exception)begin
        IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
      end
    end
  end

  assign _zz_62 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_62);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_62);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_63 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_63);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_63);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_fetchPc_redo_valid = IBusSimplePlugin_iBusRsp_redoFetch;
  assign IBusSimplePlugin_fetchPc_redo_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_64;
  assign _zz_64 = ((1'b0 && (! _zz_65)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_65 = _zz_66;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_65;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if((! IBusSimplePlugin_pcValids_0))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_iBusRsp_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_67;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_68;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_69;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_70;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_71;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(_zz_139)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_213 - _zz_217);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  always @ (*) begin
    IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
    if(IBusSimplePlugin_iBusRsp_stages_0_input_valid)begin
      if(IBusSimplePlugin_mmuBus_rsp_refilling)begin
        IBusSimplePlugin_cmd_valid = 1'b0;
      end
      if(IBusSimplePlugin_mmuBus_rsp_exception)begin
        IBusSimplePlugin_cmd_valid = 1'b0;
      end
    end
  end

  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_mmuBus_cmd_0_isValid = IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  assign IBusSimplePlugin_mmuBus_cmd_0_virtualAddress = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusSimplePlugin_mmuBus_end = ((IBusSimplePlugin_iBusRsp_stages_0_output_valid && IBusSimplePlugin_iBusRsp_stages_0_output_ready) || IBusSimplePlugin_externalFlush);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_mmuBus_rsp_physicalAddress[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_151 = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_151);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
    if(_zz_170)begin
      IBusSimplePlugin_rspJoin_exceptionDetected = 1'b1;
    end
  end

  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_72 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_72);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_72);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  always @ (*) begin
    IBusSimplePlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(_zz_170)begin
      IBusSimplePlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
  end

  assign IBusSimplePlugin_decodeExceptionPort_payload_badAddr = {IBusSimplePlugin_rspJoin_join_payload_pc[31 : 2],2'b00};
  assign IBusSimplePlugin_decodeExceptionPort_valid = (IBusSimplePlugin_rspJoin_exceptionDetected && IBusSimplePlugin_iBusRsp_readyForError);
  assign _zz_73 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
    if((execute_MMU_FAULT || execute_MMU_RSP2_refilling))begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_73));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_74 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_74 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_74 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_74;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_75 = 4'b0001;
      end
      2'b01 : begin
        _zz_75 = 4'b0011;
      end
      default : begin
        _zz_75 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_75 <<< dBus_cmd_payload_address[1 : 0]);
  assign DBusSimplePlugin_mmuBus_cmd_0_isValid = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign DBusSimplePlugin_mmuBus_cmd_0_isStuck = execute_arbitration_isStuck;
  assign DBusSimplePlugin_mmuBus_cmd_0_virtualAddress = execute_SRC_ADD;
  assign DBusSimplePlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign DBusSimplePlugin_mmuBus_end = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign dBus_cmd_payload_address = DBusSimplePlugin_mmuBus_rsp_physicalAddress;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(_zz_171)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_MMU_RSP2_refilling)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end else begin
      if(memory_MMU_FAULT)begin
        DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
      end
    end
    if(_zz_172)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(_zz_171)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = 4'b0101;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_222};
    end
    if(! memory_MMU_RSP2_refilling) begin
      if(memory_MMU_FAULT)begin
        DBusSimplePlugin_memoryExceptionPort_payload_code = (memory_MEMORY_STORE ? 4'b1111 : 4'b1101);
      end
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusSimplePlugin_redoBranch_valid = 1'b0;
    if(memory_MMU_RSP2_refilling)begin
      DBusSimplePlugin_redoBranch_valid = 1'b1;
    end
    if(_zz_172)begin
      DBusSimplePlugin_redoBranch_valid = 1'b0;
    end
  end

  assign DBusSimplePlugin_redoBranch_payload = memory_PC;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_76 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_77[31] = _zz_76;
    _zz_77[30] = _zz_76;
    _zz_77[29] = _zz_76;
    _zz_77[28] = _zz_76;
    _zz_77[27] = _zz_76;
    _zz_77[26] = _zz_76;
    _zz_77[25] = _zz_76;
    _zz_77[24] = _zz_76;
    _zz_77[23] = _zz_76;
    _zz_77[22] = _zz_76;
    _zz_77[21] = _zz_76;
    _zz_77[20] = _zz_76;
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
    _zz_77[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_78 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_79[31] = _zz_78;
    _zz_79[30] = _zz_78;
    _zz_79[29] = _zz_78;
    _zz_79[28] = _zz_78;
    _zz_79[27] = _zz_78;
    _zz_79[26] = _zz_78;
    _zz_79[25] = _zz_78;
    _zz_79[24] = _zz_78;
    _zz_79[23] = _zz_78;
    _zz_79[22] = _zz_78;
    _zz_79[21] = _zz_78;
    _zz_79[20] = _zz_78;
    _zz_79[19] = _zz_78;
    _zz_79[18] = _zz_78;
    _zz_79[17] = _zz_78;
    _zz_79[16] = _zz_78;
    _zz_79[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_191)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_77;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_79;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign IBusSimplePlugin_mmuBus_rsp_physicalAddress = IBusSimplePlugin_mmuBus_cmd_0_virtualAddress;
  assign IBusSimplePlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusSimplePlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusSimplePlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusSimplePlugin_mmuBus_rsp_isIoAccess = IBusSimplePlugin_mmuBus_rsp_physicalAddress[31];
  assign IBusSimplePlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusSimplePlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusSimplePlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusSimplePlugin_mmuBus_busy = 1'b0;
  assign DBusSimplePlugin_mmuBus_rsp_physicalAddress = DBusSimplePlugin_mmuBus_cmd_0_virtualAddress;
  assign DBusSimplePlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusSimplePlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusSimplePlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusSimplePlugin_mmuBus_rsp_isIoAccess = DBusSimplePlugin_mmuBus_rsp_physicalAddress[31];
  assign DBusSimplePlugin_mmuBus_rsp_isPaging = 1'b0;
  assign DBusSimplePlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusSimplePlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusSimplePlugin_mmuBus_busy = 1'b0;
  assign _zz_81 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_82 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_83 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_84 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000008);
  assign _zz_85 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_86 = ((decode_INSTRUCTION & 32'h00007000) == 32'h00001000);
  assign _zz_87 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00004000);
  assign _zz_80 = {(((decode_INSTRUCTION & _zz_298) == 32'h00100050) != 1'b0),{((_zz_299 == _zz_300) != 1'b0),{({_zz_301,_zz_302} != 2'b00),{(_zz_303 != _zz_304),{_zz_305,{_zz_306,_zz_307}}}}}};
  assign _zz_88 = _zz_80[1 : 0];
  assign _zz_54 = _zz_88;
  assign _zz_89 = _zz_80[6 : 5];
  assign _zz_53 = _zz_89;
  assign _zz_90 = _zz_80[8 : 7];
  assign _zz_52 = _zz_90;
  assign _zz_91 = _zz_80[17 : 16];
  assign _zz_51 = _zz_91;
  assign _zz_92 = _zz_80[20 : 19];
  assign _zz_50 = _zz_92;
  assign _zz_93 = _zz_80[22 : 21];
  assign _zz_49 = _zz_93;
  assign _zz_94 = _zz_80[25 : 24];
  assign _zz_48 = _zz_94;
  assign _zz_95 = _zz_80[27 : 27];
  assign _zz_47 = _zz_95;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_153;
  assign decode_RegFilePlugin_rs2Data = _zz_154;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_45 && writeBack_arbitration_isFiring);
    if(_zz_96)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_44[11 : 7];
    if(_zz_96)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_55;
    if(_zz_96)begin
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
        _zz_97 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_97 = {31'd0, _zz_223};
      end
      default : begin
        _zz_97 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_98 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_98 = {29'd0, _zz_224};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_98 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_98 = {27'd0, _zz_225};
      end
    endcase
  end

  assign _zz_99 = _zz_226[11];
  always @ (*) begin
    _zz_100[19] = _zz_99;
    _zz_100[18] = _zz_99;
    _zz_100[17] = _zz_99;
    _zz_100[16] = _zz_99;
    _zz_100[15] = _zz_99;
    _zz_100[14] = _zz_99;
    _zz_100[13] = _zz_99;
    _zz_100[12] = _zz_99;
    _zz_100[11] = _zz_99;
    _zz_100[10] = _zz_99;
    _zz_100[9] = _zz_99;
    _zz_100[8] = _zz_99;
    _zz_100[7] = _zz_99;
    _zz_100[6] = _zz_99;
    _zz_100[5] = _zz_99;
    _zz_100[4] = _zz_99;
    _zz_100[3] = _zz_99;
    _zz_100[2] = _zz_99;
    _zz_100[1] = _zz_99;
    _zz_100[0] = _zz_99;
  end

  assign _zz_101 = _zz_227[11];
  always @ (*) begin
    _zz_102[19] = _zz_101;
    _zz_102[18] = _zz_101;
    _zz_102[17] = _zz_101;
    _zz_102[16] = _zz_101;
    _zz_102[15] = _zz_101;
    _zz_102[14] = _zz_101;
    _zz_102[13] = _zz_101;
    _zz_102[12] = _zz_101;
    _zz_102[11] = _zz_101;
    _zz_102[10] = _zz_101;
    _zz_102[9] = _zz_101;
    _zz_102[8] = _zz_101;
    _zz_102[7] = _zz_101;
    _zz_102[6] = _zz_101;
    _zz_102[5] = _zz_101;
    _zz_102[4] = _zz_101;
    _zz_102[3] = _zz_101;
    _zz_102[2] = _zz_101;
    _zz_102[1] = _zz_101;
    _zz_102[0] = _zz_101;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_103 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_103 = {_zz_100,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_103 = {_zz_102,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_103 = _zz_39;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_228;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == 4'b0000);
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_104 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_104 = _zz_235;
      end
    endcase
  end

  always @ (*) begin
    _zz_105 = 1'b0;
    if(_zz_107)begin
      if((_zz_108 == decode_INSTRUCTION[19 : 15]))begin
        _zz_105 = 1'b1;
      end
    end
    if(_zz_173)begin
      if(_zz_174)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_105 = 1'b1;
        end
      end
    end
    if(_zz_175)begin
      if(_zz_176)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_105 = 1'b1;
        end
      end
    end
    if(_zz_177)begin
      if(_zz_178)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_105 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_105 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_106 = 1'b0;
    if(_zz_107)begin
      if((_zz_108 == decode_INSTRUCTION[24 : 20]))begin
        _zz_106 = 1'b1;
      end
    end
    if(_zz_173)begin
      if(_zz_174)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_106 = 1'b1;
        end
      end
    end
    if(_zz_175)begin
      if(_zz_176)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_106 = 1'b1;
        end
      end
    end
    if(_zz_177)begin
      if(_zz_178)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_106 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_106 = 1'b0;
    end
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_109 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_109 == 3'b000)) begin
        _zz_110 = execute_BranchPlugin_eq;
    end else if((_zz_109 == 3'b001)) begin
        _zz_110 = (! execute_BranchPlugin_eq);
    end else if((((_zz_109 & 3'b101) == 3'b101))) begin
        _zz_110 = (! execute_SRC_LESS);
    end else begin
        _zz_110 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_111 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_111 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_111 = 1'b1;
      end
      default : begin
        _zz_111 = _zz_110;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_112 = _zz_237[19];
  always @ (*) begin
    _zz_113[10] = _zz_112;
    _zz_113[9] = _zz_112;
    _zz_113[8] = _zz_112;
    _zz_113[7] = _zz_112;
    _zz_113[6] = _zz_112;
    _zz_113[5] = _zz_112;
    _zz_113[4] = _zz_112;
    _zz_113[3] = _zz_112;
    _zz_113[2] = _zz_112;
    _zz_113[1] = _zz_112;
    _zz_113[0] = _zz_112;
  end

  assign _zz_114 = _zz_238[11];
  always @ (*) begin
    _zz_115[19] = _zz_114;
    _zz_115[18] = _zz_114;
    _zz_115[17] = _zz_114;
    _zz_115[16] = _zz_114;
    _zz_115[15] = _zz_114;
    _zz_115[14] = _zz_114;
    _zz_115[13] = _zz_114;
    _zz_115[12] = _zz_114;
    _zz_115[11] = _zz_114;
    _zz_115[10] = _zz_114;
    _zz_115[9] = _zz_114;
    _zz_115[8] = _zz_114;
    _zz_115[7] = _zz_114;
    _zz_115[6] = _zz_114;
    _zz_115[5] = _zz_114;
    _zz_115[4] = _zz_114;
    _zz_115[3] = _zz_114;
    _zz_115[2] = _zz_114;
    _zz_115[1] = _zz_114;
    _zz_115[0] = _zz_114;
  end

  assign _zz_116 = _zz_239[11];
  always @ (*) begin
    _zz_117[18] = _zz_116;
    _zz_117[17] = _zz_116;
    _zz_117[16] = _zz_116;
    _zz_117[15] = _zz_116;
    _zz_117[14] = _zz_116;
    _zz_117[13] = _zz_116;
    _zz_117[12] = _zz_116;
    _zz_117[11] = _zz_116;
    _zz_117[10] = _zz_116;
    _zz_117[9] = _zz_116;
    _zz_117[8] = _zz_116;
    _zz_117[7] = _zz_116;
    _zz_117[6] = _zz_116;
    _zz_117[5] = _zz_116;
    _zz_117[4] = _zz_116;
    _zz_117[3] = _zz_116;
    _zz_117[2] = _zz_116;
    _zz_117[1] = _zz_116;
    _zz_117[0] = _zz_116;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_118 = {{_zz_113,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_118 = {_zz_115,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_118 = {{_zz_117,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_118;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  always @ (*) begin
    BranchPlugin_branchExceptionPort_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && BranchPlugin_jumpInterface_payload[1]);
    if(1'b0)begin
      BranchPlugin_branchExceptionPort_valid = 1'b0;
    end
  end

  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = BranchPlugin_jumpInterface_payload;
  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_119 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_120 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_121 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_122 = {decodeExceptionPort_valid,IBusSimplePlugin_decodeExceptionPort_valid};
  assign _zz_123 = _zz_240[0];
  assign _zz_124 = {CfuPlugin_joinException_valid,DBusSimplePlugin_memoryExceptionPort_valid};
  assign _zz_125 = _zz_242[0];
  assign _zz_126 = {CsrPlugin_selfException_valid,BranchPlugin_branchExceptionPort_valid};
  assign _zz_127 = _zz_244[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_160)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(_zz_162)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(_zz_165)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000))begin
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
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
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
    if(_zz_179)begin
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
    if(_zz_180)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(_zz_180)begin
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
    if(_zz_179)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_179)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_192)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign execute_CfuPlugin_schedule = (execute_arbitration_isValid && execute_CfuPlugin_CFU_ENABLE);
  assign CfuPlugin_bus_cmd_valid = ((execute_CfuPlugin_schedule || execute_CfuPlugin_hold) && (! execute_CfuPlugin_fired));
  assign execute_CfuPlugin_functionsIds_0 = _zz_246;
  assign CfuPlugin_bus_cmd_payload_function_id = execute_CfuPlugin_functionsIds_0;
  assign CfuPlugin_bus_cmd_payload_inputs_0 = execute_RS1;
  assign _zz_128 = _zz_247[7];
  always @ (*) begin
    _zz_129[23] = _zz_128;
    _zz_129[22] = _zz_128;
    _zz_129[21] = _zz_128;
    _zz_129[20] = _zz_128;
    _zz_129[19] = _zz_128;
    _zz_129[18] = _zz_128;
    _zz_129[17] = _zz_128;
    _zz_129[16] = _zz_128;
    _zz_129[15] = _zz_128;
    _zz_129[14] = _zz_128;
    _zz_129[13] = _zz_128;
    _zz_129[12] = _zz_128;
    _zz_129[11] = _zz_128;
    _zz_129[10] = _zz_128;
    _zz_129[9] = _zz_128;
    _zz_129[8] = _zz_128;
    _zz_129[7] = _zz_128;
    _zz_129[6] = _zz_128;
    _zz_129[5] = _zz_128;
    _zz_129[4] = _zz_128;
    _zz_129[3] = _zz_128;
    _zz_129[2] = _zz_128;
    _zz_129[1] = _zz_128;
    _zz_129[0] = _zz_128;
  end

  always @ (*) begin
    case(execute_CfuPlugin_CFU_INPUT_2_KIND)
      `Input2Kind_defaultEncoding_RS : begin
        _zz_130 = execute_RS2;
      end
      default : begin
        _zz_130 = {_zz_129,execute_INSTRUCTION[31 : 24]};
      end
    endcase
  end

  assign CfuPlugin_bus_cmd_payload_inputs_1 = _zz_130;
  assign memory_CfuPlugin_rsp_valid = (CfuPlugin_bus_rsp_valid || CfuPlugin_bus_rsp_s2mPipe_rValid);
  assign CfuPlugin_bus_rsp_ready = (! CfuPlugin_bus_rsp_s2mPipe_rValid);
  assign memory_CfuPlugin_rsp_payload_response_ok = (CfuPlugin_bus_rsp_s2mPipe_rValid ? CfuPlugin_bus_rsp_s2mPipe_rData_response_ok : CfuPlugin_bus_rsp_payload_response_ok);
  assign memory_CfuPlugin_rsp_payload_outputs_0 = (CfuPlugin_bus_rsp_s2mPipe_rValid ? CfuPlugin_bus_rsp_s2mPipe_rData_outputs_0 : CfuPlugin_bus_rsp_payload_outputs_0);
  always @ (*) begin
    CfuPlugin_joinException_valid = 1'b0;
    if(memory_CfuPlugin_CFU_IN_FLIGHT)begin
      if(memory_arbitration_isValid)begin
        CfuPlugin_joinException_valid = (! memory_CfuPlugin_rsp_payload_response_ok);
      end
    end
  end

  assign CfuPlugin_joinException_payload_code = 4'b1111;
  assign CfuPlugin_joinException_payload_badAddr = 32'h0;
  always @ (*) begin
    memory_CfuPlugin_rsp_ready = 1'b0;
    if(memory_CfuPlugin_CFU_IN_FLIGHT)begin
      memory_CfuPlugin_rsp_ready = (! memory_arbitration_isStuckByOthers);
    end
  end

  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b0;
    if(_zz_156)begin
      if(_zz_164)begin
        memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_mul_counter_willClear = 1'b0;
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_mul_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_mul_counter_value == 6'h20);
  assign memory_MulDivIterativePlugin_mul_counter_willOverflow = (memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc && memory_MulDivIterativePlugin_mul_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_mul_counter_willOverflow)begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = (memory_MulDivIterativePlugin_mul_counter_value + _zz_249);
    end
    if(memory_MulDivIterativePlugin_mul_counter_willClear)begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_157)begin
      if(_zz_181)begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_182)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_257);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_131 = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_131[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_258);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_259 : _zz_260);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_261[31:0];
  assign _zz_132 = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_133 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_134 = ((execute_IS_MUL && _zz_133) || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_135[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_135[31 : 0] = execute_RS1;
  end

  assign _zz_137 = (_zz_136 & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_137 != 32'h0);
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_183)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_138))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_183)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign DebugPlugin_allowEBreak = (CsrPlugin_privilege == 2'b11);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_28 = decode_SRC1_CTRL;
  assign _zz_26 = _zz_54;
  assign _zz_41 = decode_to_execute_SRC1_CTRL;
  assign _zz_25 = decode_ALU_CTRL;
  assign _zz_23 = _zz_53;
  assign _zz_42 = decode_to_execute_ALU_CTRL;
  assign _zz_22 = decode_SRC2_CTRL;
  assign _zz_20 = _zz_52;
  assign _zz_40 = decode_to_execute_SRC2_CTRL;
  assign _zz_19 = decode_ALU_BITWISE_CTRL;
  assign _zz_17 = _zz_51;
  assign _zz_43 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_16 = decode_SHIFT_CTRL;
  assign _zz_14 = _zz_50;
  assign _zz_38 = decode_to_execute_SHIFT_CTRL;
  assign _zz_13 = decode_BRANCH_CTRL;
  assign _zz_11 = _zz_49;
  assign _zz_36 = decode_to_execute_BRANCH_CTRL;
  assign _zz_10 = decode_ENV_CTRL;
  assign _zz_7 = execute_ENV_CTRL;
  assign _zz_5 = memory_ENV_CTRL;
  assign _zz_8 = _zz_48;
  assign _zz_34 = decode_to_execute_ENV_CTRL;
  assign _zz_33 = execute_to_memory_ENV_CTRL;
  assign _zz_35 = memory_to_writeBack_ENV_CTRL;
  assign _zz_3 = decode_CfuPlugin_CFU_INPUT_2_KIND;
  assign _zz_1 = _zz_47;
  assign _zz_32 = decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
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
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_139)
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_140 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_140[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_140[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_140[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_141 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_141[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_141[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_141[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_142 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_142[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_142[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_142[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_143 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_143[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_144 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_144[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_144[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_145 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_145[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @ (*) begin
    _zz_146 = 32'h0;
    if(execute_CsrPlugin_csr_2816)begin
      _zz_146[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_147 = 32'h0;
    if(execute_CsrPlugin_csr_2944)begin
      _zz_147[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_148 = 32'h0;
    if(execute_CsrPlugin_csr_3008)begin
      _zz_148[31 : 0] = _zz_136;
    end
  end

  always @ (*) begin
    _zz_149 = 32'h0;
    if(execute_CsrPlugin_csr_4032)begin
      _zz_149[31 : 0] = _zz_137;
    end
  end

  assign execute_CsrPlugin_readData = ((((_zz_140 | _zz_141) | (_zz_142 | _zz_143)) | ((_zz_144 | _zz_145) | (_zz_146 | _zz_147))) | (_zz_148 | _zz_149));
  assign iBus_cmd_ready = ((1'b1 && (! iBus_cmd_m2sPipe_valid)) || iBus_cmd_m2sPipe_ready);
  assign iBus_cmd_m2sPipe_valid = iBus_cmd_m2sPipe_rValid;
  assign iBus_cmd_m2sPipe_payload_pc = iBus_cmd_m2sPipe_rData_pc;
  assign iBusWishbone_ADR = (iBus_cmd_m2sPipe_payload_pc >>> 2);
  assign iBusWishbone_CTI = 3'b000;
  assign iBusWishbone_BTE = 2'b00;
  assign iBusWishbone_SEL = 4'b1111;
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = 32'h0;
  assign iBusWishbone_CYC = iBus_cmd_m2sPipe_valid;
  assign iBusWishbone_STB = iBus_cmd_m2sPipe_valid;
  assign iBus_cmd_m2sPipe_ready = (iBus_cmd_m2sPipe_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = (iBusWishbone_CYC && iBusWishbone_ACK);
  assign iBus_rsp_payload_inst = iBusWishbone_DAT_MISO;
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
        _zz_150 = 4'b0001;
      end
      2'b01 : begin
        _zz_150 = 4'b0011;
      end
      default : begin
        _zz_150 = 4'b1111;
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = (_zz_150 <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
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
  assign _zz_152 = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= externalResetVector;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_66 <= 1'b0;
      _zz_67 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      _zz_96 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      _zz_107 <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_CfuPlugin_hold <= 1'b0;
      execute_CfuPlugin_fired <= 1'b0;
      CfuPlugin_bus_rsp_s2mPipe_rValid <= 1'b0;
      memory_MulDivIterativePlugin_mul_counter_value <= 6'h0;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      _zz_136 <= 32'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_139 <= 3'b000;
      execute_to_memory_CfuPlugin_CFU_IN_FLIGHT <= 1'b0;
      iBus_cmd_m2sPipe_rValid <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_66 <= 1'b0;
      end
      if(_zz_64)begin
        _zz_66 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(decode_arbitration_removeIt)begin
        _zz_67 <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_output_ready)begin
        _zz_67 <= (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_injector_decodeInput_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_219);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_221);
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)));
        `else
          if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)));
        `else
          if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      _zz_96 <= 1'b0;
      if(_zz_158)begin
        if(_zz_184)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      _zz_107 <= (_zz_45 && writeBack_arbitration_isFiring);
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
      if(_zz_185)begin
        if(_zz_186)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_187)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_188)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_166)begin
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
      if(_zz_167)begin
        case(_zz_169)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_121,{_zz_120,_zz_119}} != 3'b000) || CsrPlugin_thirdPartyWake);
      if(execute_CfuPlugin_schedule)begin
        execute_CfuPlugin_hold <= 1'b1;
      end
      if(CfuPlugin_bus_cmd_ready)begin
        execute_CfuPlugin_hold <= 1'b0;
      end
      if((CfuPlugin_bus_cmd_valid && CfuPlugin_bus_cmd_ready))begin
        execute_CfuPlugin_fired <= 1'b1;
      end
      if((! execute_arbitration_isStuckByOthers))begin
        execute_CfuPlugin_fired <= 1'b0;
      end
      if(memory_CfuPlugin_rsp_ready)begin
        CfuPlugin_bus_rsp_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_189)begin
        CfuPlugin_bus_rsp_s2mPipe_rValid <= CfuPlugin_bus_rsp_valid;
      end
      memory_MulDivIterativePlugin_mul_counter_value <= memory_MulDivIterativePlugin_mul_counter_valueNext;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      if((! memory_arbitration_isStuck))begin
        execute_to_memory_CfuPlugin_CFU_IN_FLIGHT <= _zz_30;
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
      case(_zz_139)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_139 <= 3'b001;
          end
        end
        3'b001 : begin
          _zz_139 <= 3'b010;
        end
        3'b010 : begin
          _zz_139 <= 3'b011;
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_139 <= 3'b100;
          end
        end
        3'b100 : begin
          _zz_139 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_271[0];
          CsrPlugin_mstatus_MIE <= _zz_272[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_274[0];
          CsrPlugin_mie_MTIE <= _zz_275[0];
          CsrPlugin_mie_MSIE <= _zz_276[0];
        end
      end
      if(execute_CsrPlugin_csr_3008)begin
        if(execute_CsrPlugin_writeEnable)begin
          _zz_136 <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      if(iBus_cmd_ready)begin
        iBus_cmd_m2sPipe_rValid <= iBus_cmd_valid;
      end
      if(_zz_190)begin
        dBus_cmd_halfPipe_regs_valid <= dBus_cmd_valid;
        dBus_cmd_halfPipe_regs_ready <= (! dBus_cmd_valid);
      end else begin
        dBus_cmd_halfPipe_regs_valid <= (! dBus_cmd_halfPipe_ready);
        dBus_cmd_halfPipe_regs_ready <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusSimplePlugin_iBusRsp_output_ready)begin
      _zz_68 <= IBusSimplePlugin_iBusRsp_output_payload_pc;
      _zz_69 <= IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
      _zz_70 <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
      _zz_71 <= IBusSimplePlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
    end
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready)begin
      IBusSimplePlugin_mmu_joinCtx_physicalAddress <= IBusSimplePlugin_mmuBus_rsp_physicalAddress;
      IBusSimplePlugin_mmu_joinCtx_isIoAccess <= IBusSimplePlugin_mmuBus_rsp_isIoAccess;
      IBusSimplePlugin_mmu_joinCtx_isPaging <= IBusSimplePlugin_mmuBus_rsp_isPaging;
      IBusSimplePlugin_mmu_joinCtx_allowRead <= IBusSimplePlugin_mmuBus_rsp_allowRead;
      IBusSimplePlugin_mmu_joinCtx_allowWrite <= IBusSimplePlugin_mmuBus_rsp_allowWrite;
      IBusSimplePlugin_mmu_joinCtx_allowExecute <= IBusSimplePlugin_mmuBus_rsp_allowExecute;
      IBusSimplePlugin_mmu_joinCtx_exception <= IBusSimplePlugin_mmuBus_rsp_exception;
      IBusSimplePlugin_mmu_joinCtx_refilling <= IBusSimplePlugin_mmuBus_rsp_refilling;
      IBusSimplePlugin_mmu_joinCtx_bypassTranslation <= IBusSimplePlugin_mmuBus_rsp_bypassTranslation;
    end
    if(_zz_158)begin
      if(_zz_184)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    _zz_108 <= _zz_44[11 : 7];
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_160)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_123 ? IBusSimplePlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_123 ? IBusSimplePlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(_zz_162)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_127 ? BranchPlugin_branchExceptionPort_payload_code : CsrPlugin_selfException_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_127 ? BranchPlugin_branchExceptionPort_payload_badAddr : CsrPlugin_selfException_payload_badAddr);
    end
    if(_zz_165)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_125 ? DBusSimplePlugin_memoryExceptionPort_payload_code : CfuPlugin_joinException_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_125 ? DBusSimplePlugin_memoryExceptionPort_payload_badAddr : CfuPlugin_joinException_payload_badAddr);
    end
    if(_zz_185)begin
      if(_zz_186)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_187)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_188)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_166)begin
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
    if(_zz_189)begin
      CfuPlugin_bus_rsp_s2mPipe_rData_response_ok <= CfuPlugin_bus_rsp_payload_response_ok;
      CfuPlugin_bus_rsp_s2mPipe_rData_outputs_0 <= CfuPlugin_bus_rsp_payload_outputs_0;
    end
    if(_zz_156)begin
      if(_zz_164)begin
        memory_MulDivIterativePlugin_rs2 <= (memory_MulDivIterativePlugin_rs2 >>> 1);
        memory_MulDivIterativePlugin_accumulator <= ({_zz_250,memory_MulDivIterativePlugin_accumulator[31 : 0]} >>> 1);
      end
    end
    if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(_zz_157)begin
      if(_zz_181)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
          memory_MulDivIterativePlugin_div_result <= _zz_262[31:0];
        end
      end
    end
    if(_zz_182)begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_134 ? (~ _zz_135) : _zz_135) + _zz_268);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_133 ? (~ execute_RS2) : execute_RS2) + _zz_270);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_134 ^ (_zz_133 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_39;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_56;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_57;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_27;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
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
      decode_to_execute_ALU_CTRL <= _zz_24;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_21;
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
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_18;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_15;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_12;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_9;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_6;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_4;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CfuPlugin_CFU_ENABLE <= decode_CfuPlugin_CFU_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CfuPlugin_CFU_INPUT_2_KIND <= _zz_2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MMU_FAULT <= execute_MMU_FAULT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MMU_RSP2_physicalAddress <= execute_MMU_RSP2_physicalAddress;
      execute_to_memory_MMU_RSP2_isIoAccess <= execute_MMU_RSP2_isIoAccess;
      execute_to_memory_MMU_RSP2_isPaging <= execute_MMU_RSP2_isPaging;
      execute_to_memory_MMU_RSP2_allowRead <= execute_MMU_RSP2_allowRead;
      execute_to_memory_MMU_RSP2_allowWrite <= execute_MMU_RSP2_allowWrite;
      execute_to_memory_MMU_RSP2_allowExecute <= execute_MMU_RSP2_allowExecute;
      execute_to_memory_MMU_RSP2_exception <= execute_MMU_RSP2_exception;
      execute_to_memory_MMU_RSP2_refilling <= execute_MMU_RSP2_refilling;
      execute_to_memory_MMU_RSP2_bypassTranslation <= execute_MMU_RSP2_bypassTranslation;
    end
    if(((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers)))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_37;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_31;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_CfuPlugin_CFU_IN_FLIGHT <= _zz_29;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((_zz_139 != 3'b000))begin
      _zz_70 <= IBusSimplePlugin_injectionPort_payload;
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
        CsrPlugin_mip_MSIP <= _zz_273[0];
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
    if(iBus_cmd_ready)begin
      iBus_cmd_m2sPipe_rData_pc <= iBus_cmd_payload_pc;
    end
    if(_zz_190)begin
      dBus_cmd_halfPipe_regs_payload_wr <= dBus_cmd_payload_wr;
      dBus_cmd_halfPipe_regs_payload_address <= dBus_cmd_payload_address;
      dBus_cmd_halfPipe_regs_payload_data <= dBus_cmd_payload_data;
      dBus_cmd_halfPipe_regs_payload_size <= dBus_cmd_payload_size;
    end
  end

  always @ (posedge clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_55;
    end
    _zz_138 <= debug_bus_cmd_payload_address[2];
    if(_zz_161)begin
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
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_183)
          6'h0 : begin
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
          default : begin
          end
        endcase
      end
      if(_zz_161)begin
        if(_zz_163)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_168)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire                _zz_4;
  wire       [0:0]    _zz_5;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_2;
  reg        [32:0]   _zz_3;

  assign _zz_4 = (! empty);
  assign _zz_5 = _zz_2[0 : 0];
  always @ (*) begin
    _zz_1 = 1'b0;
    if(pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_4)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2 = _zz_3;
  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_error = _zz_5[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_inst = _zz_2[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge clk) begin
    if(reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_1)begin
      _zz_3 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule
