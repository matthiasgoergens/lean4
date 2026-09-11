// Lean compiler output
// Module: build.Kernels
// Imports: public import Init public meta import Init public import Std public import SplitProd
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
uint8_t lean_usize_dec_lt(size_t, size_t);
uint64_t lean_usize_to_uint64(size_t);
uint64_t lean_uint64_add(uint64_t, uint64_t);
uint64_t lean_uint64_xor(uint64_t, uint64_t);
uint64_t lean_uint64_mul(uint64_t, uint64_t);
uint64_t lean_uint64_shift_right(uint64_t, uint64_t);
size_t lean_usize_add(size_t, size_t);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
size_t lean_usize_of_nat(lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
uint8_t lean_usize_dec_eq(size_t, size_t);
lean_object* l_List_getD___redArg(lean_object*, lean_object*, lean_object*);
lean_object* lean_string_utf8_byte_size(lean_object*);
lean_object* l_String_Slice_toNat_x21(lean_object*);
uint64_t lean_uint64_of_nat(lean_object*);
size_t lean_usize_shift_right(size_t, size_t);
uint8_t lean_string_dec_eq(lean_object*, lean_object*);
lean_object* lean_string_append(lean_object*, lean_object*);
lean_object* lean_usize_to_nat(size_t);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* lean_io_mono_nanos_now();
lean_object* l_Nat_reprFast(lean_object*);
lean_object* lean_uint64_to_nat(uint64_t);
lean_object* l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_step(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_step___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd(size_t, size_t, uint64_t);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_idWhile(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_idWhile___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0(size_t, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd(size_t, size_t, uint64_t);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0(size_t, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(lean_object*, uint64_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_forNat(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_forNat___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0(lean_object*, uint64_t, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(size_t, size_t, uint64_t);
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_forUSize(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_forUSize___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0(size_t, lean_object*, lean_object*, size_t, uint64_t, lean_object*);
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_tailScalar(size_t, size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_tailScalar___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_tailPair___splitProd(size_t, size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_tailPair___splitProd___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_tailPair(size_t, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_tailPair___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn___splitProd(size_t, size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn___splitProd___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn(size_t, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_whileStruct(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_whileStruct___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0(size_t, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_tailStruct(size_t, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_tailStruct___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_tailFuel(lean_object*, size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_tailFuel___boxed(lean_object*, lean_object*, lean_object*);
static const lean_string_object l_LoopStudy_runVariant___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 9, .m_capacity = 9, .m_length = 8, .m_data = "id-while"};
static const lean_object* l_LoopStudy_runVariant___closed__0 = (const lean_object*)&l_LoopStudy_runVariant___closed__0_value;
static const lean_string_object l_LoopStudy_runVariant___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 9, .m_capacity = 9, .m_length = 8, .m_data = "io-while"};
static const lean_object* l_LoopStudy_runVariant___closed__1 = (const lean_object*)&l_LoopStudy_runVariant___closed__1_value;
static const lean_string_object l_LoopStudy_runVariant___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "for-nat"};
static const lean_object* l_LoopStudy_runVariant___closed__2 = (const lean_object*)&l_LoopStudy_runVariant___closed__2_value;
static const lean_string_object l_LoopStudy_runVariant___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "for-usize"};
static const lean_object* l_LoopStudy_runVariant___closed__3 = (const lean_object*)&l_LoopStudy_runVariant___closed__3_value;
static const lean_string_object l_LoopStudy_runVariant___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "tail-scalar"};
static const lean_object* l_LoopStudy_runVariant___closed__4 = (const lean_object*)&l_LoopStudy_runVariant___closed__4_value;
static const lean_string_object l_LoopStudy_runVariant___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "tail-pair"};
static const lean_object* l_LoopStudy_runVariant___closed__5 = (const lean_object*)&l_LoopStudy_runVariant___closed__5_value;
static const lean_string_object l_LoopStudy_runVariant___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 17, .m_capacity = 17, .m_length = 16, .m_data = "tail-pair-return"};
static const lean_object* l_LoopStudy_runVariant___closed__6 = (const lean_object*)&l_LoopStudy_runVariant___closed__6_value;
static const lean_string_object l_LoopStudy_runVariant___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 13, .m_capacity = 13, .m_length = 12, .m_data = "while-struct"};
static const lean_object* l_LoopStudy_runVariant___closed__7 = (const lean_object*)&l_LoopStudy_runVariant___closed__7_value;
static const lean_string_object l_LoopStudy_runVariant___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "tail-struct"};
static const lean_object* l_LoopStudy_runVariant___closed__8 = (const lean_object*)&l_LoopStudy_runVariant___closed__8_value;
static const lean_string_object l_LoopStudy_runVariant___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "tail-fuel"};
static const lean_object* l_LoopStudy_runVariant___closed__9 = (const lean_object*)&l_LoopStudy_runVariant___closed__9_value;
static const lean_string_object l_LoopStudy_runVariant___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 18, .m_capacity = 18, .m_length = 17, .m_data = "unknown variant: "};
static const lean_object* l_LoopStudy_runVariant___closed__10 = (const lean_object*)&l_LoopStudy_runVariant___closed__10_value;
static const lean_ctor_object l_LoopStudy_runVariant___boxed__const__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*0 + sizeof(size_t)*1, .m_other = 0, .m_tag = 0}, .m_objs = {(lean_object*)(size_t)(0ULL)}};
LEAN_EXPORT const lean_object* l_LoopStudy_runVariant___boxed__const__1 = (const lean_object*)&l_LoopStudy_runVariant___boxed__const__1_value;
LEAN_EXPORT lean_object* l_LoopStudy_runVariant(lean_object*, size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_runVariant___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l_main___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "1000"};
static const lean_object* l_main___closed__0 = (const lean_object*)&l_main___closed__0_value;
static const lean_string_object l_main___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 20, .m_capacity = 20, .m_length = 19, .m_data = "2611923443488327891"};
static const lean_object* l_main___closed__1 = (const lean_object*)&l_main___closed__1_value;
static const lean_string_object l_main___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = " "};
static const lean_object* l_main___closed__2 = (const lean_object*)&l_main___closed__2_value;
LEAN_EXPORT lean_object* _lean_main(lean_object*);
LEAN_EXPORT lean_object* l_main___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_LoopStudy_step(size_t v_i_1_, uint64_t v_x_2_){
_start:
{
uint64_t v___x_3_; uint64_t v___x_4_; uint64_t v___x_5_; uint64_t v___x_6_; uint64_t v___x_7_; uint64_t v_x_8_; uint64_t v___x_9_; uint64_t v___x_10_; uint64_t v_x_11_; uint64_t v___x_12_; uint64_t v_x_13_; uint64_t v___x_14_; uint64_t v___x_15_; uint64_t v___x_16_; 
v___x_3_ = lean_usize_to_uint64(v_i_1_);
v___x_4_ = 11400714819323198485ULL;
v___x_5_ = lean_uint64_add(v___x_3_, v___x_4_);
v___x_6_ = lean_uint64_xor(v_x_2_, v___x_5_);
v___x_7_ = 13787848793156543929ULL;
v_x_8_ = lean_uint64_mul(v___x_6_, v___x_7_);
v___x_9_ = 29ULL;
v___x_10_ = lean_uint64_shift_right(v_x_8_, v___x_9_);
v_x_11_ = lean_uint64_xor(v_x_8_, v___x_10_);
v___x_12_ = 10723151780598845931ULL;
v_x_13_ = lean_uint64_mul(v_x_11_, v___x_12_);
v___x_14_ = 31ULL;
v___x_15_ = lean_uint64_shift_right(v_x_13_, v___x_14_);
v___x_16_ = lean_uint64_xor(v_x_13_, v___x_15_);
return v___x_16_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_step___boxed(lean_object* v_i_17_, lean_object* v_x_18_){
_start:
{
size_t v_i_boxed_19_; uint64_t v_x_boxed_20_; uint64_t v_res_21_; lean_object* v_r_22_; 
v_i_boxed_19_ = lean_unbox_usize(v_i_17_);
lean_dec(v_i_17_);
v_x_boxed_20_ = lean_unbox_uint64(v_x_18_);
lean_dec_ref(v_x_18_);
v_res_21_ = l_LoopStudy_step(v_i_boxed_19_, v_x_boxed_20_);
v_r_22_ = lean_box_uint64(v_res_21_);
return v_r_22_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd(size_t v_n_23_, size_t v_splitFst_24_, uint64_t v_splitSnd_25_){
_start:
{
uint8_t v___x_26_; 
v___x_26_ = lean_usize_dec_lt(v_splitFst_24_, v_n_23_);
if (v___x_26_ == 0)
{
lean_object* v___x_27_; lean_object* v___x_28_; lean_object* v___x_29_; 
v___x_27_ = lean_box_usize(v_splitFst_24_);
v___x_28_ = lean_box_uint64(v_splitSnd_25_);
v___x_29_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_29_, 0, v___x_27_);
lean_ctor_set(v___x_29_, 1, v___x_28_);
return v___x_29_;
}
else
{
uint64_t v___x_30_; uint64_t v___x_31_; uint64_t v___x_32_; uint64_t v___x_33_; uint64_t v___x_34_; uint64_t v_x_35_; uint64_t v___x_36_; uint64_t v___x_37_; uint64_t v_x_38_; uint64_t v___x_39_; uint64_t v_x_40_; uint64_t v___x_41_; uint64_t v___x_42_; uint64_t v_splitSnd_43_; size_t v___x_44_; size_t v_splitFst_45_; 
v___x_30_ = lean_usize_to_uint64(v_splitFst_24_);
v___x_31_ = 11400714819323198485ULL;
v___x_32_ = lean_uint64_add(v___x_30_, v___x_31_);
v___x_33_ = lean_uint64_xor(v_splitSnd_25_, v___x_32_);
v___x_34_ = 13787848793156543929ULL;
v_x_35_ = lean_uint64_mul(v___x_33_, v___x_34_);
v___x_36_ = 29ULL;
v___x_37_ = lean_uint64_shift_right(v_x_35_, v___x_36_);
v_x_38_ = lean_uint64_xor(v_x_35_, v___x_37_);
v___x_39_ = 10723151780598845931ULL;
v_x_40_ = lean_uint64_mul(v_x_38_, v___x_39_);
v___x_41_ = 31ULL;
v___x_42_ = lean_uint64_shift_right(v_x_40_, v___x_41_);
v_splitSnd_43_ = lean_uint64_xor(v_x_40_, v___x_42_);
v___x_44_ = ((size_t)1ULL);
v_splitFst_45_ = lean_usize_add(v_splitFst_24_, v___x_44_);
v_splitFst_24_ = v_splitFst_45_;
v_splitSnd_25_ = v_splitSnd_43_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed(lean_object* v_n_47_, lean_object* v_splitFst_48_, lean_object* v_splitSnd_49_){
_start:
{
size_t v_n_boxed_50_; size_t v_splitFst_boxed_51_; uint64_t v_splitSnd_boxed_52_; lean_object* v_res_53_; 
v_n_boxed_50_ = lean_unbox_usize(v_n_47_);
lean_dec(v_n_47_);
v_splitFst_boxed_51_ = lean_unbox_usize(v_splitFst_48_);
lean_dec(v_splitFst_48_);
v_splitSnd_boxed_52_ = lean_unbox_uint64(v_splitSnd_49_);
lean_dec_ref(v_splitSnd_49_);
v_res_53_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd(v_n_boxed_50_, v_splitFst_boxed_51_, v_splitSnd_boxed_52_);
return v_res_53_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_idWhile(size_t v_n_54_, uint64_t v_seed_55_){
_start:
{
size_t v_i_56_; lean_object* v___x_57_; lean_object* v_snd_58_; uint64_t v___x_59_; 
v_i_56_ = ((size_t)0ULL);
v___x_57_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd(v_n_54_, v_i_56_, v_seed_55_);
v_snd_58_ = lean_ctor_get(v___x_57_, 1);
lean_inc(v_snd_58_);
lean_dec_ref(v___x_57_);
v___x_59_ = lean_unbox_uint64(v_snd_58_);
lean_dec(v_snd_58_);
return v___x_59_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_idWhile___boxed(lean_object* v_n_60_, lean_object* v_seed_61_){
_start:
{
size_t v_n_boxed_62_; uint64_t v_seed_boxed_63_; uint64_t v_res_64_; lean_object* v_r_65_; 
v_n_boxed_62_ = lean_unbox_usize(v_n_60_);
lean_dec(v_n_60_);
v_seed_boxed_63_ = lean_unbox_uint64(v_seed_61_);
lean_dec_ref(v_seed_61_);
v_res_64_ = l_LoopStudy_idWhile(v_n_boxed_62_, v_seed_boxed_63_);
v_r_65_ = lean_box_uint64(v_res_64_);
return v_r_65_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(size_t v_n_66_, lean_object* v_a_67_){
_start:
{
lean_object* v_splitFst_68_; lean_object* v_splitSnd_69_; size_t v___x_70_; uint64_t v___x_71_; lean_object* v___x_72_; 
v_splitFst_68_ = lean_ctor_get(v_a_67_, 0);
v_splitSnd_69_ = lean_ctor_get(v_a_67_, 1);
v___x_70_ = lean_unbox_usize(v_splitFst_68_);
v___x_71_ = lean_unbox_uint64(v_splitSnd_69_);
v___x_72_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd(v_n_66_, v___x_70_, v___x_71_);
return v___x_72_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed(lean_object* v_n_73_, lean_object* v_a_74_){
_start:
{
size_t v_n_boxed_75_; lean_object* v_res_76_; 
v_n_boxed_75_ = lean_unbox_usize(v_n_73_);
lean_dec(v_n_73_);
v_res_76_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(v_n_boxed_75_, v_a_74_);
lean_dec_ref(v_a_74_);
return v_res_76_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0(size_t v_n_77_, lean_object* v_inst_78_, lean_object* v_a_79_){
_start:
{
lean_object* v_splitFst_80_; lean_object* v_splitSnd_81_; size_t v___x_82_; uint64_t v___x_83_; lean_object* v___x_84_; 
v_splitFst_80_ = lean_ctor_get(v_a_79_, 0);
v_splitSnd_81_ = lean_ctor_get(v_a_79_, 1);
v___x_82_ = lean_unbox_usize(v_splitFst_80_);
v___x_83_ = lean_unbox_uint64(v_splitSnd_81_);
v___x_84_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd(v_n_77_, v___x_82_, v___x_83_);
return v___x_84_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed(lean_object* v_n_85_, lean_object* v_inst_86_, lean_object* v_a_87_){
_start:
{
size_t v_n_boxed_88_; lean_object* v_res_89_; 
v_n_boxed_88_ = lean_unbox_usize(v_n_85_);
lean_dec(v_n_85_);
v_res_89_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0(v_n_boxed_88_, v_inst_86_, v_a_87_);
lean_dec_ref(v_a_87_);
return v_res_89_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd(size_t v_n_90_, size_t v_splitFst_91_, uint64_t v_splitSnd_92_){
_start:
{
uint8_t v___x_94_; 
v___x_94_ = lean_usize_dec_lt(v_splitFst_91_, v_n_90_);
if (v___x_94_ == 0)
{
lean_object* v___x_95_; lean_object* v___x_96_; lean_object* v___x_97_; lean_object* v___x_98_; 
v___x_95_ = lean_box_usize(v_splitFst_91_);
v___x_96_ = lean_box_uint64(v_splitSnd_92_);
v___x_97_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_97_, 0, v___x_95_);
lean_ctor_set(v___x_97_, 1, v___x_96_);
v___x_98_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_98_, 0, v___x_97_);
return v___x_98_;
}
else
{
uint64_t v___x_99_; uint64_t v___x_100_; uint64_t v___x_101_; uint64_t v___x_102_; uint64_t v___x_103_; uint64_t v_x_104_; uint64_t v___x_105_; uint64_t v___x_106_; uint64_t v_x_107_; uint64_t v___x_108_; uint64_t v_x_109_; uint64_t v___x_110_; uint64_t v___x_111_; uint64_t v_splitSnd_112_; size_t v___x_113_; size_t v_splitFst_114_; 
v___x_99_ = lean_usize_to_uint64(v_splitFst_91_);
v___x_100_ = 11400714819323198485ULL;
v___x_101_ = lean_uint64_add(v___x_99_, v___x_100_);
v___x_102_ = lean_uint64_xor(v_splitSnd_92_, v___x_101_);
v___x_103_ = 13787848793156543929ULL;
v_x_104_ = lean_uint64_mul(v___x_102_, v___x_103_);
v___x_105_ = 29ULL;
v___x_106_ = lean_uint64_shift_right(v_x_104_, v___x_105_);
v_x_107_ = lean_uint64_xor(v_x_104_, v___x_106_);
v___x_108_ = 10723151780598845931ULL;
v_x_109_ = lean_uint64_mul(v_x_107_, v___x_108_);
v___x_110_ = 31ULL;
v___x_111_ = lean_uint64_shift_right(v_x_109_, v___x_110_);
v_splitSnd_112_ = lean_uint64_xor(v_x_109_, v___x_111_);
v___x_113_ = ((size_t)1ULL);
v_splitFst_114_ = lean_usize_add(v_splitFst_91_, v___x_113_);
v_splitFst_91_ = v_splitFst_114_;
v_splitSnd_92_ = v_splitSnd_112_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed(lean_object* v_n_116_, lean_object* v_splitFst_117_, lean_object* v_splitSnd_118_, lean_object* v___y_119_){
_start:
{
size_t v_n_boxed_120_; size_t v_splitFst_boxed_121_; uint64_t v_splitSnd_boxed_122_; lean_object* v_res_123_; 
v_n_boxed_120_ = lean_unbox_usize(v_n_116_);
lean_dec(v_n_116_);
v_splitFst_boxed_121_ = lean_unbox_usize(v_splitFst_117_);
lean_dec(v_splitFst_117_);
v_splitSnd_boxed_122_ = lean_unbox_uint64(v_splitSnd_118_);
lean_dec_ref(v_splitSnd_118_);
v_res_123_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd(v_n_boxed_120_, v_splitFst_boxed_121_, v_splitSnd_boxed_122_);
return v_res_123_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile(size_t v_n_124_, uint64_t v_seed_125_){
_start:
{
size_t v_i_127_; lean_object* v___x_128_; 
v_i_127_ = ((size_t)0ULL);
v___x_128_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd(v_n_124_, v_i_127_, v_seed_125_);
if (lean_obj_tag(v___x_128_) == 0)
{
lean_object* v_a_129_; lean_object* v___x_131_; uint8_t v_isShared_132_; uint8_t v_isSharedCheck_137_; 
v_a_129_ = lean_ctor_get(v___x_128_, 0);
v_isSharedCheck_137_ = !lean_is_exclusive(v___x_128_);
if (v_isSharedCheck_137_ == 0)
{
v___x_131_ = v___x_128_;
v_isShared_132_ = v_isSharedCheck_137_;
goto v_resetjp_130_;
}
else
{
lean_inc(v_a_129_);
lean_dec(v___x_128_);
v___x_131_ = lean_box(0);
v_isShared_132_ = v_isSharedCheck_137_;
goto v_resetjp_130_;
}
v_resetjp_130_:
{
lean_object* v_snd_133_; lean_object* v___x_135_; 
v_snd_133_ = lean_ctor_get(v_a_129_, 1);
lean_inc(v_snd_133_);
lean_dec(v_a_129_);
if (v_isShared_132_ == 0)
{
lean_ctor_set(v___x_131_, 0, v_snd_133_);
v___x_135_ = v___x_131_;
goto v_reusejp_134_;
}
else
{
lean_object* v_reuseFailAlloc_136_; 
v_reuseFailAlloc_136_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_136_, 0, v_snd_133_);
v___x_135_ = v_reuseFailAlloc_136_;
goto v_reusejp_134_;
}
v_reusejp_134_:
{
return v___x_135_;
}
}
}
else
{
lean_object* v_a_138_; lean_object* v___x_140_; uint8_t v_isShared_141_; uint8_t v_isSharedCheck_145_; 
v_a_138_ = lean_ctor_get(v___x_128_, 0);
v_isSharedCheck_145_ = !lean_is_exclusive(v___x_128_);
if (v_isSharedCheck_145_ == 0)
{
v___x_140_ = v___x_128_;
v_isShared_141_ = v_isSharedCheck_145_;
goto v_resetjp_139_;
}
else
{
lean_inc(v_a_138_);
lean_dec(v___x_128_);
v___x_140_ = lean_box(0);
v_isShared_141_ = v_isSharedCheck_145_;
goto v_resetjp_139_;
}
v_resetjp_139_:
{
lean_object* v___x_143_; 
if (v_isShared_141_ == 0)
{
v___x_143_ = v___x_140_;
goto v_reusejp_142_;
}
else
{
lean_object* v_reuseFailAlloc_144_; 
v_reuseFailAlloc_144_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_144_, 0, v_a_138_);
v___x_143_ = v_reuseFailAlloc_144_;
goto v_reusejp_142_;
}
v_reusejp_142_:
{
return v___x_143_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile___boxed(lean_object* v_n_146_, lean_object* v_seed_147_, lean_object* v_a_148_){
_start:
{
size_t v_n_boxed_149_; uint64_t v_seed_boxed_150_; lean_object* v_res_151_; 
v_n_boxed_149_ = lean_unbox_usize(v_n_146_);
lean_dec(v_n_146_);
v_seed_boxed_150_ = lean_unbox_uint64(v_seed_147_);
lean_dec_ref(v_seed_147_);
v_res_151_ = l_LoopStudy_ioWhile(v_n_boxed_149_, v_seed_boxed_150_);
return v_res_151_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(size_t v_n_152_, lean_object* v_a_153_){
_start:
{
lean_object* v_splitFst_155_; lean_object* v_splitSnd_156_; size_t v___x_157_; uint64_t v___x_158_; lean_object* v___x_159_; 
v_splitFst_155_ = lean_ctor_get(v_a_153_, 0);
v_splitSnd_156_ = lean_ctor_get(v_a_153_, 1);
v___x_157_ = lean_unbox_usize(v_splitFst_155_);
v___x_158_ = lean_unbox_uint64(v_splitSnd_156_);
v___x_159_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd(v_n_152_, v___x_157_, v___x_158_);
return v___x_159_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed(lean_object* v_n_160_, lean_object* v_a_161_, lean_object* v___y_162_){
_start:
{
size_t v_n_boxed_163_; lean_object* v_res_164_; 
v_n_boxed_163_ = lean_unbox_usize(v_n_160_);
lean_dec(v_n_160_);
v_res_164_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(v_n_boxed_163_, v_a_161_);
lean_dec_ref(v_a_161_);
return v_res_164_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0(size_t v_n_165_, lean_object* v_inst_166_, lean_object* v_a_167_){
_start:
{
lean_object* v_splitFst_169_; lean_object* v_splitSnd_170_; size_t v___x_171_; uint64_t v___x_172_; lean_object* v___x_173_; 
v_splitFst_169_ = lean_ctor_get(v_a_167_, 0);
v_splitSnd_170_ = lean_ctor_get(v_a_167_, 1);
v___x_171_ = lean_unbox_usize(v_splitFst_169_);
v___x_172_ = lean_unbox_uint64(v_splitSnd_170_);
v___x_173_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd(v_n_165_, v___x_171_, v___x_172_);
return v___x_173_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed(lean_object* v_n_174_, lean_object* v_inst_175_, lean_object* v_a_176_, lean_object* v___y_177_){
_start:
{
size_t v_n_boxed_178_; lean_object* v_res_179_; 
v_n_boxed_178_ = lean_unbox_usize(v_n_174_);
lean_dec(v_n_174_);
v_res_179_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0(v_n_boxed_178_, v_inst_175_, v_a_176_);
lean_dec_ref(v_a_176_);
return v_res_179_;
}
}
LEAN_EXPORT uint64_t l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(lean_object* v_range_180_, uint64_t v_b_181_, lean_object* v_i_182_){
_start:
{
lean_object* v_stop_183_; lean_object* v_step_184_; uint8_t v___x_185_; 
v_stop_183_ = lean_ctor_get(v_range_180_, 1);
v_step_184_ = lean_ctor_get(v_range_180_, 2);
v___x_185_ = lean_nat_dec_lt(v_i_182_, v_stop_183_);
if (v___x_185_ == 0)
{
lean_dec(v_i_182_);
return v_b_181_;
}
else
{
size_t v___x_186_; uint64_t v___x_187_; uint64_t v___x_188_; uint64_t v___x_189_; uint64_t v___x_190_; uint64_t v___x_191_; uint64_t v_x_192_; uint64_t v___x_193_; uint64_t v___x_194_; uint64_t v_x_195_; uint64_t v___x_196_; uint64_t v_x_197_; uint64_t v___x_198_; uint64_t v___x_199_; uint64_t v___x_200_; lean_object* v___x_201_; 
v___x_186_ = lean_usize_of_nat(v_i_182_);
v___x_187_ = lean_usize_to_uint64(v___x_186_);
v___x_188_ = 11400714819323198485ULL;
v___x_189_ = lean_uint64_add(v___x_187_, v___x_188_);
v___x_190_ = lean_uint64_xor(v_b_181_, v___x_189_);
v___x_191_ = 13787848793156543929ULL;
v_x_192_ = lean_uint64_mul(v___x_190_, v___x_191_);
v___x_193_ = 29ULL;
v___x_194_ = lean_uint64_shift_right(v_x_192_, v___x_193_);
v_x_195_ = lean_uint64_xor(v_x_192_, v___x_194_);
v___x_196_ = 10723151780598845931ULL;
v_x_197_ = lean_uint64_mul(v_x_195_, v___x_196_);
v___x_198_ = 31ULL;
v___x_199_ = lean_uint64_shift_right(v_x_197_, v___x_198_);
v___x_200_ = lean_uint64_xor(v_x_197_, v___x_199_);
v___x_201_ = lean_nat_add(v_i_182_, v_step_184_);
lean_dec(v_i_182_);
v_b_181_ = v___x_200_;
v_i_182_ = v___x_201_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed(lean_object* v_range_203_, lean_object* v_b_204_, lean_object* v_i_205_){
_start:
{
uint64_t v_b_boxed_206_; uint64_t v_res_207_; lean_object* v_r_208_; 
v_b_boxed_206_ = lean_unbox_uint64(v_b_204_);
lean_dec_ref(v_b_204_);
v_res_207_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(v_range_203_, v_b_boxed_206_, v_i_205_);
lean_dec_ref(v_range_203_);
v_r_208_ = lean_box_uint64(v_res_207_);
return v_r_208_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_forNat(size_t v_n_209_, uint64_t v_seed_210_){
_start:
{
lean_object* v___x_211_; lean_object* v___x_212_; lean_object* v___x_213_; lean_object* v___x_214_; uint64_t v___x_215_; 
v___x_211_ = lean_unsigned_to_nat(0u);
v___x_212_ = lean_usize_to_nat(v_n_209_);
v___x_213_ = lean_unsigned_to_nat(1u);
v___x_214_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_214_, 0, v___x_211_);
lean_ctor_set(v___x_214_, 1, v___x_212_);
lean_ctor_set(v___x_214_, 2, v___x_213_);
v___x_215_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(v___x_214_, v_seed_210_, v___x_211_);
lean_dec_ref_known(v___x_214_, 3);
return v___x_215_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_forNat___boxed(lean_object* v_n_216_, lean_object* v_seed_217_){
_start:
{
size_t v_n_boxed_218_; uint64_t v_seed_boxed_219_; uint64_t v_res_220_; lean_object* v_r_221_; 
v_n_boxed_218_ = lean_unbox_usize(v_n_216_);
lean_dec(v_n_216_);
v_seed_boxed_219_ = lean_unbox_uint64(v_seed_217_);
lean_dec_ref(v_seed_217_);
v_res_220_ = l_LoopStudy_forNat(v_n_boxed_218_, v_seed_boxed_219_);
v_r_221_ = lean_box_uint64(v_res_220_);
return v_r_221_;
}
}
LEAN_EXPORT uint64_t l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0(lean_object* v_range_222_, uint64_t v_b_223_, lean_object* v_i_224_, lean_object* v_hs_225_, lean_object* v_hl_226_){
_start:
{
uint64_t v___x_227_; 
v___x_227_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(v_range_222_, v_b_223_, v_i_224_);
return v___x_227_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed(lean_object* v_range_228_, lean_object* v_b_229_, lean_object* v_i_230_, lean_object* v_hs_231_, lean_object* v_hl_232_){
_start:
{
uint64_t v_b_boxed_233_; uint64_t v_res_234_; lean_object* v_r_235_; 
v_b_boxed_233_ = lean_unbox_uint64(v_b_229_);
lean_dec_ref(v_b_229_);
v_res_234_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0(v_range_228_, v_b_boxed_233_, v_i_230_, v_hs_231_, v_hl_232_);
lean_dec_ref(v_range_228_);
v_r_235_ = lean_box_uint64(v_res_234_);
return v_r_235_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(size_t v_upperBound_236_, size_t v_a_237_, uint64_t v_b_238_){
_start:
{
uint8_t v___x_239_; 
v___x_239_ = lean_usize_dec_lt(v_a_237_, v_upperBound_236_);
if (v___x_239_ == 0)
{
return v_b_238_;
}
else
{
uint64_t v___x_240_; uint64_t v___x_241_; uint64_t v___x_242_; uint64_t v___x_243_; uint64_t v___x_244_; uint64_t v_x_245_; uint64_t v___x_246_; uint64_t v___x_247_; uint64_t v_x_248_; uint64_t v___x_249_; uint64_t v_x_250_; uint64_t v___x_251_; uint64_t v___x_252_; uint64_t v___x_253_; size_t v___x_254_; size_t v___x_255_; size_t v___x_256_; uint8_t v___x_257_; 
v___x_240_ = lean_usize_to_uint64(v_a_237_);
v___x_241_ = 11400714819323198485ULL;
v___x_242_ = lean_uint64_add(v___x_240_, v___x_241_);
v___x_243_ = lean_uint64_xor(v_b_238_, v___x_242_);
v___x_244_ = 13787848793156543929ULL;
v_x_245_ = lean_uint64_mul(v___x_243_, v___x_244_);
v___x_246_ = 29ULL;
v___x_247_ = lean_uint64_shift_right(v_x_245_, v___x_246_);
v_x_248_ = lean_uint64_xor(v_x_245_, v___x_247_);
v___x_249_ = 10723151780598845931ULL;
v_x_250_ = lean_uint64_mul(v_x_248_, v___x_249_);
v___x_251_ = 31ULL;
v___x_252_ = lean_uint64_shift_right(v_x_250_, v___x_251_);
v___x_253_ = lean_uint64_xor(v_x_250_, v___x_252_);
v___x_254_ = ((size_t)1ULL);
v___x_255_ = lean_usize_add(v_a_237_, v___x_254_);
v___x_256_ = ((size_t)0ULL);
v___x_257_ = lean_usize_dec_eq(v___x_255_, v___x_256_);
if (v___x_257_ == 0)
{
v_a_237_ = v___x_255_;
v_b_238_ = v___x_253_;
goto _start;
}
else
{
return v___x_253_;
}
}
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed(lean_object* v_upperBound_259_, lean_object* v_a_260_, lean_object* v_b_261_){
_start:
{
size_t v_upperBound_624__boxed_262_; size_t v_a_boxed_263_; uint64_t v_b_boxed_264_; uint64_t v_res_265_; lean_object* v_r_266_; 
v_upperBound_624__boxed_262_ = lean_unbox_usize(v_upperBound_259_);
lean_dec(v_upperBound_259_);
v_a_boxed_263_ = lean_unbox_usize(v_a_260_);
lean_dec(v_a_260_);
v_b_boxed_264_ = lean_unbox_uint64(v_b_261_);
lean_dec_ref(v_b_261_);
v_res_265_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(v_upperBound_624__boxed_262_, v_a_boxed_263_, v_b_boxed_264_);
v_r_266_ = lean_box_uint64(v_res_265_);
return v_r_266_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_forUSize(size_t v_n_267_, uint64_t v_seed_268_){
_start:
{
size_t v___x_269_; uint64_t v___x_270_; 
v___x_269_ = ((size_t)0ULL);
v___x_270_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(v_n_267_, v___x_269_, v_seed_268_);
return v___x_270_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_forUSize___boxed(lean_object* v_n_271_, lean_object* v_seed_272_){
_start:
{
size_t v_n_boxed_273_; uint64_t v_seed_boxed_274_; uint64_t v_res_275_; lean_object* v_r_276_; 
v_n_boxed_273_ = lean_unbox_usize(v_n_271_);
lean_dec(v_n_271_);
v_seed_boxed_274_ = lean_unbox_uint64(v_seed_272_);
lean_dec_ref(v_seed_272_);
v_res_275_ = l_LoopStudy_forUSize(v_n_boxed_273_, v_seed_boxed_274_);
v_r_276_ = lean_box_uint64(v_res_275_);
return v_r_276_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0(size_t v_upperBound_277_, lean_object* v_inst_278_, lean_object* v_R_279_, size_t v_a_280_, uint64_t v_b_281_, lean_object* v_c_282_){
_start:
{
uint64_t v___x_283_; 
v___x_283_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(v_upperBound_277_, v_a_280_, v_b_281_);
return v___x_283_;
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed(lean_object* v_upperBound_284_, lean_object* v_inst_285_, lean_object* v_R_286_, lean_object* v_a_287_, lean_object* v_b_288_, lean_object* v_c_289_){
_start:
{
size_t v_upperBound_665__boxed_290_; size_t v_a_boxed_291_; uint64_t v_b_boxed_292_; uint64_t v_res_293_; lean_object* v_r_294_; 
v_upperBound_665__boxed_290_ = lean_unbox_usize(v_upperBound_284_);
lean_dec(v_upperBound_284_);
v_a_boxed_291_ = lean_unbox_usize(v_a_287_);
lean_dec(v_a_287_);
v_b_boxed_292_ = lean_unbox_uint64(v_b_288_);
lean_dec_ref(v_b_288_);
v_res_293_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0(v_upperBound_665__boxed_290_, v_inst_285_, v_R_286_, v_a_boxed_291_, v_b_boxed_292_, v_c_289_);
v_r_294_ = lean_box_uint64(v_res_293_);
return v_r_294_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailScalar(size_t v_n_295_, size_t v_i_296_, uint64_t v_x_297_){
_start:
{
uint8_t v___x_298_; 
v___x_298_ = lean_usize_dec_lt(v_i_296_, v_n_295_);
if (v___x_298_ == 0)
{
return v_x_297_;
}
else
{
size_t v___x_299_; size_t v___x_300_; uint64_t v___x_301_; uint64_t v___x_302_; uint64_t v___x_303_; uint64_t v___x_304_; uint64_t v___x_305_; uint64_t v_x_306_; uint64_t v___x_307_; uint64_t v___x_308_; uint64_t v_x_309_; uint64_t v___x_310_; uint64_t v_x_311_; uint64_t v___x_312_; uint64_t v___x_313_; uint64_t v___x_314_; 
v___x_299_ = ((size_t)1ULL);
v___x_300_ = lean_usize_add(v_i_296_, v___x_299_);
v___x_301_ = lean_usize_to_uint64(v_i_296_);
v___x_302_ = 11400714819323198485ULL;
v___x_303_ = lean_uint64_add(v___x_301_, v___x_302_);
v___x_304_ = lean_uint64_xor(v_x_297_, v___x_303_);
v___x_305_ = 13787848793156543929ULL;
v_x_306_ = lean_uint64_mul(v___x_304_, v___x_305_);
v___x_307_ = 29ULL;
v___x_308_ = lean_uint64_shift_right(v_x_306_, v___x_307_);
v_x_309_ = lean_uint64_xor(v_x_306_, v___x_308_);
v___x_310_ = 10723151780598845931ULL;
v_x_311_ = lean_uint64_mul(v_x_309_, v___x_310_);
v___x_312_ = 31ULL;
v___x_313_ = lean_uint64_shift_right(v_x_311_, v___x_312_);
v___x_314_ = lean_uint64_xor(v_x_311_, v___x_313_);
v_i_296_ = v___x_300_;
v_x_297_ = v___x_314_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailScalar___boxed(lean_object* v_n_316_, lean_object* v_i_317_, lean_object* v_x_318_){
_start:
{
size_t v_n_boxed_319_; size_t v_i_boxed_320_; uint64_t v_x_boxed_321_; uint64_t v_res_322_; lean_object* v_r_323_; 
v_n_boxed_319_ = lean_unbox_usize(v_n_316_);
lean_dec(v_n_316_);
v_i_boxed_320_ = lean_unbox_usize(v_i_317_);
lean_dec(v_i_317_);
v_x_boxed_321_ = lean_unbox_uint64(v_x_318_);
lean_dec_ref(v_x_318_);
v_res_322_ = l_LoopStudy_tailScalar(v_n_boxed_319_, v_i_boxed_320_, v_x_boxed_321_);
v_r_323_ = lean_box_uint64(v_res_322_);
return v_r_323_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailPair___splitProd(size_t v_n_324_, size_t v_splitFst_325_, uint64_t v_splitSnd_326_){
_start:
{
uint8_t v___x_327_; 
v___x_327_ = lean_usize_dec_lt(v_splitFst_325_, v_n_324_);
if (v___x_327_ == 0)
{
return v_splitSnd_326_;
}
else
{
size_t v___x_328_; size_t v_splitFst_329_; uint64_t v___x_330_; uint64_t v___x_331_; uint64_t v___x_332_; uint64_t v___x_333_; uint64_t v___x_334_; uint64_t v_x_335_; uint64_t v___x_336_; uint64_t v___x_337_; uint64_t v_x_338_; uint64_t v___x_339_; uint64_t v_x_340_; uint64_t v___x_341_; uint64_t v___x_342_; uint64_t v_splitSnd_343_; 
v___x_328_ = ((size_t)1ULL);
v_splitFst_329_ = lean_usize_add(v_splitFst_325_, v___x_328_);
v___x_330_ = lean_usize_to_uint64(v_splitFst_325_);
v___x_331_ = 11400714819323198485ULL;
v___x_332_ = lean_uint64_add(v___x_330_, v___x_331_);
v___x_333_ = lean_uint64_xor(v_splitSnd_326_, v___x_332_);
v___x_334_ = 13787848793156543929ULL;
v_x_335_ = lean_uint64_mul(v___x_333_, v___x_334_);
v___x_336_ = 29ULL;
v___x_337_ = lean_uint64_shift_right(v_x_335_, v___x_336_);
v_x_338_ = lean_uint64_xor(v_x_335_, v___x_337_);
v___x_339_ = 10723151780598845931ULL;
v_x_340_ = lean_uint64_mul(v_x_338_, v___x_339_);
v___x_341_ = 31ULL;
v___x_342_ = lean_uint64_shift_right(v_x_340_, v___x_341_);
v_splitSnd_343_ = lean_uint64_xor(v_x_340_, v___x_342_);
v_splitFst_325_ = v_splitFst_329_;
v_splitSnd_326_ = v_splitSnd_343_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPair___splitProd___boxed(lean_object* v_n_345_, lean_object* v_splitFst_346_, lean_object* v_splitSnd_347_){
_start:
{
size_t v_n_boxed_348_; size_t v_splitFst_boxed_349_; uint64_t v_splitSnd_boxed_350_; uint64_t v_res_351_; lean_object* v_r_352_; 
v_n_boxed_348_ = lean_unbox_usize(v_n_345_);
lean_dec(v_n_345_);
v_splitFst_boxed_349_ = lean_unbox_usize(v_splitFst_346_);
lean_dec(v_splitFst_346_);
v_splitSnd_boxed_350_ = lean_unbox_uint64(v_splitSnd_347_);
lean_dec_ref(v_splitSnd_347_);
v_res_351_ = l_LoopStudy_tailPair___splitProd(v_n_boxed_348_, v_splitFst_boxed_349_, v_splitSnd_boxed_350_);
v_r_352_ = lean_box_uint64(v_res_351_);
return v_r_352_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailPair(size_t v_n_353_, lean_object* v_s_354_){
_start:
{
lean_object* v_splitFst_355_; lean_object* v_splitSnd_356_; size_t v___x_357_; uint64_t v___x_358_; uint64_t v___x_359_; 
v_splitFst_355_ = lean_ctor_get(v_s_354_, 0);
v_splitSnd_356_ = lean_ctor_get(v_s_354_, 1);
v___x_357_ = lean_unbox_usize(v_splitFst_355_);
v___x_358_ = lean_unbox_uint64(v_splitSnd_356_);
v___x_359_ = l_LoopStudy_tailPair___splitProd(v_n_353_, v___x_357_, v___x_358_);
return v___x_359_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPair___boxed(lean_object* v_n_360_, lean_object* v_s_361_){
_start:
{
size_t v_n_boxed_362_; uint64_t v_res_363_; lean_object* v_r_364_; 
v_n_boxed_362_ = lean_unbox_usize(v_n_360_);
lean_dec(v_n_360_);
v_res_363_ = l_LoopStudy_tailPair(v_n_boxed_362_, v_s_361_);
lean_dec_ref(v_s_361_);
v_r_364_ = lean_box_uint64(v_res_363_);
return v_r_364_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn___splitProd(size_t v_n_365_, size_t v_splitFst_366_, uint64_t v_splitSnd_367_){
_start:
{
lean_object* v___x_368_; lean_object* v___x_369_; lean_object* v_s_370_; uint8_t v___x_371_; 
v___x_368_ = lean_box_usize(v_splitFst_366_);
v___x_369_ = lean_box_uint64(v_splitSnd_367_);
v_s_370_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_s_370_, 0, v___x_368_);
lean_ctor_set(v_s_370_, 1, v___x_369_);
v___x_371_ = lean_usize_dec_lt(v_splitFst_366_, v_n_365_);
if (v___x_371_ == 0)
{
return v_s_370_;
}
else
{
size_t v___x_372_; size_t v_splitFst_373_; uint64_t v___x_374_; uint64_t v___x_375_; uint64_t v___x_376_; uint64_t v___x_377_; uint64_t v___x_378_; uint64_t v_x_379_; uint64_t v___x_380_; uint64_t v___x_381_; uint64_t v_x_382_; uint64_t v___x_383_; uint64_t v_x_384_; uint64_t v___x_385_; uint64_t v___x_386_; uint64_t v_splitSnd_387_; 
lean_dec_ref_known(v_s_370_, 2);
v___x_372_ = ((size_t)1ULL);
v_splitFst_373_ = lean_usize_add(v_splitFst_366_, v___x_372_);
v___x_374_ = lean_usize_to_uint64(v_splitFst_366_);
v___x_375_ = 11400714819323198485ULL;
v___x_376_ = lean_uint64_add(v___x_374_, v___x_375_);
v___x_377_ = lean_uint64_xor(v_splitSnd_367_, v___x_376_);
v___x_378_ = 13787848793156543929ULL;
v_x_379_ = lean_uint64_mul(v___x_377_, v___x_378_);
v___x_380_ = 29ULL;
v___x_381_ = lean_uint64_shift_right(v_x_379_, v___x_380_);
v_x_382_ = lean_uint64_xor(v_x_379_, v___x_381_);
v___x_383_ = 10723151780598845931ULL;
v_x_384_ = lean_uint64_mul(v_x_382_, v___x_383_);
v___x_385_ = 31ULL;
v___x_386_ = lean_uint64_shift_right(v_x_384_, v___x_385_);
v_splitSnd_387_ = lean_uint64_xor(v_x_384_, v___x_386_);
v_splitFst_366_ = v_splitFst_373_;
v_splitSnd_367_ = v_splitSnd_387_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn___splitProd___boxed(lean_object* v_n_389_, lean_object* v_splitFst_390_, lean_object* v_splitSnd_391_){
_start:
{
size_t v_n_boxed_392_; size_t v_splitFst_boxed_393_; uint64_t v_splitSnd_boxed_394_; lean_object* v_res_395_; 
v_n_boxed_392_ = lean_unbox_usize(v_n_389_);
lean_dec(v_n_389_);
v_splitFst_boxed_393_ = lean_unbox_usize(v_splitFst_390_);
lean_dec(v_splitFst_390_);
v_splitSnd_boxed_394_ = lean_unbox_uint64(v_splitSnd_391_);
lean_dec_ref(v_splitSnd_391_);
v_res_395_ = l_LoopStudy_tailPairReturn___splitProd(v_n_boxed_392_, v_splitFst_boxed_393_, v_splitSnd_boxed_394_);
return v_res_395_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn(size_t v_n_396_, lean_object* v_s_397_){
_start:
{
lean_object* v_splitFst_398_; lean_object* v_splitSnd_399_; size_t v___x_400_; uint64_t v___x_401_; lean_object* v___x_402_; 
v_splitFst_398_ = lean_ctor_get(v_s_397_, 0);
v_splitSnd_399_ = lean_ctor_get(v_s_397_, 1);
v___x_400_ = lean_unbox_usize(v_splitFst_398_);
v___x_401_ = lean_unbox_uint64(v_splitSnd_399_);
v___x_402_ = l_LoopStudy_tailPairReturn___splitProd(v_n_396_, v___x_400_, v___x_401_);
return v___x_402_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn___boxed(lean_object* v_n_403_, lean_object* v_s_404_){
_start:
{
size_t v_n_boxed_405_; lean_object* v_res_406_; 
v_n_boxed_405_ = lean_unbox_usize(v_n_403_);
lean_dec(v_n_403_);
v_res_406_ = l_LoopStudy_tailPairReturn(v_n_boxed_405_, v_s_404_);
lean_dec_ref(v_s_404_);
return v_res_406_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(size_t v_n_407_, lean_object* v_a_408_){
_start:
{
size_t v_i_409_; uint64_t v_x_410_; uint8_t v___x_411_; 
v_i_409_ = lean_ctor_get_usize(v_a_408_, 0);
v_x_410_ = lean_ctor_get_uint64(v_a_408_, sizeof(void*)*1);
v___x_411_ = lean_usize_dec_lt(v_i_409_, v_n_407_);
if (v___x_411_ == 0)
{
return v_a_408_;
}
else
{
lean_object* v___x_413_; uint8_t v_isShared_414_; uint8_t v_isSharedCheck_435_; 
v_isSharedCheck_435_ = !lean_is_exclusive(v_a_408_);
if (v_isSharedCheck_435_ == 0)
{
v___x_413_ = v_a_408_;
v_isShared_414_ = v_isSharedCheck_435_;
goto v_resetjp_412_;
}
else
{
lean_dec(v_a_408_);
v___x_413_ = lean_box(0);
v_isShared_414_ = v_isSharedCheck_435_;
goto v_resetjp_412_;
}
v_resetjp_412_:
{
size_t v___x_415_; size_t v___x_416_; uint64_t v___x_417_; uint64_t v___x_418_; uint64_t v___x_419_; uint64_t v___x_420_; uint64_t v___x_421_; uint64_t v_x_422_; uint64_t v___x_423_; uint64_t v___x_424_; uint64_t v_x_425_; uint64_t v___x_426_; uint64_t v_x_427_; uint64_t v___x_428_; uint64_t v___x_429_; uint64_t v___x_430_; lean_object* v___x_432_; 
v___x_415_ = ((size_t)1ULL);
v___x_416_ = lean_usize_add(v_i_409_, v___x_415_);
v___x_417_ = lean_usize_to_uint64(v_i_409_);
v___x_418_ = 11400714819323198485ULL;
v___x_419_ = lean_uint64_add(v___x_417_, v___x_418_);
v___x_420_ = lean_uint64_xor(v_x_410_, v___x_419_);
v___x_421_ = 13787848793156543929ULL;
v_x_422_ = lean_uint64_mul(v___x_420_, v___x_421_);
v___x_423_ = 29ULL;
v___x_424_ = lean_uint64_shift_right(v_x_422_, v___x_423_);
v_x_425_ = lean_uint64_xor(v_x_422_, v___x_424_);
v___x_426_ = 10723151780598845931ULL;
v_x_427_ = lean_uint64_mul(v_x_425_, v___x_426_);
v___x_428_ = 31ULL;
v___x_429_ = lean_uint64_shift_right(v_x_427_, v___x_428_);
v___x_430_ = lean_uint64_xor(v_x_427_, v___x_429_);
if (v_isShared_414_ == 0)
{
v___x_432_ = v___x_413_;
goto v_reusejp_431_;
}
else
{
lean_object* v_reuseFailAlloc_434_; 
v_reuseFailAlloc_434_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_432_ = v_reuseFailAlloc_434_;
goto v_reusejp_431_;
}
v_reusejp_431_:
{
lean_ctor_set_usize(v___x_432_, 0, v___x_416_);
lean_ctor_set_uint64(v___x_432_, sizeof(void*)*1, v___x_430_);
v_a_408_ = v___x_432_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed(lean_object* v_n_436_, lean_object* v_a_437_){
_start:
{
size_t v_n_boxed_438_; lean_object* v_res_439_; 
v_n_boxed_438_ = lean_unbox_usize(v_n_436_);
lean_dec(v_n_436_);
v_res_439_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(v_n_boxed_438_, v_a_437_);
return v_res_439_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_whileStruct(size_t v_n_440_, uint64_t v_seed_441_){
_start:
{
size_t v___x_442_; lean_object* v_s_443_; lean_object* v___x_444_; uint64_t v_x_445_; 
v___x_442_ = ((size_t)0ULL);
v_s_443_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
lean_ctor_set_usize(v_s_443_, 0, v___x_442_);
lean_ctor_set_uint64(v_s_443_, sizeof(void*)*1, v_seed_441_);
v___x_444_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(v_n_440_, v_s_443_);
v_x_445_ = lean_ctor_get_uint64(v___x_444_, sizeof(void*)*1);
lean_dec_ref(v___x_444_);
return v_x_445_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_whileStruct___boxed(lean_object* v_n_446_, lean_object* v_seed_447_){
_start:
{
size_t v_n_boxed_448_; uint64_t v_seed_boxed_449_; uint64_t v_res_450_; lean_object* v_r_451_; 
v_n_boxed_448_ = lean_unbox_usize(v_n_446_);
lean_dec(v_n_446_);
v_seed_boxed_449_ = lean_unbox_uint64(v_seed_447_);
lean_dec_ref(v_seed_447_);
v_res_450_ = l_LoopStudy_whileStruct(v_n_boxed_448_, v_seed_boxed_449_);
v_r_451_ = lean_box_uint64(v_res_450_);
return v_r_451_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0(size_t v_n_452_, lean_object* v_inst_453_, lean_object* v_a_454_){
_start:
{
lean_object* v___x_455_; 
v___x_455_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(v_n_452_, v_a_454_);
return v___x_455_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed(lean_object* v_n_456_, lean_object* v_inst_457_, lean_object* v_a_458_){
_start:
{
size_t v_n_boxed_459_; lean_object* v_res_460_; 
v_n_boxed_459_ = lean_unbox_usize(v_n_456_);
lean_dec(v_n_456_);
v_res_460_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0(v_n_boxed_459_, v_inst_457_, v_a_458_);
return v_res_460_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailStruct(size_t v_n_461_, lean_object* v_s_462_){
_start:
{
size_t v_i_463_; uint64_t v_x_464_; lean_object* v___x_466_; uint8_t v_isShared_467_; uint8_t v_isSharedCheck_489_; 
v_i_463_ = lean_ctor_get_usize(v_s_462_, 0);
v_x_464_ = lean_ctor_get_uint64(v_s_462_, sizeof(void*)*1);
v_isSharedCheck_489_ = !lean_is_exclusive(v_s_462_);
if (v_isSharedCheck_489_ == 0)
{
v___x_466_ = v_s_462_;
v_isShared_467_ = v_isSharedCheck_489_;
goto v_resetjp_465_;
}
else
{
lean_dec(v_s_462_);
v___x_466_ = lean_box(0);
v_isShared_467_ = v_isSharedCheck_489_;
goto v_resetjp_465_;
}
v_resetjp_465_:
{
uint8_t v___x_468_; 
v___x_468_ = lean_usize_dec_lt(v_i_463_, v_n_461_);
if (v___x_468_ == 0)
{
lean_del_object(v___x_466_);
return v_x_464_;
}
else
{
size_t v___x_469_; size_t v___x_470_; uint64_t v___x_471_; uint64_t v___x_472_; uint64_t v___x_473_; uint64_t v___x_474_; uint64_t v___x_475_; uint64_t v_x_476_; uint64_t v___x_477_; uint64_t v___x_478_; uint64_t v_x_479_; uint64_t v___x_480_; uint64_t v_x_481_; uint64_t v___x_482_; uint64_t v___x_483_; uint64_t v___x_484_; lean_object* v___x_486_; 
v___x_469_ = ((size_t)1ULL);
v___x_470_ = lean_usize_add(v_i_463_, v___x_469_);
v___x_471_ = lean_usize_to_uint64(v_i_463_);
v___x_472_ = 11400714819323198485ULL;
v___x_473_ = lean_uint64_add(v___x_471_, v___x_472_);
v___x_474_ = lean_uint64_xor(v_x_464_, v___x_473_);
v___x_475_ = 13787848793156543929ULL;
v_x_476_ = lean_uint64_mul(v___x_474_, v___x_475_);
v___x_477_ = 29ULL;
v___x_478_ = lean_uint64_shift_right(v_x_476_, v___x_477_);
v_x_479_ = lean_uint64_xor(v_x_476_, v___x_478_);
v___x_480_ = 10723151780598845931ULL;
v_x_481_ = lean_uint64_mul(v_x_479_, v___x_480_);
v___x_482_ = 31ULL;
v___x_483_ = lean_uint64_shift_right(v_x_481_, v___x_482_);
v___x_484_ = lean_uint64_xor(v_x_481_, v___x_483_);
if (v_isShared_467_ == 0)
{
v___x_486_ = v___x_466_;
goto v_reusejp_485_;
}
else
{
lean_object* v_reuseFailAlloc_488_; 
v_reuseFailAlloc_488_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_486_ = v_reuseFailAlloc_488_;
goto v_reusejp_485_;
}
v_reusejp_485_:
{
lean_ctor_set_usize(v___x_486_, 0, v___x_470_);
lean_ctor_set_uint64(v___x_486_, sizeof(void*)*1, v___x_484_);
v_s_462_ = v___x_486_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailStruct___boxed(lean_object* v_n_490_, lean_object* v_s_491_){
_start:
{
size_t v_n_boxed_492_; uint64_t v_res_493_; lean_object* v_r_494_; 
v_n_boxed_492_ = lean_unbox_usize(v_n_490_);
lean_dec(v_n_490_);
v_res_493_ = l_LoopStudy_tailStruct(v_n_boxed_492_, v_s_491_);
v_r_494_ = lean_box_uint64(v_res_493_);
return v_r_494_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailFuel(lean_object* v_x_495_, size_t v_x_496_, uint64_t v_x_497_){
_start:
{
lean_object* v_zero_498_; uint8_t v_isZero_499_; 
v_zero_498_ = lean_unsigned_to_nat(0u);
v_isZero_499_ = lean_nat_dec_eq(v_x_495_, v_zero_498_);
if (v_isZero_499_ == 1)
{
lean_dec(v_x_495_);
return v_x_497_;
}
else
{
lean_object* v_one_500_; lean_object* v_n_501_; size_t v___x_502_; size_t v___x_503_; uint64_t v___x_504_; uint64_t v___x_505_; uint64_t v___x_506_; uint64_t v___x_507_; uint64_t v___x_508_; uint64_t v_x_509_; uint64_t v___x_510_; uint64_t v___x_511_; uint64_t v_x_512_; uint64_t v___x_513_; uint64_t v_x_514_; uint64_t v___x_515_; uint64_t v___x_516_; uint64_t v___x_517_; 
v_one_500_ = lean_unsigned_to_nat(1u);
v_n_501_ = lean_nat_sub(v_x_495_, v_one_500_);
lean_dec(v_x_495_);
v___x_502_ = ((size_t)1ULL);
v___x_503_ = lean_usize_add(v_x_496_, v___x_502_);
v___x_504_ = lean_usize_to_uint64(v_x_496_);
v___x_505_ = 11400714819323198485ULL;
v___x_506_ = lean_uint64_add(v___x_504_, v___x_505_);
v___x_507_ = lean_uint64_xor(v_x_497_, v___x_506_);
v___x_508_ = 13787848793156543929ULL;
v_x_509_ = lean_uint64_mul(v___x_507_, v___x_508_);
v___x_510_ = 29ULL;
v___x_511_ = lean_uint64_shift_right(v_x_509_, v___x_510_);
v_x_512_ = lean_uint64_xor(v_x_509_, v___x_511_);
v___x_513_ = 10723151780598845931ULL;
v_x_514_ = lean_uint64_mul(v_x_512_, v___x_513_);
v___x_515_ = 31ULL;
v___x_516_ = lean_uint64_shift_right(v_x_514_, v___x_515_);
v___x_517_ = lean_uint64_xor(v_x_514_, v___x_516_);
v_x_495_ = v_n_501_;
v_x_496_ = v___x_503_;
v_x_497_ = v___x_517_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailFuel___boxed(lean_object* v_x_519_, lean_object* v_x_520_, lean_object* v_x_521_){
_start:
{
size_t v_x_60__boxed_522_; uint64_t v_x_61__boxed_523_; uint64_t v_res_524_; lean_object* v_r_525_; 
v_x_60__boxed_522_ = lean_unbox_usize(v_x_520_);
lean_dec(v_x_520_);
v_x_61__boxed_523_ = lean_unbox_uint64(v_x_521_);
lean_dec_ref(v_x_521_);
v_res_524_ = l_LoopStudy_tailFuel(v_x_519_, v_x_60__boxed_522_, v_x_61__boxed_523_);
v_r_525_ = lean_box_uint64(v_res_524_);
return v_r_525_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_runVariant(lean_object* v_name_539_, size_t v_n_540_, uint64_t v_seed_541_){
_start:
{
lean_object* v___x_543_; uint8_t v___x_544_; 
v___x_543_ = ((lean_object*)(l_LoopStudy_runVariant___closed__0));
v___x_544_ = lean_string_dec_eq(v_name_539_, v___x_543_);
if (v___x_544_ == 0)
{
lean_object* v___x_545_; uint8_t v___x_546_; 
v___x_545_ = ((lean_object*)(l_LoopStudy_runVariant___closed__1));
v___x_546_ = lean_string_dec_eq(v_name_539_, v___x_545_);
if (v___x_546_ == 0)
{
lean_object* v___x_547_; uint8_t v___x_548_; 
v___x_547_ = ((lean_object*)(l_LoopStudy_runVariant___closed__2));
v___x_548_ = lean_string_dec_eq(v_name_539_, v___x_547_);
if (v___x_548_ == 0)
{
lean_object* v___x_549_; uint8_t v___x_550_; 
v___x_549_ = ((lean_object*)(l_LoopStudy_runVariant___closed__3));
v___x_550_ = lean_string_dec_eq(v_name_539_, v___x_549_);
if (v___x_550_ == 0)
{
lean_object* v___x_551_; uint8_t v___x_552_; 
v___x_551_ = ((lean_object*)(l_LoopStudy_runVariant___closed__4));
v___x_552_ = lean_string_dec_eq(v_name_539_, v___x_551_);
if (v___x_552_ == 0)
{
lean_object* v___x_553_; uint8_t v___x_554_; 
v___x_553_ = ((lean_object*)(l_LoopStudy_runVariant___closed__5));
v___x_554_ = lean_string_dec_eq(v_name_539_, v___x_553_);
if (v___x_554_ == 0)
{
lean_object* v___x_555_; uint8_t v___x_556_; 
v___x_555_ = ((lean_object*)(l_LoopStudy_runVariant___closed__6));
v___x_556_ = lean_string_dec_eq(v_name_539_, v___x_555_);
if (v___x_556_ == 0)
{
lean_object* v___x_557_; uint8_t v___x_558_; 
v___x_557_ = ((lean_object*)(l_LoopStudy_runVariant___closed__7));
v___x_558_ = lean_string_dec_eq(v_name_539_, v___x_557_);
if (v___x_558_ == 0)
{
lean_object* v___x_559_; uint8_t v___x_560_; 
v___x_559_ = ((lean_object*)(l_LoopStudy_runVariant___closed__8));
v___x_560_ = lean_string_dec_eq(v_name_539_, v___x_559_);
if (v___x_560_ == 0)
{
lean_object* v___x_561_; uint8_t v___x_562_; 
v___x_561_ = ((lean_object*)(l_LoopStudy_runVariant___closed__9));
v___x_562_ = lean_string_dec_eq(v_name_539_, v___x_561_);
if (v___x_562_ == 0)
{
lean_object* v___x_563_; lean_object* v___x_564_; lean_object* v___x_565_; lean_object* v___x_566_; 
v___x_563_ = ((lean_object*)(l_LoopStudy_runVariant___closed__10));
v___x_564_ = lean_string_append(v___x_563_, v_name_539_);
v___x_565_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v___x_565_, 0, v___x_564_);
v___x_566_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_566_, 0, v___x_565_);
return v___x_566_;
}
else
{
lean_object* v___x_567_; size_t v___x_568_; uint64_t v___x_569_; lean_object* v___x_570_; lean_object* v___x_571_; 
v___x_567_ = lean_usize_to_nat(v_n_540_);
v___x_568_ = ((size_t)0ULL);
v___x_569_ = l_LoopStudy_tailFuel(v___x_567_, v___x_568_, v_seed_541_);
v___x_570_ = lean_box_uint64(v___x_569_);
v___x_571_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_571_, 0, v___x_570_);
return v___x_571_;
}
}
else
{
size_t v___x_572_; lean_object* v___x_573_; uint64_t v___x_574_; lean_object* v___x_575_; lean_object* v___x_576_; 
v___x_572_ = ((size_t)0ULL);
v___x_573_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
lean_ctor_set_usize(v___x_573_, 0, v___x_572_);
lean_ctor_set_uint64(v___x_573_, sizeof(void*)*1, v_seed_541_);
v___x_574_ = l_LoopStudy_tailStruct(v_n_540_, v___x_573_);
v___x_575_ = lean_box_uint64(v___x_574_);
v___x_576_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_576_, 0, v___x_575_);
return v___x_576_;
}
}
else
{
uint64_t v___x_577_; lean_object* v___x_578_; lean_object* v___x_579_; 
v___x_577_ = l_LoopStudy_whileStruct(v_n_540_, v_seed_541_);
v___x_578_ = lean_box_uint64(v___x_577_);
v___x_579_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_579_, 0, v___x_578_);
return v___x_579_;
}
}
else
{
lean_object* v___x_580_; lean_object* v___x_581_; lean_object* v___x_582_; lean_object* v___x_583_; lean_object* v_snd_584_; lean_object* v___x_585_; 
v___x_580_ = ((lean_object*)(l_LoopStudy_runVariant___boxed__const__1));
v___x_581_ = lean_box_uint64(v_seed_541_);
v___x_582_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_582_, 0, v___x_580_);
lean_ctor_set(v___x_582_, 1, v___x_581_);
v___x_583_ = l_LoopStudy_tailPairReturn(v_n_540_, v___x_582_);
lean_dec_ref_known(v___x_582_, 2);
v_snd_584_ = lean_ctor_get(v___x_583_, 1);
lean_inc(v_snd_584_);
lean_dec_ref(v___x_583_);
v___x_585_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_585_, 0, v_snd_584_);
return v___x_585_;
}
}
else
{
lean_object* v___x_586_; lean_object* v___x_587_; lean_object* v___x_588_; uint64_t v___x_589_; lean_object* v___x_590_; lean_object* v___x_591_; 
v___x_586_ = ((lean_object*)(l_LoopStudy_runVariant___boxed__const__1));
v___x_587_ = lean_box_uint64(v_seed_541_);
v___x_588_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_588_, 0, v___x_586_);
lean_ctor_set(v___x_588_, 1, v___x_587_);
v___x_589_ = l_LoopStudy_tailPair(v_n_540_, v___x_588_);
lean_dec_ref_known(v___x_588_, 2);
v___x_590_ = lean_box_uint64(v___x_589_);
v___x_591_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_591_, 0, v___x_590_);
return v___x_591_;
}
}
else
{
size_t v___x_592_; uint64_t v___x_593_; lean_object* v___x_594_; lean_object* v___x_595_; 
v___x_592_ = ((size_t)0ULL);
v___x_593_ = l_LoopStudy_tailScalar(v_n_540_, v___x_592_, v_seed_541_);
v___x_594_ = lean_box_uint64(v___x_593_);
v___x_595_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_595_, 0, v___x_594_);
return v___x_595_;
}
}
else
{
uint64_t v___x_596_; lean_object* v___x_597_; lean_object* v___x_598_; 
v___x_596_ = l_LoopStudy_forUSize(v_n_540_, v_seed_541_);
v___x_597_ = lean_box_uint64(v___x_596_);
v___x_598_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_598_, 0, v___x_597_);
return v___x_598_;
}
}
else
{
uint64_t v___x_599_; lean_object* v___x_600_; lean_object* v___x_601_; 
v___x_599_ = l_LoopStudy_forNat(v_n_540_, v_seed_541_);
v___x_600_ = lean_box_uint64(v___x_599_);
v___x_601_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_601_, 0, v___x_600_);
return v___x_601_;
}
}
else
{
lean_object* v___x_602_; 
v___x_602_ = l_LoopStudy_ioWhile(v_n_540_, v_seed_541_);
return v___x_602_;
}
}
else
{
uint64_t v___x_603_; lean_object* v___x_604_; lean_object* v___x_605_; 
v___x_603_ = l_LoopStudy_idWhile(v_n_540_, v_seed_541_);
v___x_604_ = lean_box_uint64(v___x_603_);
v___x_605_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_605_, 0, v___x_604_);
return v___x_605_;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_runVariant___boxed(lean_object* v_name_606_, lean_object* v_n_607_, lean_object* v_seed_608_, lean_object* v_a_609_){
_start:
{
size_t v_n_boxed_610_; uint64_t v_seed_boxed_611_; lean_object* v_res_612_; 
v_n_boxed_610_ = lean_unbox_usize(v_n_607_);
lean_dec(v_n_607_);
v_seed_boxed_611_ = lean_unbox_uint64(v_seed_608_);
lean_dec_ref(v_seed_608_);
v_res_612_ = l_LoopStudy_runVariant(v_name_606_, v_n_boxed_610_, v_seed_boxed_611_);
lean_dec_ref(v_name_606_);
return v_res_612_;
}
}
LEAN_EXPORT lean_object* _lean_main(lean_object* v_args_616_){
_start:
{
lean_object* v___x_618_; lean_object* v___x_619_; lean_object* v_variant_620_; lean_object* v___x_621_; lean_object* v___x_622_; lean_object* v___x_623_; lean_object* v___x_624_; lean_object* v___x_625_; lean_object* v___x_626_; size_t v_n_627_; lean_object* v___x_628_; lean_object* v___x_629_; lean_object* v___x_630_; lean_object* v___x_631_; lean_object* v___x_632_; lean_object* v___x_633_; uint64_t v_seed_634_; size_t v___x_635_; size_t v___x_636_; lean_object* v___x_637_; 
v___x_618_ = lean_unsigned_to_nat(0u);
v___x_619_ = ((lean_object*)(l_LoopStudy_runVariant___closed__0));
v_variant_620_ = l_List_getD___redArg(v_args_616_, v___x_618_, v___x_619_);
v___x_621_ = lean_unsigned_to_nat(1u);
v___x_622_ = ((lean_object*)(l_main___closed__0));
v___x_623_ = l_List_getD___redArg(v_args_616_, v___x_621_, v___x_622_);
v___x_624_ = lean_string_utf8_byte_size(v___x_623_);
v___x_625_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_625_, 0, v___x_623_);
lean_ctor_set(v___x_625_, 1, v___x_618_);
lean_ctor_set(v___x_625_, 2, v___x_624_);
v___x_626_ = l_String_Slice_toNat_x21(v___x_625_);
lean_dec_ref_known(v___x_625_, 3);
v_n_627_ = lean_usize_of_nat(v___x_626_);
lean_dec(v___x_626_);
v___x_628_ = lean_unsigned_to_nat(2u);
v___x_629_ = ((lean_object*)(l_main___closed__1));
v___x_630_ = l_List_getD___redArg(v_args_616_, v___x_628_, v___x_629_);
lean_dec(v_args_616_);
v___x_631_ = lean_string_utf8_byte_size(v___x_630_);
v___x_632_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_632_, 0, v___x_630_);
lean_ctor_set(v___x_632_, 1, v___x_618_);
lean_ctor_set(v___x_632_, 2, v___x_631_);
v___x_633_ = l_String_Slice_toNat_x21(v___x_632_);
lean_dec_ref_known(v___x_632_, 3);
v_seed_634_ = lean_uint64_of_nat(v___x_633_);
lean_dec(v___x_633_);
v___x_635_ = ((size_t)1ULL);
v___x_636_ = lean_usize_shift_right(v_n_627_, v___x_635_);
v___x_637_ = l_LoopStudy_runVariant(v_variant_620_, v___x_636_, v_seed_634_);
if (lean_obj_tag(v___x_637_) == 0)
{
lean_object* v_a_638_; lean_object* v___x_639_; lean_object* v___x_640_; 
v_a_638_ = lean_ctor_get(v___x_637_, 0);
lean_inc(v_a_638_);
lean_dec_ref_known(v___x_637_, 1);
v___x_639_ = lean_io_mono_nanos_now();
v___x_640_ = l_LoopStudy_runVariant(v_variant_620_, v_n_627_, v_seed_634_);
lean_dec(v_variant_620_);
if (lean_obj_tag(v___x_640_) == 0)
{
lean_object* v_a_641_; lean_object* v___x_642_; lean_object* v___x_643_; lean_object* v___x_644_; lean_object* v___x_645_; lean_object* v___x_646_; uint64_t v___x_647_; lean_object* v___x_648_; lean_object* v___x_649_; lean_object* v___x_650_; lean_object* v___x_651_; uint64_t v___x_652_; lean_object* v___x_653_; lean_object* v___x_654_; lean_object* v___x_655_; lean_object* v___x_656_; 
v_a_641_ = lean_ctor_get(v___x_640_, 0);
lean_inc(v_a_641_);
lean_dec_ref_known(v___x_640_, 1);
v___x_642_ = lean_io_mono_nanos_now();
v___x_643_ = lean_nat_sub(v___x_642_, v___x_639_);
lean_dec(v___x_639_);
lean_dec(v___x_642_);
v___x_644_ = l_Nat_reprFast(v___x_643_);
v___x_645_ = ((lean_object*)(l_main___closed__2));
v___x_646_ = lean_string_append(v___x_644_, v___x_645_);
v___x_647_ = lean_unbox_uint64(v_a_641_);
lean_dec(v_a_641_);
v___x_648_ = lean_uint64_to_nat(v___x_647_);
v___x_649_ = l_Nat_reprFast(v___x_648_);
v___x_650_ = lean_string_append(v___x_646_, v___x_649_);
lean_dec_ref(v___x_649_);
v___x_651_ = lean_string_append(v___x_650_, v___x_645_);
v___x_652_ = lean_unbox_uint64(v_a_638_);
lean_dec(v_a_638_);
v___x_653_ = lean_uint64_to_nat(v___x_652_);
v___x_654_ = l_Nat_reprFast(v___x_653_);
v___x_655_ = lean_string_append(v___x_651_, v___x_654_);
lean_dec_ref(v___x_654_);
v___x_656_ = l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(v___x_655_);
return v___x_656_;
}
else
{
lean_object* v_a_657_; lean_object* v___x_659_; uint8_t v_isShared_660_; uint8_t v_isSharedCheck_664_; 
lean_dec(v___x_639_);
lean_dec(v_a_638_);
v_a_657_ = lean_ctor_get(v___x_640_, 0);
v_isSharedCheck_664_ = !lean_is_exclusive(v___x_640_);
if (v_isSharedCheck_664_ == 0)
{
v___x_659_ = v___x_640_;
v_isShared_660_ = v_isSharedCheck_664_;
goto v_resetjp_658_;
}
else
{
lean_inc(v_a_657_);
lean_dec(v___x_640_);
v___x_659_ = lean_box(0);
v_isShared_660_ = v_isSharedCheck_664_;
goto v_resetjp_658_;
}
v_resetjp_658_:
{
lean_object* v___x_662_; 
if (v_isShared_660_ == 0)
{
v___x_662_ = v___x_659_;
goto v_reusejp_661_;
}
else
{
lean_object* v_reuseFailAlloc_663_; 
v_reuseFailAlloc_663_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_663_, 0, v_a_657_);
v___x_662_ = v_reuseFailAlloc_663_;
goto v_reusejp_661_;
}
v_reusejp_661_:
{
return v___x_662_;
}
}
}
}
else
{
lean_object* v_a_665_; lean_object* v___x_667_; uint8_t v_isShared_668_; uint8_t v_isSharedCheck_672_; 
lean_dec(v_variant_620_);
v_a_665_ = lean_ctor_get(v___x_637_, 0);
v_isSharedCheck_672_ = !lean_is_exclusive(v___x_637_);
if (v_isSharedCheck_672_ == 0)
{
v___x_667_ = v___x_637_;
v_isShared_668_ = v_isSharedCheck_672_;
goto v_resetjp_666_;
}
else
{
lean_inc(v_a_665_);
lean_dec(v___x_637_);
v___x_667_ = lean_box(0);
v_isShared_668_ = v_isSharedCheck_672_;
goto v_resetjp_666_;
}
v_resetjp_666_:
{
lean_object* v___x_670_; 
if (v_isShared_668_ == 0)
{
v___x_670_ = v___x_667_;
goto v_reusejp_669_;
}
else
{
lean_object* v_reuseFailAlloc_671_; 
v_reuseFailAlloc_671_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_671_, 0, v_a_665_);
v___x_670_ = v_reuseFailAlloc_671_;
goto v_reusejp_669_;
}
v_reusejp_669_:
{
return v___x_670_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_main___boxed(lean_object* v_args_673_, lean_object* v_a_674_){
_start:
{
lean_object* v_res_675_; 
v_res_675_ = _lean_main(v_args_673_);
return v_res_675_;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Std(uint8_t builtin);
lean_object* initialize_SplitProd(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_build_Kernels(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Std(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SplitProd(builtin);
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
  res = initialize_build_Kernels(1 /* builtin */);
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
