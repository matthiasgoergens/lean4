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
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed(lean_object*, lean_object*);
static const lean_ctor_object l_LoopStudy_idWhile___boxed__const__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*0 + sizeof(size_t)*1, .m_other = 0, .m_tag = 0}, .m_objs = {(lean_object*)(size_t)(0ULL)}};
LEAN_EXPORT const lean_object* l_LoopStudy_idWhile___boxed__const__1 = (const lean_object*)&l_LoopStudy_idWhile___boxed__const__1_value;
LEAN_EXPORT uint64_t l_LoopStudy_idWhile(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_idWhile___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0(size_t, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile(size_t, uint64_t);
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile___boxed(lean_object*, lean_object*, lean_object*);
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
LEAN_EXPORT uint64_t l_LoopStudy_tailPair(size_t, lean_object*);
LEAN_EXPORT lean_object* l_LoopStudy_tailPair___boxed(lean_object*, lean_object*);
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
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(size_t v_n_23_, lean_object* v_a_24_){
_start:
{
lean_object* v_fst_25_; lean_object* v_snd_26_; lean_object* v___x_28_; uint8_t v_isShared_29_; uint8_t v_isSharedCheck_60_; 
v_fst_25_ = lean_ctor_get(v_a_24_, 0);
v_snd_26_ = lean_ctor_get(v_a_24_, 1);
v_isSharedCheck_60_ = !lean_is_exclusive(v_a_24_);
if (v_isSharedCheck_60_ == 0)
{
v___x_28_ = v_a_24_;
v_isShared_29_ = v_isSharedCheck_60_;
goto v_resetjp_27_;
}
else
{
lean_inc(v_snd_26_);
lean_inc(v_fst_25_);
lean_dec(v_a_24_);
v___x_28_ = lean_box(0);
v_isShared_29_ = v_isSharedCheck_60_;
goto v_resetjp_27_;
}
v_resetjp_27_:
{
size_t v___x_30_; uint8_t v___x_31_; 
v___x_30_ = lean_unbox_usize(v_fst_25_);
v___x_31_ = lean_usize_dec_lt(v___x_30_, v_n_23_);
if (v___x_31_ == 0)
{
lean_object* v___x_33_; 
if (v_isShared_29_ == 0)
{
v___x_33_ = v___x_28_;
goto v_reusejp_32_;
}
else
{
lean_object* v_reuseFailAlloc_34_; 
v_reuseFailAlloc_34_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_34_, 0, v_fst_25_);
lean_ctor_set(v_reuseFailAlloc_34_, 1, v_snd_26_);
v___x_33_ = v_reuseFailAlloc_34_;
goto v_reusejp_32_;
}
v_reusejp_32_:
{
return v___x_33_;
}
}
else
{
size_t v___x_35_; uint64_t v___x_36_; uint64_t v___x_37_; uint64_t v___x_38_; uint64_t v___x_39_; uint64_t v___x_40_; uint64_t v___x_41_; uint64_t v_x_42_; uint64_t v___x_43_; uint64_t v___x_44_; uint64_t v_x_45_; uint64_t v___x_46_; uint64_t v_x_47_; uint64_t v___x_48_; uint64_t v___x_49_; uint64_t v___x_50_; size_t v___x_51_; size_t v___x_52_; size_t v___x_53_; lean_object* v___x_54_; lean_object* v___x_55_; lean_object* v___x_57_; 
v___x_35_ = lean_unbox_usize(v_fst_25_);
v___x_36_ = lean_usize_to_uint64(v___x_35_);
v___x_37_ = 11400714819323198485ULL;
v___x_38_ = lean_uint64_add(v___x_36_, v___x_37_);
v___x_39_ = lean_unbox_uint64(v_snd_26_);
lean_dec(v_snd_26_);
v___x_40_ = lean_uint64_xor(v___x_39_, v___x_38_);
v___x_41_ = 13787848793156543929ULL;
v_x_42_ = lean_uint64_mul(v___x_40_, v___x_41_);
v___x_43_ = 29ULL;
v___x_44_ = lean_uint64_shift_right(v_x_42_, v___x_43_);
v_x_45_ = lean_uint64_xor(v_x_42_, v___x_44_);
v___x_46_ = 10723151780598845931ULL;
v_x_47_ = lean_uint64_mul(v_x_45_, v___x_46_);
v___x_48_ = 31ULL;
v___x_49_ = lean_uint64_shift_right(v_x_47_, v___x_48_);
v___x_50_ = lean_uint64_xor(v_x_47_, v___x_49_);
v___x_51_ = ((size_t)1ULL);
v___x_52_ = lean_unbox_usize(v_fst_25_);
lean_dec(v_fst_25_);
v___x_53_ = lean_usize_add(v___x_52_, v___x_51_);
v___x_54_ = lean_box_usize(v___x_53_);
v___x_55_ = lean_box_uint64(v___x_50_);
if (v_isShared_29_ == 0)
{
lean_ctor_set(v___x_28_, 1, v___x_55_);
lean_ctor_set(v___x_28_, 0, v___x_54_);
v___x_57_ = v___x_28_;
goto v_reusejp_56_;
}
else
{
lean_object* v_reuseFailAlloc_59_; 
v_reuseFailAlloc_59_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_59_, 0, v___x_54_);
lean_ctor_set(v_reuseFailAlloc_59_, 1, v___x_55_);
v___x_57_ = v_reuseFailAlloc_59_;
goto v_reusejp_56_;
}
v_reusejp_56_:
{
v_a_24_ = v___x_57_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed(lean_object* v_n_61_, lean_object* v_a_62_){
_start:
{
size_t v_n_boxed_63_; lean_object* v_res_64_; 
v_n_boxed_63_ = lean_unbox_usize(v_n_61_);
lean_dec(v_n_61_);
v_res_64_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(v_n_boxed_63_, v_a_62_);
return v_res_64_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_idWhile(size_t v_n_67_, uint64_t v_seed_68_){
_start:
{
lean_object* v___x_69_; lean_object* v___x_70_; lean_object* v___x_71_; lean_object* v___x_72_; lean_object* v_snd_73_; uint64_t v___x_74_; 
v___x_69_ = ((lean_object*)(l_LoopStudy_idWhile___boxed__const__1));
v___x_70_ = lean_box_uint64(v_seed_68_);
v___x_71_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_71_, 0, v___x_69_);
lean_ctor_set(v___x_71_, 1, v___x_70_);
v___x_72_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(v_n_67_, v___x_71_);
v_snd_73_ = lean_ctor_get(v___x_72_, 1);
lean_inc(v_snd_73_);
lean_dec_ref(v___x_72_);
v___x_74_ = lean_unbox_uint64(v_snd_73_);
lean_dec(v_snd_73_);
return v___x_74_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_idWhile___boxed(lean_object* v_n_75_, lean_object* v_seed_76_){
_start:
{
size_t v_n_boxed_77_; uint64_t v_seed_boxed_78_; uint64_t v_res_79_; lean_object* v_r_80_; 
v_n_boxed_77_ = lean_unbox_usize(v_n_75_);
lean_dec(v_n_75_);
v_seed_boxed_78_ = lean_unbox_uint64(v_seed_76_);
lean_dec_ref(v_seed_76_);
v_res_79_ = l_LoopStudy_idWhile(v_n_boxed_77_, v_seed_boxed_78_);
v_r_80_ = lean_box_uint64(v_res_79_);
return v_r_80_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0(size_t v_n_81_, lean_object* v_inst_82_, lean_object* v_a_83_){
_start:
{
lean_object* v___x_84_; 
v___x_84_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg(v_n_81_, v_a_83_);
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
return v_res_89_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(size_t v_n_90_, lean_object* v_a_91_){
_start:
{
lean_object* v_fst_93_; lean_object* v_snd_94_; lean_object* v___x_96_; uint8_t v_isShared_97_; uint8_t v_isSharedCheck_129_; 
v_fst_93_ = lean_ctor_get(v_a_91_, 0);
v_snd_94_ = lean_ctor_get(v_a_91_, 1);
v_isSharedCheck_129_ = !lean_is_exclusive(v_a_91_);
if (v_isSharedCheck_129_ == 0)
{
v___x_96_ = v_a_91_;
v_isShared_97_ = v_isSharedCheck_129_;
goto v_resetjp_95_;
}
else
{
lean_inc(v_snd_94_);
lean_inc(v_fst_93_);
lean_dec(v_a_91_);
v___x_96_ = lean_box(0);
v_isShared_97_ = v_isSharedCheck_129_;
goto v_resetjp_95_;
}
v_resetjp_95_:
{
size_t v___x_98_; uint8_t v___x_99_; 
v___x_98_ = lean_unbox_usize(v_fst_93_);
v___x_99_ = lean_usize_dec_lt(v___x_98_, v_n_90_);
if (v___x_99_ == 0)
{
lean_object* v___x_101_; 
if (v_isShared_97_ == 0)
{
v___x_101_ = v___x_96_;
goto v_reusejp_100_;
}
else
{
lean_object* v_reuseFailAlloc_103_; 
v_reuseFailAlloc_103_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_103_, 0, v_fst_93_);
lean_ctor_set(v_reuseFailAlloc_103_, 1, v_snd_94_);
v___x_101_ = v_reuseFailAlloc_103_;
goto v_reusejp_100_;
}
v_reusejp_100_:
{
lean_object* v___x_102_; 
v___x_102_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_102_, 0, v___x_101_);
return v___x_102_;
}
}
else
{
size_t v___x_104_; uint64_t v___x_105_; uint64_t v___x_106_; uint64_t v___x_107_; uint64_t v___x_108_; uint64_t v___x_109_; uint64_t v___x_110_; uint64_t v_x_111_; uint64_t v___x_112_; uint64_t v___x_113_; uint64_t v_x_114_; uint64_t v___x_115_; uint64_t v_x_116_; uint64_t v___x_117_; uint64_t v___x_118_; uint64_t v___x_119_; size_t v___x_120_; size_t v___x_121_; size_t v___x_122_; lean_object* v___x_123_; lean_object* v___x_124_; lean_object* v___x_126_; 
v___x_104_ = lean_unbox_usize(v_fst_93_);
v___x_105_ = lean_usize_to_uint64(v___x_104_);
v___x_106_ = 11400714819323198485ULL;
v___x_107_ = lean_uint64_add(v___x_105_, v___x_106_);
v___x_108_ = lean_unbox_uint64(v_snd_94_);
lean_dec(v_snd_94_);
v___x_109_ = lean_uint64_xor(v___x_108_, v___x_107_);
v___x_110_ = 13787848793156543929ULL;
v_x_111_ = lean_uint64_mul(v___x_109_, v___x_110_);
v___x_112_ = 29ULL;
v___x_113_ = lean_uint64_shift_right(v_x_111_, v___x_112_);
v_x_114_ = lean_uint64_xor(v_x_111_, v___x_113_);
v___x_115_ = 10723151780598845931ULL;
v_x_116_ = lean_uint64_mul(v_x_114_, v___x_115_);
v___x_117_ = 31ULL;
v___x_118_ = lean_uint64_shift_right(v_x_116_, v___x_117_);
v___x_119_ = lean_uint64_xor(v_x_116_, v___x_118_);
v___x_120_ = ((size_t)1ULL);
v___x_121_ = lean_unbox_usize(v_fst_93_);
lean_dec(v_fst_93_);
v___x_122_ = lean_usize_add(v___x_121_, v___x_120_);
v___x_123_ = lean_box_usize(v___x_122_);
v___x_124_ = lean_box_uint64(v___x_119_);
if (v_isShared_97_ == 0)
{
lean_ctor_set(v___x_96_, 1, v___x_124_);
lean_ctor_set(v___x_96_, 0, v___x_123_);
v___x_126_ = v___x_96_;
goto v_reusejp_125_;
}
else
{
lean_object* v_reuseFailAlloc_128_; 
v_reuseFailAlloc_128_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_128_, 0, v___x_123_);
lean_ctor_set(v_reuseFailAlloc_128_, 1, v___x_124_);
v___x_126_ = v_reuseFailAlloc_128_;
goto v_reusejp_125_;
}
v_reusejp_125_:
{
v_a_91_ = v___x_126_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed(lean_object* v_n_130_, lean_object* v_a_131_, lean_object* v___y_132_){
_start:
{
size_t v_n_boxed_133_; lean_object* v_res_134_; 
v_n_boxed_133_ = lean_unbox_usize(v_n_130_);
lean_dec(v_n_130_);
v_res_134_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(v_n_boxed_133_, v_a_131_);
return v_res_134_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile(size_t v_n_135_, uint64_t v_seed_136_){
_start:
{
lean_object* v___x_138_; lean_object* v___x_139_; lean_object* v___x_140_; lean_object* v___x_141_; 
v___x_138_ = ((lean_object*)(l_LoopStudy_idWhile___boxed__const__1));
v___x_139_ = lean_box_uint64(v_seed_136_);
v___x_140_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_140_, 0, v___x_138_);
lean_ctor_set(v___x_140_, 1, v___x_139_);
v___x_141_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(v_n_135_, v___x_140_);
if (lean_obj_tag(v___x_141_) == 0)
{
lean_object* v_a_142_; lean_object* v___x_144_; uint8_t v_isShared_145_; uint8_t v_isSharedCheck_150_; 
v_a_142_ = lean_ctor_get(v___x_141_, 0);
v_isSharedCheck_150_ = !lean_is_exclusive(v___x_141_);
if (v_isSharedCheck_150_ == 0)
{
v___x_144_ = v___x_141_;
v_isShared_145_ = v_isSharedCheck_150_;
goto v_resetjp_143_;
}
else
{
lean_inc(v_a_142_);
lean_dec(v___x_141_);
v___x_144_ = lean_box(0);
v_isShared_145_ = v_isSharedCheck_150_;
goto v_resetjp_143_;
}
v_resetjp_143_:
{
lean_object* v_snd_146_; lean_object* v___x_148_; 
v_snd_146_ = lean_ctor_get(v_a_142_, 1);
lean_inc(v_snd_146_);
lean_dec(v_a_142_);
if (v_isShared_145_ == 0)
{
lean_ctor_set(v___x_144_, 0, v_snd_146_);
v___x_148_ = v___x_144_;
goto v_reusejp_147_;
}
else
{
lean_object* v_reuseFailAlloc_149_; 
v_reuseFailAlloc_149_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_149_, 0, v_snd_146_);
v___x_148_ = v_reuseFailAlloc_149_;
goto v_reusejp_147_;
}
v_reusejp_147_:
{
return v___x_148_;
}
}
}
else
{
lean_object* v_a_151_; lean_object* v___x_153_; uint8_t v_isShared_154_; uint8_t v_isSharedCheck_158_; 
v_a_151_ = lean_ctor_get(v___x_141_, 0);
v_isSharedCheck_158_ = !lean_is_exclusive(v___x_141_);
if (v_isSharedCheck_158_ == 0)
{
v___x_153_ = v___x_141_;
v_isShared_154_ = v_isSharedCheck_158_;
goto v_resetjp_152_;
}
else
{
lean_inc(v_a_151_);
lean_dec(v___x_141_);
v___x_153_ = lean_box(0);
v_isShared_154_ = v_isSharedCheck_158_;
goto v_resetjp_152_;
}
v_resetjp_152_:
{
lean_object* v___x_156_; 
if (v_isShared_154_ == 0)
{
v___x_156_ = v___x_153_;
goto v_reusejp_155_;
}
else
{
lean_object* v_reuseFailAlloc_157_; 
v_reuseFailAlloc_157_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_157_, 0, v_a_151_);
v___x_156_ = v_reuseFailAlloc_157_;
goto v_reusejp_155_;
}
v_reusejp_155_:
{
return v___x_156_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_ioWhile___boxed(lean_object* v_n_159_, lean_object* v_seed_160_, lean_object* v_a_161_){
_start:
{
size_t v_n_boxed_162_; uint64_t v_seed_boxed_163_; lean_object* v_res_164_; 
v_n_boxed_162_ = lean_unbox_usize(v_n_159_);
lean_dec(v_n_159_);
v_seed_boxed_163_ = lean_unbox_uint64(v_seed_160_);
lean_dec_ref(v_seed_160_);
v_res_164_ = l_LoopStudy_ioWhile(v_n_boxed_162_, v_seed_boxed_163_);
return v_res_164_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0(size_t v_n_165_, lean_object* v_inst_166_, lean_object* v_a_167_){
_start:
{
lean_object* v___x_169_; 
v___x_169_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg(v_n_165_, v_a_167_);
return v___x_169_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed(lean_object* v_n_170_, lean_object* v_inst_171_, lean_object* v_a_172_, lean_object* v___y_173_){
_start:
{
size_t v_n_boxed_174_; lean_object* v_res_175_; 
v_n_boxed_174_ = lean_unbox_usize(v_n_170_);
lean_dec(v_n_170_);
v_res_175_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0(v_n_boxed_174_, v_inst_171_, v_a_172_);
return v_res_175_;
}
}
LEAN_EXPORT uint64_t l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(lean_object* v_range_176_, uint64_t v_b_177_, lean_object* v_i_178_){
_start:
{
lean_object* v_stop_179_; lean_object* v_step_180_; uint8_t v___x_181_; 
v_stop_179_ = lean_ctor_get(v_range_176_, 1);
v_step_180_ = lean_ctor_get(v_range_176_, 2);
v___x_181_ = lean_nat_dec_lt(v_i_178_, v_stop_179_);
if (v___x_181_ == 0)
{
lean_dec(v_i_178_);
return v_b_177_;
}
else
{
size_t v___x_182_; uint64_t v___x_183_; uint64_t v___x_184_; uint64_t v___x_185_; uint64_t v___x_186_; uint64_t v___x_187_; uint64_t v_x_188_; uint64_t v___x_189_; uint64_t v___x_190_; uint64_t v_x_191_; uint64_t v___x_192_; uint64_t v_x_193_; uint64_t v___x_194_; uint64_t v___x_195_; uint64_t v___x_196_; lean_object* v___x_197_; 
v___x_182_ = lean_usize_of_nat(v_i_178_);
v___x_183_ = lean_usize_to_uint64(v___x_182_);
v___x_184_ = 11400714819323198485ULL;
v___x_185_ = lean_uint64_add(v___x_183_, v___x_184_);
v___x_186_ = lean_uint64_xor(v_b_177_, v___x_185_);
v___x_187_ = 13787848793156543929ULL;
v_x_188_ = lean_uint64_mul(v___x_186_, v___x_187_);
v___x_189_ = 29ULL;
v___x_190_ = lean_uint64_shift_right(v_x_188_, v___x_189_);
v_x_191_ = lean_uint64_xor(v_x_188_, v___x_190_);
v___x_192_ = 10723151780598845931ULL;
v_x_193_ = lean_uint64_mul(v_x_191_, v___x_192_);
v___x_194_ = 31ULL;
v___x_195_ = lean_uint64_shift_right(v_x_193_, v___x_194_);
v___x_196_ = lean_uint64_xor(v_x_193_, v___x_195_);
v___x_197_ = lean_nat_add(v_i_178_, v_step_180_);
lean_dec(v_i_178_);
v_b_177_ = v___x_196_;
v_i_178_ = v___x_197_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed(lean_object* v_range_199_, lean_object* v_b_200_, lean_object* v_i_201_){
_start:
{
uint64_t v_b_boxed_202_; uint64_t v_res_203_; lean_object* v_r_204_; 
v_b_boxed_202_ = lean_unbox_uint64(v_b_200_);
lean_dec_ref(v_b_200_);
v_res_203_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(v_range_199_, v_b_boxed_202_, v_i_201_);
lean_dec_ref(v_range_199_);
v_r_204_ = lean_box_uint64(v_res_203_);
return v_r_204_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_forNat(size_t v_n_205_, uint64_t v_seed_206_){
_start:
{
lean_object* v___x_207_; lean_object* v___x_208_; lean_object* v___x_209_; lean_object* v___x_210_; uint64_t v___x_211_; 
v___x_207_ = lean_unsigned_to_nat(0u);
v___x_208_ = lean_usize_to_nat(v_n_205_);
v___x_209_ = lean_unsigned_to_nat(1u);
v___x_210_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_210_, 0, v___x_207_);
lean_ctor_set(v___x_210_, 1, v___x_208_);
lean_ctor_set(v___x_210_, 2, v___x_209_);
v___x_211_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(v___x_210_, v_seed_206_, v___x_207_);
lean_dec_ref_known(v___x_210_, 3);
return v___x_211_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_forNat___boxed(lean_object* v_n_212_, lean_object* v_seed_213_){
_start:
{
size_t v_n_boxed_214_; uint64_t v_seed_boxed_215_; uint64_t v_res_216_; lean_object* v_r_217_; 
v_n_boxed_214_ = lean_unbox_usize(v_n_212_);
lean_dec(v_n_212_);
v_seed_boxed_215_ = lean_unbox_uint64(v_seed_213_);
lean_dec_ref(v_seed_213_);
v_res_216_ = l_LoopStudy_forNat(v_n_boxed_214_, v_seed_boxed_215_);
v_r_217_ = lean_box_uint64(v_res_216_);
return v_r_217_;
}
}
LEAN_EXPORT uint64_t l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0(lean_object* v_range_218_, uint64_t v_b_219_, lean_object* v_i_220_, lean_object* v_hs_221_, lean_object* v_hl_222_){
_start:
{
uint64_t v___x_223_; 
v___x_223_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg(v_range_218_, v_b_219_, v_i_220_);
return v___x_223_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed(lean_object* v_range_224_, lean_object* v_b_225_, lean_object* v_i_226_, lean_object* v_hs_227_, lean_object* v_hl_228_){
_start:
{
uint64_t v_b_boxed_229_; uint64_t v_res_230_; lean_object* v_r_231_; 
v_b_boxed_229_ = lean_unbox_uint64(v_b_225_);
lean_dec_ref(v_b_225_);
v_res_230_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0(v_range_224_, v_b_boxed_229_, v_i_226_, v_hs_227_, v_hl_228_);
lean_dec_ref(v_range_224_);
v_r_231_ = lean_box_uint64(v_res_230_);
return v_r_231_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(size_t v_upperBound_232_, size_t v_a_233_, uint64_t v_b_234_){
_start:
{
uint8_t v___x_235_; 
v___x_235_ = lean_usize_dec_lt(v_a_233_, v_upperBound_232_);
if (v___x_235_ == 0)
{
return v_b_234_;
}
else
{
uint64_t v___x_236_; uint64_t v___x_237_; uint64_t v___x_238_; uint64_t v___x_239_; uint64_t v___x_240_; uint64_t v_x_241_; uint64_t v___x_242_; uint64_t v___x_243_; uint64_t v_x_244_; uint64_t v___x_245_; uint64_t v_x_246_; uint64_t v___x_247_; uint64_t v___x_248_; uint64_t v___x_249_; size_t v___x_250_; size_t v___x_251_; size_t v___x_252_; uint8_t v___x_253_; 
v___x_236_ = lean_usize_to_uint64(v_a_233_);
v___x_237_ = 11400714819323198485ULL;
v___x_238_ = lean_uint64_add(v___x_236_, v___x_237_);
v___x_239_ = lean_uint64_xor(v_b_234_, v___x_238_);
v___x_240_ = 13787848793156543929ULL;
v_x_241_ = lean_uint64_mul(v___x_239_, v___x_240_);
v___x_242_ = 29ULL;
v___x_243_ = lean_uint64_shift_right(v_x_241_, v___x_242_);
v_x_244_ = lean_uint64_xor(v_x_241_, v___x_243_);
v___x_245_ = 10723151780598845931ULL;
v_x_246_ = lean_uint64_mul(v_x_244_, v___x_245_);
v___x_247_ = 31ULL;
v___x_248_ = lean_uint64_shift_right(v_x_246_, v___x_247_);
v___x_249_ = lean_uint64_xor(v_x_246_, v___x_248_);
v___x_250_ = ((size_t)1ULL);
v___x_251_ = lean_usize_add(v_a_233_, v___x_250_);
v___x_252_ = ((size_t)0ULL);
v___x_253_ = lean_usize_dec_eq(v___x_251_, v___x_252_);
if (v___x_253_ == 0)
{
v_a_233_ = v___x_251_;
v_b_234_ = v___x_249_;
goto _start;
}
else
{
return v___x_249_;
}
}
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed(lean_object* v_upperBound_255_, lean_object* v_a_256_, lean_object* v_b_257_){
_start:
{
size_t v_upperBound_624__boxed_258_; size_t v_a_boxed_259_; uint64_t v_b_boxed_260_; uint64_t v_res_261_; lean_object* v_r_262_; 
v_upperBound_624__boxed_258_ = lean_unbox_usize(v_upperBound_255_);
lean_dec(v_upperBound_255_);
v_a_boxed_259_ = lean_unbox_usize(v_a_256_);
lean_dec(v_a_256_);
v_b_boxed_260_ = lean_unbox_uint64(v_b_257_);
lean_dec_ref(v_b_257_);
v_res_261_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(v_upperBound_624__boxed_258_, v_a_boxed_259_, v_b_boxed_260_);
v_r_262_ = lean_box_uint64(v_res_261_);
return v_r_262_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_forUSize(size_t v_n_263_, uint64_t v_seed_264_){
_start:
{
size_t v___x_265_; uint64_t v___x_266_; 
v___x_265_ = ((size_t)0ULL);
v___x_266_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(v_n_263_, v___x_265_, v_seed_264_);
return v___x_266_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_forUSize___boxed(lean_object* v_n_267_, lean_object* v_seed_268_){
_start:
{
size_t v_n_boxed_269_; uint64_t v_seed_boxed_270_; uint64_t v_res_271_; lean_object* v_r_272_; 
v_n_boxed_269_ = lean_unbox_usize(v_n_267_);
lean_dec(v_n_267_);
v_seed_boxed_270_ = lean_unbox_uint64(v_seed_268_);
lean_dec_ref(v_seed_268_);
v_res_271_ = l_LoopStudy_forUSize(v_n_boxed_269_, v_seed_boxed_270_);
v_r_272_ = lean_box_uint64(v_res_271_);
return v_r_272_;
}
}
LEAN_EXPORT uint64_t l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0(size_t v_upperBound_273_, lean_object* v_inst_274_, lean_object* v_R_275_, size_t v_a_276_, uint64_t v_b_277_, lean_object* v_c_278_){
_start:
{
uint64_t v___x_279_; 
v___x_279_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg(v_upperBound_273_, v_a_276_, v_b_277_);
return v___x_279_;
}
}
LEAN_EXPORT lean_object* l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed(lean_object* v_upperBound_280_, lean_object* v_inst_281_, lean_object* v_R_282_, lean_object* v_a_283_, lean_object* v_b_284_, lean_object* v_c_285_){
_start:
{
size_t v_upperBound_665__boxed_286_; size_t v_a_boxed_287_; uint64_t v_b_boxed_288_; uint64_t v_res_289_; lean_object* v_r_290_; 
v_upperBound_665__boxed_286_ = lean_unbox_usize(v_upperBound_280_);
lean_dec(v_upperBound_280_);
v_a_boxed_287_ = lean_unbox_usize(v_a_283_);
lean_dec(v_a_283_);
v_b_boxed_288_ = lean_unbox_uint64(v_b_284_);
lean_dec_ref(v_b_284_);
v_res_289_ = l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0(v_upperBound_665__boxed_286_, v_inst_281_, v_R_282_, v_a_boxed_287_, v_b_boxed_288_, v_c_285_);
v_r_290_ = lean_box_uint64(v_res_289_);
return v_r_290_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailScalar(size_t v_n_291_, size_t v_i_292_, uint64_t v_x_293_){
_start:
{
uint8_t v___x_294_; 
v___x_294_ = lean_usize_dec_lt(v_i_292_, v_n_291_);
if (v___x_294_ == 0)
{
return v_x_293_;
}
else
{
size_t v___x_295_; size_t v___x_296_; uint64_t v___x_297_; uint64_t v___x_298_; uint64_t v___x_299_; uint64_t v___x_300_; uint64_t v___x_301_; uint64_t v_x_302_; uint64_t v___x_303_; uint64_t v___x_304_; uint64_t v_x_305_; uint64_t v___x_306_; uint64_t v_x_307_; uint64_t v___x_308_; uint64_t v___x_309_; uint64_t v___x_310_; 
v___x_295_ = ((size_t)1ULL);
v___x_296_ = lean_usize_add(v_i_292_, v___x_295_);
v___x_297_ = lean_usize_to_uint64(v_i_292_);
v___x_298_ = 11400714819323198485ULL;
v___x_299_ = lean_uint64_add(v___x_297_, v___x_298_);
v___x_300_ = lean_uint64_xor(v_x_293_, v___x_299_);
v___x_301_ = 13787848793156543929ULL;
v_x_302_ = lean_uint64_mul(v___x_300_, v___x_301_);
v___x_303_ = 29ULL;
v___x_304_ = lean_uint64_shift_right(v_x_302_, v___x_303_);
v_x_305_ = lean_uint64_xor(v_x_302_, v___x_304_);
v___x_306_ = 10723151780598845931ULL;
v_x_307_ = lean_uint64_mul(v_x_305_, v___x_306_);
v___x_308_ = 31ULL;
v___x_309_ = lean_uint64_shift_right(v_x_307_, v___x_308_);
v___x_310_ = lean_uint64_xor(v_x_307_, v___x_309_);
v_i_292_ = v___x_296_;
v_x_293_ = v___x_310_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailScalar___boxed(lean_object* v_n_312_, lean_object* v_i_313_, lean_object* v_x_314_){
_start:
{
size_t v_n_boxed_315_; size_t v_i_boxed_316_; uint64_t v_x_boxed_317_; uint64_t v_res_318_; lean_object* v_r_319_; 
v_n_boxed_315_ = lean_unbox_usize(v_n_312_);
lean_dec(v_n_312_);
v_i_boxed_316_ = lean_unbox_usize(v_i_313_);
lean_dec(v_i_313_);
v_x_boxed_317_ = lean_unbox_uint64(v_x_314_);
lean_dec_ref(v_x_314_);
v_res_318_ = l_LoopStudy_tailScalar(v_n_boxed_315_, v_i_boxed_316_, v_x_boxed_317_);
v_r_319_ = lean_box_uint64(v_res_318_);
return v_r_319_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailPair(size_t v_n_320_, lean_object* v_s_321_){
_start:
{
lean_object* v_fst_322_; lean_object* v_snd_323_; lean_object* v___x_325_; uint8_t v_isShared_326_; uint8_t v_isSharedCheck_355_; 
v_fst_322_ = lean_ctor_get(v_s_321_, 0);
v_snd_323_ = lean_ctor_get(v_s_321_, 1);
v_isSharedCheck_355_ = !lean_is_exclusive(v_s_321_);
if (v_isSharedCheck_355_ == 0)
{
v___x_325_ = v_s_321_;
v_isShared_326_ = v_isSharedCheck_355_;
goto v_resetjp_324_;
}
else
{
lean_inc(v_snd_323_);
lean_inc(v_fst_322_);
lean_dec(v_s_321_);
v___x_325_ = lean_box(0);
v_isShared_326_ = v_isSharedCheck_355_;
goto v_resetjp_324_;
}
v_resetjp_324_:
{
size_t v___x_327_; uint8_t v___x_328_; 
v___x_327_ = lean_unbox_usize(v_fst_322_);
v___x_328_ = lean_usize_dec_lt(v___x_327_, v_n_320_);
if (v___x_328_ == 0)
{
uint64_t v___x_329_; 
lean_del_object(v___x_325_);
lean_dec(v_fst_322_);
v___x_329_ = lean_unbox_uint64(v_snd_323_);
lean_dec(v_snd_323_);
return v___x_329_;
}
else
{
size_t v___x_330_; size_t v___x_331_; size_t v___x_332_; size_t v___x_333_; uint64_t v___x_334_; uint64_t v___x_335_; uint64_t v___x_336_; uint64_t v___x_337_; uint64_t v___x_338_; uint64_t v___x_339_; uint64_t v_x_340_; uint64_t v___x_341_; uint64_t v___x_342_; uint64_t v_x_343_; uint64_t v___x_344_; uint64_t v_x_345_; uint64_t v___x_346_; uint64_t v___x_347_; uint64_t v___x_348_; lean_object* v___x_349_; lean_object* v___x_350_; lean_object* v___x_352_; 
v___x_330_ = ((size_t)1ULL);
v___x_331_ = lean_unbox_usize(v_fst_322_);
v___x_332_ = lean_usize_add(v___x_331_, v___x_330_);
v___x_333_ = lean_unbox_usize(v_fst_322_);
lean_dec(v_fst_322_);
v___x_334_ = lean_usize_to_uint64(v___x_333_);
v___x_335_ = 11400714819323198485ULL;
v___x_336_ = lean_uint64_add(v___x_334_, v___x_335_);
v___x_337_ = lean_unbox_uint64(v_snd_323_);
lean_dec(v_snd_323_);
v___x_338_ = lean_uint64_xor(v___x_337_, v___x_336_);
v___x_339_ = 13787848793156543929ULL;
v_x_340_ = lean_uint64_mul(v___x_338_, v___x_339_);
v___x_341_ = 29ULL;
v___x_342_ = lean_uint64_shift_right(v_x_340_, v___x_341_);
v_x_343_ = lean_uint64_xor(v_x_340_, v___x_342_);
v___x_344_ = 10723151780598845931ULL;
v_x_345_ = lean_uint64_mul(v_x_343_, v___x_344_);
v___x_346_ = 31ULL;
v___x_347_ = lean_uint64_shift_right(v_x_345_, v___x_346_);
v___x_348_ = lean_uint64_xor(v_x_345_, v___x_347_);
v___x_349_ = lean_box_usize(v___x_332_);
v___x_350_ = lean_box_uint64(v___x_348_);
if (v_isShared_326_ == 0)
{
lean_ctor_set(v___x_325_, 1, v___x_350_);
lean_ctor_set(v___x_325_, 0, v___x_349_);
v___x_352_ = v___x_325_;
goto v_reusejp_351_;
}
else
{
lean_object* v_reuseFailAlloc_354_; 
v_reuseFailAlloc_354_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_354_, 0, v___x_349_);
lean_ctor_set(v_reuseFailAlloc_354_, 1, v___x_350_);
v___x_352_ = v_reuseFailAlloc_354_;
goto v_reusejp_351_;
}
v_reusejp_351_:
{
v_s_321_ = v___x_352_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPair___boxed(lean_object* v_n_356_, lean_object* v_s_357_){
_start:
{
size_t v_n_boxed_358_; uint64_t v_res_359_; lean_object* v_r_360_; 
v_n_boxed_358_ = lean_unbox_usize(v_n_356_);
lean_dec(v_n_356_);
v_res_359_ = l_LoopStudy_tailPair(v_n_boxed_358_, v_s_357_);
v_r_360_ = lean_box_uint64(v_res_359_);
return v_r_360_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn(size_t v_n_361_, lean_object* v_s_362_){
_start:
{
lean_object* v_fst_363_; lean_object* v_snd_364_; size_t v___x_365_; uint8_t v___x_366_; 
v_fst_363_ = lean_ctor_get(v_s_362_, 0);
v_snd_364_ = lean_ctor_get(v_s_362_, 1);
v___x_365_ = lean_unbox_usize(v_fst_363_);
v___x_366_ = lean_usize_dec_lt(v___x_365_, v_n_361_);
if (v___x_366_ == 0)
{
return v_s_362_;
}
else
{
lean_object* v___x_368_; uint8_t v_isShared_369_; uint8_t v_isSharedCheck_395_; 
lean_inc(v_snd_364_);
lean_inc(v_fst_363_);
v_isSharedCheck_395_ = !lean_is_exclusive(v_s_362_);
if (v_isSharedCheck_395_ == 0)
{
lean_object* v_unused_396_; lean_object* v_unused_397_; 
v_unused_396_ = lean_ctor_get(v_s_362_, 1);
lean_dec(v_unused_396_);
v_unused_397_ = lean_ctor_get(v_s_362_, 0);
lean_dec(v_unused_397_);
v___x_368_ = v_s_362_;
v_isShared_369_ = v_isSharedCheck_395_;
goto v_resetjp_367_;
}
else
{
lean_dec(v_s_362_);
v___x_368_ = lean_box(0);
v_isShared_369_ = v_isSharedCheck_395_;
goto v_resetjp_367_;
}
v_resetjp_367_:
{
size_t v___x_370_; size_t v___x_371_; size_t v___x_372_; size_t v___x_373_; uint64_t v___x_374_; uint64_t v___x_375_; uint64_t v___x_376_; uint64_t v___x_377_; uint64_t v___x_378_; uint64_t v___x_379_; uint64_t v_x_380_; uint64_t v___x_381_; uint64_t v___x_382_; uint64_t v_x_383_; uint64_t v___x_384_; uint64_t v_x_385_; uint64_t v___x_386_; uint64_t v___x_387_; uint64_t v___x_388_; lean_object* v___x_389_; lean_object* v___x_390_; lean_object* v___x_392_; 
v___x_370_ = ((size_t)1ULL);
v___x_371_ = lean_unbox_usize(v_fst_363_);
v___x_372_ = lean_usize_add(v___x_371_, v___x_370_);
v___x_373_ = lean_unbox_usize(v_fst_363_);
lean_dec(v_fst_363_);
v___x_374_ = lean_usize_to_uint64(v___x_373_);
v___x_375_ = 11400714819323198485ULL;
v___x_376_ = lean_uint64_add(v___x_374_, v___x_375_);
v___x_377_ = lean_unbox_uint64(v_snd_364_);
lean_dec(v_snd_364_);
v___x_378_ = lean_uint64_xor(v___x_377_, v___x_376_);
v___x_379_ = 13787848793156543929ULL;
v_x_380_ = lean_uint64_mul(v___x_378_, v___x_379_);
v___x_381_ = 29ULL;
v___x_382_ = lean_uint64_shift_right(v_x_380_, v___x_381_);
v_x_383_ = lean_uint64_xor(v_x_380_, v___x_382_);
v___x_384_ = 10723151780598845931ULL;
v_x_385_ = lean_uint64_mul(v_x_383_, v___x_384_);
v___x_386_ = 31ULL;
v___x_387_ = lean_uint64_shift_right(v_x_385_, v___x_386_);
v___x_388_ = lean_uint64_xor(v_x_385_, v___x_387_);
v___x_389_ = lean_box_usize(v___x_372_);
v___x_390_ = lean_box_uint64(v___x_388_);
if (v_isShared_369_ == 0)
{
lean_ctor_set(v___x_368_, 1, v___x_390_);
lean_ctor_set(v___x_368_, 0, v___x_389_);
v___x_392_ = v___x_368_;
goto v_reusejp_391_;
}
else
{
lean_object* v_reuseFailAlloc_394_; 
v_reuseFailAlloc_394_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_394_, 0, v___x_389_);
lean_ctor_set(v_reuseFailAlloc_394_, 1, v___x_390_);
v___x_392_ = v_reuseFailAlloc_394_;
goto v_reusejp_391_;
}
v_reusejp_391_:
{
v_s_362_ = v___x_392_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailPairReturn___boxed(lean_object* v_n_398_, lean_object* v_s_399_){
_start:
{
size_t v_n_boxed_400_; lean_object* v_res_401_; 
v_n_boxed_400_ = lean_unbox_usize(v_n_398_);
lean_dec(v_n_398_);
v_res_401_ = l_LoopStudy_tailPairReturn(v_n_boxed_400_, v_s_399_);
return v_res_401_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(size_t v_n_402_, lean_object* v_a_403_){
_start:
{
size_t v_i_404_; uint64_t v_x_405_; uint8_t v___x_406_; 
v_i_404_ = lean_ctor_get_usize(v_a_403_, 0);
v_x_405_ = lean_ctor_get_uint64(v_a_403_, sizeof(void*)*1);
v___x_406_ = lean_usize_dec_lt(v_i_404_, v_n_402_);
if (v___x_406_ == 0)
{
return v_a_403_;
}
else
{
lean_object* v___x_408_; uint8_t v_isShared_409_; uint8_t v_isSharedCheck_430_; 
v_isSharedCheck_430_ = !lean_is_exclusive(v_a_403_);
if (v_isSharedCheck_430_ == 0)
{
v___x_408_ = v_a_403_;
v_isShared_409_ = v_isSharedCheck_430_;
goto v_resetjp_407_;
}
else
{
lean_dec(v_a_403_);
v___x_408_ = lean_box(0);
v_isShared_409_ = v_isSharedCheck_430_;
goto v_resetjp_407_;
}
v_resetjp_407_:
{
size_t v___x_410_; size_t v___x_411_; uint64_t v___x_412_; uint64_t v___x_413_; uint64_t v___x_414_; uint64_t v___x_415_; uint64_t v___x_416_; uint64_t v_x_417_; uint64_t v___x_418_; uint64_t v___x_419_; uint64_t v_x_420_; uint64_t v___x_421_; uint64_t v_x_422_; uint64_t v___x_423_; uint64_t v___x_424_; uint64_t v___x_425_; lean_object* v___x_427_; 
v___x_410_ = ((size_t)1ULL);
v___x_411_ = lean_usize_add(v_i_404_, v___x_410_);
v___x_412_ = lean_usize_to_uint64(v_i_404_);
v___x_413_ = 11400714819323198485ULL;
v___x_414_ = lean_uint64_add(v___x_412_, v___x_413_);
v___x_415_ = lean_uint64_xor(v_x_405_, v___x_414_);
v___x_416_ = 13787848793156543929ULL;
v_x_417_ = lean_uint64_mul(v___x_415_, v___x_416_);
v___x_418_ = 29ULL;
v___x_419_ = lean_uint64_shift_right(v_x_417_, v___x_418_);
v_x_420_ = lean_uint64_xor(v_x_417_, v___x_419_);
v___x_421_ = 10723151780598845931ULL;
v_x_422_ = lean_uint64_mul(v_x_420_, v___x_421_);
v___x_423_ = 31ULL;
v___x_424_ = lean_uint64_shift_right(v_x_422_, v___x_423_);
v___x_425_ = lean_uint64_xor(v_x_422_, v___x_424_);
if (v_isShared_409_ == 0)
{
v___x_427_ = v___x_408_;
goto v_reusejp_426_;
}
else
{
lean_object* v_reuseFailAlloc_429_; 
v_reuseFailAlloc_429_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_427_ = v_reuseFailAlloc_429_;
goto v_reusejp_426_;
}
v_reusejp_426_:
{
lean_ctor_set_usize(v___x_427_, 0, v___x_411_);
lean_ctor_set_uint64(v___x_427_, sizeof(void*)*1, v___x_425_);
v_a_403_ = v___x_427_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed(lean_object* v_n_431_, lean_object* v_a_432_){
_start:
{
size_t v_n_boxed_433_; lean_object* v_res_434_; 
v_n_boxed_433_ = lean_unbox_usize(v_n_431_);
lean_dec(v_n_431_);
v_res_434_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(v_n_boxed_433_, v_a_432_);
return v_res_434_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_whileStruct(size_t v_n_435_, uint64_t v_seed_436_){
_start:
{
size_t v___x_437_; lean_object* v_s_438_; lean_object* v___x_439_; uint64_t v_x_440_; 
v___x_437_ = ((size_t)0ULL);
v_s_438_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
lean_ctor_set_usize(v_s_438_, 0, v___x_437_);
lean_ctor_set_uint64(v_s_438_, sizeof(void*)*1, v_seed_436_);
v___x_439_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(v_n_435_, v_s_438_);
v_x_440_ = lean_ctor_get_uint64(v___x_439_, sizeof(void*)*1);
lean_dec_ref(v___x_439_);
return v_x_440_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_whileStruct___boxed(lean_object* v_n_441_, lean_object* v_seed_442_){
_start:
{
size_t v_n_boxed_443_; uint64_t v_seed_boxed_444_; uint64_t v_res_445_; lean_object* v_r_446_; 
v_n_boxed_443_ = lean_unbox_usize(v_n_441_);
lean_dec(v_n_441_);
v_seed_boxed_444_ = lean_unbox_uint64(v_seed_442_);
lean_dec_ref(v_seed_442_);
v_res_445_ = l_LoopStudy_whileStruct(v_n_boxed_443_, v_seed_boxed_444_);
v_r_446_ = lean_box_uint64(v_res_445_);
return v_r_446_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0(size_t v_n_447_, lean_object* v_inst_448_, lean_object* v_a_449_){
_start:
{
lean_object* v___x_450_; 
v___x_450_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg(v_n_447_, v_a_449_);
return v___x_450_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed(lean_object* v_n_451_, lean_object* v_inst_452_, lean_object* v_a_453_){
_start:
{
size_t v_n_boxed_454_; lean_object* v_res_455_; 
v_n_boxed_454_ = lean_unbox_usize(v_n_451_);
lean_dec(v_n_451_);
v_res_455_ = l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0(v_n_boxed_454_, v_inst_452_, v_a_453_);
return v_res_455_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailStruct(size_t v_n_456_, lean_object* v_s_457_){
_start:
{
size_t v_i_458_; uint64_t v_x_459_; lean_object* v___x_461_; uint8_t v_isShared_462_; uint8_t v_isSharedCheck_484_; 
v_i_458_ = lean_ctor_get_usize(v_s_457_, 0);
v_x_459_ = lean_ctor_get_uint64(v_s_457_, sizeof(void*)*1);
v_isSharedCheck_484_ = !lean_is_exclusive(v_s_457_);
if (v_isSharedCheck_484_ == 0)
{
v___x_461_ = v_s_457_;
v_isShared_462_ = v_isSharedCheck_484_;
goto v_resetjp_460_;
}
else
{
lean_dec(v_s_457_);
v___x_461_ = lean_box(0);
v_isShared_462_ = v_isSharedCheck_484_;
goto v_resetjp_460_;
}
v_resetjp_460_:
{
uint8_t v___x_463_; 
v___x_463_ = lean_usize_dec_lt(v_i_458_, v_n_456_);
if (v___x_463_ == 0)
{
lean_del_object(v___x_461_);
return v_x_459_;
}
else
{
size_t v___x_464_; size_t v___x_465_; uint64_t v___x_466_; uint64_t v___x_467_; uint64_t v___x_468_; uint64_t v___x_469_; uint64_t v___x_470_; uint64_t v_x_471_; uint64_t v___x_472_; uint64_t v___x_473_; uint64_t v_x_474_; uint64_t v___x_475_; uint64_t v_x_476_; uint64_t v___x_477_; uint64_t v___x_478_; uint64_t v___x_479_; lean_object* v___x_481_; 
v___x_464_ = ((size_t)1ULL);
v___x_465_ = lean_usize_add(v_i_458_, v___x_464_);
v___x_466_ = lean_usize_to_uint64(v_i_458_);
v___x_467_ = 11400714819323198485ULL;
v___x_468_ = lean_uint64_add(v___x_466_, v___x_467_);
v___x_469_ = lean_uint64_xor(v_x_459_, v___x_468_);
v___x_470_ = 13787848793156543929ULL;
v_x_471_ = lean_uint64_mul(v___x_469_, v___x_470_);
v___x_472_ = 29ULL;
v___x_473_ = lean_uint64_shift_right(v_x_471_, v___x_472_);
v_x_474_ = lean_uint64_xor(v_x_471_, v___x_473_);
v___x_475_ = 10723151780598845931ULL;
v_x_476_ = lean_uint64_mul(v_x_474_, v___x_475_);
v___x_477_ = 31ULL;
v___x_478_ = lean_uint64_shift_right(v_x_476_, v___x_477_);
v___x_479_ = lean_uint64_xor(v_x_476_, v___x_478_);
if (v_isShared_462_ == 0)
{
v___x_481_ = v___x_461_;
goto v_reusejp_480_;
}
else
{
lean_object* v_reuseFailAlloc_483_; 
v_reuseFailAlloc_483_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
v___x_481_ = v_reuseFailAlloc_483_;
goto v_reusejp_480_;
}
v_reusejp_480_:
{
lean_ctor_set_usize(v___x_481_, 0, v___x_465_);
lean_ctor_set_uint64(v___x_481_, sizeof(void*)*1, v___x_479_);
v_s_457_ = v___x_481_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailStruct___boxed(lean_object* v_n_485_, lean_object* v_s_486_){
_start:
{
size_t v_n_boxed_487_; uint64_t v_res_488_; lean_object* v_r_489_; 
v_n_boxed_487_ = lean_unbox_usize(v_n_485_);
lean_dec(v_n_485_);
v_res_488_ = l_LoopStudy_tailStruct(v_n_boxed_487_, v_s_486_);
v_r_489_ = lean_box_uint64(v_res_488_);
return v_r_489_;
}
}
LEAN_EXPORT uint64_t l_LoopStudy_tailFuel(lean_object* v_x_490_, size_t v_x_491_, uint64_t v_x_492_){
_start:
{
lean_object* v_zero_493_; uint8_t v_isZero_494_; 
v_zero_493_ = lean_unsigned_to_nat(0u);
v_isZero_494_ = lean_nat_dec_eq(v_x_490_, v_zero_493_);
if (v_isZero_494_ == 1)
{
lean_dec(v_x_490_);
return v_x_492_;
}
else
{
lean_object* v_one_495_; lean_object* v_n_496_; size_t v___x_497_; size_t v___x_498_; uint64_t v___x_499_; uint64_t v___x_500_; uint64_t v___x_501_; uint64_t v___x_502_; uint64_t v___x_503_; uint64_t v_x_504_; uint64_t v___x_505_; uint64_t v___x_506_; uint64_t v_x_507_; uint64_t v___x_508_; uint64_t v_x_509_; uint64_t v___x_510_; uint64_t v___x_511_; uint64_t v___x_512_; 
v_one_495_ = lean_unsigned_to_nat(1u);
v_n_496_ = lean_nat_sub(v_x_490_, v_one_495_);
lean_dec(v_x_490_);
v___x_497_ = ((size_t)1ULL);
v___x_498_ = lean_usize_add(v_x_491_, v___x_497_);
v___x_499_ = lean_usize_to_uint64(v_x_491_);
v___x_500_ = 11400714819323198485ULL;
v___x_501_ = lean_uint64_add(v___x_499_, v___x_500_);
v___x_502_ = lean_uint64_xor(v_x_492_, v___x_501_);
v___x_503_ = 13787848793156543929ULL;
v_x_504_ = lean_uint64_mul(v___x_502_, v___x_503_);
v___x_505_ = 29ULL;
v___x_506_ = lean_uint64_shift_right(v_x_504_, v___x_505_);
v_x_507_ = lean_uint64_xor(v_x_504_, v___x_506_);
v___x_508_ = 10723151780598845931ULL;
v_x_509_ = lean_uint64_mul(v_x_507_, v___x_508_);
v___x_510_ = 31ULL;
v___x_511_ = lean_uint64_shift_right(v_x_509_, v___x_510_);
v___x_512_ = lean_uint64_xor(v_x_509_, v___x_511_);
v_x_490_ = v_n_496_;
v_x_491_ = v___x_498_;
v_x_492_ = v___x_512_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_tailFuel___boxed(lean_object* v_x_514_, lean_object* v_x_515_, lean_object* v_x_516_){
_start:
{
size_t v_x_60__boxed_517_; uint64_t v_x_61__boxed_518_; uint64_t v_res_519_; lean_object* v_r_520_; 
v_x_60__boxed_517_ = lean_unbox_usize(v_x_515_);
lean_dec(v_x_515_);
v_x_61__boxed_518_ = lean_unbox_uint64(v_x_516_);
lean_dec_ref(v_x_516_);
v_res_519_ = l_LoopStudy_tailFuel(v_x_514_, v_x_60__boxed_517_, v_x_61__boxed_518_);
v_r_520_ = lean_box_uint64(v_res_519_);
return v_r_520_;
}
}
LEAN_EXPORT lean_object* l_LoopStudy_runVariant(lean_object* v_name_532_, size_t v_n_533_, uint64_t v_seed_534_){
_start:
{
lean_object* v___x_536_; uint8_t v___x_537_; 
v___x_536_ = ((lean_object*)(l_LoopStudy_runVariant___closed__0));
v___x_537_ = lean_string_dec_eq(v_name_532_, v___x_536_);
if (v___x_537_ == 0)
{
lean_object* v___x_538_; uint8_t v___x_539_; 
v___x_538_ = ((lean_object*)(l_LoopStudy_runVariant___closed__1));
v___x_539_ = lean_string_dec_eq(v_name_532_, v___x_538_);
if (v___x_539_ == 0)
{
lean_object* v___x_540_; uint8_t v___x_541_; 
v___x_540_ = ((lean_object*)(l_LoopStudy_runVariant___closed__2));
v___x_541_ = lean_string_dec_eq(v_name_532_, v___x_540_);
if (v___x_541_ == 0)
{
lean_object* v___x_542_; uint8_t v___x_543_; 
v___x_542_ = ((lean_object*)(l_LoopStudy_runVariant___closed__3));
v___x_543_ = lean_string_dec_eq(v_name_532_, v___x_542_);
if (v___x_543_ == 0)
{
lean_object* v___x_544_; uint8_t v___x_545_; 
v___x_544_ = ((lean_object*)(l_LoopStudy_runVariant___closed__4));
v___x_545_ = lean_string_dec_eq(v_name_532_, v___x_544_);
if (v___x_545_ == 0)
{
lean_object* v___x_546_; uint8_t v___x_547_; 
v___x_546_ = ((lean_object*)(l_LoopStudy_runVariant___closed__5));
v___x_547_ = lean_string_dec_eq(v_name_532_, v___x_546_);
if (v___x_547_ == 0)
{
lean_object* v___x_548_; uint8_t v___x_549_; 
v___x_548_ = ((lean_object*)(l_LoopStudy_runVariant___closed__6));
v___x_549_ = lean_string_dec_eq(v_name_532_, v___x_548_);
if (v___x_549_ == 0)
{
lean_object* v___x_550_; uint8_t v___x_551_; 
v___x_550_ = ((lean_object*)(l_LoopStudy_runVariant___closed__7));
v___x_551_ = lean_string_dec_eq(v_name_532_, v___x_550_);
if (v___x_551_ == 0)
{
lean_object* v___x_552_; uint8_t v___x_553_; 
v___x_552_ = ((lean_object*)(l_LoopStudy_runVariant___closed__8));
v___x_553_ = lean_string_dec_eq(v_name_532_, v___x_552_);
if (v___x_553_ == 0)
{
lean_object* v___x_554_; uint8_t v___x_555_; 
v___x_554_ = ((lean_object*)(l_LoopStudy_runVariant___closed__9));
v___x_555_ = lean_string_dec_eq(v_name_532_, v___x_554_);
if (v___x_555_ == 0)
{
lean_object* v___x_556_; lean_object* v___x_557_; lean_object* v___x_558_; lean_object* v___x_559_; 
v___x_556_ = ((lean_object*)(l_LoopStudy_runVariant___closed__10));
v___x_557_ = lean_string_append(v___x_556_, v_name_532_);
v___x_558_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v___x_558_, 0, v___x_557_);
v___x_559_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_559_, 0, v___x_558_);
return v___x_559_;
}
else
{
lean_object* v___x_560_; size_t v___x_561_; uint64_t v___x_562_; lean_object* v___x_563_; lean_object* v___x_564_; 
v___x_560_ = lean_usize_to_nat(v_n_533_);
v___x_561_ = ((size_t)0ULL);
v___x_562_ = l_LoopStudy_tailFuel(v___x_560_, v___x_561_, v_seed_534_);
v___x_563_ = lean_box_uint64(v___x_562_);
v___x_564_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_564_, 0, v___x_563_);
return v___x_564_;
}
}
else
{
size_t v___x_565_; lean_object* v___x_566_; uint64_t v___x_567_; lean_object* v___x_568_; lean_object* v___x_569_; 
v___x_565_ = ((size_t)0ULL);
v___x_566_ = lean_alloc_ctor(0, 0, sizeof(size_t)*1 + 8);
lean_ctor_set_usize(v___x_566_, 0, v___x_565_);
lean_ctor_set_uint64(v___x_566_, sizeof(void*)*1, v_seed_534_);
v___x_567_ = l_LoopStudy_tailStruct(v_n_533_, v___x_566_);
v___x_568_ = lean_box_uint64(v___x_567_);
v___x_569_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_569_, 0, v___x_568_);
return v___x_569_;
}
}
else
{
uint64_t v___x_570_; lean_object* v___x_571_; lean_object* v___x_572_; 
v___x_570_ = l_LoopStudy_whileStruct(v_n_533_, v_seed_534_);
v___x_571_ = lean_box_uint64(v___x_570_);
v___x_572_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_572_, 0, v___x_571_);
return v___x_572_;
}
}
else
{
lean_object* v___x_573_; lean_object* v___x_574_; lean_object* v___x_575_; lean_object* v___x_576_; lean_object* v_snd_577_; lean_object* v___x_578_; 
v___x_573_ = ((lean_object*)(l_LoopStudy_idWhile___boxed__const__1));
v___x_574_ = lean_box_uint64(v_seed_534_);
v___x_575_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_575_, 0, v___x_573_);
lean_ctor_set(v___x_575_, 1, v___x_574_);
v___x_576_ = l_LoopStudy_tailPairReturn(v_n_533_, v___x_575_);
v_snd_577_ = lean_ctor_get(v___x_576_, 1);
lean_inc(v_snd_577_);
lean_dec_ref(v___x_576_);
v___x_578_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_578_, 0, v_snd_577_);
return v___x_578_;
}
}
else
{
lean_object* v___x_579_; lean_object* v___x_580_; lean_object* v___x_581_; uint64_t v___x_582_; lean_object* v___x_583_; lean_object* v___x_584_; 
v___x_579_ = ((lean_object*)(l_LoopStudy_idWhile___boxed__const__1));
v___x_580_ = lean_box_uint64(v_seed_534_);
v___x_581_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_581_, 0, v___x_579_);
lean_ctor_set(v___x_581_, 1, v___x_580_);
v___x_582_ = l_LoopStudy_tailPair(v_n_533_, v___x_581_);
v___x_583_ = lean_box_uint64(v___x_582_);
v___x_584_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_584_, 0, v___x_583_);
return v___x_584_;
}
}
else
{
size_t v___x_585_; uint64_t v___x_586_; lean_object* v___x_587_; lean_object* v___x_588_; 
v___x_585_ = ((size_t)0ULL);
v___x_586_ = l_LoopStudy_tailScalar(v_n_533_, v___x_585_, v_seed_534_);
v___x_587_ = lean_box_uint64(v___x_586_);
v___x_588_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_588_, 0, v___x_587_);
return v___x_588_;
}
}
else
{
uint64_t v___x_589_; lean_object* v___x_590_; lean_object* v___x_591_; 
v___x_589_ = l_LoopStudy_forUSize(v_n_533_, v_seed_534_);
v___x_590_ = lean_box_uint64(v___x_589_);
v___x_591_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_591_, 0, v___x_590_);
return v___x_591_;
}
}
else
{
uint64_t v___x_592_; lean_object* v___x_593_; lean_object* v___x_594_; 
v___x_592_ = l_LoopStudy_forNat(v_n_533_, v_seed_534_);
v___x_593_ = lean_box_uint64(v___x_592_);
v___x_594_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_594_, 0, v___x_593_);
return v___x_594_;
}
}
else
{
lean_object* v___x_595_; 
v___x_595_ = l_LoopStudy_ioWhile(v_n_533_, v_seed_534_);
return v___x_595_;
}
}
else
{
uint64_t v___x_596_; lean_object* v___x_597_; lean_object* v___x_598_; 
v___x_596_ = l_LoopStudy_idWhile(v_n_533_, v_seed_534_);
v___x_597_ = lean_box_uint64(v___x_596_);
v___x_598_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_598_, 0, v___x_597_);
return v___x_598_;
}
}
}
LEAN_EXPORT lean_object* l_LoopStudy_runVariant___boxed(lean_object* v_name_599_, lean_object* v_n_600_, lean_object* v_seed_601_, lean_object* v_a_602_){
_start:
{
size_t v_n_boxed_603_; uint64_t v_seed_boxed_604_; lean_object* v_res_605_; 
v_n_boxed_603_ = lean_unbox_usize(v_n_600_);
lean_dec(v_n_600_);
v_seed_boxed_604_ = lean_unbox_uint64(v_seed_601_);
lean_dec_ref(v_seed_601_);
v_res_605_ = l_LoopStudy_runVariant(v_name_599_, v_n_boxed_603_, v_seed_boxed_604_);
lean_dec_ref(v_name_599_);
return v_res_605_;
}
}
LEAN_EXPORT lean_object* _lean_main(lean_object* v_args_609_){
_start:
{
lean_object* v___x_611_; lean_object* v___x_612_; lean_object* v_variant_613_; lean_object* v___x_614_; lean_object* v___x_615_; lean_object* v___x_616_; lean_object* v___x_617_; lean_object* v___x_618_; lean_object* v___x_619_; size_t v_n_620_; lean_object* v___x_621_; lean_object* v___x_622_; lean_object* v___x_623_; lean_object* v___x_624_; lean_object* v___x_625_; lean_object* v___x_626_; uint64_t v_seed_627_; size_t v___x_628_; size_t v___x_629_; lean_object* v___x_630_; 
v___x_611_ = lean_unsigned_to_nat(0u);
v___x_612_ = ((lean_object*)(l_LoopStudy_runVariant___closed__0));
v_variant_613_ = l_List_getD___redArg(v_args_609_, v___x_611_, v___x_612_);
v___x_614_ = lean_unsigned_to_nat(1u);
v___x_615_ = ((lean_object*)(l_main___closed__0));
v___x_616_ = l_List_getD___redArg(v_args_609_, v___x_614_, v___x_615_);
v___x_617_ = lean_string_utf8_byte_size(v___x_616_);
v___x_618_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_618_, 0, v___x_616_);
lean_ctor_set(v___x_618_, 1, v___x_611_);
lean_ctor_set(v___x_618_, 2, v___x_617_);
v___x_619_ = l_String_Slice_toNat_x21(v___x_618_);
lean_dec_ref_known(v___x_618_, 3);
v_n_620_ = lean_usize_of_nat(v___x_619_);
lean_dec(v___x_619_);
v___x_621_ = lean_unsigned_to_nat(2u);
v___x_622_ = ((lean_object*)(l_main___closed__1));
v___x_623_ = l_List_getD___redArg(v_args_609_, v___x_621_, v___x_622_);
lean_dec(v_args_609_);
v___x_624_ = lean_string_utf8_byte_size(v___x_623_);
v___x_625_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_625_, 0, v___x_623_);
lean_ctor_set(v___x_625_, 1, v___x_611_);
lean_ctor_set(v___x_625_, 2, v___x_624_);
v___x_626_ = l_String_Slice_toNat_x21(v___x_625_);
lean_dec_ref_known(v___x_625_, 3);
v_seed_627_ = lean_uint64_of_nat(v___x_626_);
lean_dec(v___x_626_);
v___x_628_ = ((size_t)1ULL);
v___x_629_ = lean_usize_shift_right(v_n_620_, v___x_628_);
v___x_630_ = l_LoopStudy_runVariant(v_variant_613_, v___x_629_, v_seed_627_);
if (lean_obj_tag(v___x_630_) == 0)
{
lean_object* v_a_631_; lean_object* v___x_632_; lean_object* v___x_633_; 
v_a_631_ = lean_ctor_get(v___x_630_, 0);
lean_inc(v_a_631_);
lean_dec_ref_known(v___x_630_, 1);
v___x_632_ = lean_io_mono_nanos_now();
v___x_633_ = l_LoopStudy_runVariant(v_variant_613_, v_n_620_, v_seed_627_);
lean_dec(v_variant_613_);
if (lean_obj_tag(v___x_633_) == 0)
{
lean_object* v_a_634_; lean_object* v___x_635_; lean_object* v___x_636_; lean_object* v___x_637_; lean_object* v___x_638_; lean_object* v___x_639_; uint64_t v___x_640_; lean_object* v___x_641_; lean_object* v___x_642_; lean_object* v___x_643_; lean_object* v___x_644_; uint64_t v___x_645_; lean_object* v___x_646_; lean_object* v___x_647_; lean_object* v___x_648_; lean_object* v___x_649_; 
v_a_634_ = lean_ctor_get(v___x_633_, 0);
lean_inc(v_a_634_);
lean_dec_ref_known(v___x_633_, 1);
v___x_635_ = lean_io_mono_nanos_now();
v___x_636_ = lean_nat_sub(v___x_635_, v___x_632_);
lean_dec(v___x_632_);
lean_dec(v___x_635_);
v___x_637_ = l_Nat_reprFast(v___x_636_);
v___x_638_ = ((lean_object*)(l_main___closed__2));
v___x_639_ = lean_string_append(v___x_637_, v___x_638_);
v___x_640_ = lean_unbox_uint64(v_a_634_);
lean_dec(v_a_634_);
v___x_641_ = lean_uint64_to_nat(v___x_640_);
v___x_642_ = l_Nat_reprFast(v___x_641_);
v___x_643_ = lean_string_append(v___x_639_, v___x_642_);
lean_dec_ref(v___x_642_);
v___x_644_ = lean_string_append(v___x_643_, v___x_638_);
v___x_645_ = lean_unbox_uint64(v_a_631_);
lean_dec(v_a_631_);
v___x_646_ = lean_uint64_to_nat(v___x_645_);
v___x_647_ = l_Nat_reprFast(v___x_646_);
v___x_648_ = lean_string_append(v___x_644_, v___x_647_);
lean_dec_ref(v___x_647_);
v___x_649_ = l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(v___x_648_);
return v___x_649_;
}
else
{
lean_object* v_a_650_; lean_object* v___x_652_; uint8_t v_isShared_653_; uint8_t v_isSharedCheck_657_; 
lean_dec(v___x_632_);
lean_dec(v_a_631_);
v_a_650_ = lean_ctor_get(v___x_633_, 0);
v_isSharedCheck_657_ = !lean_is_exclusive(v___x_633_);
if (v_isSharedCheck_657_ == 0)
{
v___x_652_ = v___x_633_;
v_isShared_653_ = v_isSharedCheck_657_;
goto v_resetjp_651_;
}
else
{
lean_inc(v_a_650_);
lean_dec(v___x_633_);
v___x_652_ = lean_box(0);
v_isShared_653_ = v_isSharedCheck_657_;
goto v_resetjp_651_;
}
v_resetjp_651_:
{
lean_object* v___x_655_; 
if (v_isShared_653_ == 0)
{
v___x_655_ = v___x_652_;
goto v_reusejp_654_;
}
else
{
lean_object* v_reuseFailAlloc_656_; 
v_reuseFailAlloc_656_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_656_, 0, v_a_650_);
v___x_655_ = v_reuseFailAlloc_656_;
goto v_reusejp_654_;
}
v_reusejp_654_:
{
return v___x_655_;
}
}
}
}
else
{
lean_object* v_a_658_; lean_object* v___x_660_; uint8_t v_isShared_661_; uint8_t v_isSharedCheck_665_; 
lean_dec(v_variant_613_);
v_a_658_ = lean_ctor_get(v___x_630_, 0);
v_isSharedCheck_665_ = !lean_is_exclusive(v___x_630_);
if (v_isSharedCheck_665_ == 0)
{
v___x_660_ = v___x_630_;
v_isShared_661_ = v_isSharedCheck_665_;
goto v_resetjp_659_;
}
else
{
lean_inc(v_a_658_);
lean_dec(v___x_630_);
v___x_660_ = lean_box(0);
v_isShared_661_ = v_isSharedCheck_665_;
goto v_resetjp_659_;
}
v_resetjp_659_:
{
lean_object* v___x_663_; 
if (v_isShared_661_ == 0)
{
v___x_663_ = v___x_660_;
goto v_reusejp_662_;
}
else
{
lean_object* v_reuseFailAlloc_664_; 
v_reuseFailAlloc_664_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_664_, 0, v_a_658_);
v___x_663_ = v_reuseFailAlloc_664_;
goto v_reusejp_662_;
}
v_reusejp_662_:
{
return v___x_663_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_main___boxed(lean_object* v_args_666_, lean_object* v_a_667_){
_start:
{
lean_object* v_res_668_; 
v_res_668_ = _lean_main(v_args_666_);
return v_res_668_;
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
