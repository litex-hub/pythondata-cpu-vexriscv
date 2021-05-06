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
  wire                _zz_622;
  wire                _zz_623;
  wire                _zz_624;
  wire                _zz_625;
  wire                _zz_626;
  wire                _zz_627;
  wire                _zz_628;
  wire                _zz_629;
  reg                 _zz_630;
  wire                _zz_631;
  wire       [31:0]   _zz_632;
  wire                _zz_633;
  wire       [31:0]   _zz_634;
  reg                 _zz_635;
  wire                _zz_636;
  wire                _zz_637;
  wire       [31:0]   _zz_638;
  wire                _zz_639;
  wire                _zz_640;
  wire                _zz_641;
  wire                _zz_642;
  wire                _zz_643;
  wire                _zz_644;
  wire                _zz_645;
  wire                _zz_646;
  wire       [3:0]    _zz_647;
  wire                _zz_648;
  wire                _zz_649;
  reg        [31:0]   _zz_650;
  reg        [31:0]   _zz_651;
  reg        [31:0]   _zz_652;
  reg        [4:0]    _zz_653;
  reg        [4:0]    _zz_654;
  reg        [4:0]    _zz_655;
  reg        [4:0]    _zz_656;
  reg        [4:0]    _zz_657;
  reg        [4:0]    _zz_658;
  reg                 _zz_659;
  reg                 _zz_660;
  reg                 _zz_661;
  reg        [4:0]    _zz_662;
  reg        [4:0]    _zz_663;
  reg        [4:0]    _zz_664;
  reg        [4:0]    _zz_665;
  reg        [4:0]    _zz_666;
  reg        [4:0]    _zz_667;
  reg                 _zz_668;
  reg                 _zz_669;
  reg                 _zz_670;
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
  wire                _zz_671;
  wire                _zz_672;
  wire                _zz_673;
  wire                _zz_674;
  wire                _zz_675;
  wire                _zz_676;
  wire                _zz_677;
  wire                _zz_678;
  wire                _zz_679;
  wire                _zz_680;
  wire                _zz_681;
  wire                _zz_682;
  wire                _zz_683;
  wire                _zz_684;
  wire       [1:0]    _zz_685;
  wire                _zz_686;
  wire                _zz_687;
  wire                _zz_688;
  wire                _zz_689;
  wire                _zz_690;
  wire                _zz_691;
  wire                _zz_692;
  wire                _zz_693;
  wire                _zz_694;
  wire                _zz_695;
  wire                _zz_696;
  wire                _zz_697;
  wire       [1:0]    _zz_698;
  wire                _zz_699;
  wire                _zz_700;
  wire                _zz_701;
  wire                _zz_702;
  wire                _zz_703;
  wire                _zz_704;
  wire                _zz_705;
  wire                _zz_706;
  wire                _zz_707;
  wire                _zz_708;
  wire                _zz_709;
  wire                _zz_710;
  wire                _zz_711;
  wire                _zz_712;
  wire                _zz_713;
  wire                _zz_714;
  wire                _zz_715;
  wire                _zz_716;
  wire                _zz_717;
  wire                _zz_718;
  wire                _zz_719;
  wire                _zz_720;
  wire                _zz_721;
  wire                _zz_722;
  wire       [1:0]    _zz_723;
  wire                _zz_724;
  wire       [1:0]    _zz_725;
  wire       [51:0]   _zz_726;
  wire       [51:0]   _zz_727;
  wire       [51:0]   _zz_728;
  wire       [32:0]   _zz_729;
  wire       [51:0]   _zz_730;
  wire       [49:0]   _zz_731;
  wire       [51:0]   _zz_732;
  wire       [49:0]   _zz_733;
  wire       [51:0]   _zz_734;
  wire       [32:0]   _zz_735;
  wire       [31:0]   _zz_736;
  wire       [32:0]   _zz_737;
  wire       [0:0]    _zz_738;
  wire       [0:0]    _zz_739;
  wire       [0:0]    _zz_740;
  wire       [0:0]    _zz_741;
  wire       [0:0]    _zz_742;
  wire       [0:0]    _zz_743;
  wire       [0:0]    _zz_744;
  wire       [0:0]    _zz_745;
  wire       [0:0]    _zz_746;
  wire       [0:0]    _zz_747;
  wire       [0:0]    _zz_748;
  wire       [0:0]    _zz_749;
  wire       [0:0]    _zz_750;
  wire       [0:0]    _zz_751;
  wire       [0:0]    _zz_752;
  wire       [0:0]    _zz_753;
  wire       [0:0]    _zz_754;
  wire       [3:0]    _zz_755;
  wire       [2:0]    _zz_756;
  wire       [31:0]   _zz_757;
  wire       [11:0]   _zz_758;
  wire       [31:0]   _zz_759;
  wire       [19:0]   _zz_760;
  wire       [11:0]   _zz_761;
  wire       [31:0]   _zz_762;
  wire       [31:0]   _zz_763;
  wire       [19:0]   _zz_764;
  wire       [11:0]   _zz_765;
  wire       [2:0]    _zz_766;
  wire       [2:0]    _zz_767;
  wire       [31:0]   _zz_768;
  wire       [31:0]   _zz_769;
  wire       [31:0]   _zz_770;
  wire       [31:0]   _zz_771;
  wire       [31:0]   _zz_772;
  wire       [31:0]   _zz_773;
  wire       [31:0]   _zz_774;
  wire       [31:0]   _zz_775;
  wire       [31:0]   _zz_776;
  wire       [31:0]   _zz_777;
  wire       [31:0]   _zz_778;
  wire       [31:0]   _zz_779;
  wire       [31:0]   _zz_780;
  wire       [31:0]   _zz_781;
  wire       [31:0]   _zz_782;
  wire       [31:0]   _zz_783;
  wire       [31:0]   _zz_784;
  wire       [31:0]   _zz_785;
  wire       [31:0]   _zz_786;
  wire       [31:0]   _zz_787;
  wire       [31:0]   _zz_788;
  wire       [31:0]   _zz_789;
  wire       [31:0]   _zz_790;
  wire       [31:0]   _zz_791;
  wire       [31:0]   _zz_792;
  wire       [31:0]   _zz_793;
  wire       [31:0]   _zz_794;
  wire       [31:0]   _zz_795;
  wire       [31:0]   _zz_796;
  wire       [31:0]   _zz_797;
  wire       [31:0]   _zz_798;
  wire       [31:0]   _zz_799;
  wire       [31:0]   _zz_800;
  wire       [31:0]   _zz_801;
  wire       [31:0]   _zz_802;
  wire       [31:0]   _zz_803;
  wire       [31:0]   _zz_804;
  wire       [31:0]   _zz_805;
  wire       [31:0]   _zz_806;
  wire       [31:0]   _zz_807;
  wire       [31:0]   _zz_808;
  wire       [31:0]   _zz_809;
  wire       [31:0]   _zz_810;
  wire       [31:0]   _zz_811;
  wire       [31:0]   _zz_812;
  wire       [31:0]   _zz_813;
  wire       [31:0]   _zz_814;
  wire       [31:0]   _zz_815;
  wire       [4:0]    _zz_816;
  wire       [4:0]    _zz_817;
  wire       [4:0]    _zz_818;
  wire       [4:0]    _zz_819;
  wire       [4:0]    _zz_820;
  wire       [0:0]    _zz_821;
  wire       [2:0]    _zz_822;
  wire       [15:0]   _zz_823;
  wire       [15:0]   _zz_824;
  wire       [15:0]   _zz_825;
  wire       [4:0]    _zz_826;
  wire       [4:0]    _zz_827;
  wire       [4:0]    _zz_828;
  wire       [4:0]    _zz_829;
  wire       [4:0]    _zz_830;
  wire       [0:0]    _zz_831;
  wire       [2:0]    _zz_832;
  wire       [15:0]   _zz_833;
  wire       [15:0]   _zz_834;
  wire       [15:0]   _zz_835;
  wire       [0:0]    _zz_836;
  wire       [2:0]    _zz_837;
  wire       [4:0]    _zz_838;
  wire       [11:0]   _zz_839;
  wire       [11:0]   _zz_840;
  wire       [31:0]   _zz_841;
  wire       [31:0]   _zz_842;
  wire       [31:0]   _zz_843;
  wire       [31:0]   _zz_844;
  wire       [31:0]   _zz_845;
  wire       [31:0]   _zz_846;
  wire       [31:0]   _zz_847;
  wire       [11:0]   _zz_848;
  wire       [19:0]   _zz_849;
  wire       [11:0]   _zz_850;
  wire       [31:0]   _zz_851;
  wire       [31:0]   _zz_852;
  wire       [31:0]   _zz_853;
  wire       [11:0]   _zz_854;
  wire       [19:0]   _zz_855;
  wire       [11:0]   _zz_856;
  wire       [2:0]    _zz_857;
  wire       [1:0]    _zz_858;
  wire       [1:0]    _zz_859;
  wire       [65:0]   _zz_860;
  wire       [65:0]   _zz_861;
  wire       [31:0]   _zz_862;
  wire       [31:0]   _zz_863;
  wire       [0:0]    _zz_864;
  wire       [5:0]    _zz_865;
  wire       [32:0]   _zz_866;
  wire       [31:0]   _zz_867;
  wire       [31:0]   _zz_868;
  wire       [32:0]   _zz_869;
  wire       [32:0]   _zz_870;
  wire       [32:0]   _zz_871;
  wire       [32:0]   _zz_872;
  wire       [0:0]    _zz_873;
  wire       [32:0]   _zz_874;
  wire       [0:0]    _zz_875;
  wire       [32:0]   _zz_876;
  wire       [0:0]    _zz_877;
  wire       [31:0]   _zz_878;
  wire       [0:0]    _zz_879;
  wire       [0:0]    _zz_880;
  wire       [0:0]    _zz_881;
  wire       [0:0]    _zz_882;
  wire       [0:0]    _zz_883;
  wire       [0:0]    _zz_884;
  wire       [0:0]    _zz_885;
  wire       [0:0]    _zz_886;
  wire       [0:0]    _zz_887;
  wire       [0:0]    _zz_888;
  wire       [0:0]    _zz_889;
  wire       [0:0]    _zz_890;
  wire       [0:0]    _zz_891;
  wire       [0:0]    _zz_892;
  wire       [0:0]    _zz_893;
  wire       [0:0]    _zz_894;
  wire       [0:0]    _zz_895;
  wire       [0:0]    _zz_896;
  wire       [0:0]    _zz_897;
  wire       [0:0]    _zz_898;
  wire       [0:0]    _zz_899;
  wire       [0:0]    _zz_900;
  wire       [0:0]    _zz_901;
  wire       [0:0]    _zz_902;
  wire       [0:0]    _zz_903;
  wire       [0:0]    _zz_904;
  wire       [0:0]    _zz_905;
  wire       [0:0]    _zz_906;
  wire       [0:0]    _zz_907;
  wire       [0:0]    _zz_908;
  wire       [0:0]    _zz_909;
  wire       [0:0]    _zz_910;
  wire       [0:0]    _zz_911;
  wire       [0:0]    _zz_912;
  wire       [0:0]    _zz_913;
  wire       [0:0]    _zz_914;
  wire       [0:0]    _zz_915;
  wire       [0:0]    _zz_916;
  wire       [0:0]    _zz_917;
  wire       [0:0]    _zz_918;
  wire       [0:0]    _zz_919;
  wire       [0:0]    _zz_920;
  wire       [0:0]    _zz_921;
  wire       [0:0]    _zz_922;
  wire       [0:0]    _zz_923;
  wire       [0:0]    _zz_924;
  wire       [0:0]    _zz_925;
  wire       [0:0]    _zz_926;
  wire       [0:0]    _zz_927;
  wire       [0:0]    _zz_928;
  wire       [0:0]    _zz_929;
  wire       [0:0]    _zz_930;
  wire       [0:0]    _zz_931;
  wire       [0:0]    _zz_932;
  wire       [0:0]    _zz_933;
  wire       [0:0]    _zz_934;
  wire       [0:0]    _zz_935;
  wire       [0:0]    _zz_936;
  wire       [0:0]    _zz_937;
  wire       [0:0]    _zz_938;
  wire       [0:0]    _zz_939;
  wire       [0:0]    _zz_940;
  wire       [0:0]    _zz_941;
  wire       [0:0]    _zz_942;
  wire       [0:0]    _zz_943;
  wire       [0:0]    _zz_944;
  wire       [0:0]    _zz_945;
  wire       [0:0]    _zz_946;
  wire       [0:0]    _zz_947;
  wire       [0:0]    _zz_948;
  wire       [0:0]    _zz_949;
  wire       [26:0]   _zz_950;
  wire                _zz_951;
  wire                _zz_952;
  wire       [1:0]    _zz_953;
  wire       [2:0]    _zz_954;
  wire       [2:0]    _zz_955;
  wire       [2:0]    _zz_956;
  wire       [2:0]    _zz_957;
  wire       [2:0]    _zz_958;
  wire       [3:0]    _zz_959;
  wire       [3:0]    _zz_960;
  wire       [3:0]    _zz_961;
  wire       [2:0]    _zz_962;
  wire       [2:0]    _zz_963;
  wire       [2:0]    _zz_964;
  wire       [2:0]    _zz_965;
  wire       [2:0]    _zz_966;
  wire       [3:0]    _zz_967;
  wire       [3:0]    _zz_968;
  wire       [3:0]    _zz_969;
  wire       [31:0]   _zz_970;
  wire       [31:0]   _zz_971;
  wire       [31:0]   _zz_972;
  wire                _zz_973;
  wire       [0:0]    _zz_974;
  wire       [13:0]   _zz_975;
  wire       [31:0]   _zz_976;
  wire       [31:0]   _zz_977;
  wire       [31:0]   _zz_978;
  wire                _zz_979;
  wire       [0:0]    _zz_980;
  wire       [7:0]    _zz_981;
  wire       [31:0]   _zz_982;
  wire       [31:0]   _zz_983;
  wire       [31:0]   _zz_984;
  wire                _zz_985;
  wire       [0:0]    _zz_986;
  wire       [1:0]    _zz_987;
  wire                _zz_988;
  wire                _zz_989;
  wire                _zz_990;
  wire       [0:0]    _zz_991;
  wire       [4:0]    _zz_992;
  wire       [0:0]    _zz_993;
  wire       [4:0]    _zz_994;
  wire       [0:0]    _zz_995;
  wire       [4:0]    _zz_996;
  wire       [0:0]    _zz_997;
  wire       [4:0]    _zz_998;
  wire       [0:0]    _zz_999;
  wire       [4:0]    _zz_1000;
  wire       [0:0]    _zz_1001;
  wire       [4:0]    _zz_1002;
  wire       [31:0]   _zz_1003;
  wire       [31:0]   _zz_1004;
  wire                _zz_1005;
  wire       [0:0]    _zz_1006;
  wire       [0:0]    _zz_1007;
  wire                _zz_1008;
  wire       [0:0]    _zz_1009;
  wire       [24:0]   _zz_1010;
  wire       [31:0]   _zz_1011;
  wire                _zz_1012;
  wire                _zz_1013;
  wire       [0:0]    _zz_1014;
  wire       [0:0]    _zz_1015;
  wire       [0:0]    _zz_1016;
  wire       [0:0]    _zz_1017;
  wire                _zz_1018;
  wire       [0:0]    _zz_1019;
  wire       [20:0]   _zz_1020;
  wire       [31:0]   _zz_1021;
  wire       [31:0]   _zz_1022;
  wire                _zz_1023;
  wire                _zz_1024;
  wire       [0:0]    _zz_1025;
  wire       [1:0]    _zz_1026;
  wire       [0:0]    _zz_1027;
  wire       [0:0]    _zz_1028;
  wire                _zz_1029;
  wire       [0:0]    _zz_1030;
  wire       [17:0]   _zz_1031;
  wire       [31:0]   _zz_1032;
  wire       [31:0]   _zz_1033;
  wire       [31:0]   _zz_1034;
  wire       [31:0]   _zz_1035;
  wire       [31:0]   _zz_1036;
  wire       [31:0]   _zz_1037;
  wire       [31:0]   _zz_1038;
  wire       [31:0]   _zz_1039;
  wire                _zz_1040;
  wire       [1:0]    _zz_1041;
  wire       [1:0]    _zz_1042;
  wire                _zz_1043;
  wire       [0:0]    _zz_1044;
  wire       [14:0]   _zz_1045;
  wire       [31:0]   _zz_1046;
  wire       [31:0]   _zz_1047;
  wire       [31:0]   _zz_1048;
  wire       [31:0]   _zz_1049;
  wire       [31:0]   _zz_1050;
  wire       [31:0]   _zz_1051;
  wire       [0:0]    _zz_1052;
  wire       [0:0]    _zz_1053;
  wire       [4:0]    _zz_1054;
  wire       [4:0]    _zz_1055;
  wire                _zz_1056;
  wire       [0:0]    _zz_1057;
  wire       [11:0]   _zz_1058;
  wire       [31:0]   _zz_1059;
  wire       [31:0]   _zz_1060;
  wire       [31:0]   _zz_1061;
  wire       [31:0]   _zz_1062;
  wire                _zz_1063;
  wire       [0:0]    _zz_1064;
  wire       [1:0]    _zz_1065;
  wire       [31:0]   _zz_1066;
  wire       [31:0]   _zz_1067;
  wire       [0:0]    _zz_1068;
  wire       [3:0]    _zz_1069;
  wire       [4:0]    _zz_1070;
  wire       [4:0]    _zz_1071;
  wire                _zz_1072;
  wire       [0:0]    _zz_1073;
  wire       [8:0]    _zz_1074;
  wire       [31:0]   _zz_1075;
  wire       [31:0]   _zz_1076;
  wire       [31:0]   _zz_1077;
  wire                _zz_1078;
  wire                _zz_1079;
  wire       [31:0]   _zz_1080;
  wire       [31:0]   _zz_1081;
  wire       [0:0]    _zz_1082;
  wire       [1:0]    _zz_1083;
  wire       [0:0]    _zz_1084;
  wire       [2:0]    _zz_1085;
  wire       [0:0]    _zz_1086;
  wire       [4:0]    _zz_1087;
  wire       [1:0]    _zz_1088;
  wire       [1:0]    _zz_1089;
  wire                _zz_1090;
  wire       [0:0]    _zz_1091;
  wire       [6:0]    _zz_1092;
  wire       [31:0]   _zz_1093;
  wire       [31:0]   _zz_1094;
  wire       [31:0]   _zz_1095;
  wire       [31:0]   _zz_1096;
  wire                _zz_1097;
  wire                _zz_1098;
  wire       [31:0]   _zz_1099;
  wire       [31:0]   _zz_1100;
  wire                _zz_1101;
  wire       [0:0]    _zz_1102;
  wire       [0:0]    _zz_1103;
  wire                _zz_1104;
  wire       [0:0]    _zz_1105;
  wire       [2:0]    _zz_1106;
  wire                _zz_1107;
  wire       [0:0]    _zz_1108;
  wire       [0:0]    _zz_1109;
  wire       [0:0]    _zz_1110;
  wire       [0:0]    _zz_1111;
  wire                _zz_1112;
  wire       [0:0]    _zz_1113;
  wire       [4:0]    _zz_1114;
  wire       [31:0]   _zz_1115;
  wire       [31:0]   _zz_1116;
  wire       [31:0]   _zz_1117;
  wire       [31:0]   _zz_1118;
  wire       [31:0]   _zz_1119;
  wire       [31:0]   _zz_1120;
  wire       [31:0]   _zz_1121;
  wire       [31:0]   _zz_1122;
  wire       [31:0]   _zz_1123;
  wire       [31:0]   _zz_1124;
  wire                _zz_1125;
  wire       [0:0]    _zz_1126;
  wire       [0:0]    _zz_1127;
  wire       [31:0]   _zz_1128;
  wire       [31:0]   _zz_1129;
  wire       [31:0]   _zz_1130;
  wire       [31:0]   _zz_1131;
  wire       [31:0]   _zz_1132;
  wire                _zz_1133;
  wire       [3:0]    _zz_1134;
  wire       [3:0]    _zz_1135;
  wire                _zz_1136;
  wire       [0:0]    _zz_1137;
  wire       [2:0]    _zz_1138;
  wire       [31:0]   _zz_1139;
  wire       [31:0]   _zz_1140;
  wire       [31:0]   _zz_1141;
  wire       [31:0]   _zz_1142;
  wire       [31:0]   _zz_1143;
  wire       [31:0]   _zz_1144;
  wire                _zz_1145;
  wire       [0:0]    _zz_1146;
  wire       [1:0]    _zz_1147;
  wire                _zz_1148;
  wire       [2:0]    _zz_1149;
  wire       [2:0]    _zz_1150;
  wire                _zz_1151;
  wire       [0:0]    _zz_1152;
  wire       [0:0]    _zz_1153;
  wire       [31:0]   _zz_1154;
  wire       [31:0]   _zz_1155;
  wire       [31:0]   _zz_1156;
  wire       [31:0]   _zz_1157;
  wire       [31:0]   _zz_1158;
  wire       [31:0]   _zz_1159;
  wire       [31:0]   _zz_1160;
  wire                _zz_1161;
  wire                _zz_1162;
  wire                _zz_1163;
  wire       [0:0]    _zz_1164;
  wire       [0:0]    _zz_1165;
  wire                _zz_1166;
  wire                _zz_1167;
  wire                _zz_1168;
  wire                _zz_1169;
  wire       [31:0]   _zz_1170;
  wire       [31:0]   _zz_1171;
  wire       [31:0]   _zz_1172;
  wire       [31:0]   _zz_1173;
  wire       [31:0]   _zz_1174;
  wire       [31:0]   _zz_1175;
  wire       [31:0]   _zz_1176;
  wire       [31:0]   _zz_1177;
  wire       [31:0]   _zz_1178;
  wire       [31:0]   _zz_1179;
  wire       [31:0]   _zz_1180;
  wire       [31:0]   _zz_1181;
  wire       [31:0]   _zz_1182;
  wire       [31:0]   _zz_1183;
  wire       [31:0]   _zz_1184;
  wire       [31:0]   _zz_1185;
  wire       [31:0]   _zz_1186;
  wire       [51:0]   memory_MUL_LOW;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_SRC2_FORCE_ZERO;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
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
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_10;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_11;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_12;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_13;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_14;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_15;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_16;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_17;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_18;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_19;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_20;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_21;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_22;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_23;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_24;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_25;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_26;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_27;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_28;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_29;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire                execute_BRANCH_COND_RESULT;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_30;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_31;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_32;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_33;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_34;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_35;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_36;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_37;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_38;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_39;
  wire       [31:0]   _zz_40;
  wire                _zz_41;
  reg                 _zz_42;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_43;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_44;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_45;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_46;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_47;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_48;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_49;
  reg        [31:0]   _zz_50;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_51;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_52;
  reg        [31:0]   _zz_53;
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
  reg                 IBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
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
  wire                DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
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
  wire       [3:0]    _zz_54;
  wire       [3:0]    _zz_55;
  wire                _zz_56;
  wire                _zz_57;
  wire                _zz_58;
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
  wire                _zz_59;
  wire                _zz_60;
  wire                _zz_61;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_62;
  wire                _zz_63;
  reg                 _zz_64;
  wire                _zz_65;
  reg                 _zz_66;
  reg        [31:0]   _zz_67;
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
  wire                _zz_68;
  reg        [18:0]   _zz_69;
  wire                _zz_70;
  reg        [10:0]   _zz_71;
  wire                _zz_72;
  reg        [18:0]   _zz_73;
  reg                 _zz_74;
  wire                _zz_75;
  reg        [10:0]   _zz_76;
  wire                _zz_77;
  reg        [18:0]   _zz_78;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_79;
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
  wire       [31:0]   _zz_80;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_81;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire                _zz_82;
  reg        [31:0]   _zz_83;
  wire                _zz_84;
  reg        [31:0]   _zz_85;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  reg                 _zz_86;
  reg                 _zz_87;
  reg                 _zz_88;
  reg                 _zz_89;
  reg        [1:0]    _zz_90;
  reg        [31:0]   _zz_91;
  reg                 _zz_92;
  reg                 _zz_93;
  reg                 _zz_94;
  reg                 _zz_95;
  reg        [1:0]    _zz_96;
  reg        [31:0]   _zz_97;
  reg                 _zz_98;
  wire                _zz_99;
  reg        [31:0]   _zz_100;
  reg        [31:0]   _zz_101;
  wire       [31:0]   _zz_102;
  wire       [31:0]   _zz_103;
  wire       [31:0]   _zz_104;
  reg                 _zz_105;
  reg                 _zz_106;
  reg                 _zz_107;
  reg                 _zz_108;
  reg        [1:0]    _zz_109;
  reg        [31:0]   _zz_110;
  reg                 _zz_111;
  reg                 _zz_112;
  reg                 _zz_113;
  reg                 _zz_114;
  reg        [1:0]    _zz_115;
  reg        [31:0]   _zz_116;
  reg                 _zz_117;
  wire                _zz_118;
  reg        [31:0]   _zz_119;
  reg        [31:0]   _zz_120;
  wire       [31:0]   _zz_121;
  wire       [31:0]   _zz_122;
  wire       [31:0]   _zz_123;
  reg                 _zz_124;
  reg                 _zz_125;
  reg                 _zz_126;
  reg                 _zz_127;
  reg        [1:0]    _zz_128;
  reg        [31:0]   _zz_129;
  reg                 _zz_130;
  reg                 _zz_131;
  reg                 _zz_132;
  reg                 _zz_133;
  reg        [1:0]    _zz_134;
  reg        [31:0]   _zz_135;
  reg                 _zz_136;
  wire                _zz_137;
  reg        [31:0]   _zz_138;
  reg        [31:0]   _zz_139;
  wire       [31:0]   _zz_140;
  wire       [31:0]   _zz_141;
  wire       [31:0]   _zz_142;
  reg                 _zz_143;
  reg                 _zz_144;
  reg                 _zz_145;
  reg                 _zz_146;
  reg        [1:0]    _zz_147;
  reg        [31:0]   _zz_148;
  reg                 _zz_149;
  reg                 _zz_150;
  reg                 _zz_151;
  reg                 _zz_152;
  reg        [1:0]    _zz_153;
  reg        [31:0]   _zz_154;
  reg                 _zz_155;
  wire                _zz_156;
  reg        [31:0]   _zz_157;
  reg        [31:0]   _zz_158;
  wire       [31:0]   _zz_159;
  wire       [31:0]   _zz_160;
  wire       [31:0]   _zz_161;
  reg                 _zz_162;
  reg                 _zz_163;
  reg                 _zz_164;
  reg                 _zz_165;
  reg        [1:0]    _zz_166;
  reg        [31:0]   _zz_167;
  reg                 _zz_168;
  reg                 _zz_169;
  reg                 _zz_170;
  reg                 _zz_171;
  reg        [1:0]    _zz_172;
  reg        [31:0]   _zz_173;
  reg                 _zz_174;
  wire                _zz_175;
  reg        [31:0]   _zz_176;
  reg        [31:0]   _zz_177;
  wire       [31:0]   _zz_178;
  wire       [31:0]   _zz_179;
  wire       [31:0]   _zz_180;
  reg                 _zz_181;
  reg                 _zz_182;
  reg                 _zz_183;
  reg                 _zz_184;
  reg        [1:0]    _zz_185;
  reg        [31:0]   _zz_186;
  reg                 _zz_187;
  reg                 _zz_188;
  reg                 _zz_189;
  reg                 _zz_190;
  reg        [1:0]    _zz_191;
  reg        [31:0]   _zz_192;
  reg                 _zz_193;
  wire                _zz_194;
  reg        [31:0]   _zz_195;
  reg        [31:0]   _zz_196;
  wire       [31:0]   _zz_197;
  wire       [31:0]   _zz_198;
  wire       [31:0]   _zz_199;
  reg                 _zz_200;
  reg                 _zz_201;
  reg                 _zz_202;
  reg                 _zz_203;
  reg        [1:0]    _zz_204;
  reg        [31:0]   _zz_205;
  reg                 _zz_206;
  reg                 _zz_207;
  reg                 _zz_208;
  reg                 _zz_209;
  reg        [1:0]    _zz_210;
  reg        [31:0]   _zz_211;
  reg                 _zz_212;
  wire                _zz_213;
  reg        [31:0]   _zz_214;
  reg        [31:0]   _zz_215;
  wire       [31:0]   _zz_216;
  wire       [31:0]   _zz_217;
  wire       [31:0]   _zz_218;
  reg                 _zz_219;
  reg                 _zz_220;
  reg                 _zz_221;
  reg                 _zz_222;
  reg        [1:0]    _zz_223;
  reg        [31:0]   _zz_224;
  reg                 _zz_225;
  reg                 _zz_226;
  reg                 _zz_227;
  reg                 _zz_228;
  reg        [1:0]    _zz_229;
  reg        [31:0]   _zz_230;
  reg                 _zz_231;
  wire                _zz_232;
  reg        [31:0]   _zz_233;
  reg        [31:0]   _zz_234;
  wire       [31:0]   _zz_235;
  wire       [31:0]   _zz_236;
  wire       [31:0]   _zz_237;
  reg                 _zz_238;
  reg                 _zz_239;
  reg                 _zz_240;
  reg                 _zz_241;
  reg        [1:0]    _zz_242;
  reg        [31:0]   _zz_243;
  reg                 _zz_244;
  reg                 _zz_245;
  reg                 _zz_246;
  reg                 _zz_247;
  reg        [1:0]    _zz_248;
  reg        [31:0]   _zz_249;
  reg                 _zz_250;
  wire                _zz_251;
  reg        [31:0]   _zz_252;
  reg        [31:0]   _zz_253;
  wire       [31:0]   _zz_254;
  wire       [31:0]   _zz_255;
  wire       [31:0]   _zz_256;
  reg                 _zz_257;
  reg                 _zz_258;
  reg                 _zz_259;
  reg                 _zz_260;
  reg        [1:0]    _zz_261;
  reg        [31:0]   _zz_262;
  reg                 _zz_263;
  reg                 _zz_264;
  reg                 _zz_265;
  reg                 _zz_266;
  reg        [1:0]    _zz_267;
  reg        [31:0]   _zz_268;
  reg                 _zz_269;
  wire                _zz_270;
  reg        [31:0]   _zz_271;
  reg        [31:0]   _zz_272;
  wire       [31:0]   _zz_273;
  wire       [31:0]   _zz_274;
  wire       [31:0]   _zz_275;
  reg                 _zz_276;
  reg                 _zz_277;
  reg                 _zz_278;
  reg                 _zz_279;
  reg        [1:0]    _zz_280;
  reg        [31:0]   _zz_281;
  reg                 _zz_282;
  reg                 _zz_283;
  reg                 _zz_284;
  reg                 _zz_285;
  reg        [1:0]    _zz_286;
  reg        [31:0]   _zz_287;
  reg                 _zz_288;
  wire                _zz_289;
  reg        [31:0]   _zz_290;
  reg        [31:0]   _zz_291;
  wire       [31:0]   _zz_292;
  wire       [31:0]   _zz_293;
  wire       [31:0]   _zz_294;
  reg                 _zz_295;
  reg                 _zz_296;
  reg                 _zz_297;
  reg                 _zz_298;
  reg        [1:0]    _zz_299;
  reg        [31:0]   _zz_300;
  reg                 _zz_301;
  reg                 _zz_302;
  reg                 _zz_303;
  reg                 _zz_304;
  reg        [1:0]    _zz_305;
  reg        [31:0]   _zz_306;
  reg                 _zz_307;
  wire                _zz_308;
  reg        [31:0]   _zz_309;
  reg        [31:0]   _zz_310;
  wire       [31:0]   _zz_311;
  wire       [31:0]   _zz_312;
  wire       [31:0]   _zz_313;
  reg                 _zz_314;
  reg                 _zz_315;
  reg                 _zz_316;
  reg                 _zz_317;
  reg        [1:0]    _zz_318;
  reg        [31:0]   _zz_319;
  reg                 _zz_320;
  reg                 _zz_321;
  reg                 _zz_322;
  reg                 _zz_323;
  reg        [1:0]    _zz_324;
  reg        [31:0]   _zz_325;
  reg                 _zz_326;
  wire                _zz_327;
  reg        [31:0]   _zz_328;
  reg        [31:0]   _zz_329;
  wire       [31:0]   _zz_330;
  wire       [31:0]   _zz_331;
  wire       [31:0]   _zz_332;
  reg                 _zz_333;
  reg                 _zz_334;
  reg                 _zz_335;
  reg                 _zz_336;
  reg        [1:0]    _zz_337;
  reg        [31:0]   _zz_338;
  reg                 _zz_339;
  reg                 _zz_340;
  reg                 _zz_341;
  reg                 _zz_342;
  reg        [1:0]    _zz_343;
  reg        [31:0]   _zz_344;
  reg                 _zz_345;
  wire                _zz_346;
  reg        [31:0]   _zz_347;
  reg        [31:0]   _zz_348;
  wire       [31:0]   _zz_349;
  wire       [31:0]   _zz_350;
  wire       [31:0]   _zz_351;
  reg                 _zz_352;
  reg                 _zz_353;
  reg                 _zz_354;
  reg                 _zz_355;
  reg        [1:0]    _zz_356;
  reg        [31:0]   _zz_357;
  reg                 _zz_358;
  reg                 _zz_359;
  reg                 _zz_360;
  reg                 _zz_361;
  reg        [1:0]    _zz_362;
  reg        [31:0]   _zz_363;
  reg                 _zz_364;
  wire                _zz_365;
  reg        [31:0]   _zz_366;
  reg        [31:0]   _zz_367;
  wire       [31:0]   _zz_368;
  wire       [31:0]   _zz_369;
  wire       [31:0]   _zz_370;
  reg                 _zz_371;
  reg                 _zz_372;
  reg                 _zz_373;
  reg                 _zz_374;
  reg        [1:0]    _zz_375;
  reg        [31:0]   _zz_376;
  reg                 _zz_377;
  reg                 _zz_378;
  reg                 _zz_379;
  reg                 _zz_380;
  reg        [1:0]    _zz_381;
  reg        [31:0]   _zz_382;
  reg                 _zz_383;
  wire                _zz_384;
  reg        [31:0]   _zz_385;
  reg        [31:0]   _zz_386;
  wire       [31:0]   _zz_387;
  wire       [31:0]   _zz_388;
  wire       [31:0]   _zz_389;
  wire                PmpPlugin_ports_0_hits_0;
  wire                PmpPlugin_ports_0_hits_1;
  wire                PmpPlugin_ports_0_hits_2;
  wire                PmpPlugin_ports_0_hits_3;
  wire                PmpPlugin_ports_0_hits_4;
  wire                PmpPlugin_ports_0_hits_5;
  wire                PmpPlugin_ports_0_hits_6;
  wire                PmpPlugin_ports_0_hits_7;
  wire                PmpPlugin_ports_0_hits_8;
  wire                PmpPlugin_ports_0_hits_9;
  wire                PmpPlugin_ports_0_hits_10;
  wire                PmpPlugin_ports_0_hits_11;
  wire                PmpPlugin_ports_0_hits_12;
  wire                PmpPlugin_ports_0_hits_13;
  wire                PmpPlugin_ports_0_hits_14;
  wire                PmpPlugin_ports_0_hits_15;
  wire       [4:0]    _zz_390;
  wire       [4:0]    _zz_391;
  wire       [4:0]    _zz_392;
  wire       [4:0]    _zz_393;
  wire       [4:0]    _zz_394;
  wire       [4:0]    _zz_395;
  wire       [4:0]    _zz_396;
  wire       [4:0]    _zz_397;
  wire       [15:0]   _zz_398;
  wire       [15:0]   _zz_399;
  wire                _zz_400;
  wire                _zz_401;
  wire                _zz_402;
  wire                _zz_403;
  wire                _zz_404;
  wire                _zz_405;
  wire                _zz_406;
  wire                _zz_407;
  wire                _zz_408;
  wire                _zz_409;
  wire                _zz_410;
  wire                _zz_411;
  wire                _zz_412;
  wire                _zz_413;
  wire                _zz_414;
  wire       [15:0]   _zz_415;
  wire       [15:0]   _zz_416;
  wire                _zz_417;
  wire                _zz_418;
  wire                _zz_419;
  wire                _zz_420;
  wire                _zz_421;
  wire                _zz_422;
  wire                _zz_423;
  wire                _zz_424;
  wire                _zz_425;
  wire                _zz_426;
  wire                _zz_427;
  wire                _zz_428;
  wire                _zz_429;
  wire                _zz_430;
  wire                _zz_431;
  wire       [15:0]   _zz_432;
  wire       [15:0]   _zz_433;
  wire                _zz_434;
  wire                _zz_435;
  wire                _zz_436;
  wire                _zz_437;
  wire                _zz_438;
  wire                _zz_439;
  wire                _zz_440;
  wire                _zz_441;
  wire                _zz_442;
  wire                _zz_443;
  wire                _zz_444;
  wire                _zz_445;
  wire                _zz_446;
  wire                _zz_447;
  wire                _zz_448;
  wire                PmpPlugin_ports_1_hits_0;
  wire                PmpPlugin_ports_1_hits_1;
  wire                PmpPlugin_ports_1_hits_2;
  wire                PmpPlugin_ports_1_hits_3;
  wire                PmpPlugin_ports_1_hits_4;
  wire                PmpPlugin_ports_1_hits_5;
  wire                PmpPlugin_ports_1_hits_6;
  wire                PmpPlugin_ports_1_hits_7;
  wire                PmpPlugin_ports_1_hits_8;
  wire                PmpPlugin_ports_1_hits_9;
  wire                PmpPlugin_ports_1_hits_10;
  wire                PmpPlugin_ports_1_hits_11;
  wire                PmpPlugin_ports_1_hits_12;
  wire                PmpPlugin_ports_1_hits_13;
  wire                PmpPlugin_ports_1_hits_14;
  wire                PmpPlugin_ports_1_hits_15;
  wire       [4:0]    _zz_449;
  wire       [4:0]    _zz_450;
  wire       [4:0]    _zz_451;
  wire       [4:0]    _zz_452;
  wire       [4:0]    _zz_453;
  wire       [4:0]    _zz_454;
  wire       [4:0]    _zz_455;
  wire       [4:0]    _zz_456;
  wire       [15:0]   _zz_457;
  wire       [15:0]   _zz_458;
  wire                _zz_459;
  wire                _zz_460;
  wire                _zz_461;
  wire                _zz_462;
  wire                _zz_463;
  wire                _zz_464;
  wire                _zz_465;
  wire                _zz_466;
  wire                _zz_467;
  wire                _zz_468;
  wire                _zz_469;
  wire                _zz_470;
  wire                _zz_471;
  wire                _zz_472;
  wire                _zz_473;
  wire       [15:0]   _zz_474;
  wire       [15:0]   _zz_475;
  wire                _zz_476;
  wire                _zz_477;
  wire                _zz_478;
  wire                _zz_479;
  wire                _zz_480;
  wire                _zz_481;
  wire                _zz_482;
  wire                _zz_483;
  wire                _zz_484;
  wire                _zz_485;
  wire                _zz_486;
  wire                _zz_487;
  wire                _zz_488;
  wire                _zz_489;
  wire                _zz_490;
  wire       [15:0]   _zz_491;
  wire       [15:0]   _zz_492;
  wire                _zz_493;
  wire                _zz_494;
  wire                _zz_495;
  wire                _zz_496;
  wire                _zz_497;
  wire                _zz_498;
  wire                _zz_499;
  wire                _zz_500;
  wire                _zz_501;
  wire                _zz_502;
  wire                _zz_503;
  wire                _zz_504;
  wire                _zz_505;
  wire                _zz_506;
  wire                _zz_507;
  wire       [31:0]   _zz_508;
  wire                _zz_509;
  wire                _zz_510;
  wire                _zz_511;
  wire                _zz_512;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_513;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_514;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_515;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_516;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_517;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_518;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_519;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_520;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_521;
  reg        [31:0]   _zz_522;
  wire                _zz_523;
  reg        [19:0]   _zz_524;
  wire                _zz_525;
  reg        [19:0]   _zz_526;
  reg        [31:0]   _zz_527;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_528;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_529;
  reg                 _zz_530;
  reg                 _zz_531;
  reg                 _zz_532;
  reg        [4:0]    _zz_533;
  reg        [31:0]   _zz_534;
  wire                _zz_535;
  wire                _zz_536;
  wire                _zz_537;
  wire                _zz_538;
  wire                _zz_539;
  wire                _zz_540;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_541;
  reg                 _zz_542;
  reg                 _zz_543;
  wire                _zz_544;
  reg        [19:0]   _zz_545;
  wire                _zz_546;
  reg        [10:0]   _zz_547;
  wire                _zz_548;
  reg        [18:0]   _zz_549;
  reg                 _zz_550;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_551;
  reg        [19:0]   _zz_552;
  wire                _zz_553;
  reg        [10:0]   _zz_554;
  wire                _zz_555;
  reg        [18:0]   _zz_556;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg        [1:0]    _zz_557;
  reg        [1:0]    CsrPlugin_misa_base;
  reg        [25:0]   CsrPlugin_misa_extensions;
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
  wire                _zz_558;
  wire                _zz_559;
  wire                _zz_560;
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
  wire       [1:0]    _zz_561;
  wire                _zz_562;
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
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire       [31:0]   _zz_563;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_564;
  wire                _zz_565;
  wire                _zz_566;
  reg        [32:0]   _zz_567;
  reg        [31:0]   externalInterruptArray_regNext;
  reg        [31:0]   _zz_568;
  wire       [31:0]   _zz_569;
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
  reg                 decode_to_execute_MEMORY_MANAGMENT;
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
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg                 execute_CsrPlugin_csr_3264;
  reg                 execute_CsrPlugin_csr_944;
  reg                 execute_CsrPlugin_csr_945;
  reg                 execute_CsrPlugin_csr_946;
  reg                 execute_CsrPlugin_csr_947;
  reg                 execute_CsrPlugin_csr_948;
  reg                 execute_CsrPlugin_csr_949;
  reg                 execute_CsrPlugin_csr_950;
  reg                 execute_CsrPlugin_csr_951;
  reg                 execute_CsrPlugin_csr_952;
  reg                 execute_CsrPlugin_csr_953;
  reg                 execute_CsrPlugin_csr_954;
  reg                 execute_CsrPlugin_csr_955;
  reg                 execute_CsrPlugin_csr_956;
  reg                 execute_CsrPlugin_csr_957;
  reg                 execute_CsrPlugin_csr_958;
  reg                 execute_CsrPlugin_csr_959;
  reg                 execute_CsrPlugin_csr_928;
  reg                 execute_CsrPlugin_csr_929;
  reg                 execute_CsrPlugin_csr_930;
  reg                 execute_CsrPlugin_csr_931;
  reg                 execute_CsrPlugin_csr_3857;
  reg                 execute_CsrPlugin_csr_3858;
  reg                 execute_CsrPlugin_csr_3859;
  reg                 execute_CsrPlugin_csr_3860;
  reg                 execute_CsrPlugin_csr_769;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_832;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg                 execute_CsrPlugin_csr_2816;
  reg                 execute_CsrPlugin_csr_2944;
  reg                 execute_CsrPlugin_csr_2818;
  reg                 execute_CsrPlugin_csr_2946;
  reg                 execute_CsrPlugin_csr_3072;
  reg                 execute_CsrPlugin_csr_3200;
  reg                 execute_CsrPlugin_csr_3074;
  reg                 execute_CsrPlugin_csr_3202;
  reg                 execute_CsrPlugin_csr_3008;
  reg                 execute_CsrPlugin_csr_4032;
  reg        [31:0]   _zz_570;
  reg        [31:0]   _zz_571;
  reg        [31:0]   _zz_572;
  reg        [31:0]   _zz_573;
  reg        [31:0]   _zz_574;
  reg        [31:0]   _zz_575;
  reg        [31:0]   _zz_576;
  reg        [31:0]   _zz_577;
  reg        [31:0]   _zz_578;
  reg        [31:0]   _zz_579;
  reg        [31:0]   _zz_580;
  reg        [31:0]   _zz_581;
  reg        [31:0]   _zz_582;
  reg        [31:0]   _zz_583;
  reg        [31:0]   _zz_584;
  reg        [31:0]   _zz_585;
  reg        [31:0]   _zz_586;
  reg        [31:0]   _zz_587;
  reg        [31:0]   _zz_588;
  reg        [31:0]   _zz_589;
  reg        [31:0]   _zz_590;
  reg        [31:0]   _zz_591;
  reg        [31:0]   _zz_592;
  reg        [31:0]   _zz_593;
  reg        [31:0]   _zz_594;
  reg        [31:0]   _zz_595;
  reg        [31:0]   _zz_596;
  reg        [31:0]   _zz_597;
  reg        [31:0]   _zz_598;
  reg        [31:0]   _zz_599;
  reg        [31:0]   _zz_600;
  reg        [31:0]   _zz_601;
  reg        [31:0]   _zz_602;
  reg        [31:0]   _zz_603;
  reg        [31:0]   _zz_604;
  reg        [31:0]   _zz_605;
  reg        [31:0]   _zz_606;
  reg        [31:0]   _zz_607;
  reg        [31:0]   _zz_608;
  reg        [31:0]   _zz_609;
  reg        [31:0]   _zz_610;
  reg        [31:0]   _zz_611;
  reg        [31:0]   _zz_612;
  reg        [2:0]    _zz_613;
  reg                 _zz_614;
  reg        [31:0]   iBusWishbone_DAT_MISO_regNext;
  reg        [2:0]    _zz_615;
  wire                _zz_616;
  wire                _zz_617;
  wire                _zz_618;
  wire                _zz_619;
  wire                _zz_620;
  reg                 _zz_621;
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
  reg [31:0] _zz_8_string;
  reg [31:0] _zz_9_string;
  reg [71:0] _zz_10_string;
  reg [71:0] _zz_11_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_12_string;
  reg [71:0] _zz_13_string;
  reg [71:0] _zz_14_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_15_string;
  reg [39:0] _zz_16_string;
  reg [39:0] _zz_17_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_18_string;
  reg [23:0] _zz_19_string;
  reg [23:0] _zz_20_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_21_string;
  reg [63:0] _zz_22_string;
  reg [63:0] _zz_23_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_24_string;
  reg [95:0] _zz_25_string;
  reg [95:0] _zz_26_string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_27_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_28_string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_29_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_30_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_33_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_34_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_36_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_37_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_38_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_39_string;
  reg [39:0] _zz_43_string;
  reg [31:0] _zz_44_string;
  reg [71:0] _zz_45_string;
  reg [39:0] _zz_46_string;
  reg [23:0] _zz_47_string;
  reg [63:0] _zz_48_string;
  reg [95:0] _zz_49_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_51_string;
  reg [95:0] _zz_513_string;
  reg [63:0] _zz_514_string;
  reg [23:0] _zz_515_string;
  reg [39:0] _zz_516_string;
  reg [71:0] _zz_517_string;
  reg [31:0] _zz_518_string;
  reg [39:0] _zz_519_string;
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

  assign _zz_671 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_672 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_673 = 1'b1;
  assign _zz_674 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_675 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_676 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_677 = ((_zz_627 && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign _zz_678 = ((_zz_627 && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign _zz_679 = ((_zz_627 && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign _zz_680 = ((_zz_627 && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_681 = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_682 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
  assign _zz_683 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_684 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_685 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_686 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_687 = (_zz_816 == 5'h0);
  assign _zz_688 = (_zz_826 == 5'h0);
  assign _zz_689 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_690 = (1'b0 || (! 1'b1));
  assign _zz_691 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_692 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_693 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_694 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_695 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_696 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign _zz_697 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_698 = execute_INSTRUCTION[13 : 12];
  assign _zz_699 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_700 = (! memory_arbitration_isStuck);
  assign _zz_701 = (iBus_cmd_valid || (_zz_613 != 3'b000));
  assign _zz_702 = (_zz_649 && (! dataCache_1_io_mem_cmd_s2mPipe_ready));
  assign _zz_703 = (! _zz_89);
  assign _zz_704 = (! _zz_108);
  assign _zz_705 = (! _zz_127);
  assign _zz_706 = (! _zz_146);
  assign _zz_707 = (! _zz_165);
  assign _zz_708 = (! _zz_184);
  assign _zz_709 = (! _zz_203);
  assign _zz_710 = (! _zz_222);
  assign _zz_711 = (! _zz_241);
  assign _zz_712 = (! _zz_260);
  assign _zz_713 = (! _zz_279);
  assign _zz_714 = (! _zz_298);
  assign _zz_715 = (! _zz_317);
  assign _zz_716 = (! _zz_336);
  assign _zz_717 = (! _zz_355);
  assign _zz_718 = (! _zz_374);
  assign _zz_719 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_720 = ((_zz_558 && 1'b1) && (! 1'b0));
  assign _zz_721 = ((_zz_559 && 1'b1) && (! 1'b0));
  assign _zz_722 = ((_zz_560 && 1'b1) && (! 1'b0));
  assign _zz_723 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_724 = execute_INSTRUCTION[13];
  assign _zz_725 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_726 = ($signed(_zz_727) + $signed(_zz_732));
  assign _zz_727 = ($signed(_zz_728) + $signed(_zz_730));
  assign _zz_728 = 52'h0;
  assign _zz_729 = {1'b0,memory_MUL_LL};
  assign _zz_730 = {{19{_zz_729[32]}}, _zz_729};
  assign _zz_731 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_732 = {{2{_zz_731[49]}}, _zz_731};
  assign _zz_733 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_734 = {{2{_zz_733[49]}}, _zz_733};
  assign _zz_735 = ($signed(_zz_737) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_736 = _zz_735[31 : 0];
  assign _zz_737 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_738 = _zz_508[31 : 31];
  assign _zz_739 = _zz_508[30 : 30];
  assign _zz_740 = _zz_508[29 : 29];
  assign _zz_741 = _zz_508[28 : 28];
  assign _zz_742 = _zz_508[25 : 25];
  assign _zz_743 = _zz_508[17 : 17];
  assign _zz_744 = _zz_508[16 : 16];
  assign _zz_745 = _zz_508[13 : 13];
  assign _zz_746 = _zz_508[12 : 12];
  assign _zz_747 = _zz_508[11 : 11];
  assign _zz_748 = _zz_508[15 : 15];
  assign _zz_749 = _zz_508[5 : 5];
  assign _zz_750 = _zz_508[3 : 3];
  assign _zz_751 = _zz_508[20 : 20];
  assign _zz_752 = _zz_508[10 : 10];
  assign _zz_753 = _zz_508[4 : 4];
  assign _zz_754 = _zz_508[0 : 0];
  assign _zz_755 = (_zz_54 - 4'b0001);
  assign _zz_756 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_757 = {29'd0, _zz_756};
  assign _zz_758 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_759 = {{_zz_69,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_760 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_761 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_762 = {{_zz_71,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_763 = {{_zz_73,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_764 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_765 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_766 = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_767 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz_768 = (_zz_91 + 32'h00000001);
  assign _zz_769 = (_zz_770 <<< 3);
  assign _zz_770 = (_zz_103 + 32'h00000001);
  assign _zz_771 = (_zz_110 + 32'h00000001);
  assign _zz_772 = (_zz_773 <<< 3);
  assign _zz_773 = (_zz_122 + 32'h00000001);
  assign _zz_774 = (_zz_129 + 32'h00000001);
  assign _zz_775 = (_zz_776 <<< 3);
  assign _zz_776 = (_zz_141 + 32'h00000001);
  assign _zz_777 = (_zz_148 + 32'h00000001);
  assign _zz_778 = (_zz_779 <<< 3);
  assign _zz_779 = (_zz_160 + 32'h00000001);
  assign _zz_780 = (_zz_167 + 32'h00000001);
  assign _zz_781 = (_zz_782 <<< 3);
  assign _zz_782 = (_zz_179 + 32'h00000001);
  assign _zz_783 = (_zz_186 + 32'h00000001);
  assign _zz_784 = (_zz_785 <<< 3);
  assign _zz_785 = (_zz_198 + 32'h00000001);
  assign _zz_786 = (_zz_205 + 32'h00000001);
  assign _zz_787 = (_zz_788 <<< 3);
  assign _zz_788 = (_zz_217 + 32'h00000001);
  assign _zz_789 = (_zz_224 + 32'h00000001);
  assign _zz_790 = (_zz_791 <<< 3);
  assign _zz_791 = (_zz_236 + 32'h00000001);
  assign _zz_792 = (_zz_243 + 32'h00000001);
  assign _zz_793 = (_zz_794 <<< 3);
  assign _zz_794 = (_zz_255 + 32'h00000001);
  assign _zz_795 = (_zz_262 + 32'h00000001);
  assign _zz_796 = (_zz_797 <<< 3);
  assign _zz_797 = (_zz_274 + 32'h00000001);
  assign _zz_798 = (_zz_281 + 32'h00000001);
  assign _zz_799 = (_zz_800 <<< 3);
  assign _zz_800 = (_zz_293 + 32'h00000001);
  assign _zz_801 = (_zz_300 + 32'h00000001);
  assign _zz_802 = (_zz_803 <<< 3);
  assign _zz_803 = (_zz_312 + 32'h00000001);
  assign _zz_804 = (_zz_319 + 32'h00000001);
  assign _zz_805 = (_zz_806 <<< 3);
  assign _zz_806 = (_zz_331 + 32'h00000001);
  assign _zz_807 = (_zz_338 + 32'h00000001);
  assign _zz_808 = (_zz_809 <<< 3);
  assign _zz_809 = (_zz_350 + 32'h00000001);
  assign _zz_810 = (_zz_357 + 32'h00000001);
  assign _zz_811 = (_zz_812 <<< 3);
  assign _zz_812 = (_zz_369 + 32'h00000001);
  assign _zz_813 = (_zz_376 + 32'h00000001);
  assign _zz_814 = (_zz_815 <<< 3);
  assign _zz_815 = (_zz_388 + 32'h00000001);
  assign _zz_816 = (_zz_817 + _zz_820);
  assign _zz_817 = (_zz_818 + _zz_819);
  assign _zz_818 = (_zz_653 + _zz_654);
  assign _zz_819 = (_zz_655 + _zz_656);
  assign _zz_820 = (_zz_657 + _zz_658);
  assign _zz_821 = PmpPlugin_ports_0_hits_15;
  assign _zz_822 = {2'd0, _zz_821};
  assign _zz_823 = (_zz_398 - 16'h0001);
  assign _zz_824 = (_zz_415 - 16'h0001);
  assign _zz_825 = (_zz_432 - 16'h0001);
  assign _zz_826 = (_zz_827 + _zz_830);
  assign _zz_827 = (_zz_828 + _zz_829);
  assign _zz_828 = (_zz_662 + _zz_663);
  assign _zz_829 = (_zz_664 + _zz_665);
  assign _zz_830 = (_zz_666 + _zz_667);
  assign _zz_831 = PmpPlugin_ports_1_hits_15;
  assign _zz_832 = {2'd0, _zz_831};
  assign _zz_833 = (_zz_457 - 16'h0001);
  assign _zz_834 = (_zz_474 - 16'h0001);
  assign _zz_835 = (_zz_491 - 16'h0001);
  assign _zz_836 = execute_SRC_LESS;
  assign _zz_837 = 3'b100;
  assign _zz_838 = execute_INSTRUCTION[19 : 15];
  assign _zz_839 = execute_INSTRUCTION[31 : 20];
  assign _zz_840 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_841 = ($signed(_zz_842) + $signed(_zz_845));
  assign _zz_842 = ($signed(_zz_843) + $signed(_zz_844));
  assign _zz_843 = execute_SRC1;
  assign _zz_844 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_845 = (execute_SRC_USE_SUB_LESS ? _zz_846 : _zz_847);
  assign _zz_846 = 32'h00000001;
  assign _zz_847 = 32'h0;
  assign _zz_848 = execute_INSTRUCTION[31 : 20];
  assign _zz_849 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_850 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_851 = {_zz_545,execute_INSTRUCTION[31 : 20]};
  assign _zz_852 = {{_zz_547,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_853 = {{_zz_549,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_854 = execute_INSTRUCTION[31 : 20];
  assign _zz_855 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_856 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_857 = 3'b100;
  assign _zz_858 = (_zz_561 & (~ _zz_859));
  assign _zz_859 = (_zz_561 - 2'b01);
  assign _zz_860 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_861 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_862 = writeBack_MUL_LOW[31 : 0];
  assign _zz_863 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_864 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_865 = {5'd0, _zz_864};
  assign _zz_866 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_867 = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_868 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_869 = {_zz_563,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_870 = _zz_871;
  assign _zz_871 = _zz_872;
  assign _zz_872 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_564) : _zz_564)} + _zz_874);
  assign _zz_873 = memory_DivPlugin_div_needRevert;
  assign _zz_874 = {32'd0, _zz_873};
  assign _zz_875 = _zz_566;
  assign _zz_876 = {32'd0, _zz_875};
  assign _zz_877 = _zz_565;
  assign _zz_878 = {31'd0, _zz_877};
  assign _zz_879 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_880 = execute_CsrPlugin_writeData[23 : 23];
  assign _zz_881 = execute_CsrPlugin_writeData[15 : 15];
  assign _zz_882 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_883 = execute_CsrPlugin_writeData[26 : 26];
  assign _zz_884 = execute_CsrPlugin_writeData[25 : 25];
  assign _zz_885 = execute_CsrPlugin_writeData[24 : 24];
  assign _zz_886 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_887 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_888 = execute_CsrPlugin_writeData[16 : 16];
  assign _zz_889 = execute_CsrPlugin_writeData[10 : 10];
  assign _zz_890 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_891 = execute_CsrPlugin_writeData[8 : 8];
  assign _zz_892 = execute_CsrPlugin_writeData[2 : 2];
  assign _zz_893 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_894 = execute_CsrPlugin_writeData[0 : 0];
  assign _zz_895 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_896 = execute_CsrPlugin_writeData[23 : 23];
  assign _zz_897 = execute_CsrPlugin_writeData[15 : 15];
  assign _zz_898 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_899 = execute_CsrPlugin_writeData[26 : 26];
  assign _zz_900 = execute_CsrPlugin_writeData[25 : 25];
  assign _zz_901 = execute_CsrPlugin_writeData[24 : 24];
  assign _zz_902 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_903 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_904 = execute_CsrPlugin_writeData[16 : 16];
  assign _zz_905 = execute_CsrPlugin_writeData[10 : 10];
  assign _zz_906 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_907 = execute_CsrPlugin_writeData[8 : 8];
  assign _zz_908 = execute_CsrPlugin_writeData[2 : 2];
  assign _zz_909 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_910 = execute_CsrPlugin_writeData[0 : 0];
  assign _zz_911 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_912 = execute_CsrPlugin_writeData[23 : 23];
  assign _zz_913 = execute_CsrPlugin_writeData[15 : 15];
  assign _zz_914 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_915 = execute_CsrPlugin_writeData[26 : 26];
  assign _zz_916 = execute_CsrPlugin_writeData[25 : 25];
  assign _zz_917 = execute_CsrPlugin_writeData[24 : 24];
  assign _zz_918 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_919 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_920 = execute_CsrPlugin_writeData[16 : 16];
  assign _zz_921 = execute_CsrPlugin_writeData[10 : 10];
  assign _zz_922 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_923 = execute_CsrPlugin_writeData[8 : 8];
  assign _zz_924 = execute_CsrPlugin_writeData[2 : 2];
  assign _zz_925 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_926 = execute_CsrPlugin_writeData[0 : 0];
  assign _zz_927 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_928 = execute_CsrPlugin_writeData[23 : 23];
  assign _zz_929 = execute_CsrPlugin_writeData[15 : 15];
  assign _zz_930 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_931 = execute_CsrPlugin_writeData[26 : 26];
  assign _zz_932 = execute_CsrPlugin_writeData[25 : 25];
  assign _zz_933 = execute_CsrPlugin_writeData[24 : 24];
  assign _zz_934 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_935 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_936 = execute_CsrPlugin_writeData[16 : 16];
  assign _zz_937 = execute_CsrPlugin_writeData[10 : 10];
  assign _zz_938 = execute_CsrPlugin_writeData[9 : 9];
  assign _zz_939 = execute_CsrPlugin_writeData[8 : 8];
  assign _zz_940 = execute_CsrPlugin_writeData[2 : 2];
  assign _zz_941 = execute_CsrPlugin_writeData[1 : 1];
  assign _zz_942 = execute_CsrPlugin_writeData[0 : 0];
  assign _zz_943 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_944 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_945 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_946 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_947 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_948 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_949 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_950 = (iBus_cmd_payload_address >>> 5);
  assign _zz_951 = 1'b1;
  assign _zz_952 = 1'b1;
  assign _zz_953 = {_zz_58,_zz_57};
  assign _zz_954 = {PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}};
  assign _zz_955 = {PmpPlugin_ports_0_hits_5,{PmpPlugin_ports_0_hits_4,PmpPlugin_ports_0_hits_3}};
  assign _zz_956 = {PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,PmpPlugin_ports_0_hits_6}};
  assign _zz_957 = {PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,PmpPlugin_ports_0_hits_9}};
  assign _zz_958 = {PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,PmpPlugin_ports_0_hits_12}};
  assign _zz_959 = {_zz_414,{_zz_413,{_zz_412,_zz_411}}};
  assign _zz_960 = {_zz_431,{_zz_430,{_zz_429,_zz_428}}};
  assign _zz_961 = {_zz_448,{_zz_447,{_zz_446,_zz_445}}};
  assign _zz_962 = {PmpPlugin_ports_1_hits_2,{PmpPlugin_ports_1_hits_1,PmpPlugin_ports_1_hits_0}};
  assign _zz_963 = {PmpPlugin_ports_1_hits_5,{PmpPlugin_ports_1_hits_4,PmpPlugin_ports_1_hits_3}};
  assign _zz_964 = {PmpPlugin_ports_1_hits_8,{PmpPlugin_ports_1_hits_7,PmpPlugin_ports_1_hits_6}};
  assign _zz_965 = {PmpPlugin_ports_1_hits_11,{PmpPlugin_ports_1_hits_10,PmpPlugin_ports_1_hits_9}};
  assign _zz_966 = {PmpPlugin_ports_1_hits_14,{PmpPlugin_ports_1_hits_13,PmpPlugin_ports_1_hits_12}};
  assign _zz_967 = {_zz_473,{_zz_472,{_zz_471,_zz_470}}};
  assign _zz_968 = {_zz_490,{_zz_489,{_zz_488,_zz_487}}};
  assign _zz_969 = {_zz_507,{_zz_506,{_zz_505,_zz_504}}};
  assign _zz_970 = 32'h0000107f;
  assign _zz_971 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_972 = 32'h00002073;
  assign _zz_973 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_974 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_975 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_976) == 32'h00000003),{(_zz_977 == _zz_978),{_zz_979,{_zz_980,_zz_981}}}}}};
  assign _zz_976 = 32'h0000505f;
  assign _zz_977 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_978 = 32'h00000063;
  assign _zz_979 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_980 = ((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033);
  assign _zz_981 = {((decode_INSTRUCTION & 32'h01f0707f) == 32'h0000500f),{((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & _zz_982) == 32'h00001013),{(_zz_983 == _zz_984),{_zz_985,{_zz_986,_zz_987}}}}}};
  assign _zz_982 = 32'hfc00307f;
  assign _zz_983 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_984 = 32'h00005033;
  assign _zz_985 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_986 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_987 = {((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073),((decode_INSTRUCTION & 32'hffffffff) == 32'h00000073)};
  assign _zz_988 = decode_INSTRUCTION[31];
  assign _zz_989 = decode_INSTRUCTION[31];
  assign _zz_990 = decode_INSTRUCTION[7];
  assign _zz_991 = PmpPlugin_ports_0_hits_5;
  assign _zz_992 = {PmpPlugin_ports_0_hits_4,{PmpPlugin_ports_0_hits_3,{PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}}}};
  assign _zz_993 = PmpPlugin_ports_0_hits_5;
  assign _zz_994 = {PmpPlugin_ports_0_hits_4,{PmpPlugin_ports_0_hits_3,{PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}}}};
  assign _zz_995 = PmpPlugin_ports_0_hits_5;
  assign _zz_996 = {PmpPlugin_ports_0_hits_4,{PmpPlugin_ports_0_hits_3,{PmpPlugin_ports_0_hits_2,{PmpPlugin_ports_0_hits_1,PmpPlugin_ports_0_hits_0}}}};
  assign _zz_997 = PmpPlugin_ports_1_hits_5;
  assign _zz_998 = {PmpPlugin_ports_1_hits_4,{PmpPlugin_ports_1_hits_3,{PmpPlugin_ports_1_hits_2,{PmpPlugin_ports_1_hits_1,PmpPlugin_ports_1_hits_0}}}};
  assign _zz_999 = PmpPlugin_ports_1_hits_5;
  assign _zz_1000 = {PmpPlugin_ports_1_hits_4,{PmpPlugin_ports_1_hits_3,{PmpPlugin_ports_1_hits_2,{PmpPlugin_ports_1_hits_1,PmpPlugin_ports_1_hits_0}}}};
  assign _zz_1001 = PmpPlugin_ports_1_hits_5;
  assign _zz_1002 = {PmpPlugin_ports_1_hits_4,{PmpPlugin_ports_1_hits_3,{PmpPlugin_ports_1_hits_2,{PmpPlugin_ports_1_hits_1,PmpPlugin_ports_1_hits_0}}}};
  assign _zz_1003 = (decode_INSTRUCTION & 32'h02004064);
  assign _zz_1004 = 32'h02004020;
  assign _zz_1005 = ((decode_INSTRUCTION & 32'h02004074) == 32'h02000030);
  assign _zz_1006 = ((decode_INSTRUCTION & 32'h00203050) == 32'h00000050);
  assign _zz_1007 = 1'b0;
  assign _zz_1008 = (((decode_INSTRUCTION & _zz_1011) == 32'h00000050) != 1'b0);
  assign _zz_1009 = ({_zz_1012,_zz_1013} != 2'b00);
  assign _zz_1010 = {({_zz_1014,_zz_1015} != 2'b00),{(_zz_1016 != _zz_1017),{_zz_1018,{_zz_1019,_zz_1020}}}};
  assign _zz_1011 = 32'h00403050;
  assign _zz_1012 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_1013 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_1014 = _zz_511;
  assign _zz_1015 = ((decode_INSTRUCTION & _zz_1021) == 32'h00000004);
  assign _zz_1016 = ((decode_INSTRUCTION & _zz_1022) == 32'h00000040);
  assign _zz_1017 = 1'b0;
  assign _zz_1018 = ({_zz_1023,_zz_1024} != 2'b00);
  assign _zz_1019 = ({_zz_1025,_zz_1026} != 3'b000);
  assign _zz_1020 = {(_zz_1027 != _zz_1028),{_zz_1029,{_zz_1030,_zz_1031}}};
  assign _zz_1021 = 32'h0000001c;
  assign _zz_1022 = 32'h00000058;
  assign _zz_1023 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00005010);
  assign _zz_1024 = ((decode_INSTRUCTION & 32'h02007064) == 32'h00005020);
  assign _zz_1025 = ((decode_INSTRUCTION & _zz_1032) == 32'h40001010);
  assign _zz_1026 = {(_zz_1033 == _zz_1034),(_zz_1035 == _zz_1036)};
  assign _zz_1027 = ((decode_INSTRUCTION & _zz_1037) == 32'h00000024);
  assign _zz_1028 = 1'b0;
  assign _zz_1029 = ((_zz_1038 == _zz_1039) != 1'b0);
  assign _zz_1030 = (_zz_1040 != 1'b0);
  assign _zz_1031 = {(_zz_1041 != _zz_1042),{_zz_1043,{_zz_1044,_zz_1045}}};
  assign _zz_1032 = 32'h40003054;
  assign _zz_1033 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz_1034 = 32'h00001010;
  assign _zz_1035 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz_1036 = 32'h00001010;
  assign _zz_1037 = 32'h00000064;
  assign _zz_1038 = (decode_INSTRUCTION & 32'h00001000);
  assign _zz_1039 = 32'h00001000;
  assign _zz_1040 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_1041 = {(_zz_1046 == _zz_1047),(_zz_1048 == _zz_1049)};
  assign _zz_1042 = 2'b00;
  assign _zz_1043 = ((_zz_1050 == _zz_1051) != 1'b0);
  assign _zz_1044 = ({_zz_1052,_zz_1053} != 2'b00);
  assign _zz_1045 = {(_zz_1054 != _zz_1055),{_zz_1056,{_zz_1057,_zz_1058}}};
  assign _zz_1046 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_1047 = 32'h00002000;
  assign _zz_1048 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_1049 = 32'h00001000;
  assign _zz_1050 = (decode_INSTRUCTION & 32'h00004048);
  assign _zz_1051 = 32'h00004008;
  assign _zz_1052 = ((decode_INSTRUCTION & _zz_1059) == 32'h00000020);
  assign _zz_1053 = ((decode_INSTRUCTION & _zz_1060) == 32'h00000020);
  assign _zz_1054 = {(_zz_1061 == _zz_1062),{_zz_1063,{_zz_1064,_zz_1065}}};
  assign _zz_1055 = 5'h0;
  assign _zz_1056 = ((_zz_1066 == _zz_1067) != 1'b0);
  assign _zz_1057 = ({_zz_1068,_zz_1069} != 5'h0);
  assign _zz_1058 = {(_zz_1070 != _zz_1071),{_zz_1072,{_zz_1073,_zz_1074}}};
  assign _zz_1059 = 32'h00000034;
  assign _zz_1060 = 32'h00000064;
  assign _zz_1061 = (decode_INSTRUCTION & 32'h00002040);
  assign _zz_1062 = 32'h00002040;
  assign _zz_1063 = ((decode_INSTRUCTION & _zz_1075) == 32'h00001040);
  assign _zz_1064 = (_zz_1076 == _zz_1077);
  assign _zz_1065 = {_zz_1078,_zz_1079};
  assign _zz_1066 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_1067 = 32'h00000020;
  assign _zz_1068 = (_zz_1080 == _zz_1081);
  assign _zz_1069 = {_zz_510,{_zz_1082,_zz_1083}};
  assign _zz_1070 = {_zz_510,{_zz_1084,_zz_1085}};
  assign _zz_1071 = 5'h0;
  assign _zz_1072 = ({_zz_1086,_zz_1087} != 6'h0);
  assign _zz_1073 = (_zz_1088 != _zz_1089);
  assign _zz_1074 = {_zz_1090,{_zz_1091,_zz_1092}};
  assign _zz_1075 = 32'h00001040;
  assign _zz_1076 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_1077 = 32'h00000040;
  assign _zz_1078 = ((decode_INSTRUCTION & _zz_1093) == 32'h00000040);
  assign _zz_1079 = ((decode_INSTRUCTION & _zz_1094) == 32'h0);
  assign _zz_1080 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz_1081 = 32'h00000040;
  assign _zz_1082 = (_zz_1095 == _zz_1096);
  assign _zz_1083 = {_zz_1097,_zz_1098};
  assign _zz_1084 = (_zz_1099 == _zz_1100);
  assign _zz_1085 = {_zz_1101,{_zz_1102,_zz_1103}};
  assign _zz_1086 = _zz_511;
  assign _zz_1087 = {_zz_1104,{_zz_1105,_zz_1106}};
  assign _zz_1088 = {_zz_510,_zz_1107};
  assign _zz_1089 = 2'b00;
  assign _zz_1090 = ({_zz_1108,_zz_1109} != 2'b00);
  assign _zz_1091 = (_zz_1110 != _zz_1111);
  assign _zz_1092 = {_zz_1112,{_zz_1113,_zz_1114}};
  assign _zz_1093 = 32'h00400040;
  assign _zz_1094 = 32'h00000038;
  assign _zz_1095 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz_1096 = 32'h00004020;
  assign _zz_1097 = ((decode_INSTRUCTION & _zz_1115) == 32'h00000010);
  assign _zz_1098 = ((decode_INSTRUCTION & _zz_1116) == 32'h00000020);
  assign _zz_1099 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz_1100 = 32'h00002010;
  assign _zz_1101 = ((decode_INSTRUCTION & _zz_1117) == 32'h00000010);
  assign _zz_1102 = (_zz_1118 == _zz_1119);
  assign _zz_1103 = (_zz_1120 == _zz_1121);
  assign _zz_1104 = ((decode_INSTRUCTION & _zz_1122) == 32'h00001010);
  assign _zz_1105 = (_zz_1123 == _zz_1124);
  assign _zz_1106 = {_zz_1125,{_zz_1126,_zz_1127}};
  assign _zz_1107 = ((decode_INSTRUCTION & _zz_1128) == 32'h00000020);
  assign _zz_1108 = _zz_510;
  assign _zz_1109 = (_zz_1129 == _zz_1130);
  assign _zz_1110 = (_zz_1131 == _zz_1132);
  assign _zz_1111 = 1'b0;
  assign _zz_1112 = (_zz_1133 != 1'b0);
  assign _zz_1113 = (_zz_1134 != _zz_1135);
  assign _zz_1114 = {_zz_1136,{_zz_1137,_zz_1138}};
  assign _zz_1115 = 32'h00000030;
  assign _zz_1116 = 32'h02000020;
  assign _zz_1117 = 32'h00001030;
  assign _zz_1118 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz_1119 = 32'h00002020;
  assign _zz_1120 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz_1121 = 32'h00000020;
  assign _zz_1122 = 32'h00001010;
  assign _zz_1123 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_1124 = 32'h00002010;
  assign _zz_1125 = ((decode_INSTRUCTION & _zz_1139) == 32'h00000010);
  assign _zz_1126 = (_zz_1140 == _zz_1141);
  assign _zz_1127 = (_zz_1142 == _zz_1143);
  assign _zz_1128 = 32'h00000070;
  assign _zz_1129 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_1130 = 32'h0;
  assign _zz_1131 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz_1132 = 32'h00004010;
  assign _zz_1133 = ((decode_INSTRUCTION & _zz_1144) == 32'h00002010);
  assign _zz_1134 = {_zz_1145,{_zz_1146,_zz_1147}};
  assign _zz_1135 = 4'b0000;
  assign _zz_1136 = (_zz_1148 != 1'b0);
  assign _zz_1137 = (_zz_1149 != _zz_1150);
  assign _zz_1138 = {_zz_1151,{_zz_1152,_zz_1153}};
  assign _zz_1139 = 32'h00000050;
  assign _zz_1140 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz_1141 = 32'h00000004;
  assign _zz_1142 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_1143 = 32'h0;
  assign _zz_1144 = 32'h00006014;
  assign _zz_1145 = ((decode_INSTRUCTION & 32'h00000044) == 32'h0);
  assign _zz_1146 = ((decode_INSTRUCTION & _zz_1154) == 32'h0);
  assign _zz_1147 = {(_zz_1155 == _zz_1156),(_zz_1157 == _zz_1158)};
  assign _zz_1148 = ((decode_INSTRUCTION & 32'h00000058) == 32'h0);
  assign _zz_1149 = {(_zz_1159 == _zz_1160),{_zz_1161,_zz_1162}};
  assign _zz_1150 = 3'b000;
  assign _zz_1151 = ({_zz_1163,_zz_509} != 2'b00);
  assign _zz_1152 = ({_zz_1164,_zz_1165} != 2'b00);
  assign _zz_1153 = (_zz_1166 != 1'b0);
  assign _zz_1154 = 32'h00000018;
  assign _zz_1155 = (decode_INSTRUCTION & 32'h00006004);
  assign _zz_1156 = 32'h00002000;
  assign _zz_1157 = (decode_INSTRUCTION & 32'h00005004);
  assign _zz_1158 = 32'h00001000;
  assign _zz_1159 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_1160 = 32'h00000040;
  assign _zz_1161 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz_1162 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz_1163 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_1164 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_1165 = _zz_509;
  assign _zz_1166 = ((decode_INSTRUCTION & 32'h00005048) == 32'h00001008);
  assign _zz_1167 = execute_INSTRUCTION[31];
  assign _zz_1168 = execute_INSTRUCTION[31];
  assign _zz_1169 = execute_INSTRUCTION[7];
  assign _zz_1170 = (_zz_570 | _zz_571);
  assign _zz_1171 = (_zz_572 | _zz_573);
  assign _zz_1172 = (_zz_574 | _zz_575);
  assign _zz_1173 = (_zz_576 | _zz_577);
  assign _zz_1174 = (_zz_578 | _zz_579);
  assign _zz_1175 = (_zz_580 | _zz_581);
  assign _zz_1176 = (_zz_582 | _zz_583);
  assign _zz_1177 = (_zz_584 | _zz_585);
  assign _zz_1178 = (_zz_586 | _zz_587);
  assign _zz_1179 = (_zz_588 | _zz_589);
  assign _zz_1180 = (_zz_590 | _zz_591);
  assign _zz_1181 = (_zz_592 | _zz_593);
  assign _zz_1182 = (_zz_1186 | _zz_594);
  assign _zz_1183 = (_zz_595 | _zz_596);
  assign _zz_1184 = (_zz_597 | _zz_598);
  assign _zz_1185 = (_zz_599 | _zz_600);
  assign _zz_1186 = 32'h0;
  always @ (posedge clk) begin
    if(_zz_951) begin
      _zz_650 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_952) begin
      _zz_651 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_42) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (_zz_622                                                     ), //i
    .io_cpu_prefetch_isValid                  (_zz_623                                                     ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt               ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]       ), //i
    .io_cpu_fetch_isValid                     (_zz_624                                                     ), //i
    .io_cpu_fetch_isStuck                     (_zz_625                                                     ), //i
    .io_cpu_fetch_isRemoved                   (_zz_626                                                     ), //i
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
    .io_cpu_decode_isValid                    (_zz_627                                                     ), //i
    .io_cpu_decode_isStuck                    (_zz_628                                                     ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss              ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error                  ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling           ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException           ), //o
    .io_cpu_decode_isUser                     (_zz_629                                                     ), //i
    .io_cpu_fill_valid                        (_zz_630                                                     ), //i
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
    .io_cpu_execute_isValid                    (_zz_631                                            ), //i
    .io_cpu_execute_address                    (_zz_632[31:0]                                      ), //i
    .io_cpu_execute_haltIt                     (dataCache_1_io_cpu_execute_haltIt                  ), //o
    .io_cpu_execute_args_wr                    (execute_MEMORY_WR                                  ), //i
    .io_cpu_execute_args_data                  (_zz_81[31:0]                                       ), //i
    .io_cpu_execute_args_size                  (execute_DBusCachedPlugin_size[1:0]                 ), //i
    .io_cpu_execute_args_totalyConsistent      (execute_MEMORY_FORCE_CONSTISTENCY                  ), //i
    .io_cpu_execute_refilling                  (dataCache_1_io_cpu_execute_refilling               ), //o
    .io_cpu_memory_isValid                     (_zz_633                                            ), //i
    .io_cpu_memory_isStuck                     (memory_arbitration_isStuck                         ), //i
    .io_cpu_memory_isWrite                     (dataCache_1_io_cpu_memory_isWrite                  ), //o
    .io_cpu_memory_address                     (_zz_634[31:0]                                      ), //i
    .io_cpu_memory_mmuRsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]  ), //i
    .io_cpu_memory_mmuRsp_isIoAccess           (_zz_635                                            ), //i
    .io_cpu_memory_mmuRsp_isPaging             (DBusCachedPlugin_mmuBus_rsp_isPaging               ), //i
    .io_cpu_memory_mmuRsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead              ), //i
    .io_cpu_memory_mmuRsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite             ), //i
    .io_cpu_memory_mmuRsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute           ), //i
    .io_cpu_memory_mmuRsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception              ), //i
    .io_cpu_memory_mmuRsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling              ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation    (DBusCachedPlugin_mmuBus_rsp_bypassTranslation      ), //i
    .io_cpu_writeBack_isValid                  (_zz_636                                            ), //i
    .io_cpu_writeBack_isStuck                  (writeBack_arbitration_isStuck                      ), //i
    .io_cpu_writeBack_isUser                   (_zz_637                                            ), //i
    .io_cpu_writeBack_haltIt                   (dataCache_1_io_cpu_writeBack_haltIt                ), //o
    .io_cpu_writeBack_isWrite                  (dataCache_1_io_cpu_writeBack_isWrite               ), //o
    .io_cpu_writeBack_data                     (dataCache_1_io_cpu_writeBack_data[31:0]            ), //o
    .io_cpu_writeBack_address                  (_zz_638[31:0]                                      ), //i
    .io_cpu_writeBack_mmuException             (dataCache_1_io_cpu_writeBack_mmuException          ), //o
    .io_cpu_writeBack_unalignedAccess          (dataCache_1_io_cpu_writeBack_unalignedAccess       ), //o
    .io_cpu_writeBack_accessError              (dataCache_1_io_cpu_writeBack_accessError           ), //o
    .io_cpu_writeBack_keepMemRspData           (dataCache_1_io_cpu_writeBack_keepMemRspData        ), //o
    .io_cpu_writeBack_fence_SW                 (_zz_639                                            ), //i
    .io_cpu_writeBack_fence_SR                 (_zz_640                                            ), //i
    .io_cpu_writeBack_fence_SO                 (_zz_641                                            ), //i
    .io_cpu_writeBack_fence_SI                 (_zz_642                                            ), //i
    .io_cpu_writeBack_fence_PW                 (_zz_643                                            ), //i
    .io_cpu_writeBack_fence_PR                 (_zz_644                                            ), //i
    .io_cpu_writeBack_fence_PO                 (_zz_645                                            ), //i
    .io_cpu_writeBack_fence_PI                 (_zz_646                                            ), //i
    .io_cpu_writeBack_fence_FM                 (_zz_647[3:0]                                       ), //i
    .io_cpu_redo                               (dataCache_1_io_cpu_redo                            ), //o
    .io_cpu_flush_valid                        (_zz_648                                            ), //i
    .io_cpu_flush_ready                        (dataCache_1_io_cpu_flush_ready                     ), //o
    .io_mem_cmd_valid                          (dataCache_1_io_mem_cmd_valid                       ), //o
    .io_mem_cmd_ready                          (_zz_649                                            ), //i
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
    case(_zz_953)
      2'b00 : begin
        _zz_652 = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_652 = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_652 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_652 = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_954)
      3'b000 : begin
        _zz_653 = _zz_390;
      end
      3'b001 : begin
        _zz_653 = _zz_391;
      end
      3'b010 : begin
        _zz_653 = _zz_392;
      end
      3'b011 : begin
        _zz_653 = _zz_393;
      end
      3'b100 : begin
        _zz_653 = _zz_394;
      end
      3'b101 : begin
        _zz_653 = _zz_395;
      end
      3'b110 : begin
        _zz_653 = _zz_396;
      end
      default : begin
        _zz_653 = _zz_397;
      end
    endcase
  end

  always @(*) begin
    case(_zz_955)
      3'b000 : begin
        _zz_654 = _zz_390;
      end
      3'b001 : begin
        _zz_654 = _zz_391;
      end
      3'b010 : begin
        _zz_654 = _zz_392;
      end
      3'b011 : begin
        _zz_654 = _zz_393;
      end
      3'b100 : begin
        _zz_654 = _zz_394;
      end
      3'b101 : begin
        _zz_654 = _zz_395;
      end
      3'b110 : begin
        _zz_654 = _zz_396;
      end
      default : begin
        _zz_654 = _zz_397;
      end
    endcase
  end

  always @(*) begin
    case(_zz_956)
      3'b000 : begin
        _zz_655 = _zz_390;
      end
      3'b001 : begin
        _zz_655 = _zz_391;
      end
      3'b010 : begin
        _zz_655 = _zz_392;
      end
      3'b011 : begin
        _zz_655 = _zz_393;
      end
      3'b100 : begin
        _zz_655 = _zz_394;
      end
      3'b101 : begin
        _zz_655 = _zz_395;
      end
      3'b110 : begin
        _zz_655 = _zz_396;
      end
      default : begin
        _zz_655 = _zz_397;
      end
    endcase
  end

  always @(*) begin
    case(_zz_957)
      3'b000 : begin
        _zz_656 = _zz_390;
      end
      3'b001 : begin
        _zz_656 = _zz_391;
      end
      3'b010 : begin
        _zz_656 = _zz_392;
      end
      3'b011 : begin
        _zz_656 = _zz_393;
      end
      3'b100 : begin
        _zz_656 = _zz_394;
      end
      3'b101 : begin
        _zz_656 = _zz_395;
      end
      3'b110 : begin
        _zz_656 = _zz_396;
      end
      default : begin
        _zz_656 = _zz_397;
      end
    endcase
  end

  always @(*) begin
    case(_zz_958)
      3'b000 : begin
        _zz_657 = _zz_390;
      end
      3'b001 : begin
        _zz_657 = _zz_391;
      end
      3'b010 : begin
        _zz_657 = _zz_392;
      end
      3'b011 : begin
        _zz_657 = _zz_393;
      end
      3'b100 : begin
        _zz_657 = _zz_394;
      end
      3'b101 : begin
        _zz_657 = _zz_395;
      end
      3'b110 : begin
        _zz_657 = _zz_396;
      end
      default : begin
        _zz_657 = _zz_397;
      end
    endcase
  end

  always @(*) begin
    case(_zz_822)
      3'b000 : begin
        _zz_658 = _zz_390;
      end
      3'b001 : begin
        _zz_658 = _zz_391;
      end
      3'b010 : begin
        _zz_658 = _zz_392;
      end
      3'b011 : begin
        _zz_658 = _zz_393;
      end
      3'b100 : begin
        _zz_658 = _zz_394;
      end
      3'b101 : begin
        _zz_658 = _zz_395;
      end
      3'b110 : begin
        _zz_658 = _zz_396;
      end
      default : begin
        _zz_658 = _zz_397;
      end
    endcase
  end

  always @(*) begin
    case(_zz_959)
      4'b0000 : begin
        _zz_659 = _zz_86;
      end
      4'b0001 : begin
        _zz_659 = _zz_105;
      end
      4'b0010 : begin
        _zz_659 = _zz_124;
      end
      4'b0011 : begin
        _zz_659 = _zz_143;
      end
      4'b0100 : begin
        _zz_659 = _zz_162;
      end
      4'b0101 : begin
        _zz_659 = _zz_181;
      end
      4'b0110 : begin
        _zz_659 = _zz_200;
      end
      4'b0111 : begin
        _zz_659 = _zz_219;
      end
      4'b1000 : begin
        _zz_659 = _zz_238;
      end
      4'b1001 : begin
        _zz_659 = _zz_257;
      end
      4'b1010 : begin
        _zz_659 = _zz_276;
      end
      4'b1011 : begin
        _zz_659 = _zz_295;
      end
      4'b1100 : begin
        _zz_659 = _zz_314;
      end
      4'b1101 : begin
        _zz_659 = _zz_333;
      end
      4'b1110 : begin
        _zz_659 = _zz_352;
      end
      default : begin
        _zz_659 = _zz_371;
      end
    endcase
  end

  always @(*) begin
    case(_zz_960)
      4'b0000 : begin
        _zz_660 = _zz_87;
      end
      4'b0001 : begin
        _zz_660 = _zz_106;
      end
      4'b0010 : begin
        _zz_660 = _zz_125;
      end
      4'b0011 : begin
        _zz_660 = _zz_144;
      end
      4'b0100 : begin
        _zz_660 = _zz_163;
      end
      4'b0101 : begin
        _zz_660 = _zz_182;
      end
      4'b0110 : begin
        _zz_660 = _zz_201;
      end
      4'b0111 : begin
        _zz_660 = _zz_220;
      end
      4'b1000 : begin
        _zz_660 = _zz_239;
      end
      4'b1001 : begin
        _zz_660 = _zz_258;
      end
      4'b1010 : begin
        _zz_660 = _zz_277;
      end
      4'b1011 : begin
        _zz_660 = _zz_296;
      end
      4'b1100 : begin
        _zz_660 = _zz_315;
      end
      4'b1101 : begin
        _zz_660 = _zz_334;
      end
      4'b1110 : begin
        _zz_660 = _zz_353;
      end
      default : begin
        _zz_660 = _zz_372;
      end
    endcase
  end

  always @(*) begin
    case(_zz_961)
      4'b0000 : begin
        _zz_661 = _zz_88;
      end
      4'b0001 : begin
        _zz_661 = _zz_107;
      end
      4'b0010 : begin
        _zz_661 = _zz_126;
      end
      4'b0011 : begin
        _zz_661 = _zz_145;
      end
      4'b0100 : begin
        _zz_661 = _zz_164;
      end
      4'b0101 : begin
        _zz_661 = _zz_183;
      end
      4'b0110 : begin
        _zz_661 = _zz_202;
      end
      4'b0111 : begin
        _zz_661 = _zz_221;
      end
      4'b1000 : begin
        _zz_661 = _zz_240;
      end
      4'b1001 : begin
        _zz_661 = _zz_259;
      end
      4'b1010 : begin
        _zz_661 = _zz_278;
      end
      4'b1011 : begin
        _zz_661 = _zz_297;
      end
      4'b1100 : begin
        _zz_661 = _zz_316;
      end
      4'b1101 : begin
        _zz_661 = _zz_335;
      end
      4'b1110 : begin
        _zz_661 = _zz_354;
      end
      default : begin
        _zz_661 = _zz_373;
      end
    endcase
  end

  always @(*) begin
    case(_zz_962)
      3'b000 : begin
        _zz_662 = _zz_449;
      end
      3'b001 : begin
        _zz_662 = _zz_450;
      end
      3'b010 : begin
        _zz_662 = _zz_451;
      end
      3'b011 : begin
        _zz_662 = _zz_452;
      end
      3'b100 : begin
        _zz_662 = _zz_453;
      end
      3'b101 : begin
        _zz_662 = _zz_454;
      end
      3'b110 : begin
        _zz_662 = _zz_455;
      end
      default : begin
        _zz_662 = _zz_456;
      end
    endcase
  end

  always @(*) begin
    case(_zz_963)
      3'b000 : begin
        _zz_663 = _zz_449;
      end
      3'b001 : begin
        _zz_663 = _zz_450;
      end
      3'b010 : begin
        _zz_663 = _zz_451;
      end
      3'b011 : begin
        _zz_663 = _zz_452;
      end
      3'b100 : begin
        _zz_663 = _zz_453;
      end
      3'b101 : begin
        _zz_663 = _zz_454;
      end
      3'b110 : begin
        _zz_663 = _zz_455;
      end
      default : begin
        _zz_663 = _zz_456;
      end
    endcase
  end

  always @(*) begin
    case(_zz_964)
      3'b000 : begin
        _zz_664 = _zz_449;
      end
      3'b001 : begin
        _zz_664 = _zz_450;
      end
      3'b010 : begin
        _zz_664 = _zz_451;
      end
      3'b011 : begin
        _zz_664 = _zz_452;
      end
      3'b100 : begin
        _zz_664 = _zz_453;
      end
      3'b101 : begin
        _zz_664 = _zz_454;
      end
      3'b110 : begin
        _zz_664 = _zz_455;
      end
      default : begin
        _zz_664 = _zz_456;
      end
    endcase
  end

  always @(*) begin
    case(_zz_965)
      3'b000 : begin
        _zz_665 = _zz_449;
      end
      3'b001 : begin
        _zz_665 = _zz_450;
      end
      3'b010 : begin
        _zz_665 = _zz_451;
      end
      3'b011 : begin
        _zz_665 = _zz_452;
      end
      3'b100 : begin
        _zz_665 = _zz_453;
      end
      3'b101 : begin
        _zz_665 = _zz_454;
      end
      3'b110 : begin
        _zz_665 = _zz_455;
      end
      default : begin
        _zz_665 = _zz_456;
      end
    endcase
  end

  always @(*) begin
    case(_zz_966)
      3'b000 : begin
        _zz_666 = _zz_449;
      end
      3'b001 : begin
        _zz_666 = _zz_450;
      end
      3'b010 : begin
        _zz_666 = _zz_451;
      end
      3'b011 : begin
        _zz_666 = _zz_452;
      end
      3'b100 : begin
        _zz_666 = _zz_453;
      end
      3'b101 : begin
        _zz_666 = _zz_454;
      end
      3'b110 : begin
        _zz_666 = _zz_455;
      end
      default : begin
        _zz_666 = _zz_456;
      end
    endcase
  end

  always @(*) begin
    case(_zz_832)
      3'b000 : begin
        _zz_667 = _zz_449;
      end
      3'b001 : begin
        _zz_667 = _zz_450;
      end
      3'b010 : begin
        _zz_667 = _zz_451;
      end
      3'b011 : begin
        _zz_667 = _zz_452;
      end
      3'b100 : begin
        _zz_667 = _zz_453;
      end
      3'b101 : begin
        _zz_667 = _zz_454;
      end
      3'b110 : begin
        _zz_667 = _zz_455;
      end
      default : begin
        _zz_667 = _zz_456;
      end
    endcase
  end

  always @(*) begin
    case(_zz_967)
      4'b0000 : begin
        _zz_668 = _zz_86;
      end
      4'b0001 : begin
        _zz_668 = _zz_105;
      end
      4'b0010 : begin
        _zz_668 = _zz_124;
      end
      4'b0011 : begin
        _zz_668 = _zz_143;
      end
      4'b0100 : begin
        _zz_668 = _zz_162;
      end
      4'b0101 : begin
        _zz_668 = _zz_181;
      end
      4'b0110 : begin
        _zz_668 = _zz_200;
      end
      4'b0111 : begin
        _zz_668 = _zz_219;
      end
      4'b1000 : begin
        _zz_668 = _zz_238;
      end
      4'b1001 : begin
        _zz_668 = _zz_257;
      end
      4'b1010 : begin
        _zz_668 = _zz_276;
      end
      4'b1011 : begin
        _zz_668 = _zz_295;
      end
      4'b1100 : begin
        _zz_668 = _zz_314;
      end
      4'b1101 : begin
        _zz_668 = _zz_333;
      end
      4'b1110 : begin
        _zz_668 = _zz_352;
      end
      default : begin
        _zz_668 = _zz_371;
      end
    endcase
  end

  always @(*) begin
    case(_zz_968)
      4'b0000 : begin
        _zz_669 = _zz_87;
      end
      4'b0001 : begin
        _zz_669 = _zz_106;
      end
      4'b0010 : begin
        _zz_669 = _zz_125;
      end
      4'b0011 : begin
        _zz_669 = _zz_144;
      end
      4'b0100 : begin
        _zz_669 = _zz_163;
      end
      4'b0101 : begin
        _zz_669 = _zz_182;
      end
      4'b0110 : begin
        _zz_669 = _zz_201;
      end
      4'b0111 : begin
        _zz_669 = _zz_220;
      end
      4'b1000 : begin
        _zz_669 = _zz_239;
      end
      4'b1001 : begin
        _zz_669 = _zz_258;
      end
      4'b1010 : begin
        _zz_669 = _zz_277;
      end
      4'b1011 : begin
        _zz_669 = _zz_296;
      end
      4'b1100 : begin
        _zz_669 = _zz_315;
      end
      4'b1101 : begin
        _zz_669 = _zz_334;
      end
      4'b1110 : begin
        _zz_669 = _zz_353;
      end
      default : begin
        _zz_669 = _zz_372;
      end
    endcase
  end

  always @(*) begin
    case(_zz_969)
      4'b0000 : begin
        _zz_670 = _zz_88;
      end
      4'b0001 : begin
        _zz_670 = _zz_107;
      end
      4'b0010 : begin
        _zz_670 = _zz_126;
      end
      4'b0011 : begin
        _zz_670 = _zz_145;
      end
      4'b0100 : begin
        _zz_670 = _zz_164;
      end
      4'b0101 : begin
        _zz_670 = _zz_183;
      end
      4'b0110 : begin
        _zz_670 = _zz_202;
      end
      4'b0111 : begin
        _zz_670 = _zz_221;
      end
      4'b1000 : begin
        _zz_670 = _zz_240;
      end
      4'b1001 : begin
        _zz_670 = _zz_259;
      end
      4'b1010 : begin
        _zz_670 = _zz_278;
      end
      4'b1011 : begin
        _zz_670 = _zz_297;
      end
      4'b1100 : begin
        _zz_670 = _zz_316;
      end
      4'b1101 : begin
        _zz_670 = _zz_335;
      end
      4'b1110 : begin
        _zz_670 = _zz_354;
      end
      default : begin
        _zz_670 = _zz_373;
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
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
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
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
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
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
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
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
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
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
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
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_27_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_27_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_27_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_27_string = "ECALL";
      default : _zz_27_string = "?????";
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
    case(_zz_28)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_28_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_28_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_28_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_28_string = "ECALL";
      default : _zz_28_string = "?????";
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
    case(_zz_29)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_29_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_29_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_29_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_29_string = "ECALL";
      default : _zz_29_string = "?????";
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
    case(_zz_30)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_30_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_30_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_30_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_30_string = "JALR";
      default : _zz_30_string = "????";
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
    case(_zz_33)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_33_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_33_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_33_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_33_string = "SRA_1    ";
      default : _zz_33_string = "?????????";
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
    case(_zz_34)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_34_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_34_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_34_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_34_string = "SRA_1    ";
      default : _zz_34_string = "?????????";
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
    case(_zz_36)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_36_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_36_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_36_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_36_string = "PC ";
      default : _zz_36_string = "???";
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
    case(_zz_37)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_37_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_37_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_37_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_37_string = "URS1        ";
      default : _zz_37_string = "????????????";
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
    case(_zz_38)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_38_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_38_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_38_string = "BITWISE ";
      default : _zz_38_string = "????????";
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
    case(_zz_39)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_39_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_39_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_39_string = "AND_1";
      default : _zz_39_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_43_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_43_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_43_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_43_string = "ECALL";
      default : _zz_43_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_44_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_44_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_44_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_44_string = "JALR";
      default : _zz_44_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_45_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_45_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_45_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_45_string = "SRA_1    ";
      default : _zz_45_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_46)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_46_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_46_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_46_string = "AND_1";
      default : _zz_46_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_47_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_47_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_47_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_47_string = "PC ";
      default : _zz_47_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_48)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_48_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_48_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_48_string = "BITWISE ";
      default : _zz_48_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_49_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_49_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_49_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_49_string = "URS1        ";
      default : _zz_49_string = "????????????";
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
    case(_zz_51)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_51_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_51_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_51_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_51_string = "JALR";
      default : _zz_51_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_513)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_513_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_513_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_513_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_513_string = "URS1        ";
      default : _zz_513_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_514)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_514_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_514_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_514_string = "BITWISE ";
      default : _zz_514_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_515)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_515_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_515_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_515_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_515_string = "PC ";
      default : _zz_515_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_516)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_516_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_516_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_516_string = "AND_1";
      default : _zz_516_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_517)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_517_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_517_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_517_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_517_string = "SRA_1    ";
      default : _zz_517_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_518)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_518_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_518_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_518_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_518_string = "JALR";
      default : _zz_518_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_519)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_519_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_519_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_519_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_519_string = "ECALL";
      default : _zz_519_string = "?????";
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

  assign memory_MUL_LOW = ($signed(_zz_726) + $signed(_zz_734));
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign execute_SHIFT_RIGHT = _zz_736;
  assign execute_REGFILE_WRITE_DATA = _zz_521;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_632[1 : 0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_IS_RS2_SIGNED = _zz_738[0];
  assign decode_IS_RS1_SIGNED = _zz_739[0];
  assign decode_IS_DIV = _zz_740[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_741[0];
  assign _zz_1 = _zz_2;
  assign _zz_3 = _zz_4;
  assign decode_ENV_CTRL = _zz_5;
  assign _zz_6 = _zz_7;
  assign decode_IS_CSR = _zz_742[0];
  assign _zz_8 = _zz_9;
  assign _zz_10 = _zz_11;
  assign decode_SHIFT_CTRL = _zz_12;
  assign _zz_13 = _zz_14;
  assign decode_ALU_BITWISE_CTRL = _zz_15;
  assign _zz_16 = _zz_17;
  assign decode_SRC_LESS_UNSIGNED = _zz_743[0];
  assign decode_MEMORY_MANAGMENT = _zz_744[0];
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_745[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_746[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_747[0];
  assign decode_SRC2_CTRL = _zz_18;
  assign _zz_19 = _zz_20;
  assign decode_ALU_CTRL = _zz_21;
  assign _zz_22 = _zz_23;
  assign decode_SRC1_CTRL = _zz_24;
  assign _zz_25 = _zz_26;
  assign decode_MEMORY_FORCE_CONSTISTENCY = 1'b0;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
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
  assign memory_ENV_CTRL = _zz_27;
  assign execute_ENV_CTRL = _zz_28;
  assign writeBack_ENV_CTRL = _zz_29;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_COND_RESULT = _zz_543;
  assign execute_BRANCH_CTRL = _zz_30;
  assign decode_RS2_USE = _zz_748[0];
  assign decode_RS1_USE = _zz_749[0];
  always @ (*) begin
    _zz_31 = execute_REGFILE_WRITE_DATA;
    if(_zz_671)begin
      _zz_31 = execute_CsrPlugin_readData;
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
    if(_zz_532)begin
      if((_zz_533 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_534;
      end
    end
    if(_zz_672)begin
      if(_zz_673)begin
        if(_zz_536)begin
          decode_RS2 = _zz_50;
        end
      end
    end
    if(_zz_674)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_538)begin
          decode_RS2 = _zz_32;
        end
      end
    end
    if(_zz_675)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_540)begin
          decode_RS2 = _zz_31;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_532)begin
      if((_zz_533 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_534;
      end
    end
    if(_zz_672)begin
      if(_zz_673)begin
        if(_zz_535)begin
          decode_RS1 = _zz_50;
        end
      end
    end
    if(_zz_674)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_537)begin
          decode_RS1 = _zz_32;
        end
      end
    end
    if(_zz_675)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_539)begin
          decode_RS1 = _zz_31;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_32 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_32 = _zz_529;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_32 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_676)begin
      _zz_32 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_33;
  assign execute_SHIFT_CTRL = _zz_34;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_35 = execute_PC;
  assign execute_SRC2_CTRL = _zz_36;
  assign execute_SRC1_CTRL = _zz_37;
  assign decode_SRC_USE_SUB_LESS = _zz_750[0];
  assign decode_SRC_ADD_ZERO = _zz_751[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_38;
  assign execute_SRC2 = _zz_527;
  assign execute_SRC1 = _zz_522;
  assign execute_ALU_BITWISE_CTRL = _zz_39;
  assign _zz_40 = writeBack_INSTRUCTION;
  assign _zz_41 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_42 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_42 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_752[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_970) == 32'h00001073),{(_zz_971 == _zz_972),{_zz_973,{_zz_974,_zz_975}}}}}}} != 21'h0);
  always @ (*) begin
    _zz_50 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_50 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_725)
        2'b00 : begin
          _zz_50 = _zz_862;
        end
        default : begin
          _zz_50 = _zz_863;
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
  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_753[0];
  assign decode_FLUSH_ALL = _zz_754[0];
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(_zz_677)begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(_zz_678)begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(_zz_679)begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_680)begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_51;
  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @ (*) begin
    _zz_52 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_52 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_53 = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      _zz_53 = IBusCachedPlugin_predictionJumpInterface_payload;
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
    if((decode_arbitration_isValid && (_zz_530 || _zz_531)))begin
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
    if(_zz_681)begin
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
    if(_zz_681)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((_zz_648 && (! dataCache_1_io_cpu_flush_ready)) || dataCache_1_io_cpu_execute_haltIt))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_682)begin
      if((! execute_CsrPlugin_wfiWake))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_671)begin
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
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if(_zz_676)begin
      if(((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done)))begin
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
    if(_zz_683)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_684)begin
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
    if(_zz_683)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_684)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_inWfi = 1'b0;
    if(_zz_682)begin
      CsrPlugin_inWfi = 1'b1;
    end
  end

  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_683)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_684)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_683)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_684)begin
      case(_zz_685)
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
  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}} != 4'b0000);
  assign _zz_54 = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_55 = (_zz_54 & (~ _zz_755));
  assign _zz_56 = _zz_55[3];
  assign _zz_57 = (_zz_55[1] || _zz_56);
  assign _zz_58 = (_zz_55[2] || _zz_56);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_652;
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
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_757);
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

  assign _zz_59 = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_59);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_59);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_60 = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_61 = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_62;
  assign _zz_62 = ((1'b0 && (! _zz_63)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_63 = _zz_64;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_63;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_65)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_65 = _zz_66;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_65;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_67;
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
  assign _zz_68 = _zz_758[11];
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
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_759[31]));
    if(_zz_74)begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_70 = _zz_760[19];
  always @ (*) begin
    _zz_71[10] = _zz_70;
    _zz_71[9] = _zz_70;
    _zz_71[8] = _zz_70;
    _zz_71[7] = _zz_70;
    _zz_71[6] = _zz_70;
    _zz_71[5] = _zz_70;
    _zz_71[4] = _zz_70;
    _zz_71[3] = _zz_70;
    _zz_71[2] = _zz_70;
    _zz_71[1] = _zz_70;
    _zz_71[0] = _zz_70;
  end

  assign _zz_72 = _zz_761[11];
  always @ (*) begin
    _zz_73[18] = _zz_72;
    _zz_73[17] = _zz_72;
    _zz_73[16] = _zz_72;
    _zz_73[15] = _zz_72;
    _zz_73[14] = _zz_72;
    _zz_73[13] = _zz_72;
    _zz_73[12] = _zz_72;
    _zz_73[11] = _zz_72;
    _zz_73[10] = _zz_72;
    _zz_73[9] = _zz_72;
    _zz_73[8] = _zz_72;
    _zz_73[7] = _zz_72;
    _zz_73[6] = _zz_72;
    _zz_73[5] = _zz_72;
    _zz_73[4] = _zz_72;
    _zz_73[3] = _zz_72;
    _zz_73[2] = _zz_72;
    _zz_73[1] = _zz_72;
    _zz_73[0] = _zz_72;
  end

  always @ (*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_74 = _zz_762[1];
      end
      default : begin
        _zz_74 = _zz_763[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_75 = _zz_764[19];
  always @ (*) begin
    _zz_76[10] = _zz_75;
    _zz_76[9] = _zz_75;
    _zz_76[8] = _zz_75;
    _zz_76[7] = _zz_75;
    _zz_76[6] = _zz_75;
    _zz_76[5] = _zz_75;
    _zz_76[4] = _zz_75;
    _zz_76[3] = _zz_75;
    _zz_76[2] = _zz_75;
    _zz_76[1] = _zz_75;
    _zz_76[0] = _zz_75;
  end

  assign _zz_77 = _zz_765[11];
  always @ (*) begin
    _zz_78[18] = _zz_77;
    _zz_78[17] = _zz_77;
    _zz_78[16] = _zz_77;
    _zz_78[15] = _zz_77;
    _zz_78[14] = _zz_77;
    _zz_78[13] = _zz_77;
    _zz_78[12] = _zz_77;
    _zz_78[11] = _zz_77;
    _zz_78[10] = _zz_77;
    _zz_78[9] = _zz_77;
    _zz_78[8] = _zz_77;
    _zz_78[7] = _zz_77;
    _zz_78[6] = _zz_77;
    _zz_78[5] = _zz_77;
    _zz_78[4] = _zz_77;
    _zz_78[3] = _zz_77;
    _zz_78[2] = _zz_77;
    _zz_78[1] = _zz_77;
    _zz_78[0] = _zz_77;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_76,{{{_zz_988,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_78,{{{_zz_989,_zz_990},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_623 = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_624 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_625 = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_624;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign _zz_627 = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_628 = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_629 = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_680)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_678)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_630 = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_678)begin
      _zz_630 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_679)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_677)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(_zz_679)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(_zz_677)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign _zz_622 = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1_io_mem_cmd_s2mPipe_valid = (dataCache_1_io_mem_cmd_valid || dataCache_1_io_mem_cmd_s2mPipe_rValid);
  assign _zz_649 = (! dataCache_1_io_mem_cmd_s2mPipe_rValid);
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
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign _zz_631 = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign _zz_632 = execute_SRC_ADD;
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_81 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_81 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_81 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign _zz_648 = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign _zz_633 = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign _zz_634 = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_633;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = _zz_634;
  assign DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @ (*) begin
    _zz_635 = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((1'b0 && (! dataCache_1_io_cpu_memory_isWrite)))begin
      _zz_635 = 1'b1;
    end
  end

  assign _zz_636 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_637 = (CsrPlugin_privilege == 2'b00);
  assign _zz_638 = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(_zz_686)begin
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(_zz_686)begin
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
    if(_zz_686)begin
      if(dataCache_1_io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_766};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_767};
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

  assign _zz_82 = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_83[31] = _zz_82;
    _zz_83[30] = _zz_82;
    _zz_83[29] = _zz_82;
    _zz_83[28] = _zz_82;
    _zz_83[27] = _zz_82;
    _zz_83[26] = _zz_82;
    _zz_83[25] = _zz_82;
    _zz_83[24] = _zz_82;
    _zz_83[23] = _zz_82;
    _zz_83[22] = _zz_82;
    _zz_83[21] = _zz_82;
    _zz_83[20] = _zz_82;
    _zz_83[19] = _zz_82;
    _zz_83[18] = _zz_82;
    _zz_83[17] = _zz_82;
    _zz_83[16] = _zz_82;
    _zz_83[15] = _zz_82;
    _zz_83[14] = _zz_82;
    _zz_83[13] = _zz_82;
    _zz_83[12] = _zz_82;
    _zz_83[11] = _zz_82;
    _zz_83[10] = _zz_82;
    _zz_83[9] = _zz_82;
    _zz_83[8] = _zz_82;
    _zz_83[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_84 = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_85[31] = _zz_84;
    _zz_85[30] = _zz_84;
    _zz_85[29] = _zz_84;
    _zz_85[28] = _zz_84;
    _zz_85[27] = _zz_84;
    _zz_85[26] = _zz_84;
    _zz_85[25] = _zz_84;
    _zz_85[24] = _zz_84;
    _zz_85[23] = _zz_84;
    _zz_85[22] = _zz_84;
    _zz_85[21] = _zz_84;
    _zz_85[20] = _zz_84;
    _zz_85[19] = _zz_84;
    _zz_85[18] = _zz_84;
    _zz_85[17] = _zz_84;
    _zz_85[16] = _zz_84;
    _zz_85[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_723)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_83;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_85;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    _zz_92 = _zz_86;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_92 = _zz_894[0];
      end
    end
  end

  always @ (*) begin
    _zz_93 = _zz_87;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_93 = _zz_893[0];
      end
    end
  end

  always @ (*) begin
    _zz_94 = _zz_88;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_94 = _zz_892[0];
      end
    end
  end

  always @ (*) begin
    _zz_95 = _zz_89;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_95 = _zz_882[0];
      end
    end
  end

  always @ (*) begin
    _zz_96 = _zz_90;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_96 = execute_CsrPlugin_writeData[4 : 3];
      end
    end
  end

  always @ (*) begin
    _zz_97 = _zz_91;
    if(execute_CsrPlugin_csr_944)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_97 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_102 = (_zz_91 <<< 2);
  assign _zz_103 = (_zz_91 & (~ _zz_768));
  assign _zz_104 = ((_zz_91 & (~ _zz_103)) <<< 2);
  assign _zz_99 = _zz_89;
  always @ (*) begin
    _zz_98 = 1'b1;
    case(_zz_96)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_98 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_96)
      2'b01 : begin
        _zz_100 = 32'h0;
      end
      2'b10 : begin
        _zz_100 = _zz_102;
      end
      2'b11 : begin
        _zz_100 = _zz_104;
      end
      default : begin
        _zz_100 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_96)
      2'b01 : begin
        _zz_101 = _zz_102;
      end
      2'b10 : begin
        _zz_101 = (_zz_102 + 32'h00000004);
      end
      2'b11 : begin
        _zz_101 = (_zz_104 + _zz_769);
      end
      default : begin
        _zz_101 = _zz_102;
      end
    endcase
  end

  always @ (*) begin
    _zz_111 = _zz_105;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_111 = _zz_891[0];
      end
    end
  end

  always @ (*) begin
    _zz_112 = _zz_106;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_112 = _zz_890[0];
      end
    end
  end

  always @ (*) begin
    _zz_113 = _zz_107;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_113 = _zz_889[0];
      end
    end
  end

  always @ (*) begin
    _zz_114 = _zz_108;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_114 = _zz_881[0];
      end
    end
  end

  always @ (*) begin
    _zz_115 = _zz_109;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_115 = execute_CsrPlugin_writeData[12 : 11];
      end
    end
  end

  always @ (*) begin
    _zz_116 = _zz_110;
    if(execute_CsrPlugin_csr_945)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_116 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_121 = (_zz_110 <<< 2);
  assign _zz_122 = (_zz_110 & (~ _zz_771));
  assign _zz_123 = ((_zz_110 & (~ _zz_122)) <<< 2);
  assign _zz_118 = _zz_108;
  always @ (*) begin
    _zz_117 = 1'b1;
    case(_zz_115)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_117 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_115)
      2'b01 : begin
        _zz_119 = _zz_101;
      end
      2'b10 : begin
        _zz_119 = _zz_121;
      end
      2'b11 : begin
        _zz_119 = _zz_123;
      end
      default : begin
        _zz_119 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_115)
      2'b01 : begin
        _zz_120 = _zz_121;
      end
      2'b10 : begin
        _zz_120 = (_zz_121 + 32'h00000004);
      end
      2'b11 : begin
        _zz_120 = (_zz_123 + _zz_772);
      end
      default : begin
        _zz_120 = _zz_121;
      end
    endcase
  end

  always @ (*) begin
    _zz_130 = _zz_124;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_130 = _zz_888[0];
      end
    end
  end

  always @ (*) begin
    _zz_131 = _zz_125;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_131 = _zz_887[0];
      end
    end
  end

  always @ (*) begin
    _zz_132 = _zz_126;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_132 = _zz_886[0];
      end
    end
  end

  always @ (*) begin
    _zz_133 = _zz_127;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_133 = _zz_880[0];
      end
    end
  end

  always @ (*) begin
    _zz_134 = _zz_128;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_134 = execute_CsrPlugin_writeData[20 : 19];
      end
    end
  end

  always @ (*) begin
    _zz_135 = _zz_129;
    if(execute_CsrPlugin_csr_946)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_135 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_140 = (_zz_129 <<< 2);
  assign _zz_141 = (_zz_129 & (~ _zz_774));
  assign _zz_142 = ((_zz_129 & (~ _zz_141)) <<< 2);
  assign _zz_137 = _zz_127;
  always @ (*) begin
    _zz_136 = 1'b1;
    case(_zz_134)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_136 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_134)
      2'b01 : begin
        _zz_138 = _zz_120;
      end
      2'b10 : begin
        _zz_138 = _zz_140;
      end
      2'b11 : begin
        _zz_138 = _zz_142;
      end
      default : begin
        _zz_138 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_134)
      2'b01 : begin
        _zz_139 = _zz_140;
      end
      2'b10 : begin
        _zz_139 = (_zz_140 + 32'h00000004);
      end
      2'b11 : begin
        _zz_139 = (_zz_142 + _zz_775);
      end
      default : begin
        _zz_139 = _zz_140;
      end
    endcase
  end

  always @ (*) begin
    _zz_149 = _zz_143;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_149 = _zz_885[0];
      end
    end
  end

  always @ (*) begin
    _zz_150 = _zz_144;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_150 = _zz_884[0];
      end
    end
  end

  always @ (*) begin
    _zz_151 = _zz_145;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_151 = _zz_883[0];
      end
    end
  end

  always @ (*) begin
    _zz_152 = _zz_146;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_152 = _zz_879[0];
      end
    end
  end

  always @ (*) begin
    _zz_153 = _zz_147;
    if(execute_CsrPlugin_csr_928)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_153 = execute_CsrPlugin_writeData[28 : 27];
      end
    end
  end

  always @ (*) begin
    _zz_154 = _zz_148;
    if(execute_CsrPlugin_csr_947)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_154 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_159 = (_zz_148 <<< 2);
  assign _zz_160 = (_zz_148 & (~ _zz_777));
  assign _zz_161 = ((_zz_148 & (~ _zz_160)) <<< 2);
  assign _zz_156 = _zz_146;
  always @ (*) begin
    _zz_155 = 1'b1;
    case(_zz_153)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_155 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_153)
      2'b01 : begin
        _zz_157 = _zz_139;
      end
      2'b10 : begin
        _zz_157 = _zz_159;
      end
      2'b11 : begin
        _zz_157 = _zz_161;
      end
      default : begin
        _zz_157 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_153)
      2'b01 : begin
        _zz_158 = _zz_159;
      end
      2'b10 : begin
        _zz_158 = (_zz_159 + 32'h00000004);
      end
      2'b11 : begin
        _zz_158 = (_zz_161 + _zz_778);
      end
      default : begin
        _zz_158 = _zz_159;
      end
    endcase
  end

  always @ (*) begin
    _zz_168 = _zz_162;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_168 = _zz_910[0];
      end
    end
  end

  always @ (*) begin
    _zz_169 = _zz_163;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_169 = _zz_909[0];
      end
    end
  end

  always @ (*) begin
    _zz_170 = _zz_164;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_170 = _zz_908[0];
      end
    end
  end

  always @ (*) begin
    _zz_171 = _zz_165;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_171 = _zz_898[0];
      end
    end
  end

  always @ (*) begin
    _zz_172 = _zz_166;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_172 = execute_CsrPlugin_writeData[4 : 3];
      end
    end
  end

  always @ (*) begin
    _zz_173 = _zz_167;
    if(execute_CsrPlugin_csr_948)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_173 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_178 = (_zz_167 <<< 2);
  assign _zz_179 = (_zz_167 & (~ _zz_780));
  assign _zz_180 = ((_zz_167 & (~ _zz_179)) <<< 2);
  assign _zz_175 = _zz_165;
  always @ (*) begin
    _zz_174 = 1'b1;
    case(_zz_172)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_174 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_172)
      2'b01 : begin
        _zz_176 = _zz_158;
      end
      2'b10 : begin
        _zz_176 = _zz_178;
      end
      2'b11 : begin
        _zz_176 = _zz_180;
      end
      default : begin
        _zz_176 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_172)
      2'b01 : begin
        _zz_177 = _zz_178;
      end
      2'b10 : begin
        _zz_177 = (_zz_178 + 32'h00000004);
      end
      2'b11 : begin
        _zz_177 = (_zz_180 + _zz_781);
      end
      default : begin
        _zz_177 = _zz_178;
      end
    endcase
  end

  always @ (*) begin
    _zz_187 = _zz_181;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_187 = _zz_907[0];
      end
    end
  end

  always @ (*) begin
    _zz_188 = _zz_182;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_188 = _zz_906[0];
      end
    end
  end

  always @ (*) begin
    _zz_189 = _zz_183;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_189 = _zz_905[0];
      end
    end
  end

  always @ (*) begin
    _zz_190 = _zz_184;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_190 = _zz_897[0];
      end
    end
  end

  always @ (*) begin
    _zz_191 = _zz_185;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_191 = execute_CsrPlugin_writeData[12 : 11];
      end
    end
  end

  always @ (*) begin
    _zz_192 = _zz_186;
    if(execute_CsrPlugin_csr_949)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_192 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_197 = (_zz_186 <<< 2);
  assign _zz_198 = (_zz_186 & (~ _zz_783));
  assign _zz_199 = ((_zz_186 & (~ _zz_198)) <<< 2);
  assign _zz_194 = _zz_184;
  always @ (*) begin
    _zz_193 = 1'b1;
    case(_zz_191)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_193 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_191)
      2'b01 : begin
        _zz_195 = _zz_177;
      end
      2'b10 : begin
        _zz_195 = _zz_197;
      end
      2'b11 : begin
        _zz_195 = _zz_199;
      end
      default : begin
        _zz_195 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_191)
      2'b01 : begin
        _zz_196 = _zz_197;
      end
      2'b10 : begin
        _zz_196 = (_zz_197 + 32'h00000004);
      end
      2'b11 : begin
        _zz_196 = (_zz_199 + _zz_784);
      end
      default : begin
        _zz_196 = _zz_197;
      end
    endcase
  end

  always @ (*) begin
    _zz_206 = _zz_200;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_206 = _zz_904[0];
      end
    end
  end

  always @ (*) begin
    _zz_207 = _zz_201;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_207 = _zz_903[0];
      end
    end
  end

  always @ (*) begin
    _zz_208 = _zz_202;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_208 = _zz_902[0];
      end
    end
  end

  always @ (*) begin
    _zz_209 = _zz_203;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_209 = _zz_896[0];
      end
    end
  end

  always @ (*) begin
    _zz_210 = _zz_204;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_210 = execute_CsrPlugin_writeData[20 : 19];
      end
    end
  end

  always @ (*) begin
    _zz_211 = _zz_205;
    if(execute_CsrPlugin_csr_950)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_211 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_216 = (_zz_205 <<< 2);
  assign _zz_217 = (_zz_205 & (~ _zz_786));
  assign _zz_218 = ((_zz_205 & (~ _zz_217)) <<< 2);
  assign _zz_213 = _zz_203;
  always @ (*) begin
    _zz_212 = 1'b1;
    case(_zz_210)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_212 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_210)
      2'b01 : begin
        _zz_214 = _zz_196;
      end
      2'b10 : begin
        _zz_214 = _zz_216;
      end
      2'b11 : begin
        _zz_214 = _zz_218;
      end
      default : begin
        _zz_214 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_210)
      2'b01 : begin
        _zz_215 = _zz_216;
      end
      2'b10 : begin
        _zz_215 = (_zz_216 + 32'h00000004);
      end
      2'b11 : begin
        _zz_215 = (_zz_218 + _zz_787);
      end
      default : begin
        _zz_215 = _zz_216;
      end
    endcase
  end

  always @ (*) begin
    _zz_225 = _zz_219;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_225 = _zz_901[0];
      end
    end
  end

  always @ (*) begin
    _zz_226 = _zz_220;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_226 = _zz_900[0];
      end
    end
  end

  always @ (*) begin
    _zz_227 = _zz_221;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_227 = _zz_899[0];
      end
    end
  end

  always @ (*) begin
    _zz_228 = _zz_222;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_228 = _zz_895[0];
      end
    end
  end

  always @ (*) begin
    _zz_229 = _zz_223;
    if(execute_CsrPlugin_csr_929)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_229 = execute_CsrPlugin_writeData[28 : 27];
      end
    end
  end

  always @ (*) begin
    _zz_230 = _zz_224;
    if(execute_CsrPlugin_csr_951)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_230 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_235 = (_zz_224 <<< 2);
  assign _zz_236 = (_zz_224 & (~ _zz_789));
  assign _zz_237 = ((_zz_224 & (~ _zz_236)) <<< 2);
  assign _zz_232 = _zz_222;
  always @ (*) begin
    _zz_231 = 1'b1;
    case(_zz_229)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_231 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_229)
      2'b01 : begin
        _zz_233 = _zz_215;
      end
      2'b10 : begin
        _zz_233 = _zz_235;
      end
      2'b11 : begin
        _zz_233 = _zz_237;
      end
      default : begin
        _zz_233 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_229)
      2'b01 : begin
        _zz_234 = _zz_235;
      end
      2'b10 : begin
        _zz_234 = (_zz_235 + 32'h00000004);
      end
      2'b11 : begin
        _zz_234 = (_zz_237 + _zz_790);
      end
      default : begin
        _zz_234 = _zz_235;
      end
    endcase
  end

  always @ (*) begin
    _zz_244 = _zz_238;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_244 = _zz_926[0];
      end
    end
  end

  always @ (*) begin
    _zz_245 = _zz_239;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_245 = _zz_925[0];
      end
    end
  end

  always @ (*) begin
    _zz_246 = _zz_240;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_246 = _zz_924[0];
      end
    end
  end

  always @ (*) begin
    _zz_247 = _zz_241;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_247 = _zz_914[0];
      end
    end
  end

  always @ (*) begin
    _zz_248 = _zz_242;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_248 = execute_CsrPlugin_writeData[4 : 3];
      end
    end
  end

  always @ (*) begin
    _zz_249 = _zz_243;
    if(execute_CsrPlugin_csr_952)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_249 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_254 = (_zz_243 <<< 2);
  assign _zz_255 = (_zz_243 & (~ _zz_792));
  assign _zz_256 = ((_zz_243 & (~ _zz_255)) <<< 2);
  assign _zz_251 = _zz_241;
  always @ (*) begin
    _zz_250 = 1'b1;
    case(_zz_248)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_250 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_248)
      2'b01 : begin
        _zz_252 = _zz_234;
      end
      2'b10 : begin
        _zz_252 = _zz_254;
      end
      2'b11 : begin
        _zz_252 = _zz_256;
      end
      default : begin
        _zz_252 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_248)
      2'b01 : begin
        _zz_253 = _zz_254;
      end
      2'b10 : begin
        _zz_253 = (_zz_254 + 32'h00000004);
      end
      2'b11 : begin
        _zz_253 = (_zz_256 + _zz_793);
      end
      default : begin
        _zz_253 = _zz_254;
      end
    endcase
  end

  always @ (*) begin
    _zz_263 = _zz_257;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_263 = _zz_923[0];
      end
    end
  end

  always @ (*) begin
    _zz_264 = _zz_258;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_264 = _zz_922[0];
      end
    end
  end

  always @ (*) begin
    _zz_265 = _zz_259;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_265 = _zz_921[0];
      end
    end
  end

  always @ (*) begin
    _zz_266 = _zz_260;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_266 = _zz_913[0];
      end
    end
  end

  always @ (*) begin
    _zz_267 = _zz_261;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_267 = execute_CsrPlugin_writeData[12 : 11];
      end
    end
  end

  always @ (*) begin
    _zz_268 = _zz_262;
    if(execute_CsrPlugin_csr_953)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_268 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_273 = (_zz_262 <<< 2);
  assign _zz_274 = (_zz_262 & (~ _zz_795));
  assign _zz_275 = ((_zz_262 & (~ _zz_274)) <<< 2);
  assign _zz_270 = _zz_260;
  always @ (*) begin
    _zz_269 = 1'b1;
    case(_zz_267)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_269 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_267)
      2'b01 : begin
        _zz_271 = _zz_253;
      end
      2'b10 : begin
        _zz_271 = _zz_273;
      end
      2'b11 : begin
        _zz_271 = _zz_275;
      end
      default : begin
        _zz_271 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_267)
      2'b01 : begin
        _zz_272 = _zz_273;
      end
      2'b10 : begin
        _zz_272 = (_zz_273 + 32'h00000004);
      end
      2'b11 : begin
        _zz_272 = (_zz_275 + _zz_796);
      end
      default : begin
        _zz_272 = _zz_273;
      end
    endcase
  end

  always @ (*) begin
    _zz_282 = _zz_276;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_282 = _zz_920[0];
      end
    end
  end

  always @ (*) begin
    _zz_283 = _zz_277;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_283 = _zz_919[0];
      end
    end
  end

  always @ (*) begin
    _zz_284 = _zz_278;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_284 = _zz_918[0];
      end
    end
  end

  always @ (*) begin
    _zz_285 = _zz_279;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_285 = _zz_912[0];
      end
    end
  end

  always @ (*) begin
    _zz_286 = _zz_280;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_286 = execute_CsrPlugin_writeData[20 : 19];
      end
    end
  end

  always @ (*) begin
    _zz_287 = _zz_281;
    if(execute_CsrPlugin_csr_954)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_287 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_292 = (_zz_281 <<< 2);
  assign _zz_293 = (_zz_281 & (~ _zz_798));
  assign _zz_294 = ((_zz_281 & (~ _zz_293)) <<< 2);
  assign _zz_289 = _zz_279;
  always @ (*) begin
    _zz_288 = 1'b1;
    case(_zz_286)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_288 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_286)
      2'b01 : begin
        _zz_290 = _zz_272;
      end
      2'b10 : begin
        _zz_290 = _zz_292;
      end
      2'b11 : begin
        _zz_290 = _zz_294;
      end
      default : begin
        _zz_290 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_286)
      2'b01 : begin
        _zz_291 = _zz_292;
      end
      2'b10 : begin
        _zz_291 = (_zz_292 + 32'h00000004);
      end
      2'b11 : begin
        _zz_291 = (_zz_294 + _zz_799);
      end
      default : begin
        _zz_291 = _zz_292;
      end
    endcase
  end

  always @ (*) begin
    _zz_301 = _zz_295;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_301 = _zz_917[0];
      end
    end
  end

  always @ (*) begin
    _zz_302 = _zz_296;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_302 = _zz_916[0];
      end
    end
  end

  always @ (*) begin
    _zz_303 = _zz_297;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_303 = _zz_915[0];
      end
    end
  end

  always @ (*) begin
    _zz_304 = _zz_298;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_304 = _zz_911[0];
      end
    end
  end

  always @ (*) begin
    _zz_305 = _zz_299;
    if(execute_CsrPlugin_csr_930)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_305 = execute_CsrPlugin_writeData[28 : 27];
      end
    end
  end

  always @ (*) begin
    _zz_306 = _zz_300;
    if(execute_CsrPlugin_csr_955)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_306 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_311 = (_zz_300 <<< 2);
  assign _zz_312 = (_zz_300 & (~ _zz_801));
  assign _zz_313 = ((_zz_300 & (~ _zz_312)) <<< 2);
  assign _zz_308 = _zz_298;
  always @ (*) begin
    _zz_307 = 1'b1;
    case(_zz_305)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_307 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_305)
      2'b01 : begin
        _zz_309 = _zz_291;
      end
      2'b10 : begin
        _zz_309 = _zz_311;
      end
      2'b11 : begin
        _zz_309 = _zz_313;
      end
      default : begin
        _zz_309 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_305)
      2'b01 : begin
        _zz_310 = _zz_311;
      end
      2'b10 : begin
        _zz_310 = (_zz_311 + 32'h00000004);
      end
      2'b11 : begin
        _zz_310 = (_zz_313 + _zz_802);
      end
      default : begin
        _zz_310 = _zz_311;
      end
    endcase
  end

  always @ (*) begin
    _zz_320 = _zz_314;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_320 = _zz_942[0];
      end
    end
  end

  always @ (*) begin
    _zz_321 = _zz_315;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_321 = _zz_941[0];
      end
    end
  end

  always @ (*) begin
    _zz_322 = _zz_316;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_322 = _zz_940[0];
      end
    end
  end

  always @ (*) begin
    _zz_323 = _zz_317;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_323 = _zz_930[0];
      end
    end
  end

  always @ (*) begin
    _zz_324 = _zz_318;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_324 = execute_CsrPlugin_writeData[4 : 3];
      end
    end
  end

  always @ (*) begin
    _zz_325 = _zz_319;
    if(execute_CsrPlugin_csr_956)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_325 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_330 = (_zz_319 <<< 2);
  assign _zz_331 = (_zz_319 & (~ _zz_804));
  assign _zz_332 = ((_zz_319 & (~ _zz_331)) <<< 2);
  assign _zz_327 = _zz_317;
  always @ (*) begin
    _zz_326 = 1'b1;
    case(_zz_324)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_326 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_324)
      2'b01 : begin
        _zz_328 = _zz_310;
      end
      2'b10 : begin
        _zz_328 = _zz_330;
      end
      2'b11 : begin
        _zz_328 = _zz_332;
      end
      default : begin
        _zz_328 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_324)
      2'b01 : begin
        _zz_329 = _zz_330;
      end
      2'b10 : begin
        _zz_329 = (_zz_330 + 32'h00000004);
      end
      2'b11 : begin
        _zz_329 = (_zz_332 + _zz_805);
      end
      default : begin
        _zz_329 = _zz_330;
      end
    endcase
  end

  always @ (*) begin
    _zz_339 = _zz_333;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_339 = _zz_939[0];
      end
    end
  end

  always @ (*) begin
    _zz_340 = _zz_334;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_340 = _zz_938[0];
      end
    end
  end

  always @ (*) begin
    _zz_341 = _zz_335;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_341 = _zz_937[0];
      end
    end
  end

  always @ (*) begin
    _zz_342 = _zz_336;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_342 = _zz_929[0];
      end
    end
  end

  always @ (*) begin
    _zz_343 = _zz_337;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_343 = execute_CsrPlugin_writeData[12 : 11];
      end
    end
  end

  always @ (*) begin
    _zz_344 = _zz_338;
    if(execute_CsrPlugin_csr_957)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_344 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_349 = (_zz_338 <<< 2);
  assign _zz_350 = (_zz_338 & (~ _zz_807));
  assign _zz_351 = ((_zz_338 & (~ _zz_350)) <<< 2);
  assign _zz_346 = _zz_336;
  always @ (*) begin
    _zz_345 = 1'b1;
    case(_zz_343)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_345 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_343)
      2'b01 : begin
        _zz_347 = _zz_329;
      end
      2'b10 : begin
        _zz_347 = _zz_349;
      end
      2'b11 : begin
        _zz_347 = _zz_351;
      end
      default : begin
        _zz_347 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_343)
      2'b01 : begin
        _zz_348 = _zz_349;
      end
      2'b10 : begin
        _zz_348 = (_zz_349 + 32'h00000004);
      end
      2'b11 : begin
        _zz_348 = (_zz_351 + _zz_808);
      end
      default : begin
        _zz_348 = _zz_349;
      end
    endcase
  end

  always @ (*) begin
    _zz_358 = _zz_352;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_358 = _zz_936[0];
      end
    end
  end

  always @ (*) begin
    _zz_359 = _zz_353;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_359 = _zz_935[0];
      end
    end
  end

  always @ (*) begin
    _zz_360 = _zz_354;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_360 = _zz_934[0];
      end
    end
  end

  always @ (*) begin
    _zz_361 = _zz_355;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_361 = _zz_928[0];
      end
    end
  end

  always @ (*) begin
    _zz_362 = _zz_356;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_362 = execute_CsrPlugin_writeData[20 : 19];
      end
    end
  end

  always @ (*) begin
    _zz_363 = _zz_357;
    if(execute_CsrPlugin_csr_958)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_363 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_368 = (_zz_357 <<< 2);
  assign _zz_369 = (_zz_357 & (~ _zz_810));
  assign _zz_370 = ((_zz_357 & (~ _zz_369)) <<< 2);
  assign _zz_365 = _zz_355;
  always @ (*) begin
    _zz_364 = 1'b1;
    case(_zz_362)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_364 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_362)
      2'b01 : begin
        _zz_366 = _zz_348;
      end
      2'b10 : begin
        _zz_366 = _zz_368;
      end
      2'b11 : begin
        _zz_366 = _zz_370;
      end
      default : begin
        _zz_366 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_362)
      2'b01 : begin
        _zz_367 = _zz_368;
      end
      2'b10 : begin
        _zz_367 = (_zz_368 + 32'h00000004);
      end
      2'b11 : begin
        _zz_367 = (_zz_370 + _zz_811);
      end
      default : begin
        _zz_367 = _zz_368;
      end
    endcase
  end

  always @ (*) begin
    _zz_377 = _zz_371;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_377 = _zz_933[0];
      end
    end
  end

  always @ (*) begin
    _zz_378 = _zz_372;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_378 = _zz_932[0];
      end
    end
  end

  always @ (*) begin
    _zz_379 = _zz_373;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_379 = _zz_931[0];
      end
    end
  end

  always @ (*) begin
    _zz_380 = _zz_374;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_380 = _zz_927[0];
      end
    end
  end

  always @ (*) begin
    _zz_381 = _zz_375;
    if(execute_CsrPlugin_csr_931)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_381 = execute_CsrPlugin_writeData[28 : 27];
      end
    end
  end

  always @ (*) begin
    _zz_382 = _zz_376;
    if(execute_CsrPlugin_csr_959)begin
      if(execute_CsrPlugin_writeEnable)begin
        _zz_382 = execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  assign _zz_387 = (_zz_376 <<< 2);
  assign _zz_388 = (_zz_376 & (~ _zz_813));
  assign _zz_389 = ((_zz_376 & (~ _zz_388)) <<< 2);
  assign _zz_384 = _zz_374;
  always @ (*) begin
    _zz_383 = 1'b1;
    case(_zz_381)
      2'b01 : begin
      end
      2'b10 : begin
      end
      2'b11 : begin
      end
      default : begin
        _zz_383 = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_381)
      2'b01 : begin
        _zz_385 = _zz_367;
      end
      2'b10 : begin
        _zz_385 = _zz_387;
      end
      2'b11 : begin
        _zz_385 = _zz_389;
      end
      default : begin
        _zz_385 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_381)
      2'b01 : begin
        _zz_386 = _zz_387;
      end
      2'b10 : begin
        _zz_386 = (_zz_387 + 32'h00000004);
      end
      2'b11 : begin
        _zz_386 = (_zz_389 + _zz_814);
      end
      default : begin
        _zz_386 = _zz_387;
      end
    endcase
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign PmpPlugin_ports_0_hits_0 = (((_zz_98 && (_zz_100 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_101)) && (_zz_99 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_1 = (((_zz_117 && (_zz_119 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_120)) && (_zz_118 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_2 = (((_zz_136 && (_zz_138 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_139)) && (_zz_137 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_3 = (((_zz_155 && (_zz_157 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_158)) && (_zz_156 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_4 = (((_zz_174 && (_zz_176 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_177)) && (_zz_175 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_5 = (((_zz_193 && (_zz_195 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_196)) && (_zz_194 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_6 = (((_zz_212 && (_zz_214 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_215)) && (_zz_213 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_7 = (((_zz_231 && (_zz_233 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_234)) && (_zz_232 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_8 = (((_zz_250 && (_zz_252 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_253)) && (_zz_251 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_9 = (((_zz_269 && (_zz_271 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_272)) && (_zz_270 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_10 = (((_zz_288 && (_zz_290 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_291)) && (_zz_289 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_11 = (((_zz_307 && (_zz_309 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_310)) && (_zz_308 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_12 = (((_zz_326 && (_zz_328 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_329)) && (_zz_327 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_13 = (((_zz_345 && (_zz_347 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_348)) && (_zz_346 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_14 = (((_zz_364 && (_zz_366 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_367)) && (_zz_365 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_0_hits_15 = (((_zz_383 && (_zz_385 <= IBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (IBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_386)) && (_zz_384 || (! (CsrPlugin_privilege == 2'b11))));
  assign _zz_390 = 5'h0;
  assign _zz_391 = 5'h01;
  assign _zz_392 = 5'h01;
  assign _zz_393 = 5'h02;
  assign _zz_394 = 5'h01;
  assign _zz_395 = 5'h02;
  assign _zz_396 = 5'h02;
  assign _zz_397 = 5'h03;
  always @ (*) begin
    if(_zz_687)begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = (CsrPlugin_privilege == 2'b11);
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = _zz_659;
    end
  end

  always @ (*) begin
    if(_zz_687)begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = (CsrPlugin_privilege == 2'b11);
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = _zz_660;
    end
  end

  always @ (*) begin
    if(_zz_687)begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = (CsrPlugin_privilege == 2'b11);
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = _zz_661;
    end
  end

  assign _zz_398 = {PmpPlugin_ports_0_hits_15,{PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,{PmpPlugin_ports_0_hits_12,{PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,{PmpPlugin_ports_0_hits_9,{PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,{PmpPlugin_ports_0_hits_6,{_zz_991,_zz_992}}}}}}}}}}};
  assign _zz_399 = (_zz_398 & (~ _zz_823));
  assign _zz_400 = _zz_399[3];
  assign _zz_401 = _zz_399[5];
  assign _zz_402 = _zz_399[6];
  assign _zz_403 = _zz_399[7];
  assign _zz_404 = _zz_399[9];
  assign _zz_405 = _zz_399[10];
  assign _zz_406 = _zz_399[11];
  assign _zz_407 = _zz_399[12];
  assign _zz_408 = _zz_399[13];
  assign _zz_409 = _zz_399[14];
  assign _zz_410 = _zz_399[15];
  assign _zz_411 = (((((((_zz_399[1] || _zz_400) || _zz_401) || _zz_403) || _zz_404) || _zz_406) || _zz_408) || _zz_410);
  assign _zz_412 = (((((((_zz_399[2] || _zz_400) || _zz_402) || _zz_403) || _zz_405) || _zz_406) || _zz_409) || _zz_410);
  assign _zz_413 = (((((((_zz_399[4] || _zz_401) || _zz_402) || _zz_403) || _zz_407) || _zz_408) || _zz_409) || _zz_410);
  assign _zz_414 = (((((((_zz_399[8] || _zz_404) || _zz_405) || _zz_406) || _zz_407) || _zz_408) || _zz_409) || _zz_410);
  assign _zz_415 = {PmpPlugin_ports_0_hits_15,{PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,{PmpPlugin_ports_0_hits_12,{PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,{PmpPlugin_ports_0_hits_9,{PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,{PmpPlugin_ports_0_hits_6,{_zz_993,_zz_994}}}}}}}}}}};
  assign _zz_416 = (_zz_415 & (~ _zz_824));
  assign _zz_417 = _zz_416[3];
  assign _zz_418 = _zz_416[5];
  assign _zz_419 = _zz_416[6];
  assign _zz_420 = _zz_416[7];
  assign _zz_421 = _zz_416[9];
  assign _zz_422 = _zz_416[10];
  assign _zz_423 = _zz_416[11];
  assign _zz_424 = _zz_416[12];
  assign _zz_425 = _zz_416[13];
  assign _zz_426 = _zz_416[14];
  assign _zz_427 = _zz_416[15];
  assign _zz_428 = (((((((_zz_416[1] || _zz_417) || _zz_418) || _zz_420) || _zz_421) || _zz_423) || _zz_425) || _zz_427);
  assign _zz_429 = (((((((_zz_416[2] || _zz_417) || _zz_419) || _zz_420) || _zz_422) || _zz_423) || _zz_426) || _zz_427);
  assign _zz_430 = (((((((_zz_416[4] || _zz_418) || _zz_419) || _zz_420) || _zz_424) || _zz_425) || _zz_426) || _zz_427);
  assign _zz_431 = (((((((_zz_416[8] || _zz_421) || _zz_422) || _zz_423) || _zz_424) || _zz_425) || _zz_426) || _zz_427);
  assign _zz_432 = {PmpPlugin_ports_0_hits_15,{PmpPlugin_ports_0_hits_14,{PmpPlugin_ports_0_hits_13,{PmpPlugin_ports_0_hits_12,{PmpPlugin_ports_0_hits_11,{PmpPlugin_ports_0_hits_10,{PmpPlugin_ports_0_hits_9,{PmpPlugin_ports_0_hits_8,{PmpPlugin_ports_0_hits_7,{PmpPlugin_ports_0_hits_6,{_zz_995,_zz_996}}}}}}}}}}};
  assign _zz_433 = (_zz_432 & (~ _zz_825));
  assign _zz_434 = _zz_433[3];
  assign _zz_435 = _zz_433[5];
  assign _zz_436 = _zz_433[6];
  assign _zz_437 = _zz_433[7];
  assign _zz_438 = _zz_433[9];
  assign _zz_439 = _zz_433[10];
  assign _zz_440 = _zz_433[11];
  assign _zz_441 = _zz_433[12];
  assign _zz_442 = _zz_433[13];
  assign _zz_443 = _zz_433[14];
  assign _zz_444 = _zz_433[15];
  assign _zz_445 = (((((((_zz_433[1] || _zz_434) || _zz_435) || _zz_437) || _zz_438) || _zz_440) || _zz_442) || _zz_444);
  assign _zz_446 = (((((((_zz_433[2] || _zz_434) || _zz_436) || _zz_437) || _zz_439) || _zz_440) || _zz_443) || _zz_444);
  assign _zz_447 = (((((((_zz_433[4] || _zz_435) || _zz_436) || _zz_437) || _zz_441) || _zz_442) || _zz_443) || _zz_444);
  assign _zz_448 = (((((((_zz_433[8] || _zz_438) || _zz_439) || _zz_440) || _zz_441) || _zz_442) || _zz_443) || _zz_444);
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = IBusCachedPlugin_mmuBus_rsp_physicalAddress[31];
  assign IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  assign PmpPlugin_ports_1_hits_0 = (((_zz_98 && (_zz_100 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_101)) && (_zz_99 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_1 = (((_zz_117 && (_zz_119 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_120)) && (_zz_118 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_2 = (((_zz_136 && (_zz_138 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_139)) && (_zz_137 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_3 = (((_zz_155 && (_zz_157 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_158)) && (_zz_156 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_4 = (((_zz_174 && (_zz_176 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_177)) && (_zz_175 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_5 = (((_zz_193 && (_zz_195 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_196)) && (_zz_194 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_6 = (((_zz_212 && (_zz_214 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_215)) && (_zz_213 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_7 = (((_zz_231 && (_zz_233 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_234)) && (_zz_232 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_8 = (((_zz_250 && (_zz_252 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_253)) && (_zz_251 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_9 = (((_zz_269 && (_zz_271 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_272)) && (_zz_270 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_10 = (((_zz_288 && (_zz_290 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_291)) && (_zz_289 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_11 = (((_zz_307 && (_zz_309 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_310)) && (_zz_308 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_12 = (((_zz_326 && (_zz_328 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_329)) && (_zz_327 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_13 = (((_zz_345 && (_zz_347 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_348)) && (_zz_346 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_14 = (((_zz_364 && (_zz_366 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_367)) && (_zz_365 || (! (CsrPlugin_privilege == 2'b11))));
  assign PmpPlugin_ports_1_hits_15 = (((_zz_383 && (_zz_385 <= DBusCachedPlugin_mmuBus_cmd_0_virtualAddress)) && (DBusCachedPlugin_mmuBus_cmd_0_virtualAddress < _zz_386)) && (_zz_384 || (! (CsrPlugin_privilege == 2'b11))));
  assign _zz_449 = 5'h0;
  assign _zz_450 = 5'h01;
  assign _zz_451 = 5'h01;
  assign _zz_452 = 5'h02;
  assign _zz_453 = 5'h01;
  assign _zz_454 = 5'h02;
  assign _zz_455 = 5'h02;
  assign _zz_456 = 5'h03;
  always @ (*) begin
    if(_zz_688)begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = (CsrPlugin_privilege == 2'b11);
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = _zz_668;
    end
  end

  always @ (*) begin
    if(_zz_688)begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = (CsrPlugin_privilege == 2'b11);
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = _zz_669;
    end
  end

  always @ (*) begin
    if(_zz_688)begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = (CsrPlugin_privilege == 2'b11);
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = _zz_670;
    end
  end

  assign _zz_457 = {PmpPlugin_ports_1_hits_15,{PmpPlugin_ports_1_hits_14,{PmpPlugin_ports_1_hits_13,{PmpPlugin_ports_1_hits_12,{PmpPlugin_ports_1_hits_11,{PmpPlugin_ports_1_hits_10,{PmpPlugin_ports_1_hits_9,{PmpPlugin_ports_1_hits_8,{PmpPlugin_ports_1_hits_7,{PmpPlugin_ports_1_hits_6,{_zz_997,_zz_998}}}}}}}}}}};
  assign _zz_458 = (_zz_457 & (~ _zz_833));
  assign _zz_459 = _zz_458[3];
  assign _zz_460 = _zz_458[5];
  assign _zz_461 = _zz_458[6];
  assign _zz_462 = _zz_458[7];
  assign _zz_463 = _zz_458[9];
  assign _zz_464 = _zz_458[10];
  assign _zz_465 = _zz_458[11];
  assign _zz_466 = _zz_458[12];
  assign _zz_467 = _zz_458[13];
  assign _zz_468 = _zz_458[14];
  assign _zz_469 = _zz_458[15];
  assign _zz_470 = (((((((_zz_458[1] || _zz_459) || _zz_460) || _zz_462) || _zz_463) || _zz_465) || _zz_467) || _zz_469);
  assign _zz_471 = (((((((_zz_458[2] || _zz_459) || _zz_461) || _zz_462) || _zz_464) || _zz_465) || _zz_468) || _zz_469);
  assign _zz_472 = (((((((_zz_458[4] || _zz_460) || _zz_461) || _zz_462) || _zz_466) || _zz_467) || _zz_468) || _zz_469);
  assign _zz_473 = (((((((_zz_458[8] || _zz_463) || _zz_464) || _zz_465) || _zz_466) || _zz_467) || _zz_468) || _zz_469);
  assign _zz_474 = {PmpPlugin_ports_1_hits_15,{PmpPlugin_ports_1_hits_14,{PmpPlugin_ports_1_hits_13,{PmpPlugin_ports_1_hits_12,{PmpPlugin_ports_1_hits_11,{PmpPlugin_ports_1_hits_10,{PmpPlugin_ports_1_hits_9,{PmpPlugin_ports_1_hits_8,{PmpPlugin_ports_1_hits_7,{PmpPlugin_ports_1_hits_6,{_zz_999,_zz_1000}}}}}}}}}}};
  assign _zz_475 = (_zz_474 & (~ _zz_834));
  assign _zz_476 = _zz_475[3];
  assign _zz_477 = _zz_475[5];
  assign _zz_478 = _zz_475[6];
  assign _zz_479 = _zz_475[7];
  assign _zz_480 = _zz_475[9];
  assign _zz_481 = _zz_475[10];
  assign _zz_482 = _zz_475[11];
  assign _zz_483 = _zz_475[12];
  assign _zz_484 = _zz_475[13];
  assign _zz_485 = _zz_475[14];
  assign _zz_486 = _zz_475[15];
  assign _zz_487 = (((((((_zz_475[1] || _zz_476) || _zz_477) || _zz_479) || _zz_480) || _zz_482) || _zz_484) || _zz_486);
  assign _zz_488 = (((((((_zz_475[2] || _zz_476) || _zz_478) || _zz_479) || _zz_481) || _zz_482) || _zz_485) || _zz_486);
  assign _zz_489 = (((((((_zz_475[4] || _zz_477) || _zz_478) || _zz_479) || _zz_483) || _zz_484) || _zz_485) || _zz_486);
  assign _zz_490 = (((((((_zz_475[8] || _zz_480) || _zz_481) || _zz_482) || _zz_483) || _zz_484) || _zz_485) || _zz_486);
  assign _zz_491 = {PmpPlugin_ports_1_hits_15,{PmpPlugin_ports_1_hits_14,{PmpPlugin_ports_1_hits_13,{PmpPlugin_ports_1_hits_12,{PmpPlugin_ports_1_hits_11,{PmpPlugin_ports_1_hits_10,{PmpPlugin_ports_1_hits_9,{PmpPlugin_ports_1_hits_8,{PmpPlugin_ports_1_hits_7,{PmpPlugin_ports_1_hits_6,{_zz_1001,_zz_1002}}}}}}}}}}};
  assign _zz_492 = (_zz_491 & (~ _zz_835));
  assign _zz_493 = _zz_492[3];
  assign _zz_494 = _zz_492[5];
  assign _zz_495 = _zz_492[6];
  assign _zz_496 = _zz_492[7];
  assign _zz_497 = _zz_492[9];
  assign _zz_498 = _zz_492[10];
  assign _zz_499 = _zz_492[11];
  assign _zz_500 = _zz_492[12];
  assign _zz_501 = _zz_492[13];
  assign _zz_502 = _zz_492[14];
  assign _zz_503 = _zz_492[15];
  assign _zz_504 = (((((((_zz_492[1] || _zz_493) || _zz_494) || _zz_496) || _zz_497) || _zz_499) || _zz_501) || _zz_503);
  assign _zz_505 = (((((((_zz_492[2] || _zz_493) || _zz_495) || _zz_496) || _zz_498) || _zz_499) || _zz_502) || _zz_503);
  assign _zz_506 = (((((((_zz_492[4] || _zz_494) || _zz_495) || _zz_496) || _zz_500) || _zz_501) || _zz_502) || _zz_503);
  assign _zz_507 = (((((((_zz_492[8] || _zz_497) || _zz_498) || _zz_499) || _zz_500) || _zz_501) || _zz_502) || _zz_503);
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_physicalAddress[31];
  assign DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  assign _zz_509 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_510 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_511 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_512 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_508 = {(_zz_512 != 1'b0),{(_zz_512 != 1'b0),{((_zz_1003 == _zz_1004) != 1'b0),{(_zz_1005 != 1'b0),{(_zz_1006 != _zz_1007),{_zz_1008,{_zz_1009,_zz_1010}}}}}}};
  assign _zz_513 = _zz_508[2 : 1];
  assign _zz_49 = _zz_513;
  assign _zz_514 = _zz_508[7 : 6];
  assign _zz_48 = _zz_514;
  assign _zz_515 = _zz_508[9 : 8];
  assign _zz_47 = _zz_515;
  assign _zz_516 = _zz_508[19 : 18];
  assign _zz_46 = _zz_516;
  assign _zz_517 = _zz_508[22 : 21];
  assign _zz_45 = _zz_517;
  assign _zz_518 = _zz_508[24 : 23];
  assign _zz_44 = _zz_518;
  assign _zz_519 = _zz_508[27 : 26];
  assign _zz_43 = _zz_519;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_650;
  assign decode_RegFilePlugin_rs2Data = _zz_651;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_41 && writeBack_arbitration_isFiring);
    if(_zz_520)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_40[11 : 7];
    if(_zz_520)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_50;
    if(_zz_520)begin
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
        _zz_521 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_521 = {31'd0, _zz_836};
      end
      default : begin
        _zz_521 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_522 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_522 = {29'd0, _zz_837};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_522 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_522 = {27'd0, _zz_838};
      end
    endcase
  end

  assign _zz_523 = _zz_839[11];
  always @ (*) begin
    _zz_524[19] = _zz_523;
    _zz_524[18] = _zz_523;
    _zz_524[17] = _zz_523;
    _zz_524[16] = _zz_523;
    _zz_524[15] = _zz_523;
    _zz_524[14] = _zz_523;
    _zz_524[13] = _zz_523;
    _zz_524[12] = _zz_523;
    _zz_524[11] = _zz_523;
    _zz_524[10] = _zz_523;
    _zz_524[9] = _zz_523;
    _zz_524[8] = _zz_523;
    _zz_524[7] = _zz_523;
    _zz_524[6] = _zz_523;
    _zz_524[5] = _zz_523;
    _zz_524[4] = _zz_523;
    _zz_524[3] = _zz_523;
    _zz_524[2] = _zz_523;
    _zz_524[1] = _zz_523;
    _zz_524[0] = _zz_523;
  end

  assign _zz_525 = _zz_840[11];
  always @ (*) begin
    _zz_526[19] = _zz_525;
    _zz_526[18] = _zz_525;
    _zz_526[17] = _zz_525;
    _zz_526[16] = _zz_525;
    _zz_526[15] = _zz_525;
    _zz_526[14] = _zz_525;
    _zz_526[13] = _zz_525;
    _zz_526[12] = _zz_525;
    _zz_526[11] = _zz_525;
    _zz_526[10] = _zz_525;
    _zz_526[9] = _zz_525;
    _zz_526[8] = _zz_525;
    _zz_526[7] = _zz_525;
    _zz_526[6] = _zz_525;
    _zz_526[5] = _zz_525;
    _zz_526[4] = _zz_525;
    _zz_526[3] = _zz_525;
    _zz_526[2] = _zz_525;
    _zz_526[1] = _zz_525;
    _zz_526[0] = _zz_525;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_527 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_527 = {_zz_524,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_527 = {_zz_526,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_527 = _zz_35;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_841;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_528[0] = execute_SRC1[31];
    _zz_528[1] = execute_SRC1[30];
    _zz_528[2] = execute_SRC1[29];
    _zz_528[3] = execute_SRC1[28];
    _zz_528[4] = execute_SRC1[27];
    _zz_528[5] = execute_SRC1[26];
    _zz_528[6] = execute_SRC1[25];
    _zz_528[7] = execute_SRC1[24];
    _zz_528[8] = execute_SRC1[23];
    _zz_528[9] = execute_SRC1[22];
    _zz_528[10] = execute_SRC1[21];
    _zz_528[11] = execute_SRC1[20];
    _zz_528[12] = execute_SRC1[19];
    _zz_528[13] = execute_SRC1[18];
    _zz_528[14] = execute_SRC1[17];
    _zz_528[15] = execute_SRC1[16];
    _zz_528[16] = execute_SRC1[15];
    _zz_528[17] = execute_SRC1[14];
    _zz_528[18] = execute_SRC1[13];
    _zz_528[19] = execute_SRC1[12];
    _zz_528[20] = execute_SRC1[11];
    _zz_528[21] = execute_SRC1[10];
    _zz_528[22] = execute_SRC1[9];
    _zz_528[23] = execute_SRC1[8];
    _zz_528[24] = execute_SRC1[7];
    _zz_528[25] = execute_SRC1[6];
    _zz_528[26] = execute_SRC1[5];
    _zz_528[27] = execute_SRC1[4];
    _zz_528[28] = execute_SRC1[3];
    _zz_528[29] = execute_SRC1[2];
    _zz_528[30] = execute_SRC1[1];
    _zz_528[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_528 : execute_SRC1);
  always @ (*) begin
    _zz_529[0] = memory_SHIFT_RIGHT[31];
    _zz_529[1] = memory_SHIFT_RIGHT[30];
    _zz_529[2] = memory_SHIFT_RIGHT[29];
    _zz_529[3] = memory_SHIFT_RIGHT[28];
    _zz_529[4] = memory_SHIFT_RIGHT[27];
    _zz_529[5] = memory_SHIFT_RIGHT[26];
    _zz_529[6] = memory_SHIFT_RIGHT[25];
    _zz_529[7] = memory_SHIFT_RIGHT[24];
    _zz_529[8] = memory_SHIFT_RIGHT[23];
    _zz_529[9] = memory_SHIFT_RIGHT[22];
    _zz_529[10] = memory_SHIFT_RIGHT[21];
    _zz_529[11] = memory_SHIFT_RIGHT[20];
    _zz_529[12] = memory_SHIFT_RIGHT[19];
    _zz_529[13] = memory_SHIFT_RIGHT[18];
    _zz_529[14] = memory_SHIFT_RIGHT[17];
    _zz_529[15] = memory_SHIFT_RIGHT[16];
    _zz_529[16] = memory_SHIFT_RIGHT[15];
    _zz_529[17] = memory_SHIFT_RIGHT[14];
    _zz_529[18] = memory_SHIFT_RIGHT[13];
    _zz_529[19] = memory_SHIFT_RIGHT[12];
    _zz_529[20] = memory_SHIFT_RIGHT[11];
    _zz_529[21] = memory_SHIFT_RIGHT[10];
    _zz_529[22] = memory_SHIFT_RIGHT[9];
    _zz_529[23] = memory_SHIFT_RIGHT[8];
    _zz_529[24] = memory_SHIFT_RIGHT[7];
    _zz_529[25] = memory_SHIFT_RIGHT[6];
    _zz_529[26] = memory_SHIFT_RIGHT[5];
    _zz_529[27] = memory_SHIFT_RIGHT[4];
    _zz_529[28] = memory_SHIFT_RIGHT[3];
    _zz_529[29] = memory_SHIFT_RIGHT[2];
    _zz_529[30] = memory_SHIFT_RIGHT[1];
    _zz_529[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_530 = 1'b0;
    if(_zz_689)begin
      if(_zz_690)begin
        if(_zz_535)begin
          _zz_530 = 1'b1;
        end
      end
    end
    if(_zz_691)begin
      if(_zz_692)begin
        if(_zz_537)begin
          _zz_530 = 1'b1;
        end
      end
    end
    if(_zz_693)begin
      if(_zz_694)begin
        if(_zz_539)begin
          _zz_530 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_530 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_531 = 1'b0;
    if(_zz_689)begin
      if(_zz_690)begin
        if(_zz_536)begin
          _zz_531 = 1'b1;
        end
      end
    end
    if(_zz_691)begin
      if(_zz_692)begin
        if(_zz_538)begin
          _zz_531 = 1'b1;
        end
      end
    end
    if(_zz_693)begin
      if(_zz_694)begin
        if(_zz_540)begin
          _zz_531 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_531 = 1'b0;
    end
  end

  assign _zz_535 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_536 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_537 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_538 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_539 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_540 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_541 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_541 == 3'b000)) begin
        _zz_542 = execute_BranchPlugin_eq;
    end else if((_zz_541 == 3'b001)) begin
        _zz_542 = (! execute_BranchPlugin_eq);
    end else if((((_zz_541 & 3'b101) == 3'b101))) begin
        _zz_542 = (! execute_SRC_LESS);
    end else begin
        _zz_542 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_543 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_543 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_543 = 1'b1;
      end
      default : begin
        _zz_543 = _zz_542;
      end
    endcase
  end

  assign _zz_544 = _zz_848[11];
  always @ (*) begin
    _zz_545[19] = _zz_544;
    _zz_545[18] = _zz_544;
    _zz_545[17] = _zz_544;
    _zz_545[16] = _zz_544;
    _zz_545[15] = _zz_544;
    _zz_545[14] = _zz_544;
    _zz_545[13] = _zz_544;
    _zz_545[12] = _zz_544;
    _zz_545[11] = _zz_544;
    _zz_545[10] = _zz_544;
    _zz_545[9] = _zz_544;
    _zz_545[8] = _zz_544;
    _zz_545[7] = _zz_544;
    _zz_545[6] = _zz_544;
    _zz_545[5] = _zz_544;
    _zz_545[4] = _zz_544;
    _zz_545[3] = _zz_544;
    _zz_545[2] = _zz_544;
    _zz_545[1] = _zz_544;
    _zz_545[0] = _zz_544;
  end

  assign _zz_546 = _zz_849[19];
  always @ (*) begin
    _zz_547[10] = _zz_546;
    _zz_547[9] = _zz_546;
    _zz_547[8] = _zz_546;
    _zz_547[7] = _zz_546;
    _zz_547[6] = _zz_546;
    _zz_547[5] = _zz_546;
    _zz_547[4] = _zz_546;
    _zz_547[3] = _zz_546;
    _zz_547[2] = _zz_546;
    _zz_547[1] = _zz_546;
    _zz_547[0] = _zz_546;
  end

  assign _zz_548 = _zz_850[11];
  always @ (*) begin
    _zz_549[18] = _zz_548;
    _zz_549[17] = _zz_548;
    _zz_549[16] = _zz_548;
    _zz_549[15] = _zz_548;
    _zz_549[14] = _zz_548;
    _zz_549[13] = _zz_548;
    _zz_549[12] = _zz_548;
    _zz_549[11] = _zz_548;
    _zz_549[10] = _zz_548;
    _zz_549[9] = _zz_548;
    _zz_549[8] = _zz_548;
    _zz_549[7] = _zz_548;
    _zz_549[6] = _zz_548;
    _zz_549[5] = _zz_548;
    _zz_549[4] = _zz_548;
    _zz_549[3] = _zz_548;
    _zz_549[2] = _zz_548;
    _zz_549[1] = _zz_548;
    _zz_549[0] = _zz_548;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_550 = (_zz_851[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_550 = _zz_852[1];
      end
      default : begin
        _zz_550 = _zz_853[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_550);
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

  assign _zz_551 = _zz_854[11];
  always @ (*) begin
    _zz_552[19] = _zz_551;
    _zz_552[18] = _zz_551;
    _zz_552[17] = _zz_551;
    _zz_552[16] = _zz_551;
    _zz_552[15] = _zz_551;
    _zz_552[14] = _zz_551;
    _zz_552[13] = _zz_551;
    _zz_552[12] = _zz_551;
    _zz_552[11] = _zz_551;
    _zz_552[10] = _zz_551;
    _zz_552[9] = _zz_551;
    _zz_552[8] = _zz_551;
    _zz_552[7] = _zz_551;
    _zz_552[6] = _zz_551;
    _zz_552[5] = _zz_551;
    _zz_552[4] = _zz_551;
    _zz_552[3] = _zz_551;
    _zz_552[2] = _zz_551;
    _zz_552[1] = _zz_551;
    _zz_552[0] = _zz_551;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_552,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_554,{{{_zz_1167,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_556,{{{_zz_1168,_zz_1169},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_857};
        end
      end
    endcase
  end

  assign _zz_553 = _zz_855[19];
  always @ (*) begin
    _zz_554[10] = _zz_553;
    _zz_554[9] = _zz_553;
    _zz_554[8] = _zz_553;
    _zz_554[7] = _zz_553;
    _zz_554[6] = _zz_553;
    _zz_554[5] = _zz_553;
    _zz_554[4] = _zz_553;
    _zz_554[3] = _zz_553;
    _zz_554[2] = _zz_553;
    _zz_554[1] = _zz_553;
    _zz_554[0] = _zz_553;
  end

  assign _zz_555 = _zz_856[11];
  always @ (*) begin
    _zz_556[18] = _zz_555;
    _zz_556[17] = _zz_555;
    _zz_556[16] = _zz_555;
    _zz_556[15] = _zz_555;
    _zz_556[14] = _zz_555;
    _zz_556[13] = _zz_555;
    _zz_556[12] = _zz_555;
    _zz_556[11] = _zz_555;
    _zz_556[10] = _zz_555;
    _zz_556[9] = _zz_555;
    _zz_556[8] = _zz_555;
    _zz_556[7] = _zz_555;
    _zz_556[6] = _zz_555;
    _zz_556[5] = _zz_555;
    _zz_556[4] = _zz_555;
    _zz_556[3] = _zz_555;
    _zz_556[2] = _zz_555;
    _zz_556[1] = _zz_555;
    _zz_556[0] = _zz_555;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @ (*) begin
    CsrPlugin_privilege = _zz_557;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign _zz_558 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_559 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_560 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_561 = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_562 = _zz_858[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_681)begin
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
    if(execute_CsrPlugin_csr_3264)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_944)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_945)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_946)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_947)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_948)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_949)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_950)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_951)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_952)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_953)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_954)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_955)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_956)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_957)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_958)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_959)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_928)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_929)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_930)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_931)begin
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
    if(execute_CsrPlugin_csr_769)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
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
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_832)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_835)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2816)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2944)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2818)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_2946)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_3072)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3074)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3202)begin
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
    if(_zz_695)begin
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
    if(_zz_696)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_697)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(_zz_696)begin
      CsrPlugin_selfException_payload_code = 4'b0010;
    end
    if(_zz_697)begin
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
    if(_zz_695)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_695)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_724)
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
    case(_zz_698)
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
    case(_zz_698)
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
  assign writeBack_MulPlugin_result = ($signed(_zz_860) + $signed(_zz_861));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_676)begin
      if(_zz_699)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_700)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_865);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_563 = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_563[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_866);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_867 : _zz_868);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_869[31:0];
  assign _zz_564 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_565 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_566 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_567[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_567[31 : 0] = execute_RS1;
  end

  assign _zz_569 = (_zz_568 & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_569 != 32'h0);
  assign _zz_26 = decode_SRC1_CTRL;
  assign _zz_24 = _zz_49;
  assign _zz_37 = decode_to_execute_SRC1_CTRL;
  assign _zz_23 = decode_ALU_CTRL;
  assign _zz_21 = _zz_48;
  assign _zz_38 = decode_to_execute_ALU_CTRL;
  assign _zz_20 = decode_SRC2_CTRL;
  assign _zz_18 = _zz_47;
  assign _zz_36 = decode_to_execute_SRC2_CTRL;
  assign _zz_17 = decode_ALU_BITWISE_CTRL;
  assign _zz_15 = _zz_46;
  assign _zz_39 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_14 = decode_SHIFT_CTRL;
  assign _zz_11 = execute_SHIFT_CTRL;
  assign _zz_12 = _zz_45;
  assign _zz_34 = decode_to_execute_SHIFT_CTRL;
  assign _zz_33 = execute_to_memory_SHIFT_CTRL;
  assign _zz_9 = decode_BRANCH_CTRL;
  assign _zz_51 = _zz_44;
  assign _zz_30 = decode_to_execute_BRANCH_CTRL;
  assign _zz_7 = decode_ENV_CTRL;
  assign _zz_4 = execute_ENV_CTRL;
  assign _zz_2 = memory_ENV_CTRL;
  assign _zz_5 = _zz_43;
  assign _zz_28 = decode_to_execute_ENV_CTRL;
  assign _zz_27 = execute_to_memory_ENV_CTRL;
  assign _zz_29 = memory_to_writeBack_ENV_CTRL;
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
    _zz_570 = 32'h0;
    if(execute_CsrPlugin_csr_3264)begin
      _zz_570[12 : 0] = 13'h1000;
      _zz_570[25 : 20] = 6'h20;
    end
  end

  always @ (*) begin
    _zz_571 = 32'h0;
    if(execute_CsrPlugin_csr_944)begin
      _zz_571[31 : 0] = _zz_91;
    end
  end

  always @ (*) begin
    _zz_572 = 32'h0;
    if(execute_CsrPlugin_csr_945)begin
      _zz_572[31 : 0] = _zz_110;
    end
  end

  always @ (*) begin
    _zz_573 = 32'h0;
    if(execute_CsrPlugin_csr_946)begin
      _zz_573[31 : 0] = _zz_129;
    end
  end

  always @ (*) begin
    _zz_574 = 32'h0;
    if(execute_CsrPlugin_csr_947)begin
      _zz_574[31 : 0] = _zz_148;
    end
  end

  always @ (*) begin
    _zz_575 = 32'h0;
    if(execute_CsrPlugin_csr_948)begin
      _zz_575[31 : 0] = _zz_167;
    end
  end

  always @ (*) begin
    _zz_576 = 32'h0;
    if(execute_CsrPlugin_csr_949)begin
      _zz_576[31 : 0] = _zz_186;
    end
  end

  always @ (*) begin
    _zz_577 = 32'h0;
    if(execute_CsrPlugin_csr_950)begin
      _zz_577[31 : 0] = _zz_205;
    end
  end

  always @ (*) begin
    _zz_578 = 32'h0;
    if(execute_CsrPlugin_csr_951)begin
      _zz_578[31 : 0] = _zz_224;
    end
  end

  always @ (*) begin
    _zz_579 = 32'h0;
    if(execute_CsrPlugin_csr_952)begin
      _zz_579[31 : 0] = _zz_243;
    end
  end

  always @ (*) begin
    _zz_580 = 32'h0;
    if(execute_CsrPlugin_csr_953)begin
      _zz_580[31 : 0] = _zz_262;
    end
  end

  always @ (*) begin
    _zz_581 = 32'h0;
    if(execute_CsrPlugin_csr_954)begin
      _zz_581[31 : 0] = _zz_281;
    end
  end

  always @ (*) begin
    _zz_582 = 32'h0;
    if(execute_CsrPlugin_csr_955)begin
      _zz_582[31 : 0] = _zz_300;
    end
  end

  always @ (*) begin
    _zz_583 = 32'h0;
    if(execute_CsrPlugin_csr_956)begin
      _zz_583[31 : 0] = _zz_319;
    end
  end

  always @ (*) begin
    _zz_584 = 32'h0;
    if(execute_CsrPlugin_csr_957)begin
      _zz_584[31 : 0] = _zz_338;
    end
  end

  always @ (*) begin
    _zz_585 = 32'h0;
    if(execute_CsrPlugin_csr_958)begin
      _zz_585[31 : 0] = _zz_357;
    end
  end

  always @ (*) begin
    _zz_586 = 32'h0;
    if(execute_CsrPlugin_csr_959)begin
      _zz_586[31 : 0] = _zz_376;
    end
  end

  always @ (*) begin
    _zz_587 = 32'h0;
    if(execute_CsrPlugin_csr_928)begin
      _zz_587[31 : 31] = _zz_146;
      _zz_587[23 : 23] = _zz_127;
      _zz_587[15 : 15] = _zz_108;
      _zz_587[7 : 7] = _zz_89;
      _zz_587[28 : 27] = _zz_147;
      _zz_587[26 : 26] = _zz_145;
      _zz_587[25 : 25] = _zz_144;
      _zz_587[24 : 24] = _zz_143;
      _zz_587[20 : 19] = _zz_128;
      _zz_587[18 : 18] = _zz_126;
      _zz_587[17 : 17] = _zz_125;
      _zz_587[16 : 16] = _zz_124;
      _zz_587[12 : 11] = _zz_109;
      _zz_587[10 : 10] = _zz_107;
      _zz_587[9 : 9] = _zz_106;
      _zz_587[8 : 8] = _zz_105;
      _zz_587[4 : 3] = _zz_90;
      _zz_587[2 : 2] = _zz_88;
      _zz_587[1 : 1] = _zz_87;
      _zz_587[0 : 0] = _zz_86;
    end
  end

  always @ (*) begin
    _zz_588 = 32'h0;
    if(execute_CsrPlugin_csr_929)begin
      _zz_588[31 : 31] = _zz_222;
      _zz_588[23 : 23] = _zz_203;
      _zz_588[15 : 15] = _zz_184;
      _zz_588[7 : 7] = _zz_165;
      _zz_588[28 : 27] = _zz_223;
      _zz_588[26 : 26] = _zz_221;
      _zz_588[25 : 25] = _zz_220;
      _zz_588[24 : 24] = _zz_219;
      _zz_588[20 : 19] = _zz_204;
      _zz_588[18 : 18] = _zz_202;
      _zz_588[17 : 17] = _zz_201;
      _zz_588[16 : 16] = _zz_200;
      _zz_588[12 : 11] = _zz_185;
      _zz_588[10 : 10] = _zz_183;
      _zz_588[9 : 9] = _zz_182;
      _zz_588[8 : 8] = _zz_181;
      _zz_588[4 : 3] = _zz_166;
      _zz_588[2 : 2] = _zz_164;
      _zz_588[1 : 1] = _zz_163;
      _zz_588[0 : 0] = _zz_162;
    end
  end

  always @ (*) begin
    _zz_589 = 32'h0;
    if(execute_CsrPlugin_csr_930)begin
      _zz_589[31 : 31] = _zz_298;
      _zz_589[23 : 23] = _zz_279;
      _zz_589[15 : 15] = _zz_260;
      _zz_589[7 : 7] = _zz_241;
      _zz_589[28 : 27] = _zz_299;
      _zz_589[26 : 26] = _zz_297;
      _zz_589[25 : 25] = _zz_296;
      _zz_589[24 : 24] = _zz_295;
      _zz_589[20 : 19] = _zz_280;
      _zz_589[18 : 18] = _zz_278;
      _zz_589[17 : 17] = _zz_277;
      _zz_589[16 : 16] = _zz_276;
      _zz_589[12 : 11] = _zz_261;
      _zz_589[10 : 10] = _zz_259;
      _zz_589[9 : 9] = _zz_258;
      _zz_589[8 : 8] = _zz_257;
      _zz_589[4 : 3] = _zz_242;
      _zz_589[2 : 2] = _zz_240;
      _zz_589[1 : 1] = _zz_239;
      _zz_589[0 : 0] = _zz_238;
    end
  end

  always @ (*) begin
    _zz_590 = 32'h0;
    if(execute_CsrPlugin_csr_931)begin
      _zz_590[31 : 31] = _zz_374;
      _zz_590[23 : 23] = _zz_355;
      _zz_590[15 : 15] = _zz_336;
      _zz_590[7 : 7] = _zz_317;
      _zz_590[28 : 27] = _zz_375;
      _zz_590[26 : 26] = _zz_373;
      _zz_590[25 : 25] = _zz_372;
      _zz_590[24 : 24] = _zz_371;
      _zz_590[20 : 19] = _zz_356;
      _zz_590[18 : 18] = _zz_354;
      _zz_590[17 : 17] = _zz_353;
      _zz_590[16 : 16] = _zz_352;
      _zz_590[12 : 11] = _zz_337;
      _zz_590[10 : 10] = _zz_335;
      _zz_590[9 : 9] = _zz_334;
      _zz_590[8 : 8] = _zz_333;
      _zz_590[4 : 3] = _zz_318;
      _zz_590[2 : 2] = _zz_316;
      _zz_590[1 : 1] = _zz_315;
      _zz_590[0 : 0] = _zz_314;
    end
  end

  always @ (*) begin
    _zz_591 = 32'h0;
    if(execute_CsrPlugin_csr_3857)begin
      _zz_591[0 : 0] = 1'b1;
    end
  end

  always @ (*) begin
    _zz_592 = 32'h0;
    if(execute_CsrPlugin_csr_3858)begin
      _zz_592[1 : 0] = 2'b10;
    end
  end

  always @ (*) begin
    _zz_593 = 32'h0;
    if(execute_CsrPlugin_csr_3859)begin
      _zz_593[1 : 0] = 2'b11;
    end
  end

  always @ (*) begin
    _zz_594 = 32'h0;
    if(execute_CsrPlugin_csr_769)begin
      _zz_594[31 : 30] = CsrPlugin_misa_base;
      _zz_594[25 : 0] = CsrPlugin_misa_extensions;
    end
  end

  always @ (*) begin
    _zz_595 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_595[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_595[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_595[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_596 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_596[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_596[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_596[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_597 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_597[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_597[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_597[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_598 = 32'h0;
    if(execute_CsrPlugin_csr_773)begin
      _zz_598[31 : 2] = CsrPlugin_mtvec_base;
      _zz_598[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @ (*) begin
    _zz_599 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_599[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_600 = 32'h0;
    if(execute_CsrPlugin_csr_832)begin
      _zz_600[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @ (*) begin
    _zz_601 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_601[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_601[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_602 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_602[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @ (*) begin
    _zz_603 = 32'h0;
    if(execute_CsrPlugin_csr_2816)begin
      _zz_603[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_604 = 32'h0;
    if(execute_CsrPlugin_csr_2944)begin
      _zz_604[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_605 = 32'h0;
    if(execute_CsrPlugin_csr_2818)begin
      _zz_605[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @ (*) begin
    _zz_606 = 32'h0;
    if(execute_CsrPlugin_csr_2946)begin
      _zz_606[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  always @ (*) begin
    _zz_607 = 32'h0;
    if(execute_CsrPlugin_csr_3072)begin
      _zz_607[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_608 = 32'h0;
    if(execute_CsrPlugin_csr_3200)begin
      _zz_608[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @ (*) begin
    _zz_609 = 32'h0;
    if(execute_CsrPlugin_csr_3074)begin
      _zz_609[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @ (*) begin
    _zz_610 = 32'h0;
    if(execute_CsrPlugin_csr_3202)begin
      _zz_610[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  always @ (*) begin
    _zz_611 = 32'h0;
    if(execute_CsrPlugin_csr_3008)begin
      _zz_611[31 : 0] = _zz_568;
    end
  end

  always @ (*) begin
    _zz_612 = 32'h0;
    if(execute_CsrPlugin_csr_4032)begin
      _zz_612[31 : 0] = _zz_569;
    end
  end

  assign execute_CsrPlugin_readData = (((((_zz_1170 | _zz_1171) | (_zz_1172 | _zz_1173)) | ((_zz_1174 | _zz_1175) | (_zz_1176 | _zz_1177))) | (((_zz_1178 | _zz_1179) | (_zz_1180 | _zz_1181)) | ((_zz_1182 | _zz_1183) | (_zz_1184 | _zz_1185)))) | ((((_zz_601 | _zz_602) | (_zz_603 | _zz_604)) | ((_zz_605 | _zz_606) | (_zz_607 | _zz_608))) | ((_zz_609 | _zz_610) | (_zz_611 | _zz_612))));
  assign iBusWishbone_ADR = {_zz_950,_zz_613};
  assign iBusWishbone_CTI = ((_zz_613 == 3'b111) ? 3'b111 : 3'b010);
  assign iBusWishbone_BTE = 2'b00;
  assign iBusWishbone_SEL = 4'b1111;
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = 32'h0;
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    if(_zz_701)begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWishbone_STB = 1'b0;
    if(_zz_701)begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_614;
  assign iBus_rsp_payload_data = iBusWishbone_DAT_MISO_regNext;
  assign iBus_rsp_payload_error = 1'b0;
  assign _zz_620 = (dBus_cmd_payload_length != 3'b000);
  assign _zz_616 = dBus_cmd_valid;
  assign _zz_618 = dBus_cmd_payload_wr;
  assign _zz_619 = (_zz_615 == dBus_cmd_payload_length);
  assign dBus_cmd_ready = (_zz_617 && (_zz_618 || _zz_619));
  assign dBusWishbone_ADR = ((_zz_620 ? {{dBus_cmd_payload_address[31 : 5],_zz_615},2'b00} : {dBus_cmd_payload_address[31 : 2],2'b00}) >>> 2);
  assign dBusWishbone_CTI = (_zz_620 ? (_zz_619 ? 3'b111 : 3'b010) : 3'b000);
  assign dBusWishbone_BTE = 2'b00;
  assign dBusWishbone_SEL = (_zz_618 ? dBus_cmd_payload_mask : 4'b1111);
  assign dBusWishbone_WE = _zz_618;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_payload_data;
  assign _zz_617 = (_zz_616 && dBusWishbone_ACK);
  assign dBusWishbone_CYC = _zz_616;
  assign dBusWishbone_STB = _zz_616;
  assign dBus_rsp_valid = _zz_621;
  assign dBus_rsp_payload_data = dBusWishbone_DAT_MISO_regNext;
  assign dBus_rsp_payload_error = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_64 <= 1'b0;
      _zz_66 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_79;
      IBusCachedPlugin_rspCounter <= 32'h0;
      dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid <= 1'b0;
      DBusCachedPlugin_rspCounter <= _zz_80;
      DBusCachedPlugin_rspCounter <= 32'h0;
      _zz_89 <= 1'b0;
      _zz_90 <= 2'b00;
      _zz_108 <= 1'b0;
      _zz_109 <= 2'b00;
      _zz_127 <= 1'b0;
      _zz_128 <= 2'b00;
      _zz_146 <= 1'b0;
      _zz_147 <= 2'b00;
      _zz_165 <= 1'b0;
      _zz_166 <= 2'b00;
      _zz_184 <= 1'b0;
      _zz_185 <= 2'b00;
      _zz_203 <= 1'b0;
      _zz_204 <= 2'b00;
      _zz_222 <= 1'b0;
      _zz_223 <= 2'b00;
      _zz_241 <= 1'b0;
      _zz_242 <= 2'b00;
      _zz_260 <= 1'b0;
      _zz_261 <= 2'b00;
      _zz_279 <= 1'b0;
      _zz_280 <= 2'b00;
      _zz_298 <= 1'b0;
      _zz_299 <= 2'b00;
      _zz_317 <= 1'b0;
      _zz_318 <= 2'b00;
      _zz_336 <= 1'b0;
      _zz_337 <= 2'b00;
      _zz_355 <= 1'b0;
      _zz_356 <= 2'b00;
      _zz_374 <= 1'b0;
      _zz_375 <= 2'b00;
      _zz_520 <= 1'b1;
      _zz_532 <= 1'b0;
      _zz_557 <= 2'b11;
      CsrPlugin_misa_base <= 2'b01;
      CsrPlugin_misa_extensions <= 26'h0101064;
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
      CsrPlugin_lastStageWasWfi <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      memory_DivPlugin_div_counter_value <= 6'h0;
      _zz_568 <= 32'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_613 <= 3'b000;
      _zz_614 <= 1'b0;
      _zz_615 <= 3'b000;
      _zz_621 <= 1'b0;
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
        _zz_64 <= 1'b0;
      end
      if(_zz_62)begin
        _zz_64 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_66 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_66 <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
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
      if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_702)begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= dataCache_1_io_mem_cmd_valid;
      end
      if(dataCache_1_io_mem_cmd_s2mPipe_ready)begin
        dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_rValid <= dataCache_1_io_mem_cmd_s2mPipe_valid;
      end
      if(dBus_rsp_valid)begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(_zz_703)begin
        _zz_89 <= _zz_95;
        _zz_90 <= _zz_96;
      end
      if(_zz_704)begin
        _zz_108 <= _zz_114;
        _zz_109 <= _zz_115;
      end
      if(_zz_705)begin
        _zz_127 <= _zz_133;
        _zz_128 <= _zz_134;
      end
      if(_zz_706)begin
        _zz_146 <= _zz_152;
        _zz_147 <= _zz_153;
      end
      if(_zz_707)begin
        _zz_165 <= _zz_171;
        _zz_166 <= _zz_172;
      end
      if(_zz_708)begin
        _zz_184 <= _zz_190;
        _zz_185 <= _zz_191;
      end
      if(_zz_709)begin
        _zz_203 <= _zz_209;
        _zz_204 <= _zz_210;
      end
      if(_zz_710)begin
        _zz_222 <= _zz_228;
        _zz_223 <= _zz_229;
      end
      if(_zz_711)begin
        _zz_241 <= _zz_247;
        _zz_242 <= _zz_248;
      end
      if(_zz_712)begin
        _zz_260 <= _zz_266;
        _zz_261 <= _zz_267;
      end
      if(_zz_713)begin
        _zz_279 <= _zz_285;
        _zz_280 <= _zz_286;
      end
      if(_zz_714)begin
        _zz_298 <= _zz_304;
        _zz_299 <= _zz_305;
      end
      if(_zz_715)begin
        _zz_317 <= _zz_323;
        _zz_318 <= _zz_324;
      end
      if(_zz_716)begin
        _zz_336 <= _zz_342;
        _zz_337 <= _zz_343;
      end
      if(_zz_717)begin
        _zz_355 <= _zz_361;
        _zz_356 <= _zz_362;
      end
      if(_zz_718)begin
        _zz_374 <= _zz_380;
        _zz_375 <= _zz_381;
      end
      _zz_520 <= 1'b0;
      _zz_532 <= (_zz_41 && writeBack_arbitration_isFiring);
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
      if(_zz_719)begin
        if(_zz_720)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_721)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_722)begin
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
      if(_zz_683)begin
        _zz_557 <= CsrPlugin_targetPrivilege;
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
      if(_zz_684)begin
        case(_zz_685)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
            _zz_557 <= CsrPlugin_mstatus_MPP;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_560,{_zz_559,_zz_558}} != 3'b000) || CsrPlugin_thirdPartyWake);
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
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
      if(execute_CsrPlugin_csr_769)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_misa_base <= execute_CsrPlugin_writeData[31 : 30];
          CsrPlugin_misa_extensions <= execute_CsrPlugin_writeData[25 : 0];
        end
      end
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_943[0];
          CsrPlugin_mstatus_MIE <= _zz_944[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_946[0];
          CsrPlugin_mie_MTIE <= _zz_947[0];
          CsrPlugin_mie_MSIE <= _zz_948[0];
        end
      end
      if(execute_CsrPlugin_csr_3008)begin
        if(execute_CsrPlugin_writeEnable)begin
          _zz_568 <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      if(_zz_701)begin
        if(iBusWishbone_ACK)begin
          _zz_613 <= (_zz_613 + 3'b001);
        end
      end
      _zz_614 <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if((_zz_616 && _zz_617))begin
        _zz_615 <= (_zz_615 + 3'b001);
        if(_zz_619)begin
          _zz_615 <= 3'b000;
        end
      end
      _zz_621 <= ((_zz_616 && (! dBusWishbone_WE)) && dBusWishbone_ACK);
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_67 <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(_zz_702)begin
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
    if(_zz_703)begin
      _zz_86 <= _zz_92;
      _zz_87 <= _zz_93;
      _zz_88 <= _zz_94;
      _zz_91 <= _zz_97;
    end
    if(_zz_704)begin
      _zz_105 <= _zz_111;
      _zz_106 <= _zz_112;
      _zz_107 <= _zz_113;
      _zz_110 <= _zz_116;
    end
    if(_zz_705)begin
      _zz_124 <= _zz_130;
      _zz_125 <= _zz_131;
      _zz_126 <= _zz_132;
      _zz_129 <= _zz_135;
    end
    if(_zz_706)begin
      _zz_143 <= _zz_149;
      _zz_144 <= _zz_150;
      _zz_145 <= _zz_151;
      _zz_148 <= _zz_154;
    end
    if(_zz_707)begin
      _zz_162 <= _zz_168;
      _zz_163 <= _zz_169;
      _zz_164 <= _zz_170;
      _zz_167 <= _zz_173;
    end
    if(_zz_708)begin
      _zz_181 <= _zz_187;
      _zz_182 <= _zz_188;
      _zz_183 <= _zz_189;
      _zz_186 <= _zz_192;
    end
    if(_zz_709)begin
      _zz_200 <= _zz_206;
      _zz_201 <= _zz_207;
      _zz_202 <= _zz_208;
      _zz_205 <= _zz_211;
    end
    if(_zz_710)begin
      _zz_219 <= _zz_225;
      _zz_220 <= _zz_226;
      _zz_221 <= _zz_227;
      _zz_224 <= _zz_230;
    end
    if(_zz_711)begin
      _zz_238 <= _zz_244;
      _zz_239 <= _zz_245;
      _zz_240 <= _zz_246;
      _zz_243 <= _zz_249;
    end
    if(_zz_712)begin
      _zz_257 <= _zz_263;
      _zz_258 <= _zz_264;
      _zz_259 <= _zz_265;
      _zz_262 <= _zz_268;
    end
    if(_zz_713)begin
      _zz_276 <= _zz_282;
      _zz_277 <= _zz_283;
      _zz_278 <= _zz_284;
      _zz_281 <= _zz_287;
    end
    if(_zz_714)begin
      _zz_295 <= _zz_301;
      _zz_296 <= _zz_302;
      _zz_297 <= _zz_303;
      _zz_300 <= _zz_306;
    end
    if(_zz_715)begin
      _zz_314 <= _zz_320;
      _zz_315 <= _zz_321;
      _zz_316 <= _zz_322;
      _zz_319 <= _zz_325;
    end
    if(_zz_716)begin
      _zz_333 <= _zz_339;
      _zz_334 <= _zz_340;
      _zz_335 <= _zz_341;
      _zz_338 <= _zz_344;
    end
    if(_zz_717)begin
      _zz_352 <= _zz_358;
      _zz_353 <= _zz_359;
      _zz_354 <= _zz_360;
      _zz_357 <= _zz_363;
    end
    if(_zz_718)begin
      _zz_371 <= _zz_377;
      _zz_372 <= _zz_378;
      _zz_373 <= _zz_379;
      _zz_376 <= _zz_382;
    end
    _zz_533 <= _zz_40[11 : 7];
    _zz_534 <= _zz_50;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_681)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_562 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_562 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
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
    if(_zz_719)begin
      if(_zz_720)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_721)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_722)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_683)begin
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
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_676)begin
      if(_zz_699)begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_870[31:0];
        end
      end
    end
    if(_zz_700)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_566 ? (~ _zz_567) : _zz_567) + _zz_876);
      memory_DivPlugin_rs2 <= ((_zz_565 ? (~ execute_RS2) : execute_RS2) + _zz_878);
      memory_DivPlugin_div_needRevert <= ((_zz_566 ^ (_zz_565 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_35;
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
      decode_to_execute_FORMAL_PC_NEXT <= _zz_53;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_52;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_25;
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
      decode_to_execute_ALU_CTRL <= _zz_22;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_19;
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
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_16;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_13;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_10;
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
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
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
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_31;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_32;
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
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3264 <= (decode_INSTRUCTION[31 : 20] == 12'hcc0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_944 <= (decode_INSTRUCTION[31 : 20] == 12'h3b0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_945 <= (decode_INSTRUCTION[31 : 20] == 12'h3b1);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_946 <= (decode_INSTRUCTION[31 : 20] == 12'h3b2);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_947 <= (decode_INSTRUCTION[31 : 20] == 12'h3b3);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_948 <= (decode_INSTRUCTION[31 : 20] == 12'h3b4);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_949 <= (decode_INSTRUCTION[31 : 20] == 12'h3b5);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_950 <= (decode_INSTRUCTION[31 : 20] == 12'h3b6);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_951 <= (decode_INSTRUCTION[31 : 20] == 12'h3b7);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_952 <= (decode_INSTRUCTION[31 : 20] == 12'h3b8);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_953 <= (decode_INSTRUCTION[31 : 20] == 12'h3b9);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_954 <= (decode_INSTRUCTION[31 : 20] == 12'h3ba);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_955 <= (decode_INSTRUCTION[31 : 20] == 12'h3bb);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_956 <= (decode_INSTRUCTION[31 : 20] == 12'h3bc);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_957 <= (decode_INSTRUCTION[31 : 20] == 12'h3bd);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_958 <= (decode_INSTRUCTION[31 : 20] == 12'h3be);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_959 <= (decode_INSTRUCTION[31 : 20] == 12'h3bf);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_928 <= (decode_INSTRUCTION[31 : 20] == 12'h3a0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_929 <= (decode_INSTRUCTION[31 : 20] == 12'h3a1);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_930 <= (decode_INSTRUCTION[31 : 20] == 12'h3a2);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_931 <= (decode_INSTRUCTION[31 : 20] == 12'h3a3);
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
      execute_CsrPlugin_csr_769 <= (decode_INSTRUCTION[31 : 20] == 12'h301);
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
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
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
      execute_CsrPlugin_csr_2818 <= (decode_INSTRUCTION[31 : 20] == 12'hb02);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_2946 <= (decode_INSTRUCTION[31 : 20] == 12'hb82);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3074 <= (decode_INSTRUCTION[31 : 20] == 12'hc02);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3202 <= (decode_INSTRUCTION[31 : 20] == 12'hc82);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3008 <= (decode_INSTRUCTION[31 : 20] == 12'hbc0);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_4032 <= (decode_INSTRUCTION[31 : 20] == 12'hfc0);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_945[0];
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
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mcause_interrupt <= _zz_949[0];
        CsrPlugin_mcause_exceptionCode <= execute_CsrPlugin_writeData[3 : 0];
      end
    end
    if(execute_CsrPlugin_csr_835)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mtval <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_2816)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mcycle[31 : 0] <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_2944)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mcycle[63 : 32] <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_2818)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_minstret[31 : 0] <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_2946)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_minstret[63 : 32] <= execute_CsrPlugin_writeData[31 : 0];
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
  wire       [0:0]    _zz_19;
  wire       [0:0]    _zz_20;
  wire       [9:0]    _zz_21;
  wire       [9:0]    _zz_22;
  wire       [0:0]    _zz_23;
  wire       [0:0]    _zz_24;
  wire       [2:0]    _zz_25;
  wire       [1:0]    _zz_26;
  wire       [21:0]   _zz_27;
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
  wire                stage0_isAmo;
  reg                 stageA_request_wr;
  reg        [31:0]   stageA_request_data;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_totalyConsistent;
  reg        [3:0]    stageA_mask;
  wire                stageA_isAmo;
  wire                stageA_isLrsc;
  wire       [0:0]    stageA_wayHits;
  wire       [0:0]    _zz_7;
  reg        [0:0]    stageA_wayInvalidate;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_8;
  wire       [0:0]    stageA_dataColisions;
  reg                 stageB_request_wr;
  reg        [31:0]   stageB_request_data;
  reg        [1:0]    stageB_request_size;
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
  wire                stageB_isAmo;
  wire                stageB_isAmoCached;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  wire       [31:0]   stageB_requestDataBypass;
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
  reg [7:0] _zz_28;
  reg [7:0] _zz_29;
  reg [7:0] _zz_30;
  reg [7:0] _zz_31;

  assign _zz_12 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  assign _zz_13 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign _zz_14 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign _zz_15 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  assign _zz_16 = (stageB_waysHit || (stageB_request_wr && (! stageB_isAmoCached)));
  assign _zz_17 = (! stageB_flusher_hold);
  assign _zz_18 = (stageB_mmuRsp_physicalAddress[11 : 5] != 7'h7f);
  assign _zz_19 = _zz_4[0 : 0];
  assign _zz_20 = _zz_4[1 : 1];
  assign _zz_21 = (io_cpu_execute_address[11 : 2] >>> 0);
  assign _zz_22 = (io_cpu_memory_address[11 : 2] >>> 0);
  assign _zz_23 = 1'b1;
  assign _zz_24 = loader_counter_willIncrement;
  assign _zz_25 = {2'd0, _zz_24};
  assign _zz_26 = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_27 = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_3) begin
      _zz_10 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_27;
    end
  end

  always @ (*) begin
    _zz_11 = {_zz_31, _zz_30, _zz_29, _zz_28};
  end
  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_28 <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_29 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_30 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_31 <= ways_0_data_symbol3[dataReadCmd_payload];
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
  assign ways_0_tagsReadRsp_valid = _zz_19[0];
  assign ways_0_tagsReadRsp_error = _zz_20[0];
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
    if(_zz_13)begin
      dataWriteCmd_valid = 1'b0;
    end
    if(_zz_14)begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(_zz_14)begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_address = 10'h0;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
    end
    if(_zz_14)begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_data = 32'h0;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(_zz_14)begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_23[0])begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(_zz_14)begin
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
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_21)) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign stage0_isAmo = 1'b0;
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_isAmo = 1'b0;
  assign stageA_isLrsc = 1'b0;
  assign _zz_7[0] = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign stageA_wayHits = _zz_7;
  assign _zz_8[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_22)) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
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
        if(! _zz_15) begin
          if(! _zz_16) begin
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
        if(_zz_15)begin
          if(((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(_zz_16)begin
            if(((! stageB_request_wr) || io_mem_cmd_ready))begin
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

  assign stageB_isAmo = 1'b0;
  assign stageB_isAmoCached = 1'b0;
  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  assign stageB_requestDataBypass = stageB_request_data;
  always @ (*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(_zz_16)begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @ (*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(_zz_16)begin
            if((((! stageB_request_wr) || stageB_isAmoCached) && ((stageB_dataColisions & stageB_waysHits) != 1'b0)))begin
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
        if(_zz_15)begin
          io_mem_cmd_valid = (! memCmdSent);
        end else begin
          if(_zz_16)begin
            if(stageB_request_wr)begin
              io_mem_cmd_valid = 1'b1;
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
        if(! _zz_15) begin
          if(_zz_16)begin
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
        if(! _zz_15) begin
          if(_zz_16)begin
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
        if(! _zz_15) begin
          if(! _zz_16) begin
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
  end

  assign _zz_9[0] = stageB_tagsReadRsp_0_error;
  always @ (*) begin
    loader_counter_willIncrement = 1'b0;
    if(_zz_14)begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 3'b111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_25);
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
      if(_zz_17)begin
        if(_zz_18)begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + 7'h01);
        end
      end
    end
    if(stageB_flusher_start)begin
      stageB_mmuRsp_physicalAddress[11 : 5] <= 7'h0;
    end
    loader_valid_regNext <= loader_valid;
  end

  always @ (posedge clk) begin
    if(reset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_valid <= 1'b0;
      stageB_flusher_start <= 1'b1;
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
        if(_zz_17)begin
          if(! _zz_18) begin
            stageB_flusher_valid <= 1'b0;
          end
        end
      end
      stageB_flusher_start <= ((((((! stageB_flusher_start) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start)begin
        stageB_flusher_valid <= 1'b1;
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
      if(_zz_14)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done)begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if((! loader_valid))begin
        loader_waysAllocator <= _zz_26[0:0];
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
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_valid <= fetchStage_hit_valid;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_error <= fetchStage_hit_error;
    end
  end


endmodule
