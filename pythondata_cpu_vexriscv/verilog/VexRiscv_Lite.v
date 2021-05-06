// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : VexRiscv
// Git hash  : 6bce178f5927e8960c36a559e33b1ba090ce88d4


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
  wire                _zz_158;
  wire                _zz_159;
  wire                _zz_160;
  wire                _zz_161;
  wire                _zz_162;
  wire                _zz_163;
  wire                _zz_164;
  wire                _zz_165;
  reg                 _zz_166;
  reg        [31:0]   _zz_167;
  reg        [31:0]   _zz_168;
  reg        [31:0]   _zz_169;
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
  wire                _zz_183;
  wire                _zz_184;
  wire                _zz_185;
  wire                _zz_186;
  wire       [1:0]    _zz_187;
  wire                _zz_188;
  wire                _zz_189;
  wire                _zz_190;
  wire                _zz_191;
  wire                _zz_192;
  wire                _zz_193;
  wire                _zz_194;
  wire                _zz_195;
  wire                _zz_196;
  wire                _zz_197;
  wire                _zz_198;
  wire                _zz_199;
  wire                _zz_200;
  wire                _zz_201;
  wire                _zz_202;
  wire                _zz_203;
  wire                _zz_204;
  wire                _zz_205;
  wire       [1:0]    _zz_206;
  wire                _zz_207;
  wire       [0:0]    _zz_208;
  wire       [0:0]    _zz_209;
  wire       [0:0]    _zz_210;
  wire       [0:0]    _zz_211;
  wire       [0:0]    _zz_212;
  wire       [0:0]    _zz_213;
  wire       [0:0]    _zz_214;
  wire       [0:0]    _zz_215;
  wire       [0:0]    _zz_216;
  wire       [0:0]    _zz_217;
  wire       [0:0]    _zz_218;
  wire       [0:0]    _zz_219;
  wire       [0:0]    _zz_220;
  wire       [0:0]    _zz_221;
  wire       [0:0]    _zz_222;
  wire       [0:0]    _zz_223;
  wire       [2:0]    _zz_224;
  wire       [2:0]    _zz_225;
  wire       [31:0]   _zz_226;
  wire       [11:0]   _zz_227;
  wire       [31:0]   _zz_228;
  wire       [19:0]   _zz_229;
  wire       [11:0]   _zz_230;
  wire       [31:0]   _zz_231;
  wire       [31:0]   _zz_232;
  wire       [19:0]   _zz_233;
  wire       [11:0]   _zz_234;
  wire       [2:0]    _zz_235;
  wire       [0:0]    _zz_236;
  wire       [2:0]    _zz_237;
  wire       [4:0]    _zz_238;
  wire       [11:0]   _zz_239;
  wire       [11:0]   _zz_240;
  wire       [31:0]   _zz_241;
  wire       [31:0]   _zz_242;
  wire       [31:0]   _zz_243;
  wire       [31:0]   _zz_244;
  wire       [31:0]   _zz_245;
  wire       [31:0]   _zz_246;
  wire       [31:0]   _zz_247;
  wire       [31:0]   _zz_248;
  wire       [32:0]   _zz_249;
  wire       [11:0]   _zz_250;
  wire       [19:0]   _zz_251;
  wire       [11:0]   _zz_252;
  wire       [31:0]   _zz_253;
  wire       [31:0]   _zz_254;
  wire       [31:0]   _zz_255;
  wire       [11:0]   _zz_256;
  wire       [19:0]   _zz_257;
  wire       [11:0]   _zz_258;
  wire       [2:0]    _zz_259;
  wire       [1:0]    _zz_260;
  wire       [1:0]    _zz_261;
  wire       [1:0]    _zz_262;
  wire       [1:0]    _zz_263;
  wire       [0:0]    _zz_264;
  wire       [5:0]    _zz_265;
  wire       [33:0]   _zz_266;
  wire       [32:0]   _zz_267;
  wire       [33:0]   _zz_268;
  wire       [32:0]   _zz_269;
  wire       [33:0]   _zz_270;
  wire       [32:0]   _zz_271;
  wire       [0:0]    _zz_272;
  wire       [5:0]    _zz_273;
  wire       [32:0]   _zz_274;
  wire       [31:0]   _zz_275;
  wire       [31:0]   _zz_276;
  wire       [32:0]   _zz_277;
  wire       [32:0]   _zz_278;
  wire       [32:0]   _zz_279;
  wire       [32:0]   _zz_280;
  wire       [0:0]    _zz_281;
  wire       [32:0]   _zz_282;
  wire       [0:0]    _zz_283;
  wire       [32:0]   _zz_284;
  wire       [0:0]    _zz_285;
  wire       [31:0]   _zz_286;
  wire       [0:0]    _zz_287;
  wire       [0:0]    _zz_288;
  wire       [0:0]    _zz_289;
  wire       [0:0]    _zz_290;
  wire       [0:0]    _zz_291;
  wire       [0:0]    _zz_292;
  wire       [26:0]   _zz_293;
  wire                _zz_294;
  wire                _zz_295;
  wire       [1:0]    _zz_296;
  wire       [31:0]   _zz_297;
  wire       [31:0]   _zz_298;
  wire       [31:0]   _zz_299;
  wire                _zz_300;
  wire       [0:0]    _zz_301;
  wire       [12:0]   _zz_302;
  wire       [31:0]   _zz_303;
  wire       [31:0]   _zz_304;
  wire       [31:0]   _zz_305;
  wire                _zz_306;
  wire       [0:0]    _zz_307;
  wire       [6:0]    _zz_308;
  wire       [31:0]   _zz_309;
  wire       [31:0]   _zz_310;
  wire       [31:0]   _zz_311;
  wire                _zz_312;
  wire       [0:0]    _zz_313;
  wire       [0:0]    _zz_314;
  wire                _zz_315;
  wire                _zz_316;
  wire                _zz_317;
  wire       [31:0]   _zz_318;
  wire       [0:0]    _zz_319;
  wire       [1:0]    _zz_320;
  wire       [0:0]    _zz_321;
  wire       [0:0]    _zz_322;
  wire                _zz_323;
  wire       [0:0]    _zz_324;
  wire       [24:0]   _zz_325;
  wire       [31:0]   _zz_326;
  wire       [31:0]   _zz_327;
  wire       [31:0]   _zz_328;
  wire       [0:0]    _zz_329;
  wire       [0:0]    _zz_330;
  wire       [1:0]    _zz_331;
  wire       [1:0]    _zz_332;
  wire                _zz_333;
  wire       [0:0]    _zz_334;
  wire       [20:0]   _zz_335;
  wire       [31:0]   _zz_336;
  wire       [31:0]   _zz_337;
  wire       [31:0]   _zz_338;
  wire       [31:0]   _zz_339;
  wire       [31:0]   _zz_340;
  wire       [31:0]   _zz_341;
  wire       [0:0]    _zz_342;
  wire       [0:0]    _zz_343;
  wire       [2:0]    _zz_344;
  wire       [2:0]    _zz_345;
  wire                _zz_346;
  wire       [0:0]    _zz_347;
  wire       [17:0]   _zz_348;
  wire       [31:0]   _zz_349;
  wire       [31:0]   _zz_350;
  wire       [31:0]   _zz_351;
  wire       [31:0]   _zz_352;
  wire                _zz_353;
  wire                _zz_354;
  wire                _zz_355;
  wire       [0:0]    _zz_356;
  wire       [0:0]    _zz_357;
  wire                _zz_358;
  wire       [0:0]    _zz_359;
  wire       [0:0]    _zz_360;
  wire                _zz_361;
  wire       [0:0]    _zz_362;
  wire       [14:0]   _zz_363;
  wire       [31:0]   _zz_364;
  wire       [31:0]   _zz_365;
  wire       [31:0]   _zz_366;
  wire       [31:0]   _zz_367;
  wire       [31:0]   _zz_368;
  wire       [31:0]   _zz_369;
  wire       [31:0]   _zz_370;
  wire       [31:0]   _zz_371;
  wire       [0:0]    _zz_372;
  wire       [0:0]    _zz_373;
  wire       [1:0]    _zz_374;
  wire       [1:0]    _zz_375;
  wire                _zz_376;
  wire       [0:0]    _zz_377;
  wire       [12:0]   _zz_378;
  wire       [31:0]   _zz_379;
  wire       [31:0]   _zz_380;
  wire       [31:0]   _zz_381;
  wire       [31:0]   _zz_382;
  wire       [31:0]   _zz_383;
  wire       [31:0]   _zz_384;
  wire                _zz_385;
  wire       [0:0]    _zz_386;
  wire       [0:0]    _zz_387;
  wire                _zz_388;
  wire       [0:0]    _zz_389;
  wire       [0:0]    _zz_390;
  wire                _zz_391;
  wire       [0:0]    _zz_392;
  wire       [9:0]    _zz_393;
  wire       [31:0]   _zz_394;
  wire       [31:0]   _zz_395;
  wire       [31:0]   _zz_396;
  wire       [0:0]    _zz_397;
  wire       [0:0]    _zz_398;
  wire       [0:0]    _zz_399;
  wire       [4:0]    _zz_400;
  wire       [1:0]    _zz_401;
  wire       [1:0]    _zz_402;
  wire                _zz_403;
  wire       [0:0]    _zz_404;
  wire       [6:0]    _zz_405;
  wire       [31:0]   _zz_406;
  wire       [31:0]   _zz_407;
  wire       [31:0]   _zz_408;
  wire       [31:0]   _zz_409;
  wire                _zz_410;
  wire       [0:0]    _zz_411;
  wire       [1:0]    _zz_412;
  wire       [31:0]   _zz_413;
  wire       [31:0]   _zz_414;
  wire                _zz_415;
  wire       [0:0]    _zz_416;
  wire       [0:0]    _zz_417;
  wire       [0:0]    _zz_418;
  wire       [0:0]    _zz_419;
  wire                _zz_420;
  wire       [0:0]    _zz_421;
  wire       [3:0]    _zz_422;
  wire       [31:0]   _zz_423;
  wire       [31:0]   _zz_424;
  wire       [31:0]   _zz_425;
  wire                _zz_426;
  wire                _zz_427;
  wire       [31:0]   _zz_428;
  wire       [31:0]   _zz_429;
  wire       [31:0]   _zz_430;
  wire       [31:0]   _zz_431;
  wire       [31:0]   _zz_432;
  wire       [31:0]   _zz_433;
  wire       [31:0]   _zz_434;
  wire       [0:0]    _zz_435;
  wire       [2:0]    _zz_436;
  wire       [0:0]    _zz_437;
  wire       [0:0]    _zz_438;
  wire                _zz_439;
  wire       [0:0]    _zz_440;
  wire       [1:0]    _zz_441;
  wire       [31:0]   _zz_442;
  wire       [31:0]   _zz_443;
  wire       [31:0]   _zz_444;
  wire       [31:0]   _zz_445;
  wire                _zz_446;
  wire       [0:0]    _zz_447;
  wire       [0:0]    _zz_448;
  wire       [31:0]   _zz_449;
  wire       [31:0]   _zz_450;
  wire       [0:0]    _zz_451;
  wire       [1:0]    _zz_452;
  wire       [1:0]    _zz_453;
  wire       [1:0]    _zz_454;
  wire                _zz_455;
  wire                _zz_456;
  wire       [31:0]   _zz_457;
  wire       [31:0]   _zz_458;
  wire       [31:0]   _zz_459;
  wire       [31:0]   _zz_460;
  wire       [31:0]   _zz_461;
  wire       [31:0]   _zz_462;
  wire       [31:0]   _zz_463;
  wire       [31:0]   _zz_464;
  wire       [31:0]   _zz_465;
  wire                _zz_466;
  wire       [31:0]   _zz_467;
  wire       [31:0]   _zz_468;
  wire                _zz_469;
  wire                _zz_470;
  wire                _zz_471;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_SRC2_FORCE_ZERO;
  wire                decode_IS_DIV;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_MUL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_1;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_2;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_3;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_4;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_5;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_6;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_7;
  wire                decode_IS_CSR;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_8;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_9;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_10;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_11;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_12;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_13;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_14;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_15;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_16;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_17;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_18;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_19;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_20;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_21;
  wire                decode_MEMORY_ENABLE;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_22;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_23;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_24;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_MUL;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_25;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_26;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_27;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       [31:0]   execute_RS1;
  wire                execute_BRANCH_COND_RESULT;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_28;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  reg        [31:0]   _zz_29;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  reg        [31:0]   _zz_30;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_31;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_32;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_33;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_34;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_35;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_36;
  wire       [31:0]   _zz_37;
  wire                _zz_38;
  reg                 _zz_39;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_40;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_41;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_42;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_43;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_44;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_45;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_46;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_47;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_ALIGNEMENT_FAULT;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_48;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_49;
  reg        [31:0]   _zz_50;
  wire       [31:0]   decode_PC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                decode_arbitration_haltItself;
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
  wire                execute_arbitration_flushIt;
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
  wire                memory_arbitration_flushIt;
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
  reg                 IBusCachedPlugin_fetcherHalt;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
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
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
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
  wire       [2:0]    _zz_51;
  wire       [2:0]    _zz_52;
  wire                _zz_53;
  wire                _zz_54;
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
  wire                _zz_55;
  wire                _zz_56;
  wire                _zz_57;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_58;
  wire                _zz_59;
  reg                 _zz_60;
  wire                _zz_61;
  reg                 _zz_62;
  reg        [31:0]   _zz_63;
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
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                _zz_64;
  reg        [18:0]   _zz_65;
  wire                _zz_66;
  reg        [10:0]   _zz_67;
  wire                _zz_68;
  reg        [18:0]   _zz_69;
  reg                 _zz_70;
  wire                _zz_71;
  reg        [10:0]   _zz_72;
  wire                _zz_73;
  reg        [18:0]   _zz_74;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_75;
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
  wire                _zz_76;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_77;
  reg        [3:0]    _zz_78;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_79;
  reg        [31:0]   _zz_80;
  wire                _zz_81;
  reg        [31:0]   _zz_82;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [30:0]   _zz_83;
  wire                _zz_84;
  wire                _zz_85;
  wire                _zz_86;
  wire                _zz_87;
  wire                _zz_88;
  wire                _zz_89;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_90;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_91;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_92;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_93;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_94;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_95;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_96;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_97;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_98;
  reg        [31:0]   _zz_99;
  wire                _zz_100;
  reg        [19:0]   _zz_101;
  wire                _zz_102;
  reg        [19:0]   _zz_103;
  reg        [31:0]   _zz_104;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  reg        [31:0]   _zz_105;
  reg                 _zz_106;
  reg                 _zz_107;
  reg                 _zz_108;
  reg        [4:0]    _zz_109;
  reg        [31:0]   _zz_110;
  wire                _zz_111;
  wire                _zz_112;
  wire                _zz_113;
  wire                _zz_114;
  wire                _zz_115;
  wire                _zz_116;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_117;
  reg                 _zz_118;
  reg                 _zz_119;
  wire                _zz_120;
  reg        [19:0]   _zz_121;
  wire                _zz_122;
  reg        [10:0]   _zz_123;
  wire                _zz_124;
  reg        [18:0]   _zz_125;
  reg                 _zz_126;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_127;
  reg        [19:0]   _zz_128;
  wire                _zz_129;
  reg        [10:0]   _zz_130;
  wire                _zz_131;
  reg        [18:0]   _zz_132;
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
  wire                _zz_133;
  wire                _zz_134;
  wire                _zz_135;
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
  wire       [1:0]    _zz_136;
  wire                _zz_137;
  wire       [1:0]    _zz_138;
  wire                _zz_139;
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
  wire       [31:0]   _zz_140;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_141;
  wire                _zz_142;
  wire                _zz_143;
  reg        [32:0]   _zz_144;
  reg        [31:0]   externalInterruptArray_regNext;
  reg        [31:0]   _zz_145;
  wire       [31:0]   _zz_146;
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
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 execute_to_memory_ALIGNEMENT_FAULT;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg                 execute_CsrPlugin_csr_3008;
  reg                 execute_CsrPlugin_csr_4032;
  reg        [31:0]   _zz_147;
  reg        [31:0]   _zz_148;
  reg        [31:0]   _zz_149;
  reg        [31:0]   _zz_150;
  reg        [31:0]   _zz_151;
  reg        [31:0]   _zz_152;
  reg        [31:0]   _zz_153;
  reg        [31:0]   _zz_154;
  reg        [2:0]    _zz_155;
  reg                 _zz_156;
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
  reg        [3:0]    _zz_157;
  `ifndef SYNTHESIS
  reg [39:0] _zz_1_string;
  reg [39:0] _zz_2_string;
  reg [39:0] _zz_3_string;
  reg [39:0] _zz_4_string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_5_string;
  reg [39:0] _zz_6_string;
  reg [39:0] _zz_7_string;
  reg [31:0] _zz_8_string;
  reg [31:0] _zz_9_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_10_string;
  reg [71:0] _zz_11_string;
  reg [71:0] _zz_12_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_13_string;
  reg [39:0] _zz_14_string;
  reg [39:0] _zz_15_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_16_string;
  reg [23:0] _zz_17_string;
  reg [23:0] _zz_18_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_19_string;
  reg [63:0] _zz_20_string;
  reg [63:0] _zz_21_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_22_string;
  reg [95:0] _zz_23_string;
  reg [95:0] _zz_24_string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_25_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_26_string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_27_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_28_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_31_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_33_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_34_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_35_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_36_string;
  reg [39:0] _zz_40_string;
  reg [31:0] _zz_41_string;
  reg [71:0] _zz_42_string;
  reg [39:0] _zz_43_string;
  reg [23:0] _zz_44_string;
  reg [63:0] _zz_45_string;
  reg [95:0] _zz_46_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_48_string;
  reg [95:0] _zz_90_string;
  reg [63:0] _zz_91_string;
  reg [23:0] _zz_92_string;
  reg [39:0] _zz_93_string;
  reg [71:0] _zz_94_string;
  reg [31:0] _zz_95_string;
  reg [39:0] _zz_96_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  (* ram_style = "block" *) reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_170 = (memory_arbitration_isValid && memory_IS_MUL);
  assign _zz_171 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_172 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_173 = 1'b1;
  assign _zz_174 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_175 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_176 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  assign _zz_177 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_178 = ((_zz_163 && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign _zz_179 = ((_zz_163 && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign _zz_180 = ((_zz_163 && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign _zz_181 = ((_zz_163 && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_182 = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_183 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign _zz_184 = ({BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid} != 2'b00);
  assign _zz_185 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_186 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_187 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_188 = ((dBus_rsp_ready && dBus_rsp_error) && (! memory_MEMORY_STORE));
  assign _zz_189 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_190 = (1'b0 || (! 1'b1));
  assign _zz_191 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_192 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_193 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_194 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_195 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_196 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_197 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_198 = (! memory_arbitration_isStuck);
  assign _zz_199 = (iBus_cmd_valid || (_zz_155 != 3'b000));
  assign _zz_200 = (! execute_arbitration_isStuckByOthers);
  assign _zz_201 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_202 = ((_zz_133 && 1'b1) && (! 1'b0));
  assign _zz_203 = ((_zz_134 && 1'b1) && (! 1'b0));
  assign _zz_204 = ((_zz_135 && 1'b1) && (! 1'b0));
  assign _zz_205 = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_206 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_207 = execute_INSTRUCTION[13];
  assign _zz_208 = _zz_83[30 : 30];
  assign _zz_209 = _zz_83[29 : 29];
  assign _zz_210 = _zz_83[28 : 28];
  assign _zz_211 = _zz_83[27 : 27];
  assign _zz_212 = _zz_83[24 : 24];
  assign _zz_213 = _zz_83[16 : 16];
  assign _zz_214 = _zz_83[13 : 13];
  assign _zz_215 = _zz_83[12 : 12];
  assign _zz_216 = _zz_83[11 : 11];
  assign _zz_217 = _zz_83[4 : 4];
  assign _zz_218 = _zz_83[15 : 15];
  assign _zz_219 = _zz_83[5 : 5];
  assign _zz_220 = _zz_83[3 : 3];
  assign _zz_221 = _zz_83[19 : 19];
  assign _zz_222 = _zz_83[10 : 10];
  assign _zz_223 = _zz_83[0 : 0];
  assign _zz_224 = (_zz_51 - 3'b001);
  assign _zz_225 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_226 = {29'd0, _zz_225};
  assign _zz_227 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_228 = {{_zz_65,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_229 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_230 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_231 = {{_zz_67,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_232 = {{_zz_69,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_233 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_234 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_235 = (memory_MEMORY_STORE ? 3'b110 : 3'b100);
  assign _zz_236 = execute_SRC_LESS;
  assign _zz_237 = 3'b100;
  assign _zz_238 = execute_INSTRUCTION[19 : 15];
  assign _zz_239 = execute_INSTRUCTION[31 : 20];
  assign _zz_240 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_241 = ($signed(_zz_242) + $signed(_zz_245));
  assign _zz_242 = ($signed(_zz_243) + $signed(_zz_244));
  assign _zz_243 = execute_SRC1;
  assign _zz_244 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_245 = (execute_SRC_USE_SUB_LESS ? _zz_246 : _zz_247);
  assign _zz_246 = 32'h00000001;
  assign _zz_247 = 32'h0;
  assign _zz_248 = (_zz_249 >>> 1);
  assign _zz_249 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_250 = execute_INSTRUCTION[31 : 20];
  assign _zz_251 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_252 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_253 = {_zz_121,execute_INSTRUCTION[31 : 20]};
  assign _zz_254 = {{_zz_123,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_255 = {{_zz_125,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_256 = execute_INSTRUCTION[31 : 20];
  assign _zz_257 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_258 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_259 = 3'b100;
  assign _zz_260 = (_zz_136 & (~ _zz_261));
  assign _zz_261 = (_zz_136 - 2'b01);
  assign _zz_262 = (_zz_138 & (~ _zz_263));
  assign _zz_263 = (_zz_138 - 2'b01);
  assign _zz_264 = memory_MulDivIterativePlugin_mul_counter_willIncrement;
  assign _zz_265 = {5'd0, _zz_264};
  assign _zz_266 = (_zz_268 + _zz_270);
  assign _zz_267 = (memory_MulDivIterativePlugin_rs2[0] ? memory_MulDivIterativePlugin_rs1 : 33'h0);
  assign _zz_268 = {{1{_zz_267[32]}}, _zz_267};
  assign _zz_269 = _zz_271;
  assign _zz_270 = {{1{_zz_269[32]}}, _zz_269};
  assign _zz_271 = (memory_MulDivIterativePlugin_accumulator >>> 32);
  assign _zz_272 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_273 = {5'd0, _zz_272};
  assign _zz_274 = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_275 = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_276 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_277 = {_zz_140,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_278 = _zz_279;
  assign _zz_279 = _zz_280;
  assign _zz_280 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_141) : _zz_141)} + _zz_282);
  assign _zz_281 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_282 = {32'd0, _zz_281};
  assign _zz_283 = _zz_143;
  assign _zz_284 = {32'd0, _zz_283};
  assign _zz_285 = _zz_142;
  assign _zz_286 = {31'd0, _zz_285};
  assign _zz_287 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_288 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_289 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_290 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_291 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_292 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_293 = (iBus_cmd_payload_address >>> 5);
  assign _zz_294 = 1'b1;
  assign _zz_295 = 1'b1;
  assign _zz_296 = {_zz_54,_zz_53};
  assign _zz_297 = 32'h0000107f;
  assign _zz_298 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_299 = 32'h00002073;
  assign _zz_300 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_301 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_302 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_303) == 32'h00000003),{(_zz_304 == _zz_305),{_zz_306,{_zz_307,_zz_308}}}}}};
  assign _zz_303 = 32'h0000505f;
  assign _zz_304 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_305 = 32'h00000063;
  assign _zz_306 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_307 = ((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033);
  assign _zz_308 = {((decode_INSTRUCTION & 32'hfc00305f) == 32'h00001013),{((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & _zz_309) == 32'h00005033),{(_zz_310 == _zz_311),{_zz_312,{_zz_313,_zz_314}}}}}};
  assign _zz_309 = 32'hbe00707f;
  assign _zz_310 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_311 = 32'h00000033;
  assign _zz_312 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_313 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz_314 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h00000073);
  assign _zz_315 = decode_INSTRUCTION[31];
  assign _zz_316 = decode_INSTRUCTION[31];
  assign _zz_317 = decode_INSTRUCTION[7];
  assign _zz_318 = 32'h02004064;
  assign _zz_319 = _zz_89;
  assign _zz_320 = {_zz_87,_zz_88};
  assign _zz_321 = ((decode_INSTRUCTION & 32'h02004074) == 32'h02000030);
  assign _zz_322 = 1'b0;
  assign _zz_323 = (((decode_INSTRUCTION & _zz_326) == 32'h00000050) != 1'b0);
  assign _zz_324 = ((_zz_327 == _zz_328) != 1'b0);
  assign _zz_325 = {({_zz_329,_zz_330} != 2'b00),{(_zz_331 != _zz_332),{_zz_333,{_zz_334,_zz_335}}}};
  assign _zz_326 = 32'h10003050;
  assign _zz_327 = (decode_INSTRUCTION & 32'h10403050);
  assign _zz_328 = 32'h10000050;
  assign _zz_329 = ((decode_INSTRUCTION & _zz_336) == 32'h00001050);
  assign _zz_330 = ((decode_INSTRUCTION & _zz_337) == 32'h00002050);
  assign _zz_331 = {_zz_86,(_zz_338 == _zz_339)};
  assign _zz_332 = 2'b00;
  assign _zz_333 = ((_zz_340 == _zz_341) != 1'b0);
  assign _zz_334 = ({_zz_342,_zz_343} != 2'b00);
  assign _zz_335 = {(_zz_344 != _zz_345),{_zz_346,{_zz_347,_zz_348}}};
  assign _zz_336 = 32'h00001050;
  assign _zz_337 = 32'h00002050;
  assign _zz_338 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_339 = 32'h00000004;
  assign _zz_340 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_341 = 32'h00000040;
  assign _zz_342 = ((decode_INSTRUCTION & _zz_349) == 32'h00005010);
  assign _zz_343 = ((decode_INSTRUCTION & _zz_350) == 32'h00005020);
  assign _zz_344 = {(_zz_351 == _zz_352),{_zz_353,_zz_354}};
  assign _zz_345 = 3'b000;
  assign _zz_346 = ({_zz_355,{_zz_356,_zz_357}} != 3'b000);
  assign _zz_347 = (_zz_358 != 1'b0);
  assign _zz_348 = {(_zz_359 != _zz_360),{_zz_361,{_zz_362,_zz_363}}};
  assign _zz_349 = 32'h00007034;
  assign _zz_350 = 32'h02007064;
  assign _zz_351 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_352 = 32'h40001010;
  assign _zz_353 = ((decode_INSTRUCTION & _zz_364) == 32'h00001010);
  assign _zz_354 = ((decode_INSTRUCTION & _zz_365) == 32'h00001010);
  assign _zz_355 = ((decode_INSTRUCTION & _zz_366) == 32'h00000024);
  assign _zz_356 = (_zz_367 == _zz_368);
  assign _zz_357 = (_zz_369 == _zz_370);
  assign _zz_358 = ((decode_INSTRUCTION & _zz_371) == 32'h00001000);
  assign _zz_359 = _zz_87;
  assign _zz_360 = 1'b0;
  assign _zz_361 = ({_zz_372,_zz_373} != 2'b00);
  assign _zz_362 = (_zz_374 != _zz_375);
  assign _zz_363 = {_zz_376,{_zz_377,_zz_378}};
  assign _zz_364 = 32'h00007034;
  assign _zz_365 = 32'h02007054;
  assign _zz_366 = 32'h00000064;
  assign _zz_367 = (decode_INSTRUCTION & 32'h00003034);
  assign _zz_368 = 32'h00001010;
  assign _zz_369 = (decode_INSTRUCTION & 32'h02003054);
  assign _zz_370 = 32'h00001010;
  assign _zz_371 = 32'h00001000;
  assign _zz_372 = ((decode_INSTRUCTION & _zz_379) == 32'h00002000);
  assign _zz_373 = ((decode_INSTRUCTION & _zz_380) == 32'h00001000);
  assign _zz_374 = {(_zz_381 == _zz_382),(_zz_383 == _zz_384)};
  assign _zz_375 = 2'b00;
  assign _zz_376 = ({_zz_385,{_zz_386,_zz_387}} != 3'b000);
  assign _zz_377 = (_zz_388 != 1'b0);
  assign _zz_378 = {(_zz_389 != _zz_390),{_zz_391,{_zz_392,_zz_393}}};
  assign _zz_379 = 32'h00002010;
  assign _zz_380 = 32'h00005000;
  assign _zz_381 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz_382 = 32'h00000020;
  assign _zz_383 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_384 = 32'h00000020;
  assign _zz_385 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz_386 = ((decode_INSTRUCTION & _zz_394) == 32'h0);
  assign _zz_387 = ((decode_INSTRUCTION & _zz_395) == 32'h00000040);
  assign _zz_388 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_389 = ((decode_INSTRUCTION & _zz_396) == 32'h00000010);
  assign _zz_390 = 1'b0;
  assign _zz_391 = ({_zz_85,{_zz_397,_zz_398}} != 3'b000);
  assign _zz_392 = ({_zz_399,_zz_400} != 6'h0);
  assign _zz_393 = {(_zz_401 != _zz_402),{_zz_403,{_zz_404,_zz_405}}};
  assign _zz_394 = 32'h00000038;
  assign _zz_395 = 32'h00403040;
  assign _zz_396 = 32'h00000010;
  assign _zz_397 = ((decode_INSTRUCTION & _zz_406) == 32'h00000010);
  assign _zz_398 = ((decode_INSTRUCTION & _zz_407) == 32'h00000020);
  assign _zz_399 = _zz_86;
  assign _zz_400 = {(_zz_408 == _zz_409),{_zz_410,{_zz_411,_zz_412}}};
  assign _zz_401 = {_zz_85,(_zz_413 == _zz_414)};
  assign _zz_402 = 2'b00;
  assign _zz_403 = ({_zz_85,_zz_415} != 2'b00);
  assign _zz_404 = ({_zz_416,_zz_417} != 2'b00);
  assign _zz_405 = {(_zz_418 != _zz_419),{_zz_420,{_zz_421,_zz_422}}};
  assign _zz_406 = 32'h00000030;
  assign _zz_407 = 32'h02000060;
  assign _zz_408 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_409 = 32'h00001010;
  assign _zz_410 = ((decode_INSTRUCTION & _zz_423) == 32'h00002010);
  assign _zz_411 = (_zz_424 == _zz_425);
  assign _zz_412 = {_zz_426,_zz_427};
  assign _zz_413 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_414 = 32'h00000020;
  assign _zz_415 = ((decode_INSTRUCTION & _zz_428) == 32'h0);
  assign _zz_416 = (_zz_429 == _zz_430);
  assign _zz_417 = (_zz_431 == _zz_432);
  assign _zz_418 = (_zz_433 == _zz_434);
  assign _zz_419 = 1'b0;
  assign _zz_420 = ({_zz_435,_zz_436} != 4'b0000);
  assign _zz_421 = (_zz_437 != _zz_438);
  assign _zz_422 = {_zz_439,{_zz_440,_zz_441}};
  assign _zz_423 = 32'h00002010;
  assign _zz_424 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_425 = 32'h00000010;
  assign _zz_426 = ((decode_INSTRUCTION & _zz_442) == 32'h00000004);
  assign _zz_427 = ((decode_INSTRUCTION & _zz_443) == 32'h0);
  assign _zz_428 = 32'h00000020;
  assign _zz_429 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz_430 = 32'h00006010;
  assign _zz_431 = (decode_INSTRUCTION & 32'h00005014);
  assign _zz_432 = 32'h00004010;
  assign _zz_433 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz_434 = 32'h00002010;
  assign _zz_435 = (_zz_444 == _zz_445);
  assign _zz_436 = {_zz_446,{_zz_447,_zz_448}};
  assign _zz_437 = (_zz_449 == _zz_450);
  assign _zz_438 = 1'b0;
  assign _zz_439 = ({_zz_451,_zz_452} != 3'b000);
  assign _zz_440 = (_zz_453 != _zz_454);
  assign _zz_441 = {_zz_455,_zz_456};
  assign _zz_442 = 32'h0000000c;
  assign _zz_443 = 32'h00000028;
  assign _zz_444 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_445 = 32'h0;
  assign _zz_446 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_447 = ((decode_INSTRUCTION & _zz_457) == 32'h00002000);
  assign _zz_448 = ((decode_INSTRUCTION & _zz_458) == 32'h00001000);
  assign _zz_449 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_450 = 32'h0;
  assign _zz_451 = ((decode_INSTRUCTION & _zz_459) == 32'h00000040);
  assign _zz_452 = {(_zz_460 == _zz_461),(_zz_462 == _zz_463)};
  assign _zz_453 = {(_zz_464 == _zz_465),_zz_84};
  assign _zz_454 = 2'b00;
  assign _zz_455 = ({_zz_466,_zz_84} != 2'b00);
  assign _zz_456 = ((_zz_467 == _zz_468) != 1'b0);
  assign _zz_457 = 32'h00006004;
  assign _zz_458 = 32'h00005004;
  assign _zz_459 = 32'h00000044;
  assign _zz_460 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz_461 = 32'h00002010;
  assign _zz_462 = (decode_INSTRUCTION & 32'h40004034);
  assign _zz_463 = 32'h40000030;
  assign _zz_464 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz_465 = 32'h00000004;
  assign _zz_466 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_467 = (decode_INSTRUCTION & 32'h00001048);
  assign _zz_468 = 32'h00001008;
  assign _zz_469 = execute_INSTRUCTION[31];
  assign _zz_470 = execute_INSTRUCTION[31];
  assign _zz_471 = execute_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_294) begin
      _zz_167 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_295) begin
      _zz_168 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_39) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (_zz_158                                                     ), //i
    .io_cpu_prefetch_isValid                  (_zz_159                                                     ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt               ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]       ), //i
    .io_cpu_fetch_isValid                     (_zz_160                                                     ), //i
    .io_cpu_fetch_isStuck                     (_zz_161                                                     ), //i
    .io_cpu_fetch_isRemoved                   (_zz_162                                                     ), //i
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
    .io_cpu_decode_isValid                    (_zz_163                                                     ), //i
    .io_cpu_decode_isStuck                    (_zz_164                                                     ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss              ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error                  ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling           ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException           ), //o
    .io_cpu_decode_isUser                     (_zz_165                                                     ), //i
    .io_cpu_fill_valid                        (_zz_166                                                     ), //i
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
    case(_zz_296)
      2'b00 : begin
        _zz_169 = CsrPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_169 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_169 = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
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
    case(_zz_4)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_4_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_4_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_4_string = "ECALL";
      default : _zz_4_string = "?????";
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
    case(_zz_8)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_8_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_8_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_8_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_8_string = "JALR";
      default : _zz_8_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_9_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_9_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_9_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_9_string = "JALR";
      default : _zz_9_string = "????";
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
    case(_zz_10)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_10_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_10_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_10_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_10_string = "SRA_1    ";
      default : _zz_10_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_11_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_11_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_11_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_11_string = "SRA_1    ";
      default : _zz_11_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_12_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_12_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_12_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_12_string = "SRA_1    ";
      default : _zz_12_string = "?????????";
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
    case(_zz_13)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_13_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_13_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_13_string = "AND_1";
      default : _zz_13_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_14_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_14_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_14_string = "AND_1";
      default : _zz_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_15_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_15_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_15_string = "AND_1";
      default : _zz_15_string = "?????";
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
    case(_zz_16)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_16_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_16_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_16_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_16_string = "PC ";
      default : _zz_16_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_17_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_17_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_17_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_17_string = "PC ";
      default : _zz_17_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_18_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_18_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_18_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_18_string = "PC ";
      default : _zz_18_string = "???";
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
    case(_zz_19)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_19_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_19_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_19_string = "BITWISE ";
      default : _zz_19_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_20)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_20_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_20_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_20_string = "BITWISE ";
      default : _zz_20_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_21_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_21_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_21_string = "BITWISE ";
      default : _zz_21_string = "????????";
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
    case(_zz_22)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_22_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_22_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_22_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_22_string = "URS1        ";
      default : _zz_22_string = "????????????";
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
    case(_zz_24)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_24_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_24_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_24_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_24_string = "URS1        ";
      default : _zz_24_string = "????????????";
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
    case(_zz_25)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_25_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_25_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_25_string = "ECALL";
      default : _zz_25_string = "?????";
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
    case(_zz_26)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_26_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_26_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_26_string = "ECALL";
      default : _zz_26_string = "?????";
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
    case(_zz_27)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_27_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_27_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_27_string = "ECALL";
      default : _zz_27_string = "?????";
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
    case(_zz_28)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_28_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_28_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_28_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_28_string = "JALR";
      default : _zz_28_string = "????";
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
    case(_zz_31)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_31_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_31_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_31_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_31_string = "SRA_1    ";
      default : _zz_31_string = "?????????";
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
    case(_zz_33)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_33_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_33_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_33_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_33_string = "PC ";
      default : _zz_33_string = "???";
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
    case(_zz_34)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_34_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_34_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_34_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_34_string = "URS1        ";
      default : _zz_34_string = "????????????";
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
    case(_zz_35)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_35_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_35_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_35_string = "BITWISE ";
      default : _zz_35_string = "????????";
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
    case(_zz_36)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_36_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_36_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_36_string = "AND_1";
      default : _zz_36_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_40)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_40_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_40_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_40_string = "ECALL";
      default : _zz_40_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_41)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_41_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_41_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_41_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_41_string = "JALR";
      default : _zz_41_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_42)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_42_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_42_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_42_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_42_string = "SRA_1    ";
      default : _zz_42_string = "?????????";
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
    case(_zz_44)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_44_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_44_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_44_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_44_string = "PC ";
      default : _zz_44_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_45_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_45_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_45_string = "BITWISE ";
      default : _zz_45_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_46)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_46_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_46_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_46_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_46_string = "URS1        ";
      default : _zz_46_string = "????????????";
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
    case(_zz_48)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_48_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_48_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_48_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_48_string = "JALR";
      default : _zz_48_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_90)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_90_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_90_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_90_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_90_string = "URS1        ";
      default : _zz_90_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_91)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_91_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_91_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_91_string = "BITWISE ";
      default : _zz_91_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_92)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_92_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_92_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_92_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_92_string = "PC ";
      default : _zz_92_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_93)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_93_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_93_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_93_string = "AND_1";
      default : _zz_93_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_94)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_94_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_94_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_94_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_94_string = "SRA_1    ";
      default : _zz_94_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_95)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_95_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_95_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_95_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_95_string = "JALR";
      default : _zz_95_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_96)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_96_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_96_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_96_string = "ECALL";
      default : _zz_96_string = "?????";
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
  `endif

  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_98;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_IS_DIV = _zz_208[0];
  assign decode_IS_RS2_SIGNED = _zz_209[0];
  assign decode_IS_RS1_SIGNED = _zz_210[0];
  assign decode_IS_MUL = _zz_211[0];
  assign _zz_1 = _zz_2;
  assign _zz_3 = _zz_4;
  assign decode_ENV_CTRL = _zz_5;
  assign _zz_6 = _zz_7;
  assign decode_IS_CSR = _zz_212[0];
  assign _zz_8 = _zz_9;
  assign decode_SHIFT_CTRL = _zz_10;
  assign _zz_11 = _zz_12;
  assign decode_ALU_BITWISE_CTRL = _zz_13;
  assign _zz_14 = _zz_15;
  assign decode_SRC_LESS_UNSIGNED = _zz_213[0];
  assign decode_MEMORY_STORE = _zz_214[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_215[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_216[0];
  assign decode_SRC2_CTRL = _zz_16;
  assign _zz_17 = _zz_18;
  assign decode_ALU_CTRL = _zz_19;
  assign _zz_20 = _zz_21;
  assign decode_MEMORY_ENABLE = _zz_217[0];
  assign decode_SRC1_CTRL = _zz_22;
  assign _zz_23 = _zz_24;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_25;
  assign execute_ENV_CTRL = _zz_26;
  assign writeBack_ENV_CTRL = _zz_27;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_COND_RESULT = _zz_119;
  assign execute_BRANCH_CTRL = _zz_28;
  assign decode_RS2_USE = _zz_218[0];
  assign decode_RS1_USE = _zz_219[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  always @ (*) begin
    _zz_29 = memory_REGFILE_WRITE_DATA;
    if(_zz_170)begin
      _zz_29 = ((memory_INSTRUCTION[13 : 12] == 2'b00) ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_accumulator[63 : 32]);
    end
    if(_zz_171)begin
      _zz_29 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_108)begin
      if((_zz_109 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_110;
      end
    end
    if(_zz_172)begin
      if(_zz_173)begin
        if(_zz_112)begin
          decode_RS2 = _zz_47;
        end
      end
    end
    if(_zz_174)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_114)begin
          decode_RS2 = _zz_29;
        end
      end
    end
    if(_zz_175)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_116)begin
          decode_RS2 = _zz_30;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_108)begin
      if((_zz_109 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_110;
      end
    end
    if(_zz_172)begin
      if(_zz_173)begin
        if(_zz_111)begin
          decode_RS1 = _zz_47;
        end
      end
    end
    if(_zz_174)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_113)begin
          decode_RS1 = _zz_29;
        end
      end
    end
    if(_zz_175)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_115)begin
          decode_RS1 = _zz_30;
        end
      end
    end
  end

  always @ (*) begin
    _zz_30 = execute_REGFILE_WRITE_DATA;
    if(_zz_176)begin
      _zz_30 = _zz_105;
    end
    if(_zz_177)begin
      _zz_30 = execute_CsrPlugin_readData;
    end
  end

  assign execute_SHIFT_CTRL = _zz_31;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_32 = execute_PC;
  assign execute_SRC2_CTRL = _zz_33;
  assign execute_SRC1_CTRL = _zz_34;
  assign decode_SRC_USE_SUB_LESS = _zz_220[0];
  assign decode_SRC_ADD_ZERO = _zz_221[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_35;
  assign execute_SRC2 = _zz_104;
  assign execute_SRC1 = _zz_99;
  assign execute_ALU_BITWISE_CTRL = _zz_36;
  assign _zz_37 = writeBack_INSTRUCTION;
  assign _zz_38 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_39 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_39 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_222[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_297) == 32'h00001073),{(_zz_298 == _zz_299),{_zz_300,{_zz_301,_zz_302}}}}}}} != 20'h0);
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_47 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_47 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = (((dBus_cmd_payload_size == 2'b10) && (dBus_cmd_payload_address[1 : 0] != 2'b00)) || ((dBus_cmd_payload_size == 2'b01) && (dBus_cmd_payload_address[0 : 0] != 1'b0)));
  assign decode_FLUSH_ALL = _zz_223[0];
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(_zz_178)begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(_zz_179)begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(_zz_180)begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_181)begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_48;
  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @ (*) begin
    _zz_49 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_49 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_50 = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      _zz_50 = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_106 || _zz_107)))begin
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
    if(_zz_182)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_182)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_76)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_176)begin
      if((! execute_LightShifterPlugin_done))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_177)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(_zz_170)begin
      if(((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc)))begin
        memory_arbitration_haltItself = 1'b1;
      end
      if(_zz_183)begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_171)begin
      if(((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(_zz_184)begin
      memory_arbitration_removeIt = 1'b1;
    end
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
    if(_zz_184)begin
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
    if(_zz_185)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_186)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_185)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_186)begin
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
    if(_zz_185)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_186)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_185)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_186)begin
      case(_zz_187)
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
  assign IBusCachedPlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusCachedPlugin_predictionJumpInterface_valid}} != 3'b000);
  assign _zz_51 = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_52 = (_zz_51 & (~ _zz_224));
  assign _zz_53 = _zz_52[1];
  assign _zz_54 = _zz_52[2];
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_169;
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
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_226);
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

  assign _zz_55 = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_55);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_55);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_56 = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_56);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_56);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_57 = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_57);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_57);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_58;
  assign _zz_58 = ((1'b0 && (! _zz_59)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_59 = _zz_60;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_59;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_61)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_61 = _zz_62;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_61;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_63;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if((! IBusCachedPlugin_pcValids_0))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
  assign _zz_64 = _zz_227[11];
  always @ (*) begin
    _zz_65[18] = _zz_64;
    _zz_65[17] = _zz_64;
    _zz_65[16] = _zz_64;
    _zz_65[15] = _zz_64;
    _zz_65[14] = _zz_64;
    _zz_65[13] = _zz_64;
    _zz_65[12] = _zz_64;
    _zz_65[11] = _zz_64;
    _zz_65[10] = _zz_64;
    _zz_65[9] = _zz_64;
    _zz_65[8] = _zz_64;
    _zz_65[7] = _zz_64;
    _zz_65[6] = _zz_64;
    _zz_65[5] = _zz_64;
    _zz_65[4] = _zz_64;
    _zz_65[3] = _zz_64;
    _zz_65[2] = _zz_64;
    _zz_65[1] = _zz_64;
    _zz_65[0] = _zz_64;
  end

  always @ (*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_228[31]));
    if(_zz_70)begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_66 = _zz_229[19];
  always @ (*) begin
    _zz_67[10] = _zz_66;
    _zz_67[9] = _zz_66;
    _zz_67[8] = _zz_66;
    _zz_67[7] = _zz_66;
    _zz_67[6] = _zz_66;
    _zz_67[5] = _zz_66;
    _zz_67[4] = _zz_66;
    _zz_67[3] = _zz_66;
    _zz_67[2] = _zz_66;
    _zz_67[1] = _zz_66;
    _zz_67[0] = _zz_66;
  end

  assign _zz_68 = _zz_230[11];
  always @ (*) begin
    _zz_69[18] = _zz_68;
    _zz_69[17] = _zz_68;
    _zz_69[16] = _zz_68;
    _zz_69[15] = _zz_68;
    _zz_69[14] = _zz_68;
    _zz_69[13] = _zz_68;
    _zz_69[12] = _zz_68;
    _zz_69[11] = _zz_68;
    _zz_69[10] = _zz_68;
    _zz_69[9] = _zz_68;
    _zz_69[8] = _zz_68;
    _zz_69[7] = _zz_68;
    _zz_69[6] = _zz_68;
    _zz_69[5] = _zz_68;
    _zz_69[4] = _zz_68;
    _zz_69[3] = _zz_68;
    _zz_69[2] = _zz_68;
    _zz_69[1] = _zz_68;
    _zz_69[0] = _zz_68;
  end

  always @ (*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_70 = _zz_231[1];
      end
      default : begin
        _zz_70 = _zz_232[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_71 = _zz_233[19];
  always @ (*) begin
    _zz_72[10] = _zz_71;
    _zz_72[9] = _zz_71;
    _zz_72[8] = _zz_71;
    _zz_72[7] = _zz_71;
    _zz_72[6] = _zz_71;
    _zz_72[5] = _zz_71;
    _zz_72[4] = _zz_71;
    _zz_72[3] = _zz_71;
    _zz_72[2] = _zz_71;
    _zz_72[1] = _zz_71;
    _zz_72[0] = _zz_71;
  end

  assign _zz_73 = _zz_234[11];
  always @ (*) begin
    _zz_74[18] = _zz_73;
    _zz_74[17] = _zz_73;
    _zz_74[16] = _zz_73;
    _zz_74[15] = _zz_73;
    _zz_74[14] = _zz_73;
    _zz_74[13] = _zz_73;
    _zz_74[12] = _zz_73;
    _zz_74[11] = _zz_73;
    _zz_74[10] = _zz_73;
    _zz_74[9] = _zz_73;
    _zz_74[8] = _zz_73;
    _zz_74[7] = _zz_73;
    _zz_74[6] = _zz_73;
    _zz_74[5] = _zz_73;
    _zz_74[4] = _zz_73;
    _zz_74[3] = _zz_73;
    _zz_74[2] = _zz_73;
    _zz_74[1] = _zz_73;
    _zz_74[0] = _zz_73;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_72,{{{_zz_315,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_74,{{{_zz_316,_zz_317},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_159 = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_160 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_161 = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_160;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign _zz_163 = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_164 = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_165 = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_181)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_179)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_166 = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_179)begin
      _zz_166 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_180)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_178)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(_zz_180)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(_zz_178)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign _zz_158 = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign _zz_76 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_76));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_77 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_77 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_77 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_77;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_78 = 4'b0001;
      end
      2'b01 : begin
        _zz_78 = 4'b0011;
      end
      default : begin
        _zz_78 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_78 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(_zz_188)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if((! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers)))))begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(_zz_188)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = 4'b0101;
    end
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_235};
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
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

  assign _zz_79 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_80[31] = _zz_79;
    _zz_80[30] = _zz_79;
    _zz_80[29] = _zz_79;
    _zz_80[28] = _zz_79;
    _zz_80[27] = _zz_79;
    _zz_80[26] = _zz_79;
    _zz_80[25] = _zz_79;
    _zz_80[24] = _zz_79;
    _zz_80[23] = _zz_79;
    _zz_80[22] = _zz_79;
    _zz_80[21] = _zz_79;
    _zz_80[20] = _zz_79;
    _zz_80[19] = _zz_79;
    _zz_80[18] = _zz_79;
    _zz_80[17] = _zz_79;
    _zz_80[16] = _zz_79;
    _zz_80[15] = _zz_79;
    _zz_80[14] = _zz_79;
    _zz_80[13] = _zz_79;
    _zz_80[12] = _zz_79;
    _zz_80[11] = _zz_79;
    _zz_80[10] = _zz_79;
    _zz_80[9] = _zz_79;
    _zz_80[8] = _zz_79;
    _zz_80[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_81 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_82[31] = _zz_81;
    _zz_82[30] = _zz_81;
    _zz_82[29] = _zz_81;
    _zz_82[28] = _zz_81;
    _zz_82[27] = _zz_81;
    _zz_82[26] = _zz_81;
    _zz_82[25] = _zz_81;
    _zz_82[24] = _zz_81;
    _zz_82[23] = _zz_81;
    _zz_82[22] = _zz_81;
    _zz_82[21] = _zz_81;
    _zz_82[20] = _zz_81;
    _zz_82[19] = _zz_81;
    _zz_82[18] = _zz_81;
    _zz_82[17] = _zz_81;
    _zz_82[16] = _zz_81;
    _zz_82[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_206)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_80;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_82;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
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
  assign _zz_84 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_85 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_86 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_87 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_88 = ((decode_INSTRUCTION & 32'h00007000) == 32'h00001000);
  assign _zz_89 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00004000);
  assign _zz_83 = {(((decode_INSTRUCTION & _zz_318) == 32'h02004020) != 1'b0),{({_zz_89,_zz_88} != 2'b00),{({_zz_319,_zz_320} != 3'b000),{(_zz_321 != _zz_322),{_zz_323,{_zz_324,_zz_325}}}}}};
  assign _zz_90 = _zz_83[2 : 1];
  assign _zz_46 = _zz_90;
  assign _zz_91 = _zz_83[7 : 6];
  assign _zz_45 = _zz_91;
  assign _zz_92 = _zz_83[9 : 8];
  assign _zz_44 = _zz_92;
  assign _zz_93 = _zz_83[18 : 17];
  assign _zz_43 = _zz_93;
  assign _zz_94 = _zz_83[21 : 20];
  assign _zz_42 = _zz_94;
  assign _zz_95 = _zz_83[23 : 22];
  assign _zz_41 = _zz_95;
  assign _zz_96 = _zz_83[26 : 25];
  assign _zz_40 = _zz_96;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_167;
  assign decode_RegFilePlugin_rs2Data = _zz_168;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_38 && writeBack_arbitration_isFiring);
    if(_zz_97)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_37[11 : 7];
    if(_zz_97)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_47;
    if(_zz_97)begin
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
        _zz_98 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_98 = {31'd0, _zz_236};
      end
      default : begin
        _zz_98 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_99 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_99 = {29'd0, _zz_237};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_99 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_99 = {27'd0, _zz_238};
      end
    endcase
  end

  assign _zz_100 = _zz_239[11];
  always @ (*) begin
    _zz_101[19] = _zz_100;
    _zz_101[18] = _zz_100;
    _zz_101[17] = _zz_100;
    _zz_101[16] = _zz_100;
    _zz_101[15] = _zz_100;
    _zz_101[14] = _zz_100;
    _zz_101[13] = _zz_100;
    _zz_101[12] = _zz_100;
    _zz_101[11] = _zz_100;
    _zz_101[10] = _zz_100;
    _zz_101[9] = _zz_100;
    _zz_101[8] = _zz_100;
    _zz_101[7] = _zz_100;
    _zz_101[6] = _zz_100;
    _zz_101[5] = _zz_100;
    _zz_101[4] = _zz_100;
    _zz_101[3] = _zz_100;
    _zz_101[2] = _zz_100;
    _zz_101[1] = _zz_100;
    _zz_101[0] = _zz_100;
  end

  assign _zz_102 = _zz_240[11];
  always @ (*) begin
    _zz_103[19] = _zz_102;
    _zz_103[18] = _zz_102;
    _zz_103[17] = _zz_102;
    _zz_103[16] = _zz_102;
    _zz_103[15] = _zz_102;
    _zz_103[14] = _zz_102;
    _zz_103[13] = _zz_102;
    _zz_103[12] = _zz_102;
    _zz_103[11] = _zz_102;
    _zz_103[10] = _zz_102;
    _zz_103[9] = _zz_102;
    _zz_103[8] = _zz_102;
    _zz_103[7] = _zz_102;
    _zz_103[6] = _zz_102;
    _zz_103[5] = _zz_102;
    _zz_103[4] = _zz_102;
    _zz_103[3] = _zz_102;
    _zz_103[2] = _zz_102;
    _zz_103[1] = _zz_102;
    _zz_103[0] = _zz_102;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_104 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_104 = {_zz_101,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_104 = {_zz_103,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_104 = _zz_32;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_241;
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
        _zz_105 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_105 = _zz_248;
      end
    endcase
  end

  always @ (*) begin
    _zz_106 = 1'b0;
    if(_zz_189)begin
      if(_zz_190)begin
        if(_zz_111)begin
          _zz_106 = 1'b1;
        end
      end
    end
    if(_zz_191)begin
      if(_zz_192)begin
        if(_zz_113)begin
          _zz_106 = 1'b1;
        end
      end
    end
    if(_zz_193)begin
      if(_zz_194)begin
        if(_zz_115)begin
          _zz_106 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_106 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_107 = 1'b0;
    if(_zz_189)begin
      if(_zz_190)begin
        if(_zz_112)begin
          _zz_107 = 1'b1;
        end
      end
    end
    if(_zz_191)begin
      if(_zz_192)begin
        if(_zz_114)begin
          _zz_107 = 1'b1;
        end
      end
    end
    if(_zz_193)begin
      if(_zz_194)begin
        if(_zz_116)begin
          _zz_107 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_107 = 1'b0;
    end
  end

  assign _zz_111 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_112 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_113 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_114 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_115 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_116 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_117 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_117 == 3'b000)) begin
        _zz_118 = execute_BranchPlugin_eq;
    end else if((_zz_117 == 3'b001)) begin
        _zz_118 = (! execute_BranchPlugin_eq);
    end else if((((_zz_117 & 3'b101) == 3'b101))) begin
        _zz_118 = (! execute_SRC_LESS);
    end else begin
        _zz_118 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_119 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_119 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_119 = 1'b1;
      end
      default : begin
        _zz_119 = _zz_118;
      end
    endcase
  end

  assign _zz_120 = _zz_250[11];
  always @ (*) begin
    _zz_121[19] = _zz_120;
    _zz_121[18] = _zz_120;
    _zz_121[17] = _zz_120;
    _zz_121[16] = _zz_120;
    _zz_121[15] = _zz_120;
    _zz_121[14] = _zz_120;
    _zz_121[13] = _zz_120;
    _zz_121[12] = _zz_120;
    _zz_121[11] = _zz_120;
    _zz_121[10] = _zz_120;
    _zz_121[9] = _zz_120;
    _zz_121[8] = _zz_120;
    _zz_121[7] = _zz_120;
    _zz_121[6] = _zz_120;
    _zz_121[5] = _zz_120;
    _zz_121[4] = _zz_120;
    _zz_121[3] = _zz_120;
    _zz_121[2] = _zz_120;
    _zz_121[1] = _zz_120;
    _zz_121[0] = _zz_120;
  end

  assign _zz_122 = _zz_251[19];
  always @ (*) begin
    _zz_123[10] = _zz_122;
    _zz_123[9] = _zz_122;
    _zz_123[8] = _zz_122;
    _zz_123[7] = _zz_122;
    _zz_123[6] = _zz_122;
    _zz_123[5] = _zz_122;
    _zz_123[4] = _zz_122;
    _zz_123[3] = _zz_122;
    _zz_123[2] = _zz_122;
    _zz_123[1] = _zz_122;
    _zz_123[0] = _zz_122;
  end

  assign _zz_124 = _zz_252[11];
  always @ (*) begin
    _zz_125[18] = _zz_124;
    _zz_125[17] = _zz_124;
    _zz_125[16] = _zz_124;
    _zz_125[15] = _zz_124;
    _zz_125[14] = _zz_124;
    _zz_125[13] = _zz_124;
    _zz_125[12] = _zz_124;
    _zz_125[11] = _zz_124;
    _zz_125[10] = _zz_124;
    _zz_125[9] = _zz_124;
    _zz_125[8] = _zz_124;
    _zz_125[7] = _zz_124;
    _zz_125[6] = _zz_124;
    _zz_125[5] = _zz_124;
    _zz_125[4] = _zz_124;
    _zz_125[3] = _zz_124;
    _zz_125[2] = _zz_124;
    _zz_125[1] = _zz_124;
    _zz_125[0] = _zz_124;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_126 = (_zz_253[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_126 = _zz_254[1];
      end
      default : begin
        _zz_126 = _zz_255[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_126);
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

  assign _zz_127 = _zz_256[11];
  always @ (*) begin
    _zz_128[19] = _zz_127;
    _zz_128[18] = _zz_127;
    _zz_128[17] = _zz_127;
    _zz_128[16] = _zz_127;
    _zz_128[15] = _zz_127;
    _zz_128[14] = _zz_127;
    _zz_128[13] = _zz_127;
    _zz_128[12] = _zz_127;
    _zz_128[11] = _zz_127;
    _zz_128[10] = _zz_127;
    _zz_128[9] = _zz_127;
    _zz_128[8] = _zz_127;
    _zz_128[7] = _zz_127;
    _zz_128[6] = _zz_127;
    _zz_128[5] = _zz_127;
    _zz_128[4] = _zz_127;
    _zz_128[3] = _zz_127;
    _zz_128[2] = _zz_127;
    _zz_128[1] = _zz_127;
    _zz_128[0] = _zz_127;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_128,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_130,{{{_zz_469,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_132,{{{_zz_470,_zz_471},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_259};
        end
      end
    endcase
  end

  assign _zz_129 = _zz_257[19];
  always @ (*) begin
    _zz_130[10] = _zz_129;
    _zz_130[9] = _zz_129;
    _zz_130[8] = _zz_129;
    _zz_130[7] = _zz_129;
    _zz_130[6] = _zz_129;
    _zz_130[5] = _zz_129;
    _zz_130[4] = _zz_129;
    _zz_130[3] = _zz_129;
    _zz_130[2] = _zz_129;
    _zz_130[1] = _zz_129;
    _zz_130[0] = _zz_129;
  end

  assign _zz_131 = _zz_258[11];
  always @ (*) begin
    _zz_132[18] = _zz_131;
    _zz_132[17] = _zz_131;
    _zz_132[16] = _zz_131;
    _zz_132[15] = _zz_131;
    _zz_132[14] = _zz_131;
    _zz_132[13] = _zz_131;
    _zz_132[12] = _zz_131;
    _zz_132[11] = _zz_131;
    _zz_132[10] = _zz_131;
    _zz_132[9] = _zz_131;
    _zz_132[8] = _zz_131;
    _zz_132[7] = _zz_131;
    _zz_132[6] = _zz_131;
    _zz_132[5] = _zz_131;
    _zz_132[4] = _zz_131;
    _zz_132[3] = _zz_131;
    _zz_132[2] = _zz_131;
    _zz_132[1] = _zz_131;
    _zz_132[0] = _zz_131;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_133 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_134 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_135 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_136 = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_137 = _zz_260[0];
  assign _zz_138 = {BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid};
  assign _zz_139 = _zz_262[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_182)begin
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
    if(_zz_184)begin
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
    if(execute_CsrPlugin_csr_3008)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_4032)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_195)begin
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
    if(_zz_196)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(_zz_196)begin
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
    if(_zz_195)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_195)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_207)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b0;
    if(_zz_170)begin
      if(_zz_183)begin
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
      memory_MulDivIterativePlugin_mul_counter_valueNext = (memory_MulDivIterativePlugin_mul_counter_value + _zz_265);
    end
    if(memory_MulDivIterativePlugin_mul_counter_willClear)begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_171)begin
      if(_zz_197)begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_198)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_273);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_140 = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_140[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_274);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_275 : _zz_276);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_277[31:0];
  assign _zz_141 = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_142 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_143 = ((execute_IS_MUL && _zz_142) || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_144[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_144[31 : 0] = execute_RS1;
  end

  assign _zz_146 = (_zz_145 & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_146 != 32'h0);
  assign _zz_24 = decode_SRC1_CTRL;
  assign _zz_22 = _zz_46;
  assign _zz_34 = decode_to_execute_SRC1_CTRL;
  assign _zz_21 = decode_ALU_CTRL;
  assign _zz_19 = _zz_45;
  assign _zz_35 = decode_to_execute_ALU_CTRL;
  assign _zz_18 = decode_SRC2_CTRL;
  assign _zz_16 = _zz_44;
  assign _zz_33 = decode_to_execute_SRC2_CTRL;
  assign _zz_15 = decode_ALU_BITWISE_CTRL;
  assign _zz_13 = _zz_43;
  assign _zz_36 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_12 = decode_SHIFT_CTRL;
  assign _zz_10 = _zz_42;
  assign _zz_31 = decode_to_execute_SHIFT_CTRL;
  assign _zz_9 = decode_BRANCH_CTRL;
  assign _zz_48 = _zz_41;
  assign _zz_28 = decode_to_execute_BRANCH_CTRL;
  assign _zz_7 = decode_ENV_CTRL;
  assign _zz_4 = execute_ENV_CTRL;
  assign _zz_2 = memory_ENV_CTRL;
  assign _zz_5 = _zz_40;
  assign _zz_26 = decode_to_execute_ENV_CTRL;
  assign _zz_25 = execute_to_memory_ENV_CTRL;
  assign _zz_27 = memory_to_writeBack_ENV_CTRL;
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
    _zz_147 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_147[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_147[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_147[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_148 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_148[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_148[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_148[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_149 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_149[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_149[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_149[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_150 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_150[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_151 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_151[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_151[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_152 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_152[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @ (*) begin
    _zz_153 = 32'h0;
    if(execute_CsrPlugin_csr_3008)begin
      _zz_153[31 : 0] = _zz_145;
    end
  end

  always @ (*) begin
    _zz_154 = 32'h0;
    if(execute_CsrPlugin_csr_4032)begin
      _zz_154[31 : 0] = _zz_146;
    end
  end

  assign execute_CsrPlugin_readData = (((_zz_147 | _zz_148) | (_zz_149 | _zz_150)) | ((_zz_151 | _zz_152) | (_zz_153 | _zz_154)));
  assign iBusWishbone_ADR = {_zz_293,_zz_155};
  assign iBusWishbone_CTI = ((_zz_155 == 3'b111) ? 3'b111 : 3'b010);
  assign iBusWishbone_BTE = 2'b00;
  assign iBusWishbone_SEL = 4'b1111;
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = 32'h0;
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    if(_zz_199)begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWishbone_STB = 1'b0;
    if(_zz_199)begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_156;
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
        _zz_157 = 4'b0001;
      end
      2'b01 : begin
        _zz_157 = 4'b0011;
      end
      default : begin
        _zz_157 = 4'b1111;
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = (_zz_157 <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
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
      _zz_60 <= 1'b0;
      _zz_62 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_75;
      IBusCachedPlugin_rspCounter <= 32'h0;
      _zz_97 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      _zz_108 <= 1'b0;
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
      memory_MulDivIterativePlugin_mul_counter_value <= 6'h0;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      _zz_145 <= 32'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_155 <= 3'b000;
      _zz_156 <= 1'b0;
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
        _zz_60 <= 1'b0;
      end
      if(_zz_58)begin
        _zz_60 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_62 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_62 <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
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
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
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
      _zz_97 <= 1'b0;
      if(_zz_176)begin
        if(_zz_200)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      _zz_108 <= (_zz_38 && writeBack_arbitration_isFiring);
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
      if(_zz_201)begin
        if(_zz_202)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_203)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_204)begin
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
      if(_zz_185)begin
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
      if(_zz_186)begin
        case(_zz_187)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_135,{_zz_134,_zz_133}} != 3'b000) || CsrPlugin_thirdPartyWake);
      memory_MulDivIterativePlugin_mul_counter_value <= memory_MulDivIterativePlugin_mul_counter_valueNext;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
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
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_287[0];
          CsrPlugin_mstatus_MIE <= _zz_288[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_290[0];
          CsrPlugin_mie_MTIE <= _zz_291[0];
          CsrPlugin_mie_MSIE <= _zz_292[0];
        end
      end
      if(execute_CsrPlugin_csr_3008)begin
        if(execute_CsrPlugin_writeEnable)begin
          _zz_145 <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      if(_zz_199)begin
        if(iBusWishbone_ACK)begin
          _zz_155 <= (_zz_155 + 3'b001);
        end
      end
      _zz_156 <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if(_zz_205)begin
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
      _zz_63 <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(_zz_176)begin
      if(_zz_200)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    _zz_109 <= _zz_37[11 : 7];
    _zz_110 <= _zz_47;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_182)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_137 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_137 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(_zz_184)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_139 ? DBusSimplePlugin_memoryExceptionPort_payload_code : BranchPlugin_branchExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_139 ? DBusSimplePlugin_memoryExceptionPort_payload_badAddr : BranchPlugin_branchExceptionPort_payload_badAddr);
    end
    if(_zz_201)begin
      if(_zz_202)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_203)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_204)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_185)begin
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
    if(_zz_170)begin
      if(_zz_183)begin
        memory_MulDivIterativePlugin_rs2 <= (memory_MulDivIterativePlugin_rs2 >>> 1);
        memory_MulDivIterativePlugin_accumulator <= ({_zz_266,memory_MulDivIterativePlugin_accumulator[31 : 0]} >>> 1);
      end
    end
    if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(_zz_171)begin
      if(_zz_197)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
          memory_MulDivIterativePlugin_div_result <= _zz_278[31:0];
        end
      end
    end
    if(_zz_198)begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_143 ? (~ _zz_144) : _zz_144) + _zz_284);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_142 ? (~ execute_RS2) : execute_RS2) + _zz_286);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_143 ^ (_zz_142 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_32;
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
      decode_to_execute_FORMAL_PC_NEXT <= _zz_50;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_49;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_23;
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
      decode_to_execute_ALU_CTRL <= _zz_20;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_17;
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
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_14;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_8;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_6;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_3;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_1;
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
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
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
    if(((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers)))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_30;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_29;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
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
      execute_CsrPlugin_csr_3008 <= (decode_INSTRUCTION[31 : 20] == 12'hbc0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_4032 <= (decode_INSTRUCTION[31 : 20] == 12'hfc0);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_289[0];
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
    if(_zz_205)begin
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
  reg        [22:0]   _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire       [0:0]    _zz_13;
  wire       [0:0]    _zz_14;
  wire       [22:0]   _zz_15;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [6:0]    lineLoader_flushCounter;
  reg                 _zz_3;
  reg                 lineLoader_cmdSent;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [5:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [20:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [8:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire       [8:0]    _zz_4;
  wire                _zz_5;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [5:0]    _zz_6;
  wire                _zz_7;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [20:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [22:0]   _zz_8;
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
  (* ram_style = "block" *) reg [31:0] banks_0 [0:511];
  (* ram_style = "block" *) reg [22:0] ways_0_tags [0:63];

  assign _zz_11 = (! lineLoader_flushCounter[6]);
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
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[6]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[6] ? lineLoader_address[10 : 5] : lineLoader_flushCounter[5 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[6];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 11];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[10 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_4 = io_cpu_prefetch_pc[10 : 2];
  assign _zz_5 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = _zz_9;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_6 = io_cpu_prefetch_pc[10 : 5];
  assign _zz_7 = (! io_cpu_fetch_isStuck);
  assign _zz_8 = _zz_10;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_13[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_14[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_8[22 : 2];
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuRsp_physicalAddress[31 : 11]));
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
      lineLoader_flushCounter <= (lineLoader_flushCounter + 7'h01);
    end
    _zz_3 <= lineLoader_flushCounter[6];
    if(_zz_12)begin
      lineLoader_flushCounter <= 7'h0;
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
