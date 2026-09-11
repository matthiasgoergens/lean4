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
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed(lean_object*, lean_object*);
static const lean_ctor_object l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed__const__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*0 + sizeof(size_t)*1, .m_other = 0, .m_tag = 0}, .m_objs = {(lean_object*)(size_t)(0ULL)}};
LEAN_EXPORT const lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed__const__1 = (const lean_object*)&l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed__const__1_value;
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_usizeWhile(lean_object*, lean_object*, uint64_t);
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_usizeWhile___boxed(lean_object*, lean_object*, lean_object*);
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
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(lean_object* v_buf_171_, lean_object* v_a_172_){
_start:
{
lean_object* v_fst_173_; lean_object* v_snd_174_; lean_object* v___x_176_; uint8_t v_isShared_177_; uint8_t v_isSharedCheck_210_; 
v_fst_173_ = lean_ctor_get(v_a_172_, 0);
v_snd_174_ = lean_ctor_get(v_a_172_, 1);
v_isSharedCheck_210_ = !lean_is_exclusive(v_a_172_);
if (v_isSharedCheck_210_ == 0)
{
v___x_176_ = v_a_172_;
v_isShared_177_ = v_isSharedCheck_210_;
goto v_resetjp_175_;
}
else
{
lean_inc(v_snd_174_);
lean_inc(v_fst_173_);
lean_dec(v_a_172_);
v___x_176_ = lean_box(0);
v_isShared_177_ = v_isSharedCheck_210_;
goto v_resetjp_175_;
}
v_resetjp_175_:
{
uint8_t v___y_179_; lean_object* v___x_197_; size_t v___x_198_; size_t v___x_199_; uint8_t v___x_200_; 
v___x_197_ = lean_byte_array_size(v_buf_171_);
v___x_198_ = lean_usize_of_nat(v___x_197_);
v___x_199_ = lean_unbox_usize(v_snd_174_);
v___x_200_ = lean_usize_dec_lt(v___x_199_, v___x_198_);
if (v___x_200_ == 0)
{
lean_object* v___x_201_; 
lean_del_object(v___x_176_);
v___x_201_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_201_, 0, v_fst_173_);
lean_ctor_set(v___x_201_, 1, v_snd_174_);
return v___x_201_;
}
else
{
size_t v___x_202_; lean_object* v___x_203_; uint8_t v___x_204_; 
v___x_202_ = lean_unbox_usize(v_snd_174_);
v___x_203_ = lean_usize_to_nat(v___x_202_);
v___x_204_ = lean_nat_dec_lt(v___x_203_, v___x_197_);
if (v___x_204_ == 0)
{
uint8_t v___x_205_; lean_object* v___x_206_; lean_object* v___x_207_; uint8_t v___x_208_; 
lean_dec(v___x_203_);
v___x_205_ = l_instInhabitedUInt8;
v___x_206_ = lean_box(v___x_205_);
v___x_207_ = l_outOfBounds___redArg(v___x_206_);
lean_dec(v___x_206_);
v___x_208_ = lean_unbox(v___x_207_);
lean_dec(v___x_207_);
v___y_179_ = v___x_208_;
goto v___jp_178_;
}
else
{
uint8_t v___x_209_; 
v___x_209_ = lean_byte_array_fget(v_buf_171_, v___x_203_);
lean_dec(v___x_203_);
v___y_179_ = v___x_209_;
goto v___jp_178_;
}
}
v___jp_178_:
{
lean_object* v___x_180_; uint64_t v___x_181_; uint64_t v___x_182_; uint64_t v___x_183_; uint64_t v___x_184_; uint64_t v___x_185_; uint64_t v___x_186_; uint64_t v___x_187_; size_t v___x_188_; size_t v___x_189_; size_t v___x_190_; lean_object* v___x_191_; lean_object* v___x_192_; lean_object* v___x_194_; 
v___x_180_ = lean_uint8_to_nat(v___y_179_);
v___x_181_ = lean_uint64_of_nat(v___x_180_);
v___x_182_ = lean_unbox_uint64(v_fst_173_);
lean_dec(v_fst_173_);
v___x_183_ = lean_uint64_add(v___x_182_, v___x_181_);
v___x_184_ = 2654435769ULL;
v___x_185_ = lean_uint64_add(v___x_183_, v___x_184_);
v___x_186_ = 1099511628211ULL;
v___x_187_ = lean_uint64_mul(v___x_185_, v___x_186_);
v___x_188_ = ((size_t)1ULL);
v___x_189_ = lean_unbox_usize(v_snd_174_);
lean_dec(v_snd_174_);
v___x_190_ = lean_usize_add(v___x_189_, v___x_188_);
v___x_191_ = lean_box_uint64(v___x_187_);
v___x_192_ = lean_box_usize(v___x_190_);
if (v_isShared_177_ == 0)
{
lean_ctor_set(v___x_176_, 1, v___x_192_);
lean_ctor_set(v___x_176_, 0, v___x_191_);
v___x_194_ = v___x_176_;
goto v_reusejp_193_;
}
else
{
lean_object* v_reuseFailAlloc_196_; 
v_reuseFailAlloc_196_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_196_, 0, v___x_191_);
lean_ctor_set(v_reuseFailAlloc_196_, 1, v___x_192_);
v___x_194_ = v_reuseFailAlloc_196_;
goto v_reusejp_193_;
}
v_reusejp_193_:
{
v_a_172_ = v___x_194_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed(lean_object* v_buf_211_, lean_object* v_a_212_){
_start:
{
lean_object* v_res_213_; 
v_res_213_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(v_buf_211_, v_a_212_);
lean_dec_ref(v_buf_211_);
return v_res_213_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(lean_object* v_rounds_216_, lean_object* v_buf_217_, lean_object* v_a_218_){
_start:
{
lean_object* v_fst_219_; lean_object* v_snd_220_; lean_object* v___x_222_; uint8_t v_isShared_223_; uint8_t v_isSharedCheck_251_; 
v_fst_219_ = lean_ctor_get(v_a_218_, 0);
v_snd_220_ = lean_ctor_get(v_a_218_, 1);
v_isSharedCheck_251_ = !lean_is_exclusive(v_a_218_);
if (v_isSharedCheck_251_ == 0)
{
v___x_222_ = v_a_218_;
v_isShared_223_ = v_isSharedCheck_251_;
goto v_resetjp_221_;
}
else
{
lean_inc(v_snd_220_);
lean_inc(v_fst_219_);
lean_dec(v_a_218_);
v___x_222_ = lean_box(0);
v_isShared_223_ = v_isSharedCheck_251_;
goto v_resetjp_221_;
}
v_resetjp_221_:
{
uint8_t v___x_224_; 
v___x_224_ = lean_nat_dec_lt(v_fst_219_, v_rounds_216_);
if (v___x_224_ == 0)
{
lean_object* v___x_226_; 
if (v_isShared_223_ == 0)
{
v___x_226_ = v___x_222_;
goto v_reusejp_225_;
}
else
{
lean_object* v_reuseFailAlloc_227_; 
v_reuseFailAlloc_227_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_227_, 0, v_fst_219_);
lean_ctor_set(v_reuseFailAlloc_227_, 1, v_snd_220_);
v___x_226_ = v_reuseFailAlloc_227_;
goto v_reusejp_225_;
}
v_reusejp_225_:
{
return v___x_226_;
}
}
else
{
lean_object* v___x_228_; lean_object* v___x_230_; 
v___x_228_ = ((lean_object*)(l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed__const__1));
if (v_isShared_223_ == 0)
{
lean_ctor_set(v___x_222_, 1, v___x_228_);
lean_ctor_set(v___x_222_, 0, v_snd_220_);
v___x_230_ = v___x_222_;
goto v_reusejp_229_;
}
else
{
lean_object* v_reuseFailAlloc_250_; 
v_reuseFailAlloc_250_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_250_, 0, v_snd_220_);
lean_ctor_set(v_reuseFailAlloc_250_, 1, v___x_228_);
v___x_230_ = v_reuseFailAlloc_250_;
goto v_reusejp_229_;
}
v_reusejp_229_:
{
lean_object* v___x_231_; lean_object* v_fst_232_; lean_object* v___x_234_; uint8_t v_isShared_235_; uint8_t v_isSharedCheck_248_; 
v___x_231_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(v_buf_217_, v___x_230_);
v_fst_232_ = lean_ctor_get(v___x_231_, 0);
v_isSharedCheck_248_ = !lean_is_exclusive(v___x_231_);
if (v_isSharedCheck_248_ == 0)
{
lean_object* v_unused_249_; 
v_unused_249_ = lean_ctor_get(v___x_231_, 1);
lean_dec(v_unused_249_);
v___x_234_ = v___x_231_;
v_isShared_235_ = v_isSharedCheck_248_;
goto v_resetjp_233_;
}
else
{
lean_inc(v_fst_232_);
lean_dec(v___x_231_);
v___x_234_ = lean_box(0);
v_isShared_235_ = v_isSharedCheck_248_;
goto v_resetjp_233_;
}
v_resetjp_233_:
{
uint64_t v___x_236_; uint64_t v___x_237_; uint64_t v___x_238_; uint64_t v___x_239_; uint64_t v___x_240_; lean_object* v___x_241_; lean_object* v___x_242_; lean_object* v___x_243_; lean_object* v___x_245_; 
v___x_236_ = 33ULL;
v___x_237_ = lean_unbox_uint64(v_fst_232_);
v___x_238_ = lean_uint64_shift_right(v___x_237_, v___x_236_);
v___x_239_ = lean_unbox_uint64(v_fst_232_);
lean_dec(v_fst_232_);
v___x_240_ = lean_uint64_xor(v___x_239_, v___x_238_);
v___x_241_ = lean_unsigned_to_nat(1u);
v___x_242_ = lean_nat_add(v_fst_219_, v___x_241_);
lean_dec(v_fst_219_);
v___x_243_ = lean_box_uint64(v___x_240_);
if (v_isShared_235_ == 0)
{
lean_ctor_set(v___x_234_, 1, v___x_243_);
lean_ctor_set(v___x_234_, 0, v___x_242_);
v___x_245_ = v___x_234_;
goto v_reusejp_244_;
}
else
{
lean_object* v_reuseFailAlloc_247_; 
v_reuseFailAlloc_247_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_247_, 0, v___x_242_);
lean_ctor_set(v_reuseFailAlloc_247_, 1, v___x_243_);
v___x_245_ = v_reuseFailAlloc_247_;
goto v_reusejp_244_;
}
v_reusejp_244_:
{
v_a_218_ = v___x_245_;
goto _start;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed(lean_object* v_rounds_252_, lean_object* v_buf_253_, lean_object* v_a_254_){
_start:
{
lean_object* v_res_255_; 
v_res_255_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(v_rounds_252_, v_buf_253_, v_a_254_);
lean_dec_ref(v_buf_253_);
lean_dec(v_rounds_252_);
return v_res_255_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_usizeWhile(lean_object* v_rounds_256_, lean_object* v_buf_257_, uint64_t v_seed_258_){
_start:
{
lean_object* v_r_259_; lean_object* v___x_260_; lean_object* v___x_261_; lean_object* v___x_262_; lean_object* v_snd_263_; uint64_t v___x_264_; 
v_r_259_ = lean_unsigned_to_nat(0u);
v___x_260_ = lean_box_uint64(v_seed_258_);
v___x_261_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_261_, 0, v_r_259_);
lean_ctor_set(v___x_261_, 1, v___x_260_);
v___x_262_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(v_rounds_256_, v_buf_257_, v___x_261_);
v_snd_263_ = lean_ctor_get(v___x_262_, 1);
lean_inc(v_snd_263_);
lean_dec_ref(v___x_262_);
v___x_264_ = lean_unbox_uint64(v_snd_263_);
lean_dec(v_snd_263_);
return v___x_264_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_usizeWhile___boxed(lean_object* v_rounds_265_, lean_object* v_buf_266_, lean_object* v_seed_267_){
_start:
{
uint64_t v_seed_boxed_268_; uint64_t v_res_269_; lean_object* v_r_270_; 
v_seed_boxed_268_ = lean_unbox_uint64(v_seed_267_);
lean_dec_ref(v_seed_267_);
v_res_269_ = l_CompilerStudy_ByteWork_usizeWhile(v_rounds_265_, v_buf_266_, v_seed_boxed_268_);
lean_dec_ref(v_buf_266_);
lean_dec(v_rounds_265_);
v_r_270_ = lean_box_uint64(v_res_269_);
return v_r_270_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0(lean_object* v_buf_271_, lean_object* v_inst_272_, lean_object* v_a_273_){
_start:
{
lean_object* v___x_274_; 
v___x_274_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg(v_buf_271_, v_a_273_);
return v___x_274_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed(lean_object* v_buf_275_, lean_object* v_inst_276_, lean_object* v_a_277_){
_start:
{
lean_object* v_res_278_; 
v_res_278_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0(v_buf_275_, v_inst_276_, v_a_277_);
lean_dec_ref(v_buf_275_);
return v_res_278_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1(lean_object* v_rounds_279_, lean_object* v_buf_280_, lean_object* v_inst_281_, lean_object* v_a_282_){
_start:
{
lean_object* v___x_283_; 
v___x_283_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg(v_rounds_279_, v_buf_280_, v_a_282_);
return v___x_283_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed(lean_object* v_rounds_284_, lean_object* v_buf_285_, lean_object* v_inst_286_, lean_object* v_a_287_){
_start:
{
lean_object* v_res_288_; 
v_res_288_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1(v_rounds_284_, v_buf_285_, v_inst_286_, v_a_287_);
lean_dec_ref(v_buf_285_);
lean_dec(v_rounds_284_);
return v_res_288_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(size_t v_upperBound_289_, lean_object* v_buf_290_, size_t v_a_291_, uint64_t v_b_292_){
_start:
{
uint8_t v___y_294_; uint8_t v___x_307_; 
v___x_307_ = lean_usize_dec_lt(v_a_291_, v_upperBound_289_);
if (v___x_307_ == 0)
{
return v_b_292_;
}
else
{
lean_object* v___x_308_; lean_object* v___x_309_; uint8_t v___x_310_; 
v___x_308_ = lean_usize_to_nat(v_a_291_);
v___x_309_ = lean_byte_array_size(v_buf_290_);
v___x_310_ = lean_nat_dec_lt(v___x_308_, v___x_309_);
if (v___x_310_ == 0)
{
uint8_t v___x_311_; lean_object* v___x_312_; lean_object* v___x_313_; uint8_t v___x_314_; 
lean_dec(v___x_308_);
v___x_311_ = l_instInhabitedUInt8;
v___x_312_ = lean_box(v___x_311_);
v___x_313_ = l_outOfBounds___redArg(v___x_312_);
lean_dec(v___x_312_);
v___x_314_ = lean_unbox(v___x_313_);
lean_dec(v___x_313_);
v___y_294_ = v___x_314_;
goto v___jp_293_;
}
else
{
uint8_t v___x_315_; 
v___x_315_ = lean_byte_array_fget(v_buf_290_, v___x_308_);
lean_dec(v___x_308_);
v___y_294_ = v___x_315_;
goto v___jp_293_;
}
}
v___jp_293_:
{
lean_object* v___x_295_; uint64_t v___x_296_; uint64_t v___x_297_; uint64_t v___x_298_; uint64_t v___x_299_; uint64_t v___x_300_; uint64_t v___x_301_; size_t v___x_302_; size_t v___x_303_; size_t v___x_304_; uint8_t v___x_305_; 
v___x_295_ = lean_uint8_to_nat(v___y_294_);
v___x_296_ = lean_uint64_of_nat(v___x_295_);
v___x_297_ = lean_uint64_add(v_b_292_, v___x_296_);
v___x_298_ = 2654435769ULL;
v___x_299_ = lean_uint64_add(v___x_297_, v___x_298_);
v___x_300_ = 1099511628211ULL;
v___x_301_ = lean_uint64_mul(v___x_299_, v___x_300_);
v___x_302_ = ((size_t)1ULL);
v___x_303_ = lean_usize_add(v_a_291_, v___x_302_);
v___x_304_ = ((size_t)0ULL);
v___x_305_ = lean_usize_dec_eq(v___x_303_, v___x_304_);
if (v___x_305_ == 0)
{
v_a_291_ = v___x_303_;
v_b_292_ = v___x_301_;
goto _start;
}
else
{
return v___x_301_;
}
}
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed(lean_object* v_upperBound_316_, lean_object* v_buf_317_, lean_object* v_a_318_, lean_object* v_b_319_){
_start:
{
size_t v_upperBound_1299__boxed_320_; size_t v_a_boxed_321_; uint64_t v_b_boxed_322_; uint64_t v_res_323_; lean_object* v_r_324_; 
v_upperBound_1299__boxed_320_ = lean_unbox_usize(v_upperBound_316_);
lean_dec(v_upperBound_316_);
v_a_boxed_321_ = lean_unbox_usize(v_a_318_);
lean_dec(v_a_318_);
v_b_boxed_322_ = lean_unbox_uint64(v_b_319_);
lean_dec_ref(v_b_319_);
v_res_323_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(v_upperBound_1299__boxed_320_, v_buf_317_, v_a_boxed_321_, v_b_boxed_322_);
lean_dec_ref(v_buf_317_);
v_r_324_ = lean_box_uint64(v_res_323_);
return v_r_324_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(lean_object* v_rounds_325_, lean_object* v_buf_326_, lean_object* v_a_327_){
_start:
{
lean_object* v_fst_328_; lean_object* v_snd_329_; lean_object* v___x_331_; uint8_t v_isShared_332_; uint8_t v_isSharedCheck_352_; 
v_fst_328_ = lean_ctor_get(v_a_327_, 0);
v_snd_329_ = lean_ctor_get(v_a_327_, 1);
v_isSharedCheck_352_ = !lean_is_exclusive(v_a_327_);
if (v_isSharedCheck_352_ == 0)
{
v___x_331_ = v_a_327_;
v_isShared_332_ = v_isSharedCheck_352_;
goto v_resetjp_330_;
}
else
{
lean_inc(v_snd_329_);
lean_inc(v_fst_328_);
lean_dec(v_a_327_);
v___x_331_ = lean_box(0);
v_isShared_332_ = v_isSharedCheck_352_;
goto v_resetjp_330_;
}
v_resetjp_330_:
{
uint8_t v___x_333_; 
v___x_333_ = lean_nat_dec_lt(v_fst_328_, v_rounds_325_);
if (v___x_333_ == 0)
{
lean_object* v___x_335_; 
if (v_isShared_332_ == 0)
{
v___x_335_ = v___x_331_;
goto v_reusejp_334_;
}
else
{
lean_object* v_reuseFailAlloc_336_; 
v_reuseFailAlloc_336_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_336_, 0, v_fst_328_);
lean_ctor_set(v_reuseFailAlloc_336_, 1, v_snd_329_);
v___x_335_ = v_reuseFailAlloc_336_;
goto v_reusejp_334_;
}
v_reusejp_334_:
{
return v___x_335_;
}
}
else
{
size_t v___x_337_; lean_object* v___x_338_; size_t v___x_339_; uint64_t v___x_340_; uint64_t v___x_341_; uint64_t v___x_342_; uint64_t v___x_343_; uint64_t v___x_344_; lean_object* v___x_345_; lean_object* v___x_346_; lean_object* v___x_347_; lean_object* v___x_349_; 
v___x_337_ = ((size_t)0ULL);
v___x_338_ = lean_byte_array_size(v_buf_326_);
v___x_339_ = lean_usize_of_nat(v___x_338_);
v___x_340_ = lean_unbox_uint64(v_snd_329_);
lean_dec(v_snd_329_);
v___x_341_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(v___x_339_, v_buf_326_, v___x_337_, v___x_340_);
v___x_342_ = 33ULL;
v___x_343_ = lean_uint64_shift_right(v___x_341_, v___x_342_);
v___x_344_ = lean_uint64_xor(v___x_341_, v___x_343_);
v___x_345_ = lean_unsigned_to_nat(1u);
v___x_346_ = lean_nat_add(v_fst_328_, v___x_345_);
lean_dec(v_fst_328_);
v___x_347_ = lean_box_uint64(v___x_344_);
if (v_isShared_332_ == 0)
{
lean_ctor_set(v___x_331_, 1, v___x_347_);
lean_ctor_set(v___x_331_, 0, v___x_346_);
v___x_349_ = v___x_331_;
goto v_reusejp_348_;
}
else
{
lean_object* v_reuseFailAlloc_351_; 
v_reuseFailAlloc_351_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_351_, 0, v___x_346_);
lean_ctor_set(v_reuseFailAlloc_351_, 1, v___x_347_);
v___x_349_ = v_reuseFailAlloc_351_;
goto v_reusejp_348_;
}
v_reusejp_348_:
{
v_a_327_ = v___x_349_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed(lean_object* v_rounds_353_, lean_object* v_buf_354_, lean_object* v_a_355_){
_start:
{
lean_object* v_res_356_; 
v_res_356_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(v_rounds_353_, v_buf_354_, v_a_355_);
lean_dec_ref(v_buf_354_);
lean_dec(v_rounds_353_);
return v_res_356_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_usizeFor(lean_object* v_rounds_357_, lean_object* v_buf_358_, uint64_t v_seed_359_){
_start:
{
lean_object* v_r_360_; lean_object* v___x_361_; lean_object* v___x_362_; lean_object* v___x_363_; lean_object* v_snd_364_; uint64_t v___x_365_; 
v_r_360_ = lean_unsigned_to_nat(0u);
v___x_361_ = lean_box_uint64(v_seed_359_);
v___x_362_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_362_, 0, v_r_360_);
lean_ctor_set(v___x_362_, 1, v___x_361_);
v___x_363_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(v_rounds_357_, v_buf_358_, v___x_362_);
v_snd_364_ = lean_ctor_get(v___x_363_, 1);
lean_inc(v_snd_364_);
lean_dec_ref(v___x_363_);
v___x_365_ = lean_unbox_uint64(v_snd_364_);
lean_dec(v_snd_364_);
return v___x_365_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_usizeFor___boxed(lean_object* v_rounds_366_, lean_object* v_buf_367_, lean_object* v_seed_368_){
_start:
{
uint64_t v_seed_boxed_369_; uint64_t v_res_370_; lean_object* v_r_371_; 
v_seed_boxed_369_ = lean_unbox_uint64(v_seed_368_);
lean_dec_ref(v_seed_368_);
v_res_370_ = l_CompilerStudy_ByteWork_usizeFor(v_rounds_366_, v_buf_367_, v_seed_boxed_369_);
lean_dec_ref(v_buf_367_);
lean_dec(v_rounds_366_);
v_r_371_ = lean_box_uint64(v_res_370_);
return v_r_371_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0(size_t v_upperBound_372_, lean_object* v_buf_373_, lean_object* v_inst_374_, lean_object* v_R_375_, size_t v_a_376_, uint64_t v_b_377_, lean_object* v_c_378_){
_start:
{
uint64_t v___x_379_; 
v___x_379_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg(v_upperBound_372_, v_buf_373_, v_a_376_, v_b_377_);
return v___x_379_;
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed(lean_object* v_upperBound_380_, lean_object* v_buf_381_, lean_object* v_inst_382_, lean_object* v_R_383_, lean_object* v_a_384_, lean_object* v_b_385_, lean_object* v_c_386_){
_start:
{
size_t v_upperBound_1402__boxed_387_; size_t v_a_boxed_388_; uint64_t v_b_boxed_389_; uint64_t v_res_390_; lean_object* v_r_391_; 
v_upperBound_1402__boxed_387_ = lean_unbox_usize(v_upperBound_380_);
lean_dec(v_upperBound_380_);
v_a_boxed_388_ = lean_unbox_usize(v_a_384_);
lean_dec(v_a_384_);
v_b_boxed_389_ = lean_unbox_uint64(v_b_385_);
lean_dec_ref(v_b_385_);
v_res_390_ = l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0(v_upperBound_1402__boxed_387_, v_buf_381_, v_inst_382_, v_R_383_, v_a_boxed_388_, v_b_boxed_389_, v_c_386_);
lean_dec_ref(v_buf_381_);
v_r_391_ = lean_box_uint64(v_res_390_);
return v_r_391_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1(lean_object* v_rounds_392_, lean_object* v_buf_393_, lean_object* v_inst_394_, lean_object* v_a_395_){
_start:
{
lean_object* v___x_396_; 
v___x_396_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg(v_rounds_392_, v_buf_393_, v_a_395_);
return v___x_396_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed(lean_object* v_rounds_397_, lean_object* v_buf_398_, lean_object* v_inst_399_, lean_object* v_a_400_){
_start:
{
lean_object* v_res_401_; 
v_res_401_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1(v_rounds_397_, v_buf_398_, v_inst_399_, v_a_400_);
lean_dec_ref(v_buf_398_);
lean_dec(v_rounds_397_);
return v_res_401_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(lean_object* v_buf_402_, lean_object* v_a_403_){
_start:
{
size_t v_i_404_; uint64_t v_x_405_; lean_object* v___x_406_; size_t v___x_407_; uint8_t v___x_408_; 
v_i_404_ = lean_ctor_get_usize(v_a_403_, 0);
v_x_405_ = lean_ctor_get_uint64(v_a_403_, sizeof(void*)*1);
v___x_406_ = lean_byte_array_size(v_buf_402_);
v___x_407_ = lean_usize_of_nat(v___x_406_);
v___x_408_ = lean_usize_dec_lt(v_i_404_, v___x_407_);
if (v___x_408_ == 0)
{
return v_a_403_;
}
else
{
lean_object* v___x_410_; uint8_t v_isShared_411_; uint8_t v_isSharedCheck_434_; 
v_isSharedCheck_434_ = !lean_is_exclusive(v_a_403_);
if (v_isSharedCheck_434_ == 0)
{
v___x_410_ = v_a_403_;
v_isShared_411_ = v_isSharedCheck_434_;
goto v_resetjp_409_;
}
else
{
lean_dec(v_a_403_);
v___x_410_ = lean_box(0);
v_isShared_411_ = v_isSharedCheck_434_;
goto v_resetjp_409_;
}
v_resetjp_409_:
{
size_t v___x_412_; size_t v___x_413_; uint8_t v___y_415_; lean_object* v___x_427_; uint8_t v___x_428_; 
v___x_412_ = ((size_t)1ULL);
v___x_413_ = lean_usize_add(v_i_404_, v___x_412_);
v___x_427_ = lean_usize_to_nat(v_i_404_);
v___x_428_ = lean_nat_dec_lt(v___x_427_, v___x_406_);
if (v___x_428_ == 0)
{
uint8_t v___x_429_; lean_object* v___x_430_; lean_object* v___x_431_; uint8_t v___x_432_; 
lean_dec(v___x_427_);
v___x_429_ = l_instInhabitedUInt8;
v___x_430_ = lean_box(v___x_429_);
v___x_431_ = l_outOfBounds___redArg(v___x_430_);
lean_dec(v___x_430_);
v___x_432_ = lean_unbox(v___x_431_);
lean_dec(v___x_431_);
v___y_415_ = v___x_432_;
goto v___jp_414_;
}
else
{
uint8_t v___x_433_; 
v___x_433_ = lean_byte_array_fget(v_buf_402_, v___x_427_);
lean_dec(v___x_427_);
v___y_415_ = v___x_433_;
goto v___jp_414_;
}
v___jp_414_:
{
lean_object* v___x_416_; uint64_t v___x_417_; uint64_t v___x_418_; uint64_t v___x_419_; uint64_t v___x_420_; uint64_t v___x_421_; uint64_t v___x_422_; lean_object* v___x_424_; 
v___x_416_ = lean_uint8_to_nat(v___y_415_);
v___x_417_ = lean_uint64_of_nat(v___x_416_);
v___x_418_ = lean_uint64_add(v_x_405_, v___x_417_);
v___x_419_ = 2654435769ULL;
v___x_420_ = lean_uint64_add(v___x_418_, v___x_419_);
v___x_421_ = 1099511628211ULL;
v___x_422_ = lean_uint64_mul(v___x_420_, v___x_421_);
if (v_isShared_411_ == 0)
{
v___x_424_ = v___x_410_;
goto v_reusejp_423_;
}
else
{
lean_object* v_reuseFailAlloc_426_; 
v_reuseFailAlloc_426_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_424_ = v_reuseFailAlloc_426_;
goto v_reusejp_423_;
}
v_reusejp_423_:
{
lean_ctor_set_usize(v___x_424_, 0, v___x_413_);
lean_ctor_set_uint64(v___x_424_, sizeof(void*)*1, v___x_422_);
v_a_403_ = v___x_424_;
goto _start;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed(lean_object* v_buf_435_, lean_object* v_a_436_){
_start:
{
lean_object* v_res_437_; 
v_res_437_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(v_buf_435_, v_a_436_);
lean_dec_ref(v_buf_435_);
return v_res_437_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(lean_object* v_rounds_438_, lean_object* v_buf_439_, lean_object* v_a_440_){
_start:
{
lean_object* v_fst_441_; lean_object* v_snd_442_; lean_object* v___x_444_; uint8_t v_isShared_445_; uint8_t v_isSharedCheck_469_; 
v_fst_441_ = lean_ctor_get(v_a_440_, 0);
v_snd_442_ = lean_ctor_get(v_a_440_, 1);
v_isSharedCheck_469_ = !lean_is_exclusive(v_a_440_);
if (v_isSharedCheck_469_ == 0)
{
v___x_444_ = v_a_440_;
v_isShared_445_ = v_isSharedCheck_469_;
goto v_resetjp_443_;
}
else
{
lean_inc(v_snd_442_);
lean_inc(v_fst_441_);
lean_dec(v_a_440_);
v___x_444_ = lean_box(0);
v_isShared_445_ = v_isSharedCheck_469_;
goto v_resetjp_443_;
}
v_resetjp_443_:
{
uint8_t v___x_446_; 
v___x_446_ = lean_nat_dec_lt(v_fst_441_, v_rounds_438_);
if (v___x_446_ == 0)
{
lean_object* v___x_448_; 
if (v_isShared_445_ == 0)
{
v___x_448_ = v___x_444_;
goto v_reusejp_447_;
}
else
{
lean_object* v_reuseFailAlloc_449_; 
v_reuseFailAlloc_449_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_449_, 0, v_fst_441_);
lean_ctor_set(v_reuseFailAlloc_449_, 1, v_snd_442_);
v___x_448_ = v_reuseFailAlloc_449_;
goto v_reusejp_447_;
}
v_reusejp_447_:
{
return v___x_448_;
}
}
else
{
lean_object* v___x_450_; uint64_t v_x_451_; lean_object* v___x_453_; uint8_t v_isShared_454_; uint8_t v_isSharedCheck_468_; 
v___x_450_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(v_buf_439_, v_snd_442_);
v_x_451_ = lean_ctor_get_uint64(v___x_450_, sizeof(void*)*1);
v_isSharedCheck_468_ = !lean_is_exclusive(v___x_450_);
if (v_isSharedCheck_468_ == 0)
{
v___x_453_ = v___x_450_;
v_isShared_454_ = v_isSharedCheck_468_;
goto v_resetjp_452_;
}
else
{
lean_dec(v___x_450_);
v___x_453_ = lean_box(0);
v_isShared_454_ = v_isSharedCheck_468_;
goto v_resetjp_452_;
}
v_resetjp_452_:
{
size_t v___x_455_; uint64_t v___x_456_; uint64_t v___x_457_; uint64_t v___x_458_; lean_object* v___x_460_; 
v___x_455_ = ((size_t)0ULL);
v___x_456_ = 33ULL;
v___x_457_ = lean_uint64_shift_right(v_x_451_, v___x_456_);
v___x_458_ = lean_uint64_xor(v_x_451_, v___x_457_);
if (v_isShared_454_ == 0)
{
v___x_460_ = v___x_453_;
goto v_reusejp_459_;
}
else
{
lean_object* v_reuseFailAlloc_467_; 
v_reuseFailAlloc_467_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_460_ = v_reuseFailAlloc_467_;
goto v_reusejp_459_;
}
v_reusejp_459_:
{
lean_object* v___x_461_; lean_object* v___x_462_; lean_object* v___x_464_; 
lean_ctor_set_usize(v___x_460_, 0, v___x_455_);
lean_ctor_set_uint64(v___x_460_, sizeof(void*)*1, v___x_458_);
v___x_461_ = lean_unsigned_to_nat(1u);
v___x_462_ = lean_nat_add(v_fst_441_, v___x_461_);
lean_dec(v_fst_441_);
if (v_isShared_445_ == 0)
{
lean_ctor_set(v___x_444_, 1, v___x_460_);
lean_ctor_set(v___x_444_, 0, v___x_462_);
v___x_464_ = v___x_444_;
goto v_reusejp_463_;
}
else
{
lean_object* v_reuseFailAlloc_466_; 
v_reuseFailAlloc_466_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_466_, 0, v___x_462_);
lean_ctor_set(v_reuseFailAlloc_466_, 1, v___x_460_);
v___x_464_ = v_reuseFailAlloc_466_;
goto v_reusejp_463_;
}
v_reusejp_463_:
{
v_a_440_ = v___x_464_;
goto _start;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed(lean_object* v_rounds_470_, lean_object* v_buf_471_, lean_object* v_a_472_){
_start:
{
lean_object* v_res_473_; 
v_res_473_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(v_rounds_470_, v_buf_471_, v_a_472_);
lean_dec_ref(v_buf_471_);
lean_dec(v_rounds_470_);
return v_res_473_;
}
}
LEAN_EXPORT uint64_t l_CompilerStudy_ByteWork_stateWhile(lean_object* v_rounds_474_, lean_object* v_buf_475_, uint64_t v_seed_476_){
_start:
{
lean_object* v_r_477_; size_t v___x_478_; lean_object* v_s_479_; lean_object* v___x_480_; lean_object* v___x_481_; lean_object* v_snd_482_; uint64_t v_x_483_; 
v_r_477_ = lean_unsigned_to_nat(0u);
v___x_478_ = ((size_t)0ULL);
v_s_479_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
lean_ctor_set_usize(v_s_479_, 0, v___x_478_);
lean_ctor_set_uint64(v_s_479_, sizeof(void*)*1, v_seed_476_);
v___x_480_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_480_, 0, v_r_477_);
lean_ctor_set(v___x_480_, 1, v_s_479_);
v___x_481_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(v_rounds_474_, v_buf_475_, v___x_480_);
v_snd_482_ = lean_ctor_get(v___x_481_, 1);
lean_inc(v_snd_482_);
lean_dec_ref(v___x_481_);
v_x_483_ = lean_ctor_get_uint64(v_snd_482_, sizeof(void*)*1);
lean_dec(v_snd_482_);
return v_x_483_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_stateWhile___boxed(lean_object* v_rounds_484_, lean_object* v_buf_485_, lean_object* v_seed_486_){
_start:
{
uint64_t v_seed_boxed_487_; uint64_t v_res_488_; lean_object* v_r_489_; 
v_seed_boxed_487_ = lean_unbox_uint64(v_seed_486_);
lean_dec_ref(v_seed_486_);
v_res_488_ = l_CompilerStudy_ByteWork_stateWhile(v_rounds_484_, v_buf_485_, v_seed_boxed_487_);
lean_dec_ref(v_buf_485_);
lean_dec(v_rounds_484_);
v_r_489_ = lean_box_uint64(v_res_488_);
return v_r_489_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0(lean_object* v_buf_490_, lean_object* v_inst_491_, lean_object* v_a_492_){
_start:
{
lean_object* v___x_493_; 
v___x_493_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg(v_buf_490_, v_a_492_);
return v___x_493_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed(lean_object* v_buf_494_, lean_object* v_inst_495_, lean_object* v_a_496_){
_start:
{
lean_object* v_res_497_; 
v_res_497_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0(v_buf_494_, v_inst_495_, v_a_496_);
lean_dec_ref(v_buf_494_);
return v_res_497_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1(lean_object* v_rounds_498_, lean_object* v_buf_499_, lean_object* v_inst_500_, lean_object* v_a_501_){
_start:
{
lean_object* v___x_502_; 
v___x_502_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg(v_rounds_498_, v_buf_499_, v_a_501_);
return v___x_502_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed(lean_object* v_rounds_503_, lean_object* v_buf_504_, lean_object* v_inst_505_, lean_object* v_a_506_){
_start:
{
lean_object* v_res_507_; 
v_res_507_ = l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1(v_rounds_503_, v_buf_504_, v_inst_505_, v_a_506_);
lean_dec_ref(v_buf_504_);
lean_dec(v_rounds_503_);
return v_res_507_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runVariant(lean_object* v_name_513_, lean_object* v_rounds_514_, lean_object* v_buf_515_, uint64_t v_seed_516_){
_start:
{
lean_object* v___x_518_; uint8_t v___x_519_; 
v___x_518_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__0));
v___x_519_ = lean_string_dec_eq(v_name_513_, v___x_518_);
if (v___x_519_ == 0)
{
lean_object* v___x_520_; uint8_t v___x_521_; 
v___x_520_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__1));
v___x_521_ = lean_string_dec_eq(v_name_513_, v___x_520_);
if (v___x_521_ == 0)
{
lean_object* v___x_522_; uint8_t v___x_523_; 
v___x_522_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__2));
v___x_523_ = lean_string_dec_eq(v_name_513_, v___x_522_);
if (v___x_523_ == 0)
{
lean_object* v___x_524_; uint8_t v___x_525_; 
v___x_524_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__3));
v___x_525_ = lean_string_dec_eq(v_name_513_, v___x_524_);
if (v___x_525_ == 0)
{
lean_object* v___x_526_; lean_object* v___x_527_; lean_object* v___x_528_; lean_object* v___x_529_; 
v___x_526_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__4));
v___x_527_ = lean_string_append(v___x_526_, v_name_513_);
v___x_528_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v___x_528_, 0, v___x_527_);
v___x_529_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_529_, 0, v___x_528_);
return v___x_529_;
}
else
{
uint64_t v___x_530_; lean_object* v___x_531_; lean_object* v___x_532_; 
v___x_530_ = l_CompilerStudy_ByteWork_stateWhile(v_rounds_514_, v_buf_515_, v_seed_516_);
v___x_531_ = lean_box_uint64(v___x_530_);
v___x_532_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_532_, 0, v___x_531_);
return v___x_532_;
}
}
else
{
uint64_t v___x_533_; lean_object* v___x_534_; lean_object* v___x_535_; 
v___x_533_ = l_CompilerStudy_ByteWork_usizeFor(v_rounds_514_, v_buf_515_, v_seed_516_);
v___x_534_ = lean_box_uint64(v___x_533_);
v___x_535_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_535_, 0, v___x_534_);
return v___x_535_;
}
}
else
{
uint64_t v___x_536_; lean_object* v___x_537_; lean_object* v___x_538_; 
v___x_536_ = l_CompilerStudy_ByteWork_usizeWhile(v_rounds_514_, v_buf_515_, v_seed_516_);
v___x_537_ = lean_box_uint64(v___x_536_);
v___x_538_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_538_, 0, v___x_537_);
return v___x_538_;
}
}
else
{
uint64_t v___x_539_; lean_object* v___x_540_; lean_object* v___x_541_; 
v___x_539_ = l_CompilerStudy_ByteWork_natWhile(v_rounds_514_, v_buf_515_, v_seed_516_);
v___x_540_ = lean_box_uint64(v___x_539_);
v___x_541_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_541_, 0, v___x_540_);
return v___x_541_;
}
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runVariant___boxed(lean_object* v_name_542_, lean_object* v_rounds_543_, lean_object* v_buf_544_, lean_object* v_seed_545_, lean_object* v_a_546_){
_start:
{
uint64_t v_seed_boxed_547_; lean_object* v_res_548_; 
v_seed_boxed_547_ = lean_unbox_uint64(v_seed_545_);
lean_dec_ref(v_seed_545_);
v_res_548_ = l_CompilerStudy_ByteWork_runVariant(v_name_542_, v_rounds_543_, v_buf_544_, v_seed_boxed_547_);
lean_dec_ref(v_buf_544_);
lean_dec(v_rounds_543_);
lean_dec_ref(v_name_542_);
return v_res_548_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_parseNat(lean_object* v_s_549_, lean_object* v_fallback_550_){
_start:
{
lean_object* v___x_551_; lean_object* v___x_552_; lean_object* v___x_553_; lean_object* v___x_554_; 
v___x_551_ = lean_unsigned_to_nat(0u);
v___x_552_ = lean_string_utf8_byte_size(v_s_549_);
v___x_553_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_553_, 0, v_s_549_);
lean_ctor_set(v___x_553_, 1, v___x_551_);
lean_ctor_set(v___x_553_, 2, v___x_552_);
v___x_554_ = l_String_Slice_toNat_x3f(v___x_553_);
lean_dec_ref_known(v___x_553_, 3);
if (lean_obj_tag(v___x_554_) == 0)
{
lean_inc(v_fallback_550_);
return v_fallback_550_;
}
else
{
lean_object* v_val_555_; 
v_val_555_ = lean_ctor_get(v___x_554_, 0);
lean_inc(v_val_555_);
lean_dec_ref_known(v___x_554_, 1);
return v_val_555_;
}
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_parseNat___boxed(lean_object* v_s_556_, lean_object* v_fallback_557_){
_start:
{
lean_object* v_res_558_; 
v_res_558_ = l_CompilerStudy_ByteWork_parseNat(v_s_556_, v_fallback_557_);
lean_dec(v_fallback_557_);
return v_res_558_;
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runMain(lean_object* v_args_563_){
_start:
{
lean_object* v___x_565_; lean_object* v___x_566_; lean_object* v_variant_567_; lean_object* v___x_568_; lean_object* v___x_569_; lean_object* v___x_570_; lean_object* v___x_571_; lean_object* v_size_572_; lean_object* v___x_573_; lean_object* v___x_574_; lean_object* v___x_575_; lean_object* v_rounds_576_; lean_object* v___x_577_; lean_object* v___x_578_; lean_object* v___x_579_; lean_object* v___x_580_; lean_object* v___x_581_; uint64_t v_seed_582_; lean_object* v_buf_583_; lean_object* v___x_584_; lean_object* v___x_585_; 
v___x_565_ = lean_unsigned_to_nat(0u);
v___x_566_ = ((lean_object*)(l_CompilerStudy_ByteWork_runVariant___closed__0));
v_variant_567_ = l_List_getD___redArg(v_args_563_, v___x_565_, v___x_566_);
v___x_568_ = lean_unsigned_to_nat(1u);
v___x_569_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__0));
v___x_570_ = l_List_getD___redArg(v_args_563_, v___x_568_, v___x_569_);
v___x_571_ = lean_unsigned_to_nat(1048576u);
v_size_572_ = l_CompilerStudy_ByteWork_parseNat(v___x_570_, v___x_571_);
v___x_573_ = lean_unsigned_to_nat(2u);
v___x_574_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__1));
v___x_575_ = l_List_getD___redArg(v_args_563_, v___x_573_, v___x_574_);
v_rounds_576_ = l_CompilerStudy_ByteWork_parseNat(v___x_575_, v___x_568_);
v___x_577_ = lean_unsigned_to_nat(3u);
v___x_578_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__2));
v___x_579_ = l_List_getD___redArg(v_args_563_, v___x_577_, v___x_578_);
v___x_580_ = lean_cstr_to_nat("2611923443488327891");
v___x_581_ = l_CompilerStudy_ByteWork_parseNat(v___x_579_, v___x_580_);
v_seed_582_ = lean_uint64_of_nat(v___x_581_);
lean_dec(v___x_581_);
v_buf_583_ = l_CompilerStudy_ByteWork_makeBuf(v_size_572_);
v___x_584_ = lean_nat_shiftr(v_rounds_576_, v___x_568_);
v___x_585_ = l_CompilerStudy_ByteWork_runVariant(v_variant_567_, v___x_584_, v_buf_583_, v_seed_582_);
lean_dec(v___x_584_);
if (lean_obj_tag(v___x_585_) == 0)
{
lean_object* v_a_586_; lean_object* v___x_587_; lean_object* v___x_588_; 
v_a_586_ = lean_ctor_get(v___x_585_, 0);
lean_inc(v_a_586_);
lean_dec_ref_known(v___x_585_, 1);
v___x_587_ = lean_io_mono_nanos_now();
v___x_588_ = l_CompilerStudy_ByteWork_runVariant(v_variant_567_, v_rounds_576_, v_buf_583_, v_seed_582_);
lean_dec_ref(v_buf_583_);
lean_dec(v_rounds_576_);
lean_dec(v_variant_567_);
if (lean_obj_tag(v___x_588_) == 0)
{
lean_object* v_a_589_; lean_object* v___x_590_; lean_object* v___x_591_; lean_object* v___x_592_; lean_object* v___x_593_; lean_object* v___x_594_; uint64_t v___x_595_; lean_object* v___x_596_; lean_object* v___x_597_; lean_object* v___x_598_; lean_object* v___x_599_; uint64_t v___x_600_; lean_object* v___x_601_; lean_object* v___x_602_; lean_object* v___x_603_; lean_object* v___x_604_; 
v_a_589_ = lean_ctor_get(v___x_588_, 0);
lean_inc(v_a_589_);
lean_dec_ref_known(v___x_588_, 1);
v___x_590_ = lean_io_mono_nanos_now();
v___x_591_ = lean_nat_sub(v___x_590_, v___x_587_);
lean_dec(v___x_587_);
lean_dec(v___x_590_);
v___x_592_ = l_Nat_reprFast(v___x_591_);
v___x_593_ = ((lean_object*)(l_CompilerStudy_ByteWork_runMain___closed__3));
v___x_594_ = lean_string_append(v___x_592_, v___x_593_);
v___x_595_ = lean_unbox_uint64(v_a_589_);
lean_dec(v_a_589_);
v___x_596_ = lean_uint64_to_nat(v___x_595_);
v___x_597_ = l_Nat_reprFast(v___x_596_);
v___x_598_ = lean_string_append(v___x_594_, v___x_597_);
lean_dec_ref(v___x_597_);
v___x_599_ = lean_string_append(v___x_598_, v___x_593_);
v___x_600_ = lean_unbox_uint64(v_a_586_);
lean_dec(v_a_586_);
v___x_601_ = lean_uint64_to_nat(v___x_600_);
v___x_602_ = l_Nat_reprFast(v___x_601_);
v___x_603_ = lean_string_append(v___x_599_, v___x_602_);
lean_dec_ref(v___x_602_);
v___x_604_ = l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(v___x_603_);
return v___x_604_;
}
else
{
lean_object* v_a_605_; lean_object* v___x_607_; uint8_t v_isShared_608_; uint8_t v_isSharedCheck_612_; 
lean_dec(v___x_587_);
lean_dec(v_a_586_);
v_a_605_ = lean_ctor_get(v___x_588_, 0);
v_isSharedCheck_612_ = !lean_is_exclusive(v___x_588_);
if (v_isSharedCheck_612_ == 0)
{
v___x_607_ = v___x_588_;
v_isShared_608_ = v_isSharedCheck_612_;
goto v_resetjp_606_;
}
else
{
lean_inc(v_a_605_);
lean_dec(v___x_588_);
v___x_607_ = lean_box(0);
v_isShared_608_ = v_isSharedCheck_612_;
goto v_resetjp_606_;
}
v_resetjp_606_:
{
lean_object* v___x_610_; 
if (v_isShared_608_ == 0)
{
v___x_610_ = v___x_607_;
goto v_reusejp_609_;
}
else
{
lean_object* v_reuseFailAlloc_611_; 
v_reuseFailAlloc_611_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_611_, 0, v_a_605_);
v___x_610_ = v_reuseFailAlloc_611_;
goto v_reusejp_609_;
}
v_reusejp_609_:
{
return v___x_610_;
}
}
}
}
else
{
lean_object* v_a_613_; lean_object* v___x_615_; uint8_t v_isShared_616_; uint8_t v_isSharedCheck_620_; 
lean_dec_ref(v_buf_583_);
lean_dec(v_rounds_576_);
lean_dec(v_variant_567_);
v_a_613_ = lean_ctor_get(v___x_585_, 0);
v_isSharedCheck_620_ = !lean_is_exclusive(v___x_585_);
if (v_isSharedCheck_620_ == 0)
{
v___x_615_ = v___x_585_;
v_isShared_616_ = v_isSharedCheck_620_;
goto v_resetjp_614_;
}
else
{
lean_inc(v_a_613_);
lean_dec(v___x_585_);
v___x_615_ = lean_box(0);
v_isShared_616_ = v_isSharedCheck_620_;
goto v_resetjp_614_;
}
v_resetjp_614_:
{
lean_object* v___x_618_; 
if (v_isShared_616_ == 0)
{
v___x_618_ = v___x_615_;
goto v_reusejp_617_;
}
else
{
lean_object* v_reuseFailAlloc_619_; 
v_reuseFailAlloc_619_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_619_, 0, v_a_613_);
v___x_618_ = v_reuseFailAlloc_619_;
goto v_reusejp_617_;
}
v_reusejp_617_:
{
return v___x_618_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CompilerStudy_ByteWork_runMain___boxed(lean_object* v_args_621_, lean_object* v_a_622_){
_start:
{
lean_object* v_res_623_; 
v_res_623_ = l_CompilerStudy_ByteWork_runMain(v_args_621_);
lean_dec(v_args_621_);
return v_res_623_;
}
}
LEAN_EXPORT lean_object* _lean_main(lean_object* v_args_624_){
_start:
{
lean_object* v___x_626_; 
v___x_626_ = l_CompilerStudy_ByteWork_runMain(v_args_624_);
lean_dec(v_args_624_);
return v___x_626_;
}
}
LEAN_EXPORT lean_object* l_main___boxed(lean_object* v_args_627_, lean_object* v_a_628_){
_start:
{
lean_object* v_res_629_; 
v_res_629_ = _lean_main(v_args_627_);
return v_res_629_;
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
