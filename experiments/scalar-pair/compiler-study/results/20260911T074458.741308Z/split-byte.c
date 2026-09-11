// Lean compiler output
// Module: ByteWork
// Imports: public import Init public meta import Init public import SplitProd public import Std
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* lean_uint8_to_nat(uint8_t);
uint64_t lean_uint64_of_nat(lean_object*);
uint64_t lean_uint64_add(uint64_t, uint64_t);
uint64_t lean_uint64_mul(uint64_t, uint64_t);
size_t lean_usize_add(size_t, size_t);
lean_object* lean_byte_array_size(lean_object*);
size_t lean_usize_of_nat(lean_object*);
uint8_t lean_usize_dec_lt(size_t, size_t);
lean_object* lean_usize_to_nat(size_t);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
extern uint8_t l_instInhabitedUInt8;
lean_object* l_outOfBounds___redArg(lean_object*);
uint8_t lean_byte_array_fget(lean_object*, lean_object*);
uint8_t lean_usize_dec_eq(size_t, size_t);
lean_object* lean_nat_add(lean_object*, lean_object*);
uint64_t lean_uint64_shift_right(uint64_t, uint64_t);
uint64_t lean_uint64_xor(uint64_t, uint64_t);
lean_object* lean_nat_mul(lean_object*, lean_object*);
lean_object* lean_nat_mod(lean_object*, lean_object*);
uint8_t lean_uint8_of_nat(lean_object*);
lean_object* lean_byte_array_push(lean_object*, uint8_t);
lean_object* l_List_getD___redArg(lean_object*, lean_object*, lean_object*);
lean_object* lean_string_utf8_byte_size(lean_object*);
lean_object* l_String_Slice_toNat_x3f(lean_object*);
extern lean_object* l_ByteArray_empty;
lean_object* lean_nat_shiftr(lean_object*, lean_object*);
uint8_t lean_string_dec_eq(lean_object*, lean_object*);
lean_object* lean_string_append(lean_object*, lean_object*);
lean_object* lean_io_mono_nanos_now();
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* l_Nat_reprFast(lean_object*);
lean_object* lean_uint64_to_nat(uint64_t);
lean_object* l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_checksumByte(uint64_t, uint8_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_checksumByte___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_finishRound(uint64_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_finishRound___boxed(lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_makeBuf(lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_natWhile(lean_object*, lean_object*, uint64_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_natWhile___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd(lean_object*, uint64_t, size_t);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_usizeWhile(lean_object*, lean_object*, uint64_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_usizeWhile___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(size_t, lean_object*, size_t, uint64_t);
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_usizeFor(lean_object*, lean_object*, uint64_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_usizeFor___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0(size_t, lean_object*, lean_object*, lean_object*, size_t, uint64_t, lean_object*);
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_stateWhile(lean_object*, lean_object*, uint64_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_stateWhile___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l_CompilerStudy_ByteWork_runVariant___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "nat-while"};
static const lean_object* l_CompilerStudy_ByteWork_runVariant___closed__0 = (const lean_object*)&l_CompilerStudy_ByteWork_runVariant___closed__0_value;
static const lean_string_object l_CompilerStudy_ByteWork_runVariant___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "usize-while"};
static const lean_object* l_CompilerStudy_ByteWork_runVariant___closed__1 = (const lean_object*)&l_CompilerStudy_ByteWork_runVariant___closed__1_value;
static const lean_string_object l_CompilerStudy_ByteWork_runVariant___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "usize-for"};
static const lean_object* l_CompilerStudy_ByteWork_runVariant___closed__2 = (const lean_object*)&l_CompilerStudy_ByteWork_runVariant___closed__2_value;
static const lean_string_object l_CompilerStudy_ByteWork_runVariant___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "state-while"};
static const lean_object* l_CompilerStudy_ByteWork_runVariant___closed__3 = (const lean_object*)&l_CompilerStudy_ByteWork_runVariant___closed__3_value;
static const lean_string_object l_CompilerStudy_ByteWork_runVariant___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 18, .m_capacity = 18, .m_length = 17, .m_data = "unknown variant: "};
static const lean_object* l_CompilerStudy_ByteWork_runVariant___closed__4 = (const lean_object*)&l_CompilerStudy_ByteWork_runVariant___closed__4_value;
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runVariant(lean_object*, lean_object*, lean_object*, uint64_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runVariant___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_parseNat(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_parseNat___boxed(lean_object*, lean_object*);
static const lean_string_object l_CompilerStudy_ByteWork_runMain___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "1048576"};
static const lean_object* l_CompilerStudy_ByteWork_runMain___closed__0 = (const lean_object*)&l_CompilerStudy_ByteWork_runMain___closed__0_value;
static const lean_string_object l_CompilerStudy_ByteWork_runMain___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = "1"};
static const lean_object* l_CompilerStudy_ByteWork_runMain___closed__1 = (const lean_object*)&l_CompilerStudy_ByteWork_runMain___closed__1_value;
static const lean_string_object l_CompilerStudy_ByteWork_runMain___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 20, .m_capacity = 20, .m_length = 19, .m_data = "2611923443488327891"};
static const lean_object* l_CompilerStudy_ByteWork_runMain___closed__2 = (const lean_object*)&l_CompilerStudy_ByteWork_runMain___closed__2_value;
static const lean_string_object l_CompilerStudy_ByteWork_runMain___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = " "};
static const lean_object* l_CompilerStudy_ByteWork_runMain___closed__3 = (const lean_object*)&l_CompilerStudy_ByteWork_runMain___closed__3_value;
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runMain(lean_object*);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runMain___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* _lean_main(lean_object*);
LEAN_EXPORT lean_object* l_main___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_checksumByte(uint64_t v_x_1_, uint8_t v_byte_2_){
_start:
{
lean_object* v___x_3_; uint64_t v___x_4_; uint64_t v___x_5_; uint64_t v___x_6_; uint64_t v___x_7_; uint64_t v___x_8_; uint64_t v___x_9_; 
v___x_3_ = lean_uint8_to_nat(v_byte_2_);
v___x_4_ = lean_uint64_of_nat(v___x_3_);
v___x_5_ = lean_uint64_add(v_x_1_, v___x_4_);
v___x_6_ = 2654435769ULL;
v___x_7_ = lean_uint64_add(v___x_5_, v___x_6_);
v___x_8_ = 1099511628211ULL;
v___x_9_ = lean_uint64_mul(v___x_7_, v___x_8_);
return v___x_9_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_checksumByte___boxed(lean_object* v_x_10_, lean_object* v_byte_11_){
_start:
{
uint64_t v_x_boxed_12_; uint8_t v_byte_boxed_13_; uint64_t v_res_14_; lean_object* v_r_15_; 
v_x_boxed_12_ = lean_unbox_uint64(v_x_10_);
lean_dec_ref(v_x_10_);
v_byte_boxed_13_ = lean_unbox(v_byte_11_);
v_res_14_ = l_CompilerStudy_ByteWork_checksumByte(v_x_boxed_12_, v_byte_boxed_13_);
v_r_15_ = lean_box_uint64(v_res_14_);
return v_r_15_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_finishRound(uint64_t v_x_16_){
_start:
{
uint64_t v___x_17_; uint64_t v___x_18_; uint64_t v___x_19_; 
v___x_17_ = 33ULL;
v___x_18_ = lean_uint64_shift_right(v_x_16_, v___x_17_);
v___x_19_ = lean_uint64_xor(v_x_16_, v___x_18_);
return v___x_19_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_finishRound___boxed(lean_object* v_x_20_){
_start:
{
uint64_t v_x_boxed_21_; uint64_t v_res_22_; lean_object* v_r_23_; 
v_x_boxed_21_ = lean_unbox_uint64(v_x_20_);
lean_dec_ref(v_x_20_);
v_res_22_ = l_CompilerStudy_ByteWork_finishRound(v_x_boxed_21_);
v_r_23_ = lean_box_uint64(v_res_22_);
return v_r_23_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg(lean_object* v_range_24_, lean_object* v_b_25_, lean_object* v_i_26_){
_start:
{
lean_object* v_stop_27_; lean_object* v_step_28_; uint8_t v___x_29_; 
v_stop_27_ = lean_ctor_get(v_range_24_, 1);
v_step_28_ = lean_ctor_get(v_range_24_, 2);
v___x_29_ = lean_nat_dec_lt(v_i_26_, v_stop_27_);
if (v___x_29_ == 0)
{
lean_dec(v_i_26_);
return v_b_25_;
}
else
{
lean_object* v___x_30_; lean_object* v___x_31_; lean_object* v___x_32_; lean_object* v___x_33_; lean_object* v___x_34_; lean_object* v___x_35_; uint8_t v___x_36_; lean_object* v___x_37_; lean_object* v___x_38_; 
v___x_30_ = lean_unsigned_to_nat(31u);
v___x_31_ = lean_nat_mul(v_i_26_, v___x_30_);
v___x_32_ = lean_unsigned_to_nat(7u);
v___x_33_ = lean_nat_add(v___x_31_, v___x_32_);
lean_dec(v___x_31_);
v___x_34_ = lean_unsigned_to_nat(256u);
v___x_35_ = lean_nat_mod(v___x_33_, v___x_34_);
lean_dec(v___x_33_);
v___x_36_ = lean_uint8_of_nat(v___x_35_);
lean_dec(v___x_35_);
v___x_37_ = lean_byte_array_push(v_b_25_, v___x_36_);
v___x_38_ = lean_nat_add(v_i_26_, v_step_28_);
lean_dec(v_i_26_);
v_b_25_ = v___x_37_;
v_i_26_ = v___x_38_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed(lean_object* v_range_40_, lean_object* v_b_41_, lean_object* v_i_42_){
_start:
{
lean_object* v_res_43_; 
v_res_43_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg(v_range_40_, v_b_41_, v_i_42_);
lean_dec_ref(v_range_40_);
return v_res_43_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_makeBuf(lean_object* v_size_44_){
_start:
{
lean_object* v_b_45_; lean_object* v___x_46_; lean_object* v___x_47_; lean_object* v___x_48_; lean_object* v___x_49_; 
v_b_45_ = l_ByteArray_empty;
v___x_46_ = lean_unsigned_to_nat(0u);
v___x_47_ = lean_unsigned_to_nat(1u);
v___x_48_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_48_, 0, v___x_46_);
lean_ctor_set(v___x_48_, 1, v_size_44_);
lean_ctor_set(v___x_48_, 2, v___x_47_);
v___x_49_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg(v___x_48_, v_b_45_, v___x_46_);
lean_dec_ref_known(v___x_48_, 3);
return v___x_49_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0(lean_object* v_range_50_, lean_object* v_b_51_, lean_object* v_i_52_, lean_object* v_hs_53_, lean_object* v_hl_54_){
_start:
{
lean_object* v___x_55_; 
v___x_55_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg(v_range_50_, v_b_51_, v_i_52_);
return v___x_55_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed(lean_object* v_range_56_, lean_object* v_b_57_, lean_object* v_i_58_, lean_object* v_hs_59_, lean_object* v_hl_60_){
_start:
{
lean_object* v_res_61_; 
v_res_61_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0(v_range_56_, v_b_57_, v_i_58_, v_hs_59_, v_hl_60_);
lean_dec_ref(v_range_56_);
return v_res_61_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg(lean_object* v_buf_62_, lean_object* v_a_63_){
_start:
{
lean_object* v_fst_64_; lean_object* v_snd_65_; lean_object* v___x_67_; uint8_t v_isShared_68_; uint8_t v_isSharedCheck_94_; 
v_fst_64_ = lean_ctor_get(v_a_63_, 0);
v_snd_65_ = lean_ctor_get(v_a_63_, 1);
v_isSharedCheck_94_ = !lean_is_exclusive(v_a_63_);
if (v_isSharedCheck_94_ == 0)
{
v___x_67_ = v_a_63_;
v_isShared_68_ = v_isSharedCheck_94_;
goto v_resetjp_66_;
}
else
{
lean_inc(v_snd_65_);
lean_inc(v_fst_64_);
lean_dec(v_a_63_);
v___x_67_ = lean_box(0);
v_isShared_68_ = v_isSharedCheck_94_;
goto v_resetjp_66_;
}
v_resetjp_66_:
{
uint8_t v___y_70_; lean_object* v___x_86_; uint8_t v___x_87_; 
v___x_86_ = lean_byte_array_size(v_buf_62_);
v___x_87_ = lean_nat_dec_lt(v_snd_65_, v___x_86_);
if (v___x_87_ == 0)
{
lean_object* v___x_88_; 
lean_del_object(v___x_67_);
v___x_88_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_88_, 0, v_fst_64_);
lean_ctor_set(v___x_88_, 1, v_snd_65_);
return v___x_88_;
}
else
{
if (v___x_87_ == 0)
{
uint8_t v___x_89_; lean_object* v___x_90_; lean_object* v___x_91_; uint8_t v___x_92_; 
v___x_89_ = l_instInhabitedUInt8;
v___x_90_ = lean_box(v___x_89_);
v___x_91_ = l_outOfBounds___redArg(v___x_90_);
lean_dec(v___x_90_);
v___x_92_ = lean_unbox(v___x_91_);
lean_dec(v___x_91_);
v___y_70_ = v___x_92_;
goto v___jp_69_;
}
else
{
uint8_t v___x_93_; 
v___x_93_ = lean_byte_array_fget(v_buf_62_, v_snd_65_);
v___y_70_ = v___x_93_;
goto v___jp_69_;
}
}
v___jp_69_:
{
lean_object* v___x_71_; uint64_t v___x_72_; uint64_t v___x_73_; uint64_t v___x_74_; uint64_t v___x_75_; uint64_t v___x_76_; uint64_t v___x_77_; uint64_t v___x_78_; lean_object* v___x_79_; lean_object* v___x_80_; lean_object* v___x_81_; lean_object* v___x_83_; 
v___x_71_ = lean_uint8_to_nat(v___y_70_);
v___x_72_ = lean_uint64_of_nat(v___x_71_);
v___x_73_ = lean_unbox_uint64(v_fst_64_);
lean_dec(v_fst_64_);
v___x_74_ = lean_uint64_add(v___x_73_, v___x_72_);
v___x_75_ = 2654435769ULL;
v___x_76_ = lean_uint64_add(v___x_74_, v___x_75_);
v___x_77_ = 1099511628211ULL;
v___x_78_ = lean_uint64_mul(v___x_76_, v___x_77_);
v___x_79_ = lean_unsigned_to_nat(1u);
v___x_80_ = lean_nat_add(v_snd_65_, v___x_79_);
lean_dec(v_snd_65_);
v___x_81_ = lean_box_uint64(v___x_78_);
if (v_isShared_68_ == 0)
{
lean_ctor_set(v___x_67_, 1, v___x_80_);
lean_ctor_set(v___x_67_, 0, v___x_81_);
v___x_83_ = v___x_67_;
goto v_reusejp_82_;
}
else
{
lean_object* v_reuseFailAlloc_85_; 
v_reuseFailAlloc_85_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_85_, 0, v___x_81_);
lean_ctor_set(v_reuseFailAlloc_85_, 1, v___x_80_);
v___x_83_ = v_reuseFailAlloc_85_;
goto v_reusejp_82_;
}
v_reusejp_82_:
{
v_a_63_ = v___x_83_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed(lean_object* v_buf_95_, lean_object* v_a_96_){
_start:
{
lean_object* v_res_97_; 
v_res_97_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg(v_buf_95_, v_a_96_);
lean_dec_ref(v_buf_95_);
return v_res_97_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg(lean_object* v_rounds_98_, lean_object* v_buf_99_, lean_object* v_a_100_){
_start:
{
lean_object* v_fst_101_; lean_object* v_snd_102_; lean_object* v___x_104_; uint8_t v_isShared_105_; uint8_t v_isSharedCheck_133_; 
v_fst_101_ = lean_ctor_get(v_a_100_, 0);
v_snd_102_ = lean_ctor_get(v_a_100_, 1);
v_isSharedCheck_133_ = !lean_is_exclusive(v_a_100_);
if (v_isSharedCheck_133_ == 0)
{
v___x_104_ = v_a_100_;
v_isShared_105_ = v_isSharedCheck_133_;
goto v_resetjp_103_;
}
else
{
lean_inc(v_snd_102_);
lean_inc(v_fst_101_);
lean_dec(v_a_100_);
v___x_104_ = lean_box(0);
v_isShared_105_ = v_isSharedCheck_133_;
goto v_resetjp_103_;
}
v_resetjp_103_:
{
uint8_t v___x_106_; 
v___x_106_ = lean_nat_dec_lt(v_fst_101_, v_rounds_98_);
if (v___x_106_ == 0)
{
lean_object* v___x_108_; 
if (v_isShared_105_ == 0)
{
v___x_108_ = v___x_104_;
goto v_reusejp_107_;
}
else
{
lean_object* v_reuseFailAlloc_109_; 
v_reuseFailAlloc_109_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_109_, 0, v_fst_101_);
lean_ctor_set(v_reuseFailAlloc_109_, 1, v_snd_102_);
v___x_108_ = v_reuseFailAlloc_109_;
goto v_reusejp_107_;
}
v_reusejp_107_:
{
return v___x_108_;
}
}
else
{
lean_object* v_r_110_; lean_object* v___x_112_; 
v_r_110_ = lean_unsigned_to_nat(0u);
if (v_isShared_105_ == 0)
{
lean_ctor_set(v___x_104_, 1, v_r_110_);
lean_ctor_set(v___x_104_, 0, v_snd_102_);
v___x_112_ = v___x_104_;
goto v_reusejp_111_;
}
else
{
lean_object* v_reuseFailAlloc_132_; 
v_reuseFailAlloc_132_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_132_, 0, v_snd_102_);
lean_ctor_set(v_reuseFailAlloc_132_, 1, v_r_110_);
v___x_112_ = v_reuseFailAlloc_132_;
goto v_reusejp_111_;
}
v_reusejp_111_:
{
lean_object* v___x_113_; lean_object* v_fst_114_; lean_object* v___x_116_; uint8_t v_isShared_117_; uint8_t v_isSharedCheck_130_; 
v___x_113_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg(v_buf_99_, v___x_112_);
v_fst_114_ = lean_ctor_get(v___x_113_, 0);
v_isSharedCheck_130_ = !lean_is_exclusive(v___x_113_);
if (v_isSharedCheck_130_ == 0)
{
lean_object* v_unused_131_; 
v_unused_131_ = lean_ctor_get(v___x_113_, 1);
lean_dec(v_unused_131_);
v___x_116_ = v___x_113_;
v_isShared_117_ = v_isSharedCheck_130_;
goto v_resetjp_115_;
}
else
{
lean_inc(v_fst_114_);
lean_dec(v___x_113_);
v___x_116_ = lean_box(0);
v_isShared_117_ = v_isSharedCheck_130_;
goto v_resetjp_115_;
}
v_resetjp_115_:
{
uint64_t v___x_118_; uint64_t v___x_119_; uint64_t v___x_120_; uint64_t v___x_121_; uint64_t v___x_122_; lean_object* v___x_123_; lean_object* v___x_124_; lean_object* v___x_125_; lean_object* v___x_127_; 
v___x_118_ = 33ULL;
v___x_119_ = lean_unbox_uint64(v_fst_114_);
v___x_120_ = lean_uint64_shift_right(v___x_119_, v___x_118_);
v___x_121_ = lean_unbox_uint64(v_fst_114_);
lean_dec(v_fst_114_);
v___x_122_ = lean_uint64_xor(v___x_121_, v___x_120_);
v___x_123_ = lean_unsigned_to_nat(1u);
v___x_124_ = lean_nat_add(v_fst_101_, v___x_123_);
lean_dec(v_fst_101_);
v___x_125_ = lean_box_uint64(v___x_122_);
if (v_isShared_117_ == 0)
{
lean_ctor_set(v___x_116_, 1, v___x_125_);
lean_ctor_set(v___x_116_, 0, v___x_124_);
v___x_127_ = v___x_116_;
goto v_reusejp_126_;
}
else
{
lean_object* v_reuseFailAlloc_129_; 
v_reuseFailAlloc_129_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_129_, 0, v___x_124_);
lean_ctor_set(v_reuseFailAlloc_129_, 1, v___x_125_);
v___x_127_ = v_reuseFailAlloc_129_;
goto v_reusejp_126_;
}
v_reusejp_126_:
{
v_a_100_ = v___x_127_;
goto _start;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed(lean_object* v_rounds_134_, lean_object* v_buf_135_, lean_object* v_a_136_){
_start:
{
lean_object* v_res_137_; 
v_res_137_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg(v_rounds_134_, v_buf_135_, v_a_136_);
lean_dec_ref(v_buf_135_);
lean_dec(v_rounds_134_);
return v_res_137_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_natWhile(lean_object* v_rounds_138_, lean_object* v_buf_139_, uint64_t v_seed_140_){
_start:
{
lean_object* v_r_141_; lean_object* v___x_142_; lean_object* v___x_143_; lean_object* v___x_144_; lean_object* v_snd_145_; uint64_t v___x_146_; 
v_r_141_ = lean_unsigned_to_nat(0u);
v___x_142_ = lean_box_uint64(v_seed_140_);
v___x_143_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_143_, 0, v_r_141_);
lean_ctor_set(v___x_143_, 1, v___x_142_);
v___x_144_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg(v_rounds_138_, v_buf_139_, v___x_143_);
v_snd_145_ = lean_ctor_get(v___x_144_, 1);
lean_inc(v_snd_145_);
lean_dec_ref(v___x_144_);
v___x_146_ = lean_unbox_uint64(v_snd_145_);
lean_dec(v_snd_145_);
return v___x_146_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_natWhile___boxed(lean_object* v_rounds_147_, lean_object* v_buf_148_, lean_object* v_seed_149_){
_start:
{
uint64_t v_seed_boxed_150_; uint64_t v_res_151_; lean_object* v_r_152_; 
v_seed_boxed_150_ = lean_unbox_uint64(v_seed_149_);
lean_dec_ref(v_seed_149_);
v_res_151_ = l_CompilerStudy_ByteWork_natWhile(v_rounds_147_, v_buf_148_, v_seed_boxed_150_);
lean_dec_ref(v_buf_148_);
lean_dec(v_rounds_147_);
v_r_152_ = lean_box_uint64(v_res_151_);
return v_r_152_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0(lean_object* v_buf_153_, lean_object* v_inst_154_, lean_object* v_a_155_){
_start:
{
lean_object* v___x_156_; 
v___x_156_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg(v_buf_153_, v_a_155_);
return v___x_156_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed(lean_object* v_buf_157_, lean_object* v_inst_158_, lean_object* v_a_159_){
_start:
{
lean_object* v_res_160_; 
v_res_160_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0(v_buf_157_, v_inst_158_, v_a_159_);
lean_dec_ref(v_buf_157_);
return v_res_160_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1(lean_object* v_rounds_161_, lean_object* v_buf_162_, lean_object* v_inst_163_, lean_object* v_a_164_){
_start:
{
lean_object* v___x_165_; 
v___x_165_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg(v_rounds_161_, v_buf_162_, v_a_164_);
return v___x_165_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed(lean_object* v_rounds_166_, lean_object* v_buf_167_, lean_object* v_inst_168_, lean_object* v_a_169_){
_start:
{
lean_object* v_res_170_; 
v_res_170_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1(v_rounds_166_, v_buf_167_, v_inst_168_, v_a_169_);
lean_dec_ref(v_buf_167_);
lean_dec(v_rounds_166_);
return v_res_170_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd(lean_object* v_buf_171_, uint64_t v_splitFst_172_, size_t v_splitSnd_173_){
_start:
{
uint8_t v___y_175_; lean_object* v___x_186_; size_t v___x_187_; uint8_t v___x_188_; 
v___x_186_ = lean_byte_array_size(v_buf_171_);
v___x_187_ = lean_usize_of_nat(v___x_186_);
v___x_188_ = lean_usize_dec_lt(v_splitSnd_173_, v___x_187_);
if (v___x_188_ == 0)
{
lean_object* v___x_189_; lean_object* v___x_190_; lean_object* v___x_191_; 
v___x_189_ = lean_box_uint64(v_splitFst_172_);
v___x_190_ = lean_box_usize(v_splitSnd_173_);
v___x_191_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_191_, 0, v___x_189_);
lean_ctor_set(v___x_191_, 1, v___x_190_);
return v___x_191_;
}
else
{
lean_object* v___x_192_; uint8_t v___x_193_; 
v___x_192_ = lean_usize_to_nat(v_splitSnd_173_);
v___x_193_ = lean_nat_dec_lt(v___x_192_, v___x_186_);
if (v___x_193_ == 0)
{
uint8_t v___x_194_; lean_object* v___x_195_; lean_object* v___x_196_; uint8_t v___x_197_; 
lean_dec(v___x_192_);
v___x_194_ = l_instInhabitedUInt8;
v___x_195_ = lean_box(v___x_194_);
v___x_196_ = l_outOfBounds___redArg(v___x_195_);
lean_dec(v___x_195_);
v___x_197_ = lean_unbox(v___x_196_);
lean_dec(v___x_196_);
v___y_175_ = v___x_197_;
goto v___jp_174_;
}
else
{
uint8_t v___x_198_; 
v___x_198_ = lean_byte_array_fget(v_buf_171_, v___x_192_);
lean_dec(v___x_192_);
v___y_175_ = v___x_198_;
goto v___jp_174_;
}
}
v___jp_174_:
{
lean_object* v___x_176_; uint64_t v___x_177_; uint64_t v___x_178_; uint64_t v___x_179_; uint64_t v___x_180_; uint64_t v___x_181_; uint64_t v_splitFst_182_; size_t v___x_183_; size_t v_splitSnd_184_; 
v___x_176_ = lean_uint8_to_nat(v___y_175_);
v___x_177_ = lean_uint64_of_nat(v___x_176_);
v___x_178_ = lean_uint64_add(v_splitFst_172_, v___x_177_);
v___x_179_ = 2654435769ULL;
v___x_180_ = lean_uint64_add(v___x_178_, v___x_179_);
v___x_181_ = 1099511628211ULL;
v_splitFst_182_ = lean_uint64_mul(v___x_180_, v___x_181_);
v___x_183_ = ((size_t)1ULL);
v_splitSnd_184_ = lean_usize_add(v_splitSnd_173_, v___x_183_);
v_splitFst_172_ = v_splitFst_182_;
v_splitSnd_173_ = v_splitSnd_184_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed(lean_object* v_buf_199_, lean_object* v_splitFst_200_, lean_object* v_splitSnd_201_){
_start:
{
uint64_t v_splitFst_boxed_202_; size_t v_splitSnd_boxed_203_; lean_object* v_res_204_; 
v_splitFst_boxed_202_ = lean_unbox_uint64(v_splitFst_200_);
lean_dec_ref(v_splitFst_200_);
v_splitSnd_boxed_203_ = lean_unbox_usize(v_splitSnd_201_);
lean_dec(v_splitSnd_201_);
v_res_204_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd(v_buf_199_, v_splitFst_boxed_202_, v_splitSnd_boxed_203_);
lean_dec_ref(v_buf_199_);
return v_res_204_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(lean_object* v_rounds_205_, lean_object* v_buf_206_, lean_object* v_a_207_){
_start:
{
lean_object* v_fst_208_; lean_object* v_snd_209_; lean_object* v___x_211_; uint8_t v_isShared_212_; uint8_t v_isSharedCheck_238_; 
v_fst_208_ = lean_ctor_get(v_a_207_, 0);
v_snd_209_ = lean_ctor_get(v_a_207_, 1);
v_isSharedCheck_238_ = !lean_is_exclusive(v_a_207_);
if (v_isSharedCheck_238_ == 0)
{
v___x_211_ = v_a_207_;
v_isShared_212_ = v_isSharedCheck_238_;
goto v_resetjp_210_;
}
else
{
lean_inc(v_snd_209_);
lean_inc(v_fst_208_);
lean_dec(v_a_207_);
v___x_211_ = lean_box(0);
v_isShared_212_ = v_isSharedCheck_238_;
goto v_resetjp_210_;
}
v_resetjp_210_:
{
uint8_t v___x_213_; 
v___x_213_ = lean_nat_dec_lt(v_fst_208_, v_rounds_205_);
if (v___x_213_ == 0)
{
lean_object* v___x_215_; 
if (v_isShared_212_ == 0)
{
v___x_215_ = v___x_211_;
goto v_reusejp_214_;
}
else
{
lean_object* v_reuseFailAlloc_216_; 
v_reuseFailAlloc_216_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_216_, 0, v_fst_208_);
lean_ctor_set(v_reuseFailAlloc_216_, 1, v_snd_209_);
v___x_215_ = v_reuseFailAlloc_216_;
goto v_reusejp_214_;
}
v_reusejp_214_:
{
return v___x_215_;
}
}
else
{
size_t v_splitSnd_217_; uint64_t v___x_218_; lean_object* v___x_219_; lean_object* v_fst_220_; lean_object* v___x_222_; uint8_t v_isShared_223_; uint8_t v_isSharedCheck_236_; 
lean_del_object(v___x_211_);
v_splitSnd_217_ = ((size_t)0ULL);
v___x_218_ = lean_unbox_uint64(v_snd_209_);
lean_dec(v_snd_209_);
v___x_219_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd(v_buf_206_, v___x_218_, v_splitSnd_217_);
v_fst_220_ = lean_ctor_get(v___x_219_, 0);
v_isSharedCheck_236_ = !lean_is_exclusive(v___x_219_);
if (v_isSharedCheck_236_ == 0)
{
lean_object* v_unused_237_; 
v_unused_237_ = lean_ctor_get(v___x_219_, 1);
lean_dec(v_unused_237_);
v___x_222_ = v___x_219_;
v_isShared_223_ = v_isSharedCheck_236_;
goto v_resetjp_221_;
}
else
{
lean_inc(v_fst_220_);
lean_dec(v___x_219_);
v___x_222_ = lean_box(0);
v_isShared_223_ = v_isSharedCheck_236_;
goto v_resetjp_221_;
}
v_resetjp_221_:
{
uint64_t v___x_224_; uint64_t v___x_225_; uint64_t v___x_226_; uint64_t v___x_227_; uint64_t v___x_228_; lean_object* v___x_229_; lean_object* v___x_230_; lean_object* v___x_231_; lean_object* v___x_233_; 
v___x_224_ = 33ULL;
v___x_225_ = lean_unbox_uint64(v_fst_220_);
v___x_226_ = lean_uint64_shift_right(v___x_225_, v___x_224_);
v___x_227_ = lean_unbox_uint64(v_fst_220_);
lean_dec(v_fst_220_);
v___x_228_ = lean_uint64_xor(v___x_227_, v___x_226_);
v___x_229_ = lean_unsigned_to_nat(1u);
v___x_230_ = lean_nat_add(v_fst_208_, v___x_229_);
lean_dec(v_fst_208_);
v___x_231_ = lean_box_uint64(v___x_228_);
if (v_isShared_223_ == 0)
{
lean_ctor_set(v___x_222_, 1, v___x_231_);
lean_ctor_set(v___x_222_, 0, v___x_230_);
v___x_233_ = v___x_222_;
goto v_reusejp_232_;
}
else
{
lean_object* v_reuseFailAlloc_235_; 
v_reuseFailAlloc_235_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_235_, 0, v___x_230_);
lean_ctor_set(v_reuseFailAlloc_235_, 1, v___x_231_);
v___x_233_ = v_reuseFailAlloc_235_;
goto v_reusejp_232_;
}
v_reusejp_232_:
{
v_a_207_ = v___x_233_;
goto _start;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed(lean_object* v_rounds_239_, lean_object* v_buf_240_, lean_object* v_a_241_){
_start:
{
lean_object* v_res_242_; 
v_res_242_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(v_rounds_239_, v_buf_240_, v_a_241_);
lean_dec_ref(v_buf_240_);
lean_dec(v_rounds_239_);
return v_res_242_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_usizeWhile(lean_object* v_rounds_243_, lean_object* v_buf_244_, uint64_t v_seed_245_){
_start:
{
lean_object* v_r_246_; lean_object* v___x_247_; lean_object* v___x_248_; lean_object* v___x_249_; lean_object* v_snd_250_; uint64_t v___x_251_; 
v_r_246_ = lean_unsigned_to_nat(0u);
v___x_247_ = lean_box_uint64(v_seed_245_);
v___x_248_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_248_, 0, v_r_246_);
lean_ctor_set(v___x_248_, 1, v___x_247_);
v___x_249_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(v_rounds_243_, v_buf_244_, v___x_248_);
v_snd_250_ = lean_ctor_get(v___x_249_, 1);
lean_inc(v_snd_250_);
lean_dec_ref(v___x_249_);
v___x_251_ = lean_unbox_uint64(v_snd_250_);
lean_dec(v_snd_250_);
return v___x_251_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_usizeWhile___boxed(lean_object* v_rounds_252_, lean_object* v_buf_253_, lean_object* v_seed_254_){
_start:
{
uint64_t v_seed_boxed_255_; uint64_t v_res_256_; lean_object* v_r_257_; 
v_seed_boxed_255_ = lean_unbox_uint64(v_seed_254_);
lean_dec_ref(v_seed_254_);
v_res_256_ = l_CompilerStudy_ByteWork_usizeWhile(v_rounds_252_, v_buf_253_, v_seed_boxed_255_);
lean_dec_ref(v_buf_253_);
lean_dec(v_rounds_252_);
v_r_257_ = lean_box_uint64(v_res_256_);
return v_r_257_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(lean_object* v_buf_258_, lean_object* v_a_259_){
_start:
{
lean_object* v_splitFst_260_; lean_object* v_splitSnd_261_; uint64_t v___x_262_; size_t v___x_263_; lean_object* v___x_264_; 
v_splitFst_260_ = lean_ctor_get(v_a_259_, 0);
v_splitSnd_261_ = lean_ctor_get(v_a_259_, 1);
v___x_262_ = lean_unbox_uint64(v_splitFst_260_);
v___x_263_ = lean_unbox_usize(v_splitSnd_261_);
v___x_264_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd(v_buf_258_, v___x_262_, v___x_263_);
return v___x_264_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed(lean_object* v_buf_265_, lean_object* v_a_266_){
_start:
{
lean_object* v_res_267_; 
v_res_267_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(v_buf_265_, v_a_266_);
lean_dec_ref(v_a_266_);
lean_dec_ref(v_buf_265_);
return v_res_267_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0(lean_object* v_buf_268_, lean_object* v_inst_269_, lean_object* v_a_270_){
_start:
{
lean_object* v_splitFst_271_; lean_object* v_splitSnd_272_; uint64_t v___x_273_; size_t v___x_274_; lean_object* v___x_275_; 
v_splitFst_271_ = lean_ctor_get(v_a_270_, 0);
v_splitSnd_272_ = lean_ctor_get(v_a_270_, 1);
v___x_273_ = lean_unbox_uint64(v_splitFst_271_);
v___x_274_ = lean_unbox_usize(v_splitSnd_272_);
v___x_275_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd(v_buf_268_, v___x_273_, v___x_274_);
return v___x_275_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed(lean_object* v_buf_276_, lean_object* v_inst_277_, lean_object* v_a_278_){
_start:
{
lean_object* v_res_279_; 
v_res_279_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0(v_buf_276_, v_inst_277_, v_a_278_);
lean_dec_ref(v_a_278_);
lean_dec_ref(v_buf_276_);
return v_res_279_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1(lean_object* v_rounds_280_, lean_object* v_buf_281_, lean_object* v_inst_282_, lean_object* v_a_283_){
_start:
{
lean_object* v___x_284_; 
v___x_284_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(v_rounds_280_, v_buf_281_, v_a_283_);
return v___x_284_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed(lean_object* v_rounds_285_, lean_object* v_buf_286_, lean_object* v_inst_287_, lean_object* v_a_288_){
_start:
{
lean_object* v_res_289_; 
v_res_289_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1(v_rounds_285_, v_buf_286_, v_inst_287_, v_a_288_);
lean_dec_ref(v_buf_286_);
lean_dec(v_rounds_285_);
return v_res_289_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(size_t v_upperBound_290_, lean_object* v_buf_291_, size_t v_a_292_, uint64_t v_b_293_){
_start:
{
uint8_t v___y_295_; uint8_t v___x_308_; 
v___x_308_ = lean_usize_dec_lt(v_a_292_, v_upperBound_290_);
if (v___x_308_ == 0)
{
return v_b_293_;
}
else
{
lean_object* v___x_309_; lean_object* v___x_310_; uint8_t v___x_311_; 
v___x_309_ = lean_usize_to_nat(v_a_292_);
v___x_310_ = lean_byte_array_size(v_buf_291_);
v___x_311_ = lean_nat_dec_lt(v___x_309_, v___x_310_);
if (v___x_311_ == 0)
{
uint8_t v___x_312_; lean_object* v___x_313_; lean_object* v___x_314_; uint8_t v___x_315_; 
lean_dec(v___x_309_);
v___x_312_ = l_instInhabitedUInt8;
v___x_313_ = lean_box(v___x_312_);
v___x_314_ = l_outOfBounds___redArg(v___x_313_);
lean_dec(v___x_313_);
v___x_315_ = lean_unbox(v___x_314_);
lean_dec(v___x_314_);
v___y_295_ = v___x_315_;
goto v___jp_294_;
}
else
{
uint8_t v___x_316_; 
v___x_316_ = lean_byte_array_fget(v_buf_291_, v___x_309_);
lean_dec(v___x_309_);
v___y_295_ = v___x_316_;
goto v___jp_294_;
}
}
v___jp_294_:
{
lean_object* v___x_296_; uint64_t v___x_297_; uint64_t v___x_298_; uint64_t v___x_299_; uint64_t v___x_300_; uint64_t v___x_301_; uint64_t v___x_302_; size_t v___x_303_; size_t v___x_304_; size_t v___x_305_; uint8_t v___x_306_; 
v___x_296_ = lean_uint8_to_nat(v___y_295_);
v___x_297_ = lean_uint64_of_nat(v___x_296_);
v___x_298_ = lean_uint64_add(v_b_293_, v___x_297_);
v___x_299_ = 2654435769ULL;
v___x_300_ = lean_uint64_add(v___x_298_, v___x_299_);
v___x_301_ = 1099511628211ULL;
v___x_302_ = lean_uint64_mul(v___x_300_, v___x_301_);
v___x_303_ = ((size_t)1ULL);
v___x_304_ = lean_usize_add(v_a_292_, v___x_303_);
v___x_305_ = ((size_t)0ULL);
v___x_306_ = lean_usize_dec_eq(v___x_304_, v___x_305_);
if (v___x_306_ == 0)
{
v_a_292_ = v___x_304_;
v_b_293_ = v___x_302_;
goto _start;
}
else
{
return v___x_302_;
}
}
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed(lean_object* v_upperBound_317_, lean_object* v_buf_318_, lean_object* v_a_319_, lean_object* v_b_320_){
_start:
{
size_t v_upperBound_1299__boxed_321_; size_t v_a_boxed_322_; uint64_t v_b_boxed_323_; uint64_t v_res_324_; lean_object* v_r_325_; 
v_upperBound_1299__boxed_321_ = lean_unbox_usize(v_upperBound_317_);
lean_dec(v_upperBound_317_);
v_a_boxed_322_ = lean_unbox_usize(v_a_319_);
lean_dec(v_a_319_);
v_b_boxed_323_ = lean_unbox_uint64(v_b_320_);
lean_dec_ref(v_b_320_);
v_res_324_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(v_upperBound_1299__boxed_321_, v_buf_318_, v_a_boxed_322_, v_b_boxed_323_);
lean_dec_ref(v_buf_318_);
v_r_325_ = lean_box_uint64(v_res_324_);
return v_r_325_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(lean_object* v_rounds_326_, lean_object* v_buf_327_, lean_object* v_a_328_){
_start:
{
lean_object* v_fst_329_; lean_object* v_snd_330_; lean_object* v___x_332_; uint8_t v_isShared_333_; uint8_t v_isSharedCheck_353_; 
v_fst_329_ = lean_ctor_get(v_a_328_, 0);
v_snd_330_ = lean_ctor_get(v_a_328_, 1);
v_isSharedCheck_353_ = !lean_is_exclusive(v_a_328_);
if (v_isSharedCheck_353_ == 0)
{
v___x_332_ = v_a_328_;
v_isShared_333_ = v_isSharedCheck_353_;
goto v_resetjp_331_;
}
else
{
lean_inc(v_snd_330_);
lean_inc(v_fst_329_);
lean_dec(v_a_328_);
v___x_332_ = lean_box(0);
v_isShared_333_ = v_isSharedCheck_353_;
goto v_resetjp_331_;
}
v_resetjp_331_:
{
uint8_t v___x_334_; 
v___x_334_ = lean_nat_dec_lt(v_fst_329_, v_rounds_326_);
if (v___x_334_ == 0)
{
lean_object* v___x_336_; 
if (v_isShared_333_ == 0)
{
v___x_336_ = v___x_332_;
goto v_reusejp_335_;
}
else
{
lean_object* v_reuseFailAlloc_337_; 
v_reuseFailAlloc_337_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_337_, 0, v_fst_329_);
lean_ctor_set(v_reuseFailAlloc_337_, 1, v_snd_330_);
v___x_336_ = v_reuseFailAlloc_337_;
goto v_reusejp_335_;
}
v_reusejp_335_:
{
return v___x_336_;
}
}
else
{
size_t v___x_338_; lean_object* v___x_339_; size_t v___x_340_; uint64_t v___x_341_; uint64_t v___x_342_; uint64_t v___x_343_; uint64_t v___x_344_; uint64_t v___x_345_; lean_object* v___x_346_; lean_object* v___x_347_; lean_object* v___x_348_; lean_object* v___x_350_; 
v___x_338_ = ((size_t)0ULL);
v___x_339_ = lean_byte_array_size(v_buf_327_);
v___x_340_ = lean_usize_of_nat(v___x_339_);
v___x_341_ = lean_unbox_uint64(v_snd_330_);
lean_dec(v_snd_330_);
v___x_342_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(v___x_340_, v_buf_327_, v___x_338_, v___x_341_);
v___x_343_ = 33ULL;
v___x_344_ = lean_uint64_shift_right(v___x_342_, v___x_343_);
v___x_345_ = lean_uint64_xor(v___x_342_, v___x_344_);
v___x_346_ = lean_unsigned_to_nat(1u);
v___x_347_ = lean_nat_add(v_fst_329_, v___x_346_);
lean_dec(v_fst_329_);
v___x_348_ = lean_box_uint64(v___x_345_);
if (v_isShared_333_ == 0)
{
lean_ctor_set(v___x_332_, 1, v___x_348_);
lean_ctor_set(v___x_332_, 0, v___x_347_);
v___x_350_ = v___x_332_;
goto v_reusejp_349_;
}
else
{
lean_object* v_reuseFailAlloc_352_; 
v_reuseFailAlloc_352_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_352_, 0, v___x_347_);
lean_ctor_set(v_reuseFailAlloc_352_, 1, v___x_348_);
v___x_350_ = v_reuseFailAlloc_352_;
goto v_reusejp_349_;
}
v_reusejp_349_:
{
v_a_328_ = v___x_350_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed(lean_object* v_rounds_354_, lean_object* v_buf_355_, lean_object* v_a_356_){
_start:
{
lean_object* v_res_357_; 
v_res_357_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(v_rounds_354_, v_buf_355_, v_a_356_);
lean_dec_ref(v_buf_355_);
lean_dec(v_rounds_354_);
return v_res_357_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_usizeFor(lean_object* v_rounds_358_, lean_object* v_buf_359_, uint64_t v_seed_360_){
_start:
{
lean_object* v_r_361_; lean_object* v___x_362_; lean_object* v___x_363_; lean_object* v___x_364_; lean_object* v_snd_365_; uint64_t v___x_366_; 
v_r_361_ = lean_unsigned_to_nat(0u);
v___x_362_ = lean_box_uint64(v_seed_360_);
v___x_363_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_363_, 0, v_r_361_);
lean_ctor_set(v___x_363_, 1, v___x_362_);
v___x_364_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(v_rounds_358_, v_buf_359_, v___x_363_);
v_snd_365_ = lean_ctor_get(v___x_364_, 1);
lean_inc(v_snd_365_);
lean_dec_ref(v___x_364_);
v___x_366_ = lean_unbox_uint64(v_snd_365_);
lean_dec(v_snd_365_);
return v___x_366_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_usizeFor___boxed(lean_object* v_rounds_367_, lean_object* v_buf_368_, lean_object* v_seed_369_){
_start:
{
uint64_t v_seed_boxed_370_; uint64_t v_res_371_; lean_object* v_r_372_; 
v_seed_boxed_370_ = lean_unbox_uint64(v_seed_369_);
lean_dec_ref(v_seed_369_);
v_res_371_ = l_CompilerStudy_ByteWork_usizeFor(v_rounds_367_, v_buf_368_, v_seed_boxed_370_);
lean_dec_ref(v_buf_368_);
lean_dec(v_rounds_367_);
v_r_372_ = lean_box_uint64(v_res_371_);
return v_r_372_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0(size_t v_upperBound_373_, lean_object* v_buf_374_, lean_object* v_inst_375_, lean_object* v_R_376_, size_t v_a_377_, uint64_t v_b_378_, lean_object* v_c_379_){
_start:
{
uint64_t v___x_380_; 
v___x_380_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(v_upperBound_373_, v_buf_374_, v_a_377_, v_b_378_);
return v___x_380_;
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed(lean_object* v_upperBound_381_, lean_object* v_buf_382_, lean_object* v_inst_383_, lean_object* v_R_384_, lean_object* v_a_385_, lean_object* v_b_386_, lean_object* v_c_387_){
_start:
{
size_t v_upperBound_1402__boxed_388_; size_t v_a_boxed_389_; uint64_t v_b_boxed_390_; uint64_t v_res_391_; lean_object* v_r_392_; 
v_upperBound_1402__boxed_388_ = lean_unbox_usize(v_upperBound_381_);
lean_dec(v_upperBound_381_);
v_a_boxed_389_ = lean_unbox_usize(v_a_385_);
lean_dec(v_a_385_);
v_b_boxed_390_ = lean_unbox_uint64(v_b_386_);
lean_dec_ref(v_b_386_);
v_res_391_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0(v_upperBound_1402__boxed_388_, v_buf_382_, v_inst_383_, v_R_384_, v_a_boxed_389_, v_b_boxed_390_, v_c_387_);
lean_dec_ref(v_buf_382_);
v_r_392_ = lean_box_uint64(v_res_391_);
return v_r_392_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1(lean_object* v_rounds_393_, lean_object* v_buf_394_, lean_object* v_inst_395_, lean_object* v_a_396_){
_start:
{
lean_object* v___x_397_; 
v___x_397_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(v_rounds_393_, v_buf_394_, v_a_396_);
return v___x_397_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed(lean_object* v_rounds_398_, lean_object* v_buf_399_, lean_object* v_inst_400_, lean_object* v_a_401_){
_start:
{
lean_object* v_res_402_; 
v_res_402_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1(v_rounds_398_, v_buf_399_, v_inst_400_, v_a_401_);
lean_dec_ref(v_buf_399_);
lean_dec(v_rounds_398_);
return v_res_402_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(lean_object* v_buf_403_, lean_object* v_a_404_){
_start:
{
size_t v_i_405_; uint64_t v_x_406_; lean_object* v___x_407_; size_t v___x_408_; uint8_t v___x_409_; 
v_i_405_ = lean_ctor_get_usize(v_a_404_, 0);
v_x_406_ = lean_ctor_get_uint64(v_a_404_, sizeof(void*)*1);
v___x_407_ = lean_byte_array_size(v_buf_403_);
v___x_408_ = lean_usize_of_nat(v___x_407_);
v___x_409_ = lean_usize_dec_lt(v_i_405_, v___x_408_);
if (v___x_409_ == 0)
{
return v_a_404_;
}
else
{
lean_object* v___x_411_; uint8_t v_isShared_412_; uint8_t v_isSharedCheck_435_; 
v_isSharedCheck_435_ = !lean_is_exclusive(v_a_404_);
if (v_isSharedCheck_435_ == 0)
{
v___x_411_ = v_a_404_;
v_isShared_412_ = v_isSharedCheck_435_;
goto v_resetjp_410_;
}
else
{
lean_dec(v_a_404_);
v___x_411_ = lean_box(0);
v_isShared_412_ = v_isSharedCheck_435_;
goto v_resetjp_410_;
}
v_resetjp_410_:
{
size_t v___x_413_; size_t v___x_414_; uint8_t v___y_416_; lean_object* v___x_428_; uint8_t v___x_429_; 
v___x_413_ = ((size_t)1ULL);
v___x_414_ = lean_usize_add(v_i_405_, v___x_413_);
v___x_428_ = lean_usize_to_nat(v_i_405_);
v___x_429_ = lean_nat_dec_lt(v___x_428_, v___x_407_);
if (v___x_429_ == 0)
{
uint8_t v___x_430_; lean_object* v___x_431_; lean_object* v___x_432_; uint8_t v___x_433_; 
lean_dec(v___x_428_);
v___x_430_ = l_instInhabitedUInt8;
v___x_431_ = lean_box(v___x_430_);
v___x_432_ = l_outOfBounds___redArg(v___x_431_);
lean_dec(v___x_431_);
v___x_433_ = lean_unbox(v___x_432_);
lean_dec(v___x_432_);
v___y_416_ = v___x_433_;
goto v___jp_415_;
}
else
{
uint8_t v___x_434_; 
v___x_434_ = lean_byte_array_fget(v_buf_403_, v___x_428_);
lean_dec(v___x_428_);
v___y_416_ = v___x_434_;
goto v___jp_415_;
}
v___jp_415_:
{
lean_object* v___x_417_; uint64_t v___x_418_; uint64_t v___x_419_; uint64_t v___x_420_; uint64_t v___x_421_; uint64_t v___x_422_; uint64_t v___x_423_; lean_object* v___x_425_; 
v___x_417_ = lean_uint8_to_nat(v___y_416_);
v___x_418_ = lean_uint64_of_nat(v___x_417_);
v___x_419_ = lean_uint64_add(v_x_406_, v___x_418_);
v___x_420_ = 2654435769ULL;
v___x_421_ = lean_uint64_add(v___x_419_, v___x_420_);
v___x_422_ = 1099511628211ULL;
v___x_423_ = lean_uint64_mul(v___x_421_, v___x_422_);
if (v_isShared_412_ == 0)
{
v___x_425_ = v___x_411_;
goto v_reusejp_424_;
}
else
{
lean_object* v_reuseFailAlloc_427_; 
v_reuseFailAlloc_427_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_425_ = v_reuseFailAlloc_427_;
goto v_reusejp_424_;
}
v_reusejp_424_:
{
lean_ctor_set_usize(v___x_425_, 0, v___x_414_);
lean_ctor_set_uint64(v___x_425_, sizeof(void*)*1, v___x_423_);
v_a_404_ = v___x_425_;
goto _start;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed(lean_object* v_buf_436_, lean_object* v_a_437_){
_start:
{
lean_object* v_res_438_; 
v_res_438_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(v_buf_436_, v_a_437_);
lean_dec_ref(v_buf_436_);
return v_res_438_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(lean_object* v_rounds_439_, lean_object* v_buf_440_, lean_object* v_a_441_){
_start:
{
lean_object* v_fst_442_; lean_object* v_snd_443_; lean_object* v___x_445_; uint8_t v_isShared_446_; uint8_t v_isSharedCheck_470_; 
v_fst_442_ = lean_ctor_get(v_a_441_, 0);
v_snd_443_ = lean_ctor_get(v_a_441_, 1);
v_isSharedCheck_470_ = !lean_is_exclusive(v_a_441_);
if (v_isSharedCheck_470_ == 0)
{
v___x_445_ = v_a_441_;
v_isShared_446_ = v_isSharedCheck_470_;
goto v_resetjp_444_;
}
else
{
lean_inc(v_snd_443_);
lean_inc(v_fst_442_);
lean_dec(v_a_441_);
v___x_445_ = lean_box(0);
v_isShared_446_ = v_isSharedCheck_470_;
goto v_resetjp_444_;
}
v_resetjp_444_:
{
uint8_t v___x_447_; 
v___x_447_ = lean_nat_dec_lt(v_fst_442_, v_rounds_439_);
if (v___x_447_ == 0)
{
lean_object* v___x_449_; 
if (v_isShared_446_ == 0)
{
v___x_449_ = v___x_445_;
goto v_reusejp_448_;
}
else
{
lean_object* v_reuseFailAlloc_450_; 
v_reuseFailAlloc_450_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_450_, 0, v_fst_442_);
lean_ctor_set(v_reuseFailAlloc_450_, 1, v_snd_443_);
v___x_449_ = v_reuseFailAlloc_450_;
goto v_reusejp_448_;
}
v_reusejp_448_:
{
return v___x_449_;
}
}
else
{
lean_object* v___x_451_; uint64_t v_x_452_; lean_object* v___x_454_; uint8_t v_isShared_455_; uint8_t v_isSharedCheck_469_; 
v___x_451_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(v_buf_440_, v_snd_443_);
v_x_452_ = lean_ctor_get_uint64(v___x_451_, sizeof(void*)*1);
v_isSharedCheck_469_ = !lean_is_exclusive(v___x_451_);
if (v_isSharedCheck_469_ == 0)
{
v___x_454_ = v___x_451_;
v_isShared_455_ = v_isSharedCheck_469_;
goto v_resetjp_453_;
}
else
{
lean_dec(v___x_451_);
v___x_454_ = lean_box(0);
v_isShared_455_ = v_isSharedCheck_469_;
goto v_resetjp_453_;
}
v_resetjp_453_:
{
size_t v___x_456_; uint64_t v___x_457_; uint64_t v___x_458_; uint64_t v___x_459_; lean_object* v___x_461_; 
v___x_456_ = ((size_t)0ULL);
v___x_457_ = 33ULL;
v___x_458_ = lean_uint64_shift_right(v_x_452_, v___x_457_);
v___x_459_ = lean_uint64_xor(v_x_452_, v___x_458_);
if (v_isShared_455_ == 0)
{
v___x_461_ = v___x_454_;
goto v_reusejp_460_;
}
else
{
lean_object* v_reuseFailAlloc_468_; 
v_reuseFailAlloc_468_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_461_ = v_reuseFailAlloc_468_;
goto v_reusejp_460_;
}
v_reusejp_460_:
{
lean_object* v___x_462_; lean_object* v___x_463_; lean_object* v___x_465_; 
lean_ctor_set_usize(v___x_461_, 0, v___x_456_);
lean_ctor_set_uint64(v___x_461_, sizeof(void*)*1, v___x_459_);
v___x_462_ = lean_unsigned_to_nat(1u);
v___x_463_ = lean_nat_add(v_fst_442_, v___x_462_);
lean_dec(v_fst_442_);
if (v_isShared_446_ == 0)
{
lean_ctor_set(v___x_445_, 1, v___x_461_);
lean_ctor_set(v___x_445_, 0, v___x_463_);
v___x_465_ = v___x_445_;
goto v_reusejp_464_;
}
else
{
lean_object* v_reuseFailAlloc_467_; 
v_reuseFailAlloc_467_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_467_, 0, v___x_463_);
lean_ctor_set(v_reuseFailAlloc_467_, 1, v___x_461_);
v___x_465_ = v_reuseFailAlloc_467_;
goto v_reusejp_464_;
}
v_reusejp_464_:
{
v_a_441_ = v___x_465_;
goto _start;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed(lean_object* v_rounds_471_, lean_object* v_buf_472_, lean_object* v_a_473_){
_start:
{
lean_object* v_res_474_; 
v_res_474_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(v_rounds_471_, v_buf_472_, v_a_473_);
lean_dec_ref(v_buf_472_);
lean_dec(v_rounds_471_);
return v_res_474_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_stateWhile(lean_object* v_rounds_475_, lean_object* v_buf_476_, uint64_t v_seed_477_){
_start:
{
lean_object* v_r_478_; size_t v___x_479_; lean_object* v_s_480_; lean_object* v___x_481_; lean_object* v___x_482_; lean_object* v_snd_483_; uint64_t v_x_484_; 
v_r_478_ = lean_unsigned_to_nat(0u);
v___x_479_ = ((size_t)0ULL);
v_s_480_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
lean_ctor_set_usize(v_s_480_, 0, v___x_479_);
lean_ctor_set_uint64(v_s_480_, sizeof(void*)*1, v_seed_477_);
v___x_481_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_481_, 0, v_r_478_);
lean_ctor_set(v___x_481_, 1, v_s_480_);
v___x_482_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(v_rounds_475_, v_buf_476_, v___x_481_);
v_snd_483_ = lean_ctor_get(v___x_482_, 1);
lean_inc(v_snd_483_);
lean_dec_ref(v___x_482_);
v_x_484_ = lean_ctor_get_uint64(v_snd_483_, sizeof(void*)*1);
lean_dec(v_snd_483_);
return v_x_484_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_stateWhile___boxed(lean_object* v_rounds_485_, lean_object* v_buf_486_, lean_object* v_seed_487_){
_start:
{
uint64_t v_seed_boxed_488_; uint64_t v_res_489_; lean_object* v_r_490_; 
v_seed_boxed_488_ = lean_unbox_uint64(v_seed_487_);
lean_dec_ref(v_seed_487_);
v_res_489_ = l_CompilerStudy_ByteWork_stateWhile(v_rounds_485_, v_buf_486_, v_seed_boxed_488_);
lean_dec_ref(v_buf_486_);
lean_dec(v_rounds_485_);
v_r_490_ = lean_box_uint64(v_res_489_);
return v_r_490_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0(lean_object* v_buf_491_, lean_object* v_inst_492_, lean_object* v_a_493_){
_start:
{
lean_object* v___x_494_; 
v___x_494_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(v_buf_491_, v_a_493_);
return v___x_494_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed(lean_object* v_buf_495_, lean_object* v_inst_496_, lean_object* v_a_497_){
_start:
{
lean_object* v_res_498_; 
v_res_498_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0(v_buf_495_, v_inst_496_, v_a_497_);
lean_dec_ref(v_buf_495_);
return v_res_498_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1(lean_object* v_rounds_499_, lean_object* v_buf_500_, lean_object* v_inst_501_, lean_object* v_a_502_){
_start:
{
lean_object* v___x_503_; 
v___x_503_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(v_rounds_499_, v_buf_500_, v_a_502_);
return v___x_503_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed(lean_object* v_rounds_504_, lean_object* v_buf_505_, lean_object* v_inst_506_, lean_object* v_a_507_){
_start:
{
lean_object* v_res_508_; 
v_res_508_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1(v_rounds_504_, v_buf_505_, v_inst_506_, v_a_507_);
lean_dec_ref(v_buf_505_);
lean_dec(v_rounds_504_);
return v_res_508_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runVariant(lean_object* v_name_514_, lean_object* v_rounds_515_, lean_object* v_buf_516_, uint64_t v_seed_517_){
_start:
{
lean_object* v___x_519_; uint8_t v___x_520_; 
v___x_519_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__0));
v___x_520_ = lean_string_dec_eq(v_name_514_, v___x_519_);
if (v___x_520_ == 0)
{
lean_object* v___x_521_; uint8_t v___x_522_; 
v___x_521_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__1));
v___x_522_ = lean_string_dec_eq(v_name_514_, v___x_521_);
if (v___x_522_ == 0)
{
lean_object* v___x_523_; uint8_t v___x_524_; 
v___x_523_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__2));
v___x_524_ = lean_string_dec_eq(v_name_514_, v___x_523_);
if (v___x_524_ == 0)
{
lean_object* v___x_525_; uint8_t v___x_526_; 
v___x_525_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__3));
v___x_526_ = lean_string_dec_eq(v_name_514_, v___x_525_);
if (v___x_526_ == 0)
{
lean_object* v___x_527_; lean_object* v___x_528_; lean_object* v___x_529_; lean_object* v___x_530_; 
v___x_527_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__4));
v___x_528_ = lean_string_append(v___x_527_, v_name_514_);
v___x_529_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v___x_529_, 0, v___x_528_);
v___x_530_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_530_, 0, v___x_529_);
return v___x_530_;
}
else
{
uint64_t v___x_531_; lean_object* v___x_532_; lean_object* v___x_533_; 
v___x_531_ = l_CompilerStudy_ByteWork_stateWhile(v_rounds_515_, v_buf_516_, v_seed_517_);
v___x_532_ = lean_box_uint64(v___x_531_);
v___x_533_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_533_, 0, v___x_532_);
return v___x_533_;
}
}
else
{
uint64_t v___x_534_; lean_object* v___x_535_; lean_object* v___x_536_; 
v___x_534_ = l_CompilerStudy_ByteWork_usizeFor(v_rounds_515_, v_buf_516_, v_seed_517_);
v___x_535_ = lean_box_uint64(v___x_534_);
v___x_536_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_536_, 0, v___x_535_);
return v___x_536_;
}
}
else
{
uint64_t v___x_537_; lean_object* v___x_538_; lean_object* v___x_539_; 
v___x_537_ = l_CompilerStudy_ByteWork_usizeWhile(v_rounds_515_, v_buf_516_, v_seed_517_);
v___x_538_ = lean_box_uint64(v___x_537_);
v___x_539_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_539_, 0, v___x_538_);
return v___x_539_;
}
}
else
{
uint64_t v___x_540_; lean_object* v___x_541_; lean_object* v___x_542_; 
v___x_540_ = l_CompilerStudy_ByteWork_natWhile(v_rounds_515_, v_buf_516_, v_seed_517_);
v___x_541_ = lean_box_uint64(v___x_540_);
v___x_542_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_542_, 0, v___x_541_);
return v___x_542_;
}
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runVariant___boxed(lean_object* v_name_543_, lean_object* v_rounds_544_, lean_object* v_buf_545_, lean_object* v_seed_546_, lean_object* v_a_547_){
_start:
{
uint64_t v_seed_boxed_548_; lean_object* v_res_549_; 
v_seed_boxed_548_ = lean_unbox_uint64(v_seed_546_);
lean_dec_ref(v_seed_546_);
v_res_549_ = l_CompilerStudy_ByteWork_runVariant(v_name_543_, v_rounds_544_, v_buf_545_, v_seed_boxed_548_);
lean_dec_ref(v_buf_545_);
lean_dec(v_rounds_544_);
lean_dec_ref(v_name_543_);
return v_res_549_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_parseNat(lean_object* v_s_550_, lean_object* v_fallback_551_){
_start:
{
lean_object* v___x_552_; lean_object* v___x_553_; lean_object* v___x_554_; lean_object* v___x_555_; 
v___x_552_ = lean_unsigned_to_nat(0u);
v___x_553_ = lean_string_utf8_byte_size(v_s_550_);
v___x_554_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_554_, 0, v_s_550_);
lean_ctor_set(v___x_554_, 1, v___x_552_);
lean_ctor_set(v___x_554_, 2, v___x_553_);
v___x_555_ = l_String_Slice_toNat_x3f(v___x_554_);
lean_dec_ref_known(v___x_554_, 3);
if (lean_obj_tag(v___x_555_) == 0)
{
lean_inc(v_fallback_551_);
return v_fallback_551_;
}
else
{
lean_object* v_val_556_; 
v_val_556_ = lean_ctor_get(v___x_555_, 0);
lean_inc(v_val_556_);
lean_dec_ref_known(v___x_555_, 1);
return v_val_556_;
}
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_parseNat___boxed(lean_object* v_s_557_, lean_object* v_fallback_558_){
_start:
{
lean_object* v_res_559_; 
v_res_559_ = l_CompilerStudy_ByteWork_parseNat(v_s_557_, v_fallback_558_);
lean_dec(v_fallback_558_);
return v_res_559_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runMain(lean_object* v_args_564_){
_start:
{
lean_object* v___x_566_; lean_object* v___x_567_; lean_object* v_variant_568_; lean_object* v___x_569_; lean_object* v___x_570_; lean_object* v___x_571_; lean_object* v___x_572_; lean_object* v_size_573_; lean_object* v___x_574_; lean_object* v___x_575_; lean_object* v___x_576_; lean_object* v_rounds_577_; lean_object* v___x_578_; lean_object* v___x_579_; lean_object* v___x_580_; lean_object* v___x_581_; lean_object* v___x_582_; uint64_t v_seed_583_; lean_object* v_buf_584_; lean_object* v___x_585_; lean_object* v___x_586_; 
v___x_566_ = lean_unsigned_to_nat(0u);
v___x_567_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__0));
v_variant_568_ = l_List_getD___redArg(v_args_564_, v___x_566_, v___x_567_);
v___x_569_ = lean_unsigned_to_nat(1u);
v___x_570_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__0));
v___x_571_ = l_List_getD___redArg(v_args_564_, v___x_569_, v___x_570_);
v___x_572_ = lean_unsigned_to_nat(1048576u);
v_size_573_ = l_CompilerStudy_ByteWork_parseNat(v___x_571_, v___x_572_);
v___x_574_ = lean_unsigned_to_nat(2u);
v___x_575_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__1));
v___x_576_ = l_List_getD___redArg(v_args_564_, v___x_574_, v___x_575_);
v_rounds_577_ = l_CompilerStudy_ByteWork_parseNat(v___x_576_, v___x_569_);
v___x_578_ = lean_unsigned_to_nat(3u);
v___x_579_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__2));
v___x_580_ = l_List_getD___redArg(v_args_564_, v___x_578_, v___x_579_);
v___x_581_ = lean_cstr_to_nat("2611923443488327891");
v___x_582_ = l_CompilerStudy_ByteWork_parseNat(v___x_580_, v___x_581_);
v_seed_583_ = lean_uint64_of_nat(v___x_582_);
lean_dec(v___x_582_);
v_buf_584_ = l_CompilerStudy_ByteWork_makeBuf(v_size_573_);
v___x_585_ = lean_nat_shiftr(v_rounds_577_, v___x_569_);
v___x_586_ = l_CompilerStudy_ByteWork_runVariant(v_variant_568_, v___x_585_, v_buf_584_, v_seed_583_);
lean_dec(v___x_585_);
if (lean_obj_tag(v___x_586_) == 0)
{
lean_object* v_a_587_; lean_object* v___x_588_; lean_object* v___x_589_; 
v_a_587_ = lean_ctor_get(v___x_586_, 0);
lean_inc(v_a_587_);
lean_dec_ref_known(v___x_586_, 1);
v___x_588_ = lean_io_mono_nanos_now();
v___x_589_ = l_CompilerStudy_ByteWork_runVariant(v_variant_568_, v_rounds_577_, v_buf_584_, v_seed_583_);
lean_dec_ref(v_buf_584_);
lean_dec(v_rounds_577_);
lean_dec(v_variant_568_);
if (lean_obj_tag(v___x_589_) == 0)
{
lean_object* v_a_590_; lean_object* v___x_591_; lean_object* v___x_592_; lean_object* v___x_593_; lean_object* v___x_594_; lean_object* v___x_595_; uint64_t v___x_596_; lean_object* v___x_597_; lean_object* v___x_598_; lean_object* v___x_599_; lean_object* v___x_600_; uint64_t v___x_601_; lean_object* v___x_602_; lean_object* v___x_603_; lean_object* v___x_604_; lean_object* v___x_605_; 
v_a_590_ = lean_ctor_get(v___x_589_, 0);
lean_inc(v_a_590_);
lean_dec_ref_known(v___x_589_, 1);
v___x_591_ = lean_io_mono_nanos_now();
v___x_592_ = lean_nat_sub(v___x_591_, v___x_588_);
lean_dec(v___x_588_);
lean_dec(v___x_591_);
v___x_593_ = l_Nat_reprFast(v___x_592_);
v___x_594_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__3));
v___x_595_ = lean_string_append(v___x_593_, v___x_594_);
v___x_596_ = lean_unbox_uint64(v_a_590_);
lean_dec(v_a_590_);
v___x_597_ = lean_uint64_to_nat(v___x_596_);
v___x_598_ = l_Nat_reprFast(v___x_597_);
v___x_599_ = lean_string_append(v___x_595_, v___x_598_);
lean_dec_ref(v___x_598_);
v___x_600_ = lean_string_append(v___x_599_, v___x_594_);
v___x_601_ = lean_unbox_uint64(v_a_587_);
lean_dec(v_a_587_);
v___x_602_ = lean_uint64_to_nat(v___x_601_);
v___x_603_ = l_Nat_reprFast(v___x_602_);
v___x_604_ = lean_string_append(v___x_600_, v___x_603_);
lean_dec_ref(v___x_603_);
v___x_605_ = l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(v___x_604_);
return v___x_605_;
}
else
{
lean_object* v_a_606_; lean_object* v___x_608_; uint8_t v_isShared_609_; uint8_t v_isSharedCheck_613_; 
lean_dec(v___x_588_);
lean_dec(v_a_587_);
v_a_606_ = lean_ctor_get(v___x_589_, 0);
v_isSharedCheck_613_ = !lean_is_exclusive(v___x_589_);
if (v_isSharedCheck_613_ == 0)
{
v___x_608_ = v___x_589_;
v_isShared_609_ = v_isSharedCheck_613_;
goto v_resetjp_607_;
}
else
{
lean_inc(v_a_606_);
lean_dec(v___x_589_);
v___x_608_ = lean_box(0);
v_isShared_609_ = v_isSharedCheck_613_;
goto v_resetjp_607_;
}
v_resetjp_607_:
{
lean_object* v___x_611_; 
if (v_isShared_609_ == 0)
{
v___x_611_ = v___x_608_;
goto v_reusejp_610_;
}
else
{
lean_object* v_reuseFailAlloc_612_; 
v_reuseFailAlloc_612_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_612_, 0, v_a_606_);
v___x_611_ = v_reuseFailAlloc_612_;
goto v_reusejp_610_;
}
v_reusejp_610_:
{
return v___x_611_;
}
}
}
}
else
{
lean_object* v_a_614_; lean_object* v___x_616_; uint8_t v_isShared_617_; uint8_t v_isSharedCheck_621_; 
lean_dec_ref(v_buf_584_);
lean_dec(v_rounds_577_);
lean_dec(v_variant_568_);
v_a_614_ = lean_ctor_get(v___x_586_, 0);
v_isSharedCheck_621_ = !lean_is_exclusive(v___x_586_);
if (v_isSharedCheck_621_ == 0)
{
v___x_616_ = v___x_586_;
v_isShared_617_ = v_isSharedCheck_621_;
goto v_resetjp_615_;
}
else
{
lean_inc(v_a_614_);
lean_dec(v___x_586_);
v___x_616_ = lean_box(0);
v_isShared_617_ = v_isSharedCheck_621_;
goto v_resetjp_615_;
}
v_resetjp_615_:
{
lean_object* v___x_619_; 
if (v_isShared_617_ == 0)
{
v___x_619_ = v___x_616_;
goto v_reusejp_618_;
}
else
{
lean_object* v_reuseFailAlloc_620_; 
v_reuseFailAlloc_620_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_620_, 0, v_a_614_);
v___x_619_ = v_reuseFailAlloc_620_;
goto v_reusejp_618_;
}
v_reusejp_618_:
{
return v___x_619_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runMain___boxed(lean_object* v_args_622_, lean_object* v_a_623_){
_start:
{
lean_object* v_res_624_; 
v_res_624_ = l_CompilerStudy_ByteWork_runMain(v_args_622_);
lean_dec(v_args_622_);
return v_res_624_;
}
}
LEAN_EXPORT lean_object* _lean_main(lean_object* v_args_625_){
_start:
{
lean_object* v___x_627_; 
v___x_627_ = l_CompilerStudy_ByteWork_runMain(v_args_625_);
lean_dec(v_args_625_);
return v___x_627_;
}
}
LEAN_EXPORT lean_object* l_main___boxed(lean_object* v_args_628_, lean_object* v_a_629_){
_start:
{
lean_object* v_res_630_; 
v_res_630_ = _lean_main(v_args_628_);
return v_res_630_;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_SplitProd(uint8_t builtin);
lean_object* initialize_Std(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ByteWork(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SplitProd(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Std(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
char ** lean_setup_args(int argc, char ** argv);
void lean_initialize();
#if defined(WIN32) || defined(_WIN32)
#include <windows.h>
#endif
lean_object* run_main(int argc, char ** argv) {
    lean_object* in = lean_box(0);
    int i = argc;
    while (i > 1) {
      lean_object* n;
      i--;
      n = lean_alloc_ctor(1,2,0); lean_ctor_set(n, 0, lean_mk_string(argv[i])); lean_ctor_set(n, 1, in);
      in = n;
    }
    return _lean_main(in);
}
int main(int argc, char ** argv) {
#if defined(WIN32) || defined(_WIN32)
  SetErrorMode(SEM_FAILCRITICALERRORS);
  SetConsoleOutputCP(CP_UTF8);
#endif
  lean_object* res;
  argv = lean_setup_args(argc, argv);
  lean_initialize();
  res = initialize_ByteWork(1 /* builtin */);
  lean_io_mark_end_initialization();
  if (lean_io_result_is_ok(res)) {
    lean_dec_ref(res);
    lean_init_task_manager();
    res = lean_run_main(&run_main, argc, argv);
  }
  lean_finalize_task_manager();
  if (lean_io_result_is_ok(res)) {
    int ret = 0;
    lean_dec_ref(res);
    return ret;
  } else {
    lean_io_result_show_error(res);
    lean_dec_ref(res);
    return 1;
  }
}
#ifdef __cplusplus
}
#endif
