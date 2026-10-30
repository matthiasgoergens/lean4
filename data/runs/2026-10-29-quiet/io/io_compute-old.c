// Lean compiler output
// Module: io_compute
// Imports: public import Init public meta import Init
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
lean_object* lean_array_fget_borrowed(lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
lean_object* lean_array_fswap(lean_object*, lean_object*, lean_object*);
uint8_t lean_uint64_dec_lt(uint64_t, uint64_t);
lean_object* lean_nat_add(lean_object*, lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
lean_object* lean_nat_shiftr(lean_object*, lean_object*);
uint8_t lean_uint64_dec_eq(uint64_t, uint64_t);
uint64_t lean_uint64_shift_right(uint64_t, uint64_t);
uint64_t lean_uint64_xor(uint64_t, uint64_t);
uint64_t lean_uint64_shift_left(uint64_t, uint64_t);
uint64_t lean_uint64_mul(uint64_t, uint64_t);
lean_object* lean_array_push(lean_object*, lean_object*);
lean_object* lean_array_get_size(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* lean_array_get_borrowed(lean_object*, lean_object*, lean_object*);
uint64_t lean_uint64_land(uint64_t, uint64_t);
uint8_t lean_uint64_to_uint8(uint64_t);
lean_object* lean_byte_array_push(lean_object*, uint8_t);
lean_object* lean_nat_mul(lean_object*, lean_object*);
uint8_t lean_byte_array_get(lean_object*, lean_object*);
uint64_t lean_uint8_to_uint64(uint8_t);
uint64_t lean_uint64_add(uint64_t, uint64_t);
uint64_t lean_uint64_of_nat(lean_object*);
uint64_t lean_uint64_mod(uint64_t, uint64_t);
lean_object* lean_uint64_to_nat(uint64_t);
lean_object* lean_array_swap(lean_object*, lean_object*, lean_object*);
lean_object* lean_get_stdout();
lean_object* l_IO_FS_writeBinFile(lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
lean_object* lean_io_mono_ms_now();
double lean_float_of_nat(lean_object*);
double l_Float_ofScientific(lean_object*, uint8_t, lean_object*);
double lean_float_div(double, double);
lean_object* lean_float_to_string(double);
lean_object* lean_string_append(lean_object*, lean_object*);
lean_object* lean_string_push(lean_object*, uint32_t);
lean_object* lean_io_create_tempfile();
lean_object* l_IO_FS_readBinFile(lean_object*);
lean_object* lean_mk_empty_byte_array(lean_object*);
LEAN_EXPORT lean_object* l_N;
LEAN_EXPORT lean_object* l_xorshift64(uint64_t);
LEAN_EXPORT lean_object* l_xorshift64___boxed(lean_object*);
LEAN_EXPORT lean_object* l_pushLE(lean_object*, uint64_t);
LEAN_EXPORT lean_object* l_pushLE___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint64_t l_readLE(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_readLE___boxed(lean_object*, lean_object*);
static lean_once_cell_t l_timeS___redArg___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static double l_timeS___redArg___closed__0;
LEAN_EXPORT lean_object* l_timeS___redArg(lean_object*);
LEAN_EXPORT lean_object* l_timeS___redArg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_timeS(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_timeS___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(lean_object*, uint64_t, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint8_t l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(uint64_t, uint64_t);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_qsortOrd___at___00main_spec__1(lean_object*);
LEAN_EXPORT lean_object* l_main___lam__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_main___lam__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_main___lam__1(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_main___lam__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_ctor_object l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed__const__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*0 + 8, .m_other = 0, .m_tag = 0}, .m_objs = {LEAN_SCALAR_PTR_LITERAL(0, 0, 0, 0, 0, 0, 0, 0)}};
LEAN_EXPORT const lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed__const__1 = (const lean_object*)&l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed__const__1_value;
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_main___lam__2(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_main___lam__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_main___lam__3(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_main___lam__3___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_IO_print___at___00IO_println___at___00main_spec__2_spec__3(lean_object*);
LEAN_EXPORT lean_object* l_IO_print___at___00IO_println___at___00main_spec__2_spec__3___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_IO_println___at___00main_spec__2(lean_object*);
LEAN_EXPORT lean_object* l_IO_println___at___00main_spec__2___boxed(lean_object*, lean_object*);
static const lean_ctor_object l_main___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*3 + 0, .m_other = 3, .m_tag = 0}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)(((size_t)(6250000) << 1) | 1)),((lean_object*)(((size_t)(1) << 1) | 1))}};
static const lean_object* l_main___closed__0 = (const lean_object*)&l_main___closed__0_value;
static const lean_ctor_object l_main___closed__1___boxed__const__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*0 + 8, .m_other = 0, .m_tag = 0}, .m_objs = {LEAN_SCALAR_PTR_LITERAL(42, 0, 0, 0, 0, 0, 0, 0)}};
LEAN_EXPORT const lean_object* l_main___closed__1___boxed__const__1 = (const lean_object*)&l_main___closed__1___boxed__const__1_value;
static lean_once_cell_t l_main___closed__1_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l_main___closed__1;
static lean_once_cell_t l_main___closed__2_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l_main___closed__2;
static const lean_string_object l_main___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 28, .m_capacity = 28, .m_length = 27, .m_data = "measurement: generate_sort "};
static const lean_object* l_main___closed__3 = (const lean_object*)&l_main___closed__3_value;
static const lean_string_object l_main___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 3, .m_capacity = 3, .m_length = 2, .m_data = " s"};
static const lean_object* l_main___closed__4 = (const lean_object*)&l_main___closed__4_value;
static lean_once_cell_t l_main___closed__5_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l_main___closed__5;
static const lean_string_object l_main___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 20, .m_capacity = 20, .m_length = 19, .m_data = "measurement: write "};
static const lean_object* l_main___closed__6 = (const lean_object*)&l_main___closed__6_value;
static const lean_string_object l_main___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 19, .m_capacity = 19, .m_length = 18, .m_data = "measurement: read "};
static const lean_object* l_main___closed__7 = (const lean_object*)&l_main___closed__7_value;
static const lean_ctor_object l_main___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*3 + 0, .m_other = 3, .m_tag = 0}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)(((size_t)(6249999) << 1) | 1)),((lean_object*)(((size_t)(1) << 1) | 1))}};
static const lean_object* l_main___closed__8 = (const lean_object*)&l_main___closed__8_value;
static const lean_string_object l_main___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 22, .m_capacity = 22, .m_length = 21, .m_data = "measurement: shuffle "};
static const lean_object* l_main___closed__9 = (const lean_object*)&l_main___closed__9_value;
LEAN_EXPORT lean_object* _lean_main();
LEAN_EXPORT lean_object* l_main___boxed(lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2(lean_object*, lean_object*, lean_object*, lean_object*, uint64_t, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* _init_l_N(void){
_start:
{
lean_object* v___x_1_; 
v___x_1_ = lean_unsigned_to_nat(6250000u);
return v___x_1_;
}
}
LEAN_EXPORT lean_object* l_xorshift64(uint64_t v_state_2_){
_start:
{
uint64_t v___x_3_; uint64_t v___x_4_; uint64_t v_x_5_; uint64_t v___x_6_; uint64_t v___x_7_; uint64_t v_x_8_; uint64_t v___x_9_; uint64_t v___x_10_; uint64_t v_x_11_; uint64_t v___x_12_; uint64_t v___x_13_; lean_object* v___x_14_; lean_object* v___x_15_; lean_object* v___x_16_; 
v___x_3_ = 12ULL;
v___x_4_ = lean_uint64_shift_right(v_state_2_, v___x_3_);
v_x_5_ = lean_uint64_xor(v_state_2_, v___x_4_);
v___x_6_ = 25ULL;
v___x_7_ = lean_uint64_shift_left(v_x_5_, v___x_6_);
v_x_8_ = lean_uint64_xor(v_x_5_, v___x_7_);
v___x_9_ = 27ULL;
v___x_10_ = lean_uint64_shift_right(v_x_8_, v___x_9_);
v_x_11_ = lean_uint64_xor(v_x_8_, v___x_10_);
v___x_12_ = 2685821657736338717ULL;
v___x_13_ = lean_uint64_mul(v_x_11_, v___x_12_);
v___x_14_ = lean_box_uint64(v_x_11_);
v___x_15_ = lean_box_uint64(v___x_13_);
v___x_16_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_16_, 0, v___x_14_);
lean_ctor_set(v___x_16_, 1, v___x_15_);
return v___x_16_;
}
}
LEAN_EXPORT lean_object* l_xorshift64___boxed(lean_object* v_state_17_){
_start:
{
uint64_t v_state_boxed_18_; lean_object* v_res_19_; 
v_state_boxed_18_ = lean_unbox_uint64(v_state_17_);
lean_dec_ref(v_state_17_);
v_res_19_ = l_xorshift64(v_state_boxed_18_);
return v_res_19_;
}
}
LEAN_EXPORT lean_object* l_pushLE(lean_object* v_ba_20_, uint64_t v_v_21_){
_start:
{
uint64_t v___x_22_; uint64_t v___x_23_; uint8_t v___x_24_; lean_object* v_ba_25_; uint64_t v___x_26_; uint64_t v___x_27_; uint64_t v___x_28_; uint8_t v___x_29_; lean_object* v_ba_30_; uint64_t v___x_31_; uint64_t v___x_32_; uint64_t v___x_33_; uint8_t v___x_34_; lean_object* v_ba_35_; uint64_t v___x_36_; uint64_t v___x_37_; uint64_t v___x_38_; uint8_t v___x_39_; lean_object* v_ba_40_; uint64_t v___x_41_; uint64_t v___x_42_; uint64_t v___x_43_; uint8_t v___x_44_; lean_object* v_ba_45_; uint64_t v___x_46_; uint64_t v___x_47_; uint64_t v___x_48_; uint8_t v___x_49_; lean_object* v_ba_50_; uint64_t v___x_51_; uint64_t v___x_52_; uint64_t v___x_53_; uint8_t v___x_54_; lean_object* v_ba_55_; uint64_t v___x_56_; uint64_t v___x_57_; uint64_t v___x_58_; uint8_t v___x_59_; lean_object* v___x_60_; 
v___x_22_ = 255ULL;
v___x_23_ = lean_uint64_land(v_v_21_, v___x_22_);
v___x_24_ = lean_uint64_to_uint8(v___x_23_);
v_ba_25_ = lean_byte_array_push(v_ba_20_, v___x_24_);
v___x_26_ = 8ULL;
v___x_27_ = lean_uint64_shift_right(v_v_21_, v___x_26_);
v___x_28_ = lean_uint64_land(v___x_27_, v___x_22_);
v___x_29_ = lean_uint64_to_uint8(v___x_28_);
v_ba_30_ = lean_byte_array_push(v_ba_25_, v___x_29_);
v___x_31_ = 16ULL;
v___x_32_ = lean_uint64_shift_right(v_v_21_, v___x_31_);
v___x_33_ = lean_uint64_land(v___x_32_, v___x_22_);
v___x_34_ = lean_uint64_to_uint8(v___x_33_);
v_ba_35_ = lean_byte_array_push(v_ba_30_, v___x_34_);
v___x_36_ = 24ULL;
v___x_37_ = lean_uint64_shift_right(v_v_21_, v___x_36_);
v___x_38_ = lean_uint64_land(v___x_37_, v___x_22_);
v___x_39_ = lean_uint64_to_uint8(v___x_38_);
v_ba_40_ = lean_byte_array_push(v_ba_35_, v___x_39_);
v___x_41_ = 32ULL;
v___x_42_ = lean_uint64_shift_right(v_v_21_, v___x_41_);
v___x_43_ = lean_uint64_land(v___x_42_, v___x_22_);
v___x_44_ = lean_uint64_to_uint8(v___x_43_);
v_ba_45_ = lean_byte_array_push(v_ba_40_, v___x_44_);
v___x_46_ = 40ULL;
v___x_47_ = lean_uint64_shift_right(v_v_21_, v___x_46_);
v___x_48_ = lean_uint64_land(v___x_47_, v___x_22_);
v___x_49_ = lean_uint64_to_uint8(v___x_48_);
v_ba_50_ = lean_byte_array_push(v_ba_45_, v___x_49_);
v___x_51_ = 48ULL;
v___x_52_ = lean_uint64_shift_right(v_v_21_, v___x_51_);
v___x_53_ = lean_uint64_land(v___x_52_, v___x_22_);
v___x_54_ = lean_uint64_to_uint8(v___x_53_);
v_ba_55_ = lean_byte_array_push(v_ba_50_, v___x_54_);
v___x_56_ = 56ULL;
v___x_57_ = lean_uint64_shift_right(v_v_21_, v___x_56_);
v___x_58_ = lean_uint64_land(v___x_57_, v___x_22_);
v___x_59_ = lean_uint64_to_uint8(v___x_58_);
v___x_60_ = lean_byte_array_push(v_ba_55_, v___x_59_);
return v___x_60_;
}
}
LEAN_EXPORT lean_object* l_pushLE___boxed(lean_object* v_ba_61_, lean_object* v_v_62_){
_start:
{
uint64_t v_v_boxed_63_; lean_object* v_res_64_; 
v_v_boxed_63_ = lean_unbox_uint64(v_v_62_);
lean_dec_ref(v_v_62_);
v_res_64_ = l_pushLE(v_ba_61_, v_v_boxed_63_);
return v_res_64_;
}
}
LEAN_EXPORT uint64_t l_readLE(lean_object* v_ba_65_, lean_object* v_off_66_){
_start:
{
uint8_t v___x_67_; uint64_t v___x_68_; lean_object* v___x_69_; lean_object* v___x_70_; uint8_t v___x_71_; uint64_t v___x_72_; uint64_t v___x_73_; uint64_t v___x_74_; uint64_t v___x_75_; lean_object* v___x_76_; lean_object* v___x_77_; uint8_t v___x_78_; uint64_t v___x_79_; uint64_t v___x_80_; uint64_t v___x_81_; uint64_t v___x_82_; lean_object* v___x_83_; lean_object* v___x_84_; uint8_t v___x_85_; uint64_t v___x_86_; uint64_t v___x_87_; uint64_t v___x_88_; uint64_t v___x_89_; lean_object* v___x_90_; lean_object* v___x_91_; uint8_t v___x_92_; uint64_t v___x_93_; uint64_t v___x_94_; uint64_t v___x_95_; uint64_t v___x_96_; lean_object* v___x_97_; lean_object* v___x_98_; uint8_t v___x_99_; uint64_t v___x_100_; uint64_t v___x_101_; uint64_t v___x_102_; uint64_t v___x_103_; lean_object* v___x_104_; lean_object* v___x_105_; uint8_t v___x_106_; uint64_t v___x_107_; uint64_t v___x_108_; uint64_t v___x_109_; uint64_t v___x_110_; lean_object* v___x_111_; lean_object* v___x_112_; uint8_t v___x_113_; uint64_t v___x_114_; uint64_t v___x_115_; uint64_t v___x_116_; uint64_t v___x_117_; 
v___x_67_ = lean_byte_array_get(v_ba_65_, v_off_66_);
v___x_68_ = lean_uint8_to_uint64(v___x_67_);
v___x_69_ = lean_unsigned_to_nat(1u);
v___x_70_ = lean_nat_add(v_off_66_, v___x_69_);
v___x_71_ = lean_byte_array_get(v_ba_65_, v___x_70_);
lean_dec(v___x_70_);
v___x_72_ = lean_uint8_to_uint64(v___x_71_);
v___x_73_ = 8ULL;
v___x_74_ = lean_uint64_shift_left(v___x_72_, v___x_73_);
v___x_75_ = lean_uint64_add(v___x_68_, v___x_74_);
v___x_76_ = lean_unsigned_to_nat(2u);
v___x_77_ = lean_nat_add(v_off_66_, v___x_76_);
v___x_78_ = lean_byte_array_get(v_ba_65_, v___x_77_);
lean_dec(v___x_77_);
v___x_79_ = lean_uint8_to_uint64(v___x_78_);
v___x_80_ = 16ULL;
v___x_81_ = lean_uint64_shift_left(v___x_79_, v___x_80_);
v___x_82_ = lean_uint64_add(v___x_75_, v___x_81_);
v___x_83_ = lean_unsigned_to_nat(3u);
v___x_84_ = lean_nat_add(v_off_66_, v___x_83_);
v___x_85_ = lean_byte_array_get(v_ba_65_, v___x_84_);
lean_dec(v___x_84_);
v___x_86_ = lean_uint8_to_uint64(v___x_85_);
v___x_87_ = 24ULL;
v___x_88_ = lean_uint64_shift_left(v___x_86_, v___x_87_);
v___x_89_ = lean_uint64_add(v___x_82_, v___x_88_);
v___x_90_ = lean_unsigned_to_nat(4u);
v___x_91_ = lean_nat_add(v_off_66_, v___x_90_);
v___x_92_ = lean_byte_array_get(v_ba_65_, v___x_91_);
lean_dec(v___x_91_);
v___x_93_ = lean_uint8_to_uint64(v___x_92_);
v___x_94_ = 32ULL;
v___x_95_ = lean_uint64_shift_left(v___x_93_, v___x_94_);
v___x_96_ = lean_uint64_add(v___x_89_, v___x_95_);
v___x_97_ = lean_unsigned_to_nat(5u);
v___x_98_ = lean_nat_add(v_off_66_, v___x_97_);
v___x_99_ = lean_byte_array_get(v_ba_65_, v___x_98_);
lean_dec(v___x_98_);
v___x_100_ = lean_uint8_to_uint64(v___x_99_);
v___x_101_ = 40ULL;
v___x_102_ = lean_uint64_shift_left(v___x_100_, v___x_101_);
v___x_103_ = lean_uint64_add(v___x_96_, v___x_102_);
v___x_104_ = lean_unsigned_to_nat(6u);
v___x_105_ = lean_nat_add(v_off_66_, v___x_104_);
v___x_106_ = lean_byte_array_get(v_ba_65_, v___x_105_);
lean_dec(v___x_105_);
v___x_107_ = lean_uint8_to_uint64(v___x_106_);
v___x_108_ = 48ULL;
v___x_109_ = lean_uint64_shift_left(v___x_107_, v___x_108_);
v___x_110_ = lean_uint64_add(v___x_103_, v___x_109_);
v___x_111_ = lean_unsigned_to_nat(7u);
v___x_112_ = lean_nat_add(v_off_66_, v___x_111_);
v___x_113_ = lean_byte_array_get(v_ba_65_, v___x_112_);
lean_dec(v___x_112_);
v___x_114_ = lean_uint8_to_uint64(v___x_113_);
v___x_115_ = 56ULL;
v___x_116_ = lean_uint64_shift_left(v___x_114_, v___x_115_);
v___x_117_ = lean_uint64_add(v___x_110_, v___x_116_);
return v___x_117_;
}
}
LEAN_EXPORT lean_object* l_readLE___boxed(lean_object* v_ba_118_, lean_object* v_off_119_){
_start:
{
uint64_t v_res_120_; lean_object* v_r_121_; 
v_res_120_ = l_readLE(v_ba_118_, v_off_119_);
lean_dec(v_off_119_);
lean_dec_ref(v_ba_118_);
v_r_121_ = lean_box_uint64(v_res_120_);
return v_r_121_;
}
}
static double _init_l_timeS___redArg___closed__0(void){
_start:
{
lean_object* v___x_122_; uint8_t v___x_123_; lean_object* v___x_124_; double v___x_125_; 
v___x_122_ = lean_unsigned_to_nat(1u);
v___x_123_ = 1;
v___x_124_ = lean_unsigned_to_nat(10000u);
v___x_125_ = l_Float_ofScientific(v___x_124_, v___x_123_, v___x_122_);
return v___x_125_;
}
}
LEAN_EXPORT lean_object* l_timeS___redArg(lean_object* v_act_126_){
_start:
{
lean_object* v___x_128_; lean_object* v___x_129_; 
v___x_128_ = lean_io_mono_ms_now();
v___x_129_ = lean_apply_1(v_act_126_, lean_box(0));
if (lean_obj_tag(v___x_129_) == 0)
{
lean_object* v_a_130_; lean_object* v___x_132_; uint8_t v_isShared_133_; uint8_t v_isSharedCheck_144_; 
v_a_130_ = lean_ctor_get(v___x_129_, 0);
v_isSharedCheck_144_ = !lean_is_exclusive(v___x_129_);
if (v_isSharedCheck_144_ == 0)
{
v___x_132_ = v___x_129_;
v_isShared_133_ = v_isSharedCheck_144_;
goto v_resetjp_131_;
}
else
{
lean_inc(v_a_130_);
lean_dec(v___x_129_);
v___x_132_ = lean_box(0);
v_isShared_133_ = v_isSharedCheck_144_;
goto v_resetjp_131_;
}
v_resetjp_131_:
{
lean_object* v___x_134_; lean_object* v___x_135_; double v___x_136_; double v___x_137_; double v___x_138_; lean_object* v___x_139_; lean_object* v___x_140_; lean_object* v___x_142_; 
v___x_134_ = lean_io_mono_ms_now();
v___x_135_ = lean_nat_sub(v___x_134_, v___x_128_);
lean_dec(v___x_128_);
lean_dec(v___x_134_);
v___x_136_ = lean_float_of_nat(v___x_135_);
v___x_137_ = lean_float_once(&l_timeS___redArg___closed__0, &l_timeS___redArg___closed__0_once, _init_l_timeS___redArg___closed__0);
v___x_138_ = lean_float_div(v___x_136_, v___x_137_);
v___x_139_ = lean_box_float(v___x_138_);
v___x_140_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_140_, 0, v_a_130_);
lean_ctor_set(v___x_140_, 1, v___x_139_);
if (v_isShared_133_ == 0)
{
lean_ctor_set(v___x_132_, 0, v___x_140_);
v___x_142_ = v___x_132_;
goto v_reusejp_141_;
}
else
{
lean_object* v_reuseFailAlloc_143_; 
v_reuseFailAlloc_143_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_143_, 0, v___x_140_);
v___x_142_ = v_reuseFailAlloc_143_;
goto v_reusejp_141_;
}
v_reusejp_141_:
{
return v___x_142_;
}
}
}
else
{
lean_object* v_a_145_; lean_object* v___x_147_; uint8_t v_isShared_148_; uint8_t v_isSharedCheck_152_; 
lean_dec(v___x_128_);
v_a_145_ = lean_ctor_get(v___x_129_, 0);
v_isSharedCheck_152_ = !lean_is_exclusive(v___x_129_);
if (v_isSharedCheck_152_ == 0)
{
v___x_147_ = v___x_129_;
v_isShared_148_ = v_isSharedCheck_152_;
goto v_resetjp_146_;
}
else
{
lean_inc(v_a_145_);
lean_dec(v___x_129_);
v___x_147_ = lean_box(0);
v_isShared_148_ = v_isSharedCheck_152_;
goto v_resetjp_146_;
}
v_resetjp_146_:
{
lean_object* v___x_150_; 
if (v_isShared_148_ == 0)
{
v___x_150_ = v___x_147_;
goto v_reusejp_149_;
}
else
{
lean_object* v_reuseFailAlloc_151_; 
v_reuseFailAlloc_151_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_151_, 0, v_a_145_);
v___x_150_ = v_reuseFailAlloc_151_;
goto v_reusejp_149_;
}
v_reusejp_149_:
{
return v___x_150_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_timeS___redArg___boxed(lean_object* v_act_153_, lean_object* v_a_154_){
_start:
{
lean_object* v_res_155_; 
v_res_155_ = l_timeS___redArg(v_act_153_);
return v_res_155_;
}
}
LEAN_EXPORT lean_object* l_timeS(lean_object* v_00_u03b1_156_, lean_object* v_act_157_){
_start:
{
lean_object* v___x_159_; 
v___x_159_ = l_timeS___redArg(v_act_157_);
return v___x_159_;
}
}
LEAN_EXPORT lean_object* l_timeS___boxed(lean_object* v_00_u03b1_160_, lean_object* v_act_161_, lean_object* v_a_162_){
_start:
{
lean_object* v_res_163_; 
v_res_163_ = l_timeS(v_00_u03b1_160_, v_act_161_);
return v_res_163_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg(lean_object* v_range_164_, lean_object* v_b_165_, lean_object* v_i_166_){
_start:
{
lean_object* v_stop_168_; lean_object* v_step_169_; uint8_t v___x_170_; 
v_stop_168_ = lean_ctor_get(v_range_164_, 1);
v_step_169_ = lean_ctor_get(v_range_164_, 2);
v___x_170_ = lean_nat_dec_lt(v_i_166_, v_stop_168_);
if (v___x_170_ == 0)
{
lean_object* v___x_171_; 
lean_dec(v_i_166_);
v___x_171_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_171_, 0, v_b_165_);
return v___x_171_;
}
else
{
lean_object* v_fst_172_; lean_object* v_snd_173_; lean_object* v___x_175_; uint8_t v_isShared_176_; uint8_t v_isSharedCheck_198_; 
v_fst_172_ = lean_ctor_get(v_b_165_, 0);
v_snd_173_ = lean_ctor_get(v_b_165_, 1);
v_isSharedCheck_198_ = !lean_is_exclusive(v_b_165_);
if (v_isSharedCheck_198_ == 0)
{
v___x_175_ = v_b_165_;
v_isShared_176_ = v_isSharedCheck_198_;
goto v_resetjp_174_;
}
else
{
lean_inc(v_snd_173_);
lean_inc(v_fst_172_);
lean_dec(v_b_165_);
v___x_175_ = lean_box(0);
v_isShared_176_ = v_isSharedCheck_198_;
goto v_resetjp_174_;
}
v_resetjp_174_:
{
uint64_t v___x_177_; uint64_t v___x_178_; uint64_t v___x_179_; uint64_t v___x_180_; uint64_t v_x_181_; uint64_t v___x_182_; uint64_t v___x_183_; uint64_t v_x_184_; uint64_t v___x_185_; uint64_t v___x_186_; uint64_t v_x_187_; uint64_t v___x_188_; uint64_t v___x_189_; lean_object* v___x_190_; lean_object* v___x_191_; lean_object* v___x_192_; lean_object* v___x_194_; 
v___x_177_ = 12ULL;
v___x_178_ = lean_unbox_uint64(v_fst_172_);
v___x_179_ = lean_uint64_shift_right(v___x_178_, v___x_177_);
v___x_180_ = lean_unbox_uint64(v_fst_172_);
lean_dec(v_fst_172_);
v_x_181_ = lean_uint64_xor(v___x_180_, v___x_179_);
v___x_182_ = 25ULL;
v___x_183_ = lean_uint64_shift_left(v_x_181_, v___x_182_);
v_x_184_ = lean_uint64_xor(v_x_181_, v___x_183_);
v___x_185_ = 27ULL;
v___x_186_ = lean_uint64_shift_right(v_x_184_, v___x_185_);
v_x_187_ = lean_uint64_xor(v_x_184_, v___x_186_);
v___x_188_ = 2685821657736338717ULL;
v___x_189_ = lean_uint64_mul(v_x_187_, v___x_188_);
v___x_190_ = lean_box_uint64(v___x_189_);
v___x_191_ = lean_array_push(v_snd_173_, v___x_190_);
v___x_192_ = lean_box_uint64(v_x_187_);
if (v_isShared_176_ == 0)
{
lean_ctor_set(v___x_175_, 1, v___x_191_);
lean_ctor_set(v___x_175_, 0, v___x_192_);
v___x_194_ = v___x_175_;
goto v_reusejp_193_;
}
else
{
lean_object* v_reuseFailAlloc_197_; 
v_reuseFailAlloc_197_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_197_, 0, v___x_192_);
lean_ctor_set(v_reuseFailAlloc_197_, 1, v___x_191_);
v___x_194_ = v_reuseFailAlloc_197_;
goto v_reusejp_193_;
}
v_reusejp_193_:
{
lean_object* v___x_195_; 
v___x_195_ = lean_nat_add(v_i_166_, v_step_169_);
lean_dec(v_i_166_);
v_b_165_ = v___x_194_;
v_i_166_ = v___x_195_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg___boxed(lean_object* v_range_199_, lean_object* v_b_200_, lean_object* v_i_201_, lean_object* v___y_202_){
_start:
{
lean_object* v_res_203_; 
v_res_203_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg(v_range_199_, v_b_200_, v_i_201_);
lean_dec_ref(v_range_199_);
return v_res_203_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(lean_object* v_hi_204_, uint64_t v_pivot_205_, lean_object* v_as_206_, lean_object* v_i_207_, lean_object* v_k_208_){
_start:
{
uint8_t v___x_209_; 
v___x_209_ = lean_nat_dec_lt(v_k_208_, v_hi_204_);
if (v___x_209_ == 0)
{
lean_object* v___x_210_; lean_object* v___x_211_; 
lean_dec(v_k_208_);
v___x_210_ = lean_array_fswap(v_as_206_, v_i_207_, v_hi_204_);
v___x_211_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_211_, 0, v_i_207_);
lean_ctor_set(v___x_211_, 1, v___x_210_);
return v___x_211_;
}
else
{
lean_object* v___x_212_; uint64_t v___x_213_; uint8_t v___x_214_; 
v___x_212_ = lean_array_fget_borrowed(v_as_206_, v_k_208_);
v___x_213_ = lean_unbox_uint64(v___x_212_);
v___x_214_ = lean_uint64_dec_lt(v___x_213_, v_pivot_205_);
if (v___x_214_ == 0)
{
lean_object* v___x_215_; lean_object* v___x_216_; 
v___x_215_ = lean_unsigned_to_nat(1u);
v___x_216_ = lean_nat_add(v_k_208_, v___x_215_);
lean_dec(v_k_208_);
v_k_208_ = v___x_216_;
goto _start;
}
else
{
lean_object* v___x_218_; lean_object* v___x_219_; lean_object* v___x_220_; lean_object* v___x_221_; 
v___x_218_ = lean_array_fswap(v_as_206_, v_i_207_, v_k_208_);
v___x_219_ = lean_unsigned_to_nat(1u);
v___x_220_ = lean_nat_add(v_i_207_, v___x_219_);
lean_dec(v_i_207_);
v___x_221_ = lean_nat_add(v_k_208_, v___x_219_);
lean_dec(v_k_208_);
v_as_206_ = v___x_218_;
v_i_207_ = v___x_220_;
v_k_208_ = v___x_221_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg___boxed(lean_object* v_hi_223_, lean_object* v_pivot_224_, lean_object* v_as_225_, lean_object* v_i_226_, lean_object* v_k_227_){
_start:
{
uint64_t v_pivot_boxed_228_; lean_object* v_res_229_; 
v_pivot_boxed_228_ = lean_unbox_uint64(v_pivot_224_);
lean_dec_ref(v_pivot_224_);
v_res_229_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(v_hi_223_, v_pivot_boxed_228_, v_as_225_, v_i_226_, v_k_227_);
lean_dec(v_hi_223_);
return v_res_229_;
}
}
LEAN_EXPORT uint8_t l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(uint64_t v_x_230_, uint64_t v_y_231_){
_start:
{
uint8_t v___x_232_; 
v___x_232_ = lean_uint64_dec_lt(v_x_230_, v_y_231_);
if (v___x_232_ == 0)
{
uint8_t v___x_233_; 
v___x_233_ = lean_uint64_dec_eq(v_x_230_, v_y_231_);
if (v___x_233_ == 0)
{
return v___x_233_;
}
else
{
return v___x_232_;
}
}
else
{
return v___x_232_;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0___boxed(lean_object* v_x_234_, lean_object* v_y_235_){
_start:
{
uint64_t v_x_boxed_236_; uint64_t v_y_boxed_237_; uint8_t v_res_238_; lean_object* v_r_239_; 
v_x_boxed_236_ = lean_unbox_uint64(v_x_234_);
lean_dec_ref(v_x_234_);
v_y_boxed_237_ = lean_unbox_uint64(v_y_235_);
lean_dec_ref(v_y_235_);
v_res_238_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_x_boxed_236_, v_y_boxed_237_);
v_r_239_ = lean_box(v_res_238_);
return v_r_239_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(lean_object* v_n_240_, lean_object* v_as_241_, lean_object* v_lo_242_, lean_object* v_hi_243_){
_start:
{
lean_object* v___y_245_; uint8_t v___x_256_; 
v___x_256_ = lean_nat_dec_lt(v_lo_242_, v_hi_243_);
if (v___x_256_ == 0)
{
lean_dec(v_lo_242_);
return v_as_241_;
}
else
{
lean_object* v___x_257_; lean_object* v___x_258_; lean_object* v_mid_259_; lean_object* v___y_261_; lean_object* v___y_269_; lean_object* v___x_276_; lean_object* v___x_277_; uint64_t v___x_278_; uint64_t v___x_279_; uint8_t v___x_280_; 
v___x_257_ = lean_nat_add(v_lo_242_, v_hi_243_);
v___x_258_ = lean_unsigned_to_nat(1u);
v_mid_259_ = lean_nat_shiftr(v___x_257_, v___x_258_);
lean_dec(v___x_257_);
v___x_276_ = lean_array_fget_borrowed(v_as_241_, v_mid_259_);
v___x_277_ = lean_array_fget_borrowed(v_as_241_, v_lo_242_);
v___x_278_ = lean_unbox_uint64(v___x_276_);
v___x_279_ = lean_unbox_uint64(v___x_277_);
v___x_280_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v___x_278_, v___x_279_);
if (v___x_280_ == 0)
{
v___y_269_ = v_as_241_;
goto v___jp_268_;
}
else
{
lean_object* v___x_281_; 
v___x_281_ = lean_array_fswap(v_as_241_, v_lo_242_, v_mid_259_);
v___y_269_ = v___x_281_;
goto v___jp_268_;
}
v___jp_260_:
{
lean_object* v___x_262_; lean_object* v___x_263_; uint64_t v___x_264_; uint64_t v___x_265_; uint8_t v___x_266_; 
v___x_262_ = lean_array_fget_borrowed(v___y_261_, v_mid_259_);
v___x_263_ = lean_array_fget_borrowed(v___y_261_, v_hi_243_);
v___x_264_ = lean_unbox_uint64(v___x_262_);
v___x_265_ = lean_unbox_uint64(v___x_263_);
v___x_266_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v___x_264_, v___x_265_);
if (v___x_266_ == 0)
{
lean_dec(v_mid_259_);
v___y_245_ = v___y_261_;
goto v___jp_244_;
}
else
{
lean_object* v___x_267_; 
v___x_267_ = lean_array_fswap(v___y_261_, v_mid_259_, v_hi_243_);
lean_dec(v_mid_259_);
v___y_245_ = v___x_267_;
goto v___jp_244_;
}
}
v___jp_268_:
{
lean_object* v___x_270_; lean_object* v___x_271_; uint64_t v___x_272_; uint64_t v___x_273_; uint8_t v___x_274_; 
v___x_270_ = lean_array_fget_borrowed(v___y_269_, v_hi_243_);
v___x_271_ = lean_array_fget_borrowed(v___y_269_, v_lo_242_);
v___x_272_ = lean_unbox_uint64(v___x_270_);
v___x_273_ = lean_unbox_uint64(v___x_271_);
v___x_274_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v___x_272_, v___x_273_);
if (v___x_274_ == 0)
{
v___y_261_ = v___y_269_;
goto v___jp_260_;
}
else
{
lean_object* v___x_275_; 
v___x_275_ = lean_array_fswap(v___y_269_, v_lo_242_, v_hi_243_);
v___y_261_ = v___x_275_;
goto v___jp_260_;
}
}
}
v___jp_244_:
{
lean_object* v_pivot_246_; uint64_t v___x_247_; lean_object* v___x_248_; lean_object* v_fst_249_; lean_object* v_snd_250_; uint8_t v___x_251_; 
v_pivot_246_ = lean_array_fget_borrowed(v___y_245_, v_hi_243_);
v___x_247_ = lean_unbox_uint64(v_pivot_246_);
lean_inc_n(v_lo_242_, 2);
v___x_248_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(v_hi_243_, v___x_247_, v___y_245_, v_lo_242_, v_lo_242_);
v_fst_249_ = lean_ctor_get(v___x_248_, 0);
lean_inc(v_fst_249_);
v_snd_250_ = lean_ctor_get(v___x_248_, 1);
lean_inc(v_snd_250_);
lean_dec_ref(v___x_248_);
v___x_251_ = lean_nat_dec_le(v_hi_243_, v_fst_249_);
if (v___x_251_ == 0)
{
lean_object* v___x_252_; lean_object* v___x_253_; lean_object* v___x_254_; 
v___x_252_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v_n_240_, v_snd_250_, v_lo_242_, v_fst_249_);
v___x_253_ = lean_unsigned_to_nat(1u);
v___x_254_ = lean_nat_add(v_fst_249_, v___x_253_);
lean_dec(v_fst_249_);
v_as_241_ = v___x_252_;
v_lo_242_ = v___x_254_;
goto _start;
}
else
{
lean_dec(v_fst_249_);
lean_dec(v_lo_242_);
return v_snd_250_;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___boxed(lean_object* v_n_282_, lean_object* v_as_283_, lean_object* v_lo_284_, lean_object* v_hi_285_){
_start:
{
lean_object* v_res_286_; 
v_res_286_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v_n_282_, v_as_283_, v_lo_284_, v_hi_285_);
lean_dec(v_hi_285_);
lean_dec(v_n_282_);
return v_res_286_;
}
}
LEAN_EXPORT lean_object* l_Array_qsortOrd___at___00main_spec__1(lean_object* v_xs_287_){
_start:
{
lean_object* v___x_288_; lean_object* v___x_289_; uint8_t v___x_290_; 
v___x_288_ = lean_array_get_size(v_xs_287_);
v___x_289_ = lean_unsigned_to_nat(0u);
v___x_290_ = lean_nat_dec_eq(v___x_288_, v___x_289_);
if (v___x_290_ == 0)
{
lean_object* v___x_291_; lean_object* v___x_292_; lean_object* v___y_294_; uint8_t v___x_298_; 
v___x_291_ = lean_unsigned_to_nat(1u);
v___x_292_ = lean_nat_sub(v___x_288_, v___x_291_);
v___x_298_ = lean_nat_dec_le(v___x_289_, v___x_292_);
if (v___x_298_ == 0)
{
lean_inc(v___x_292_);
v___y_294_ = v___x_292_;
goto v___jp_293_;
}
else
{
v___y_294_ = v___x_289_;
goto v___jp_293_;
}
v___jp_293_:
{
uint8_t v___x_295_; 
v___x_295_ = lean_nat_dec_le(v___y_294_, v___x_292_);
if (v___x_295_ == 0)
{
lean_object* v___x_296_; 
lean_dec(v___x_292_);
lean_inc(v___y_294_);
v___x_296_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_288_, v_xs_287_, v___y_294_, v___y_294_);
lean_dec(v___y_294_);
return v___x_296_;
}
else
{
lean_object* v___x_297_; 
v___x_297_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_288_, v_xs_287_, v___y_294_, v___x_292_);
lean_dec(v___x_292_);
return v___x_297_;
}
}
}
else
{
return v_xs_287_;
}
}
}
LEAN_EXPORT lean_object* l_main___lam__0(lean_object* v___x_299_, lean_object* v___x_300_, lean_object* v___x_301_){
_start:
{
lean_object* v___x_303_; lean_object* v_a_304_; lean_object* v___x_306_; uint8_t v_isShared_307_; uint8_t v_isSharedCheck_313_; 
v___x_303_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg(v___x_299_, v___x_300_, v___x_301_);
v_a_304_ = lean_ctor_get(v___x_303_, 0);
v_isSharedCheck_313_ = !lean_is_exclusive(v___x_303_);
if (v_isSharedCheck_313_ == 0)
{
v___x_306_ = v___x_303_;
v_isShared_307_ = v_isSharedCheck_313_;
goto v_resetjp_305_;
}
else
{
lean_inc(v_a_304_);
lean_dec(v___x_303_);
v___x_306_ = lean_box(0);
v_isShared_307_ = v_isSharedCheck_313_;
goto v_resetjp_305_;
}
v_resetjp_305_:
{
lean_object* v_snd_308_; lean_object* v___x_309_; lean_object* v___x_311_; 
v_snd_308_ = lean_ctor_get(v_a_304_, 1);
lean_inc(v_snd_308_);
lean_dec(v_a_304_);
v___x_309_ = l_Array_qsortOrd___at___00main_spec__1(v_snd_308_);
if (v_isShared_307_ == 0)
{
lean_ctor_set(v___x_306_, 0, v___x_309_);
v___x_311_ = v___x_306_;
goto v_reusejp_310_;
}
else
{
lean_object* v_reuseFailAlloc_312_; 
v_reuseFailAlloc_312_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_312_, 0, v___x_309_);
v___x_311_ = v_reuseFailAlloc_312_;
goto v_reusejp_310_;
}
v_reusejp_310_:
{
return v___x_311_;
}
}
}
}
LEAN_EXPORT lean_object* l_main___lam__0___boxed(lean_object* v___x_314_, lean_object* v___x_315_, lean_object* v___x_316_, lean_object* v___y_317_){
_start:
{
lean_object* v_res_318_; 
v_res_318_ = l_main___lam__0(v___x_314_, v___x_315_, v___x_316_);
lean_dec_ref(v___x_314_);
return v_res_318_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(lean_object* v_a_319_, lean_object* v_range_320_, lean_object* v_b_321_, lean_object* v_i_322_){
_start:
{
lean_object* v_stop_324_; lean_object* v_step_325_; uint8_t v___x_326_; 
v_stop_324_ = lean_ctor_get(v_range_320_, 1);
v_step_325_ = lean_ctor_get(v_range_320_, 2);
v___x_326_ = lean_nat_dec_lt(v_i_322_, v_stop_324_);
if (v___x_326_ == 0)
{
lean_object* v___x_327_; 
lean_dec(v_i_322_);
v___x_327_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_327_, 0, v_b_321_);
return v___x_327_;
}
else
{
lean_object* v___x_328_; lean_object* v___x_329_; uint8_t v___x_330_; uint64_t v___x_331_; lean_object* v___x_332_; lean_object* v___x_333_; uint8_t v___x_334_; uint64_t v___x_335_; uint64_t v___x_336_; uint64_t v___x_337_; uint64_t v___x_338_; lean_object* v___x_339_; lean_object* v___x_340_; uint8_t v___x_341_; uint64_t v___x_342_; uint64_t v___x_343_; uint64_t v___x_344_; uint64_t v___x_345_; lean_object* v___x_346_; lean_object* v___x_347_; uint8_t v___x_348_; uint64_t v___x_349_; uint64_t v___x_350_; uint64_t v___x_351_; uint64_t v___x_352_; lean_object* v___x_353_; lean_object* v___x_354_; uint8_t v___x_355_; uint64_t v___x_356_; uint64_t v___x_357_; uint64_t v___x_358_; uint64_t v___x_359_; lean_object* v___x_360_; lean_object* v___x_361_; uint8_t v___x_362_; uint64_t v___x_363_; uint64_t v___x_364_; uint64_t v___x_365_; uint64_t v___x_366_; lean_object* v___x_367_; lean_object* v___x_368_; uint8_t v___x_369_; uint64_t v___x_370_; uint64_t v___x_371_; uint64_t v___x_372_; uint64_t v___x_373_; lean_object* v___x_374_; lean_object* v___x_375_; uint8_t v___x_376_; uint64_t v___x_377_; uint64_t v___x_378_; uint64_t v___x_379_; uint64_t v___x_380_; lean_object* v___x_381_; lean_object* v___x_382_; lean_object* v___x_383_; 
v___x_328_ = lean_unsigned_to_nat(8u);
v___x_329_ = lean_nat_mul(v_i_322_, v___x_328_);
v___x_330_ = lean_byte_array_get(v_a_319_, v___x_329_);
v___x_331_ = lean_uint8_to_uint64(v___x_330_);
v___x_332_ = lean_unsigned_to_nat(1u);
v___x_333_ = lean_nat_add(v___x_329_, v___x_332_);
v___x_334_ = lean_byte_array_get(v_a_319_, v___x_333_);
lean_dec(v___x_333_);
v___x_335_ = lean_uint8_to_uint64(v___x_334_);
v___x_336_ = 8ULL;
v___x_337_ = lean_uint64_shift_left(v___x_335_, v___x_336_);
v___x_338_ = lean_uint64_add(v___x_331_, v___x_337_);
v___x_339_ = lean_unsigned_to_nat(2u);
v___x_340_ = lean_nat_add(v___x_329_, v___x_339_);
v___x_341_ = lean_byte_array_get(v_a_319_, v___x_340_);
lean_dec(v___x_340_);
v___x_342_ = lean_uint8_to_uint64(v___x_341_);
v___x_343_ = 16ULL;
v___x_344_ = lean_uint64_shift_left(v___x_342_, v___x_343_);
v___x_345_ = lean_uint64_add(v___x_338_, v___x_344_);
v___x_346_ = lean_unsigned_to_nat(3u);
v___x_347_ = lean_nat_add(v___x_329_, v___x_346_);
v___x_348_ = lean_byte_array_get(v_a_319_, v___x_347_);
lean_dec(v___x_347_);
v___x_349_ = lean_uint8_to_uint64(v___x_348_);
v___x_350_ = 24ULL;
v___x_351_ = lean_uint64_shift_left(v___x_349_, v___x_350_);
v___x_352_ = lean_uint64_add(v___x_345_, v___x_351_);
v___x_353_ = lean_unsigned_to_nat(4u);
v___x_354_ = lean_nat_add(v___x_329_, v___x_353_);
v___x_355_ = lean_byte_array_get(v_a_319_, v___x_354_);
lean_dec(v___x_354_);
v___x_356_ = lean_uint8_to_uint64(v___x_355_);
v___x_357_ = 32ULL;
v___x_358_ = lean_uint64_shift_left(v___x_356_, v___x_357_);
v___x_359_ = lean_uint64_add(v___x_352_, v___x_358_);
v___x_360_ = lean_unsigned_to_nat(5u);
v___x_361_ = lean_nat_add(v___x_329_, v___x_360_);
v___x_362_ = lean_byte_array_get(v_a_319_, v___x_361_);
lean_dec(v___x_361_);
v___x_363_ = lean_uint8_to_uint64(v___x_362_);
v___x_364_ = 40ULL;
v___x_365_ = lean_uint64_shift_left(v___x_363_, v___x_364_);
v___x_366_ = lean_uint64_add(v___x_359_, v___x_365_);
v___x_367_ = lean_unsigned_to_nat(6u);
v___x_368_ = lean_nat_add(v___x_329_, v___x_367_);
v___x_369_ = lean_byte_array_get(v_a_319_, v___x_368_);
lean_dec(v___x_368_);
v___x_370_ = lean_uint8_to_uint64(v___x_369_);
v___x_371_ = 48ULL;
v___x_372_ = lean_uint64_shift_left(v___x_370_, v___x_371_);
v___x_373_ = lean_uint64_add(v___x_366_, v___x_372_);
v___x_374_ = lean_unsigned_to_nat(7u);
v___x_375_ = lean_nat_add(v___x_329_, v___x_374_);
lean_dec(v___x_329_);
v___x_376_ = lean_byte_array_get(v_a_319_, v___x_375_);
lean_dec(v___x_375_);
v___x_377_ = lean_uint8_to_uint64(v___x_376_);
v___x_378_ = 56ULL;
v___x_379_ = lean_uint64_shift_left(v___x_377_, v___x_378_);
v___x_380_ = lean_uint64_add(v___x_373_, v___x_379_);
v___x_381_ = lean_box_uint64(v___x_380_);
v___x_382_ = lean_array_push(v_b_321_, v___x_381_);
v___x_383_ = lean_nat_add(v_i_322_, v_step_325_);
lean_dec(v_i_322_);
v_b_321_ = v___x_382_;
v_i_322_ = v___x_383_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg___boxed(lean_object* v_a_385_, lean_object* v_range_386_, lean_object* v_b_387_, lean_object* v_i_388_, lean_object* v___y_389_){
_start:
{
lean_object* v_res_390_; 
v_res_390_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(v_a_385_, v_range_386_, v_b_387_, v_i_388_);
lean_dec_ref(v_range_386_);
lean_dec_ref(v_a_385_);
return v_res_390_;
}
}
LEAN_EXPORT lean_object* l_main___lam__1(lean_object* v_snd_391_, lean_object* v___x_392_, lean_object* v_arr_393_, lean_object* v___x_394_){
_start:
{
lean_object* v___x_396_; 
v___x_396_ = l_IO_FS_readBinFile(v_snd_391_);
if (lean_obj_tag(v___x_396_) == 0)
{
lean_object* v_a_397_; lean_object* v___x_398_; 
v_a_397_ = lean_ctor_get(v___x_396_, 0);
lean_inc(v_a_397_);
lean_dec_ref_known(v___x_396_, 1);
v___x_398_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(v_a_397_, v___x_392_, v_arr_393_, v___x_394_);
lean_dec(v_a_397_);
return v___x_398_;
}
else
{
lean_object* v_a_399_; lean_object* v___x_401_; uint8_t v_isShared_402_; uint8_t v_isSharedCheck_406_; 
lean_dec(v___x_394_);
lean_dec_ref(v_arr_393_);
v_a_399_ = lean_ctor_get(v___x_396_, 0);
v_isSharedCheck_406_ = !lean_is_exclusive(v___x_396_);
if (v_isSharedCheck_406_ == 0)
{
v___x_401_ = v___x_396_;
v_isShared_402_ = v_isSharedCheck_406_;
goto v_resetjp_400_;
}
else
{
lean_inc(v_a_399_);
lean_dec(v___x_396_);
v___x_401_ = lean_box(0);
v_isShared_402_ = v_isSharedCheck_406_;
goto v_resetjp_400_;
}
v_resetjp_400_:
{
lean_object* v___x_404_; 
if (v_isShared_402_ == 0)
{
v___x_404_ = v___x_401_;
goto v_reusejp_403_;
}
else
{
lean_object* v_reuseFailAlloc_405_; 
v_reuseFailAlloc_405_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_405_, 0, v_a_399_);
v___x_404_ = v_reuseFailAlloc_405_;
goto v_reusejp_403_;
}
v_reusejp_403_:
{
return v___x_404_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_main___lam__1___boxed(lean_object* v_snd_407_, lean_object* v___x_408_, lean_object* v_arr_409_, lean_object* v___x_410_, lean_object* v___y_411_){
_start:
{
lean_object* v_res_412_; 
v_res_412_ = l_main___lam__1(v_snd_407_, v___x_408_, v_arr_409_, v___x_410_);
lean_dec_ref(v___x_408_);
lean_dec_ref(v_snd_407_);
return v_res_412_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(lean_object* v_fst_415_, lean_object* v_range_416_, lean_object* v_b_417_, lean_object* v_i_418_){
_start:
{
lean_object* v_stop_420_; lean_object* v_step_421_; uint8_t v___x_422_; 
v_stop_420_ = lean_ctor_get(v_range_416_, 1);
v_step_421_ = lean_ctor_get(v_range_416_, 2);
v___x_422_ = lean_nat_dec_lt(v_i_418_, v_stop_420_);
if (v___x_422_ == 0)
{
lean_object* v___x_423_; 
lean_dec(v_i_418_);
v___x_423_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_423_, 0, v_b_417_);
return v___x_423_;
}
else
{
lean_object* v___x_424_; lean_object* v___x_425_; uint64_t v___x_426_; uint64_t v___x_427_; uint64_t v___x_428_; uint8_t v___x_429_; lean_object* v_ba_430_; uint64_t v___x_431_; uint64_t v___x_432_; uint64_t v___x_433_; uint64_t v___x_434_; uint8_t v___x_435_; lean_object* v_ba_436_; uint64_t v___x_437_; uint64_t v___x_438_; uint64_t v___x_439_; uint64_t v___x_440_; uint8_t v___x_441_; lean_object* v_ba_442_; uint64_t v___x_443_; uint64_t v___x_444_; uint64_t v___x_445_; uint64_t v___x_446_; uint8_t v___x_447_; lean_object* v_ba_448_; uint64_t v___x_449_; uint64_t v___x_450_; uint64_t v___x_451_; uint64_t v___x_452_; uint8_t v___x_453_; lean_object* v_ba_454_; uint64_t v___x_455_; uint64_t v___x_456_; uint64_t v___x_457_; uint64_t v___x_458_; uint8_t v___x_459_; lean_object* v_ba_460_; uint64_t v___x_461_; uint64_t v___x_462_; uint64_t v___x_463_; uint64_t v___x_464_; uint8_t v___x_465_; lean_object* v_ba_466_; uint64_t v___x_467_; uint64_t v___x_468_; uint64_t v___x_469_; uint64_t v___x_470_; uint8_t v___x_471_; lean_object* v___x_472_; lean_object* v___x_473_; 
v___x_424_ = ((lean_object*)(l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed__const__1));
v___x_425_ = lean_array_get_borrowed(v___x_424_, v_fst_415_, v_i_418_);
v___x_426_ = 255ULL;
v___x_427_ = lean_unbox_uint64(v___x_425_);
v___x_428_ = lean_uint64_land(v___x_427_, v___x_426_);
v___x_429_ = lean_uint64_to_uint8(v___x_428_);
v_ba_430_ = lean_byte_array_push(v_b_417_, v___x_429_);
v___x_431_ = 8ULL;
v___x_432_ = lean_unbox_uint64(v___x_425_);
v___x_433_ = lean_uint64_shift_right(v___x_432_, v___x_431_);
v___x_434_ = lean_uint64_land(v___x_433_, v___x_426_);
v___x_435_ = lean_uint64_to_uint8(v___x_434_);
v_ba_436_ = lean_byte_array_push(v_ba_430_, v___x_435_);
v___x_437_ = 16ULL;
v___x_438_ = lean_unbox_uint64(v___x_425_);
v___x_439_ = lean_uint64_shift_right(v___x_438_, v___x_437_);
v___x_440_ = lean_uint64_land(v___x_439_, v___x_426_);
v___x_441_ = lean_uint64_to_uint8(v___x_440_);
v_ba_442_ = lean_byte_array_push(v_ba_436_, v___x_441_);
v___x_443_ = 24ULL;
v___x_444_ = lean_unbox_uint64(v___x_425_);
v___x_445_ = lean_uint64_shift_right(v___x_444_, v___x_443_);
v___x_446_ = lean_uint64_land(v___x_445_, v___x_426_);
v___x_447_ = lean_uint64_to_uint8(v___x_446_);
v_ba_448_ = lean_byte_array_push(v_ba_442_, v___x_447_);
v___x_449_ = 32ULL;
v___x_450_ = lean_unbox_uint64(v___x_425_);
v___x_451_ = lean_uint64_shift_right(v___x_450_, v___x_449_);
v___x_452_ = lean_uint64_land(v___x_451_, v___x_426_);
v___x_453_ = lean_uint64_to_uint8(v___x_452_);
v_ba_454_ = lean_byte_array_push(v_ba_448_, v___x_453_);
v___x_455_ = 40ULL;
v___x_456_ = lean_unbox_uint64(v___x_425_);
v___x_457_ = lean_uint64_shift_right(v___x_456_, v___x_455_);
v___x_458_ = lean_uint64_land(v___x_457_, v___x_426_);
v___x_459_ = lean_uint64_to_uint8(v___x_458_);
v_ba_460_ = lean_byte_array_push(v_ba_454_, v___x_459_);
v___x_461_ = 48ULL;
v___x_462_ = lean_unbox_uint64(v___x_425_);
v___x_463_ = lean_uint64_shift_right(v___x_462_, v___x_461_);
v___x_464_ = lean_uint64_land(v___x_463_, v___x_426_);
v___x_465_ = lean_uint64_to_uint8(v___x_464_);
v_ba_466_ = lean_byte_array_push(v_ba_460_, v___x_465_);
v___x_467_ = 56ULL;
v___x_468_ = lean_unbox_uint64(v___x_425_);
v___x_469_ = lean_uint64_shift_right(v___x_468_, v___x_467_);
v___x_470_ = lean_uint64_land(v___x_469_, v___x_426_);
v___x_471_ = lean_uint64_to_uint8(v___x_470_);
v___x_472_ = lean_byte_array_push(v_ba_466_, v___x_471_);
v___x_473_ = lean_nat_add(v_i_418_, v_step_421_);
lean_dec(v_i_418_);
v_b_417_ = v___x_472_;
v_i_418_ = v___x_473_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed(lean_object* v_fst_475_, lean_object* v_range_476_, lean_object* v_b_477_, lean_object* v_i_478_, lean_object* v___y_479_){
_start:
{
lean_object* v_res_480_; 
v_res_480_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(v_fst_475_, v_range_476_, v_b_477_, v_i_478_);
lean_dec_ref(v_range_476_);
lean_dec_ref(v_fst_475_);
return v_res_480_;
}
}
LEAN_EXPORT lean_object* l_main___lam__2(lean_object* v_fst_481_, lean_object* v___x_482_, lean_object* v___x_483_, lean_object* v___x_484_, lean_object* v_snd_485_){
_start:
{
lean_object* v___x_487_; lean_object* v_a_488_; lean_object* v___x_489_; 
v___x_487_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(v_fst_481_, v___x_482_, v___x_483_, v___x_484_);
v_a_488_ = lean_ctor_get(v___x_487_, 0);
lean_inc(v_a_488_);
lean_dec_ref(v___x_487_);
v___x_489_ = l_IO_FS_writeBinFile(v_snd_485_, v_a_488_);
lean_dec(v_a_488_);
return v___x_489_;
}
}
LEAN_EXPORT lean_object* l_main___lam__2___boxed(lean_object* v_fst_490_, lean_object* v___x_491_, lean_object* v___x_492_, lean_object* v___x_493_, lean_object* v_snd_494_, lean_object* v___y_495_){
_start:
{
lean_object* v_res_496_; 
v_res_496_ = l_main___lam__2(v_fst_490_, v___x_491_, v___x_492_, v___x_493_, v_snd_494_);
lean_dec_ref(v_snd_494_);
lean_dec_ref(v___x_491_);
lean_dec_ref(v_fst_490_);
return v_res_496_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(lean_object* v_range_497_, lean_object* v_b_498_, lean_object* v_i_499_){
_start:
{
lean_object* v_stop_501_; lean_object* v_step_502_; uint8_t v___x_503_; 
v_stop_501_ = lean_ctor_get(v_range_497_, 1);
v_step_502_ = lean_ctor_get(v_range_497_, 2);
v___x_503_ = lean_nat_dec_lt(v_i_499_, v_stop_501_);
if (v___x_503_ == 0)
{
lean_object* v___x_504_; 
lean_dec(v_i_499_);
v___x_504_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_504_, 0, v_b_498_);
return v___x_504_;
}
else
{
lean_object* v_fst_505_; lean_object* v_snd_506_; lean_object* v___x_508_; uint8_t v_isShared_509_; uint8_t v_isSharedCheck_537_; 
v_fst_505_ = lean_ctor_get(v_b_498_, 0);
v_snd_506_ = lean_ctor_get(v_b_498_, 1);
v_isSharedCheck_537_ = !lean_is_exclusive(v_b_498_);
if (v_isSharedCheck_537_ == 0)
{
v___x_508_ = v_b_498_;
v_isShared_509_ = v_isSharedCheck_537_;
goto v_resetjp_507_;
}
else
{
lean_inc(v_snd_506_);
lean_inc(v_fst_505_);
lean_dec(v_b_498_);
v___x_508_ = lean_box(0);
v_isShared_509_ = v_isSharedCheck_537_;
goto v_resetjp_507_;
}
v_resetjp_507_:
{
lean_object* v___x_510_; lean_object* v___x_511_; lean_object* v___x_512_; uint64_t v___x_513_; uint64_t v___x_514_; uint64_t v___x_515_; uint64_t v___x_516_; uint64_t v_x_517_; uint64_t v___x_518_; uint64_t v___x_519_; uint64_t v_x_520_; uint64_t v___x_521_; uint64_t v___x_522_; uint64_t v_x_523_; uint64_t v___x_524_; uint64_t v___x_525_; lean_object* v___x_526_; uint64_t v___x_527_; uint64_t v___x_528_; lean_object* v___x_529_; lean_object* v___x_530_; lean_object* v___x_531_; lean_object* v___x_533_; 
v___x_510_ = lean_unsigned_to_nat(6249999u);
v___x_511_ = lean_unsigned_to_nat(1u);
v___x_512_ = lean_nat_sub(v___x_510_, v_i_499_);
v___x_513_ = 12ULL;
v___x_514_ = lean_unbox_uint64(v_snd_506_);
v___x_515_ = lean_uint64_shift_right(v___x_514_, v___x_513_);
v___x_516_ = lean_unbox_uint64(v_snd_506_);
lean_dec(v_snd_506_);
v_x_517_ = lean_uint64_xor(v___x_516_, v___x_515_);
v___x_518_ = 25ULL;
v___x_519_ = lean_uint64_shift_left(v_x_517_, v___x_518_);
v_x_520_ = lean_uint64_xor(v_x_517_, v___x_519_);
v___x_521_ = 27ULL;
v___x_522_ = lean_uint64_shift_right(v_x_520_, v___x_521_);
v_x_523_ = lean_uint64_xor(v_x_520_, v___x_522_);
v___x_524_ = 2685821657736338717ULL;
v___x_525_ = lean_uint64_mul(v_x_523_, v___x_524_);
v___x_526_ = lean_nat_add(v___x_512_, v___x_511_);
v___x_527_ = lean_uint64_of_nat(v___x_526_);
lean_dec(v___x_526_);
v___x_528_ = lean_uint64_mod(v___x_525_, v___x_527_);
v___x_529_ = lean_uint64_to_nat(v___x_528_);
v___x_530_ = lean_array_swap(v_fst_505_, v___x_512_, v___x_529_);
lean_dec(v___x_529_);
lean_dec(v___x_512_);
v___x_531_ = lean_box_uint64(v_x_523_);
if (v_isShared_509_ == 0)
{
lean_ctor_set(v___x_508_, 1, v___x_531_);
lean_ctor_set(v___x_508_, 0, v___x_530_);
v___x_533_ = v___x_508_;
goto v_reusejp_532_;
}
else
{
lean_object* v_reuseFailAlloc_536_; 
v_reuseFailAlloc_536_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_536_, 0, v___x_530_);
lean_ctor_set(v_reuseFailAlloc_536_, 1, v___x_531_);
v___x_533_ = v_reuseFailAlloc_536_;
goto v_reusejp_532_;
}
v_reusejp_532_:
{
lean_object* v___x_534_; 
v___x_534_ = lean_nat_add(v_i_499_, v_step_502_);
lean_dec(v_i_499_);
v_b_498_ = v___x_533_;
v_i_499_ = v___x_534_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg___boxed(lean_object* v_range_538_, lean_object* v_b_539_, lean_object* v_i_540_, lean_object* v___y_541_){
_start:
{
lean_object* v_res_542_; 
v_res_542_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(v_range_538_, v_b_539_, v_i_540_);
lean_dec_ref(v_range_538_);
return v_res_542_;
}
}
LEAN_EXPORT lean_object* l_main___lam__3(lean_object* v___x_543_, lean_object* v___x_544_, lean_object* v___x_545_){
_start:
{
lean_object* v___x_547_; lean_object* v_a_548_; lean_object* v___x_550_; uint8_t v_isShared_551_; uint8_t v_isSharedCheck_556_; 
v___x_547_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(v___x_543_, v___x_544_, v___x_545_);
v_a_548_ = lean_ctor_get(v___x_547_, 0);
v_isSharedCheck_556_ = !lean_is_exclusive(v___x_547_);
if (v_isSharedCheck_556_ == 0)
{
v___x_550_ = v___x_547_;
v_isShared_551_ = v_isSharedCheck_556_;
goto v_resetjp_549_;
}
else
{
lean_inc(v_a_548_);
lean_dec(v___x_547_);
v___x_550_ = lean_box(0);
v_isShared_551_ = v_isSharedCheck_556_;
goto v_resetjp_549_;
}
v_resetjp_549_:
{
lean_object* v_fst_552_; lean_object* v___x_554_; 
v_fst_552_ = lean_ctor_get(v_a_548_, 0);
lean_inc(v_fst_552_);
lean_dec(v_a_548_);
if (v_isShared_551_ == 0)
{
lean_ctor_set(v___x_550_, 0, v_fst_552_);
v___x_554_ = v___x_550_;
goto v_reusejp_553_;
}
else
{
lean_object* v_reuseFailAlloc_555_; 
v_reuseFailAlloc_555_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_555_, 0, v_fst_552_);
v___x_554_ = v_reuseFailAlloc_555_;
goto v_reusejp_553_;
}
v_reusejp_553_:
{
return v___x_554_;
}
}
}
}
LEAN_EXPORT lean_object* l_main___lam__3___boxed(lean_object* v___x_557_, lean_object* v___x_558_, lean_object* v___x_559_, lean_object* v___y_560_){
_start:
{
lean_object* v_res_561_; 
v_res_561_ = l_main___lam__3(v___x_557_, v___x_558_, v___x_559_);
lean_dec_ref(v___x_557_);
return v_res_561_;
}
}
LEAN_EXPORT lean_object* l_IO_print___at___00IO_println___at___00main_spec__2_spec__3(lean_object* v_s_562_){
_start:
{
lean_object* v___x_564_; lean_object* v_putStr_565_; lean_object* v___x_566_; 
v___x_564_ = lean_get_stdout();
v_putStr_565_ = lean_ctor_get(v___x_564_, 4);
lean_inc_ref(v_putStr_565_);
lean_dec_ref(v___x_564_);
v___x_566_ = lean_apply_2(v_putStr_565_, v_s_562_, lean_box(0));
return v___x_566_;
}
}
LEAN_EXPORT lean_object* l_IO_print___at___00IO_println___at___00main_spec__2_spec__3___boxed(lean_object* v_s_567_, lean_object* v_a_568_){
_start:
{
lean_object* v_res_569_; 
v_res_569_ = l_IO_print___at___00IO_println___at___00main_spec__2_spec__3(v_s_567_);
return v_res_569_;
}
}
LEAN_EXPORT lean_object* l_IO_println___at___00main_spec__2(lean_object* v_s_570_){
_start:
{
uint32_t v___x_572_; lean_object* v___x_573_; lean_object* v___x_574_; 
v___x_572_ = 10;
v___x_573_ = lean_string_push(v_s_570_, v___x_572_);
v___x_574_ = l_IO_print___at___00IO_println___at___00main_spec__2_spec__3(v___x_573_);
return v___x_574_;
}
}
LEAN_EXPORT lean_object* l_IO_println___at___00main_spec__2___boxed(lean_object* v_s_575_, lean_object* v_a_576_){
_start:
{
lean_object* v_res_577_; 
v_res_577_ = l_IO_println___at___00main_spec__2(v_s_575_);
return v_res_577_;
}
}
static lean_object* _init_l_main___closed__1(void){
_start:
{
lean_object* v___x_584_; lean_object* v_arr_585_; lean_object* v___x_586_; lean_object* v___x_587_; 
v___x_584_ = lean_unsigned_to_nat(6250000u);
v_arr_585_ = lean_mk_empty_array_with_capacity(v___x_584_);
v___x_586_ = ((lean_object*)(l_main___closed__1___boxed__const__1));
v___x_587_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_587_, 0, v___x_586_);
lean_ctor_set(v___x_587_, 1, v_arr_585_);
return v___x_587_;
}
}
static lean_object* _init_l_main___closed__2(void){
_start:
{
lean_object* v___x_588_; lean_object* v___x_589_; lean_object* v___x_590_; lean_object* v___f_591_; 
v___x_588_ = lean_unsigned_to_nat(0u);
v___x_589_ = lean_obj_once(&l_main___closed__1, &l_main___closed__1_once, _init_l_main___closed__1);
v___x_590_ = ((lean_object*)(l_main___closed__0));
v___f_591_ = lean_alloc_closure((void*)(l_main___lam__0___boxed), 4, 3);
lean_closure_set(v___f_591_, 0, v___x_590_);
lean_closure_set(v___f_591_, 1, v___x_589_);
lean_closure_set(v___f_591_, 2, v___x_588_);
return v___f_591_;
}
}
static lean_object* _init_l_main___closed__5(void){
_start:
{
lean_object* v___x_594_; lean_object* v___x_595_; 
v___x_594_ = lean_unsigned_to_nat(50000000u);
v___x_595_ = lean_mk_empty_byte_array(v___x_594_);
return v___x_595_;
}
}
LEAN_EXPORT lean_object* _lean_main(){
_start:
{
lean_object* v___x_604_; lean_object* v_arr_605_; lean_object* v___x_606_; lean_object* v___x_607_; lean_object* v___x_608_; lean_object* v___f_609_; lean_object* v___x_610_; 
v___x_604_ = lean_unsigned_to_nat(6250000u);
v_arr_605_ = lean_mk_empty_array_with_capacity(v___x_604_);
v___x_606_ = lean_unsigned_to_nat(0u);
v___x_607_ = lean_unsigned_to_nat(1u);
v___x_608_ = ((lean_object*)(l_main___closed__0));
v___f_609_ = lean_obj_once(&l_main___closed__2, &l_main___closed__2_once, _init_l_main___closed__2);
v___x_610_ = l_timeS___redArg(v___f_609_);
if (lean_obj_tag(v___x_610_) == 0)
{
lean_object* v_a_611_; lean_object* v_fst_612_; lean_object* v_snd_613_; lean_object* v___x_614_; double v___x_615_; lean_object* v___x_616_; lean_object* v___x_617_; lean_object* v___x_618_; lean_object* v___x_619_; lean_object* v___x_620_; 
v_a_611_ = lean_ctor_get(v___x_610_, 0);
lean_inc(v_a_611_);
lean_dec_ref_known(v___x_610_, 1);
v_fst_612_ = lean_ctor_get(v_a_611_, 0);
lean_inc(v_fst_612_);
v_snd_613_ = lean_ctor_get(v_a_611_, 1);
lean_inc(v_snd_613_);
lean_dec(v_a_611_);
v___x_614_ = ((lean_object*)(l_main___closed__3));
v___x_615_ = lean_unbox_float(v_snd_613_);
lean_dec(v_snd_613_);
v___x_616_ = lean_float_to_string(v___x_615_);
v___x_617_ = lean_string_append(v___x_614_, v___x_616_);
lean_dec_ref(v___x_616_);
v___x_618_ = ((lean_object*)(l_main___closed__4));
v___x_619_ = lean_string_append(v___x_617_, v___x_618_);
v___x_620_ = l_IO_println___at___00main_spec__2(v___x_619_);
if (lean_obj_tag(v___x_620_) == 0)
{
lean_object* v___x_621_; 
lean_dec_ref_known(v___x_620_, 1);
v___x_621_ = lean_io_create_tempfile();
if (lean_obj_tag(v___x_621_) == 0)
{
lean_object* v_a_622_; lean_object* v_snd_623_; lean_object* v___f_624_; lean_object* v___x_625_; lean_object* v___x_626_; lean_object* v___x_627_; lean_object* v___f_628_; lean_object* v___x_629_; 
v_a_622_ = lean_ctor_get(v___x_621_, 0);
lean_inc(v_a_622_);
lean_dec_ref_known(v___x_621_, 1);
v_snd_623_ = lean_ctor_get(v_a_622_, 1);
lean_inc_n(v_snd_623_, 2);
lean_dec(v_a_622_);
v___f_624_ = lean_alloc_closure((void*)(l_main___lam__1___boxed), 5, 4);
lean_closure_set(v___f_624_, 0, v_snd_623_);
lean_closure_set(v___f_624_, 1, v___x_608_);
lean_closure_set(v___f_624_, 2, v_arr_605_);
lean_closure_set(v___f_624_, 3, v___x_606_);
v___x_625_ = lean_obj_once(&l_main___closed__5, &l_main___closed__5_once, _init_l_main___closed__5);
v___x_626_ = lean_array_get_size(v_fst_612_);
v___x_627_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_627_, 0, v___x_606_);
lean_ctor_set(v___x_627_, 1, v___x_626_);
lean_ctor_set(v___x_627_, 2, v___x_607_);
v___f_628_ = lean_alloc_closure((void*)(l_main___lam__2___boxed), 6, 5);
lean_closure_set(v___f_628_, 0, v_fst_612_);
lean_closure_set(v___f_628_, 1, v___x_627_);
lean_closure_set(v___f_628_, 2, v___x_625_);
lean_closure_set(v___f_628_, 3, v___x_606_);
lean_closure_set(v___f_628_, 4, v_snd_623_);
v___x_629_ = l_timeS___redArg(v___f_628_);
if (lean_obj_tag(v___x_629_) == 0)
{
lean_object* v_a_630_; lean_object* v_snd_631_; lean_object* v___x_632_; double v___x_633_; lean_object* v___x_634_; lean_object* v___x_635_; lean_object* v___x_636_; lean_object* v___x_637_; 
v_a_630_ = lean_ctor_get(v___x_629_, 0);
lean_inc(v_a_630_);
lean_dec_ref_known(v___x_629_, 1);
v_snd_631_ = lean_ctor_get(v_a_630_, 1);
lean_inc(v_snd_631_);
lean_dec(v_a_630_);
v___x_632_ = ((lean_object*)(l_main___closed__6));
v___x_633_ = lean_unbox_float(v_snd_631_);
lean_dec(v_snd_631_);
v___x_634_ = lean_float_to_string(v___x_633_);
v___x_635_ = lean_string_append(v___x_632_, v___x_634_);
lean_dec_ref(v___x_634_);
v___x_636_ = lean_string_append(v___x_635_, v___x_618_);
v___x_637_ = l_IO_println___at___00main_spec__2(v___x_636_);
if (lean_obj_tag(v___x_637_) == 0)
{
lean_object* v___x_638_; 
lean_dec_ref_known(v___x_637_, 1);
v___x_638_ = l_timeS___redArg(v___f_624_);
if (lean_obj_tag(v___x_638_) == 0)
{
lean_object* v_a_639_; lean_object* v_fst_640_; lean_object* v_snd_641_; lean_object* v___x_643_; uint8_t v_isShared_644_; uint8_t v_isSharedCheck_674_; 
v_a_639_ = lean_ctor_get(v___x_638_, 0);
lean_inc(v_a_639_);
lean_dec_ref_known(v___x_638_, 1);
v_fst_640_ = lean_ctor_get(v_a_639_, 0);
v_snd_641_ = lean_ctor_get(v_a_639_, 1);
v_isSharedCheck_674_ = !lean_is_exclusive(v_a_639_);
if (v_isSharedCheck_674_ == 0)
{
v___x_643_ = v_a_639_;
v_isShared_644_ = v_isSharedCheck_674_;
goto v_resetjp_642_;
}
else
{
lean_inc(v_snd_641_);
lean_inc(v_fst_640_);
lean_dec(v_a_639_);
v___x_643_ = lean_box(0);
v_isShared_644_ = v_isSharedCheck_674_;
goto v_resetjp_642_;
}
v_resetjp_642_:
{
lean_object* v___x_645_; double v___x_646_; lean_object* v___x_647_; lean_object* v___x_648_; lean_object* v___x_649_; lean_object* v___x_650_; 
v___x_645_ = ((lean_object*)(l_main___closed__7));
v___x_646_ = lean_unbox_float(v_snd_641_);
lean_dec(v_snd_641_);
v___x_647_ = lean_float_to_string(v___x_646_);
v___x_648_ = lean_string_append(v___x_645_, v___x_647_);
lean_dec_ref(v___x_647_);
v___x_649_ = lean_string_append(v___x_648_, v___x_618_);
v___x_650_ = l_IO_println___at___00main_spec__2(v___x_649_);
if (lean_obj_tag(v___x_650_) == 0)
{
lean_object* v___x_651_; lean_object* v___x_652_; lean_object* v___x_654_; 
lean_dec_ref_known(v___x_650_, 1);
v___x_651_ = ((lean_object*)(l_main___closed__8));
v___x_652_ = ((lean_object*)(l_main___closed__1___boxed__const__1));
if (v_isShared_644_ == 0)
{
lean_ctor_set(v___x_643_, 1, v___x_652_);
v___x_654_ = v___x_643_;
goto v_reusejp_653_;
}
else
{
lean_object* v_reuseFailAlloc_673_; 
v_reuseFailAlloc_673_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_673_, 0, v_fst_640_);
lean_ctor_set(v_reuseFailAlloc_673_, 1, v___x_652_);
v___x_654_ = v_reuseFailAlloc_673_;
goto v_reusejp_653_;
}
v_reusejp_653_:
{
lean_object* v___f_655_; lean_object* v___x_656_; 
v___f_655_ = lean_alloc_closure((void*)(l_main___lam__3___boxed), 4, 3);
lean_closure_set(v___f_655_, 0, v___x_651_);
lean_closure_set(v___f_655_, 1, v___x_654_);
lean_closure_set(v___f_655_, 2, v___x_606_);
v___x_656_ = l_timeS___redArg(v___f_655_);
if (lean_obj_tag(v___x_656_) == 0)
{
lean_object* v_a_657_; lean_object* v_snd_658_; lean_object* v___x_659_; double v___x_660_; lean_object* v___x_661_; lean_object* v___x_662_; lean_object* v___x_663_; lean_object* v___x_664_; 
v_a_657_ = lean_ctor_get(v___x_656_, 0);
lean_inc(v_a_657_);
lean_dec_ref_known(v___x_656_, 1);
v_snd_658_ = lean_ctor_get(v_a_657_, 1);
lean_inc(v_snd_658_);
lean_dec(v_a_657_);
v___x_659_ = ((lean_object*)(l_main___closed__9));
v___x_660_ = lean_unbox_float(v_snd_658_);
lean_dec(v_snd_658_);
v___x_661_ = lean_float_to_string(v___x_660_);
v___x_662_ = lean_string_append(v___x_659_, v___x_661_);
lean_dec_ref(v___x_661_);
v___x_663_ = lean_string_append(v___x_662_, v___x_618_);
v___x_664_ = l_IO_println___at___00main_spec__2(v___x_663_);
return v___x_664_;
}
else
{
lean_object* v_a_665_; lean_object* v___x_667_; uint8_t v_isShared_668_; uint8_t v_isSharedCheck_672_; 
v_a_665_ = lean_ctor_get(v___x_656_, 0);
v_isSharedCheck_672_ = !lean_is_exclusive(v___x_656_);
if (v_isSharedCheck_672_ == 0)
{
v___x_667_ = v___x_656_;
v_isShared_668_ = v_isSharedCheck_672_;
goto v_resetjp_666_;
}
else
{
lean_inc(v_a_665_);
lean_dec(v___x_656_);
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
else
{
lean_del_object(v___x_643_);
lean_dec(v_fst_640_);
return v___x_650_;
}
}
}
else
{
lean_object* v_a_675_; lean_object* v___x_677_; uint8_t v_isShared_678_; uint8_t v_isSharedCheck_682_; 
v_a_675_ = lean_ctor_get(v___x_638_, 0);
v_isSharedCheck_682_ = !lean_is_exclusive(v___x_638_);
if (v_isSharedCheck_682_ == 0)
{
v___x_677_ = v___x_638_;
v_isShared_678_ = v_isSharedCheck_682_;
goto v_resetjp_676_;
}
else
{
lean_inc(v_a_675_);
lean_dec(v___x_638_);
v___x_677_ = lean_box(0);
v_isShared_678_ = v_isSharedCheck_682_;
goto v_resetjp_676_;
}
v_resetjp_676_:
{
lean_object* v___x_680_; 
if (v_isShared_678_ == 0)
{
v___x_680_ = v___x_677_;
goto v_reusejp_679_;
}
else
{
lean_object* v_reuseFailAlloc_681_; 
v_reuseFailAlloc_681_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_681_, 0, v_a_675_);
v___x_680_ = v_reuseFailAlloc_681_;
goto v_reusejp_679_;
}
v_reusejp_679_:
{
return v___x_680_;
}
}
}
}
else
{
lean_dec_ref(v___f_624_);
return v___x_637_;
}
}
else
{
lean_object* v_a_683_; lean_object* v___x_685_; uint8_t v_isShared_686_; uint8_t v_isSharedCheck_690_; 
lean_dec_ref(v___f_624_);
v_a_683_ = lean_ctor_get(v___x_629_, 0);
v_isSharedCheck_690_ = !lean_is_exclusive(v___x_629_);
if (v_isSharedCheck_690_ == 0)
{
v___x_685_ = v___x_629_;
v_isShared_686_ = v_isSharedCheck_690_;
goto v_resetjp_684_;
}
else
{
lean_inc(v_a_683_);
lean_dec(v___x_629_);
v___x_685_ = lean_box(0);
v_isShared_686_ = v_isSharedCheck_690_;
goto v_resetjp_684_;
}
v_resetjp_684_:
{
lean_object* v___x_688_; 
if (v_isShared_686_ == 0)
{
v___x_688_ = v___x_685_;
goto v_reusejp_687_;
}
else
{
lean_object* v_reuseFailAlloc_689_; 
v_reuseFailAlloc_689_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_689_, 0, v_a_683_);
v___x_688_ = v_reuseFailAlloc_689_;
goto v_reusejp_687_;
}
v_reusejp_687_:
{
return v___x_688_;
}
}
}
}
else
{
lean_object* v_a_691_; lean_object* v___x_693_; uint8_t v_isShared_694_; uint8_t v_isSharedCheck_698_; 
lean_dec(v_fst_612_);
lean_dec_ref(v_arr_605_);
v_a_691_ = lean_ctor_get(v___x_621_, 0);
v_isSharedCheck_698_ = !lean_is_exclusive(v___x_621_);
if (v_isSharedCheck_698_ == 0)
{
v___x_693_ = v___x_621_;
v_isShared_694_ = v_isSharedCheck_698_;
goto v_resetjp_692_;
}
else
{
lean_inc(v_a_691_);
lean_dec(v___x_621_);
v___x_693_ = lean_box(0);
v_isShared_694_ = v_isSharedCheck_698_;
goto v_resetjp_692_;
}
v_resetjp_692_:
{
lean_object* v___x_696_; 
if (v_isShared_694_ == 0)
{
v___x_696_ = v___x_693_;
goto v_reusejp_695_;
}
else
{
lean_object* v_reuseFailAlloc_697_; 
v_reuseFailAlloc_697_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_697_, 0, v_a_691_);
v___x_696_ = v_reuseFailAlloc_697_;
goto v_reusejp_695_;
}
v_reusejp_695_:
{
return v___x_696_;
}
}
}
}
else
{
lean_dec(v_fst_612_);
lean_dec_ref(v_arr_605_);
return v___x_620_;
}
}
else
{
lean_object* v_a_699_; lean_object* v___x_701_; uint8_t v_isShared_702_; uint8_t v_isSharedCheck_706_; 
lean_dec_ref(v_arr_605_);
v_a_699_ = lean_ctor_get(v___x_610_, 0);
v_isSharedCheck_706_ = !lean_is_exclusive(v___x_610_);
if (v_isSharedCheck_706_ == 0)
{
v___x_701_ = v___x_610_;
v_isShared_702_ = v_isSharedCheck_706_;
goto v_resetjp_700_;
}
else
{
lean_inc(v_a_699_);
lean_dec(v___x_610_);
v___x_701_ = lean_box(0);
v_isShared_702_ = v_isSharedCheck_706_;
goto v_resetjp_700_;
}
v_resetjp_700_:
{
lean_object* v___x_704_; 
if (v_isShared_702_ == 0)
{
v___x_704_ = v___x_701_;
goto v_reusejp_703_;
}
else
{
lean_object* v_reuseFailAlloc_705_; 
v_reuseFailAlloc_705_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_705_, 0, v_a_699_);
v___x_704_ = v_reuseFailAlloc_705_;
goto v_reusejp_703_;
}
v_reusejp_703_:
{
return v___x_704_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_main___boxed(lean_object* v_a_707_){
_start:
{
lean_object* v_res_708_; 
v_res_708_ = _lean_main();
return v_res_708_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0(lean_object* v_range_709_, lean_object* v_b_710_, lean_object* v_i_711_, lean_object* v_hs_712_, lean_object* v_hl_713_){
_start:
{
lean_object* v___x_715_; 
v___x_715_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg(v_range_709_, v_b_710_, v_i_711_);
return v___x_715_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___boxed(lean_object* v_range_716_, lean_object* v_b_717_, lean_object* v_i_718_, lean_object* v_hs_719_, lean_object* v_hl_720_, lean_object* v___y_721_){
_start:
{
lean_object* v_res_722_; 
v_res_722_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0(v_range_716_, v_b_717_, v_i_718_, v_hs_719_, v_hl_720_);
lean_dec_ref(v_range_716_);
return v_res_722_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3(lean_object* v_fst_723_, lean_object* v_range_724_, lean_object* v_b_725_, lean_object* v_i_726_, lean_object* v_hs_727_, lean_object* v_hl_728_){
_start:
{
lean_object* v___x_730_; 
v___x_730_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(v_fst_723_, v_range_724_, v_b_725_, v_i_726_);
return v___x_730_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___boxed(lean_object* v_fst_731_, lean_object* v_range_732_, lean_object* v_b_733_, lean_object* v_i_734_, lean_object* v_hs_735_, lean_object* v_hl_736_, lean_object* v___y_737_){
_start:
{
lean_object* v_res_738_; 
v_res_738_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3(v_fst_731_, v_range_732_, v_b_733_, v_i_734_, v_hs_735_, v_hl_736_);
lean_dec_ref(v_range_732_);
lean_dec_ref(v_fst_731_);
return v_res_738_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4(lean_object* v_a_739_, lean_object* v_range_740_, lean_object* v_b_741_, lean_object* v_i_742_, lean_object* v_hs_743_, lean_object* v_hl_744_){
_start:
{
lean_object* v___x_746_; 
v___x_746_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(v_a_739_, v_range_740_, v_b_741_, v_i_742_);
return v___x_746_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___boxed(lean_object* v_a_747_, lean_object* v_range_748_, lean_object* v_b_749_, lean_object* v_i_750_, lean_object* v_hs_751_, lean_object* v_hl_752_, lean_object* v___y_753_){
_start:
{
lean_object* v_res_754_; 
v_res_754_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4(v_a_747_, v_range_748_, v_b_749_, v_i_750_, v_hs_751_, v_hl_752_);
lean_dec_ref(v_range_748_);
lean_dec_ref(v_a_747_);
return v_res_754_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5(lean_object* v_range_755_, lean_object* v_b_756_, lean_object* v_i_757_, lean_object* v_hs_758_, lean_object* v_hl_759_){
_start:
{
lean_object* v___x_761_; 
v___x_761_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(v_range_755_, v_b_756_, v_i_757_);
return v___x_761_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___boxed(lean_object* v_range_762_, lean_object* v_b_763_, lean_object* v_i_764_, lean_object* v_hs_765_, lean_object* v_hl_766_, lean_object* v___y_767_){
_start:
{
lean_object* v_res_768_; 
v_res_768_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5(v_range_762_, v_b_763_, v_i_764_, v_hs_765_, v_hl_766_);
lean_dec_ref(v_range_762_);
return v_res_768_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1(lean_object* v_n_769_, lean_object* v_as_770_, lean_object* v_lo_771_, lean_object* v_hi_772_, lean_object* v_w_773_, lean_object* v_hlo_774_, lean_object* v_hhi_775_){
_start:
{
lean_object* v___x_776_; 
v___x_776_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v_n_769_, v_as_770_, v_lo_771_, v_hi_772_);
return v___x_776_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1___boxed(lean_object* v_n_777_, lean_object* v_as_778_, lean_object* v_lo_779_, lean_object* v_hi_780_, lean_object* v_w_781_, lean_object* v_hlo_782_, lean_object* v_hhi_783_){
_start:
{
lean_object* v_res_784_; 
v_res_784_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1(v_n_777_, v_as_778_, v_lo_779_, v_hi_780_, v_w_781_, v_hlo_782_, v_hhi_783_);
lean_dec(v_hi_780_);
lean_dec(v_n_777_);
return v_res_784_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2(lean_object* v_n_785_, lean_object* v_lo_786_, lean_object* v_hi_787_, lean_object* v_hhi_788_, uint64_t v_pivot_789_, lean_object* v_as_790_, lean_object* v_i_791_, lean_object* v_k_792_, lean_object* v_ilo_793_, lean_object* v_ik_794_, lean_object* v_w_795_){
_start:
{
lean_object* v___x_796_; 
v___x_796_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(v_hi_787_, v_pivot_789_, v_as_790_, v_i_791_, v_k_792_);
return v___x_796_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___boxed(lean_object* v_n_797_, lean_object* v_lo_798_, lean_object* v_hi_799_, lean_object* v_hhi_800_, lean_object* v_pivot_801_, lean_object* v_as_802_, lean_object* v_i_803_, lean_object* v_k_804_, lean_object* v_ilo_805_, lean_object* v_ik_806_, lean_object* v_w_807_){
_start:
{
uint64_t v_pivot_boxed_808_; lean_object* v_res_809_; 
v_pivot_boxed_808_ = lean_unbox_uint64(v_pivot_801_);
lean_dec_ref(v_pivot_801_);
v_res_809_ = l___private_Init_Data_Array_QSort_Basic_0__Array_qpartition_loop___at___00__private_Init_Data_Array_QSort_Basic_0__Array_qsort_sort___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2(v_n_797_, v_lo_798_, v_hi_799_, v_hhi_800_, v_pivot_boxed_808_, v_as_802_, v_i_803_, v_k_804_, v_ilo_805_, v_ik_806_, v_w_807_);
lean_dec(v_hi_799_);
lean_dec(v_lo_798_);
lean_dec(v_n_797_);
return v_res_809_;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Init(uint8_t builtin);
void lean_initialize_runtime_module();
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_io__compute(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
lean_initialize_runtime_module();
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_N = _init_l_N();
lean_mark_persistent(l_N);
return lean_io_result_mk_ok(lean_box(0));
}
char ** lean_setup_args(int argc, char ** argv);
#if defined(WIN32) || defined(_WIN32)
#include <windows.h>
#endif
lean_object* run_main(int argc, char ** argv) {
    return _lean_main();
}
int main(int argc, char ** argv) {
#if defined(WIN32) || defined(_WIN32)
  SetErrorMode(SEM_FAILCRITICALERRORS);
  SetConsoleOutputCP(CP_UTF8);
#endif
  lean_object* res;
  argv = lean_setup_args(argc, argv);
  res = initialize_io__compute(1 /* builtin */);
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
