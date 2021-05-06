// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : VexRiscv
// Git hash  : 6bce178f5927e8960c36a559e33b1ba090ce88d4


`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_WFI 2'b10
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b11

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

`define MmuPlugin_shared_State_defaultEncoding_type [2:0]
`define MmuPlugin_shared_State_defaultEncoding_IDLE 3'b000
`define MmuPlugin_shared_State_defaultEncoding_L1_CMD 3'b001
`define MmuPlugin_shared_State_defaultEncoding_L1_RSP 3'b010
`define MmuPlugin_shared_State_defaultEncoding_L0_CMD 3'b011
`define MmuPlugin_shared_State_defaultEncoding_L0_RSP 3'b100


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
  output     [3:0]    dBusWishbone_SEL,
  input               dBusWishbone_ERR,
  output     [2:0]    dBusWishbone_CTI,
  output     [1:0]    dBusWishbone_BTE,
  input               clk,
  input               reset
);
  wire                _zz_192;
  wire                _zz_193;
  wire                _zz_194;
  wire                _zz_195;
  wire                _zz_196;
  wire                _zz_197;
  wire                _zz_198;
  wire                _zz_199;
  reg                 _zz_200;
  reg                 _zz_201;
  reg        [31:0]   _zz_202;
  reg                 _zz_203;
  reg        [31:0]   _zz_204;
  reg        [1:0]    _zz_205;
  reg                 _zz_206;
  reg                 _zz_207;
  wire                _zz_208;
  wire       [2:0]    _zz_209;
  reg                 _zz_210;
  wire       [31:0]   _zz_211;
  reg                 _zz_212;
  reg                 _zz_213;
  wire                _zz_214;
  wire       [31:0]   _zz_215;
  wire                _zz_216;
  wire                _zz_217;
  wire                _zz_218;
  wire                _zz_219;
  wire                _zz_220;
  wire                _zz_221;
  wire                _zz_222;
  wire                _zz_223;
  wire       [3:0]    _zz_224;
  wire                _zz_225;
  wire                _zz_226;
  reg        [31:0]   _zz_227;
  reg        [31:0]   _zz_228;
  reg        [31:0]   _zz_229;
  reg                 _zz_230;
  reg                 _zz_231;
  reg                 _zz_232;
  reg        [9:0]    _zz_233;
  reg        [9:0]    _zz_234;
  reg        [9:0]    _zz_235;
  reg        [9:0]    _zz_236;
  reg                 _zz_237;
  reg                 _zz_238;
  reg                 _zz_239;
  reg                 _zz_240;
  reg                 _zz_241;
  reg                 _zz_242;
  reg                 _zz_243;
  reg        [9:0]    _zz_244;
  reg        [9:0]    _zz_245;
  reg        [9:0]    _zz_246;
  reg        [9:0]    _zz_247;
  reg                 _zz_248;
  reg                 _zz_249;
  reg                 _zz_250;
  reg                 _zz_251;
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
  wire                dataCache_1_io_cpu_execute_haltIt;
  wire                dataCache_1_io_cpu_execute_refilling;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_writeBack_keepMemRspData;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_length;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire                _zz_252;
  wire                _zz_253;
  wire                _zz_254;
  wire                _zz_255;
  wire                _zz_256;
  wire                _zz_257;
  wire                _zz_258;
  wire                _zz_259;
  wire                _zz_260;
  wire                _zz_261;
  wire                _zz_262;
  wire                _zz_263;
  wire                _zz_264;
  wire                _zz_265;
  wire                _zz_266;
  wire                _zz_267;
  wire       [1:0]    _zz_268;
  wire                _zz_269;
  wire                _zz_270;
  wire                _zz_271;
  wire                _zz_272;
  wire                _zz_273;
  wire                _zz_274;
  wire                _zz_275;
  wire                _zz_276;
  wire                _zz_277;
  wire                _zz_278;
  wire                _zz_279;
  wire                _zz_280;
  wire                _zz_281;
  wire                _zz_282;
  wire                _zz_283;
  wire                _zz_284;
  wire                _zz_285;
  wire                _zz_286;
  wire                _zz_287;
  wire                _zz_288;
  wire                _zz_289;
  wire                _zz_290;
  wire                _zz_291;
  wire                _zz_292;
  wire                _zz_293;
  wire                _zz_294;
  wire                _zz_295;
  wire                _zz_296;
  wire                _zz_297;
  wire                _zz_298;
  wire                _zz_299;
  wire                _zz_300;
  wire                _zz_301;
  wire                _zz_302;
  wire                _zz_303;
  wire                _zz_304;
  wire                _zz_305;
  wire                _zz_306;
  wire                _zz_307;
  wire       [1:0]    _zz_308;
  wire                _zz_309;
  wire       [32:0]   _zz_310;
  wire       [31:0]   _zz_311;
  wire       [32:0]   _zz_312;
  wire       [0:0]    _zz_313;
  wire       [0:0]    _zz_314;
  wire       [0:0]    _zz_315;
  wire       [0:0]    _zz_316;
  wire       [0:0]    _zz_317;
  wire       [0:0]    _zz_318;
  wire       [0:0]    _zz_319;
  wire       [0:0]    _zz_320;
  wire       [0:0]    _zz_321;
  wire       [0:0]    _zz_322;
  wire       [0:0]    _zz_323;
  wire       [0:0]    _zz_324;
  wire       [0:0]    _zz_325;
  wire       [0:0]    _zz_326;
  wire       [0:0]    _zz_327;
  wire       [0:0]    _zz_328;
  wire       [0:0]    _zz_329;
  wire       [0:0]    _zz_330;
  wire       [0:0]    _zz_331;
  wire       [0:0]    _zz_332;
  wire       [3:0]    _zz_333;
  wire       [2:0]    _zz_334;
  wire       [31:0]   _zz_335;
  wire       [2:0]    _zz_336;
  wire       [2:0]    _zz_337;
  wire       [0:0]    _zz_338;
  wire       [1:0]    _zz_339;
  wire       [0:0]    _zz_340;
  wire       [1:0]    _zz_341;
  wire       [0:0]    _zz_342;
  wire       [0:0]    _zz_343;
  wire       [0:0]    _zz_344;
  wire       [0:0]    _zz_345;
  wire       [0:0]    _zz_346;
  wire       [0:0]    _zz_347;
  wire       [0:0]    _zz_348;
  wire       [0:0]    _zz_349;
  wire       [1:0]    _zz_350;
  wire       [0:0]    _zz_351;
  wire       [2:0]    _zz_352;
  wire       [4:0]    _zz_353;
  wire       [11:0]   _zz_354;
  wire       [11:0]   _zz_355;
  wire       [31:0]   _zz_356;
  wire       [31:0]   _zz_357;
  wire       [31:0]   _zz_358;
  wire       [31:0]   _zz_359;
  wire       [31:0]   _zz_360;
  wire       [31:0]   _zz_361;
  wire       [31:0]   _zz_362;
  wire       [19:0]   _zz_363;
  wire       [11:0]   _zz_364;
  wire       [11:0]   _zz_365;
  wire       [1:0]    _zz_366;
  wire       [1:0]    _zz_367;
  wire       [0:0]    _zz_368;
  wire       [5:0]    _zz_369;
  wire       [33:0]   _zz_370;
  wire       [32:0]   _zz_371;
  wire       [33:0]   _zz_372;
  wire       [32:0]   _zz_373;
  wire       [33:0]   _zz_374;
  wire       [32:0]   _zz_375;
  wire       [0:0]    _zz_376;
  wire       [5:0]    _zz_377;
  wire       [32:0]   _zz_378;
  wire       [31:0]   _zz_379;
  wire       [31:0]   _zz_380;
  wire       [32:0]   _zz_381;
  wire       [32:0]   _zz_382;
  wire       [32:0]   _zz_383;
  wire       [32:0]   _zz_384;
  wire       [0:0]    _zz_385;
  wire       [32:0]   _zz_386;
  wire       [0:0]    _zz_387;
  wire       [32:0]   _zz_388;
  wire       [0:0]    _zz_389;
  wire       [31:0]   _zz_390;
  wire       [0:0]    _zz_391;
  wire       [0:0]    _zz_392;
  wire       [0:0]    _zz_393;
  wire       [0:0]    _zz_394;
  wire       [0:0]    _zz_395;
  wire       [0:0]    _zz_396;
  wire       [0:0]    _zz_397;
  wire       [0:0]    _zz_398;
  wire       [0:0]    _zz_399;
  wire       [0:0]    _zz_400;
  wire       [0:0]    _zz_401;
  wire       [0:0]    _zz_402;
  wire       [0:0]    _zz_403;
  wire       [0:0]    _zz_404;
  wire       [0:0]    _zz_405;
  wire       [0:0]    _zz_406;
  wire       [0:0]    _zz_407;
  wire       [0:0]    _zz_408;
  wire       [0:0]    _zz_409;
  wire       [0:0]    _zz_410;
  wire       [0:0]    _zz_411;
  wire       [0:0]    _zz_412;
  wire       [0:0]    _zz_413;
  wire       [0:0]    _zz_414;
  wire       [0:0]    _zz_415;
  wire       [0:0]    _zz_416;
  wire       [0:0]    _zz_417;
  wire       [0:0]    _zz_418;
  wire       [0:0]    _zz_419;
  wire       [0:0]    _zz_420;
  wire       [0:0]    _zz_421;
  wire       [0:0]    _zz_422;
  wire       [0:0]    _zz_423;
  wire       [0:0]    _zz_424;
  wire       [0:0]    _zz_425;
  wire       [0:0]    _zz_426;
  wire       [0:0]    _zz_427;
  wire       [0:0]    _zz_428;
  wire       [0:0]    _zz_429;
  wire       [0:0]    _zz_430;
  wire       [0:0]    _zz_431;
  wire       [0:0]    _zz_432;
  wire       [0:0]    _zz_433;
  wire       [0:0]    _zz_434;
  wire       [0:0]    _zz_435;
  wire       [26:0]   _zz_436;
  wire                _zz_437;
  wire                _zz_438;
  wire       [1:0]    _zz_439;
  wire       [31:0]   _zz_440;
  wire       [31:0]   _zz_441;
  wire       [31:0]   _zz_442;
  wire                _zz_443;
  wire       [0:0]    _zz_444;
  wire       [17:0]   _zz_445;
  wire       [31:0]   _zz_446;
  wire       [31:0]   _zz_447;
  wire       [31:0]   _zz_448;
  wire                _zz_449;
  wire       [0:0]    _zz_450;
  wire       [11:0]   _zz_451;
  wire       [31:0]   _zz_452;
  wire       [31:0]   _zz_453;
  wire       [31:0]   _zz_454;
  wire                _zz_455;
  wire       [0:0]    _zz_456;
  wire       [5:0]    _zz_457;
  wire       [31:0]   _zz_458;
  wire       [31:0]   _zz_459;
  wire       [31:0]   _zz_460;
  wire                _zz_461;
  wire                _zz_462;
  wire       [31:0]   _zz_463;
  wire       [0:0]    _zz_464;
  wire       [1:0]    _zz_465;
  wire       [0:0]    _zz_466;
  wire       [0:0]    _zz_467;
  wire                _zz_468;
  wire       [0:0]    _zz_469;
  wire       [28:0]   _zz_470;
  wire       [31:0]   _zz_471;
  wire       [31:0]   _zz_472;
  wire       [31:0]   _zz_473;
  wire       [0:0]    _zz_474;
  wire       [0:0]    _zz_475;
  wire       [1:0]    _zz_476;
  wire       [1:0]    _zz_477;
  wire                _zz_478;
  wire       [0:0]    _zz_479;
  wire       [24:0]   _zz_480;
  wire       [31:0]   _zz_481;
  wire       [31:0]   _zz_482;
  wire       [31:0]   _zz_483;
  wire       [31:0]   _zz_484;
  wire       [31:0]   _zz_485;
  wire       [31:0]   _zz_486;
  wire       [0:0]    _zz_487;
  wire       [0:0]    _zz_488;
  wire       [2:0]    _zz_489;
  wire       [2:0]    _zz_490;
  wire                _zz_491;
  wire       [0:0]    _zz_492;
  wire       [21:0]   _zz_493;
  wire       [31:0]   _zz_494;
  wire       [31:0]   _zz_495;
  wire       [31:0]   _zz_496;
  wire       [31:0]   _zz_497;
  wire                _zz_498;
  wire                _zz_499;
  wire       [31:0]   _zz_500;
  wire       [31:0]   _zz_501;
  wire       [1:0]    _zz_502;
  wire       [1:0]    _zz_503;
  wire                _zz_504;
  wire       [0:0]    _zz_505;
  wire       [18:0]   _zz_506;
  wire       [31:0]   _zz_507;
  wire       [31:0]   _zz_508;
  wire       [31:0]   _zz_509;
  wire       [31:0]   _zz_510;
  wire       [31:0]   _zz_511;
  wire       [31:0]   _zz_512;
  wire                _zz_513;
  wire       [0:0]    _zz_514;
  wire       [0:0]    _zz_515;
  wire                _zz_516;
  wire       [0:0]    _zz_517;
  wire       [15:0]   _zz_518;
  wire       [31:0]   _zz_519;
  wire       [31:0]   _zz_520;
  wire                _zz_521;
  wire       [0:0]    _zz_522;
  wire       [0:0]    _zz_523;
  wire       [31:0]   _zz_524;
  wire       [31:0]   _zz_525;
  wire                _zz_526;
  wire       [5:0]    _zz_527;
  wire       [5:0]    _zz_528;
  wire                _zz_529;
  wire       [0:0]    _zz_530;
  wire       [11:0]   _zz_531;
  wire       [31:0]   _zz_532;
  wire       [31:0]   _zz_533;
  wire       [31:0]   _zz_534;
  wire       [31:0]   _zz_535;
  wire                _zz_536;
  wire       [0:0]    _zz_537;
  wire       [2:0]    _zz_538;
  wire                _zz_539;
  wire       [0:0]    _zz_540;
  wire       [0:0]    _zz_541;
  wire                _zz_542;
  wire       [4:0]    _zz_543;
  wire       [4:0]    _zz_544;
  wire                _zz_545;
  wire       [0:0]    _zz_546;
  wire       [8:0]    _zz_547;
  wire       [31:0]   _zz_548;
  wire       [31:0]   _zz_549;
  wire       [31:0]   _zz_550;
  wire                _zz_551;
  wire       [0:0]    _zz_552;
  wire       [0:0]    _zz_553;
  wire       [31:0]   _zz_554;
  wire       [31:0]   _zz_555;
  wire       [31:0]   _zz_556;
  wire       [31:0]   _zz_557;
  wire       [31:0]   _zz_558;
  wire       [31:0]   _zz_559;
  wire       [0:0]    _zz_560;
  wire       [2:0]    _zz_561;
  wire       [0:0]    _zz_562;
  wire       [5:0]    _zz_563;
  wire       [1:0]    _zz_564;
  wire       [1:0]    _zz_565;
  wire                _zz_566;
  wire       [0:0]    _zz_567;
  wire       [6:0]    _zz_568;
  wire       [31:0]   _zz_569;
  wire       [31:0]   _zz_570;
  wire       [31:0]   _zz_571;
  wire       [31:0]   _zz_572;
  wire       [31:0]   _zz_573;
  wire       [31:0]   _zz_574;
  wire       [31:0]   _zz_575;
  wire                _zz_576;
  wire       [0:0]    _zz_577;
  wire       [0:0]    _zz_578;
  wire                _zz_579;
  wire       [0:0]    _zz_580;
  wire       [3:0]    _zz_581;
  wire                _zz_582;
  wire       [0:0]    _zz_583;
  wire       [0:0]    _zz_584;
  wire       [0:0]    _zz_585;
  wire       [0:0]    _zz_586;
  wire                _zz_587;
  wire       [0:0]    _zz_588;
  wire       [4:0]    _zz_589;
  wire       [31:0]   _zz_590;
  wire       [31:0]   _zz_591;
  wire       [31:0]   _zz_592;
  wire       [31:0]   _zz_593;
  wire       [31:0]   _zz_594;
  wire       [31:0]   _zz_595;
  wire       [31:0]   _zz_596;
  wire       [31:0]   _zz_597;
  wire                _zz_598;
  wire       [0:0]    _zz_599;
  wire       [1:0]    _zz_600;
  wire       [31:0]   _zz_601;
  wire       [31:0]   _zz_602;
  wire       [31:0]   _zz_603;
  wire       [31:0]   _zz_604;
  wire       [31:0]   _zz_605;
  wire                _zz_606;
  wire       [4:0]    _zz_607;
  wire       [4:0]    _zz_608;
  wire                _zz_609;
  wire       [0:0]    _zz_610;
  wire       [2:0]    _zz_611;
  wire       [31:0]   _zz_612;
  wire       [31:0]   _zz_613;
  wire       [31:0]   _zz_614;
  wire                _zz_615;
  wire       [31:0]   _zz_616;
  wire                _zz_617;
  wire       [0:0]    _zz_618;
  wire       [2:0]    _zz_619;
  wire       [0:0]    _zz_620;
  wire       [0:0]    _zz_621;
  wire       [2:0]    _zz_622;
  wire       [2:0]    _zz_623;
  wire                _zz_624;
  wire       [0:0]    _zz_625;
  wire       [0:0]    _zz_626;
  wire       [31:0]   _zz_627;
  wire       [31:0]   _zz_628;
  wire       [31:0]   _zz_629;
  wire       [31:0]   _zz_630;
  wire                _zz_631;
  wire       [0:0]    _zz_632;
  wire       [0:0]    _zz_633;
  wire       [31:0]   _zz_634;
  wire       [31:0]   _zz_635;
  wire                _zz_636;
  wire       [0:0]    _zz_637;
  wire       [0:0]    _zz_638;
  wire       [0:0]    _zz_639;
  wire       [1:0]    _zz_640;
  wire       [1:0]    _zz_641;
  wire       [1:0]    _zz_642;
  wire       [0:0]    _zz_643;
  wire       [0:0]    _zz_644;
  wire       [31:0]   _zz_645;
  wire       [31:0]   _zz_646;
  wire       [31:0]   _zz_647;
  wire       [31:0]   _zz_648;
  wire       [31:0]   _zz_649;
  wire       [31:0]   _zz_650;
  wire       [31:0]   _zz_651;
  wire       [31:0]   _zz_652;
  wire       [31:0]   _zz_653;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire                execute_IS_DBUS_SHARING;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
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
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_8;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_9;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_10;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_11;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_12;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_13;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_14;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_15;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_16;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_17;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_18;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                memory_IS_SFENCE_VMA;
  wire                execute_IS_SFENCE_VMA;
  wire                decode_IS_SFENCE_VMA;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_19;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_20;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_21;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_22;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_23;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_24;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_25;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_26;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_27;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
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
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_28;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_29;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_30;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_31;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_32;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_33;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_34;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_35;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_36;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_37;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_38;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_39;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_40;
  wire       [31:0]   _zz_41;
  wire                _zz_42;
  reg                 _zz_43;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_44;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_45;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_46;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_47;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_48;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_49;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_50;
  wire                writeBack_IS_SFENCE_VMA;
  wire                writeBack_IS_DBUS_SHARING;
  wire                memory_IS_DBUS_SHARING;
  reg        [31:0]   _zz_51;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_AMO;
  wire                execute_MEMORY_LRSC;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  wire                execute_MEMORY_MANAGMENT;
  wire       [31:0]   execute_RS2;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_AMO;
  wire                decode_MEMORY_LRSC;
  reg                 _zz_52;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_53;
  reg        [31:0]   _zz_54;
  wire       [31:0]   decode_PC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
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
  reg                 execute_arbitration_haltByOther;
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
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
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
  reg        [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg                 IBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg                 IBusCachedPlugin_mmuBus_rsp_exception;
  reg                 IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_0_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_0_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_1_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_1_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_2_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_2_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_3_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_3_physical;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire                dBus_cmd_payload_uncached;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [3:0]    dBus_cmd_payload_mask;
  wire       [2:0]    dBus_cmd_payload_length;
  wire                dBus_cmd_payload_last;
  wire                dBus_rsp_valid;
  wire                dBus_rsp_payload_last;
  wire       [31:0]   dBus_rsp_payload_data;
  wire                dBus_rsp_payload_error;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  reg                 DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  reg        [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg                 DBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg                 DBusCachedPlugin_mmuBus_rsp_exception;
  reg                 DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_0_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_0_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_1_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_1_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_2_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_2_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_3_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_3_physical;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg                 MmuPlugin_dBusAccess_cmd_valid;
  reg                 MmuPlugin_dBusAccess_cmd_ready;
  reg        [31:0]   MmuPlugin_dBusAccess_cmd_payload_address;
  wire       [1:0]    MmuPlugin_dBusAccess_cmd_payload_size;
  wire                MmuPlugin_dBusAccess_cmd_payload_write;
  wire       [31:0]   MmuPlugin_dBusAccess_cmd_payload_data;
  wire       [3:0]    MmuPlugin_dBusAccess_cmd_payload_writeMask;
  wire                MmuPlugin_dBusAccess_rsp_valid;
  wire       [31:0]   MmuPlugin_dBusAccess_rsp_payload_data;
  wire                MmuPlugin_dBusAccess_rsp_payload_error;
  wire                MmuPlugin_dBusAccess_rsp_payload_redo;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  reg                 CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  reg                 CsrPlugin_redoInterface_valid;
  wire       [31:0]   CsrPlugin_redoInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                externalInterrupt;
  wire                externalInterruptS;
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
  wire       [3:0]    _zz_55;
  wire       [3:0]    _zz_56;
  wire                _zz_57;
  wire                _zz_58;
  wire                _zz_59;
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
  wire                IBusCachedPlugin_iBusRsp_stages_0_halt;
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
  wire                IBusCachedPlugin_iBusRsp_stages_3_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_3_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_3_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_3_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_3_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_3_halt;
  wire                _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_64;
  wire                _zz_65;
  reg                 _zz_66;
  wire                _zz_67;
  reg                 _zz_68;
  reg        [31:0]   _zz_69;
  wire                _zz_70;
  reg                 _zz_71;
  reg        [31:0]   _zz_72;
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
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_5;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_73;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                dataCache_1_io_mem_cmd_s2mPipe_valid;
  wire                dataCache_1_io_mem_cmd_s2mPipe_ready;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_s2mPipe_payload_length;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_last;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rValid;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_wr;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_uncached;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_address;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_data;
  reg        [3:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_mask;
  reg        [2:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_length;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_last;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_uncached;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  reg        [3:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  reg        [2:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  wire       [31:0]   _zz_74;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_75;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire                _zz_76;
  reg        [31:0]   _zz_77;
  wire                _zz_78;
  reg        [31:0]   _zz_79;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  reg                 DBusCachedPlugin_forceDatapath;
  reg                 MmuPlugin_status_sum;
  reg                 MmuPlugin_status_mxr;
  reg                 MmuPlugin_status_mprv;
  reg                 MmuPlugin_satp_mode;
  reg        [8:0]    MmuPlugin_satp_asid;
  reg        [19:0]   MmuPlugin_satp_ppn;
  reg                 MmuPlugin_ports_0_cache_0_valid;
  reg                 MmuPlugin_ports_0_cache_0_exception;
  reg                 MmuPlugin_ports_0_cache_0_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_0_allowRead;
  reg                 MmuPlugin_ports_0_cache_0_allowWrite;
  reg                 MmuPlugin_ports_0_cache_0_allowExecute;
  reg                 MmuPlugin_ports_0_cache_0_allowUser;
  reg                 MmuPlugin_ports_0_cache_1_valid;
  reg                 MmuPlugin_ports_0_cache_1_exception;
  reg                 MmuPlugin_ports_0_cache_1_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_1_allowRead;
  reg                 MmuPlugin_ports_0_cache_1_allowWrite;
  reg                 MmuPlugin_ports_0_cache_1_allowExecute;
  reg                 MmuPlugin_ports_0_cache_1_allowUser;
  reg                 MmuPlugin_ports_0_cache_2_valid;
  reg                 MmuPlugin_ports_0_cache_2_exception;
  reg                 MmuPlugin_ports_0_cache_2_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_2_allowRead;
  reg                 MmuPlugin_ports_0_cache_2_allowWrite;
  reg                 MmuPlugin_ports_0_cache_2_allowExecute;
  reg                 MmuPlugin_ports_0_cache_2_allowUser;
  reg                 MmuPlugin_ports_0_cache_3_valid;
  reg                 MmuPlugin_ports_0_cache_3_exception;
  reg                 MmuPlugin_ports_0_cache_3_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_3_allowRead;
  reg                 MmuPlugin_ports_0_cache_3_allowWrite;
  reg                 MmuPlugin_ports_0_cache_3_allowExecute;
  reg                 MmuPlugin_ports_0_cache_3_allowUser;
  wire                MmuPlugin_ports_0_dirty;
  reg                 MmuPlugin_ports_0_requireMmuLockupCalc;
  reg        [3:0]    MmuPlugin_ports_0_cacheHitsCalc;
  wire                MmuPlugin_ports_0_cacheHit;
  wire                _zz_80;
  wire                _zz_81;
  wire                _zz_82;
  wire       [1:0]    _zz_83;
  wire                MmuPlugin_ports_0_cacheLine_valid;
  wire                MmuPlugin_ports_0_cacheLine_exception;
  wire                MmuPlugin_ports_0_cacheLine_superPage;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  wire                MmuPlugin_ports_0_cacheLine_allowRead;
  wire                MmuPlugin_ports_0_cacheLine_allowWrite;
  wire                MmuPlugin_ports_0_cacheLine_allowExecute;
  wire                MmuPlugin_ports_0_cacheLine_allowUser;
  reg                 MmuPlugin_ports_0_entryToReplace_willIncrement;
  wire                MmuPlugin_ports_0_entryToReplace_willClear;
  reg        [1:0]    MmuPlugin_ports_0_entryToReplace_valueNext;
  reg        [1:0]    MmuPlugin_ports_0_entryToReplace_value;
  wire                MmuPlugin_ports_0_entryToReplace_willOverflowIfInc;
  wire                MmuPlugin_ports_0_entryToReplace_willOverflow;
  reg                 MmuPlugin_ports_1_cache_0_valid;
  reg                 MmuPlugin_ports_1_cache_0_exception;
  reg                 MmuPlugin_ports_1_cache_0_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_0_allowRead;
  reg                 MmuPlugin_ports_1_cache_0_allowWrite;
  reg                 MmuPlugin_ports_1_cache_0_allowExecute;
  reg                 MmuPlugin_ports_1_cache_0_allowUser;
  reg                 MmuPlugin_ports_1_cache_1_valid;
  reg                 MmuPlugin_ports_1_cache_1_exception;
  reg                 MmuPlugin_ports_1_cache_1_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_1_allowRead;
  reg                 MmuPlugin_ports_1_cache_1_allowWrite;
  reg                 MmuPlugin_ports_1_cache_1_allowExecute;
  reg                 MmuPlugin_ports_1_cache_1_allowUser;
  reg                 MmuPlugin_ports_1_cache_2_valid;
  reg                 MmuPlugin_ports_1_cache_2_exception;
  reg                 MmuPlugin_ports_1_cache_2_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_2_allowRead;
  reg                 MmuPlugin_ports_1_cache_2_allowWrite;
  reg                 MmuPlugin_ports_1_cache_2_allowExecute;
  reg                 MmuPlugin_ports_1_cache_2_allowUser;
  reg                 MmuPlugin_ports_1_cache_3_valid;
  reg                 MmuPlugin_ports_1_cache_3_exception;
  reg                 MmuPlugin_ports_1_cache_3_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_3_allowRead;
  reg                 MmuPlugin_ports_1_cache_3_allowWrite;
  reg                 MmuPlugin_ports_1_cache_3_allowExecute;
  reg                 MmuPlugin_ports_1_cache_3_allowUser;
  wire                MmuPlugin_ports_1_dirty;
  reg                 MmuPlugin_ports_1_requireMmuLockupCalc;
  reg        [3:0]    MmuPlugin_ports_1_cacheHitsCalc;
  wire                MmuPlugin_ports_1_cacheHit;
  wire                _zz_84;
  wire                _zz_85;
  wire                _zz_86;
  wire       [1:0]    _zz_87;
  wire                MmuPlugin_ports_1_cacheLine_valid;
  wire                MmuPlugin_ports_1_cacheLine_exception;
  wire                MmuPlugin_ports_1_cacheLine_superPage;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  wire                MmuPlugin_ports_1_cacheLine_allowRead;
  wire                MmuPlugin_ports_1_cacheLine_allowWrite;
  wire                MmuPlugin_ports_1_cacheLine_allowExecute;
  wire                MmuPlugin_ports_1_cacheLine_allowUser;
  reg                 MmuPlugin_ports_1_entryToReplace_willIncrement;
  wire                MmuPlugin_ports_1_entryToReplace_willClear;
  reg        [1:0]    MmuPlugin_ports_1_entryToReplace_valueNext;
  reg        [1:0]    MmuPlugin_ports_1_entryToReplace_value;
  wire                MmuPlugin_ports_1_entryToReplace_willOverflowIfInc;
  wire                MmuPlugin_ports_1_entryToReplace_willOverflow;
  reg        `MmuPlugin_shared_State_defaultEncoding_type MmuPlugin_shared_state_1;
  reg        [9:0]    MmuPlugin_shared_vpn_0;
  reg        [9:0]    MmuPlugin_shared_vpn_1;
  reg        [1:0]    MmuPlugin_shared_portSortedOh;
  reg                 MmuPlugin_shared_dBusRspStaged_valid;
  reg        [31:0]   MmuPlugin_shared_dBusRspStaged_payload_data;
  reg                 MmuPlugin_shared_dBusRspStaged_payload_error;
  reg                 MmuPlugin_shared_dBusRspStaged_payload_redo;
  wire                MmuPlugin_shared_dBusRsp_pte_V;
  wire                MmuPlugin_shared_dBusRsp_pte_R;
  wire                MmuPlugin_shared_dBusRsp_pte_W;
  wire                MmuPlugin_shared_dBusRsp_pte_X;
  wire                MmuPlugin_shared_dBusRsp_pte_U;
  wire                MmuPlugin_shared_dBusRsp_pte_G;
  wire                MmuPlugin_shared_dBusRsp_pte_A;
  wire                MmuPlugin_shared_dBusRsp_pte_D;
  wire       [1:0]    MmuPlugin_shared_dBusRsp_pte_RSW;
  wire       [9:0]    MmuPlugin_shared_dBusRsp_pte_PPN0;
  wire       [11:0]   MmuPlugin_shared_dBusRsp_pte_PPN1;
  wire                MmuPlugin_shared_dBusRsp_exception;
  wire                MmuPlugin_shared_dBusRsp_leaf;
  reg                 MmuPlugin_shared_pteBuffer_V;
  reg                 MmuPlugin_shared_pteBuffer_R;
  reg                 MmuPlugin_shared_pteBuffer_W;
  reg                 MmuPlugin_shared_pteBuffer_X;
  reg                 MmuPlugin_shared_pteBuffer_U;
  reg                 MmuPlugin_shared_pteBuffer_G;
  reg                 MmuPlugin_shared_pteBuffer_A;
  reg                 MmuPlugin_shared_pteBuffer_D;
  reg        [1:0]    MmuPlugin_shared_pteBuffer_RSW;
  reg        [9:0]    MmuPlugin_shared_pteBuffer_PPN0;
  reg        [11:0]   MmuPlugin_shared_pteBuffer_PPN1;
  reg        [1:0]    _zz_88;
  wire       [1:0]    _zz_89;
  reg        [1:0]    _zz_90;
  wire       [1:0]    MmuPlugin_shared_refills;
  wire       [1:0]    _zz_91;
  reg        [1:0]    _zz_92;
  wire       [31:0]   _zz_93;
  wire       [34:0]   _zz_94;
  wire                _zz_95;
  wire                _zz_96;
  wire                _zz_97;
  wire                _zz_98;
  wire                _zz_99;
  wire                _zz_100;
  wire                _zz_101;
  wire                _zz_102;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_103;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_104;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_105;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_106;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_107;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_108;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_109;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_110;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_111;
  reg        [31:0]   _zz_112;
  wire                _zz_113;
  reg        [19:0]   _zz_114;
  wire                _zz_115;
  reg        [19:0]   _zz_116;
  reg        [31:0]   _zz_117;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_118;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_119;
  reg                 _zz_120;
  reg                 _zz_121;
  reg                 _zz_122;
  reg        [4:0]    _zz_123;
  reg        [31:0]   _zz_124;
  wire                _zz_125;
  wire                _zz_126;
  wire                _zz_127;
  wire                _zz_128;
  wire                _zz_129;
  wire                _zz_130;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_131;
  reg                 _zz_132;
  reg                 _zz_133;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_134;
  reg        [10:0]   _zz_135;
  wire                _zz_136;
  reg        [19:0]   _zz_137;
  wire                _zz_138;
  reg        [18:0]   _zz_139;
  reg        [31:0]   _zz_140;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg        [1:0]    _zz_141;
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
  reg        [31:0]   CsrPlugin_mscratch;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg                 CsrPlugin_medeleg_IAM;
  reg                 CsrPlugin_medeleg_IAF;
  reg                 CsrPlugin_medeleg_II;
  reg                 CsrPlugin_medeleg_LAM;
  reg                 CsrPlugin_medeleg_LAF;
  reg                 CsrPlugin_medeleg_SAM;
  reg                 CsrPlugin_medeleg_SAF;
  reg                 CsrPlugin_medeleg_EU;
  reg                 CsrPlugin_medeleg_ES;
  reg                 CsrPlugin_medeleg_IPF;
  reg                 CsrPlugin_medeleg_LPF;
  reg                 CsrPlugin_medeleg_SPF;
  reg                 CsrPlugin_mideleg_ST;
  reg                 CsrPlugin_mideleg_SE;
  reg                 CsrPlugin_mideleg_SS;
  reg                 CsrPlugin_sstatus_SIE;
  reg                 CsrPlugin_sstatus_SPIE;
  reg        [0:0]    CsrPlugin_sstatus_SPP;
  reg                 CsrPlugin_sip_SEIP_SOFT;
  reg                 CsrPlugin_sip_SEIP_INPUT;
  wire                CsrPlugin_sip_SEIP_OR;
  reg                 CsrPlugin_sip_STIP;
  reg                 CsrPlugin_sip_SSIP;
  reg                 CsrPlugin_sie_SEIE;
  reg                 CsrPlugin_sie_STIE;
  reg                 CsrPlugin_sie_SSIE;
  reg        [1:0]    CsrPlugin_stvec_mode;
  reg        [29:0]   CsrPlugin_stvec_base;
  reg        [31:0]   CsrPlugin_sscratch;
  reg                 CsrPlugin_scause_interrupt;
  reg        [3:0]    CsrPlugin_scause_exceptionCode;
  reg        [31:0]   CsrPlugin_stval;
  reg        [31:0]   CsrPlugin_sepc;
  reg        [21:0]   CsrPlugin_satp_PPN;
  reg        [8:0]    CsrPlugin_satp_ASID;
  reg        [0:0]    CsrPlugin_satp_MODE;
  wire                _zz_142;
  wire                _zz_143;
  wire                _zz_144;
  wire                _zz_145;
  wire                _zz_146;
  wire                _zz_147;
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
  reg        [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_148;
  wire                _zz_149;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  reg                 CsrPlugin_lastStageWasWfi;
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
  reg        [31:0]   execute_CsrPlugin_readToWriteData;
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
  wire       [31:0]   _zz_150;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_151;
  wire                _zz_152;
  wire                _zz_153;
  reg        [32:0]   _zz_154;
  reg        [31:0]   externalInterruptArray_regNext;
  reg        [31:0]   _zz_155;
  wire       [31:0]   _zz_156;
  reg        [31:0]   _zz_157;
  wire       [31:0]   _zz_158;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
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
  reg                 decode_to_execute_MEMORY_WR;
  reg                 execute_to_memory_MEMORY_WR;
  reg                 memory_to_writeBack_MEMORY_WR;
  reg                 decode_to_execute_MEMORY_LRSC;
  reg                 decode_to_execute_MEMORY_AMO;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  reg                 decode_to_execute_IS_SFENCE_VMA;
  reg                 execute_to_memory_IS_SFENCE_VMA;
  reg                 memory_to_writeBack_IS_SFENCE_VMA;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
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
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg                 execute_to_memory_IS_DBUS_SHARING;
  reg                 memory_to_writeBack_IS_DBUS_SHARING;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg                 execute_CsrPlugin_csr_3264;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_256;
  reg                 execute_CsrPlugin_csr_384;
  reg                 execute_CsrPlugin_csr_3857;
  reg                 execute_CsrPlugin_csr_3858;
  reg                 execute_CsrPlugin_csr_3859;
  reg                 execute_CsrPlugin_csr_3860;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_832;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg                 execute_CsrPlugin_csr_770;
  reg                 execute_CsrPlugin_csr_771;
  reg                 execute_CsrPlugin_csr_324;
  reg                 execute_CsrPlugin_csr_260;
  reg                 execute_CsrPlugin_csr_261;
  reg                 execute_CsrPlugin_csr_321;
  reg                 execute_CsrPlugin_csr_320;
  reg                 execute_CsrPlugin_csr_322;
  reg                 execute_CsrPlugin_csr_323;
  reg                 execute_CsrPlugin_csr_3008;
  reg                 execute_CsrPlugin_csr_4032;
  reg                 execute_CsrPlugin_csr_2496;
  reg                 execute_CsrPlugin_csr_3520;
  reg        [31:0]   _zz_159;
  reg        [31:0]   _zz_160;
  reg        [31:0]   _zz_161;
  reg        [31:0]   _zz_162;
  reg        [31:0]   _zz_163;
  reg        [31:0]   _zz_164;
  reg        [31:0]   _zz_165;
  reg        [31:0]   _zz_166;
  reg        [31:0]   _zz_167;
  reg        [31:0]   _zz_168;
  reg        [31:0]   _zz_169;
  reg        [31:0]   _zz_170;
  reg        [31:0]   _zz_171;
  reg        [31:0]   _zz_172;
  reg        [31:0]   _zz_173;
  reg        [31:0]   _zz_174;
  reg        [31:0]   _zz_175;
  reg        [31:0]   _zz_176;
  reg        [31:0]   _zz_177;
  reg        [31:0]   _zz_178;
  reg        [31:0]   _zz_179;
  reg        [31:0]   _zz_180;
  reg        [31:0]   _zz_181;
  reg        [31:0]   _zz_182;
  reg        [2:0]    _zz_183;
  reg                 _zz_184;
  reg        [31:0]   iBusWishbone_DAT_MISO_regNext;
  reg        [2:0]    _zz_185;
  wire                _zz_186;
  wire                _zz_187;
  wire                _zz_188;
  wire                _zz_189;
  wire                _zz_190;
  reg                 _zz_191;
  reg        [31:0]   dBusWishbone_DAT_MISO_regNext;
  `ifndef SYNTHESIS
  reg [39:0] _zz_1_string;
  reg [39:0] _zz_2_string;
  reg [39:0] _zz_3_string;
  reg [39:0] _zz_4_string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_5_string;
  reg [39:0] _zz_6_string;
  reg [39:0] _zz_7_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_8_string;
  reg [31:0] _zz_9_string;
  reg [31:0] _zz_10_string;
  reg [71:0] _zz_11_string;
  reg [71:0] _zz_12_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_13_string;
  reg [71:0] _zz_14_string;
  reg [71:0] _zz_15_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_16_string;
  reg [39:0] _zz_17_string;
  reg [39:0] _zz_18_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_19_string;
  reg [23:0] _zz_20_string;
  reg [23:0] _zz_21_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_22_string;
  reg [63:0] _zz_23_string;
  reg [63:0] _zz_24_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_25_string;
  reg [95:0] _zz_26_string;
  reg [95:0] _zz_27_string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_28_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_29_string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_30_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_31_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_34_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_35_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_37_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_38_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_39_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_40_string;
  reg [39:0] _zz_44_string;
  reg [31:0] _zz_45_string;
  reg [71:0] _zz_46_string;
  reg [39:0] _zz_47_string;
  reg [23:0] _zz_48_string;
  reg [63:0] _zz_49_string;
  reg [95:0] _zz_50_string;
  reg [47:0] MmuPlugin_shared_state_1_string;
  reg [95:0] _zz_103_string;
  reg [63:0] _zz_104_string;
  reg [23:0] _zz_105_string;
  reg [39:0] _zz_106_string;
  reg [71:0] _zz_107_string;
  reg [31:0] _zz_108_string;
  reg [39:0] _zz_109_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  (* ram_style = "block" *) reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_252 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_253 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_254 = 1'b1;
  assign _zz_255 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_256 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_257 = (memory_arbitration_isValid && memory_IS_MUL);
  assign _zz_258 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_259 = ((_zz_197 && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign _zz_260 = ((_zz_197 && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign _zz_261 = ((_zz_197 && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign _zz_262 = ((_zz_197 && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_263 = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_264 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
  assign _zz_265 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc));
  assign _zz_266 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_267 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_268 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_269 = (! ({(writeBack_arbitration_isValid || CsrPlugin_exceptionPendings_3),{(memory_arbitration_isValid || CsrPlugin_exceptionPendings_2),(execute_arbitration_isValid || CsrPlugin_exceptionPendings_1)}} != 3'b000));
  assign _zz_270 = (! dataCache_1_io_cpu_execute_refilling);
  assign _zz_271 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_272 = ((MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo)) && (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception));
  assign _zz_273 = MmuPlugin_shared_portSortedOh[0];
  assign _zz_274 = MmuPlugin_shared_portSortedOh[1];
  assign _zz_275 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_276 = (1'b0 || (! 1'b1));
  assign _zz_277 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_278 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_279 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_280 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_281 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_282 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign _zz_283 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_284 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_285 = (! memory_arbitration_isStuck);
  assign _zz_286 = (iBus_cmd_valid || (_zz_183 != 3'b000));
  assign _zz_287 = (_zz_226 && (! dataCache_1_io_mem_cmd_s2mPipe_ready));
  assign _zz_288 = (MmuPlugin_shared_refills != 2'b00);
  assign _zz_289 = (MmuPlugin_ports_0_entryToReplace_value == 2'b00);
  assign _zz_290 = (MmuPlugin_ports_0_entryToReplace_value == 2'b01);
  assign _zz_291 = (MmuPlugin_ports_0_entryToReplace_value == 2'b10);
  assign _zz_292 = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign _zz_293 = (MmuPlugin_ports_1_entryToReplace_value == 2'b00);
  assign _zz_294 = (MmuPlugin_ports_1_entryToReplace_value == 2'b01);
  assign _zz_295 = (MmuPlugin_ports_1_entryToReplace_value == 2'b10);
  assign _zz_296 = (MmuPlugin_ports_1_entryToReplace_value == 2'b11);
  assign _zz_297 = ((CsrPlugin_sstatus_SIE && (CsrPlugin_privilege == 2'b01)) || (CsrPlugin_privilege < 2'b01));
  assign _zz_298 = ((_zz_142 && (1'b1 && CsrPlugin_mideleg_ST)) && (! 1'b0));
  assign _zz_299 = ((_zz_143 && (1'b1 && CsrPlugin_mideleg_SS)) && (! 1'b0));
  assign _zz_300 = ((_zz_144 && (1'b1 && CsrPlugin_mideleg_SE)) && (! 1'b0));
  assign _zz_301 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_302 = ((_zz_142 && 1'b1) && (! (CsrPlugin_mideleg_ST != 1'b0)));
  assign _zz_303 = ((_zz_143 && 1'b1) && (! (CsrPlugin_mideleg_SS != 1'b0)));
  assign _zz_304 = ((_zz_144 && 1'b1) && (! (CsrPlugin_mideleg_SE != 1'b0)));
  assign _zz_305 = ((_zz_145 && 1'b1) && (! 1'b0));
  assign _zz_306 = ((_zz_146 && 1'b1) && (! 1'b0));
  assign _zz_307 = ((_zz_147 && 1'b1) && (! 1'b0));
  assign _zz_308 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_309 = execute_INSTRUCTION[13];
  assign _zz_310 = ($signed(_zz_312) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_311 = _zz_310[31 : 0];
  assign _zz_312 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_313 = _zz_94[34 : 34];
  assign _zz_314 = _zz_94[33 : 33];
  assign _zz_315 = _zz_94[32 : 32];
  assign _zz_316 = _zz_94[31 : 31];
  assign _zz_317 = _zz_94[28 : 28];
  assign _zz_318 = _zz_94[21 : 21];
  assign _zz_319 = _zz_94[20 : 20];
  assign _zz_320 = _zz_94[19 : 19];
  assign _zz_321 = _zz_94[13 : 13];
  assign _zz_322 = _zz_94[12 : 12];
  assign _zz_323 = _zz_94[11 : 11];
  assign _zz_324 = _zz_94[17 : 17];
  assign _zz_325 = _zz_94[5 : 5];
  assign _zz_326 = _zz_94[3 : 3];
  assign _zz_327 = _zz_94[18 : 18];
  assign _zz_328 = _zz_94[10 : 10];
  assign _zz_329 = _zz_94[16 : 16];
  assign _zz_330 = _zz_94[15 : 15];
  assign _zz_331 = _zz_94[4 : 4];
  assign _zz_332 = _zz_94[0 : 0];
  assign _zz_333 = (_zz_55 - 4'b0001);
  assign _zz_334 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_335 = {29'd0, _zz_334};
  assign _zz_336 = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_337 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz_338 = MmuPlugin_ports_0_entryToReplace_willIncrement;
  assign _zz_339 = {1'd0, _zz_338};
  assign _zz_340 = MmuPlugin_ports_1_entryToReplace_willIncrement;
  assign _zz_341 = {1'd0, _zz_340};
  assign _zz_342 = MmuPlugin_shared_dBusRspStaged_payload_data[0 : 0];
  assign _zz_343 = MmuPlugin_shared_dBusRspStaged_payload_data[1 : 1];
  assign _zz_344 = MmuPlugin_shared_dBusRspStaged_payload_data[2 : 2];
  assign _zz_345 = MmuPlugin_shared_dBusRspStaged_payload_data[3 : 3];
  assign _zz_346 = MmuPlugin_shared_dBusRspStaged_payload_data[4 : 4];
  assign _zz_347 = MmuPlugin_shared_dBusRspStaged_payload_data[5 : 5];
  assign _zz_348 = MmuPlugin_shared_dBusRspStaged_payload_data[6 : 6];
  assign _zz_349 = MmuPlugin_shared_dBusRspStaged_payload_data[7 : 7];
  assign _zz_350 = (_zz_90 - 2'b01);
  assign _zz_351 = execute_SRC_LESS;
  assign _zz_352 = 3'b100;
  assign _zz_353 = execute_INSTRUCTION[19 : 15];
  assign _zz_354 = execute_INSTRUCTION[31 : 20];
  assign _zz_355 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_356 = ($signed(_zz_357) + $signed(_zz_360));
  assign _zz_357 = ($signed(_zz_358) + $signed(_zz_359));
  assign _zz_358 = execute_SRC1;
  assign _zz_359 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_360 = (execute_SRC_USE_SUB_LESS ? _zz_361 : _zz_362);
  assign _zz_361 = 32'h00000001;
  assign _zz_362 = 32'h0;
  assign _zz_363 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_364 = execute_INSTRUCTION[31 : 20];
  assign _zz_365 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_366 = (_zz_148 & (~ _zz_367));
  assign _zz_367 = (_zz_148 - 2'b01);
  assign _zz_368 = memory_MulDivIterativePlugin_mul_counter_willIncrement;
  assign _zz_369 = {5'd0, _zz_368};
  assign _zz_370 = (_zz_372 + _zz_374);
  assign _zz_371 = (memory_MulDivIterativePlugin_rs2[0] ? memory_MulDivIterativePlugin_rs1 : 33'h0);
  assign _zz_372 = {{1{_zz_371[32]}}, _zz_371};
  assign _zz_373 = _zz_375;
  assign _zz_374 = {{1{_zz_373[32]}}, _zz_373};
  assign _zz_375 = (memory_MulDivIterativePlugin_accumulator >>> 32);
  assign _zz_376 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_377 = {5'd0, _zz_376};
  assign _zz_378 = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_379 = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_380 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_381 = {_zz_150,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_382 = _zz_383;
  assign _zz_383 = _zz_384;
  assign _zz_384 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_151) : _zz_151)} + _zz_386);
  assign _zz_385 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_386 = {32'd0, _zz_385};
  assign _zz_387 = _zz_153;
  assign _zz_388 = {32'd0, _zz_387};
  assign _zz_389 = _zz_152;
  assign _zz_390 = {31'd0, _zz_389};
  assign _zz_391 = execute_CsrPlugin_writeData[19 : 19];
  assign _zz_392 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_393 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_394 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_395 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_396 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_397 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_398 = execute_CsrPlugin_writeData[19 : 19];
  assign _zz_399 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_400 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_401 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_402 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_403 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_404 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_405 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_406 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_407 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_408 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_409 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_410 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_411 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_412 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_413 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_414 = execute_CsrPlugin_writeData[0 : 0];
  assign _zz_415 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_416 = execute_CsrPlugin_writeData[2 : 2];
  assign _zz_417 = execute_CsrPlugin_writeData[4 : 4];
  assign _zz_418 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_419 = execute_CsrPlugin_writeData[6 : 6];
  assign _zz_420 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_421 = execute_CsrPlugin_writeData[8 : 8];
  assign _zz_422 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_423 = execute_CsrPlugin_writeData[12 : 12];
  assign _zz_424 = execute_CsrPlugin_writeData[13 : 13];
  assign _zz_425 = execute_CsrPlugin_writeData[15 : 15];
  assign _zz_426 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_427 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_428 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_429 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_430 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_431 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_432 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_433 = execute_CsrPlugin_writeData[5 : 5];
  assign _zz_434 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_435 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_436 = (iBus_cmd_payload_address >>> 5);
  assign _zz_437 = 1'b1;
  assign _zz_438 = 1'b1;
  assign _zz_439 = {_zz_59,_zz_58};
  assign _zz_440 = 32'h0000107f;
  assign _zz_441 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_442 = 32'h00002073;
  assign _zz_443 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_444 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_445 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_446) == 32'h00000003),{(_zz_447 == _zz_448),{_zz_449,{_zz_450,_zz_451}}}}}};
  assign _zz_446 = 32'h0000505f;
  assign _zz_447 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_448 = 32'h00000063;
  assign _zz_449 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_450 = ((decode_INSTRUCTION & 32'h1800707f) == 32'h0000202f);
  assign _zz_451 = {((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'he800707f) == 32'h0800202f),{((decode_INSTRUCTION & _zz_452) == 32'h00001013),{(_zz_453 == _zz_454),{_zz_455,{_zz_456,_zz_457}}}}}};
  assign _zz_452 = 32'hfc00305f;
  assign _zz_453 = (decode_INSTRUCTION & 32'h01f0707f);
  assign _zz_454 = 32'h0000500f;
  assign _zz_455 = ((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013);
  assign _zz_456 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00005033);
  assign _zz_457 = {((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033),{((decode_INSTRUCTION & 32'hf9f0707f) == 32'h1000202f),{((decode_INSTRUCTION & _zz_458) == 32'h12000073),{(_zz_459 == _zz_460),{_zz_461,_zz_462}}}}};
  assign _zz_458 = 32'hfe007fff;
  assign _zz_459 = (decode_INSTRUCTION & 32'hdfffffff);
  assign _zz_460 = 32'h10200073;
  assign _zz_461 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz_462 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h00000073);
  assign _zz_463 = 32'h02004064;
  assign _zz_464 = _zz_102;
  assign _zz_465 = {_zz_100,_zz_101};
  assign _zz_466 = ((decode_INSTRUCTION & 32'h02004074) == 32'h02000030);
  assign _zz_467 = 1'b0;
  assign _zz_468 = (((decode_INSTRUCTION & _zz_471) == 32'h00000050) != 1'b0);
  assign _zz_469 = ((_zz_472 == _zz_473) != 1'b0);
  assign _zz_470 = {({_zz_474,_zz_475} != 2'b00),{(_zz_476 != _zz_477),{_zz_478,{_zz_479,_zz_480}}}};
  assign _zz_471 = 32'h02203050;
  assign _zz_472 = (decode_INSTRUCTION & 32'h02403050);
  assign _zz_473 = 32'h00000050;
  assign _zz_474 = ((decode_INSTRUCTION & _zz_481) == 32'h00001050);
  assign _zz_475 = ((decode_INSTRUCTION & _zz_482) == 32'h00002050);
  assign _zz_476 = {_zz_96,(_zz_483 == _zz_484)};
  assign _zz_477 = 2'b00;
  assign _zz_478 = ((_zz_485 == _zz_486) != 1'b0);
  assign _zz_479 = ({_zz_487,_zz_488} != 2'b00);
  assign _zz_480 = {(_zz_489 != _zz_490),{_zz_491,{_zz_492,_zz_493}}};
  assign _zz_481 = 32'h00001050;
  assign _zz_482 = 32'h00002050;
  assign _zz_483 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_484 = 32'h00000004;
  assign _zz_485 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_486 = 32'h00000040;
  assign _zz_487 = ((decode_INSTRUCTION & _zz_494) == 32'h00005010);
  assign _zz_488 = ((decode_INSTRUCTION & _zz_495) == 32'h00005020);
  assign _zz_489 = {(_zz_496 == _zz_497),{_zz_498,_zz_499}};
  assign _zz_490 = 3'b000;
  assign _zz_491 = ((_zz_500 == _zz_501) != 1'b0);
  assign _zz_492 = (_zz_100 != 1'b0);
  assign _zz_493 = {(_zz_502 != _zz_503),{_zz_504,{_zz_505,_zz_506}}};
  assign _zz_494 = 32'h00007034;
  assign _zz_495 = 32'h02007064;
  assign _zz_496 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_497 = 32'h40001010;
  assign _zz_498 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00001010);
  assign _zz_499 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz_500 = (decode_INSTRUCTION & 32'h00001000);
  assign _zz_501 = 32'h00001000;
  assign _zz_502 = {(_zz_507 == _zz_508),(_zz_509 == _zz_510)};
  assign _zz_503 = 2'b00;
  assign _zz_504 = ((_zz_511 == _zz_512) != 1'b0);
  assign _zz_505 = (_zz_513 != 1'b0);
  assign _zz_506 = {(_zz_514 != _zz_515),{_zz_516,{_zz_517,_zz_518}}};
  assign _zz_507 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_508 = 32'h00002000;
  assign _zz_509 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_510 = 32'h00001000;
  assign _zz_511 = (decode_INSTRUCTION & 32'h02003050);
  assign _zz_512 = 32'h02000050;
  assign _zz_513 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz_514 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz_515 = 1'b0;
  assign _zz_516 = ({(_zz_519 == _zz_520),{_zz_521,{_zz_522,_zz_523}}} != 4'b0000);
  assign _zz_517 = ((_zz_524 == _zz_525) != 1'b0);
  assign _zz_518 = {(_zz_526 != 1'b0),{(_zz_527 != _zz_528),{_zz_529,{_zz_530,_zz_531}}}};
  assign _zz_519 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz_520 = 32'h00000020;
  assign _zz_521 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz_522 = ((decode_INSTRUCTION & _zz_532) == 32'h08000020);
  assign _zz_523 = ((decode_INSTRUCTION & _zz_533) == 32'h00000020);
  assign _zz_524 = (decode_INSTRUCTION & 32'h10000008);
  assign _zz_525 = 32'h00000008;
  assign _zz_526 = ((decode_INSTRUCTION & 32'h10000008) == 32'h10000008);
  assign _zz_527 = {(_zz_534 == _zz_535),{_zz_536,{_zz_537,_zz_538}}};
  assign _zz_528 = 6'h0;
  assign _zz_529 = ({_zz_539,{_zz_540,_zz_541}} != 3'b000);
  assign _zz_530 = (_zz_542 != 1'b0);
  assign _zz_531 = {(_zz_543 != _zz_544),{_zz_545,{_zz_546,_zz_547}}};
  assign _zz_532 = 32'h08000070;
  assign _zz_533 = 32'h10000070;
  assign _zz_534 = (decode_INSTRUCTION & 32'h00002040);
  assign _zz_535 = 32'h00002040;
  assign _zz_536 = ((decode_INSTRUCTION & _zz_548) == 32'h00001040);
  assign _zz_537 = (_zz_549 == _zz_550);
  assign _zz_538 = {_zz_551,{_zz_552,_zz_553}};
  assign _zz_539 = ((decode_INSTRUCTION & _zz_554) == 32'h08000020);
  assign _zz_540 = (_zz_555 == _zz_556);
  assign _zz_541 = (_zz_557 == _zz_558);
  assign _zz_542 = ((decode_INSTRUCTION & _zz_559) == 32'h00000010);
  assign _zz_543 = {_zz_99,{_zz_560,_zz_561}};
  assign _zz_544 = 5'h0;
  assign _zz_545 = ({_zz_562,_zz_563} != 7'h0);
  assign _zz_546 = (_zz_564 != _zz_565);
  assign _zz_547 = {_zz_566,{_zz_567,_zz_568}};
  assign _zz_548 = 32'h00001040;
  assign _zz_549 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_550 = 32'h00000040;
  assign _zz_551 = ((decode_INSTRUCTION & _zz_569) == 32'h00000040);
  assign _zz_552 = (_zz_570 == _zz_571);
  assign _zz_553 = (_zz_572 == _zz_573);
  assign _zz_554 = 32'h08000020;
  assign _zz_555 = (decode_INSTRUCTION & 32'h10000020);
  assign _zz_556 = 32'h00000020;
  assign _zz_557 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_558 = 32'h00000020;
  assign _zz_559 = 32'h00000010;
  assign _zz_560 = (_zz_574 == _zz_575);
  assign _zz_561 = {_zz_576,{_zz_577,_zz_578}};
  assign _zz_562 = _zz_96;
  assign _zz_563 = {_zz_579,{_zz_580,_zz_581}};
  assign _zz_564 = {_zz_98,_zz_582};
  assign _zz_565 = 2'b00;
  assign _zz_566 = ({_zz_583,_zz_584} != 2'b00);
  assign _zz_567 = (_zz_585 != _zz_586);
  assign _zz_568 = {_zz_587,{_zz_588,_zz_589}};
  assign _zz_569 = 32'h02400040;
  assign _zz_570 = (decode_INSTRUCTION & 32'h00000038);
  assign _zz_571 = 32'h0;
  assign _zz_572 = (decode_INSTRUCTION & 32'h18002008);
  assign _zz_573 = 32'h10002008;
  assign _zz_574 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz_575 = 32'h00002010;
  assign _zz_576 = ((decode_INSTRUCTION & _zz_590) == 32'h00000010);
  assign _zz_577 = (_zz_591 == _zz_592);
  assign _zz_578 = (_zz_593 == _zz_594);
  assign _zz_579 = ((decode_INSTRUCTION & _zz_595) == 32'h00001010);
  assign _zz_580 = (_zz_596 == _zz_597);
  assign _zz_581 = {_zz_598,{_zz_599,_zz_600}};
  assign _zz_582 = ((decode_INSTRUCTION & _zz_601) == 32'h00000020);
  assign _zz_583 = _zz_98;
  assign _zz_584 = (_zz_602 == _zz_603);
  assign _zz_585 = (_zz_604 == _zz_605);
  assign _zz_586 = 1'b0;
  assign _zz_587 = (_zz_606 != 1'b0);
  assign _zz_588 = (_zz_607 != _zz_608);
  assign _zz_589 = {_zz_609,{_zz_610,_zz_611}};
  assign _zz_590 = 32'h00001030;
  assign _zz_591 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz_592 = 32'h00000020;
  assign _zz_593 = (decode_INSTRUCTION & 32'h02002068);
  assign _zz_594 = 32'h00002020;
  assign _zz_595 = 32'h00001010;
  assign _zz_596 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_597 = 32'h00002010;
  assign _zz_598 = ((decode_INSTRUCTION & _zz_612) == 32'h00002008);
  assign _zz_599 = (_zz_613 == _zz_614);
  assign _zz_600 = {_zz_99,_zz_615};
  assign _zz_601 = 32'h00000070;
  assign _zz_602 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_603 = 32'h0;
  assign _zz_604 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz_605 = 32'h00004010;
  assign _zz_606 = ((decode_INSTRUCTION & _zz_616) == 32'h00002010);
  assign _zz_607 = {_zz_617,{_zz_618,_zz_619}};
  assign _zz_608 = 5'h0;
  assign _zz_609 = ({_zz_620,_zz_621} != 2'b00);
  assign _zz_610 = (_zz_622 != _zz_623);
  assign _zz_611 = {_zz_624,{_zz_625,_zz_626}};
  assign _zz_612 = 32'h00002008;
  assign _zz_613 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_614 = 32'h00000010;
  assign _zz_615 = ((decode_INSTRUCTION & _zz_627) == 32'h0);
  assign _zz_616 = 32'h00006014;
  assign _zz_617 = ((decode_INSTRUCTION & _zz_628) == 32'h0);
  assign _zz_618 = (_zz_629 == _zz_630);
  assign _zz_619 = {_zz_631,{_zz_632,_zz_633}};
  assign _zz_620 = _zz_97;
  assign _zz_621 = (_zz_634 == _zz_635);
  assign _zz_622 = {_zz_636,{_zz_637,_zz_638}};
  assign _zz_623 = 3'b000;
  assign _zz_624 = ({_zz_639,_zz_640} != 3'b000);
  assign _zz_625 = (_zz_641 != _zz_642);
  assign _zz_626 = (_zz_643 != _zz_644);
  assign _zz_627 = 32'h00000028;
  assign _zz_628 = 32'h00000044;
  assign _zz_629 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz_630 = 32'h0;
  assign _zz_631 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_632 = ((decode_INSTRUCTION & _zz_645) == 32'h00001000);
  assign _zz_633 = _zz_97;
  assign _zz_634 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_635 = 32'h0;
  assign _zz_636 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz_637 = ((decode_INSTRUCTION & _zz_646) == 32'h00002010);
  assign _zz_638 = ((decode_INSTRUCTION & _zz_647) == 32'h40000030);
  assign _zz_639 = _zz_96;
  assign _zz_640 = {_zz_95,(_zz_648 == _zz_649)};
  assign _zz_641 = {_zz_95,(_zz_650 == _zz_651)};
  assign _zz_642 = 2'b00;
  assign _zz_643 = ((decode_INSTRUCTION & _zz_652) == 32'h00001008);
  assign _zz_644 = 1'b0;
  assign _zz_645 = 32'h00005004;
  assign _zz_646 = 32'h00002014;
  assign _zz_647 = 32'h40000034;
  assign _zz_648 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz_649 = 32'h00000004;
  assign _zz_650 = (decode_INSTRUCTION & 32'h0000004c);
  assign _zz_651 = 32'h00000004;
  assign _zz_652 = 32'h00005048;
  assign _zz_653 = 32'h0;
  always @ (posedge clk) begin
    if(_zz_437) begin
      _zz_227 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_438) begin
      _zz_228 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_43) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (_zz_192                                                     ), //i
    .io_cpu_prefetch_isValid                  (_zz_193                                                     ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt               ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]       ), //i
    .io_cpu_fetch_isValid                     (_zz_194                                                     ), //i
    .io_cpu_fetch_isStuck                     (_zz_195                                                     ), //i
    .io_cpu_fetch_isRemoved                   (_zz_196                                                     ), //i
    .io_cpu_fetch_pc                          (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]       ), //i
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
    .io_cpu_fetch_mmuRsp_ways_0_sel           (IBusCachedPlugin_mmuBus_rsp_ways_0_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_0_physical      (IBusCachedPlugin_mmuBus_rsp_ways_0_physical[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_ways_1_sel           (IBusCachedPlugin_mmuBus_rsp_ways_1_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_1_physical      (IBusCachedPlugin_mmuBus_rsp_ways_1_physical[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_ways_2_sel           (IBusCachedPlugin_mmuBus_rsp_ways_2_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_2_physical      (IBusCachedPlugin_mmuBus_rsp_ways_2_physical[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_ways_3_sel           (IBusCachedPlugin_mmuBus_rsp_ways_3_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_3_physical      (IBusCachedPlugin_mmuBus_rsp_ways_3_physical[31:0]           ), //i
    .io_cpu_fetch_physicalAddress             (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]   ), //o
    .io_cpu_decode_isValid                    (_zz_197                                                     ), //i
    .io_cpu_decode_isStuck                    (_zz_198                                                     ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_3_input_payload[31:0]       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss              ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error                  ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling           ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException           ), //o
    .io_cpu_decode_isUser                     (_zz_199                                                     ), //i
    .io_cpu_fill_valid                        (_zz_200                                                     ), //i
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
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                    (_zz_201                                            ), //i
    .io_cpu_execute_address                    (_zz_202[31:0]                                      ), //i
    .io_cpu_execute_haltIt                     (dataCache_1_io_cpu_execute_haltIt                  ), //o
    .io_cpu_execute_args_wr                    (_zz_203                                            ), //i
    .io_cpu_execute_args_data                  (_zz_204[31:0]                                      ), //i
    .io_cpu_execute_args_size                  (_zz_205[1:0]                                       ), //i
    .io_cpu_execute_args_isLrsc                (_zz_206                                            ), //i
    .io_cpu_execute_args_isAmo                 (_zz_207                                            ), //i
    .io_cpu_execute_args_amoCtrl_swap          (_zz_208                                            ), //i
    .io_cpu_execute_args_amoCtrl_alu           (_zz_209[2:0]                                       ), //i
    .io_cpu_execute_args_totalyConsistent      (execute_MEMORY_FORCE_CONSTISTENCY                  ), //i
    .io_cpu_execute_refilling                  (dataCache_1_io_cpu_execute_refilling               ), //o
    .io_cpu_memory_isValid                     (_zz_210                                            ), //i
    .io_cpu_memory_isStuck                     (memory_arbitration_isStuck                         ), //i
    .io_cpu_memory_isWrite                     (dataCache_1_io_cpu_memory_isWrite                  ), //o
    .io_cpu_memory_address                     (_zz_211[31:0]                                      ), //i
    .io_cpu_memory_mmuRsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]  ), //i
    .io_cpu_memory_mmuRsp_isIoAccess           (_zz_212                                            ), //i
    .io_cpu_memory_mmuRsp_isPaging             (DBusCachedPlugin_mmuBus_rsp_isPaging               ), //i
    .io_cpu_memory_mmuRsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead              ), //i
    .io_cpu_memory_mmuRsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite             ), //i
    .io_cpu_memory_mmuRsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute           ), //i
    .io_cpu_memory_mmuRsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception              ), //i
    .io_cpu_memory_mmuRsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling              ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation    (DBusCachedPlugin_mmuBus_rsp_bypassTranslation      ), //i
    .io_cpu_memory_mmuRsp_ways_0_sel           (DBusCachedPlugin_mmuBus_rsp_ways_0_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_0_physical      (DBusCachedPlugin_mmuBus_rsp_ways_0_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_1_sel           (DBusCachedPlugin_mmuBus_rsp_ways_1_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_1_physical      (DBusCachedPlugin_mmuBus_rsp_ways_1_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_2_sel           (DBusCachedPlugin_mmuBus_rsp_ways_2_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_2_physical      (DBusCachedPlugin_mmuBus_rsp_ways_2_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_3_sel           (DBusCachedPlugin_mmuBus_rsp_ways_3_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_3_physical      (DBusCachedPlugin_mmuBus_rsp_ways_3_physical[31:0]  ), //i
    .io_cpu_writeBack_isValid                  (_zz_213                                            ), //i
    .io_cpu_writeBack_isStuck                  (writeBack_arbitration_isStuck                      ), //i
    .io_cpu_writeBack_isUser                   (_zz_214                                            ), //i
    .io_cpu_writeBack_haltIt                   (dataCache_1_io_cpu_writeBack_haltIt                ), //o
    .io_cpu_writeBack_isWrite                  (dataCache_1_io_cpu_writeBack_isWrite               ), //o
    .io_cpu_writeBack_data                     (dataCache_1_io_cpu_writeBack_data[31:0]            ), //o
    .io_cpu_writeBack_address                  (_zz_215[31:0]                                      ), //i
    .io_cpu_writeBack_mmuException             (dataCache_1_io_cpu_writeBack_mmuException          ), //o
    .io_cpu_writeBack_unalignedAccess          (dataCache_1_io_cpu_writeBack_unalignedAccess       ), //o
    .io_cpu_writeBack_accessError              (dataCache_1_io_cpu_writeBack_accessError           ), //o
    .io_cpu_writeBack_keepMemRspData           (dataCache_1_io_cpu_writeBack_keepMemRspData        ), //o
    .io_cpu_writeBack_fence_SW                 (_zz_216                                            ), //i
    .io_cpu_writeBack_fence_SR                 (_zz_217                                            ), //i
    .io_cpu_writeBack_fence_SO                 (_zz_218                                            ), //i
    .io_cpu_writeBack_fence_SI                 (_zz_219                                            ), //i
    .io_cpu_writeBack_fence_PW                 (_zz_220                                            ), //i
    .io_cpu_writeBack_fence_PR                 (_zz_221                                            ), //i
    .io_cpu_writeBack_fence_PO                 (_zz_222                                            ), //i
    .io_cpu_writeBack_fence_PI                 (_zz_223                                            ), //i
    .io_cpu_writeBack_fence_FM                 (_zz_224[3:0]                                       ), //i
    .io_cpu_redo                               (dataCache_1_io_cpu_redo                            ), //o
    .io_cpu_flush_valid                        (_zz_225                                            ), //i
    .io_cpu_flush_ready                        (dataCache_1_io_cpu_flush_ready                     ), //o
    .io_mem_cmd_valid                          (dataCache_1_io_mem_cmd_valid                       ), //o
    .io_mem_cmd_ready                          (_zz_226                                            ), //i
    .io_mem_cmd_payload_wr                     (dataCache_1_io_mem_cmd_payload_wr                  ), //o
    .io_mem_cmd_payload_uncached               (dataCache_1_io_mem_cmd_payload_uncached            ), //o
    .io_mem_cmd_payload_address                (dataCache_1_io_mem_cmd_payload_address[31:0]       ), //o
    .io_mem_cmd_payload_data                   (dataCache_1_io_mem_cmd_payload_data[31:0]          ), //o
    .io_mem_cmd_payload_mask                   (dataCache_1_io_mem_cmd_payload_mask[3:0]           ), //o
    .io_mem_cmd_payload_length                 (dataCache_1_io_mem_cmd_payload_length[2:0]         ), //o
    .io_mem_cmd_payload_last                   (dataCache_1_io_mem_cmd_payload_last                ), //o
    .io_mem_rsp_valid                          (dBus_rsp_valid                                     ), //i
    .io_mem_rsp_payload_last                   (dBus_rsp_payload_last                              ), //i
    .io_mem_rsp_payload_data                   (dBus_rsp_payload_data[31:0]                        ), //i
    .io_mem_rsp_payload_error                  (dBus_rsp_payload_error                             ), //i
    .clk                                       (clk                                                ), //i
    .reset                                     (reset                                              )  //i
  );
  always @(*) begin
    case(_zz_439)
      2'b00 : begin
        _zz_229 = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_229 = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_229 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_229 = CsrPlugin_redoInterface_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_83)
      2'b00 : begin
        _zz_230 = MmuPlugin_ports_0_cache_0_valid;
        _zz_231 = MmuPlugin_ports_0_cache_0_exception;
        _zz_232 = MmuPlugin_ports_0_cache_0_superPage;
        _zz_233 = MmuPlugin_ports_0_cache_0_virtualAddress_0;
        _zz_234 = MmuPlugin_ports_0_cache_0_virtualAddress_1;
        _zz_235 = MmuPlugin_ports_0_cache_0_physicalAddress_0;
        _zz_236 = MmuPlugin_ports_0_cache_0_physicalAddress_1;
        _zz_237 = MmuPlugin_ports_0_cache_0_allowRead;
        _zz_238 = MmuPlugin_ports_0_cache_0_allowWrite;
        _zz_239 = MmuPlugin_ports_0_cache_0_allowExecute;
        _zz_240 = MmuPlugin_ports_0_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_230 = MmuPlugin_ports_0_cache_1_valid;
        _zz_231 = MmuPlugin_ports_0_cache_1_exception;
        _zz_232 = MmuPlugin_ports_0_cache_1_superPage;
        _zz_233 = MmuPlugin_ports_0_cache_1_virtualAddress_0;
        _zz_234 = MmuPlugin_ports_0_cache_1_virtualAddress_1;
        _zz_235 = MmuPlugin_ports_0_cache_1_physicalAddress_0;
        _zz_236 = MmuPlugin_ports_0_cache_1_physicalAddress_1;
        _zz_237 = MmuPlugin_ports_0_cache_1_allowRead;
        _zz_238 = MmuPlugin_ports_0_cache_1_allowWrite;
        _zz_239 = MmuPlugin_ports_0_cache_1_allowExecute;
        _zz_240 = MmuPlugin_ports_0_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_230 = MmuPlugin_ports_0_cache_2_valid;
        _zz_231 = MmuPlugin_ports_0_cache_2_exception;
        _zz_232 = MmuPlugin_ports_0_cache_2_superPage;
        _zz_233 = MmuPlugin_ports_0_cache_2_virtualAddress_0;
        _zz_234 = MmuPlugin_ports_0_cache_2_virtualAddress_1;
        _zz_235 = MmuPlugin_ports_0_cache_2_physicalAddress_0;
        _zz_236 = MmuPlugin_ports_0_cache_2_physicalAddress_1;
        _zz_237 = MmuPlugin_ports_0_cache_2_allowRead;
        _zz_238 = MmuPlugin_ports_0_cache_2_allowWrite;
        _zz_239 = MmuPlugin_ports_0_cache_2_allowExecute;
        _zz_240 = MmuPlugin_ports_0_cache_2_allowUser;
      end
      default : begin
        _zz_230 = MmuPlugin_ports_0_cache_3_valid;
        _zz_231 = MmuPlugin_ports_0_cache_3_exception;
        _zz_232 = MmuPlugin_ports_0_cache_3_superPage;
        _zz_233 = MmuPlugin_ports_0_cache_3_virtualAddress_0;
        _zz_234 = MmuPlugin_ports_0_cache_3_virtualAddress_1;
        _zz_235 = MmuPlugin_ports_0_cache_3_physicalAddress_0;
        _zz_236 = MmuPlugin_ports_0_cache_3_physicalAddress_1;
        _zz_237 = MmuPlugin_ports_0_cache_3_allowRead;
        _zz_238 = MmuPlugin_ports_0_cache_3_allowWrite;
        _zz_239 = MmuPlugin_ports_0_cache_3_allowExecute;
        _zz_240 = MmuPlugin_ports_0_cache_3_allowUser;
      end
    endcase
  end

  always @(*) begin
    case(_zz_87)
      2'b00 : begin
        _zz_241 = MmuPlugin_ports_1_cache_0_valid;
        _zz_242 = MmuPlugin_ports_1_cache_0_exception;
        _zz_243 = MmuPlugin_ports_1_cache_0_superPage;
        _zz_244 = MmuPlugin_ports_1_cache_0_virtualAddress_0;
        _zz_245 = MmuPlugin_ports_1_cache_0_virtualAddress_1;
        _zz_246 = MmuPlugin_ports_1_cache_0_physicalAddress_0;
        _zz_247 = MmuPlugin_ports_1_cache_0_physicalAddress_1;
        _zz_248 = MmuPlugin_ports_1_cache_0_allowRead;
        _zz_249 = MmuPlugin_ports_1_cache_0_allowWrite;
        _zz_250 = MmuPlugin_ports_1_cache_0_allowExecute;
        _zz_251 = MmuPlugin_ports_1_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_241 = MmuPlugin_ports_1_cache_1_valid;
        _zz_242 = MmuPlugin_ports_1_cache_1_exception;
        _zz_243 = MmuPlugin_ports_1_cache_1_superPage;
        _zz_244 = MmuPlugin_ports_1_cache_1_virtualAddress_0;
        _zz_245 = MmuPlugin_ports_1_cache_1_virtualAddress_1;
        _zz_246 = MmuPlugin_ports_1_cache_1_physicalAddress_0;
        _zz_247 = MmuPlugin_ports_1_cache_1_physicalAddress_1;
        _zz_248 = MmuPlugin_ports_1_cache_1_allowRead;
        _zz_249 = MmuPlugin_ports_1_cache_1_allowWrite;
        _zz_250 = MmuPlugin_ports_1_cache_1_allowExecute;
        _zz_251 = MmuPlugin_ports_1_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_241 = MmuPlugin_ports_1_cache_2_valid;
        _zz_242 = MmuPlugin_ports_1_cache_2_exception;
        _zz_243 = MmuPlugin_ports_1_cache_2_superPage;
        _zz_244 = MmuPlugin_ports_1_cache_2_virtualAddress_0;
        _zz_245 = MmuPlugin_ports_1_cache_2_virtualAddress_1;
        _zz_246 = MmuPlugin_ports_1_cache_2_physicalAddress_0;
        _zz_247 = MmuPlugin_ports_1_cache_2_physicalAddress_1;
        _zz_248 = MmuPlugin_ports_1_cache_2_allowRead;
        _zz_249 = MmuPlugin_ports_1_cache_2_allowWrite;
        _zz_250 = MmuPlugin_ports_1_cache_2_allowExecute;
        _zz_251 = MmuPlugin_ports_1_cache_2_allowUser;
      end
      default : begin
        _zz_241 = MmuPlugin_ports_1_cache_3_valid;
        _zz_242 = MmuPlugin_ports_1_cache_3_exception;
        _zz_243 = MmuPlugin_ports_1_cache_3_superPage;
        _zz_244 = MmuPlugin_ports_1_cache_3_virtualAddress_0;
        _zz_245 = MmuPlugin_ports_1_cache_3_virtualAddress_1;
        _zz_246 = MmuPlugin_ports_1_cache_3_physicalAddress_0;
        _zz_247 = MmuPlugin_ports_1_cache_3_physicalAddress_1;
        _zz_248 = MmuPlugin_ports_1_cache_3_allowRead;
        _zz_249 = MmuPlugin_ports_1_cache_3_allowWrite;
        _zz_250 = MmuPlugin_ports_1_cache_3_allowExecute;
        _zz_251 = MmuPlugin_ports_1_cache_3_allowUser;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_1)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_1_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_1_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_1_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_1_string = "ECALL";
      default : _zz_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_2_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_2_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_2_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_2_string = "ECALL";
      default : _zz_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_3_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_3_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_3_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_3_string = "ECALL";
      default : _zz_3_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_4_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_4_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_4_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_4_string = "ECALL";
      default : _zz_4_string = "?????";
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
    case(_zz_5)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_5_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_5_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_5_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_5_string = "ECALL";
      default : _zz_5_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_6_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_6_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_6_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_6_string = "ECALL";
      default : _zz_6_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_7_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_7_string = "ECALL";
      default : _zz_7_string = "?????";
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
    case(_zz_10)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_10_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_10_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_10_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_10_string = "JALR";
      default : _zz_10_string = "????";
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
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_13_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_13_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_13_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_13_string = "SRA_1    ";
      default : _zz_13_string = "?????????";
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
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_16_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_16_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_16_string = "AND_1";
      default : _zz_16_string = "?????";
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
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_19_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_19_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_19_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_19_string = "PC ";
      default : _zz_19_string = "???";
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
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_22_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_22_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_22_string = "BITWISE ";
      default : _zz_22_string = "????????";
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
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_25)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_25_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_25_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_25_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_25_string = "URS1        ";
      default : _zz_25_string = "????????????";
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
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_28_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_28_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_28_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_28_string = "ECALL";
      default : _zz_28_string = "?????";
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
    case(_zz_29)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_29_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_29_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_29_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_29_string = "ECALL";
      default : _zz_29_string = "?????";
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
    case(_zz_30)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_30_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_30_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_30_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_30_string = "ECALL";
      default : _zz_30_string = "?????";
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
    case(_zz_31)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_31_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_31_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_31_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_31_string = "JALR";
      default : _zz_31_string = "????";
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
    case(_zz_34)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_34_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_34_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_34_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_34_string = "SRA_1    ";
      default : _zz_34_string = "?????????";
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
    case(_zz_35)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_35_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_35_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_35_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_35_string = "SRA_1    ";
      default : _zz_35_string = "?????????";
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
    case(_zz_37)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_37_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_37_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_37_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_37_string = "PC ";
      default : _zz_37_string = "???";
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
    case(_zz_38)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_38_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_38_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_38_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_38_string = "URS1        ";
      default : _zz_38_string = "????????????";
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
    case(_zz_39)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_39_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_39_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_39_string = "BITWISE ";
      default : _zz_39_string = "????????";
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
    case(_zz_40)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_40_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_40_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_40_string = "AND_1";
      default : _zz_40_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_44_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_44_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_44_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_44_string = "ECALL";
      default : _zz_44_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_45_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_45_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_45_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_45_string = "JALR";
      default : _zz_45_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_46)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_46_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_46_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_46_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_46_string = "SRA_1    ";
      default : _zz_46_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_47_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_47_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_47_string = "AND_1";
      default : _zz_47_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_48)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_48_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_48_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_48_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_48_string = "PC ";
      default : _zz_48_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_49_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_49_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_49_string = "BITWISE ";
      default : _zz_49_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_50)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_50_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_50_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_50_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_50_string = "URS1        ";
      default : _zz_50_string = "????????????";
    endcase
  end
  always @(*) begin
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : MmuPlugin_shared_state_1_string = "IDLE  ";
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : MmuPlugin_shared_state_1_string = "L1_CMD";
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : MmuPlugin_shared_state_1_string = "L1_RSP";
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : MmuPlugin_shared_state_1_string = "L0_CMD";
      `MmuPlugin_shared_State_defaultEncoding_L0_RSP : MmuPlugin_shared_state_1_string = "L0_RSP";
      default : MmuPlugin_shared_state_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_103)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_103_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_103_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_103_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_103_string = "URS1        ";
      default : _zz_103_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_104)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_104_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_104_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_104_string = "BITWISE ";
      default : _zz_104_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_105)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_105_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_105_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_105_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_105_string = "PC ";
      default : _zz_105_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_106)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_106_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_106_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_106_string = "AND_1";
      default : _zz_106_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_107)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_107_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_107_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_107_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_107_string = "SRA_1    ";
      default : _zz_107_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_108)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_108_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_108_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_108_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_108_string = "JALR";
      default : _zz_108_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_109)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_109_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_109_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_109_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_109_string = "ECALL";
      default : _zz_109_string = "?????";
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
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
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
  `endif

  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_133;
  assign execute_SHIFT_RIGHT = _zz_311;
  assign execute_REGFILE_WRITE_DATA = _zz_111;
  assign execute_IS_DBUS_SHARING = (MmuPlugin_dBusAccess_cmd_valid && MmuPlugin_dBusAccess_cmd_ready);
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_202[1 : 0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_IS_DIV = _zz_313[0];
  assign decode_IS_RS2_SIGNED = _zz_314[0];
  assign decode_IS_RS1_SIGNED = _zz_315[0];
  assign decode_IS_MUL = _zz_316[0];
  assign _zz_1 = _zz_2;
  assign _zz_3 = _zz_4;
  assign decode_ENV_CTRL = _zz_5;
  assign _zz_6 = _zz_7;
  assign decode_IS_CSR = _zz_317[0];
  assign decode_BRANCH_CTRL = _zz_8;
  assign _zz_9 = _zz_10;
  assign _zz_11 = _zz_12;
  assign decode_SHIFT_CTRL = _zz_13;
  assign _zz_14 = _zz_15;
  assign decode_ALU_BITWISE_CTRL = _zz_16;
  assign _zz_17 = _zz_18;
  assign decode_SRC_LESS_UNSIGNED = _zz_318[0];
  assign memory_IS_SFENCE_VMA = execute_to_memory_IS_SFENCE_VMA;
  assign execute_IS_SFENCE_VMA = decode_to_execute_IS_SFENCE_VMA;
  assign decode_IS_SFENCE_VMA = _zz_319[0];
  assign decode_MEMORY_MANAGMENT = _zz_320[0];
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_321[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_322[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_323[0];
  assign decode_SRC2_CTRL = _zz_19;
  assign _zz_20 = _zz_21;
  assign decode_ALU_CTRL = _zz_22;
  assign _zz_23 = _zz_24;
  assign decode_SRC1_CTRL = _zz_25;
  assign _zz_26 = _zz_27;
  assign decode_MEMORY_FORCE_CONSTISTENCY = _zz_52;
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
  assign memory_ENV_CTRL = _zz_28;
  assign execute_ENV_CTRL = _zz_29;
  assign writeBack_ENV_CTRL = _zz_30;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_31;
  assign decode_RS2_USE = _zz_324[0];
  assign decode_RS1_USE = _zz_325[0];
  always @ (*) begin
    _zz_32 = execute_REGFILE_WRITE_DATA;
    if(_zz_252)begin
      _zz_32 = execute_CsrPlugin_readData;
    end
    if(DBusCachedPlugin_forceDatapath)begin
      _zz_32 = MmuPlugin_dBusAccess_cmd_payload_address;
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
    if(_zz_122)begin
      if((_zz_123 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_124;
      end
    end
    if(_zz_253)begin
      if(_zz_254)begin
        if(_zz_126)begin
          decode_RS2 = _zz_51;
        end
      end
    end
    if(_zz_255)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_128)begin
          decode_RS2 = _zz_33;
        end
      end
    end
    if(_zz_256)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_130)begin
          decode_RS2 = _zz_32;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_122)begin
      if((_zz_123 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_124;
      end
    end
    if(_zz_253)begin
      if(_zz_254)begin
        if(_zz_125)begin
          decode_RS1 = _zz_51;
        end
      end
    end
    if(_zz_255)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_127)begin
          decode_RS1 = _zz_33;
        end
      end
    end
    if(_zz_256)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_129)begin
          decode_RS1 = _zz_32;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_33 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_33 = _zz_119;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_33 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_257)begin
      _zz_33 = ((memory_INSTRUCTION[13 : 12] == 2'b00) ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_accumulator[63 : 32]);
    end
    if(_zz_258)begin
      _zz_33 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_34;
  assign execute_SHIFT_CTRL = _zz_35;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_36 = execute_PC;
  assign execute_SRC2_CTRL = _zz_37;
  assign execute_SRC1_CTRL = _zz_38;
  assign decode_SRC_USE_SUB_LESS = _zz_326[0];
  assign decode_SRC_ADD_ZERO = _zz_327[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_39;
  assign execute_SRC2 = _zz_117;
  assign execute_SRC1 = _zz_112;
  assign execute_ALU_BITWISE_CTRL = _zz_40;
  assign _zz_41 = writeBack_INSTRUCTION;
  assign _zz_42 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_43 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_43 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_328[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_440) == 32'h00001073),{(_zz_441 == _zz_442),{_zz_443,{_zz_444,_zz_445}}}}}}} != 25'h0);
  assign writeBack_IS_SFENCE_VMA = memory_to_writeBack_IS_SFENCE_VMA;
  assign writeBack_IS_DBUS_SHARING = memory_to_writeBack_IS_DBUS_SHARING;
  assign memory_IS_DBUS_SHARING = execute_to_memory_IS_DBUS_SHARING;
  always @ (*) begin
    _zz_51 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_51 = writeBack_DBusCachedPlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_AMO = decode_to_execute_MEMORY_AMO;
  assign execute_MEMORY_LRSC = decode_to_execute_MEMORY_LRSC;
  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_AMO = _zz_329[0];
  assign decode_MEMORY_LRSC = _zz_330[0];
  assign decode_MEMORY_ENABLE = _zz_331[0];
  assign decode_FLUSH_ALL = _zz_332[0];
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(_zz_259)begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(_zz_260)begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(_zz_261)begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_262)begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @ (*) begin
    _zz_53 = execute_FORMAL_PC_NEXT;
    if(CsrPlugin_redoInterface_valid)begin
      _zz_53 = CsrPlugin_redoInterface_payload;
    end
  end

  always @ (*) begin
    _zz_54 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_54 = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_120 || _zz_121)))begin
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
    if(_zz_263)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(_zz_263)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((_zz_225 && (! dataCache_1_io_cpu_flush_ready)) || dataCache_1_io_cpu_execute_haltIt))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_264)begin
      if((! execute_CsrPlugin_wfiWake))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_252)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if((dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid))begin
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

  assign execute_arbitration_flushIt = 1'b0;
  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(execute_CsrPlugin_csr_384)begin
      if(execute_CsrPlugin_writeInstruction)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if(_zz_257)begin
      if(((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_mul_counter_willOverflowIfInc)))begin
        memory_arbitration_haltItself = 1'b1;
      end
      if(_zz_265)begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_258)begin
      if(((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
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
    if(BranchPlugin_branchExceptionPort_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1_io_cpu_writeBack_haltIt)begin
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
    if(_zz_266)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_267)begin
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
    if(_zz_266)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_267)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid) || IBusCachedPlugin_iBusRsp_stages_3_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_inWfi = 1'b0;
    if(_zz_264)begin
      CsrPlugin_inWfi = 1'b1;
    end
  end

  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_266)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_267)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_266)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_267)begin
      case(_zz_268)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        2'b01 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_sepc;
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
  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_redoInterface_valid,{CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}} != 4'b0000);
  assign _zz_55 = {CsrPlugin_redoInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_56 = (_zz_55 & (~ _zz_333));
  assign _zz_57 = _zz_56[3];
  assign _zz_58 = (_zz_56[1] || _zz_57);
  assign _zz_59 = (_zz_56[2] || _zz_57);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_229;
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
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_335);
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
  assign IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_60 = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_61 = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy)begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_62 = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_62);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_62);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_3_halt = 1'b1;
    end
  end

  assign _zz_63 = (! IBusCachedPlugin_iBusRsp_stages_3_halt);
  assign IBusCachedPlugin_iBusRsp_stages_3_input_ready = (IBusCachedPlugin_iBusRsp_stages_3_output_ready && _zz_63);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_valid = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && _zz_63);
  assign IBusCachedPlugin_iBusRsp_stages_3_output_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_3_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_64;
  assign _zz_64 = ((1'b0 && (! _zz_65)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_65 = _zz_66;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_65;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_67)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_67 = _zz_68;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_67;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_69;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = ((1'b0 && (! _zz_70)) || IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign _zz_70 = _zz_71;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_valid = _zz_70;
  assign IBusCachedPlugin_iBusRsp_stages_3_input_payload = _zz_72;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if((! IBusCachedPlugin_pcValids_0))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_5;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_193 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_194 = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_195 = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_194;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_2_input_ready || IBusCachedPlugin_externalFlush);
  assign _zz_197 = (IBusCachedPlugin_iBusRsp_stages_3_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_198 = (! IBusCachedPlugin_iBusRsp_stages_3_input_ready);
  assign _zz_199 = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_262)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_260)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_200 = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_260)begin
      _zz_200 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_261)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_259)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(_zz_261)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(_zz_259)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_3_input_payload[31 : 2],2'b00};
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_3_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_3_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_3_output_payload;
  assign _zz_192 = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1_io_mem_cmd_s2mPipe_valid = (dataCache_1_io_mem_cmd_valid || dataCache_1_io_mem_cmd_s2mPipe_rValid);
  assign _zz_226 = (! dataCache_1_io_mem_cmd_s2mPipe_rValid);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_wr = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_wr : dataCache_1_io_mem_cmd_payload_wr);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_uncached = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_uncached : dataCache_1_io_mem_cmd_payload_uncached);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_address = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_address : dataCache_1_io_mem_cmd_payload_address);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_data = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_data : dataCache_1_io_mem_cmd_payload_data);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_mask = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_mask : dataCache_1_io_mem_cmd_payload_mask);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_length = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_length : dataCache_1_io_mem_cmd_payload_length);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_last = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_last : dataCache_1_io_mem_cmd_payload_last);
  assign dataCache_1_io_mem_cmd_s2mPipe_ready = ((1'b1 && (! dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid)) || dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready);
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_wr;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_uncached;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_address;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_data;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_mask;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_length = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_length;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_last;
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  assign dBus_cmd_payload_uncached = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_length;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  always @ (*) begin
    _zz_52 = 1'b0;
    if(decode_INSTRUCTION[25])begin
      if(decode_MEMORY_LRSC)begin
        _zz_52 = 1'b1;
      end
      if(decode_MEMORY_AMO)begin
        _zz_52 = 1'b1;
      end
    end
  end

  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    _zz_201 = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        if(_zz_270)begin
          _zz_201 = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    _zz_202 = execute_SRC_ADD;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        _zz_202 = MmuPlugin_dBusAccess_cmd_payload_address;
      end
    end
  end

  always @ (*) begin
    _zz_203 = execute_MEMORY_WR;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        _zz_203 = MmuPlugin_dBusAccess_cmd_payload_write;
      end
    end
  end

  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_75 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_75 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_75 = execute_RS2[31 : 0];
      end
    endcase
  end

  always @ (*) begin
    _zz_204 = _zz_75;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        _zz_204 = MmuPlugin_dBusAccess_cmd_payload_data;
      end
    end
  end

  always @ (*) begin
    _zz_205 = execute_DBusCachedPlugin_size;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        _zz_205 = MmuPlugin_dBusAccess_cmd_payload_size;
      end
    end
  end

  assign _zz_225 = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  always @ (*) begin
    _zz_206 = 1'b0;
    if(execute_MEMORY_LRSC)begin
      _zz_206 = 1'b1;
    end
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        _zz_206 = 1'b0;
      end
    end
  end

  always @ (*) begin
    _zz_207 = execute_MEMORY_AMO;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        _zz_207 = 1'b0;
      end
    end
  end

  assign _zz_209 = execute_INSTRUCTION[31 : 29];
  assign _zz_208 = execute_INSTRUCTION[27];
  always @ (*) begin
    _zz_210 = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
    if(memory_IS_DBUS_SHARING)begin
      _zz_210 = 1'b1;
    end
  end

  assign _zz_211 = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_210;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = _zz_211;
  always @ (*) begin
    DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
    if(memory_IS_DBUS_SHARING)begin
      DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @ (*) begin
    _zz_212 = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((1'b0 && (! dataCache_1_io_cpu_memory_isWrite)))begin
      _zz_212 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_213 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_IS_DBUS_SHARING)begin
      _zz_213 = 1'b1;
    end
  end

  assign _zz_214 = (CsrPlugin_privilege == 2'b00);
  assign _zz_215 = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(_zz_271)begin
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(_zz_271)begin
      if(dataCache_1_io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(_zz_271)begin
      if(dataCache_1_io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_336};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_337};
      end
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1_io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_76 = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
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
    _zz_77[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_78 = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
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
    _zz_79[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_308)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_77;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_79;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    MmuPlugin_dBusAccess_cmd_ready = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        if(_zz_270)begin
          MmuPlugin_dBusAccess_cmd_ready = (! execute_arbitration_isStuck);
        end
      end
    end
  end

  always @ (*) begin
    DBusCachedPlugin_forceDatapath = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_269)begin
        DBusCachedPlugin_forceDatapath = 1'b1;
      end
    end
  end

  assign MmuPlugin_dBusAccess_rsp_valid = ((writeBack_IS_DBUS_SHARING && (! dataCache_1_io_cpu_writeBack_isWrite)) && (dataCache_1_io_cpu_redo || (! dataCache_1_io_cpu_writeBack_haltIt)));
  assign MmuPlugin_dBusAccess_rsp_payload_data = dataCache_1_io_cpu_writeBack_data;
  assign MmuPlugin_dBusAccess_rsp_payload_error = (dataCache_1_io_cpu_writeBack_unalignedAccess || dataCache_1_io_cpu_writeBack_accessError);
  assign MmuPlugin_dBusAccess_rsp_payload_redo = dataCache_1_io_cpu_redo;
  assign MmuPlugin_ports_0_dirty = 1'b0;
  always @ (*) begin
    MmuPlugin_ports_0_requireMmuLockupCalc = ((1'b1 && (! IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11)))begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
    if((CsrPlugin_privilege == 2'b11))begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
  end

  always @ (*) begin
    MmuPlugin_ports_0_cacheHitsCalc[0] = ((MmuPlugin_ports_0_cache_0_valid && (MmuPlugin_ports_0_cache_0_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_0_superPage || (MmuPlugin_ports_0_cache_0_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_0_cacheHitsCalc[1] = ((MmuPlugin_ports_0_cache_1_valid && (MmuPlugin_ports_0_cache_1_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_1_superPage || (MmuPlugin_ports_0_cache_1_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_0_cacheHitsCalc[2] = ((MmuPlugin_ports_0_cache_2_valid && (MmuPlugin_ports_0_cache_2_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_2_superPage || (MmuPlugin_ports_0_cache_2_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_0_cacheHitsCalc[3] = ((MmuPlugin_ports_0_cache_3_valid && (MmuPlugin_ports_0_cache_3_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_3_superPage || (MmuPlugin_ports_0_cache_3_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
  end

  assign MmuPlugin_ports_0_cacheHit = (MmuPlugin_ports_0_cacheHitsCalc != 4'b0000);
  assign _zz_80 = MmuPlugin_ports_0_cacheHitsCalc[3];
  assign _zz_81 = (MmuPlugin_ports_0_cacheHitsCalc[1] || _zz_80);
  assign _zz_82 = (MmuPlugin_ports_0_cacheHitsCalc[2] || _zz_80);
  assign _zz_83 = {_zz_82,_zz_81};
  assign MmuPlugin_ports_0_cacheLine_valid = _zz_230;
  assign MmuPlugin_ports_0_cacheLine_exception = _zz_231;
  assign MmuPlugin_ports_0_cacheLine_superPage = _zz_232;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_0 = _zz_233;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_1 = _zz_234;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_0 = _zz_235;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_1 = _zz_236;
  assign MmuPlugin_ports_0_cacheLine_allowRead = _zz_237;
  assign MmuPlugin_ports_0_cacheLine_allowWrite = _zz_238;
  assign MmuPlugin_ports_0_cacheLine_allowExecute = _zz_239;
  assign MmuPlugin_ports_0_cacheLine_allowUser = _zz_240;
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b0;
    if(_zz_272)begin
      if(_zz_273)begin
        MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_0_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_0_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign MmuPlugin_ports_0_entryToReplace_willOverflow = (MmuPlugin_ports_0_entryToReplace_willOverflowIfInc && MmuPlugin_ports_0_entryToReplace_willIncrement);
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_valueNext = (MmuPlugin_ports_0_entryToReplace_value + _zz_339);
    if(MmuPlugin_ports_0_entryToReplace_willClear)begin
      MmuPlugin_ports_0_entryToReplace_valueNext = 2'b00;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_0_cacheLine_physicalAddress_1,(MmuPlugin_ports_0_cacheLine_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cacheLine_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
    end else begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_0_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_0_cacheLine_allowExecute));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_0_cacheLine_allowWrite;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_0_cacheLine_allowExecute;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_0_dirty) && MmuPlugin_ports_0_cacheHit) && ((MmuPlugin_ports_0_cacheLine_exception || ((MmuPlugin_ports_0_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_0_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_0_dirty || (! MmuPlugin_ports_0_cacheHit));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (((IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1011) || (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1110)) || (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111));
  assign IBusCachedPlugin_mmuBus_rsp_bypassTranslation = (! MmuPlugin_ports_0_requireMmuLockupCalc);
  assign IBusCachedPlugin_mmuBus_rsp_ways_0_sel = MmuPlugin_ports_0_cacheHitsCalc[0];
  assign IBusCachedPlugin_mmuBus_rsp_ways_0_physical = {{MmuPlugin_ports_0_cache_0_physicalAddress_1,(MmuPlugin_ports_0_cache_0_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_0_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_1_sel = MmuPlugin_ports_0_cacheHitsCalc[1];
  assign IBusCachedPlugin_mmuBus_rsp_ways_1_physical = {{MmuPlugin_ports_0_cache_1_physicalAddress_1,(MmuPlugin_ports_0_cache_1_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_1_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_2_sel = MmuPlugin_ports_0_cacheHitsCalc[2];
  assign IBusCachedPlugin_mmuBus_rsp_ways_2_physical = {{MmuPlugin_ports_0_cache_2_physicalAddress_1,(MmuPlugin_ports_0_cache_2_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_2_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_3_sel = MmuPlugin_ports_0_cacheHitsCalc[3];
  assign IBusCachedPlugin_mmuBus_rsp_ways_3_physical = {{MmuPlugin_ports_0_cache_3_physicalAddress_1,(MmuPlugin_ports_0_cache_3_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_3_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign MmuPlugin_ports_1_dirty = 1'b0;
  always @ (*) begin
    MmuPlugin_ports_1_requireMmuLockupCalc = ((1'b1 && (! DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11)))begin
      MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
    end
    if((CsrPlugin_privilege == 2'b11))begin
      if(((! MmuPlugin_status_mprv) || (CsrPlugin_mstatus_MPP == 2'b11)))begin
        MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
      end
    end
  end

  always @ (*) begin
    MmuPlugin_ports_1_cacheHitsCalc[0] = ((MmuPlugin_ports_1_cache_0_valid && (MmuPlugin_ports_1_cache_0_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_0_superPage || (MmuPlugin_ports_1_cache_0_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[1] = ((MmuPlugin_ports_1_cache_1_valid && (MmuPlugin_ports_1_cache_1_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_1_superPage || (MmuPlugin_ports_1_cache_1_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[2] = ((MmuPlugin_ports_1_cache_2_valid && (MmuPlugin_ports_1_cache_2_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_2_superPage || (MmuPlugin_ports_1_cache_2_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[3] = ((MmuPlugin_ports_1_cache_3_valid && (MmuPlugin_ports_1_cache_3_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_3_superPage || (MmuPlugin_ports_1_cache_3_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
  end

  assign MmuPlugin_ports_1_cacheHit = (MmuPlugin_ports_1_cacheHitsCalc != 4'b0000);
  assign _zz_84 = MmuPlugin_ports_1_cacheHitsCalc[3];
  assign _zz_85 = (MmuPlugin_ports_1_cacheHitsCalc[1] || _zz_84);
  assign _zz_86 = (MmuPlugin_ports_1_cacheHitsCalc[2] || _zz_84);
  assign _zz_87 = {_zz_86,_zz_85};
  assign MmuPlugin_ports_1_cacheLine_valid = _zz_241;
  assign MmuPlugin_ports_1_cacheLine_exception = _zz_242;
  assign MmuPlugin_ports_1_cacheLine_superPage = _zz_243;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_0 = _zz_244;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_1 = _zz_245;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_0 = _zz_246;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_1 = _zz_247;
  assign MmuPlugin_ports_1_cacheLine_allowRead = _zz_248;
  assign MmuPlugin_ports_1_cacheLine_allowWrite = _zz_249;
  assign MmuPlugin_ports_1_cacheLine_allowExecute = _zz_250;
  assign MmuPlugin_ports_1_cacheLine_allowUser = _zz_251;
  always @ (*) begin
    MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b0;
    if(_zz_272)begin
      if(_zz_274)begin
        MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_1_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_1_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_1_entryToReplace_value == 2'b11);
  assign MmuPlugin_ports_1_entryToReplace_willOverflow = (MmuPlugin_ports_1_entryToReplace_willOverflowIfInc && MmuPlugin_ports_1_entryToReplace_willIncrement);
  always @ (*) begin
    MmuPlugin_ports_1_entryToReplace_valueNext = (MmuPlugin_ports_1_entryToReplace_value + _zz_341);
    if(MmuPlugin_ports_1_entryToReplace_willClear)begin
      MmuPlugin_ports_1_entryToReplace_valueNext = 2'b00;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_1_cacheLine_physicalAddress_1,(MmuPlugin_ports_1_cacheLine_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cacheLine_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
    end else begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_1_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_1_cacheLine_allowExecute));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_1_cacheLine_allowWrite;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_1_cacheLine_allowExecute;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_1_dirty) && MmuPlugin_ports_1_cacheHit) && ((MmuPlugin_ports_1_cacheLine_exception || ((MmuPlugin_ports_1_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_1_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_1_dirty || (! MmuPlugin_ports_1_cacheHit));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (((DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1011) || (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1110)) || (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111));
  assign DBusCachedPlugin_mmuBus_rsp_bypassTranslation = (! MmuPlugin_ports_1_requireMmuLockupCalc);
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_sel = MmuPlugin_ports_1_cacheHitsCalc[0];
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_physical = {{MmuPlugin_ports_1_cache_0_physicalAddress_1,(MmuPlugin_ports_1_cache_0_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_0_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_sel = MmuPlugin_ports_1_cacheHitsCalc[1];
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_physical = {{MmuPlugin_ports_1_cache_1_physicalAddress_1,(MmuPlugin_ports_1_cache_1_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_1_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_sel = MmuPlugin_ports_1_cacheHitsCalc[2];
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_physical = {{MmuPlugin_ports_1_cache_2_physicalAddress_1,(MmuPlugin_ports_1_cache_2_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_2_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_sel = MmuPlugin_ports_1_cacheHitsCalc[3];
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_physical = {{MmuPlugin_ports_1_cache_3_physicalAddress_1,(MmuPlugin_ports_1_cache_3_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_3_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign MmuPlugin_shared_dBusRsp_pte_V = _zz_342[0];
  assign MmuPlugin_shared_dBusRsp_pte_R = _zz_343[0];
  assign MmuPlugin_shared_dBusRsp_pte_W = _zz_344[0];
  assign MmuPlugin_shared_dBusRsp_pte_X = _zz_345[0];
  assign MmuPlugin_shared_dBusRsp_pte_U = _zz_346[0];
  assign MmuPlugin_shared_dBusRsp_pte_G = _zz_347[0];
  assign MmuPlugin_shared_dBusRsp_pte_A = _zz_348[0];
  assign MmuPlugin_shared_dBusRsp_pte_D = _zz_349[0];
  assign MmuPlugin_shared_dBusRsp_pte_RSW = MmuPlugin_shared_dBusRspStaged_payload_data[9 : 8];
  assign MmuPlugin_shared_dBusRsp_pte_PPN0 = MmuPlugin_shared_dBusRspStaged_payload_data[19 : 10];
  assign MmuPlugin_shared_dBusRsp_pte_PPN1 = MmuPlugin_shared_dBusRspStaged_payload_data[31 : 20];
  assign MmuPlugin_shared_dBusRsp_exception = (((! MmuPlugin_shared_dBusRsp_pte_V) || ((! MmuPlugin_shared_dBusRsp_pte_R) && MmuPlugin_shared_dBusRsp_pte_W)) || MmuPlugin_shared_dBusRspStaged_payload_error);
  assign MmuPlugin_shared_dBusRsp_leaf = (MmuPlugin_shared_dBusRsp_pte_R || MmuPlugin_shared_dBusRsp_pte_X);
  always @ (*) begin
    MmuPlugin_dBusAccess_cmd_valid = 1'b0;
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign MmuPlugin_dBusAccess_cmd_payload_write = 1'b0;
  assign MmuPlugin_dBusAccess_cmd_payload_size = 2'b10;
  always @ (*) begin
    MmuPlugin_dBusAccess_cmd_payload_address = 32'h0;
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
        MmuPlugin_dBusAccess_cmd_payload_address = {{MmuPlugin_satp_ppn,MmuPlugin_shared_vpn_1},2'b00};
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
        MmuPlugin_dBusAccess_cmd_payload_address = {{{MmuPlugin_shared_pteBuffer_PPN1[9 : 0],MmuPlugin_shared_pteBuffer_PPN0},MmuPlugin_shared_vpn_0},2'b00};
      end
      default : begin
      end
    endcase
  end

  assign MmuPlugin_dBusAccess_cmd_payload_data = 32'h0;
  assign MmuPlugin_dBusAccess_cmd_payload_writeMask = 4'bxxxx;
  always @ (*) begin
    _zz_88[0] = (((IBusCachedPlugin_mmuBus_cmd_0_isValid && MmuPlugin_ports_0_requireMmuLockupCalc) && (! MmuPlugin_ports_0_dirty)) && (! MmuPlugin_ports_0_cacheHit));
    _zz_88[1] = (((DBusCachedPlugin_mmuBus_cmd_0_isValid && MmuPlugin_ports_1_requireMmuLockupCalc) && (! MmuPlugin_ports_1_dirty)) && (! MmuPlugin_ports_1_cacheHit));
  end

  assign _zz_89 = _zz_88;
  always @ (*) begin
    _zz_90[0] = _zz_89[1];
    _zz_90[1] = _zz_89[0];
  end

  assign _zz_91 = (_zz_90 & (~ _zz_350));
  always @ (*) begin
    _zz_92[0] = _zz_91[1];
    _zz_92[1] = _zz_91[0];
  end

  assign MmuPlugin_shared_refills = _zz_92;
  assign _zz_93 = (MmuPlugin_shared_refills[0] ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress : DBusCachedPlugin_mmuBus_cmd_0_virtualAddress);
  assign IBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != `MmuPlugin_shared_State_defaultEncoding_IDLE) && MmuPlugin_shared_portSortedOh[0]);
  assign DBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != `MmuPlugin_shared_State_defaultEncoding_IDLE) && MmuPlugin_shared_portSortedOh[1]);
  assign _zz_95 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_96 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_97 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002000);
  assign _zz_98 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_99 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_100 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_101 = ((decode_INSTRUCTION & 32'h00007000) == 32'h00001000);
  assign _zz_102 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00004000);
  assign _zz_94 = {(((decode_INSTRUCTION & _zz_463) == 32'h02004020) != 1'b0),{({_zz_102,_zz_101} != 2'b00),{({_zz_464,_zz_465} != 3'b000),{(_zz_466 != _zz_467),{_zz_468,{_zz_469,_zz_470}}}}}};
  assign _zz_103 = _zz_94[2 : 1];
  assign _zz_50 = _zz_103;
  assign _zz_104 = _zz_94[7 : 6];
  assign _zz_49 = _zz_104;
  assign _zz_105 = _zz_94[9 : 8];
  assign _zz_48 = _zz_105;
  assign _zz_106 = _zz_94[23 : 22];
  assign _zz_47 = _zz_106;
  assign _zz_107 = _zz_94[25 : 24];
  assign _zz_46 = _zz_107;
  assign _zz_108 = _zz_94[27 : 26];
  assign _zz_45 = _zz_108;
  assign _zz_109 = _zz_94[30 : 29];
  assign _zz_44 = _zz_109;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_227;
  assign decode_RegFilePlugin_rs2Data = _zz_228;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_42 && writeBack_arbitration_isFiring);
    if(_zz_110)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_41[11 : 7];
    if(_zz_110)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_51;
    if(_zz_110)begin
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
        _zz_111 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_111 = {31'd0, _zz_351};
      end
      default : begin
        _zz_111 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_112 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_112 = {29'd0, _zz_352};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_112 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_112 = {27'd0, _zz_353};
      end
    endcase
  end

  assign _zz_113 = _zz_354[11];
  always @ (*) begin
    _zz_114[19] = _zz_113;
    _zz_114[18] = _zz_113;
    _zz_114[17] = _zz_113;
    _zz_114[16] = _zz_113;
    _zz_114[15] = _zz_113;
    _zz_114[14] = _zz_113;
    _zz_114[13] = _zz_113;
    _zz_114[12] = _zz_113;
    _zz_114[11] = _zz_113;
    _zz_114[10] = _zz_113;
    _zz_114[9] = _zz_113;
    _zz_114[8] = _zz_113;
    _zz_114[7] = _zz_113;
    _zz_114[6] = _zz_113;
    _zz_114[5] = _zz_113;
    _zz_114[4] = _zz_113;
    _zz_114[3] = _zz_113;
    _zz_114[2] = _zz_113;
    _zz_114[1] = _zz_113;
    _zz_114[0] = _zz_113;
  end

  assign _zz_115 = _zz_355[11];
  always @ (*) begin
    _zz_116[19] = _zz_115;
    _zz_116[18] = _zz_115;
    _zz_116[17] = _zz_115;
    _zz_116[16] = _zz_115;
    _zz_116[15] = _zz_115;
    _zz_116[14] = _zz_115;
    _zz_116[13] = _zz_115;
    _zz_116[12] = _zz_115;
    _zz_116[11] = _zz_115;
    _zz_116[10] = _zz_115;
    _zz_116[9] = _zz_115;
    _zz_116[8] = _zz_115;
    _zz_116[7] = _zz_115;
    _zz_116[6] = _zz_115;
    _zz_116[5] = _zz_115;
    _zz_116[4] = _zz_115;
    _zz_116[3] = _zz_115;
    _zz_116[2] = _zz_115;
    _zz_116[1] = _zz_115;
    _zz_116[0] = _zz_115;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_117 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_117 = {_zz_114,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_117 = {_zz_116,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_117 = _zz_36;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_356;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_118[0] = execute_SRC1[31];
    _zz_118[1] = execute_SRC1[30];
    _zz_118[2] = execute_SRC1[29];
    _zz_118[3] = execute_SRC1[28];
    _zz_118[4] = execute_SRC1[27];
    _zz_118[5] = execute_SRC1[26];
    _zz_118[6] = execute_SRC1[25];
    _zz_118[7] = execute_SRC1[24];
    _zz_118[8] = execute_SRC1[23];
    _zz_118[9] = execute_SRC1[22];
    _zz_118[10] = execute_SRC1[21];
    _zz_118[11] = execute_SRC1[20];
    _zz_118[12] = execute_SRC1[19];
    _zz_118[13] = execute_SRC1[18];
    _zz_118[14] = execute_SRC1[17];
    _zz_118[15] = execute_SRC1[16];
    _zz_118[16] = execute_SRC1[15];
    _zz_118[17] = execute_SRC1[14];
    _zz_118[18] = execute_SRC1[13];
    _zz_118[19] = execute_SRC1[12];
    _zz_118[20] = execute_SRC1[11];
    _zz_118[21] = execute_SRC1[10];
    _zz_118[22] = execute_SRC1[9];
    _zz_118[23] = execute_SRC1[8];
    _zz_118[24] = execute_SRC1[7];
    _zz_118[25] = execute_SRC1[6];
    _zz_118[26] = execute_SRC1[5];
    _zz_118[27] = execute_SRC1[4];
    _zz_118[28] = execute_SRC1[3];
    _zz_118[29] = execute_SRC1[2];
    _zz_118[30] = execute_SRC1[1];
    _zz_118[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_118 : execute_SRC1);
  always @ (*) begin
    _zz_119[0] = memory_SHIFT_RIGHT[31];
    _zz_119[1] = memory_SHIFT_RIGHT[30];
    _zz_119[2] = memory_SHIFT_RIGHT[29];
    _zz_119[3] = memory_SHIFT_RIGHT[28];
    _zz_119[4] = memory_SHIFT_RIGHT[27];
    _zz_119[5] = memory_SHIFT_RIGHT[26];
    _zz_119[6] = memory_SHIFT_RIGHT[25];
    _zz_119[7] = memory_SHIFT_RIGHT[24];
    _zz_119[8] = memory_SHIFT_RIGHT[23];
    _zz_119[9] = memory_SHIFT_RIGHT[22];
    _zz_119[10] = memory_SHIFT_RIGHT[21];
    _zz_119[11] = memory_SHIFT_RIGHT[20];
    _zz_119[12] = memory_SHIFT_RIGHT[19];
    _zz_119[13] = memory_SHIFT_RIGHT[18];
    _zz_119[14] = memory_SHIFT_RIGHT[17];
    _zz_119[15] = memory_SHIFT_RIGHT[16];
    _zz_119[16] = memory_SHIFT_RIGHT[15];
    _zz_119[17] = memory_SHIFT_RIGHT[14];
    _zz_119[18] = memory_SHIFT_RIGHT[13];
    _zz_119[19] = memory_SHIFT_RIGHT[12];
    _zz_119[20] = memory_SHIFT_RIGHT[11];
    _zz_119[21] = memory_SHIFT_RIGHT[10];
    _zz_119[22] = memory_SHIFT_RIGHT[9];
    _zz_119[23] = memory_SHIFT_RIGHT[8];
    _zz_119[24] = memory_SHIFT_RIGHT[7];
    _zz_119[25] = memory_SHIFT_RIGHT[6];
    _zz_119[26] = memory_SHIFT_RIGHT[5];
    _zz_119[27] = memory_SHIFT_RIGHT[4];
    _zz_119[28] = memory_SHIFT_RIGHT[3];
    _zz_119[29] = memory_SHIFT_RIGHT[2];
    _zz_119[30] = memory_SHIFT_RIGHT[1];
    _zz_119[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_120 = 1'b0;
    if(_zz_275)begin
      if(_zz_276)begin
        if(_zz_125)begin
          _zz_120 = 1'b1;
        end
      end
    end
    if(_zz_277)begin
      if(_zz_278)begin
        if(_zz_127)begin
          _zz_120 = 1'b1;
        end
      end
    end
    if(_zz_279)begin
      if(_zz_280)begin
        if(_zz_129)begin
          _zz_120 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_120 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_121 = 1'b0;
    if(_zz_275)begin
      if(_zz_276)begin
        if(_zz_126)begin
          _zz_121 = 1'b1;
        end
      end
    end
    if(_zz_277)begin
      if(_zz_278)begin
        if(_zz_128)begin
          _zz_121 = 1'b1;
        end
      end
    end
    if(_zz_279)begin
      if(_zz_280)begin
        if(_zz_130)begin
          _zz_121 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_121 = 1'b0;
    end
  end

  assign _zz_125 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_126 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_127 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_128 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_129 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_130 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_131 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_131 == 3'b000)) begin
        _zz_132 = execute_BranchPlugin_eq;
    end else if((_zz_131 == 3'b001)) begin
        _zz_132 = (! execute_BranchPlugin_eq);
    end else if((((_zz_131 & 3'b101) == 3'b101))) begin
        _zz_132 = (! execute_SRC_LESS);
    end else begin
        _zz_132 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_133 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_133 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_133 = 1'b1;
      end
      default : begin
        _zz_133 = _zz_132;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_134 = _zz_363[19];
  always @ (*) begin
    _zz_135[10] = _zz_134;
    _zz_135[9] = _zz_134;
    _zz_135[8] = _zz_134;
    _zz_135[7] = _zz_134;
    _zz_135[6] = _zz_134;
    _zz_135[5] = _zz_134;
    _zz_135[4] = _zz_134;
    _zz_135[3] = _zz_134;
    _zz_135[2] = _zz_134;
    _zz_135[1] = _zz_134;
    _zz_135[0] = _zz_134;
  end

  assign _zz_136 = _zz_364[11];
  always @ (*) begin
    _zz_137[19] = _zz_136;
    _zz_137[18] = _zz_136;
    _zz_137[17] = _zz_136;
    _zz_137[16] = _zz_136;
    _zz_137[15] = _zz_136;
    _zz_137[14] = _zz_136;
    _zz_137[13] = _zz_136;
    _zz_137[12] = _zz_136;
    _zz_137[11] = _zz_136;
    _zz_137[10] = _zz_136;
    _zz_137[9] = _zz_136;
    _zz_137[8] = _zz_136;
    _zz_137[7] = _zz_136;
    _zz_137[6] = _zz_136;
    _zz_137[5] = _zz_136;
    _zz_137[4] = _zz_136;
    _zz_137[3] = _zz_136;
    _zz_137[2] = _zz_136;
    _zz_137[1] = _zz_136;
    _zz_137[0] = _zz_136;
  end

  assign _zz_138 = _zz_365[11];
  always @ (*) begin
    _zz_139[18] = _zz_138;
    _zz_139[17] = _zz_138;
    _zz_139[16] = _zz_138;
    _zz_139[15] = _zz_138;
    _zz_139[14] = _zz_138;
    _zz_139[13] = _zz_138;
    _zz_139[12] = _zz_138;
    _zz_139[11] = _zz_138;
    _zz_139[10] = _zz_138;
    _zz_139[9] = _zz_138;
    _zz_139[8] = _zz_138;
    _zz_139[7] = _zz_138;
    _zz_139[6] = _zz_138;
    _zz_139[5] = _zz_138;
    _zz_139[4] = _zz_138;
    _zz_139[3] = _zz_138;
    _zz_139[2] = _zz_138;
    _zz_139[1] = _zz_138;
    _zz_139[0] = _zz_138;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_140 = {{_zz_135,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_140 = {_zz_137,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_140 = {{_zz_139,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_140;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && BranchPlugin_jumpInterface_payload[1]);
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = BranchPlugin_jumpInterface_payload;
  always @ (*) begin
    CsrPlugin_privilege = _zz_141;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0;
  assign CsrPlugin_sip_SEIP_OR = (CsrPlugin_sip_SEIP_SOFT || CsrPlugin_sip_SEIP_INPUT);
  always @ (*) begin
    CsrPlugin_redoInterface_valid = 1'b0;
    if(execute_CsrPlugin_csr_384)begin
      if(execute_CsrPlugin_writeInstruction)begin
        CsrPlugin_redoInterface_valid = 1'b1;
      end
    end
  end

  assign CsrPlugin_redoInterface_payload = decode_PC;
  assign _zz_142 = (CsrPlugin_sip_STIP && CsrPlugin_sie_STIE);
  assign _zz_143 = (CsrPlugin_sip_SSIP && CsrPlugin_sie_SSIE);
  assign _zz_144 = (CsrPlugin_sip_SEIP_OR && CsrPlugin_sie_SEIE);
  assign _zz_145 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_146 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_147 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
    case(CsrPlugin_exceptionPortCtrl_exceptionContext_code)
      4'b0000 : begin
        if(((1'b1 && CsrPlugin_medeleg_IAM) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0001 : begin
        if(((1'b1 && CsrPlugin_medeleg_IAF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0010 : begin
        if(((1'b1 && CsrPlugin_medeleg_II) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0100 : begin
        if(((1'b1 && CsrPlugin_medeleg_LAM) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0101 : begin
        if(((1'b1 && CsrPlugin_medeleg_LAF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0110 : begin
        if(((1'b1 && CsrPlugin_medeleg_SAM) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0111 : begin
        if(((1'b1 && CsrPlugin_medeleg_SAF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1000 : begin
        if(((1'b1 && CsrPlugin_medeleg_EU) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1001 : begin
        if(((1'b1 && CsrPlugin_medeleg_ES) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1100 : begin
        if(((1'b1 && CsrPlugin_medeleg_IPF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1101 : begin
        if(((1'b1 && CsrPlugin_medeleg_LPF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1111 : begin
        if(((1'b1 && CsrPlugin_medeleg_SPF) && (! 1'b0)))begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      default : begin
      end
    endcase
  end

  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_148 = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_149 = _zz_366[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_263)begin
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
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
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
      2'b01 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_stvec_mode;
      end
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
      2'b01 : begin
        CsrPlugin_xtvec_base = CsrPlugin_stvec_base;
      end
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
    if(execute_CsrPlugin_csr_3264)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_256)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_384)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3857)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3858)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3859)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3860)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
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
    if(execute_CsrPlugin_csr_832)begin
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
    if(execute_CsrPlugin_csr_770)begin
      if(execute_CSR_WRITE_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_771)begin
      if(execute_CSR_WRITE_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_324)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_260)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_261)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_321)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_320)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_322)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_323)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3008)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_4032)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2496)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3520)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_281)begin
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
    if(_zz_282)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_283)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(_zz_282)begin
      CsrPlugin_selfException_payload_code = 4'b0010;
    end
    if(_zz_283)begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        2'b01 : begin
          CsrPlugin_selfException_payload_code = 4'b1001;
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
    if(_zz_281)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_281)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  always @ (*) begin
    execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
    if(execute_CsrPlugin_csr_324)begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
  end

  always @ (*) begin
    case(_zz_309)
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
    if(_zz_257)begin
      if(_zz_265)begin
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
      memory_MulDivIterativePlugin_mul_counter_valueNext = (memory_MulDivIterativePlugin_mul_counter_value + _zz_369);
    end
    if(memory_MulDivIterativePlugin_mul_counter_willClear)begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = 6'h0;
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_258)begin
      if(_zz_284)begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_285)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_377);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_150 = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_150[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_378);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_379 : _zz_380);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_381[31:0];
  assign _zz_151 = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_152 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_153 = ((execute_IS_MUL && _zz_152) || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_154[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_154[31 : 0] = execute_RS1;
  end

  assign _zz_156 = (_zz_155 & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_156 != 32'h0);
  assign _zz_158 = (_zz_157 & externalInterruptArray_regNext);
  assign externalInterruptS = (_zz_158 != 32'h0);
  assign _zz_27 = decode_SRC1_CTRL;
  assign _zz_25 = _zz_50;
  assign _zz_38 = decode_to_execute_SRC1_CTRL;
  assign _zz_24 = decode_ALU_CTRL;
  assign _zz_22 = _zz_49;
  assign _zz_39 = decode_to_execute_ALU_CTRL;
  assign _zz_21 = decode_SRC2_CTRL;
  assign _zz_19 = _zz_48;
  assign _zz_37 = decode_to_execute_SRC2_CTRL;
  assign _zz_18 = decode_ALU_BITWISE_CTRL;
  assign _zz_16 = _zz_47;
  assign _zz_40 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_15 = decode_SHIFT_CTRL;
  assign _zz_12 = execute_SHIFT_CTRL;
  assign _zz_13 = _zz_46;
  assign _zz_35 = decode_to_execute_SHIFT_CTRL;
  assign _zz_34 = execute_to_memory_SHIFT_CTRL;
  assign _zz_10 = decode_BRANCH_CTRL;
  assign _zz_8 = _zz_45;
  assign _zz_31 = decode_to_execute_BRANCH_CTRL;
  assign _zz_7 = decode_ENV_CTRL;
  assign _zz_4 = execute_ENV_CTRL;
  assign _zz_2 = memory_ENV_CTRL;
  assign _zz_5 = _zz_44;
  assign _zz_29 = decode_to_execute_ENV_CTRL;
  assign _zz_28 = execute_to_memory_ENV_CTRL;
  assign _zz_30 = memory_to_writeBack_ENV_CTRL;
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
    _zz_159 = 32'h0;
    if(execute_CsrPlugin_csr_3264)begin
      _zz_159[12 : 0] = 13'h1000;
      _zz_159[25 : 20] = 6'h20;
    end
  end

  always @ (*) begin
    _zz_160 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_160[19 : 19] = MmuPlugin_status_mxr;
      _zz_160[18 : 18] = MmuPlugin_status_sum;
      _zz_160[17 : 17] = MmuPlugin_status_mprv;
      _zz_160[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_160[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_160[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_160[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_160[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_160[1 : 1] = CsrPlugin_sstatus_SIE;
    end
  end

  always @ (*) begin
    _zz_161 = 32'h0;
    if(execute_CsrPlugin_csr_256)begin
      _zz_161[19 : 19] = MmuPlugin_status_mxr;
      _zz_161[18 : 18] = MmuPlugin_status_sum;
      _zz_161[17 : 17] = MmuPlugin_status_mprv;
      _zz_161[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_161[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_161[1 : 1] = CsrPlugin_sstatus_SIE;
    end
  end

  always @ (*) begin
    _zz_162 = 32'h0;
    if(execute_CsrPlugin_csr_384)begin
      _zz_162[31 : 31] = MmuPlugin_satp_mode;
      _zz_162[30 : 22] = MmuPlugin_satp_asid;
      _zz_162[19 : 0] = MmuPlugin_satp_ppn;
    end
  end

  always @ (*) begin
    _zz_163 = 32'h0;
    if(execute_CsrPlugin_csr_3857)begin
      _zz_163[0 : 0] = 1'b1;
    end
  end

  always @ (*) begin
    _zz_164 = 32'h0;
    if(execute_CsrPlugin_csr_3858)begin
      _zz_164[1 : 0] = 2'b10;
    end
  end

  always @ (*) begin
    _zz_165 = 32'h0;
    if(execute_CsrPlugin_csr_3859)begin
      _zz_165[1 : 0] = 2'b11;
    end
  end

  always @ (*) begin
    _zz_166 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_166[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_166[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_166[3 : 3] = CsrPlugin_mip_MSIP;
      _zz_166[5 : 5] = CsrPlugin_sip_STIP;
      _zz_166[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_166[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @ (*) begin
    _zz_167 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_167[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_167[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_167[3 : 3] = CsrPlugin_mie_MSIE;
      _zz_167[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_167[5 : 5] = CsrPlugin_sie_STIE;
      _zz_167[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  always @ (*) begin
    _zz_168 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_168[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_169 = 32'h0;
    if(execute_CsrPlugin_csr_832)begin
      _zz_169[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @ (*) begin
    _zz_170 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_170[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_170[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_171 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_171[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @ (*) begin
    _zz_172 = 32'h0;
    if(execute_CsrPlugin_csr_324)begin
      _zz_172[5 : 5] = CsrPlugin_sip_STIP;
      _zz_172[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_172[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @ (*) begin
    _zz_173 = 32'h0;
    if(execute_CsrPlugin_csr_260)begin
      _zz_173[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_173[5 : 5] = CsrPlugin_sie_STIE;
      _zz_173[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  always @ (*) begin
    _zz_174 = 32'h0;
    if(execute_CsrPlugin_csr_261)begin
      _zz_174[31 : 2] = CsrPlugin_stvec_base;
      _zz_174[1 : 0] = CsrPlugin_stvec_mode;
    end
  end

  always @ (*) begin
    _zz_175 = 32'h0;
    if(execute_CsrPlugin_csr_321)begin
      _zz_175[31 : 0] = CsrPlugin_sepc;
    end
  end

  always @ (*) begin
    _zz_176 = 32'h0;
    if(execute_CsrPlugin_csr_320)begin
      _zz_176[31 : 0] = CsrPlugin_sscratch;
    end
  end

  always @ (*) begin
    _zz_177 = 32'h0;
    if(execute_CsrPlugin_csr_322)begin
      _zz_177[31 : 31] = CsrPlugin_scause_interrupt;
      _zz_177[3 : 0] = CsrPlugin_scause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_178 = 32'h0;
    if(execute_CsrPlugin_csr_323)begin
      _zz_178[31 : 0] = CsrPlugin_stval;
    end
  end

  always @ (*) begin
    _zz_179 = 32'h0;
    if(execute_CsrPlugin_csr_3008)begin
      _zz_179[31 : 0] = _zz_155;
    end
  end

  always @ (*) begin
    _zz_180 = 32'h0;
    if(execute_CsrPlugin_csr_4032)begin
      _zz_180[31 : 0] = _zz_156;
    end
  end

  always @ (*) begin
    _zz_181 = 32'h0;
    if(execute_CsrPlugin_csr_2496)begin
      _zz_181[31 : 0] = _zz_157;
    end
  end

  always @ (*) begin
    _zz_182 = 32'h0;
    if(execute_CsrPlugin_csr_3520)begin
      _zz_182[31 : 0] = _zz_158;
    end
  end

  assign execute_CsrPlugin_readData = (((((_zz_159 | _zz_160) | (_zz_161 | _zz_162)) | ((_zz_163 | _zz_164) | (_zz_165 | _zz_653))) | (((_zz_166 | _zz_167) | (_zz_168 | _zz_169)) | ((_zz_170 | _zz_171) | (_zz_172 | _zz_173)))) | ((((_zz_174 | _zz_175) | (_zz_176 | _zz_177)) | ((_zz_178 | _zz_179) | (_zz_180 | _zz_181))) | _zz_182));
  assign iBusWishbone_ADR = {_zz_436,_zz_183};
  assign iBusWishbone_CTI = ((_zz_183 == 3'b111) ? 3'b111 : 3'b010);
  assign iBusWishbone_BTE = 2'b00;
  assign iBusWishbone_SEL = 4'b1111;
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = 32'h0;
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    if(_zz_286)begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWishbone_STB = 1'b0;
    if(_zz_286)begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_184;
  assign iBus_rsp_payload_data = iBusWishbone_DAT_MISO_regNext;
  assign iBus_rsp_payload_error = 1'b0;
  assign _zz_190 = (dBus_cmd_payload_length != 3'b000);
  assign _zz_186 = dBus_cmd_valid;
  assign _zz_188 = dBus_cmd_payload_wr;
  assign _zz_189 = (_zz_185 == dBus_cmd_payload_length);
  assign dBus_cmd_ready = (_zz_187 && (_zz_188 || _zz_189));
  assign dBusWishbone_ADR = ((_zz_190 ? {{dBus_cmd_payload_address[31 : 5],_zz_185},2'b00} : {dBus_cmd_payload_address[31 : 2],2'b00}) >>> 2);
  assign dBusWishbone_CTI = (_zz_190 ? (_zz_189 ? 3'b111 : 3'b010) : 3'b000);
  assign dBusWishbone_BTE = 2'b00;
  assign dBusWishbone_SEL = (_zz_188 ? dBus_cmd_payload_mask : 4'b1111);
  assign dBusWishbone_WE = _zz_188;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_payload_data;
  assign _zz_187 = (_zz_186 && dBusWishbone_ACK);
  assign dBusWishbone_CYC = _zz_186;
  assign dBusWishbone_STB = _zz_186;
  assign dBus_rsp_valid = _zz_191;
  assign dBus_rsp_payload_data = dBusWishbone_DAT_MISO_regNext;
  assign dBus_rsp_payload_error = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_66 <= 1'b0;
      _zz_68 <= 1'b0;
      _zz_71 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_73;
      IBusCachedPlugin_rspCounter <= 32'h0;
      dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid <= 1'b0;
      DBusCachedPlugin_rspCounter <= _zz_74;
      DBusCachedPlugin_rspCounter <= 32'h0;
      MmuPlugin_status_sum <= 1'b0;
      MmuPlugin_status_mxr <= 1'b0;
      MmuPlugin_status_mprv <= 1'b0;
      MmuPlugin_satp_mode <= 1'b0;
      MmuPlugin_ports_0_cache_0_valid <= 1'b0;
      MmuPlugin_ports_0_cache_1_valid <= 1'b0;
      MmuPlugin_ports_0_cache_2_valid <= 1'b0;
      MmuPlugin_ports_0_cache_3_valid <= 1'b0;
      MmuPlugin_ports_0_entryToReplace_value <= 2'b00;
      MmuPlugin_ports_1_cache_0_valid <= 1'b0;
      MmuPlugin_ports_1_cache_1_valid <= 1'b0;
      MmuPlugin_ports_1_cache_2_valid <= 1'b0;
      MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      MmuPlugin_ports_1_entryToReplace_value <= 2'b00;
      MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
      MmuPlugin_shared_dBusRspStaged_valid <= 1'b0;
      _zz_110 <= 1'b1;
      _zz_122 <= 1'b0;
      _zz_141 <= 2'b11;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_medeleg_IAM <= 1'b0;
      CsrPlugin_medeleg_IAF <= 1'b0;
      CsrPlugin_medeleg_II <= 1'b0;
      CsrPlugin_medeleg_LAM <= 1'b0;
      CsrPlugin_medeleg_LAF <= 1'b0;
      CsrPlugin_medeleg_SAM <= 1'b0;
      CsrPlugin_medeleg_SAF <= 1'b0;
      CsrPlugin_medeleg_EU <= 1'b0;
      CsrPlugin_medeleg_ES <= 1'b0;
      CsrPlugin_medeleg_IPF <= 1'b0;
      CsrPlugin_medeleg_LPF <= 1'b0;
      CsrPlugin_medeleg_SPF <= 1'b0;
      CsrPlugin_mideleg_ST <= 1'b0;
      CsrPlugin_mideleg_SE <= 1'b0;
      CsrPlugin_mideleg_SS <= 1'b0;
      CsrPlugin_sstatus_SIE <= 1'b0;
      CsrPlugin_sstatus_SPIE <= 1'b0;
      CsrPlugin_sstatus_SPP <= 1'b1;
      CsrPlugin_sip_SEIP_SOFT <= 1'b0;
      CsrPlugin_sip_STIP <= 1'b0;
      CsrPlugin_sip_SSIP <= 1'b0;
      CsrPlugin_sie_SEIE <= 1'b0;
      CsrPlugin_sie_STIE <= 1'b0;
      CsrPlugin_sie_SSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_lastStageWasWfi <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      memory_MulDivIterativePlugin_mul_counter_value <= 6'h0;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      _zz_155 <= 32'h0;
      _zz_157 <= 32'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      execute_to_memory_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      _zz_183 <= 3'b000;
      _zz_184 <= 1'b0;
      _zz_185 <= 3'b000;
      _zz_191 <= 1'b0;
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
        _zz_66 <= 1'b0;
      end
      if(_zz_64)begin
        _zz_66 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_68 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_68 <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_71 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_2_output_ready)begin
        _zz_71 <= (IBusCachedPlugin_iBusRsp_stages_2_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
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
      if((! (! IBusCachedPlugin_iBusRsp_stages_3_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= IBusCachedPlugin_injector_nextPcCalc_valids_4;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_287)begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= dataCache_1_io_mem_cmd_valid;
      end
      if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
        dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid <= dataCache_1_io_mem_cmd_s2mPipe_valid;
      end
      if(dBus_rsp_valid)begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      MmuPlugin_ports_0_entryToReplace_value <= MmuPlugin_ports_0_entryToReplace_valueNext;
      if(contextSwitching)begin
        if(MmuPlugin_ports_0_cache_0_exception)begin
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_1_exception)begin
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_2_exception)begin
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_3_exception)begin
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        end
      end
      MmuPlugin_ports_1_entryToReplace_value <= MmuPlugin_ports_1_entryToReplace_valueNext;
      if(contextSwitching)begin
        if(MmuPlugin_ports_1_cache_0_exception)begin
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_1_exception)begin
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_2_exception)begin
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_3_exception)begin
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
      end
      MmuPlugin_shared_dBusRspStaged_valid <= MmuPlugin_dBusAccess_rsp_valid;
      case(MmuPlugin_shared_state_1)
        `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
          if(_zz_288)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_RSP;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
          if(MmuPlugin_shared_dBusRspStaged_valid)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            if((MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception))begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            end
            if(MmuPlugin_shared_dBusRspStaged_payload_redo)begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
            end
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_RSP;
          end
        end
        default : begin
          if(MmuPlugin_shared_dBusRspStaged_valid)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            if(MmuPlugin_shared_dBusRspStaged_payload_redo)begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            end
          end
        end
      endcase
      if(_zz_272)begin
        if(_zz_273)begin
          if(_zz_289)begin
            MmuPlugin_ports_0_cache_0_valid <= 1'b1;
          end
          if(_zz_290)begin
            MmuPlugin_ports_0_cache_1_valid <= 1'b1;
          end
          if(_zz_291)begin
            MmuPlugin_ports_0_cache_2_valid <= 1'b1;
          end
          if(_zz_292)begin
            MmuPlugin_ports_0_cache_3_valid <= 1'b1;
          end
        end
        if(_zz_274)begin
          if(_zz_293)begin
            MmuPlugin_ports_1_cache_0_valid <= 1'b1;
          end
          if(_zz_294)begin
            MmuPlugin_ports_1_cache_1_valid <= 1'b1;
          end
          if(_zz_295)begin
            MmuPlugin_ports_1_cache_2_valid <= 1'b1;
          end
          if(_zz_296)begin
            MmuPlugin_ports_1_cache_3_valid <= 1'b1;
          end
        end
      end
      if((writeBack_arbitration_isValid && writeBack_IS_SFENCE_VMA))begin
        MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      end
      _zz_110 <= 1'b0;
      _zz_122 <= (_zz_42 && writeBack_arbitration_isFiring);
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
      if(_zz_297)begin
        if(_zz_298)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_299)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_300)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(_zz_301)begin
        if(_zz_302)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_303)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_304)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_305)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_306)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_307)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_lastStageWasWfi <= (writeBack_arbitration_isFiring && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
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
      if(_zz_266)begin
        _zz_141 <= CsrPlugin_targetPrivilege;
        case(CsrPlugin_targetPrivilege)
          2'b01 : begin
            CsrPlugin_sstatus_SIE <= 1'b0;
            CsrPlugin_sstatus_SPIE <= CsrPlugin_sstatus_SIE;
            CsrPlugin_sstatus_SPP <= CsrPlugin_privilege[0 : 0];
          end
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_267)begin
        case(_zz_268)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
            _zz_141 <= CsrPlugin_mstatus_MPP;
          end
          2'b01 : begin
            CsrPlugin_sstatus_SPP <= 1'b0;
            CsrPlugin_sstatus_SIE <= CsrPlugin_sstatus_SPIE;
            CsrPlugin_sstatus_SPIE <= 1'b1;
            _zz_141 <= {1'b0,CsrPlugin_sstatus_SPP};
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_147,{_zz_146,{_zz_145,{_zz_144,{_zz_143,_zz_142}}}}} != 6'h0) || CsrPlugin_thirdPartyWake);
      memory_MulDivIterativePlugin_mul_counter_value <= memory_MulDivIterativePlugin_mul_counter_valueNext;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      if((! memory_arbitration_isStuck))begin
        execute_to_memory_IS_DBUS_SHARING <= execute_IS_DBUS_SHARING;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_IS_DBUS_SHARING <= memory_IS_DBUS_SHARING;
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
      if(MmuPlugin_dBusAccess_rsp_valid)begin
        memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      end
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          MmuPlugin_status_mxr <= _zz_391[0];
          MmuPlugin_status_sum <= _zz_392[0];
          MmuPlugin_status_mprv <= _zz_393[0];
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_394[0];
          CsrPlugin_mstatus_MIE <= _zz_395[0];
          CsrPlugin_sstatus_SPP <= execute_CsrPlugin_writeData[8 : 8];
          CsrPlugin_sstatus_SPIE <= _zz_396[0];
          CsrPlugin_sstatus_SIE <= _zz_397[0];
        end
      end
      if(execute_CsrPlugin_csr_256)begin
        if(execute_CsrPlugin_writeEnable)begin
          MmuPlugin_status_mxr <= _zz_398[0];
          MmuPlugin_status_sum <= _zz_399[0];
          MmuPlugin_status_mprv <= _zz_400[0];
          CsrPlugin_sstatus_SPP <= execute_CsrPlugin_writeData[8 : 8];
          CsrPlugin_sstatus_SPIE <= _zz_401[0];
          CsrPlugin_sstatus_SIE <= _zz_402[0];
        end
      end
      if(execute_CsrPlugin_csr_384)begin
        if(execute_CsrPlugin_writeInstruction)begin
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
        if(execute_CsrPlugin_writeEnable)begin
          MmuPlugin_satp_mode <= _zz_403[0];
        end
      end
      if(execute_CsrPlugin_csr_836)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_sip_STIP <= _zz_405[0];
          CsrPlugin_sip_SSIP <= _zz_406[0];
          CsrPlugin_sip_SEIP_SOFT <= _zz_407[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_408[0];
          CsrPlugin_mie_MTIE <= _zz_409[0];
          CsrPlugin_mie_MSIE <= _zz_410[0];
          CsrPlugin_sie_SEIE <= _zz_411[0];
          CsrPlugin_sie_STIE <= _zz_412[0];
          CsrPlugin_sie_SSIE <= _zz_413[0];
        end
      end
      if(execute_CsrPlugin_csr_770)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_medeleg_IAM <= _zz_414[0];
          CsrPlugin_medeleg_IAF <= _zz_415[0];
          CsrPlugin_medeleg_II <= _zz_416[0];
          CsrPlugin_medeleg_LAM <= _zz_417[0];
          CsrPlugin_medeleg_LAF <= _zz_418[0];
          CsrPlugin_medeleg_SAM <= _zz_419[0];
          CsrPlugin_medeleg_SAF <= _zz_420[0];
          CsrPlugin_medeleg_EU <= _zz_421[0];
          CsrPlugin_medeleg_ES <= _zz_422[0];
          CsrPlugin_medeleg_IPF <= _zz_423[0];
          CsrPlugin_medeleg_LPF <= _zz_424[0];
          CsrPlugin_medeleg_SPF <= _zz_425[0];
        end
      end
      if(execute_CsrPlugin_csr_771)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mideleg_SE <= _zz_426[0];
          CsrPlugin_mideleg_ST <= _zz_427[0];
          CsrPlugin_mideleg_SS <= _zz_428[0];
        end
      end
      if(execute_CsrPlugin_csr_324)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_sip_STIP <= _zz_429[0];
          CsrPlugin_sip_SSIP <= _zz_430[0];
          CsrPlugin_sip_SEIP_SOFT <= _zz_431[0];
        end
      end
      if(execute_CsrPlugin_csr_260)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_sie_SEIE <= _zz_432[0];
          CsrPlugin_sie_STIE <= _zz_433[0];
          CsrPlugin_sie_SSIE <= _zz_434[0];
        end
      end
      if(execute_CsrPlugin_csr_3008)begin
        if(execute_CsrPlugin_writeEnable)begin
          _zz_155 <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      if(execute_CsrPlugin_csr_2496)begin
        if(execute_CsrPlugin_writeEnable)begin
          _zz_157 <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      if(_zz_286)begin
        if(iBusWishbone_ACK)begin
          _zz_183 <= (_zz_183 + 3'b001);
        end
      end
      _zz_184 <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if((_zz_186 && _zz_187))begin
        _zz_185 <= (_zz_185 + 3'b001);
        if(_zz_189)begin
          _zz_185 <= 3'b000;
        end
      end
      _zz_191 <= ((_zz_186 && (! dBusWishbone_WE)) && dBusWishbone_ACK);
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_69 <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_output_ready)begin
      _zz_72 <= IBusCachedPlugin_iBusRsp_stages_2_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_3_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(_zz_287)begin
      dataCache_1_io_mem_cmd_s2mPipe_rData_wr <= dataCache_1_io_mem_cmd_payload_wr;
      dataCache_1_io_mem_cmd_s2mPipe_rData_uncached <= dataCache_1_io_mem_cmd_payload_uncached;
      dataCache_1_io_mem_cmd_s2mPipe_rData_address <= dataCache_1_io_mem_cmd_payload_address;
      dataCache_1_io_mem_cmd_s2mPipe_rData_data <= dataCache_1_io_mem_cmd_payload_data;
      dataCache_1_io_mem_cmd_s2mPipe_rData_mask <= dataCache_1_io_mem_cmd_payload_mask;
      dataCache_1_io_mem_cmd_s2mPipe_rData_length <= dataCache_1_io_mem_cmd_payload_length;
      dataCache_1_io_mem_cmd_s2mPipe_rData_last <= dataCache_1_io_mem_cmd_payload_last;
    end
    if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_wr <= dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_uncached <= dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_address <= dataCache_1_io_mem_cmd_s2mPipe_payload_address;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_data <= dataCache_1_io_mem_cmd_s2mPipe_payload_data;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_mask <= dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_length <= dataCache_1_io_mem_cmd_s2mPipe_payload_length;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rData_last <= dataCache_1_io_mem_cmd_s2mPipe_payload_last;
    end
    MmuPlugin_shared_dBusRspStaged_payload_data <= MmuPlugin_dBusAccess_rsp_payload_data;
    MmuPlugin_shared_dBusRspStaged_payload_error <= MmuPlugin_dBusAccess_rsp_payload_error;
    MmuPlugin_shared_dBusRspStaged_payload_redo <= MmuPlugin_dBusAccess_rsp_payload_redo;
    if((MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo)))begin
      MmuPlugin_shared_pteBuffer_V <= MmuPlugin_shared_dBusRsp_pte_V;
      MmuPlugin_shared_pteBuffer_R <= MmuPlugin_shared_dBusRsp_pte_R;
      MmuPlugin_shared_pteBuffer_W <= MmuPlugin_shared_dBusRsp_pte_W;
      MmuPlugin_shared_pteBuffer_X <= MmuPlugin_shared_dBusRsp_pte_X;
      MmuPlugin_shared_pteBuffer_U <= MmuPlugin_shared_dBusRsp_pte_U;
      MmuPlugin_shared_pteBuffer_G <= MmuPlugin_shared_dBusRsp_pte_G;
      MmuPlugin_shared_pteBuffer_A <= MmuPlugin_shared_dBusRsp_pte_A;
      MmuPlugin_shared_pteBuffer_D <= MmuPlugin_shared_dBusRsp_pte_D;
      MmuPlugin_shared_pteBuffer_RSW <= MmuPlugin_shared_dBusRsp_pte_RSW;
      MmuPlugin_shared_pteBuffer_PPN0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
      MmuPlugin_shared_pteBuffer_PPN1 <= MmuPlugin_shared_dBusRsp_pte_PPN1;
    end
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
        if(_zz_288)begin
          MmuPlugin_shared_portSortedOh <= MmuPlugin_shared_refills;
          MmuPlugin_shared_vpn_1 <= _zz_93[31 : 22];
          MmuPlugin_shared_vpn_0 <= _zz_93[21 : 12];
        end
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
      end
      default : begin
      end
    endcase
    if(_zz_272)begin
      if(_zz_273)begin
        if(_zz_289)begin
          MmuPlugin_ports_0_cache_0_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_0_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_0_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(_zz_290)begin
          MmuPlugin_ports_0_cache_1_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_1_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_1_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(_zz_291)begin
          MmuPlugin_ports_0_cache_2_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_2_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_2_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(_zz_292)begin
          MmuPlugin_ports_0_cache_3_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_3_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_3_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
      end
      if(_zz_274)begin
        if(_zz_293)begin
          MmuPlugin_ports_1_cache_0_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_0_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_0_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(_zz_294)begin
          MmuPlugin_ports_1_cache_1_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_1_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_1_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(_zz_295)begin
          MmuPlugin_ports_1_cache_2_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_2_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_2_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(_zz_296)begin
          MmuPlugin_ports_1_cache_3_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_3_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_3_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
      end
    end
    _zz_123 <= _zz_41[11 : 7];
    _zz_124 <= _zz_51;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_sip_SEIP_INPUT <= externalInterruptS;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_263)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_149 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_149 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(_zz_297)begin
      if(_zz_298)begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(_zz_299)begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(_zz_300)begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
    end
    if(_zz_301)begin
      if(_zz_302)begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_303)begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_304)begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_305)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_306)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_307)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_266)begin
      case(CsrPlugin_targetPrivilege)
        2'b01 : begin
          CsrPlugin_scause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_scause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_sepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_stval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
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
    if(_zz_257)begin
      if(_zz_265)begin
        memory_MulDivIterativePlugin_rs2 <= (memory_MulDivIterativePlugin_rs2 >>> 1);
        memory_MulDivIterativePlugin_accumulator <= ({_zz_370,memory_MulDivIterativePlugin_accumulator[31 : 0]} >>> 1);
      end
    end
    if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(_zz_258)begin
      if(_zz_284)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if((memory_MulDivIterativePlugin_div_counter_value == 6'h20))begin
          memory_MulDivIterativePlugin_div_result <= _zz_382[31:0];
        end
      end
    end
    if(_zz_285)begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_153 ? (~ _zz_154) : _zz_154) + _zz_388);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_152 ? (~ execute_RS2) : execute_RS2) + _zz_390);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_153 ^ (_zz_152 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_36;
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
      execute_to_memory_FORMAL_PC_NEXT <= _zz_53;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_54;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_26;
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
      decode_to_execute_ALU_CTRL <= _zz_23;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_20;
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
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_LRSC <= decode_MEMORY_LRSC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_AMO <= decode_MEMORY_AMO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_SFENCE_VMA <= decode_IS_SFENCE_VMA;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_SFENCE_VMA <= execute_IS_SFENCE_VMA;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_SFENCE_VMA <= memory_IS_SFENCE_VMA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_17;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_14;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_9;
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
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_32;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_33;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3264 <= (decode_INSTRUCTION[31 : 20] == 12'hcc0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_256 <= (decode_INSTRUCTION[31 : 20] == 12'h100);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_384 <= (decode_INSTRUCTION[31 : 20] == 12'h180);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3857 <= (decode_INSTRUCTION[31 : 20] == 12'hf11);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3858 <= (decode_INSTRUCTION[31 : 20] == 12'hf12);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3859 <= (decode_INSTRUCTION[31 : 20] == 12'hf13);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3860 <= (decode_INSTRUCTION[31 : 20] == 12'hf14);
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
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_770 <= (decode_INSTRUCTION[31 : 20] == 12'h302);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_771 <= (decode_INSTRUCTION[31 : 20] == 12'h303);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_324 <= (decode_INSTRUCTION[31 : 20] == 12'h144);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_260 <= (decode_INSTRUCTION[31 : 20] == 12'h104);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_261 <= (decode_INSTRUCTION[31 : 20] == 12'h105);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_321 <= (decode_INSTRUCTION[31 : 20] == 12'h141);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_320 <= (decode_INSTRUCTION[31 : 20] == 12'h140);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_322 <= (decode_INSTRUCTION[31 : 20] == 12'h142);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_323 <= (decode_INSTRUCTION[31 : 20] == 12'h143);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3008 <= (decode_INSTRUCTION[31 : 20] == 12'hbc0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_4032 <= (decode_INSTRUCTION[31 : 20] == 12'hfc0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2496 <= (decode_INSTRUCTION[31 : 20] == 12'h9c0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3520 <= (decode_INSTRUCTION[31 : 20] == 12'hdc0);
    end
    if(execute_CsrPlugin_csr_384)begin
      if(execute_CsrPlugin_writeEnable)begin
        MmuPlugin_satp_asid <= execute_CsrPlugin_writeData[30 : 22];
        MmuPlugin_satp_ppn <= execute_CsrPlugin_writeData[19 : 0];
      end
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_404[0];
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
    if(execute_CsrPlugin_csr_832)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_261)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_stvec_base <= execute_CsrPlugin_writeData[31 : 2];
        CsrPlugin_stvec_mode <= execute_CsrPlugin_writeData[1 : 0];
      end
    end
    if(execute_CsrPlugin_csr_321)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_sepc <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_320)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_sscratch <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_322)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_scause_interrupt <= _zz_435[0];
        CsrPlugin_scause_exceptionCode <= execute_CsrPlugin_writeData[3 : 0];
      end
    end
    if(execute_CsrPlugin_csr_323)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_stval <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    iBusWishbone_DAT_MISO_regNext <= iBusWishbone_DAT_MISO;
    dBusWishbone_DAT_MISO_regNext <= dBusWishbone_DAT_MISO;
  end


endmodule

module DataCache (
  input               io_cpu_execute_isValid,
  input      [31:0]   io_cpu_execute_address,
  output              io_cpu_execute_haltIt,
  input               io_cpu_execute_args_wr,
  input      [31:0]   io_cpu_execute_args_data,
  input      [1:0]    io_cpu_execute_args_size,
  input               io_cpu_execute_args_isLrsc,
  input               io_cpu_execute_args_isAmo,
  input               io_cpu_execute_args_amoCtrl_swap,
  input      [2:0]    io_cpu_execute_args_amoCtrl_alu,
  input               io_cpu_execute_args_totalyConsistent,
  output              io_cpu_execute_refilling,
  input               io_cpu_memory_isValid,
  input               io_cpu_memory_isStuck,
  output              io_cpu_memory_isWrite,
  input      [31:0]   io_cpu_memory_address,
  input      [31:0]   io_cpu_memory_mmuRsp_physicalAddress,
  input               io_cpu_memory_mmuRsp_isIoAccess,
  input               io_cpu_memory_mmuRsp_isPaging,
  input               io_cpu_memory_mmuRsp_allowRead,
  input               io_cpu_memory_mmuRsp_allowWrite,
  input               io_cpu_memory_mmuRsp_allowExecute,
  input               io_cpu_memory_mmuRsp_exception,
  input               io_cpu_memory_mmuRsp_refilling,
  input               io_cpu_memory_mmuRsp_bypassTranslation,
  input               io_cpu_memory_mmuRsp_ways_0_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_0_physical,
  input               io_cpu_memory_mmuRsp_ways_1_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_1_physical,
  input               io_cpu_memory_mmuRsp_ways_2_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_2_physical,
  input               io_cpu_memory_mmuRsp_ways_3_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_3_physical,
  input               io_cpu_writeBack_isValid,
  input               io_cpu_writeBack_isStuck,
  input               io_cpu_writeBack_isUser,
  output reg          io_cpu_writeBack_haltIt,
  output              io_cpu_writeBack_isWrite,
  output reg [31:0]   io_cpu_writeBack_data,
  input      [31:0]   io_cpu_writeBack_address,
  output              io_cpu_writeBack_mmuException,
  output              io_cpu_writeBack_unalignedAccess,
  output reg          io_cpu_writeBack_accessError,
  output              io_cpu_writeBack_keepMemRspData,
  input               io_cpu_writeBack_fence_SW,
  input               io_cpu_writeBack_fence_SR,
  input               io_cpu_writeBack_fence_SO,
  input               io_cpu_writeBack_fence_SI,
  input               io_cpu_writeBack_fence_PW,
  input               io_cpu_writeBack_fence_PR,
  input               io_cpu_writeBack_fence_PO,
  input               io_cpu_writeBack_fence_PI,
  input      [3:0]    io_cpu_writeBack_fence_FM,
  output reg          io_cpu_redo,
  input               io_cpu_flush_valid,
  output reg          io_cpu_flush_ready,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output reg          io_mem_cmd_payload_wr,
  output              io_mem_cmd_payload_uncached,
  output reg [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output     [3:0]    io_mem_cmd_payload_mask,
  output reg [2:0]    io_mem_cmd_payload_length,
  output              io_mem_cmd_payload_last,
  input               io_mem_rsp_valid,
  input               io_mem_rsp_payload_last,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset
);
  reg        [21:0]   _zz_10;
  reg        [31:0]   _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  wire                _zz_18;
  wire                _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire       [2:0]    _zz_23;
  wire       [0:0]    _zz_24;
  wire       [0:0]    _zz_25;
  wire       [9:0]    _zz_26;
  wire       [9:0]    _zz_27;
  wire       [31:0]   _zz_28;
  wire       [31:0]   _zz_29;
  wire       [31:0]   _zz_30;
  wire       [31:0]   _zz_31;
  wire       [1:0]    _zz_32;
  wire       [31:0]   _zz_33;
  wire       [1:0]    _zz_34;
  wire       [1:0]    _zz_35;
  wire       [0:0]    _zz_36;
  wire       [0:0]    _zz_37;
  wire       [0:0]    _zz_38;
  wire       [2:0]    _zz_39;
  wire       [1:0]    _zz_40;
  wire       [21:0]   _zz_41;
  reg                 _zz_1;
  reg                 _zz_2;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [6:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [0:0]    tagsWriteCmd_payload_way;
  reg        [6:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [19:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [0:0]    tagsWriteLastCmd_payload_way;
  reg        [6:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [19:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [9:0]    dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [0:0]    dataWriteCmd_payload_way;
  reg        [9:0]    dataWriteCmd_payload_address;
  reg        [31:0]   dataWriteCmd_payload_data;
  reg        [3:0]    dataWriteCmd_payload_mask;
  wire                _zz_3;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_4;
  wire                _zz_5;
  wire       [31:0]   ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  reg        [3:0]    _zz_6;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  reg                 stageA_request_wr;
  reg        [31:0]   stageA_request_data;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_isLrsc;
  reg                 stageA_request_isAmo;
  reg                 stageA_request_amoCtrl_swap;
  reg        [2:0]    stageA_request_amoCtrl_alu;
  reg                 stageA_request_totalyConsistent;
  reg        [3:0]    stageA_mask;
  wire       [0:0]    stageA_wayHits;
  wire       [0:0]    _zz_7;
  reg        [0:0]    stageA_wayInvalidate;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_8;
  wire       [0:0]    stageA_dataColisions;
  reg                 stageB_request_wr;
  reg        [31:0]   stageB_request_data;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_isLrsc;
  reg                 stageB_request_isAmo;
  reg                 stageB_request_amoCtrl_swap;
  reg        [2:0]    stageB_request_amoCtrl_alu;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_isPaging;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_mmuRsp_bypassTranslation;
  reg                 stageB_mmuRsp_ways_0_sel;
  reg        [31:0]   stageB_mmuRsp_ways_0_physical;
  reg                 stageB_mmuRsp_ways_1_sel;
  reg        [31:0]   stageB_mmuRsp_ways_1_physical;
  reg                 stageB_mmuRsp_ways_2_sel;
  reg        [31:0]   stageB_mmuRsp_ways_2_physical;
  reg                 stageB_mmuRsp_ways_3_sel;
  reg        [31:0]   stageB_mmuRsp_ways_3_physical;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  reg        [31:0]   stageB_dataReadRsp_0;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  reg        [0:0]    stageB_dataColisions;
  reg                 stageB_unaligned;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_valid;
  wire                stageB_flusher_hold;
  reg                 stageB_flusher_start;
  reg                 stageB_lrSc_reserved;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  reg        [31:0]   stageB_requestDataBypass;
  wire                stageB_amo_compare;
  wire                stageB_amo_unsigned;
  wire       [31:0]   stageB_amo_addSub;
  wire                stageB_amo_less;
  wire                stageB_amo_selectRf;
  reg        [31:0]   stageB_amo_result;
  reg        [31:0]   stageB_amo_resultReg;
  reg                 stageB_amo_internal_resultRegValid;
  reg                 stageB_cpuWriteToCache;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire       [0:0]    _zz_9;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [2:0]    loader_counter_valueNext;
  reg        [2:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  wire                loader_kill;
  reg                 loader_killReg;
  wire                loader_done;
  reg                 loader_valid_regNext;
  (* ram_style = "block" *) reg [21:0] ways_0_tags [0:127];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol0 [0:1023];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol1 [0:1023];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol2 [0:1023];
  (* ram_style = "block" *) reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_42;
  reg [7:0] _zz_43;
  reg [7:0] _zz_44;
  reg [7:0] _zz_45;

  assign _zz_12 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  assign _zz_13 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign _zz_14 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  assign _zz_15 = (stageB_waysHit || (stageB_request_wr && (! stageB_request_isAmo)));
  assign _zz_16 = (! stageB_amo_internal_resultRegValid);
  assign _zz_17 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign _zz_18 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign _zz_19 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign _zz_20 = (((! stageB_request_wr) || stageB_request_isAmo) && ((stageB_dataColisions & stageB_waysHits) != 1'b0));
  assign _zz_21 = (! stageB_flusher_hold);
  assign _zz_22 = (stageB_mmuRsp_physicalAddress[11 : 5] != 7'h7f);
  assign _zz_23 = (stageB_request_amoCtrl_alu | {stageB_request_amoCtrl_swap,2'b00});
  assign _zz_24 = _zz_4[0 : 0];
  assign _zz_25 = _zz_4[1 : 1];
  assign _zz_26 = (io_cpu_execute_address[11 : 2] >>> 0);
  assign _zz_27 = (io_cpu_memory_address[11 : 2] >>> 0);
  assign _zz_28 = ($signed(_zz_29) + $signed(_zz_33));
  assign _zz_29 = ($signed(_zz_30) + $signed(_zz_31));
  assign _zz_30 = stageB_request_data;
  assign _zz_31 = (stageB_amo_compare ? (~ stageB_dataMux) : stageB_dataMux);
  assign _zz_32 = (stageB_amo_compare ? _zz_34 : _zz_35);
  assign _zz_33 = {{30{_zz_32[1]}}, _zz_32};
  assign _zz_34 = 2'b01;
  assign _zz_35 = 2'b00;
  assign _zz_36 = 1'b1;
  assign _zz_37 = (! stageB_lrSc_reserved);
  assign _zz_38 = loader_counter_willIncrement;
  assign _zz_39 = {2'd0, _zz_38};
  assign _zz_40 = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_41 = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_3) begin
      _zz_10 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_41;
    end
  end

  always @ (*) begin
    _zz_11 = {_zz_45, _zz_44, _zz_43, _zz_42};
  end
  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_42 <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_43 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_44 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_45 <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      _zz_2 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_3 = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_4 = _zz_10;
  assign ways_0_tagsReadRsp_valid = _zz_24[0];
  assign ways_0_tagsReadRsp_error = _zz_25[0];
  assign ways_0_tagsReadRsp_address = _zz_4[21 : 2];
  assign _zz_5 = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRspMem = _zz_11;
  assign ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    if(_zz_12)begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsReadCmd_payload = 7'h0;
    if(_zz_12)begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @ (*) begin
    dataReadCmd_valid = 1'b0;
    if(_zz_12)begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataReadCmd_payload = 10'h0;
    if(_zz_12)begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @ (*) begin
    tagsWriteCmd_valid = 1'b0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
    end
    if(_zz_13)begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_done)begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done)begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_address = 7'h0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
    if(loader_done)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done)begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done)begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_address = 20'h0;
    if(loader_done)begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @ (*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache)begin
      if((stageB_request_wr && stageB_waysHit))begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            if(stageB_request_isAmo)begin
              if(_zz_16)begin
                dataWriteCmd_valid = 1'b0;
              end
            end
            if(_zz_17)begin
              dataWriteCmd_valid = 1'b0;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      dataWriteCmd_valid = 1'b0;
    end
    if(_zz_18)begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(_zz_18)begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_address = 10'h0;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
    end
    if(_zz_18)begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_data = 32'h0;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(_zz_18)begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_36[0])begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(_zz_18)begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  assign io_cpu_execute_haltIt = 1'b0;
  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_6 = 4'b0001;
      end
      2'b01 : begin
        _zz_6 = 4'b0011;
      end
      default : begin
        _zz_6 = 4'b1111;
      end
    endcase
  end

  assign stage0_mask = (_zz_6 <<< io_cpu_execute_address[1 : 0]);
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_26)) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign _zz_7[0] = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign stageA_wayHits = _zz_7;
  assign _zz_8[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_27)) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_8);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign stageB_consistancyHazard = 1'b0;
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (stageB_waysHits != 1'b0);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  always @ (*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(! _zz_15) begin
            if(io_mem_cmd_ready)begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      stageB_loaderValid = 1'b0;
    end
  end

  assign stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
  always @ (*) begin
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      io_cpu_writeBack_haltIt = 1'b1;
    end
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(_zz_14)begin
          if(((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
          if(_zz_19)begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(_zz_15)begin
            if(((! stageB_request_wr) || io_mem_cmd_ready))begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
            if(stageB_request_isAmo)begin
              if(_zz_16)begin
                io_cpu_writeBack_haltIt = 1'b1;
              end
            end
            if(_zz_17)begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  assign stageB_flusher_hold = 1'b0;
  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(stageB_flusher_start)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  always @ (*) begin
    stageB_requestDataBypass = stageB_request_data;
    if(stageB_request_isAmo)begin
      stageB_requestDataBypass = stageB_amo_resultReg;
    end
  end

  assign stageB_amo_compare = stageB_request_amoCtrl_alu[2];
  assign stageB_amo_unsigned = (stageB_request_amoCtrl_alu[2 : 1] == 2'b11);
  assign stageB_amo_addSub = _zz_28;
  assign stageB_amo_less = ((stageB_request_data[31] == stageB_dataMux[31]) ? stageB_amo_addSub[31] : (stageB_amo_unsigned ? stageB_dataMux[31] : stageB_request_data[31]));
  assign stageB_amo_selectRf = (stageB_request_amoCtrl_swap ? 1'b1 : (stageB_request_amoCtrl_alu[0] ^ stageB_amo_less));
  always @ (*) begin
    case(_zz_23)
      3'b000 : begin
        stageB_amo_result = stageB_amo_addSub;
      end
      3'b001 : begin
        stageB_amo_result = (stageB_request_data ^ stageB_dataMux);
      end
      3'b010 : begin
        stageB_amo_result = (stageB_request_data | stageB_dataMux);
      end
      3'b011 : begin
        stageB_amo_result = (stageB_request_data & stageB_dataMux);
      end
      default : begin
        stageB_amo_result = (stageB_amo_selectRf ? stageB_request_data : stageB_dataMux);
      end
    endcase
  end

  always @ (*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_request_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @ (*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            if(_zz_20)begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if((io_cpu_writeBack_isValid && (stageB_mmuRsp_refilling || stageB_consistancyHazard)))begin
      io_cpu_redo = 1'b1;
    end
    if((loader_valid && (! loader_valid_regNext)))begin
      io_cpu_redo = 1'b1;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache)begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & _zz_9) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @ (*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(_zz_14)begin
          io_mem_cmd_valid = (! memCmdSent);
          if(_zz_19)begin
            io_mem_cmd_valid = 1'b0;
          end
        end else begin
          if(_zz_15)begin
            if(stageB_request_wr)begin
              io_mem_cmd_valid = 1'b1;
            end
            if(stageB_request_isAmo)begin
              if(_zz_16)begin
                io_mem_cmd_valid = 1'b0;
              end
            end
            if(_zz_20)begin
              io_mem_cmd_valid = 1'b0;
            end
            if(_zz_17)begin
              io_mem_cmd_valid = 1'b0;
            end
          end else begin
            if((! memCmdSent))begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
          end else begin
            io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],5'h0};
          end
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_length = 3'b000;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(_zz_15)begin
            io_mem_cmd_payload_length = 3'b000;
          end else begin
            io_mem_cmd_payload_length = 3'b111;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @ (*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_14) begin
          if(! _zz_15) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  always @ (*) begin
    if(stageB_bypassCache)begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
    if((stageB_request_isLrsc && stageB_request_wr))begin
      io_cpu_writeBack_data = {31'd0, _zz_37};
    end
  end

  assign _zz_9[0] = stageB_tagsReadRsp_0_error;
  always @ (*) begin
    loader_counter_willIncrement = 1'b0;
    if(_zz_18)begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 3'b111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_39);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = 3'b000;
    end
  end

  assign loader_kill = 1'b0;
  assign loader_done = loader_counter_willOverflow;
  assign io_cpu_execute_refilling = loader_valid;
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
      stageA_request_isLrsc <= io_cpu_execute_args_isLrsc;
      stageA_request_isAmo <= io_cpu_execute_args_isAmo;
      stageA_request_amoCtrl_swap <= io_cpu_execute_args_amoCtrl_swap;
      stageA_request_amoCtrl_alu <= io_cpu_execute_args_amoCtrl_alu;
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_mask <= stage0_mask;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if((! io_cpu_memory_isStuck))begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
      stageB_request_isLrsc <= stageA_request_isLrsc;
      stageB_request_isAmo <= stageA_request_isAmo;
      stageB_request_amoCtrl_swap <= stageA_request_amoCtrl_swap;
      stageB_request_amoCtrl_alu <= stageA_request_amoCtrl_alu;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze)))begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuRsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuRsp_isIoAccess;
      stageB_mmuRsp_isPaging <= io_cpu_memory_mmuRsp_isPaging;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuRsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuRsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuRsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuRsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuRsp_refilling;
      stageB_mmuRsp_bypassTranslation <= io_cpu_memory_mmuRsp_bypassTranslation;
      stageB_mmuRsp_ways_0_sel <= io_cpu_memory_mmuRsp_ways_0_sel;
      stageB_mmuRsp_ways_0_physical <= io_cpu_memory_mmuRsp_ways_0_physical;
      stageB_mmuRsp_ways_1_sel <= io_cpu_memory_mmuRsp_ways_1_sel;
      stageB_mmuRsp_ways_1_physical <= io_cpu_memory_mmuRsp_ways_1_physical;
      stageB_mmuRsp_ways_2_sel <= io_cpu_memory_mmuRsp_ways_2_sel;
      stageB_mmuRsp_ways_2_physical <= io_cpu_memory_mmuRsp_ways_2_physical;
      stageB_mmuRsp_ways_3_sel <= io_cpu_memory_mmuRsp_ways_3_sel;
      stageB_mmuRsp_ways_3_physical <= io_cpu_memory_mmuRsp_ways_3_physical;
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
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_unaligned <= (((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)) || ((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0)));
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if(stageB_flusher_valid)begin
      if(_zz_21)begin
        if(_zz_22)begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + 7'h01);
        end
      end
    end
    if(stageB_flusher_start)begin
      stageB_mmuRsp_physicalAddress[11 : 5] <= 7'h0;
    end
    stageB_amo_internal_resultRegValid <= io_cpu_writeBack_isStuck;
    stageB_amo_resultReg <= stageB_amo_result;
    loader_valid_regNext <= loader_valid;
  end

  always @ (posedge clk) begin
    if(reset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_valid <= 1'b0;
      stageB_flusher_start <= 1'b1;
      stageB_lrSc_reserved <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= 3'b000;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(io_mem_cmd_ready)begin
        memCmdSent <= 1'b1;
      end
      if((! io_cpu_writeBack_isStuck))begin
        memCmdSent <= 1'b0;
      end
      if(stageB_flusher_valid)begin
        if(_zz_21)begin
          if(! _zz_22) begin
            stageB_flusher_valid <= 1'b0;
          end
        end
      end
      stageB_flusher_start <= ((((((! stageB_flusher_start) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start)begin
        stageB_flusher_valid <= 1'b1;
      end
      if(((io_cpu_writeBack_isValid && (! io_cpu_writeBack_isStuck)) && stageB_request_isLrsc))begin
        stageB_lrSc_reserved <= (! stageB_request_wr);
      end
      if(_zz_13)begin
        stageB_lrSc_reserved <= stageB_lrSc_reserved;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)));
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
            $display("FAILURE writeBack stuck by another plugin is not allowed");
            $finish;
          end
        `endif
      `endif
      if(stageB_loaderValid)begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_kill)begin
        loader_killReg <= 1'b1;
      end
      if(_zz_18)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done)begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if((! loader_valid))begin
        loader_waysAllocator <= _zz_40[0:0];
      end
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
  input               io_cpu_fetch_mmuRsp_ways_0_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_0_physical,
  input               io_cpu_fetch_mmuRsp_ways_1_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_1_physical,
  input               io_cpu_fetch_mmuRsp_ways_2_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_2_physical,
  input               io_cpu_fetch_mmuRsp_ways_3_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_3_physical,
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
  reg        [21:0]   _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire       [0:0]    _zz_13;
  wire       [0:0]    _zz_14;
  wire       [21:0]   _zz_15;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [7:0]    lineLoader_flushCounter;
  reg                 _zz_3;
  reg                 lineLoader_cmdSent;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [6:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [9:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire       [9:0]    _zz_4;
  wire                _zz_5;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [6:0]    _zz_6;
  wire                _zz_7;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_8;
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
  reg                 decodeStage_mmuRsp_ways_0_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_0_physical;
  reg                 decodeStage_mmuRsp_ways_1_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_1_physical;
  reg                 decodeStage_mmuRsp_ways_2_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_2_physical;
  reg                 decodeStage_mmuRsp_ways_3_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_3_physical;
  reg                 decodeStage_hit_valid;
  reg                 decodeStage_hit_error;
  (* ram_style = "block" *) reg [31:0] banks_0 [0:1023];
  (* ram_style = "block" *) reg [21:0] ways_0_tags [0:127];

  assign _zz_11 = (! lineLoader_flushCounter[7]);
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
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_4 = io_cpu_prefetch_pc[11 : 2];
  assign _zz_5 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = _zz_9;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_6 = io_cpu_prefetch_pc[11 : 5];
  assign _zz_7 = (! io_cpu_fetch_isStuck);
  assign _zz_8 = _zz_10;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_13[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_14[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_8[21 : 2];
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuRsp_physicalAddress[31 : 12]));
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
      lineLoader_flushCounter <= (lineLoader_flushCounter + 8'h01);
    end
    _zz_3 <= lineLoader_flushCounter[7];
    if(_zz_12)begin
      lineLoader_flushCounter <= 8'h0;
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
      decodeStage_mmuRsp_ways_0_sel <= io_cpu_fetch_mmuRsp_ways_0_sel;
      decodeStage_mmuRsp_ways_0_physical <= io_cpu_fetch_mmuRsp_ways_0_physical;
      decodeStage_mmuRsp_ways_1_sel <= io_cpu_fetch_mmuRsp_ways_1_sel;
      decodeStage_mmuRsp_ways_1_physical <= io_cpu_fetch_mmuRsp_ways_1_physical;
      decodeStage_mmuRsp_ways_2_sel <= io_cpu_fetch_mmuRsp_ways_2_sel;
      decodeStage_mmuRsp_ways_2_physical <= io_cpu_fetch_mmuRsp_ways_2_physical;
      decodeStage_mmuRsp_ways_3_sel <= io_cpu_fetch_mmuRsp_ways_3_sel;
      decodeStage_mmuRsp_ways_3_physical <= io_cpu_fetch_mmuRsp_ways_3_physical;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_valid <= fetchStage_hit_valid;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_error <= fetchStage_hit_error;
    end
  end


endmodule
