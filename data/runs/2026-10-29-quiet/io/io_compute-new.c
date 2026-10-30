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
lean_object* l_UInt64_decLt___boxed(lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
uint64_t lean_uint64_shift_right(uint64_t, uint64_t);
uint64_t lean_uint64_xor(uint64_t, uint64_t);
uint64_t lean_uint64_shift_left(uint64_t, uint64_t);
uint64_t lean_uint64_mul(uint64_t, uint64_t);
lean_object* lean_array_push(lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
lean_object* lean_array_get_size(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* lean_nat_log2(lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
lean_object* lean_array_fget_borrowed(lean_object*, lean_object*);
uint8_t lean_uint64_dec_lt(uint64_t, uint64_t);
lean_object* lean_array_fswap(lean_object*, lean_object*, lean_object*);
lean_object* lean_nat_shiftr(lean_object*, lean_object*);
lean_object* l_Array_QSort_Internal_partitionEqualId___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t l_Array_QSort_Internal_instBEqHint_beq(uint8_t, uint8_t);
lean_object* l_Array_QSort_Internal_reverseRange___redArg(lean_object*, lean_object*, lean_object*);
lean_object* lean_nat_mul(lean_object*, lean_object*);
lean_object* l_Array_QSort_Internal_breakPatterns___redArg(lean_object*, lean_object*, lean_object*);
lean_object* l_Array_QSort_Internal_heapSortId___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lean_array_get_borrowed(lean_object*, lean_object*, lean_object*);
uint64_t lean_uint64_land(uint64_t, uint64_t);
uint8_t lean_uint64_to_uint8(uint64_t);
lean_object* lean_byte_array_push(lean_object*, uint8_t);
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
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(lean_object*, lean_object*, lean_object*, uint8_t, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg(uint64_t, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg(uint64_t, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___redArg(lean_object*, lean_object*, lean_object*, lean_object*, uint64_t, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_closure_object l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_closure_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 245}, .m_fun = (void*)l_UInt64_decLt___boxed, .m_arity = 2, .m_num_fixed = 0, .m_objs = {} };
static const lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__0 = (const lean_object*)&l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__0_value;
static lean_once_cell_t l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__1_once = LEAN_ONCE_CELL_INITIALIZER;
static uint8_t l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__1;
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint8_t, uint8_t, uint8_t, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
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
LEAN_EXPORT uint8_t l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint8_t, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint8_t, uint8_t, uint8_t, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint64_t, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint64_t, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint64_t, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
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
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___redArg(lean_object* v_a_204_, lean_object* v_xs_205_, lean_object* v_j_206_){
_start:
{
uint8_t v___x_207_; 
v___x_207_ = lean_nat_dec_lt(v_a_204_, v_j_206_);
if (v___x_207_ == 0)
{
lean_dec(v_j_206_);
return v_xs_205_;
}
else
{
lean_object* v___x_208_; lean_object* v___x_209_; lean_object* v___x_210_; lean_object* v___x_211_; uint64_t v___x_212_; uint64_t v___x_213_; uint8_t v___x_214_; 
v___x_208_ = lean_array_fget_borrowed(v_xs_205_, v_j_206_);
v___x_209_ = lean_unsigned_to_nat(1u);
v___x_210_ = lean_nat_sub(v_j_206_, v___x_209_);
v___x_211_ = lean_array_fget_borrowed(v_xs_205_, v___x_210_);
v___x_212_ = lean_unbox_uint64(v___x_208_);
v___x_213_ = lean_unbox_uint64(v___x_211_);
v___x_214_ = lean_uint64_dec_lt(v___x_212_, v___x_213_);
if (v___x_214_ == 0)
{
lean_dec(v___x_210_);
lean_dec(v_j_206_);
return v_xs_205_;
}
else
{
lean_object* v___x_215_; 
v___x_215_ = lean_array_fswap(v_xs_205_, v_j_206_, v___x_210_);
lean_dec(v_j_206_);
v_xs_205_ = v___x_215_;
v_j_206_ = v___x_210_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___redArg___boxed(lean_object* v_a_217_, lean_object* v_xs_218_, lean_object* v_j_219_){
_start:
{
lean_object* v_res_220_; 
v_res_220_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___redArg(v_a_217_, v_xs_218_, v_j_219_);
lean_dec(v_a_217_);
return v_res_220_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___redArg(lean_object* v_n_221_, lean_object* v_a_222_, lean_object* v_b_223_, lean_object* v_xs_224_, lean_object* v_i_225_){
_start:
{
uint8_t v___x_226_; 
v___x_226_ = lean_nat_dec_lt(v_i_225_, v_b_223_);
if (v___x_226_ == 0)
{
lean_dec(v_i_225_);
return v_xs_224_;
}
else
{
lean_object* v___x_227_; lean_object* v___x_228_; lean_object* v___x_229_; 
lean_inc(v_i_225_);
v___x_227_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___redArg(v_a_222_, v_xs_224_, v_i_225_);
v___x_228_ = lean_unsigned_to_nat(1u);
v___x_229_ = lean_nat_add(v_i_225_, v___x_228_);
lean_dec(v_i_225_);
v_xs_224_ = v___x_227_;
v_i_225_ = v___x_229_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___redArg___boxed(lean_object* v_n_231_, lean_object* v_a_232_, lean_object* v_b_233_, lean_object* v_xs_234_, lean_object* v_i_235_){
_start:
{
lean_object* v_res_236_; 
v_res_236_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___redArg(v_n_231_, v_a_232_, v_b_233_, v_xs_234_, v_i_235_);
lean_dec(v_b_233_);
lean_dec(v_a_232_);
lean_dec(v_n_231_);
return v_res_236_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___redArg(lean_object* v_n_237_, lean_object* v_xs_238_, lean_object* v_a_239_, lean_object* v_b_240_){
_start:
{
lean_object* v___x_241_; lean_object* v___x_242_; lean_object* v___x_243_; 
v___x_241_ = lean_unsigned_to_nat(1u);
v___x_242_ = lean_nat_add(v_a_239_, v___x_241_);
v___x_243_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___redArg(v_n_237_, v_a_239_, v_b_240_, v_xs_238_, v___x_242_);
return v___x_243_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___redArg___boxed(lean_object* v_n_244_, lean_object* v_xs_245_, lean_object* v_a_246_, lean_object* v_b_247_){
_start:
{
lean_object* v_res_248_; 
v_res_248_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___redArg(v_n_244_, v_xs_245_, v_a_246_, v_b_247_);
lean_dec(v_b_247_);
lean_dec(v_a_246_);
lean_dec(v_n_244_);
return v_res_248_;
}
}
LEAN_EXPORT uint8_t l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(lean_object* v_lo_249_, lean_object* v_xs_250_, lean_object* v_a_251_, uint8_t v_afterEqual_252_, lean_object* v_pivot_253_){
_start:
{
if (v_afterEqual_252_ == 0)
{
uint8_t v___x_254_; 
v___x_254_ = lean_nat_dec_lt(v_lo_249_, v_a_251_);
if (v___x_254_ == 0)
{
return v___x_254_;
}
else
{
lean_object* v___x_255_; lean_object* v___x_256_; lean_object* v___x_257_; lean_object* v___x_258_; uint64_t v___x_259_; uint64_t v___x_260_; uint8_t v___x_261_; 
v___x_255_ = lean_unsigned_to_nat(1u);
v___x_256_ = lean_nat_sub(v_a_251_, v___x_255_);
v___x_257_ = lean_array_fget_borrowed(v_xs_250_, v___x_256_);
lean_dec(v___x_256_);
v___x_258_ = lean_array_fget_borrowed(v_xs_250_, v_pivot_253_);
v___x_259_ = lean_unbox_uint64(v___x_257_);
v___x_260_ = lean_unbox_uint64(v___x_258_);
v___x_261_ = lean_uint64_dec_lt(v___x_259_, v___x_260_);
if (v___x_261_ == 0)
{
return v___x_254_;
}
else
{
return v_afterEqual_252_;
}
}
}
else
{
uint8_t v___x_262_; 
v___x_262_ = 0;
return v___x_262_;
}
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg___boxed(lean_object* v_lo_263_, lean_object* v_xs_264_, lean_object* v_a_265_, lean_object* v_afterEqual_266_, lean_object* v_pivot_267_){
_start:
{
uint8_t v_afterEqual_boxed_268_; uint8_t v_res_269_; lean_object* v_r_270_; 
v_afterEqual_boxed_268_ = lean_unbox(v_afterEqual_266_);
v_res_269_ = l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(v_lo_263_, v_xs_264_, v_a_265_, v_afterEqual_boxed_268_, v_pivot_267_);
lean_dec(v_pivot_267_);
lean_dec(v_a_265_);
lean_dec_ref(v_xs_264_);
lean_dec(v_lo_263_);
v_r_270_ = lean_box(v_res_269_);
return v_r_270_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg(uint64_t v_p_271_, lean_object* v_xs_272_, lean_object* v_i_273_, lean_object* v_j_274_){
_start:
{
uint8_t v___x_275_; 
v___x_275_ = lean_nat_dec_le(v_i_273_, v_j_274_);
if (v___x_275_ == 0)
{
return v_j_274_;
}
else
{
lean_object* v___x_276_; uint64_t v___x_277_; uint8_t v___x_278_; 
v___x_276_ = lean_array_fget_borrowed(v_xs_272_, v_j_274_);
v___x_277_ = lean_unbox_uint64(v___x_276_);
v___x_278_ = lean_uint64_dec_lt(v___x_277_, v_p_271_);
if (v___x_278_ == 0)
{
lean_object* v___x_279_; lean_object* v___x_280_; 
v___x_279_ = lean_unsigned_to_nat(1u);
v___x_280_ = lean_nat_sub(v_j_274_, v___x_279_);
lean_dec(v_j_274_);
v_j_274_ = v___x_280_;
goto _start;
}
else
{
return v_j_274_;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg___boxed(lean_object* v_p_282_, lean_object* v_xs_283_, lean_object* v_i_284_, lean_object* v_j_285_){
_start:
{
uint64_t v_p_boxed_286_; lean_object* v_res_287_; 
v_p_boxed_286_ = lean_unbox_uint64(v_p_282_);
lean_dec_ref(v_p_282_);
v_res_287_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg(v_p_boxed_286_, v_xs_283_, v_i_284_, v_j_285_);
lean_dec(v_i_284_);
lean_dec_ref(v_xs_283_);
return v_res_287_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg(uint64_t v_p_288_, lean_object* v_xs_289_, lean_object* v_i_290_, lean_object* v_j_291_){
_start:
{
uint8_t v___x_292_; 
v___x_292_ = lean_nat_dec_le(v_i_290_, v_j_291_);
if (v___x_292_ == 0)
{
return v_i_290_;
}
else
{
lean_object* v___x_293_; uint64_t v___x_294_; uint8_t v___x_295_; 
v___x_293_ = lean_array_fget_borrowed(v_xs_289_, v_i_290_);
v___x_294_ = lean_unbox_uint64(v___x_293_);
v___x_295_ = lean_uint64_dec_lt(v___x_294_, v_p_288_);
if (v___x_295_ == 0)
{
return v_i_290_;
}
else
{
lean_object* v___x_296_; lean_object* v___x_297_; 
v___x_296_ = lean_unsigned_to_nat(1u);
v___x_297_ = lean_nat_add(v_i_290_, v___x_296_);
lean_dec(v_i_290_);
v_i_290_ = v___x_297_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg___boxed(lean_object* v_p_299_, lean_object* v_xs_300_, lean_object* v_i_301_, lean_object* v_j_302_){
_start:
{
uint64_t v_p_boxed_303_; lean_object* v_res_304_; 
v_p_boxed_303_ = lean_unbox_uint64(v_p_299_);
lean_dec_ref(v_p_299_);
v_res_304_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg(v_p_boxed_303_, v_xs_300_, v_i_301_, v_j_302_);
lean_dec(v_j_302_);
lean_dec_ref(v_xs_300_);
return v_res_304_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___redArg(lean_object* v_n_305_, lean_object* v_a_306_, lean_object* v_b_307_, lean_object* v_pivot_308_, uint64_t v_p_309_, lean_object* v_xs_310_, lean_object* v_i_311_, lean_object* v_j_312_){
_start:
{
lean_object* v_val_313_; lean_object* v_val_314_; uint8_t v___x_315_; 
v_val_313_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg(v_p_309_, v_xs_310_, v_i_311_, v_j_312_);
v_val_314_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg(v_p_309_, v_xs_310_, v_val_313_, v_j_312_);
v___x_315_ = lean_nat_dec_lt(v_val_313_, v_val_314_);
if (v___x_315_ == 0)
{
lean_object* v___x_316_; lean_object* v___x_317_; lean_object* v___x_318_; lean_object* v___x_319_; 
lean_dec(v_val_313_);
v___x_316_ = lean_array_fswap(v_xs_310_, v_val_314_, v_a_306_);
v___x_317_ = lean_box(v___x_315_);
v___x_318_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_318_, 0, v_val_314_);
lean_ctor_set(v___x_318_, 1, v___x_317_);
v___x_319_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_319_, 0, v___x_316_);
lean_ctor_set(v___x_319_, 1, v___x_318_);
return v___x_319_;
}
else
{
lean_object* v___x_320_; lean_object* v___x_321_; lean_object* v___x_322_; lean_object* v___x_323_; 
v___x_320_ = lean_array_fswap(v_xs_310_, v_val_313_, v_val_314_);
v___x_321_ = lean_unsigned_to_nat(1u);
v___x_322_ = lean_nat_add(v_val_313_, v___x_321_);
lean_dec(v_val_313_);
v___x_323_ = lean_nat_sub(v_val_314_, v___x_321_);
lean_dec(v_val_314_);
v_xs_310_ = v___x_320_;
v_i_311_ = v___x_322_;
v_j_312_ = v___x_323_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___redArg___boxed(lean_object* v_n_325_, lean_object* v_a_326_, lean_object* v_b_327_, lean_object* v_pivot_328_, lean_object* v_p_329_, lean_object* v_xs_330_, lean_object* v_i_331_, lean_object* v_j_332_){
_start:
{
uint64_t v_p_boxed_333_; lean_object* v_res_334_; 
v_p_boxed_333_ = lean_unbox_uint64(v_p_329_);
lean_dec_ref(v_p_329_);
v_res_334_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___redArg(v_n_325_, v_a_326_, v_b_327_, v_pivot_328_, v_p_boxed_333_, v_xs_330_, v_i_331_, v_j_332_);
lean_dec(v_pivot_328_);
lean_dec(v_b_327_);
lean_dec(v_a_326_);
lean_dec(v_n_325_);
return v_res_334_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg(lean_object* v_n_335_, lean_object* v_xs_336_, lean_object* v_a_337_, lean_object* v_b_338_, lean_object* v_pivot_339_){
_start:
{
lean_object* v_xs_340_; lean_object* v_p_341_; lean_object* v___x_342_; lean_object* v___x_343_; lean_object* v___x_344_; uint64_t v___x_345_; lean_object* v_val_346_; uint64_t v___x_347_; lean_object* v_val_348_; uint8_t v___x_349_; 
v_xs_340_ = lean_array_fswap(v_xs_336_, v_a_337_, v_pivot_339_);
v_p_341_ = lean_array_fget_borrowed(v_xs_340_, v_a_337_);
v___x_342_ = lean_unsigned_to_nat(1u);
v___x_343_ = lean_nat_add(v_a_337_, v___x_342_);
v___x_344_ = lean_nat_sub(v_b_338_, v___x_342_);
v___x_345_ = lean_unbox_uint64(v_p_341_);
v_val_346_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg(v___x_345_, v_xs_340_, v___x_343_, v___x_344_);
v___x_347_ = lean_unbox_uint64(v_p_341_);
v_val_348_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg(v___x_347_, v_xs_340_, v_val_346_, v___x_344_);
v___x_349_ = lean_nat_dec_lt(v_val_346_, v_val_348_);
if (v___x_349_ == 0)
{
lean_object* v___x_350_; uint8_t v___x_351_; lean_object* v___x_352_; lean_object* v___x_353_; lean_object* v___x_354_; 
lean_dec(v_val_346_);
v___x_350_ = lean_array_fswap(v_xs_340_, v_val_348_, v_a_337_);
v___x_351_ = 1;
v___x_352_ = lean_box(v___x_351_);
v___x_353_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_353_, 0, v_val_348_);
lean_ctor_set(v___x_353_, 1, v___x_352_);
v___x_354_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_354_, 0, v___x_350_);
lean_ctor_set(v___x_354_, 1, v___x_353_);
return v___x_354_;
}
else
{
lean_object* v___x_355_; lean_object* v___x_356_; lean_object* v___x_357_; uint64_t v___x_358_; lean_object* v___x_359_; 
lean_inc(v_p_341_);
v___x_355_ = lean_array_fswap(v_xs_340_, v_val_346_, v_val_348_);
v___x_356_ = lean_nat_add(v_val_346_, v___x_342_);
lean_dec(v_val_346_);
v___x_357_ = lean_nat_sub(v_val_348_, v___x_342_);
lean_dec(v_val_348_);
v___x_358_ = lean_unbox_uint64(v_p_341_);
lean_dec(v_p_341_);
v___x_359_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___redArg(v_n_335_, v_a_337_, v_b_338_, v_pivot_339_, v___x_358_, v___x_355_, v___x_356_, v___x_357_);
return v___x_359_;
}
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg___boxed(lean_object* v_n_360_, lean_object* v_xs_361_, lean_object* v_a_362_, lean_object* v_b_363_, lean_object* v_pivot_364_){
_start:
{
lean_object* v_res_365_; 
v_res_365_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg(v_n_360_, v_xs_361_, v_a_362_, v_b_363_, v_pivot_364_);
lean_dec(v_pivot_364_);
lean_dec(v_b_363_);
lean_dec(v_a_362_);
lean_dec(v_n_360_);
return v_res_365_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___redArg(lean_object* v_b_366_, lean_object* v_xs_367_, lean_object* v_j_368_){
_start:
{
uint8_t v___x_369_; 
v___x_369_ = lean_nat_dec_lt(v_j_368_, v_b_366_);
if (v___x_369_ == 0)
{
lean_dec(v_j_368_);
return v_xs_367_;
}
else
{
lean_object* v___x_370_; lean_object* v___x_371_; lean_object* v___x_372_; lean_object* v___x_373_; uint64_t v___x_374_; uint64_t v___x_375_; uint8_t v___x_376_; 
v___x_370_ = lean_array_fget_borrowed(v_xs_367_, v_j_368_);
v___x_371_ = lean_unsigned_to_nat(1u);
v___x_372_ = lean_nat_sub(v_j_368_, v___x_371_);
v___x_373_ = lean_array_fget_borrowed(v_xs_367_, v___x_372_);
v___x_374_ = lean_unbox_uint64(v___x_370_);
v___x_375_ = lean_unbox_uint64(v___x_373_);
v___x_376_ = lean_uint64_dec_lt(v___x_374_, v___x_375_);
if (v___x_376_ == 0)
{
lean_dec(v___x_372_);
lean_dec(v_j_368_);
return v_xs_367_;
}
else
{
lean_object* v___x_377_; lean_object* v___x_378_; 
v___x_377_ = lean_array_fswap(v_xs_367_, v_j_368_, v___x_372_);
lean_dec(v___x_372_);
v___x_378_ = lean_nat_add(v_j_368_, v___x_371_);
lean_dec(v_j_368_);
v_xs_367_ = v___x_377_;
v_j_368_ = v___x_378_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___redArg___boxed(lean_object* v_b_380_, lean_object* v_xs_381_, lean_object* v_j_382_){
_start:
{
lean_object* v_res_383_; 
v_res_383_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___redArg(v_b_380_, v_xs_381_, v_j_382_);
lean_dec(v_b_380_);
return v_res_383_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___redArg(lean_object* v_a_384_, lean_object* v_xs_385_, lean_object* v_j_386_){
_start:
{
uint8_t v___x_387_; 
v___x_387_ = lean_nat_dec_lt(v_a_384_, v_j_386_);
if (v___x_387_ == 0)
{
lean_dec(v_j_386_);
return v_xs_385_;
}
else
{
lean_object* v___x_388_; lean_object* v___x_389_; lean_object* v___x_390_; lean_object* v___x_391_; uint64_t v___x_392_; uint64_t v___x_393_; uint8_t v___x_394_; 
v___x_388_ = lean_array_fget_borrowed(v_xs_385_, v_j_386_);
v___x_389_ = lean_unsigned_to_nat(1u);
v___x_390_ = lean_nat_sub(v_j_386_, v___x_389_);
v___x_391_ = lean_array_fget_borrowed(v_xs_385_, v___x_390_);
v___x_392_ = lean_unbox_uint64(v___x_388_);
v___x_393_ = lean_unbox_uint64(v___x_391_);
v___x_394_ = lean_uint64_dec_lt(v___x_392_, v___x_393_);
if (v___x_394_ == 0)
{
lean_dec(v___x_390_);
lean_dec(v_j_386_);
return v_xs_385_;
}
else
{
lean_object* v___x_395_; 
v___x_395_ = lean_array_fswap(v_xs_385_, v_j_386_, v___x_390_);
lean_dec(v_j_386_);
v_xs_385_ = v___x_395_;
v_j_386_ = v___x_390_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___redArg___boxed(lean_object* v_a_397_, lean_object* v_xs_398_, lean_object* v_j_399_){
_start:
{
lean_object* v_res_400_; 
v_res_400_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___redArg(v_a_397_, v_xs_398_, v_j_399_);
lean_dec(v_a_397_);
return v_res_400_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___redArg(lean_object* v_b_401_, lean_object* v_xs_402_, lean_object* v_i_403_){
_start:
{
uint8_t v___x_404_; 
v___x_404_ = lean_nat_dec_lt(v_i_403_, v_b_401_);
if (v___x_404_ == 0)
{
return v_i_403_;
}
else
{
lean_object* v___x_405_; lean_object* v___x_406_; lean_object* v___x_407_; lean_object* v___x_408_; uint64_t v___x_409_; uint64_t v___x_410_; uint8_t v___x_411_; 
v___x_405_ = lean_array_fget_borrowed(v_xs_402_, v_i_403_);
v___x_406_ = lean_unsigned_to_nat(1u);
v___x_407_ = lean_nat_sub(v_i_403_, v___x_406_);
v___x_408_ = lean_array_fget_borrowed(v_xs_402_, v___x_407_);
lean_dec(v___x_407_);
v___x_409_ = lean_unbox_uint64(v___x_405_);
v___x_410_ = lean_unbox_uint64(v___x_408_);
v___x_411_ = lean_uint64_dec_lt(v___x_409_, v___x_410_);
if (v___x_411_ == 0)
{
lean_object* v___x_412_; 
v___x_412_ = lean_nat_add(v_i_403_, v___x_406_);
lean_dec(v_i_403_);
v_i_403_ = v___x_412_;
goto _start;
}
else
{
return v_i_403_;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___redArg___boxed(lean_object* v_b_414_, lean_object* v_xs_415_, lean_object* v_i_416_){
_start:
{
lean_object* v_res_417_; 
v_res_417_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___redArg(v_b_414_, v_xs_415_, v_i_416_);
lean_dec_ref(v_xs_415_);
lean_dec(v_b_414_);
return v_res_417_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___redArg(lean_object* v_n_418_, lean_object* v_a_419_, lean_object* v_b_420_, lean_object* v_xs_421_, lean_object* v_i_422_, lean_object* v_steps_423_){
_start:
{
lean_object* v___x_424_; uint8_t v___x_425_; 
v___x_424_ = lean_unsigned_to_nat(5u);
v___x_425_ = lean_nat_dec_lt(v_steps_423_, v___x_424_);
if (v___x_425_ == 0)
{
lean_object* v___x_426_; lean_object* v___x_427_; 
lean_dec(v_steps_423_);
lean_dec(v_i_422_);
v___x_426_ = lean_box(v___x_425_);
v___x_427_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_427_, 0, v_xs_421_);
lean_ctor_set(v___x_427_, 1, v___x_426_);
return v___x_427_;
}
else
{
lean_object* v_val_428_; uint8_t v___x_429_; 
v_val_428_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___redArg(v_b_420_, v_xs_421_, v_i_422_);
v___x_429_ = lean_nat_dec_eq(v_val_428_, v_b_420_);
if (v___x_429_ == 0)
{
lean_object* v___x_430_; lean_object* v___x_431_; uint8_t v___x_432_; 
v___x_430_ = lean_nat_sub(v_b_420_, v_a_419_);
v___x_431_ = lean_unsigned_to_nat(50u);
v___x_432_ = lean_nat_dec_lt(v___x_430_, v___x_431_);
lean_dec(v___x_430_);
if (v___x_432_ == 0)
{
lean_object* v___x_433_; lean_object* v_xs_435_; lean_object* v_xs_439_; lean_object* v___x_445_; lean_object* v_xs_446_; lean_object* v___x_447_; lean_object* v___x_448_; uint8_t v___x_449_; 
v___x_433_ = lean_unsigned_to_nat(1u);
v___x_445_ = lean_nat_sub(v_val_428_, v___x_433_);
v_xs_446_ = lean_array_fswap(v_xs_421_, v_val_428_, v___x_445_);
v___x_447_ = lean_unsigned_to_nat(2u);
v___x_448_ = lean_nat_sub(v_val_428_, v_a_419_);
v___x_449_ = lean_nat_dec_le(v___x_447_, v___x_448_);
lean_dec(v___x_448_);
if (v___x_449_ == 0)
{
lean_dec(v___x_445_);
v_xs_439_ = v_xs_446_;
goto v___jp_438_;
}
else
{
lean_object* v___x_450_; 
v___x_450_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___redArg(v_a_419_, v_xs_446_, v___x_445_);
v_xs_439_ = v___x_450_;
goto v___jp_438_;
}
v___jp_434_:
{
lean_object* v___x_436_; 
v___x_436_ = lean_nat_add(v_steps_423_, v___x_433_);
lean_dec(v_steps_423_);
v_xs_421_ = v_xs_435_;
v_i_422_ = v_val_428_;
v_steps_423_ = v___x_436_;
goto _start;
}
v___jp_438_:
{
lean_object* v___x_440_; lean_object* v___x_441_; uint8_t v___x_442_; 
v___x_440_ = lean_unsigned_to_nat(2u);
v___x_441_ = lean_nat_sub(v_b_420_, v_val_428_);
v___x_442_ = lean_nat_dec_le(v___x_440_, v___x_441_);
lean_dec(v___x_441_);
if (v___x_442_ == 0)
{
v_xs_435_ = v_xs_439_;
goto v___jp_434_;
}
else
{
lean_object* v___x_443_; lean_object* v___x_444_; 
v___x_443_ = lean_nat_add(v_val_428_, v___x_433_);
v___x_444_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___redArg(v_b_420_, v_xs_439_, v___x_443_);
v_xs_435_ = v___x_444_;
goto v___jp_434_;
}
}
}
else
{
lean_object* v___x_451_; lean_object* v___x_452_; 
lean_dec(v_val_428_);
lean_dec(v_steps_423_);
v___x_451_ = lean_box(v___x_429_);
v___x_452_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_452_, 0, v_xs_421_);
lean_ctor_set(v___x_452_, 1, v___x_451_);
return v___x_452_;
}
}
else
{
lean_object* v___x_453_; lean_object* v___x_454_; 
lean_dec(v_val_428_);
lean_dec(v_steps_423_);
v___x_453_ = lean_box(v___x_429_);
v___x_454_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_454_, 0, v_xs_421_);
lean_ctor_set(v___x_454_, 1, v___x_453_);
return v___x_454_;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___redArg___boxed(lean_object* v_n_455_, lean_object* v_a_456_, lean_object* v_b_457_, lean_object* v_xs_458_, lean_object* v_i_459_, lean_object* v_steps_460_){
_start:
{
lean_object* v_res_461_; 
v_res_461_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___redArg(v_n_455_, v_a_456_, v_b_457_, v_xs_458_, v_i_459_, v_steps_460_);
lean_dec(v_b_457_);
lean_dec(v_a_456_);
lean_dec(v_n_455_);
return v_res_461_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg(lean_object* v_n_462_, lean_object* v_xs_463_, lean_object* v_a_464_, lean_object* v_b_465_){
_start:
{
lean_object* v___x_466_; lean_object* v___x_467_; lean_object* v___x_468_; lean_object* v___x_469_; 
v___x_466_ = lean_unsigned_to_nat(1u);
v___x_467_ = lean_nat_add(v_a_464_, v___x_466_);
v___x_468_ = lean_unsigned_to_nat(0u);
v___x_469_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___redArg(v_n_462_, v_a_464_, v_b_465_, v_xs_463_, v___x_467_, v___x_468_);
return v___x_469_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg___boxed(lean_object* v_n_470_, lean_object* v_xs_471_, lean_object* v_a_472_, lean_object* v_b_473_){
_start:
{
lean_object* v_res_474_; 
v_res_474_ = l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg(v_n_470_, v_xs_471_, v_a_472_, v_b_473_);
lean_dec(v_b_473_);
lean_dec(v_a_472_);
lean_dec(v_n_470_);
return v_res_474_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(lean_object* v_a_475_, lean_object* v_q_476_, lean_object* v_d_477_, lean_object* v_h_478_, lean_object* v_h50_479_){
_start:
{
lean_object* v___x_480_; lean_object* v___x_481_; lean_object* v___x_482_; lean_object* v___x_483_; 
v___x_480_ = lean_nat_add(v_a_475_, v_q_476_);
v___x_481_ = lean_nat_add(v___x_480_, v_d_477_);
lean_dec(v___x_480_);
v___x_482_ = lean_unsigned_to_nat(1u);
v___x_483_ = lean_nat_sub(v___x_481_, v___x_482_);
lean_dec(v___x_481_);
return v___x_483_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0___boxed(lean_object* v_a_484_, lean_object* v_q_485_, lean_object* v_d_486_, lean_object* v_h_487_, lean_object* v_h50_488_){
_start:
{
lean_object* v_res_489_; 
v_res_489_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_484_, v_q_485_, v_d_486_, v_h_487_, v_h50_488_);
lean_dec(v_d_486_);
lean_dec(v_q_485_);
lean_dec(v_a_484_);
return v_res_489_;
}
}
static uint8_t _init_l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__1(void){
_start:
{
uint8_t v___x_491_; uint8_t v___x_492_; uint8_t v___x_493_; 
v___x_491_ = 2;
v___x_492_ = 1;
v___x_493_ = l_Array_QSort_Internal_instBEqHint_beq(v___x_492_, v___x_491_);
return v___x_493_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(lean_object* v___x_494_, lean_object* v_n_495_, lean_object* v_lo_496_, lean_object* v_xs_497_, lean_object* v_a_498_, lean_object* v_b_499_, lean_object* v_limit_500_, uint8_t v_balanced_501_, uint8_t v_partitioned_502_, uint8_t v_afterEqual_503_, lean_object* v_fuel_504_){
_start:
{
lean_object* v___x_505_; lean_object* v___x_506_; uint8_t v___x_507_; 
v___x_505_ = lean_nat_sub(v_b_499_, v_a_498_);
v___x_506_ = lean_unsigned_to_nat(24u);
v___x_507_ = lean_nat_dec_le(v___x_505_, v___x_506_);
if (v___x_507_ == 0)
{
lean_object* v___f_508_; lean_object* v___x_509_; uint8_t v___x_510_; 
v___f_508_ = ((lean_object*)(l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__0));
v___x_509_ = lean_unsigned_to_nat(0u);
v___x_510_ = lean_nat_dec_eq(v_limit_500_, v___x_509_);
if (v___x_510_ == 0)
{
uint8_t v_isZero_511_; lean_object* v_one_512_; lean_object* v_n_513_; lean_object* v___y_515_; lean_object* v___y_516_; lean_object* v_fst_517_; lean_object* v___y_547_; lean_object* v_fst_548_; lean_object* v_fst_549_; uint8_t v_snd_550_; lean_object* v___y_559_; lean_object* v___y_560_; lean_object* v_fst_561_; uint8_t v_snd_562_; lean_object* v___y_571_; lean_object* v___y_572_; lean_object* v_fst_573_; lean_object* v_snd_574_; lean_object* v___y_582_; lean_object* v___y_583_; lean_object* v___y_584_; lean_object* v___y_585_; lean_object* v_fst_586_; lean_object* v_snd_587_; lean_object* v___y_595_; lean_object* v___y_596_; lean_object* v___y_597_; lean_object* v___y_598_; lean_object* v_fst_599_; lean_object* v_fst_600_; lean_object* v_snd_601_; lean_object* v___y_609_; lean_object* v___y_610_; lean_object* v_fst_611_; lean_object* v_snd_612_; lean_object* v___y_620_; lean_object* v___y_621_; lean_object* v___y_622_; lean_object* v___y_623_; lean_object* v_fst_624_; lean_object* v_snd_625_; lean_object* v___y_633_; lean_object* v___y_634_; lean_object* v___y_635_; lean_object* v___y_636_; lean_object* v_fst_637_; lean_object* v_fst_638_; lean_object* v_snd_639_; lean_object* v___y_647_; lean_object* v___y_648_; lean_object* v___y_649_; lean_object* v___y_650_; lean_object* v___y_651_; lean_object* v_fst_652_; lean_object* v_snd_653_; lean_object* v___y_661_; lean_object* v___y_662_; lean_object* v___y_663_; lean_object* v___y_664_; lean_object* v___y_665_; lean_object* v___y_666_; lean_object* v_fst_667_; lean_object* v_snd_668_; lean_object* v___y_676_; lean_object* v___y_677_; lean_object* v___y_678_; lean_object* v___y_679_; lean_object* v___y_680_; lean_object* v___y_681_; lean_object* v_fst_682_; lean_object* v_fst_683_; lean_object* v_snd_684_; lean_object* v___y_692_; lean_object* v___y_693_; lean_object* v___y_694_; lean_object* v___y_695_; lean_object* v___y_696_; lean_object* v___y_697_; lean_object* v_fst_698_; lean_object* v_snd_699_; lean_object* v___y_712_; lean_object* v___y_713_; lean_object* v___y_714_; lean_object* v___y_715_; lean_object* v___y_716_; lean_object* v___y_717_; lean_object* v___y_718_; lean_object* v_fst_719_; lean_object* v_snd_720_; lean_object* v___y_728_; lean_object* v___y_729_; lean_object* v___y_730_; lean_object* v___y_731_; lean_object* v___y_732_; lean_object* v___y_733_; lean_object* v___y_734_; lean_object* v_fst_735_; lean_object* v_fst_736_; lean_object* v_snd_737_; lean_object* v___y_745_; lean_object* v___y_746_; lean_object* v___y_747_; lean_object* v___y_748_; lean_object* v___y_749_; lean_object* v_fst_750_; lean_object* v_snd_751_; lean_object* v___y_763_; lean_object* v___y_764_; lean_object* v___y_765_; lean_object* v___y_766_; lean_object* v___y_767_; lean_object* v___y_768_; lean_object* v_fst_769_; lean_object* v_snd_770_; lean_object* v___y_778_; lean_object* v___y_779_; lean_object* v___y_780_; lean_object* v___y_781_; lean_object* v___y_782_; lean_object* v___y_783_; lean_object* v_fst_784_; lean_object* v_fst_785_; lean_object* v_snd_786_; lean_object* v___y_794_; lean_object* v___y_795_; lean_object* v___y_796_; lean_object* v_fst_797_; uint8_t v___y_827_; lean_object* v___y_828_; lean_object* v___y_829_; lean_object* v_fst_830_; lean_object* v_fst_831_; uint8_t v_snd_832_; lean_object* v_fst_840_; lean_object* v_snd_841_; 
v_isZero_511_ = lean_nat_dec_eq(v_fuel_504_, v___x_509_);
v_one_512_ = lean_unsigned_to_nat(1u);
v_n_513_ = lean_nat_sub(v_fuel_504_, v_one_512_);
lean_dec(v_fuel_504_);
if (v_balanced_501_ == 0)
{
lean_object* v___x_879_; lean_object* v___x_880_; 
v___x_879_ = l_Array_QSort_Internal_breakPatterns___redArg(v_xs_497_, v_a_498_, v_b_499_);
v___x_880_ = lean_nat_sub(v_limit_500_, v_one_512_);
lean_dec(v_limit_500_);
v_fst_840_ = v___x_879_;
v_snd_841_ = v___x_880_;
goto v___jp_839_;
}
else
{
v_fst_840_ = v_xs_497_;
v_snd_841_ = v_limit_500_;
goto v___jp_839_;
}
v___jp_514_:
{
uint8_t v___x_518_; uint8_t v_down_519_; 
v___x_518_ = 1;
v_down_519_ = l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(v_lo_496_, v_fst_517_, v_a_498_, v_afterEqual_503_, v___y_516_);
if (v_down_519_ == 0)
{
lean_object* v___x_520_; lean_object* v_snd_521_; lean_object* v_fst_522_; lean_object* v_fst_523_; lean_object* v_snd_524_; lean_object* v___x_525_; lean_object* v___x_526_; uint8_t v___x_527_; 
v___x_520_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg(v_n_495_, v_fst_517_, v_a_498_, v_b_499_, v___y_516_);
lean_dec(v___y_516_);
v_snd_521_ = lean_ctor_get(v___x_520_, 1);
lean_inc(v_snd_521_);
v_fst_522_ = lean_ctor_get(v___x_520_, 0);
lean_inc(v_fst_522_);
lean_dec_ref(v___x_520_);
v_fst_523_ = lean_ctor_get(v_snd_521_, 0);
lean_inc(v_fst_523_);
v_snd_524_ = lean_ctor_get(v_snd_521_, 1);
lean_inc(v_snd_524_);
lean_dec(v_snd_521_);
v___x_525_ = lean_nat_sub(v_fst_523_, v_a_498_);
v___x_526_ = lean_nat_sub(v_b_499_, v_fst_523_);
v___x_527_ = lean_nat_dec_lt(v___x_525_, v___x_526_);
if (v___x_527_ == 0)
{
lean_object* v___x_528_; lean_object* v___x_529_; lean_object* v___x_530_; lean_object* v___x_531_; uint8_t v___x_532_; uint8_t v___x_533_; 
lean_dec(v___x_525_);
v___x_528_ = lean_nat_add(v_fst_523_, v_one_512_);
lean_inc(v_n_513_);
lean_inc(v___y_515_);
v___x_529_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_494_, v_n_495_, v_lo_496_, v_fst_522_, v___x_528_, v_b_499_, v___y_515_, v___x_518_, v___x_518_, v___x_527_, v_n_513_);
v___x_530_ = lean_unsigned_to_nat(3u);
v___x_531_ = lean_nat_shiftr(v___x_505_, v___x_530_);
lean_dec(v___x_505_);
v___x_532_ = lean_nat_dec_le(v___x_531_, v___x_526_);
lean_dec(v___x_526_);
lean_dec(v___x_531_);
v___x_533_ = lean_unbox(v_snd_524_);
lean_dec(v_snd_524_);
v_xs_497_ = v___x_529_;
v_b_499_ = v_fst_523_;
v_limit_500_ = v___y_515_;
v_balanced_501_ = v___x_532_;
v_partitioned_502_ = v___x_533_;
v_afterEqual_503_ = v___x_527_;
v_fuel_504_ = v_n_513_;
goto _start;
}
else
{
lean_object* v___x_535_; lean_object* v___x_536_; lean_object* v___x_537_; lean_object* v___x_538_; uint8_t v___x_539_; uint8_t v___x_540_; 
lean_dec(v___x_526_);
lean_inc(v_n_513_);
lean_inc(v___y_515_);
lean_inc(v_fst_523_);
v___x_535_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_494_, v_n_495_, v_lo_496_, v_fst_522_, v_a_498_, v_fst_523_, v___y_515_, v___x_518_, v___x_518_, v_down_519_, v_n_513_);
v___x_536_ = lean_nat_add(v_fst_523_, v_one_512_);
lean_dec(v_fst_523_);
v___x_537_ = lean_unsigned_to_nat(3u);
v___x_538_ = lean_nat_shiftr(v___x_505_, v___x_537_);
lean_dec(v___x_505_);
v___x_539_ = lean_nat_dec_le(v___x_538_, v___x_525_);
lean_dec(v___x_525_);
lean_dec(v___x_538_);
v___x_540_ = lean_unbox(v_snd_524_);
lean_dec(v_snd_524_);
v_xs_497_ = v___x_535_;
v_a_498_ = v___x_536_;
v_limit_500_ = v___y_515_;
v_balanced_501_ = v___x_539_;
v_partitioned_502_ = v___x_540_;
v_afterEqual_503_ = v_down_519_;
v_fuel_504_ = v_n_513_;
goto _start;
}
}
else
{
lean_object* v___x_542_; lean_object* v_fst_543_; lean_object* v_snd_544_; 
lean_dec(v___x_505_);
v___x_542_ = l_Array_QSort_Internal_partitionEqualId___redArg(v___x_494_, v___f_508_, v_fst_517_, v_a_498_, v_b_499_, v___y_516_);
lean_dec(v___y_516_);
lean_dec(v_a_498_);
v_fst_543_ = lean_ctor_get(v___x_542_, 0);
lean_inc(v_fst_543_);
v_snd_544_ = lean_ctor_get(v___x_542_, 1);
lean_inc(v_snd_544_);
lean_dec_ref(v___x_542_);
v_xs_497_ = v_fst_543_;
v_a_498_ = v_snd_544_;
v_limit_500_ = v___y_515_;
v_afterEqual_503_ = v___x_518_;
v_fuel_504_ = v_n_513_;
goto _start;
}
}
v___jp_546_:
{
if (v_balanced_501_ == 0)
{
v___y_515_ = v___y_547_;
v___y_516_ = v_fst_549_;
v_fst_517_ = v_fst_548_;
goto v___jp_514_;
}
else
{
if (v_partitioned_502_ == 0)
{
v___y_515_ = v___y_547_;
v___y_516_ = v_fst_549_;
v_fst_517_ = v_fst_548_;
goto v___jp_514_;
}
else
{
uint8_t v___x_551_; uint8_t v___x_552_; 
v___x_551_ = 1;
v___x_552_ = l_Array_QSort_Internal_instBEqHint_beq(v_snd_550_, v___x_551_);
if (v___x_552_ == 0)
{
v___y_515_ = v___y_547_;
v___y_516_ = v_fst_549_;
v_fst_517_ = v_fst_548_;
goto v___jp_514_;
}
else
{
lean_object* v___x_553_; lean_object* v_snd_554_; uint8_t v___x_555_; 
v___x_553_ = l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg(v_n_495_, v_fst_548_, v_a_498_, v_b_499_);
v_snd_554_ = lean_ctor_get(v___x_553_, 1);
v___x_555_ = lean_unbox(v_snd_554_);
if (v___x_555_ == 0)
{
lean_object* v_fst_556_; 
v_fst_556_ = lean_ctor_get(v___x_553_, 0);
lean_inc(v_fst_556_);
lean_dec_ref(v___x_553_);
v___y_515_ = v___y_547_;
v___y_516_ = v_fst_549_;
v_fst_517_ = v_fst_556_;
goto v___jp_514_;
}
else
{
lean_object* v_fst_557_; 
lean_dec(v_fst_549_);
lean_dec(v___y_547_);
lean_dec(v_n_513_);
lean_dec(v___x_505_);
lean_dec(v_b_499_);
lean_dec(v_a_498_);
v_fst_557_ = lean_ctor_get(v___x_553_, 0);
lean_inc(v_fst_557_);
lean_dec_ref(v___x_553_);
return v_fst_557_;
}
}
}
}
}
v___jp_558_:
{
uint8_t v___x_563_; uint8_t v___x_564_; 
v___x_563_ = 2;
v___x_564_ = l_Array_QSort_Internal_instBEqHint_beq(v_snd_562_, v___x_563_);
if (v___x_564_ == 0)
{
v___y_547_ = v___y_559_;
v_fst_548_ = v___y_560_;
v_fst_549_ = v_fst_561_;
v_snd_550_ = v_snd_562_;
goto v___jp_546_;
}
else
{
lean_object* v___x_565_; lean_object* v___x_566_; lean_object* v___x_567_; lean_object* v___x_568_; uint8_t v___x_569_; 
lean_inc(v_b_499_);
lean_inc(v_a_498_);
v___x_565_ = l_Array_QSort_Internal_reverseRange___redArg(v___y_560_, v_a_498_, v_b_499_);
v___x_566_ = lean_nat_sub(v_b_499_, v_one_512_);
v___x_567_ = lean_nat_sub(v_fst_561_, v_a_498_);
lean_dec(v_fst_561_);
v___x_568_ = lean_nat_sub(v___x_566_, v___x_567_);
lean_dec(v___x_567_);
lean_dec(v___x_566_);
v___x_569_ = 1;
v___y_547_ = v___y_559_;
v_fst_548_ = v___x_565_;
v_fst_549_ = v___x_568_;
v_snd_550_ = v___x_569_;
goto v___jp_546_;
}
}
v___jp_570_:
{
uint8_t v___x_575_; 
v___x_575_ = lean_nat_dec_eq(v_snd_574_, v___x_509_);
if (v___x_575_ == 0)
{
lean_object* v___x_576_; uint8_t v___x_577_; 
v___x_576_ = lean_unsigned_to_nat(12u);
v___x_577_ = lean_nat_dec_eq(v_snd_574_, v___x_576_);
lean_dec(v_snd_574_);
if (v___x_577_ == 0)
{
uint8_t v___x_578_; 
v___x_578_ = 0;
v___y_559_ = v___y_571_;
v___y_560_ = v___y_572_;
v_fst_561_ = v_fst_573_;
v_snd_562_ = v___x_578_;
goto v___jp_558_;
}
else
{
uint8_t v___x_579_; 
v___x_579_ = 2;
v___y_559_ = v___y_571_;
v___y_560_ = v___y_572_;
v_fst_561_ = v_fst_573_;
v_snd_562_ = v___x_579_;
goto v___jp_558_;
}
}
else
{
uint8_t v___x_580_; 
lean_dec(v_snd_574_);
v___x_580_ = 1;
v___y_559_ = v___y_571_;
v___y_560_ = v___y_572_;
v_fst_561_ = v_fst_573_;
v_snd_562_ = v___x_580_;
goto v___jp_558_;
}
}
v___jp_581_:
{
lean_object* v___x_588_; lean_object* v___x_589_; uint64_t v___x_590_; uint64_t v___x_591_; uint8_t v___x_592_; 
v___x_588_ = lean_array_fget_borrowed(v___y_583_, v_fst_586_);
v___x_589_ = lean_array_fget_borrowed(v___y_583_, v___y_585_);
v___x_590_ = lean_unbox_uint64(v___x_588_);
v___x_591_ = lean_unbox_uint64(v___x_589_);
v___x_592_ = lean_uint64_dec_lt(v___x_590_, v___x_591_);
if (v___x_592_ == 0)
{
lean_dec(v___y_585_);
lean_dec(v___y_584_);
v___y_571_ = v___y_582_;
v___y_572_ = v___y_583_;
v_fst_573_ = v_fst_586_;
v_snd_574_ = v_snd_587_;
goto v___jp_570_;
}
else
{
lean_object* v___x_593_; 
lean_dec(v_fst_586_);
v___x_593_ = lean_nat_add(v_snd_587_, v___y_584_);
lean_dec(v___y_584_);
lean_dec(v_snd_587_);
v___y_571_ = v___y_582_;
v___y_572_ = v___y_583_;
v_fst_573_ = v___y_585_;
v_snd_574_ = v___x_593_;
goto v___jp_570_;
}
}
v___jp_594_:
{
lean_object* v___x_602_; lean_object* v___x_603_; uint64_t v___x_604_; uint64_t v___x_605_; uint8_t v___x_606_; 
v___x_602_ = lean_array_fget_borrowed(v___y_597_, v___y_595_);
v___x_603_ = lean_array_fget_borrowed(v___y_597_, v_fst_600_);
v___x_604_ = lean_unbox_uint64(v___x_602_);
v___x_605_ = lean_unbox_uint64(v___x_603_);
v___x_606_ = lean_uint64_dec_lt(v___x_604_, v___x_605_);
if (v___x_606_ == 0)
{
lean_dec(v___y_595_);
v___y_582_ = v___y_596_;
v___y_583_ = v___y_597_;
v___y_584_ = v___y_598_;
v___y_585_ = v_fst_599_;
v_fst_586_ = v_fst_600_;
v_snd_587_ = v_snd_601_;
goto v___jp_581_;
}
else
{
lean_object* v___x_607_; 
lean_dec(v_fst_600_);
v___x_607_ = lean_nat_add(v_snd_601_, v___y_598_);
lean_dec(v_snd_601_);
v___y_582_ = v___y_596_;
v___y_583_ = v___y_597_;
v___y_584_ = v___y_598_;
v___y_585_ = v_fst_599_;
v_fst_586_ = v___y_595_;
v_snd_587_ = v___x_607_;
goto v___jp_581_;
}
}
v___jp_608_:
{
uint8_t v___x_613_; 
v___x_613_ = lean_nat_dec_eq(v_snd_612_, v___x_509_);
if (v___x_613_ == 0)
{
lean_object* v___x_614_; uint8_t v___x_615_; 
v___x_614_ = lean_unsigned_to_nat(12u);
v___x_615_ = lean_nat_dec_eq(v_snd_612_, v___x_614_);
lean_dec(v_snd_612_);
if (v___x_615_ == 0)
{
uint8_t v___x_616_; 
v___x_616_ = 0;
v___y_559_ = v___y_609_;
v___y_560_ = v___y_610_;
v_fst_561_ = v_fst_611_;
v_snd_562_ = v___x_616_;
goto v___jp_558_;
}
else
{
uint8_t v___x_617_; 
v___x_617_ = 2;
v___y_559_ = v___y_609_;
v___y_560_ = v___y_610_;
v_fst_561_ = v_fst_611_;
v_snd_562_ = v___x_617_;
goto v___jp_558_;
}
}
else
{
uint8_t v___x_618_; 
lean_dec(v_snd_612_);
v___x_618_ = 1;
v___y_559_ = v___y_609_;
v___y_560_ = v___y_610_;
v_fst_561_ = v_fst_611_;
v_snd_562_ = v___x_618_;
goto v___jp_558_;
}
}
v___jp_619_:
{
lean_object* v___x_626_; lean_object* v___x_627_; uint64_t v___x_628_; uint64_t v___x_629_; uint8_t v___x_630_; 
v___x_626_ = lean_array_fget_borrowed(v___y_623_, v_fst_624_);
v___x_627_ = lean_array_fget_borrowed(v___y_623_, v___y_620_);
v___x_628_ = lean_unbox_uint64(v___x_626_);
v___x_629_ = lean_unbox_uint64(v___x_627_);
v___x_630_ = lean_uint64_dec_lt(v___x_628_, v___x_629_);
if (v___x_630_ == 0)
{
lean_dec(v___y_621_);
lean_dec(v___y_620_);
v___y_609_ = v___y_622_;
v___y_610_ = v___y_623_;
v_fst_611_ = v_fst_624_;
v_snd_612_ = v_snd_625_;
goto v___jp_608_;
}
else
{
lean_object* v___x_631_; 
lean_dec(v_fst_624_);
v___x_631_ = lean_nat_add(v_snd_625_, v___y_621_);
lean_dec(v___y_621_);
lean_dec(v_snd_625_);
v___y_609_ = v___y_622_;
v___y_610_ = v___y_623_;
v_fst_611_ = v___y_620_;
v_snd_612_ = v___x_631_;
goto v___jp_608_;
}
}
v___jp_632_:
{
lean_object* v___x_640_; lean_object* v___x_641_; uint64_t v___x_642_; uint64_t v___x_643_; uint8_t v___x_644_; 
v___x_640_ = lean_array_fget_borrowed(v___y_636_, v___y_633_);
v___x_641_ = lean_array_fget_borrowed(v___y_636_, v_fst_638_);
v___x_642_ = lean_unbox_uint64(v___x_640_);
v___x_643_ = lean_unbox_uint64(v___x_641_);
v___x_644_ = lean_uint64_dec_lt(v___x_642_, v___x_643_);
if (v___x_644_ == 0)
{
lean_dec(v___y_633_);
v___y_620_ = v_fst_637_;
v___y_621_ = v___y_634_;
v___y_622_ = v___y_635_;
v___y_623_ = v___y_636_;
v_fst_624_ = v_fst_638_;
v_snd_625_ = v_snd_639_;
goto v___jp_619_;
}
else
{
lean_object* v___x_645_; 
lean_dec(v_fst_638_);
v___x_645_ = lean_nat_add(v_snd_639_, v___y_634_);
lean_dec(v_snd_639_);
v___y_620_ = v_fst_637_;
v___y_621_ = v___y_634_;
v___y_622_ = v___y_635_;
v___y_623_ = v___y_636_;
v_fst_624_ = v___y_633_;
v_snd_625_ = v___x_645_;
goto v___jp_619_;
}
}
v___jp_646_:
{
lean_object* v___x_654_; lean_object* v___x_655_; uint64_t v___x_656_; uint64_t v___x_657_; uint8_t v___x_658_; 
v___x_654_ = lean_array_fget_borrowed(v___y_651_, v___y_648_);
v___x_655_ = lean_array_fget_borrowed(v___y_651_, v___y_647_);
v___x_656_ = lean_unbox_uint64(v___x_654_);
v___x_657_ = lean_unbox_uint64(v___x_655_);
v___x_658_ = lean_uint64_dec_lt(v___x_656_, v___x_657_);
if (v___x_658_ == 0)
{
v___y_633_ = v_fst_652_;
v___y_634_ = v___y_650_;
v___y_635_ = v___y_649_;
v___y_636_ = v___y_651_;
v_fst_637_ = v___y_647_;
v_fst_638_ = v___y_648_;
v_snd_639_ = v_snd_653_;
goto v___jp_632_;
}
else
{
lean_object* v___x_659_; 
v___x_659_ = lean_nat_add(v_snd_653_, v___y_650_);
lean_dec(v_snd_653_);
v___y_633_ = v_fst_652_;
v___y_634_ = v___y_650_;
v___y_635_ = v___y_649_;
v___y_636_ = v___y_651_;
v_fst_637_ = v___y_648_;
v_fst_638_ = v___y_647_;
v_snd_639_ = v___x_659_;
goto v___jp_632_;
}
}
v___jp_660_:
{
lean_object* v___x_669_; lean_object* v___x_670_; uint64_t v___x_671_; uint64_t v___x_672_; uint8_t v___x_673_; 
v___x_669_ = lean_array_fget_borrowed(v___y_666_, v_fst_667_);
v___x_670_ = lean_array_fget_borrowed(v___y_666_, v___y_665_);
v___x_671_ = lean_unbox_uint64(v___x_669_);
v___x_672_ = lean_unbox_uint64(v___x_670_);
v___x_673_ = lean_uint64_dec_lt(v___x_671_, v___x_672_);
if (v___x_673_ == 0)
{
lean_dec(v___y_665_);
v___y_647_ = v___y_662_;
v___y_648_ = v___y_661_;
v___y_649_ = v___y_664_;
v___y_650_ = v___y_663_;
v___y_651_ = v___y_666_;
v_fst_652_ = v_fst_667_;
v_snd_653_ = v_snd_668_;
goto v___jp_646_;
}
else
{
lean_object* v___x_674_; 
lean_dec(v_fst_667_);
v___x_674_ = lean_nat_add(v_snd_668_, v___y_663_);
lean_dec(v_snd_668_);
v___y_647_ = v___y_662_;
v___y_648_ = v___y_661_;
v___y_649_ = v___y_664_;
v___y_650_ = v___y_663_;
v___y_651_ = v___y_666_;
v_fst_652_ = v___y_665_;
v_snd_653_ = v___x_674_;
goto v___jp_646_;
}
}
v___jp_675_:
{
lean_object* v___x_685_; lean_object* v___x_686_; uint64_t v___x_687_; uint64_t v___x_688_; uint8_t v___x_689_; 
v___x_685_ = lean_array_fget_borrowed(v___y_681_, v___y_676_);
v___x_686_ = lean_array_fget_borrowed(v___y_681_, v_fst_683_);
v___x_687_ = lean_unbox_uint64(v___x_685_);
v___x_688_ = lean_unbox_uint64(v___x_686_);
v___x_689_ = lean_uint64_dec_lt(v___x_687_, v___x_688_);
if (v___x_689_ == 0)
{
lean_dec(v___y_676_);
v___y_661_ = v___y_678_;
v___y_662_ = v___y_677_;
v___y_663_ = v___y_680_;
v___y_664_ = v___y_679_;
v___y_665_ = v_fst_682_;
v___y_666_ = v___y_681_;
v_fst_667_ = v_fst_683_;
v_snd_668_ = v_snd_684_;
goto v___jp_660_;
}
else
{
lean_object* v___x_690_; 
lean_dec(v_fst_683_);
v___x_690_ = lean_nat_add(v_snd_684_, v___y_680_);
lean_dec(v_snd_684_);
v___y_661_ = v___y_678_;
v___y_662_ = v___y_677_;
v___y_663_ = v___y_680_;
v___y_664_ = v___y_679_;
v___y_665_ = v_fst_682_;
v___y_666_ = v___y_681_;
v_fst_667_ = v___y_676_;
v_snd_668_ = v___x_690_;
goto v___jp_660_;
}
}
v___jp_691_:
{
lean_object* v___x_700_; lean_object* v___x_701_; lean_object* v___x_702_; lean_object* v___x_703_; lean_object* v___x_704_; lean_object* v___x_705_; lean_object* v___x_706_; uint64_t v___x_707_; uint64_t v___x_708_; uint8_t v___x_709_; 
v___x_700_ = lean_unsigned_to_nat(3u);
v___x_701_ = lean_nat_mul(v___y_696_, v___x_700_);
lean_dec(v___y_696_);
v___x_702_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_701_, v___x_509_, lean_box(0), lean_box(0));
v___x_703_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_701_, v___y_695_, lean_box(0), lean_box(0));
v___x_704_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_701_, v___y_692_, lean_box(0), lean_box(0));
lean_dec(v___x_701_);
v___x_705_ = lean_array_fget_borrowed(v___y_697_, v___x_703_);
v___x_706_ = lean_array_fget_borrowed(v___y_697_, v___x_702_);
v___x_707_ = lean_unbox_uint64(v___x_705_);
v___x_708_ = lean_unbox_uint64(v___x_706_);
v___x_709_ = lean_uint64_dec_lt(v___x_707_, v___x_708_);
if (v___x_709_ == 0)
{
v___y_676_ = v___x_704_;
v___y_677_ = v___y_693_;
v___y_678_ = v_fst_698_;
v___y_679_ = v___y_694_;
v___y_680_ = v___y_695_;
v___y_681_ = v___y_697_;
v_fst_682_ = v___x_702_;
v_fst_683_ = v___x_703_;
v_snd_684_ = v_snd_699_;
goto v___jp_675_;
}
else
{
lean_object* v___x_710_; 
v___x_710_ = lean_nat_add(v_snd_699_, v___y_695_);
lean_dec(v_snd_699_);
v___y_676_ = v___x_704_;
v___y_677_ = v___y_693_;
v___y_678_ = v_fst_698_;
v___y_679_ = v___y_694_;
v___y_680_ = v___y_695_;
v___y_681_ = v___y_697_;
v_fst_682_ = v___x_703_;
v_fst_683_ = v___x_702_;
v_snd_684_ = v___x_710_;
goto v___jp_675_;
}
}
v___jp_711_:
{
lean_object* v___x_721_; lean_object* v___x_722_; uint64_t v___x_723_; uint64_t v___x_724_; uint8_t v___x_725_; 
v___x_721_ = lean_array_fget_borrowed(v___y_717_, v_fst_719_);
v___x_722_ = lean_array_fget_borrowed(v___y_717_, v___y_718_);
v___x_723_ = lean_unbox_uint64(v___x_721_);
v___x_724_ = lean_unbox_uint64(v___x_722_);
v___x_725_ = lean_uint64_dec_lt(v___x_723_, v___x_724_);
if (v___x_725_ == 0)
{
lean_dec(v___y_718_);
v___y_692_ = v___y_712_;
v___y_693_ = v___y_713_;
v___y_694_ = v___y_716_;
v___y_695_ = v___y_715_;
v___y_696_ = v___y_714_;
v___y_697_ = v___y_717_;
v_fst_698_ = v_fst_719_;
v_snd_699_ = v_snd_720_;
goto v___jp_691_;
}
else
{
lean_object* v___x_726_; 
lean_dec(v_fst_719_);
v___x_726_ = lean_nat_add(v_snd_720_, v___y_715_);
lean_dec(v_snd_720_);
v___y_692_ = v___y_712_;
v___y_693_ = v___y_713_;
v___y_694_ = v___y_716_;
v___y_695_ = v___y_715_;
v___y_696_ = v___y_714_;
v___y_697_ = v___y_717_;
v_fst_698_ = v___y_718_;
v_snd_699_ = v___x_726_;
goto v___jp_691_;
}
}
v___jp_727_:
{
lean_object* v___x_738_; lean_object* v___x_739_; uint64_t v___x_740_; uint64_t v___x_741_; uint8_t v___x_742_; 
v___x_738_ = lean_array_fget_borrowed(v___y_734_, v___y_729_);
v___x_739_ = lean_array_fget_borrowed(v___y_734_, v_fst_736_);
v___x_740_ = lean_unbox_uint64(v___x_738_);
v___x_741_ = lean_unbox_uint64(v___x_739_);
v___x_742_ = lean_uint64_dec_lt(v___x_740_, v___x_741_);
if (v___x_742_ == 0)
{
lean_dec(v___y_729_);
v___y_712_ = v___y_728_;
v___y_713_ = v___y_730_;
v___y_714_ = v___y_733_;
v___y_715_ = v___y_732_;
v___y_716_ = v___y_731_;
v___y_717_ = v___y_734_;
v___y_718_ = v_fst_735_;
v_fst_719_ = v_fst_736_;
v_snd_720_ = v_snd_737_;
goto v___jp_711_;
}
else
{
lean_object* v___x_743_; 
lean_dec(v_fst_736_);
v___x_743_ = lean_nat_add(v_snd_737_, v___y_732_);
lean_dec(v_snd_737_);
v___y_712_ = v___y_728_;
v___y_713_ = v___y_730_;
v___y_714_ = v___y_733_;
v___y_715_ = v___y_732_;
v___y_716_ = v___y_731_;
v___y_717_ = v___y_734_;
v___y_718_ = v_fst_735_;
v_fst_719_ = v___y_729_;
v_snd_720_ = v___x_743_;
goto v___jp_711_;
}
}
v___jp_744_:
{
lean_object* v___x_752_; lean_object* v___x_753_; lean_object* v___x_754_; lean_object* v___x_755_; lean_object* v___x_756_; lean_object* v___x_757_; uint64_t v___x_758_; uint64_t v___x_759_; uint8_t v___x_760_; 
v___x_752_ = lean_nat_mul(v___y_748_, v___y_745_);
v___x_753_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_752_, v___x_509_, lean_box(0), lean_box(0));
v___x_754_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_752_, v___y_747_, lean_box(0), lean_box(0));
v___x_755_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_752_, v___y_745_, lean_box(0), lean_box(0));
lean_dec(v___x_752_);
v___x_756_ = lean_array_fget_borrowed(v___y_749_, v___x_754_);
v___x_757_ = lean_array_fget_borrowed(v___y_749_, v___x_753_);
v___x_758_ = lean_unbox_uint64(v___x_756_);
v___x_759_ = lean_unbox_uint64(v___x_757_);
v___x_760_ = lean_uint64_dec_lt(v___x_758_, v___x_759_);
if (v___x_760_ == 0)
{
v___y_728_ = v___y_745_;
v___y_729_ = v___x_755_;
v___y_730_ = v_fst_750_;
v___y_731_ = v___y_746_;
v___y_732_ = v___y_747_;
v___y_733_ = v___y_748_;
v___y_734_ = v___y_749_;
v_fst_735_ = v___x_753_;
v_fst_736_ = v___x_754_;
v_snd_737_ = v_snd_751_;
goto v___jp_727_;
}
else
{
lean_object* v___x_761_; 
v___x_761_ = lean_nat_add(v_snd_751_, v___y_747_);
lean_dec(v_snd_751_);
v___y_728_ = v___y_745_;
v___y_729_ = v___x_755_;
v___y_730_ = v_fst_750_;
v___y_731_ = v___y_746_;
v___y_732_ = v___y_747_;
v___y_733_ = v___y_748_;
v___y_734_ = v___y_749_;
v_fst_735_ = v___x_754_;
v_fst_736_ = v___x_753_;
v_snd_737_ = v___x_761_;
goto v___jp_727_;
}
}
v___jp_762_:
{
lean_object* v___x_771_; lean_object* v___x_772_; uint64_t v___x_773_; uint64_t v___x_774_; uint8_t v___x_775_; 
v___x_771_ = lean_array_fget_borrowed(v___y_768_, v_fst_769_);
v___x_772_ = lean_array_fget_borrowed(v___y_768_, v___y_764_);
v___x_773_ = lean_unbox_uint64(v___x_771_);
v___x_774_ = lean_unbox_uint64(v___x_772_);
v___x_775_ = lean_uint64_dec_lt(v___x_773_, v___x_774_);
if (v___x_775_ == 0)
{
lean_dec(v___y_764_);
v___y_745_ = v___y_763_;
v___y_746_ = v___y_767_;
v___y_747_ = v___y_766_;
v___y_748_ = v___y_765_;
v___y_749_ = v___y_768_;
v_fst_750_ = v_fst_769_;
v_snd_751_ = v_snd_770_;
goto v___jp_744_;
}
else
{
lean_object* v___x_776_; 
lean_dec(v_fst_769_);
v___x_776_ = lean_nat_add(v_snd_770_, v___y_766_);
lean_dec(v_snd_770_);
v___y_745_ = v___y_763_;
v___y_746_ = v___y_767_;
v___y_747_ = v___y_766_;
v___y_748_ = v___y_765_;
v___y_749_ = v___y_768_;
v_fst_750_ = v___y_764_;
v_snd_751_ = v___x_776_;
goto v___jp_744_;
}
}
v___jp_777_:
{
lean_object* v___x_787_; lean_object* v___x_788_; uint64_t v___x_789_; uint64_t v___x_790_; uint8_t v___x_791_; 
v___x_787_ = lean_array_fget_borrowed(v___y_782_, v___y_783_);
v___x_788_ = lean_array_fget_borrowed(v___y_782_, v_fst_785_);
v___x_789_ = lean_unbox_uint64(v___x_787_);
v___x_790_ = lean_unbox_uint64(v___x_788_);
v___x_791_ = lean_uint64_dec_lt(v___x_789_, v___x_790_);
if (v___x_791_ == 0)
{
lean_dec(v___y_783_);
v___y_763_ = v___y_778_;
v___y_764_ = v_fst_784_;
v___y_765_ = v___y_781_;
v___y_766_ = v___y_780_;
v___y_767_ = v___y_779_;
v___y_768_ = v___y_782_;
v_fst_769_ = v_fst_785_;
v_snd_770_ = v_snd_786_;
goto v___jp_762_;
}
else
{
lean_object* v___x_792_; 
lean_dec(v_fst_785_);
v___x_792_ = lean_nat_add(v_snd_786_, v___y_780_);
lean_dec(v_snd_786_);
v___y_763_ = v___y_778_;
v___y_764_ = v_fst_784_;
v___y_765_ = v___y_781_;
v___y_766_ = v___y_780_;
v___y_767_ = v___y_779_;
v___y_768_ = v___y_782_;
v_fst_769_ = v___y_783_;
v_snd_770_ = v___x_792_;
goto v___jp_762_;
}
}
v___jp_793_:
{
uint8_t v___x_798_; uint8_t v_down_799_; 
v___x_798_ = 1;
v_down_799_ = l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(v_lo_496_, v_fst_797_, v_a_498_, v_afterEqual_503_, v___y_794_);
if (v_down_799_ == 0)
{
lean_object* v___x_800_; lean_object* v_snd_801_; lean_object* v_fst_802_; lean_object* v_fst_803_; lean_object* v_snd_804_; lean_object* v___x_805_; lean_object* v___x_806_; uint8_t v___x_807_; 
v___x_800_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg(v_n_495_, v_fst_797_, v_a_498_, v_b_499_, v___y_794_);
lean_dec(v___y_794_);
v_snd_801_ = lean_ctor_get(v___x_800_, 1);
lean_inc(v_snd_801_);
v_fst_802_ = lean_ctor_get(v___x_800_, 0);
lean_inc(v_fst_802_);
lean_dec_ref(v___x_800_);
v_fst_803_ = lean_ctor_get(v_snd_801_, 0);
lean_inc(v_fst_803_);
v_snd_804_ = lean_ctor_get(v_snd_801_, 1);
lean_inc(v_snd_804_);
lean_dec(v_snd_801_);
v___x_805_ = lean_nat_sub(v_fst_803_, v_a_498_);
v___x_806_ = lean_nat_sub(v_b_499_, v_fst_803_);
v___x_807_ = lean_nat_dec_lt(v___x_805_, v___x_806_);
if (v___x_807_ == 0)
{
lean_object* v___x_808_; lean_object* v___x_809_; lean_object* v___x_810_; lean_object* v___x_811_; uint8_t v___x_812_; uint8_t v___x_813_; 
lean_dec(v___x_805_);
v___x_808_ = lean_nat_add(v_fst_803_, v___y_796_);
lean_dec(v___y_796_);
lean_inc(v_n_513_);
lean_inc(v___y_795_);
v___x_809_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_494_, v_n_495_, v_lo_496_, v_fst_802_, v___x_808_, v_b_499_, v___y_795_, v___x_798_, v___x_798_, v___x_807_, v_n_513_);
v___x_810_ = lean_unsigned_to_nat(3u);
v___x_811_ = lean_nat_shiftr(v___x_505_, v___x_810_);
lean_dec(v___x_505_);
v___x_812_ = lean_nat_dec_le(v___x_811_, v___x_806_);
lean_dec(v___x_806_);
lean_dec(v___x_811_);
v___x_813_ = lean_unbox(v_snd_804_);
lean_dec(v_snd_804_);
v_xs_497_ = v___x_809_;
v_b_499_ = v_fst_803_;
v_limit_500_ = v___y_795_;
v_balanced_501_ = v___x_812_;
v_partitioned_502_ = v___x_813_;
v_afterEqual_503_ = v___x_807_;
v_fuel_504_ = v_n_513_;
goto _start;
}
else
{
lean_object* v___x_815_; lean_object* v___x_816_; lean_object* v___x_817_; lean_object* v___x_818_; uint8_t v___x_819_; uint8_t v___x_820_; 
lean_dec(v___x_806_);
lean_inc(v_n_513_);
lean_inc(v___y_795_);
lean_inc(v_fst_803_);
v___x_815_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_494_, v_n_495_, v_lo_496_, v_fst_802_, v_a_498_, v_fst_803_, v___y_795_, v___x_798_, v___x_798_, v_down_799_, v_n_513_);
v___x_816_ = lean_nat_add(v_fst_803_, v___y_796_);
lean_dec(v___y_796_);
lean_dec(v_fst_803_);
v___x_817_ = lean_unsigned_to_nat(3u);
v___x_818_ = lean_nat_shiftr(v___x_505_, v___x_817_);
lean_dec(v___x_505_);
v___x_819_ = lean_nat_dec_le(v___x_818_, v___x_805_);
lean_dec(v___x_805_);
lean_dec(v___x_818_);
v___x_820_ = lean_unbox(v_snd_804_);
lean_dec(v_snd_804_);
v_xs_497_ = v___x_815_;
v_a_498_ = v___x_816_;
v_limit_500_ = v___y_795_;
v_balanced_501_ = v___x_819_;
v_partitioned_502_ = v___x_820_;
v_afterEqual_503_ = v_down_799_;
v_fuel_504_ = v_n_513_;
goto _start;
}
}
else
{
lean_object* v___x_822_; lean_object* v_fst_823_; lean_object* v_snd_824_; 
lean_dec(v___y_796_);
lean_dec(v___x_505_);
v___x_822_ = l_Array_QSort_Internal_partitionEqualId___redArg(v___x_494_, v___f_508_, v_fst_797_, v_a_498_, v_b_499_, v___y_794_);
lean_dec(v___y_794_);
lean_dec(v_a_498_);
v_fst_823_ = lean_ctor_get(v___x_822_, 0);
lean_inc(v_fst_823_);
v_snd_824_ = lean_ctor_get(v___x_822_, 1);
lean_inc(v_snd_824_);
lean_dec_ref(v___x_822_);
v_xs_497_ = v_fst_823_;
v_a_498_ = v_snd_824_;
v_limit_500_ = v___y_795_;
v_afterEqual_503_ = v___x_798_;
v_fuel_504_ = v_n_513_;
goto _start;
}
}
v___jp_826_:
{
if (v_balanced_501_ == 0)
{
v___y_794_ = v_fst_831_;
v___y_795_ = v___y_828_;
v___y_796_ = v___y_829_;
v_fst_797_ = v_fst_830_;
goto v___jp_793_;
}
else
{
if (v_partitioned_502_ == 0)
{
v___y_794_ = v_fst_831_;
v___y_795_ = v___y_828_;
v___y_796_ = v___y_829_;
v_fst_797_ = v_fst_830_;
goto v___jp_793_;
}
else
{
uint8_t v___x_833_; 
v___x_833_ = l_Array_QSort_Internal_instBEqHint_beq(v_snd_832_, v___y_827_);
if (v___x_833_ == 0)
{
v___y_794_ = v_fst_831_;
v___y_795_ = v___y_828_;
v___y_796_ = v___y_829_;
v_fst_797_ = v_fst_830_;
goto v___jp_793_;
}
else
{
lean_object* v___x_834_; lean_object* v_snd_835_; uint8_t v___x_836_; 
v___x_834_ = l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg(v_n_495_, v_fst_830_, v_a_498_, v_b_499_);
v_snd_835_ = lean_ctor_get(v___x_834_, 1);
v___x_836_ = lean_unbox(v_snd_835_);
if (v___x_836_ == 0)
{
lean_object* v_fst_837_; 
v_fst_837_ = lean_ctor_get(v___x_834_, 0);
lean_inc(v_fst_837_);
lean_dec_ref(v___x_834_);
v___y_794_ = v_fst_831_;
v___y_795_ = v___y_828_;
v___y_796_ = v___y_829_;
v_fst_797_ = v_fst_837_;
goto v___jp_793_;
}
else
{
lean_object* v_fst_838_; 
lean_dec(v_fst_831_);
lean_dec(v___y_829_);
lean_dec(v___y_828_);
lean_dec(v_n_513_);
lean_dec(v___x_505_);
lean_dec(v_b_499_);
lean_dec(v_a_498_);
v_fst_838_ = lean_ctor_get(v___x_834_, 0);
lean_inc(v_fst_838_);
lean_dec_ref(v___x_834_);
return v_fst_838_;
}
}
}
}
}
v___jp_839_:
{
lean_object* v___x_842_; uint8_t v___x_843_; 
v___x_842_ = lean_unsigned_to_nat(8u);
v___x_843_ = lean_nat_dec_le(v___x_842_, v___x_505_);
if (v___x_843_ == 0)
{
lean_object* v___x_844_; lean_object* v___x_845_; lean_object* v___x_846_; lean_object* v___x_847_; uint8_t v___x_848_; uint8_t v___x_849_; 
v___x_844_ = lean_unsigned_to_nat(2u);
v___x_845_ = lean_nat_shiftr(v___x_505_, v___x_844_);
v___x_846_ = lean_nat_mul(v___x_845_, v___x_844_);
lean_dec(v___x_845_);
v___x_847_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_846_, v_one_512_, lean_box(0), lean_box(0));
lean_dec(v___x_846_);
v___x_848_ = 1;
v___x_849_ = lean_uint8_once(&l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__1, &l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__1_once, _init_l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___closed__1);
if (v___x_849_ == 0)
{
v___y_827_ = v___x_848_;
v___y_828_ = v_snd_841_;
v___y_829_ = v_one_512_;
v_fst_830_ = v_fst_840_;
v_fst_831_ = v___x_847_;
v_snd_832_ = v___x_848_;
goto v___jp_826_;
}
else
{
lean_object* v___x_850_; lean_object* v___x_851_; lean_object* v___x_852_; lean_object* v___x_853_; 
lean_inc(v_b_499_);
lean_inc(v_a_498_);
v___x_850_ = l_Array_QSort_Internal_reverseRange___redArg(v_fst_840_, v_a_498_, v_b_499_);
v___x_851_ = lean_nat_sub(v_b_499_, v_one_512_);
v___x_852_ = lean_nat_sub(v___x_847_, v_a_498_);
lean_dec(v___x_847_);
v___x_853_ = lean_nat_sub(v___x_851_, v___x_852_);
lean_dec(v___x_852_);
lean_dec(v___x_851_);
v___y_827_ = v___x_848_;
v___y_828_ = v_snd_841_;
v___y_829_ = v_one_512_;
v_fst_830_ = v___x_850_;
v_fst_831_ = v___x_853_;
v_snd_832_ = v___x_848_;
goto v___jp_826_;
}
}
else
{
lean_object* v___x_854_; uint8_t v___x_855_; 
v___x_854_ = lean_unsigned_to_nat(50u);
v___x_855_ = lean_nat_dec_le(v___x_854_, v___x_505_);
if (v___x_855_ == 0)
{
lean_object* v___x_856_; lean_object* v___x_857_; lean_object* v___x_858_; lean_object* v___x_859_; lean_object* v___x_860_; lean_object* v___x_861_; lean_object* v___x_862_; lean_object* v___x_863_; lean_object* v___x_864_; lean_object* v___x_865_; uint64_t v___x_866_; uint64_t v___x_867_; uint8_t v___x_868_; 
v___x_856_ = lean_unsigned_to_nat(2u);
v___x_857_ = lean_nat_shiftr(v___x_505_, v___x_856_);
v___x_858_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_857_, v_one_512_, lean_box(0), lean_box(0));
v___x_859_ = lean_nat_mul(v___x_857_, v___x_856_);
v___x_860_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_859_, v_one_512_, lean_box(0), lean_box(0));
lean_dec(v___x_859_);
v___x_861_ = lean_unsigned_to_nat(3u);
v___x_862_ = lean_nat_mul(v___x_857_, v___x_861_);
lean_dec(v___x_857_);
v___x_863_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_862_, v_one_512_, lean_box(0), lean_box(0));
lean_dec(v___x_862_);
v___x_864_ = lean_array_fget_borrowed(v_fst_840_, v___x_860_);
v___x_865_ = lean_array_fget_borrowed(v_fst_840_, v___x_858_);
v___x_866_ = lean_unbox_uint64(v___x_864_);
v___x_867_ = lean_unbox_uint64(v___x_865_);
v___x_868_ = lean_uint64_dec_lt(v___x_866_, v___x_867_);
if (v___x_868_ == 0)
{
v___y_595_ = v___x_863_;
v___y_596_ = v_snd_841_;
v___y_597_ = v_fst_840_;
v___y_598_ = v_one_512_;
v_fst_599_ = v___x_858_;
v_fst_600_ = v___x_860_;
v_snd_601_ = v___x_509_;
goto v___jp_594_;
}
else
{
v___y_595_ = v___x_863_;
v___y_596_ = v_snd_841_;
v___y_597_ = v_fst_840_;
v___y_598_ = v_one_512_;
v_fst_599_ = v___x_860_;
v_fst_600_ = v___x_858_;
v_snd_601_ = v_one_512_;
goto v___jp_594_;
}
}
else
{
lean_object* v___x_869_; lean_object* v___x_870_; lean_object* v___x_871_; lean_object* v___x_872_; lean_object* v___x_873_; lean_object* v___x_874_; lean_object* v___x_875_; uint64_t v___x_876_; uint64_t v___x_877_; uint8_t v___x_878_; 
v___x_869_ = lean_unsigned_to_nat(2u);
v___x_870_ = lean_nat_shiftr(v___x_505_, v___x_869_);
v___x_871_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_870_, v___x_509_, lean_box(0), lean_box(0));
v___x_872_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_870_, v_one_512_, lean_box(0), lean_box(0));
v___x_873_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___lam__0(v_a_498_, v___x_870_, v___x_869_, lean_box(0), lean_box(0));
v___x_874_ = lean_array_fget_borrowed(v_fst_840_, v___x_872_);
v___x_875_ = lean_array_fget_borrowed(v_fst_840_, v___x_871_);
v___x_876_ = lean_unbox_uint64(v___x_874_);
v___x_877_ = lean_unbox_uint64(v___x_875_);
v___x_878_ = lean_uint64_dec_lt(v___x_876_, v___x_877_);
if (v___x_878_ == 0)
{
v___y_778_ = v___x_869_;
v___y_779_ = v_snd_841_;
v___y_780_ = v_one_512_;
v___y_781_ = v___x_870_;
v___y_782_ = v_fst_840_;
v___y_783_ = v___x_873_;
v_fst_784_ = v___x_871_;
v_fst_785_ = v___x_872_;
v_snd_786_ = v___x_509_;
goto v___jp_777_;
}
else
{
v___y_778_ = v___x_869_;
v___y_779_ = v_snd_841_;
v___y_780_ = v_one_512_;
v___y_781_ = v___x_870_;
v___y_782_ = v_fst_840_;
v___y_783_ = v___x_873_;
v_fst_784_ = v___x_872_;
v_fst_785_ = v___x_871_;
v_snd_786_ = v_one_512_;
goto v___jp_777_;
}
}
}
}
}
else
{
lean_object* v___x_881_; 
lean_dec(v___x_505_);
lean_dec(v_fuel_504_);
lean_dec(v_limit_500_);
v___x_881_ = l_Array_QSort_Internal_heapSortId___redArg(v___x_494_, v___f_508_, v_xs_497_, v_a_498_, v_b_499_);
lean_dec(v_b_499_);
lean_dec(v_a_498_);
return v___x_881_;
}
}
else
{
lean_object* v___x_882_; 
lean_dec(v___x_505_);
lean_dec(v_fuel_504_);
lean_dec(v_limit_500_);
v___x_882_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___redArg(v_n_495_, v_xs_497_, v_a_498_, v_b_499_);
lean_dec(v_b_499_);
lean_dec(v_a_498_);
return v___x_882_;
}
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg___boxed(lean_object* v___x_883_, lean_object* v_n_884_, lean_object* v_lo_885_, lean_object* v_xs_886_, lean_object* v_a_887_, lean_object* v_b_888_, lean_object* v_limit_889_, lean_object* v_balanced_890_, lean_object* v_partitioned_891_, lean_object* v_afterEqual_892_, lean_object* v_fuel_893_){
_start:
{
uint8_t v_balanced_boxed_894_; uint8_t v_partitioned_boxed_895_; uint8_t v_afterEqual_boxed_896_; lean_object* v_res_897_; 
v_balanced_boxed_894_ = lean_unbox(v_balanced_890_);
v_partitioned_boxed_895_ = lean_unbox(v_partitioned_891_);
v_afterEqual_boxed_896_ = lean_unbox(v_afterEqual_892_);
v_res_897_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_883_, v_n_884_, v_lo_885_, v_xs_886_, v_a_887_, v_b_888_, v_limit_889_, v_balanced_boxed_894_, v_partitioned_boxed_895_, v_afterEqual_boxed_896_, v_fuel_893_);
lean_dec(v_lo_885_);
lean_dec(v_n_884_);
lean_dec(v___x_883_);
return v_res_897_;
}
}
LEAN_EXPORT lean_object* l_Array_qsortOrd___at___00main_spec__1(lean_object* v_xs_898_){
_start:
{
lean_object* v___x_899_; lean_object* v___x_900_; uint8_t v___x_901_; 
v___x_899_ = lean_array_get_size(v_xs_898_);
v___x_900_ = lean_unsigned_to_nat(0u);
v___x_901_ = lean_nat_dec_eq(v___x_899_, v___x_900_);
if (v___x_901_ == 0)
{
lean_object* v___x_902_; lean_object* v___y_904_; lean_object* v___y_905_; lean_object* v___x_912_; lean_object* v___y_914_; uint8_t v___x_916_; 
v___x_902_ = lean_unsigned_to_nat(1u);
v___x_912_ = lean_nat_sub(v___x_899_, v___x_902_);
v___x_916_ = lean_nat_dec_le(v___x_900_, v___x_912_);
if (v___x_916_ == 0)
{
lean_inc(v___x_912_);
v___y_914_ = v___x_912_;
goto v___jp_913_;
}
else
{
v___y_914_ = v___x_900_;
goto v___jp_913_;
}
v___jp_903_:
{
lean_object* v___x_906_; lean_object* v___x_907_; lean_object* v___x_908_; lean_object* v___x_909_; uint8_t v___x_910_; lean_object* v___x_911_; 
v___x_906_ = lean_nat_add(v___y_905_, v___x_902_);
lean_dec(v___y_905_);
v___x_907_ = lean_nat_sub(v___x_906_, v___y_904_);
v___x_908_ = lean_nat_log2(v___x_907_);
v___x_909_ = lean_nat_add(v___x_908_, v___x_902_);
lean_dec(v___x_908_);
v___x_910_ = 1;
lean_inc(v___y_904_);
v___x_911_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_899_, v___x_899_, v___y_904_, v_xs_898_, v___y_904_, v___x_906_, v___x_909_, v___x_910_, v___x_910_, v___x_901_, v___x_907_);
lean_dec(v___y_904_);
return v___x_911_;
}
v___jp_913_:
{
uint8_t v___x_915_; 
v___x_915_ = lean_nat_dec_le(v___y_914_, v___x_912_);
if (v___x_915_ == 0)
{
lean_dec(v___x_912_);
lean_inc(v___y_914_);
v___y_904_ = v___y_914_;
v___y_905_ = v___y_914_;
goto v___jp_903_;
}
else
{
v___y_904_ = v___y_914_;
v___y_905_ = v___x_912_;
goto v___jp_903_;
}
}
}
else
{
return v_xs_898_;
}
}
}
LEAN_EXPORT lean_object* l_main___lam__0(lean_object* v___x_917_, lean_object* v___x_918_, lean_object* v___x_919_){
_start:
{
lean_object* v___x_921_; lean_object* v_a_922_; lean_object* v___x_924_; uint8_t v_isShared_925_; uint8_t v_isSharedCheck_931_; 
v___x_921_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg(v___x_917_, v___x_918_, v___x_919_);
v_a_922_ = lean_ctor_get(v___x_921_, 0);
v_isSharedCheck_931_ = !lean_is_exclusive(v___x_921_);
if (v_isSharedCheck_931_ == 0)
{
v___x_924_ = v___x_921_;
v_isShared_925_ = v_isSharedCheck_931_;
goto v_resetjp_923_;
}
else
{
lean_inc(v_a_922_);
lean_dec(v___x_921_);
v___x_924_ = lean_box(0);
v_isShared_925_ = v_isSharedCheck_931_;
goto v_resetjp_923_;
}
v_resetjp_923_:
{
lean_object* v_snd_926_; lean_object* v___x_927_; lean_object* v___x_929_; 
v_snd_926_ = lean_ctor_get(v_a_922_, 1);
lean_inc(v_snd_926_);
lean_dec(v_a_922_);
v___x_927_ = l_Array_qsortOrd___at___00main_spec__1(v_snd_926_);
if (v_isShared_925_ == 0)
{
lean_ctor_set(v___x_924_, 0, v___x_927_);
v___x_929_ = v___x_924_;
goto v_reusejp_928_;
}
else
{
lean_object* v_reuseFailAlloc_930_; 
v_reuseFailAlloc_930_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_930_, 0, v___x_927_);
v___x_929_ = v_reuseFailAlloc_930_;
goto v_reusejp_928_;
}
v_reusejp_928_:
{
return v___x_929_;
}
}
}
}
LEAN_EXPORT lean_object* l_main___lam__0___boxed(lean_object* v___x_932_, lean_object* v___x_933_, lean_object* v___x_934_, lean_object* v___y_935_){
_start:
{
lean_object* v_res_936_; 
v_res_936_ = l_main___lam__0(v___x_932_, v___x_933_, v___x_934_);
lean_dec_ref(v___x_932_);
return v_res_936_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(lean_object* v_a_937_, lean_object* v_range_938_, lean_object* v_b_939_, lean_object* v_i_940_){
_start:
{
lean_object* v_stop_942_; lean_object* v_step_943_; uint8_t v___x_944_; 
v_stop_942_ = lean_ctor_get(v_range_938_, 1);
v_step_943_ = lean_ctor_get(v_range_938_, 2);
v___x_944_ = lean_nat_dec_lt(v_i_940_, v_stop_942_);
if (v___x_944_ == 0)
{
lean_object* v___x_945_; 
lean_dec(v_i_940_);
v___x_945_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_945_, 0, v_b_939_);
return v___x_945_;
}
else
{
lean_object* v___x_946_; lean_object* v___x_947_; uint8_t v___x_948_; uint64_t v___x_949_; lean_object* v___x_950_; lean_object* v___x_951_; uint8_t v___x_952_; uint64_t v___x_953_; uint64_t v___x_954_; uint64_t v___x_955_; uint64_t v___x_956_; lean_object* v___x_957_; lean_object* v___x_958_; uint8_t v___x_959_; uint64_t v___x_960_; uint64_t v___x_961_; uint64_t v___x_962_; uint64_t v___x_963_; lean_object* v___x_964_; lean_object* v___x_965_; uint8_t v___x_966_; uint64_t v___x_967_; uint64_t v___x_968_; uint64_t v___x_969_; uint64_t v___x_970_; lean_object* v___x_971_; lean_object* v___x_972_; uint8_t v___x_973_; uint64_t v___x_974_; uint64_t v___x_975_; uint64_t v___x_976_; uint64_t v___x_977_; lean_object* v___x_978_; lean_object* v___x_979_; uint8_t v___x_980_; uint64_t v___x_981_; uint64_t v___x_982_; uint64_t v___x_983_; uint64_t v___x_984_; lean_object* v___x_985_; lean_object* v___x_986_; uint8_t v___x_987_; uint64_t v___x_988_; uint64_t v___x_989_; uint64_t v___x_990_; uint64_t v___x_991_; lean_object* v___x_992_; lean_object* v___x_993_; uint8_t v___x_994_; uint64_t v___x_995_; uint64_t v___x_996_; uint64_t v___x_997_; uint64_t v___x_998_; lean_object* v___x_999_; lean_object* v___x_1000_; lean_object* v___x_1001_; 
v___x_946_ = lean_unsigned_to_nat(8u);
v___x_947_ = lean_nat_mul(v_i_940_, v___x_946_);
v___x_948_ = lean_byte_array_get(v_a_937_, v___x_947_);
v___x_949_ = lean_uint8_to_uint64(v___x_948_);
v___x_950_ = lean_unsigned_to_nat(1u);
v___x_951_ = lean_nat_add(v___x_947_, v___x_950_);
v___x_952_ = lean_byte_array_get(v_a_937_, v___x_951_);
lean_dec(v___x_951_);
v___x_953_ = lean_uint8_to_uint64(v___x_952_);
v___x_954_ = 8ULL;
v___x_955_ = lean_uint64_shift_left(v___x_953_, v___x_954_);
v___x_956_ = lean_uint64_add(v___x_949_, v___x_955_);
v___x_957_ = lean_unsigned_to_nat(2u);
v___x_958_ = lean_nat_add(v___x_947_, v___x_957_);
v___x_959_ = lean_byte_array_get(v_a_937_, v___x_958_);
lean_dec(v___x_958_);
v___x_960_ = lean_uint8_to_uint64(v___x_959_);
v___x_961_ = 16ULL;
v___x_962_ = lean_uint64_shift_left(v___x_960_, v___x_961_);
v___x_963_ = lean_uint64_add(v___x_956_, v___x_962_);
v___x_964_ = lean_unsigned_to_nat(3u);
v___x_965_ = lean_nat_add(v___x_947_, v___x_964_);
v___x_966_ = lean_byte_array_get(v_a_937_, v___x_965_);
lean_dec(v___x_965_);
v___x_967_ = lean_uint8_to_uint64(v___x_966_);
v___x_968_ = 24ULL;
v___x_969_ = lean_uint64_shift_left(v___x_967_, v___x_968_);
v___x_970_ = lean_uint64_add(v___x_963_, v___x_969_);
v___x_971_ = lean_unsigned_to_nat(4u);
v___x_972_ = lean_nat_add(v___x_947_, v___x_971_);
v___x_973_ = lean_byte_array_get(v_a_937_, v___x_972_);
lean_dec(v___x_972_);
v___x_974_ = lean_uint8_to_uint64(v___x_973_);
v___x_975_ = 32ULL;
v___x_976_ = lean_uint64_shift_left(v___x_974_, v___x_975_);
v___x_977_ = lean_uint64_add(v___x_970_, v___x_976_);
v___x_978_ = lean_unsigned_to_nat(5u);
v___x_979_ = lean_nat_add(v___x_947_, v___x_978_);
v___x_980_ = lean_byte_array_get(v_a_937_, v___x_979_);
lean_dec(v___x_979_);
v___x_981_ = lean_uint8_to_uint64(v___x_980_);
v___x_982_ = 40ULL;
v___x_983_ = lean_uint64_shift_left(v___x_981_, v___x_982_);
v___x_984_ = lean_uint64_add(v___x_977_, v___x_983_);
v___x_985_ = lean_unsigned_to_nat(6u);
v___x_986_ = lean_nat_add(v___x_947_, v___x_985_);
v___x_987_ = lean_byte_array_get(v_a_937_, v___x_986_);
lean_dec(v___x_986_);
v___x_988_ = lean_uint8_to_uint64(v___x_987_);
v___x_989_ = 48ULL;
v___x_990_ = lean_uint64_shift_left(v___x_988_, v___x_989_);
v___x_991_ = lean_uint64_add(v___x_984_, v___x_990_);
v___x_992_ = lean_unsigned_to_nat(7u);
v___x_993_ = lean_nat_add(v___x_947_, v___x_992_);
lean_dec(v___x_947_);
v___x_994_ = lean_byte_array_get(v_a_937_, v___x_993_);
lean_dec(v___x_993_);
v___x_995_ = lean_uint8_to_uint64(v___x_994_);
v___x_996_ = 56ULL;
v___x_997_ = lean_uint64_shift_left(v___x_995_, v___x_996_);
v___x_998_ = lean_uint64_add(v___x_991_, v___x_997_);
v___x_999_ = lean_box_uint64(v___x_998_);
v___x_1000_ = lean_array_push(v_b_939_, v___x_999_);
v___x_1001_ = lean_nat_add(v_i_940_, v_step_943_);
lean_dec(v_i_940_);
v_b_939_ = v___x_1000_;
v_i_940_ = v___x_1001_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg___boxed(lean_object* v_a_1003_, lean_object* v_range_1004_, lean_object* v_b_1005_, lean_object* v_i_1006_, lean_object* v___y_1007_){
_start:
{
lean_object* v_res_1008_; 
v_res_1008_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(v_a_1003_, v_range_1004_, v_b_1005_, v_i_1006_);
lean_dec_ref(v_range_1004_);
lean_dec_ref(v_a_1003_);
return v_res_1008_;
}
}
LEAN_EXPORT lean_object* l_main___lam__1(lean_object* v_snd_1009_, lean_object* v___x_1010_, lean_object* v_arr_1011_, lean_object* v___x_1012_){
_start:
{
lean_object* v___x_1014_; 
v___x_1014_ = l_IO_FS_readBinFile(v_snd_1009_);
if (lean_obj_tag(v___x_1014_) == 0)
{
lean_object* v_a_1015_; lean_object* v___x_1016_; 
v_a_1015_ = lean_ctor_get(v___x_1014_, 0);
lean_inc(v_a_1015_);
lean_dec_ref_known(v___x_1014_, 1);
v___x_1016_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(v_a_1015_, v___x_1010_, v_arr_1011_, v___x_1012_);
lean_dec(v_a_1015_);
return v___x_1016_;
}
else
{
lean_object* v_a_1017_; lean_object* v___x_1019_; uint8_t v_isShared_1020_; uint8_t v_isSharedCheck_1024_; 
lean_dec(v___x_1012_);
lean_dec_ref(v_arr_1011_);
v_a_1017_ = lean_ctor_get(v___x_1014_, 0);
v_isSharedCheck_1024_ = !lean_is_exclusive(v___x_1014_);
if (v_isSharedCheck_1024_ == 0)
{
v___x_1019_ = v___x_1014_;
v_isShared_1020_ = v_isSharedCheck_1024_;
goto v_resetjp_1018_;
}
else
{
lean_inc(v_a_1017_);
lean_dec(v___x_1014_);
v___x_1019_ = lean_box(0);
v_isShared_1020_ = v_isSharedCheck_1024_;
goto v_resetjp_1018_;
}
v_resetjp_1018_:
{
lean_object* v___x_1022_; 
if (v_isShared_1020_ == 0)
{
v___x_1022_ = v___x_1019_;
goto v_reusejp_1021_;
}
else
{
lean_object* v_reuseFailAlloc_1023_; 
v_reuseFailAlloc_1023_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1023_, 0, v_a_1017_);
v___x_1022_ = v_reuseFailAlloc_1023_;
goto v_reusejp_1021_;
}
v_reusejp_1021_:
{
return v___x_1022_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_main___lam__1___boxed(lean_object* v_snd_1025_, lean_object* v___x_1026_, lean_object* v_arr_1027_, lean_object* v___x_1028_, lean_object* v___y_1029_){
_start:
{
lean_object* v_res_1030_; 
v_res_1030_ = l_main___lam__1(v_snd_1025_, v___x_1026_, v_arr_1027_, v___x_1028_);
lean_dec_ref(v___x_1026_);
lean_dec_ref(v_snd_1025_);
return v_res_1030_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(lean_object* v_fst_1033_, lean_object* v_range_1034_, lean_object* v_b_1035_, lean_object* v_i_1036_){
_start:
{
lean_object* v_stop_1038_; lean_object* v_step_1039_; uint8_t v___x_1040_; 
v_stop_1038_ = lean_ctor_get(v_range_1034_, 1);
v_step_1039_ = lean_ctor_get(v_range_1034_, 2);
v___x_1040_ = lean_nat_dec_lt(v_i_1036_, v_stop_1038_);
if (v___x_1040_ == 0)
{
lean_object* v___x_1041_; 
lean_dec(v_i_1036_);
v___x_1041_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_1041_, 0, v_b_1035_);
return v___x_1041_;
}
else
{
lean_object* v___x_1042_; lean_object* v___x_1043_; uint64_t v___x_1044_; uint64_t v___x_1045_; uint64_t v___x_1046_; uint8_t v___x_1047_; lean_object* v_ba_1048_; uint64_t v___x_1049_; uint64_t v___x_1050_; uint64_t v___x_1051_; uint64_t v___x_1052_; uint8_t v___x_1053_; lean_object* v_ba_1054_; uint64_t v___x_1055_; uint64_t v___x_1056_; uint64_t v___x_1057_; uint64_t v___x_1058_; uint8_t v___x_1059_; lean_object* v_ba_1060_; uint64_t v___x_1061_; uint64_t v___x_1062_; uint64_t v___x_1063_; uint64_t v___x_1064_; uint8_t v___x_1065_; lean_object* v_ba_1066_; uint64_t v___x_1067_; uint64_t v___x_1068_; uint64_t v___x_1069_; uint64_t v___x_1070_; uint8_t v___x_1071_; lean_object* v_ba_1072_; uint64_t v___x_1073_; uint64_t v___x_1074_; uint64_t v___x_1075_; uint64_t v___x_1076_; uint8_t v___x_1077_; lean_object* v_ba_1078_; uint64_t v___x_1079_; uint64_t v___x_1080_; uint64_t v___x_1081_; uint64_t v___x_1082_; uint8_t v___x_1083_; lean_object* v_ba_1084_; uint64_t v___x_1085_; uint64_t v___x_1086_; uint64_t v___x_1087_; uint64_t v___x_1088_; uint8_t v___x_1089_; lean_object* v___x_1090_; lean_object* v___x_1091_; 
v___x_1042_ = ((lean_object*)(l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed__const__1));
v___x_1043_ = lean_array_get_borrowed(v___x_1042_, v_fst_1033_, v_i_1036_);
v___x_1044_ = 255ULL;
v___x_1045_ = lean_unbox_uint64(v___x_1043_);
v___x_1046_ = lean_uint64_land(v___x_1045_, v___x_1044_);
v___x_1047_ = lean_uint64_to_uint8(v___x_1046_);
v_ba_1048_ = lean_byte_array_push(v_b_1035_, v___x_1047_);
v___x_1049_ = 8ULL;
v___x_1050_ = lean_unbox_uint64(v___x_1043_);
v___x_1051_ = lean_uint64_shift_right(v___x_1050_, v___x_1049_);
v___x_1052_ = lean_uint64_land(v___x_1051_, v___x_1044_);
v___x_1053_ = lean_uint64_to_uint8(v___x_1052_);
v_ba_1054_ = lean_byte_array_push(v_ba_1048_, v___x_1053_);
v___x_1055_ = 16ULL;
v___x_1056_ = lean_unbox_uint64(v___x_1043_);
v___x_1057_ = lean_uint64_shift_right(v___x_1056_, v___x_1055_);
v___x_1058_ = lean_uint64_land(v___x_1057_, v___x_1044_);
v___x_1059_ = lean_uint64_to_uint8(v___x_1058_);
v_ba_1060_ = lean_byte_array_push(v_ba_1054_, v___x_1059_);
v___x_1061_ = 24ULL;
v___x_1062_ = lean_unbox_uint64(v___x_1043_);
v___x_1063_ = lean_uint64_shift_right(v___x_1062_, v___x_1061_);
v___x_1064_ = lean_uint64_land(v___x_1063_, v___x_1044_);
v___x_1065_ = lean_uint64_to_uint8(v___x_1064_);
v_ba_1066_ = lean_byte_array_push(v_ba_1060_, v___x_1065_);
v___x_1067_ = 32ULL;
v___x_1068_ = lean_unbox_uint64(v___x_1043_);
v___x_1069_ = lean_uint64_shift_right(v___x_1068_, v___x_1067_);
v___x_1070_ = lean_uint64_land(v___x_1069_, v___x_1044_);
v___x_1071_ = lean_uint64_to_uint8(v___x_1070_);
v_ba_1072_ = lean_byte_array_push(v_ba_1066_, v___x_1071_);
v___x_1073_ = 40ULL;
v___x_1074_ = lean_unbox_uint64(v___x_1043_);
v___x_1075_ = lean_uint64_shift_right(v___x_1074_, v___x_1073_);
v___x_1076_ = lean_uint64_land(v___x_1075_, v___x_1044_);
v___x_1077_ = lean_uint64_to_uint8(v___x_1076_);
v_ba_1078_ = lean_byte_array_push(v_ba_1072_, v___x_1077_);
v___x_1079_ = 48ULL;
v___x_1080_ = lean_unbox_uint64(v___x_1043_);
v___x_1081_ = lean_uint64_shift_right(v___x_1080_, v___x_1079_);
v___x_1082_ = lean_uint64_land(v___x_1081_, v___x_1044_);
v___x_1083_ = lean_uint64_to_uint8(v___x_1082_);
v_ba_1084_ = lean_byte_array_push(v_ba_1078_, v___x_1083_);
v___x_1085_ = 56ULL;
v___x_1086_ = lean_unbox_uint64(v___x_1043_);
v___x_1087_ = lean_uint64_shift_right(v___x_1086_, v___x_1085_);
v___x_1088_ = lean_uint64_land(v___x_1087_, v___x_1044_);
v___x_1089_ = lean_uint64_to_uint8(v___x_1088_);
v___x_1090_ = lean_byte_array_push(v_ba_1084_, v___x_1089_);
v___x_1091_ = lean_nat_add(v_i_1036_, v_step_1039_);
lean_dec(v_i_1036_);
v_b_1035_ = v___x_1090_;
v_i_1036_ = v___x_1091_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg___boxed(lean_object* v_fst_1093_, lean_object* v_range_1094_, lean_object* v_b_1095_, lean_object* v_i_1096_, lean_object* v___y_1097_){
_start:
{
lean_object* v_res_1098_; 
v_res_1098_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(v_fst_1093_, v_range_1094_, v_b_1095_, v_i_1096_);
lean_dec_ref(v_range_1094_);
lean_dec_ref(v_fst_1093_);
return v_res_1098_;
}
}
LEAN_EXPORT lean_object* l_main___lam__2(lean_object* v_fst_1099_, lean_object* v___x_1100_, lean_object* v___x_1101_, lean_object* v___x_1102_, lean_object* v_snd_1103_){
_start:
{
lean_object* v___x_1105_; lean_object* v_a_1106_; lean_object* v___x_1107_; 
v___x_1105_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(v_fst_1099_, v___x_1100_, v___x_1101_, v___x_1102_);
v_a_1106_ = lean_ctor_get(v___x_1105_, 0);
lean_inc(v_a_1106_);
lean_dec_ref(v___x_1105_);
v___x_1107_ = l_IO_FS_writeBinFile(v_snd_1103_, v_a_1106_);
lean_dec(v_a_1106_);
return v___x_1107_;
}
}
LEAN_EXPORT lean_object* l_main___lam__2___boxed(lean_object* v_fst_1108_, lean_object* v___x_1109_, lean_object* v___x_1110_, lean_object* v___x_1111_, lean_object* v_snd_1112_, lean_object* v___y_1113_){
_start:
{
lean_object* v_res_1114_; 
v_res_1114_ = l_main___lam__2(v_fst_1108_, v___x_1109_, v___x_1110_, v___x_1111_, v_snd_1112_);
lean_dec_ref(v_snd_1112_);
lean_dec_ref(v___x_1109_);
lean_dec_ref(v_fst_1108_);
return v_res_1114_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(lean_object* v_range_1115_, lean_object* v_b_1116_, lean_object* v_i_1117_){
_start:
{
lean_object* v_stop_1119_; lean_object* v_step_1120_; uint8_t v___x_1121_; 
v_stop_1119_ = lean_ctor_get(v_range_1115_, 1);
v_step_1120_ = lean_ctor_get(v_range_1115_, 2);
v___x_1121_ = lean_nat_dec_lt(v_i_1117_, v_stop_1119_);
if (v___x_1121_ == 0)
{
lean_object* v___x_1122_; 
lean_dec(v_i_1117_);
v___x_1122_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_1122_, 0, v_b_1116_);
return v___x_1122_;
}
else
{
lean_object* v_fst_1123_; lean_object* v_snd_1124_; lean_object* v___x_1126_; uint8_t v_isShared_1127_; uint8_t v_isSharedCheck_1155_; 
v_fst_1123_ = lean_ctor_get(v_b_1116_, 0);
v_snd_1124_ = lean_ctor_get(v_b_1116_, 1);
v_isSharedCheck_1155_ = !lean_is_exclusive(v_b_1116_);
if (v_isSharedCheck_1155_ == 0)
{
v___x_1126_ = v_b_1116_;
v_isShared_1127_ = v_isSharedCheck_1155_;
goto v_resetjp_1125_;
}
else
{
lean_inc(v_snd_1124_);
lean_inc(v_fst_1123_);
lean_dec(v_b_1116_);
v___x_1126_ = lean_box(0);
v_isShared_1127_ = v_isSharedCheck_1155_;
goto v_resetjp_1125_;
}
v_resetjp_1125_:
{
lean_object* v___x_1128_; lean_object* v___x_1129_; lean_object* v___x_1130_; uint64_t v___x_1131_; uint64_t v___x_1132_; uint64_t v___x_1133_; uint64_t v___x_1134_; uint64_t v_x_1135_; uint64_t v___x_1136_; uint64_t v___x_1137_; uint64_t v_x_1138_; uint64_t v___x_1139_; uint64_t v___x_1140_; uint64_t v_x_1141_; uint64_t v___x_1142_; uint64_t v___x_1143_; lean_object* v___x_1144_; uint64_t v___x_1145_; uint64_t v___x_1146_; lean_object* v___x_1147_; lean_object* v___x_1148_; lean_object* v___x_1149_; lean_object* v___x_1151_; 
v___x_1128_ = lean_unsigned_to_nat(6249999u);
v___x_1129_ = lean_unsigned_to_nat(1u);
v___x_1130_ = lean_nat_sub(v___x_1128_, v_i_1117_);
v___x_1131_ = 12ULL;
v___x_1132_ = lean_unbox_uint64(v_snd_1124_);
v___x_1133_ = lean_uint64_shift_right(v___x_1132_, v___x_1131_);
v___x_1134_ = lean_unbox_uint64(v_snd_1124_);
lean_dec(v_snd_1124_);
v_x_1135_ = lean_uint64_xor(v___x_1134_, v___x_1133_);
v___x_1136_ = 25ULL;
v___x_1137_ = lean_uint64_shift_left(v_x_1135_, v___x_1136_);
v_x_1138_ = lean_uint64_xor(v_x_1135_, v___x_1137_);
v___x_1139_ = 27ULL;
v___x_1140_ = lean_uint64_shift_right(v_x_1138_, v___x_1139_);
v_x_1141_ = lean_uint64_xor(v_x_1138_, v___x_1140_);
v___x_1142_ = 2685821657736338717ULL;
v___x_1143_ = lean_uint64_mul(v_x_1141_, v___x_1142_);
v___x_1144_ = lean_nat_add(v___x_1130_, v___x_1129_);
v___x_1145_ = lean_uint64_of_nat(v___x_1144_);
lean_dec(v___x_1144_);
v___x_1146_ = lean_uint64_mod(v___x_1143_, v___x_1145_);
v___x_1147_ = lean_uint64_to_nat(v___x_1146_);
v___x_1148_ = lean_array_swap(v_fst_1123_, v___x_1130_, v___x_1147_);
lean_dec(v___x_1147_);
lean_dec(v___x_1130_);
v___x_1149_ = lean_box_uint64(v_x_1141_);
if (v_isShared_1127_ == 0)
{
lean_ctor_set(v___x_1126_, 1, v___x_1149_);
lean_ctor_set(v___x_1126_, 0, v___x_1148_);
v___x_1151_ = v___x_1126_;
goto v_reusejp_1150_;
}
else
{
lean_object* v_reuseFailAlloc_1154_; 
v_reuseFailAlloc_1154_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1154_, 0, v___x_1148_);
lean_ctor_set(v_reuseFailAlloc_1154_, 1, v___x_1149_);
v___x_1151_ = v_reuseFailAlloc_1154_;
goto v_reusejp_1150_;
}
v_reusejp_1150_:
{
lean_object* v___x_1152_; 
v___x_1152_ = lean_nat_add(v_i_1117_, v_step_1120_);
lean_dec(v_i_1117_);
v_b_1116_ = v___x_1151_;
v_i_1117_ = v___x_1152_;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg___boxed(lean_object* v_range_1156_, lean_object* v_b_1157_, lean_object* v_i_1158_, lean_object* v___y_1159_){
_start:
{
lean_object* v_res_1160_; 
v_res_1160_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(v_range_1156_, v_b_1157_, v_i_1158_);
lean_dec_ref(v_range_1156_);
return v_res_1160_;
}
}
LEAN_EXPORT lean_object* l_main___lam__3(lean_object* v___x_1161_, lean_object* v___x_1162_, lean_object* v___x_1163_){
_start:
{
lean_object* v___x_1165_; lean_object* v_a_1166_; lean_object* v___x_1168_; uint8_t v_isShared_1169_; uint8_t v_isSharedCheck_1174_; 
v___x_1165_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(v___x_1161_, v___x_1162_, v___x_1163_);
v_a_1166_ = lean_ctor_get(v___x_1165_, 0);
v_isSharedCheck_1174_ = !lean_is_exclusive(v___x_1165_);
if (v_isSharedCheck_1174_ == 0)
{
v___x_1168_ = v___x_1165_;
v_isShared_1169_ = v_isSharedCheck_1174_;
goto v_resetjp_1167_;
}
else
{
lean_inc(v_a_1166_);
lean_dec(v___x_1165_);
v___x_1168_ = lean_box(0);
v_isShared_1169_ = v_isSharedCheck_1174_;
goto v_resetjp_1167_;
}
v_resetjp_1167_:
{
lean_object* v_fst_1170_; lean_object* v___x_1172_; 
v_fst_1170_ = lean_ctor_get(v_a_1166_, 0);
lean_inc(v_fst_1170_);
lean_dec(v_a_1166_);
if (v_isShared_1169_ == 0)
{
lean_ctor_set(v___x_1168_, 0, v_fst_1170_);
v___x_1172_ = v___x_1168_;
goto v_reusejp_1171_;
}
else
{
lean_object* v_reuseFailAlloc_1173_; 
v_reuseFailAlloc_1173_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1173_, 0, v_fst_1170_);
v___x_1172_ = v_reuseFailAlloc_1173_;
goto v_reusejp_1171_;
}
v_reusejp_1171_:
{
return v___x_1172_;
}
}
}
}
LEAN_EXPORT lean_object* l_main___lam__3___boxed(lean_object* v___x_1175_, lean_object* v___x_1176_, lean_object* v___x_1177_, lean_object* v___y_1178_){
_start:
{
lean_object* v_res_1179_; 
v_res_1179_ = l_main___lam__3(v___x_1175_, v___x_1176_, v___x_1177_);
lean_dec_ref(v___x_1175_);
return v_res_1179_;
}
}
LEAN_EXPORT lean_object* l_IO_print___at___00IO_println___at___00main_spec__2_spec__3(lean_object* v_s_1180_){
_start:
{
lean_object* v___x_1182_; lean_object* v_putStr_1183_; lean_object* v___x_1184_; 
v___x_1182_ = lean_get_stdout();
v_putStr_1183_ = lean_ctor_get(v___x_1182_, 4);
lean_inc_ref(v_putStr_1183_);
lean_dec_ref(v___x_1182_);
v___x_1184_ = lean_apply_2(v_putStr_1183_, v_s_1180_, lean_box(0));
return v___x_1184_;
}
}
LEAN_EXPORT lean_object* l_IO_print___at___00IO_println___at___00main_spec__2_spec__3___boxed(lean_object* v_s_1185_, lean_object* v_a_1186_){
_start:
{
lean_object* v_res_1187_; 
v_res_1187_ = l_IO_print___at___00IO_println___at___00main_spec__2_spec__3(v_s_1185_);
return v_res_1187_;
}
}
LEAN_EXPORT lean_object* l_IO_println___at___00main_spec__2(lean_object* v_s_1188_){
_start:
{
uint32_t v___x_1190_; lean_object* v___x_1191_; lean_object* v___x_1192_; 
v___x_1190_ = 10;
v___x_1191_ = lean_string_push(v_s_1188_, v___x_1190_);
v___x_1192_ = l_IO_print___at___00IO_println___at___00main_spec__2_spec__3(v___x_1191_);
return v___x_1192_;
}
}
LEAN_EXPORT lean_object* l_IO_println___at___00main_spec__2___boxed(lean_object* v_s_1193_, lean_object* v_a_1194_){
_start:
{
lean_object* v_res_1195_; 
v_res_1195_ = l_IO_println___at___00main_spec__2(v_s_1193_);
return v_res_1195_;
}
}
static lean_object* _init_l_main___closed__1(void){
_start:
{
lean_object* v___x_1202_; lean_object* v_arr_1203_; lean_object* v___x_1204_; lean_object* v___x_1205_; 
v___x_1202_ = lean_unsigned_to_nat(6250000u);
v_arr_1203_ = lean_mk_empty_array_with_capacity(v___x_1202_);
v___x_1204_ = ((lean_object*)(l_main___closed__1___boxed__const__1));
v___x_1205_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1205_, 0, v___x_1204_);
lean_ctor_set(v___x_1205_, 1, v_arr_1203_);
return v___x_1205_;
}
}
static lean_object* _init_l_main___closed__2(void){
_start:
{
lean_object* v___x_1206_; lean_object* v___x_1207_; lean_object* v___x_1208_; lean_object* v___f_1209_; 
v___x_1206_ = lean_unsigned_to_nat(0u);
v___x_1207_ = lean_obj_once(&l_main___closed__1, &l_main___closed__1_once, _init_l_main___closed__1);
v___x_1208_ = ((lean_object*)(l_main___closed__0));
v___f_1209_ = lean_alloc_closure((void*)(l_main___lam__0___boxed), 4, 3);
lean_closure_set(v___f_1209_, 0, v___x_1208_);
lean_closure_set(v___f_1209_, 1, v___x_1207_);
lean_closure_set(v___f_1209_, 2, v___x_1206_);
return v___f_1209_;
}
}
static lean_object* _init_l_main___closed__5(void){
_start:
{
lean_object* v___x_1212_; lean_object* v___x_1213_; 
v___x_1212_ = lean_unsigned_to_nat(50000000u);
v___x_1213_ = lean_mk_empty_byte_array(v___x_1212_);
return v___x_1213_;
}
}
LEAN_EXPORT lean_object* _lean_main(){
_start:
{
lean_object* v___x_1222_; lean_object* v_arr_1223_; lean_object* v___x_1224_; lean_object* v___x_1225_; lean_object* v___x_1226_; lean_object* v___f_1227_; lean_object* v___x_1228_; 
v___x_1222_ = lean_unsigned_to_nat(6250000u);
v_arr_1223_ = lean_mk_empty_array_with_capacity(v___x_1222_);
v___x_1224_ = lean_unsigned_to_nat(0u);
v___x_1225_ = lean_unsigned_to_nat(1u);
v___x_1226_ = ((lean_object*)(l_main___closed__0));
v___f_1227_ = lean_obj_once(&l_main___closed__2, &l_main___closed__2_once, _init_l_main___closed__2);
v___x_1228_ = l_timeS___redArg(v___f_1227_);
if (lean_obj_tag(v___x_1228_) == 0)
{
lean_object* v_a_1229_; lean_object* v_fst_1230_; lean_object* v_snd_1231_; lean_object* v___x_1232_; double v___x_1233_; lean_object* v___x_1234_; lean_object* v___x_1235_; lean_object* v___x_1236_; lean_object* v___x_1237_; lean_object* v___x_1238_; 
v_a_1229_ = lean_ctor_get(v___x_1228_, 0);
lean_inc(v_a_1229_);
lean_dec_ref_known(v___x_1228_, 1);
v_fst_1230_ = lean_ctor_get(v_a_1229_, 0);
lean_inc(v_fst_1230_);
v_snd_1231_ = lean_ctor_get(v_a_1229_, 1);
lean_inc(v_snd_1231_);
lean_dec(v_a_1229_);
v___x_1232_ = ((lean_object*)(l_main___closed__3));
v___x_1233_ = lean_unbox_float(v_snd_1231_);
lean_dec(v_snd_1231_);
v___x_1234_ = lean_float_to_string(v___x_1233_);
v___x_1235_ = lean_string_append(v___x_1232_, v___x_1234_);
lean_dec_ref(v___x_1234_);
v___x_1236_ = ((lean_object*)(l_main___closed__4));
v___x_1237_ = lean_string_append(v___x_1235_, v___x_1236_);
v___x_1238_ = l_IO_println___at___00main_spec__2(v___x_1237_);
if (lean_obj_tag(v___x_1238_) == 0)
{
lean_object* v___x_1239_; 
lean_dec_ref_known(v___x_1238_, 1);
v___x_1239_ = lean_io_create_tempfile();
if (lean_obj_tag(v___x_1239_) == 0)
{
lean_object* v_a_1240_; lean_object* v_snd_1241_; lean_object* v___f_1242_; lean_object* v___x_1243_; lean_object* v___x_1244_; lean_object* v___x_1245_; lean_object* v___f_1246_; lean_object* v___x_1247_; 
v_a_1240_ = lean_ctor_get(v___x_1239_, 0);
lean_inc(v_a_1240_);
lean_dec_ref_known(v___x_1239_, 1);
v_snd_1241_ = lean_ctor_get(v_a_1240_, 1);
lean_inc_n(v_snd_1241_, 2);
lean_dec(v_a_1240_);
v___f_1242_ = lean_alloc_closure((void*)(l_main___lam__1___boxed), 5, 4);
lean_closure_set(v___f_1242_, 0, v_snd_1241_);
lean_closure_set(v___f_1242_, 1, v___x_1226_);
lean_closure_set(v___f_1242_, 2, v_arr_1223_);
lean_closure_set(v___f_1242_, 3, v___x_1224_);
v___x_1243_ = lean_obj_once(&l_main___closed__5, &l_main___closed__5_once, _init_l_main___closed__5);
v___x_1244_ = lean_array_get_size(v_fst_1230_);
v___x_1245_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_1245_, 0, v___x_1224_);
lean_ctor_set(v___x_1245_, 1, v___x_1244_);
lean_ctor_set(v___x_1245_, 2, v___x_1225_);
v___f_1246_ = lean_alloc_closure((void*)(l_main___lam__2___boxed), 6, 5);
lean_closure_set(v___f_1246_, 0, v_fst_1230_);
lean_closure_set(v___f_1246_, 1, v___x_1245_);
lean_closure_set(v___f_1246_, 2, v___x_1243_);
lean_closure_set(v___f_1246_, 3, v___x_1224_);
lean_closure_set(v___f_1246_, 4, v_snd_1241_);
v___x_1247_ = l_timeS___redArg(v___f_1246_);
if (lean_obj_tag(v___x_1247_) == 0)
{
lean_object* v_a_1248_; lean_object* v_snd_1249_; lean_object* v___x_1250_; double v___x_1251_; lean_object* v___x_1252_; lean_object* v___x_1253_; lean_object* v___x_1254_; lean_object* v___x_1255_; 
v_a_1248_ = lean_ctor_get(v___x_1247_, 0);
lean_inc(v_a_1248_);
lean_dec_ref_known(v___x_1247_, 1);
v_snd_1249_ = lean_ctor_get(v_a_1248_, 1);
lean_inc(v_snd_1249_);
lean_dec(v_a_1248_);
v___x_1250_ = ((lean_object*)(l_main___closed__6));
v___x_1251_ = lean_unbox_float(v_snd_1249_);
lean_dec(v_snd_1249_);
v___x_1252_ = lean_float_to_string(v___x_1251_);
v___x_1253_ = lean_string_append(v___x_1250_, v___x_1252_);
lean_dec_ref(v___x_1252_);
v___x_1254_ = lean_string_append(v___x_1253_, v___x_1236_);
v___x_1255_ = l_IO_println___at___00main_spec__2(v___x_1254_);
if (lean_obj_tag(v___x_1255_) == 0)
{
lean_object* v___x_1256_; 
lean_dec_ref_known(v___x_1255_, 1);
v___x_1256_ = l_timeS___redArg(v___f_1242_);
if (lean_obj_tag(v___x_1256_) == 0)
{
lean_object* v_a_1257_; lean_object* v_fst_1258_; lean_object* v_snd_1259_; lean_object* v___x_1261_; uint8_t v_isShared_1262_; uint8_t v_isSharedCheck_1292_; 
v_a_1257_ = lean_ctor_get(v___x_1256_, 0);
lean_inc(v_a_1257_);
lean_dec_ref_known(v___x_1256_, 1);
v_fst_1258_ = lean_ctor_get(v_a_1257_, 0);
v_snd_1259_ = lean_ctor_get(v_a_1257_, 1);
v_isSharedCheck_1292_ = !lean_is_exclusive(v_a_1257_);
if (v_isSharedCheck_1292_ == 0)
{
v___x_1261_ = v_a_1257_;
v_isShared_1262_ = v_isSharedCheck_1292_;
goto v_resetjp_1260_;
}
else
{
lean_inc(v_snd_1259_);
lean_inc(v_fst_1258_);
lean_dec(v_a_1257_);
v___x_1261_ = lean_box(0);
v_isShared_1262_ = v_isSharedCheck_1292_;
goto v_resetjp_1260_;
}
v_resetjp_1260_:
{
lean_object* v___x_1263_; double v___x_1264_; lean_object* v___x_1265_; lean_object* v___x_1266_; lean_object* v___x_1267_; lean_object* v___x_1268_; 
v___x_1263_ = ((lean_object*)(l_main___closed__7));
v___x_1264_ = lean_unbox_float(v_snd_1259_);
lean_dec(v_snd_1259_);
v___x_1265_ = lean_float_to_string(v___x_1264_);
v___x_1266_ = lean_string_append(v___x_1263_, v___x_1265_);
lean_dec_ref(v___x_1265_);
v___x_1267_ = lean_string_append(v___x_1266_, v___x_1236_);
v___x_1268_ = l_IO_println___at___00main_spec__2(v___x_1267_);
if (lean_obj_tag(v___x_1268_) == 0)
{
lean_object* v___x_1269_; lean_object* v___x_1270_; lean_object* v___x_1272_; 
lean_dec_ref_known(v___x_1268_, 1);
v___x_1269_ = ((lean_object*)(l_main___closed__8));
v___x_1270_ = ((lean_object*)(l_main___closed__1___boxed__const__1));
if (v_isShared_1262_ == 0)
{
lean_ctor_set(v___x_1261_, 1, v___x_1270_);
v___x_1272_ = v___x_1261_;
goto v_reusejp_1271_;
}
else
{
lean_object* v_reuseFailAlloc_1291_; 
v_reuseFailAlloc_1291_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1291_, 0, v_fst_1258_);
lean_ctor_set(v_reuseFailAlloc_1291_, 1, v___x_1270_);
v___x_1272_ = v_reuseFailAlloc_1291_;
goto v_reusejp_1271_;
}
v_reusejp_1271_:
{
lean_object* v___f_1273_; lean_object* v___x_1274_; 
v___f_1273_ = lean_alloc_closure((void*)(l_main___lam__3___boxed), 4, 3);
lean_closure_set(v___f_1273_, 0, v___x_1269_);
lean_closure_set(v___f_1273_, 1, v___x_1272_);
lean_closure_set(v___f_1273_, 2, v___x_1224_);
v___x_1274_ = l_timeS___redArg(v___f_1273_);
if (lean_obj_tag(v___x_1274_) == 0)
{
lean_object* v_a_1275_; lean_object* v_snd_1276_; lean_object* v___x_1277_; double v___x_1278_; lean_object* v___x_1279_; lean_object* v___x_1280_; lean_object* v___x_1281_; lean_object* v___x_1282_; 
v_a_1275_ = lean_ctor_get(v___x_1274_, 0);
lean_inc(v_a_1275_);
lean_dec_ref_known(v___x_1274_, 1);
v_snd_1276_ = lean_ctor_get(v_a_1275_, 1);
lean_inc(v_snd_1276_);
lean_dec(v_a_1275_);
v___x_1277_ = ((lean_object*)(l_main___closed__9));
v___x_1278_ = lean_unbox_float(v_snd_1276_);
lean_dec(v_snd_1276_);
v___x_1279_ = lean_float_to_string(v___x_1278_);
v___x_1280_ = lean_string_append(v___x_1277_, v___x_1279_);
lean_dec_ref(v___x_1279_);
v___x_1281_ = lean_string_append(v___x_1280_, v___x_1236_);
v___x_1282_ = l_IO_println___at___00main_spec__2(v___x_1281_);
return v___x_1282_;
}
else
{
lean_object* v_a_1283_; lean_object* v___x_1285_; uint8_t v_isShared_1286_; uint8_t v_isSharedCheck_1290_; 
v_a_1283_ = lean_ctor_get(v___x_1274_, 0);
v_isSharedCheck_1290_ = !lean_is_exclusive(v___x_1274_);
if (v_isSharedCheck_1290_ == 0)
{
v___x_1285_ = v___x_1274_;
v_isShared_1286_ = v_isSharedCheck_1290_;
goto v_resetjp_1284_;
}
else
{
lean_inc(v_a_1283_);
lean_dec(v___x_1274_);
v___x_1285_ = lean_box(0);
v_isShared_1286_ = v_isSharedCheck_1290_;
goto v_resetjp_1284_;
}
v_resetjp_1284_:
{
lean_object* v___x_1288_; 
if (v_isShared_1286_ == 0)
{
v___x_1288_ = v___x_1285_;
goto v_reusejp_1287_;
}
else
{
lean_object* v_reuseFailAlloc_1289_; 
v_reuseFailAlloc_1289_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1289_, 0, v_a_1283_);
v___x_1288_ = v_reuseFailAlloc_1289_;
goto v_reusejp_1287_;
}
v_reusejp_1287_:
{
return v___x_1288_;
}
}
}
}
}
else
{
lean_del_object(v___x_1261_);
lean_dec(v_fst_1258_);
return v___x_1268_;
}
}
}
else
{
lean_object* v_a_1293_; lean_object* v___x_1295_; uint8_t v_isShared_1296_; uint8_t v_isSharedCheck_1300_; 
v_a_1293_ = lean_ctor_get(v___x_1256_, 0);
v_isSharedCheck_1300_ = !lean_is_exclusive(v___x_1256_);
if (v_isSharedCheck_1300_ == 0)
{
v___x_1295_ = v___x_1256_;
v_isShared_1296_ = v_isSharedCheck_1300_;
goto v_resetjp_1294_;
}
else
{
lean_inc(v_a_1293_);
lean_dec(v___x_1256_);
v___x_1295_ = lean_box(0);
v_isShared_1296_ = v_isSharedCheck_1300_;
goto v_resetjp_1294_;
}
v_resetjp_1294_:
{
lean_object* v___x_1298_; 
if (v_isShared_1296_ == 0)
{
v___x_1298_ = v___x_1295_;
goto v_reusejp_1297_;
}
else
{
lean_object* v_reuseFailAlloc_1299_; 
v_reuseFailAlloc_1299_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1299_, 0, v_a_1293_);
v___x_1298_ = v_reuseFailAlloc_1299_;
goto v_reusejp_1297_;
}
v_reusejp_1297_:
{
return v___x_1298_;
}
}
}
}
else
{
lean_dec_ref(v___f_1242_);
return v___x_1255_;
}
}
else
{
lean_object* v_a_1301_; lean_object* v___x_1303_; uint8_t v_isShared_1304_; uint8_t v_isSharedCheck_1308_; 
lean_dec_ref(v___f_1242_);
v_a_1301_ = lean_ctor_get(v___x_1247_, 0);
v_isSharedCheck_1308_ = !lean_is_exclusive(v___x_1247_);
if (v_isSharedCheck_1308_ == 0)
{
v___x_1303_ = v___x_1247_;
v_isShared_1304_ = v_isSharedCheck_1308_;
goto v_resetjp_1302_;
}
else
{
lean_inc(v_a_1301_);
lean_dec(v___x_1247_);
v___x_1303_ = lean_box(0);
v_isShared_1304_ = v_isSharedCheck_1308_;
goto v_resetjp_1302_;
}
v_resetjp_1302_:
{
lean_object* v___x_1306_; 
if (v_isShared_1304_ == 0)
{
v___x_1306_ = v___x_1303_;
goto v_reusejp_1305_;
}
else
{
lean_object* v_reuseFailAlloc_1307_; 
v_reuseFailAlloc_1307_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1307_, 0, v_a_1301_);
v___x_1306_ = v_reuseFailAlloc_1307_;
goto v_reusejp_1305_;
}
v_reusejp_1305_:
{
return v___x_1306_;
}
}
}
}
else
{
lean_object* v_a_1309_; lean_object* v___x_1311_; uint8_t v_isShared_1312_; uint8_t v_isSharedCheck_1316_; 
lean_dec(v_fst_1230_);
lean_dec_ref(v_arr_1223_);
v_a_1309_ = lean_ctor_get(v___x_1239_, 0);
v_isSharedCheck_1316_ = !lean_is_exclusive(v___x_1239_);
if (v_isSharedCheck_1316_ == 0)
{
v___x_1311_ = v___x_1239_;
v_isShared_1312_ = v_isSharedCheck_1316_;
goto v_resetjp_1310_;
}
else
{
lean_inc(v_a_1309_);
lean_dec(v___x_1239_);
v___x_1311_ = lean_box(0);
v_isShared_1312_ = v_isSharedCheck_1316_;
goto v_resetjp_1310_;
}
v_resetjp_1310_:
{
lean_object* v___x_1314_; 
if (v_isShared_1312_ == 0)
{
v___x_1314_ = v___x_1311_;
goto v_reusejp_1313_;
}
else
{
lean_object* v_reuseFailAlloc_1315_; 
v_reuseFailAlloc_1315_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1315_, 0, v_a_1309_);
v___x_1314_ = v_reuseFailAlloc_1315_;
goto v_reusejp_1313_;
}
v_reusejp_1313_:
{
return v___x_1314_;
}
}
}
}
else
{
lean_dec(v_fst_1230_);
lean_dec_ref(v_arr_1223_);
return v___x_1238_;
}
}
else
{
lean_object* v_a_1317_; lean_object* v___x_1319_; uint8_t v_isShared_1320_; uint8_t v_isSharedCheck_1324_; 
lean_dec_ref(v_arr_1223_);
v_a_1317_ = lean_ctor_get(v___x_1228_, 0);
v_isSharedCheck_1324_ = !lean_is_exclusive(v___x_1228_);
if (v_isSharedCheck_1324_ == 0)
{
v___x_1319_ = v___x_1228_;
v_isShared_1320_ = v_isSharedCheck_1324_;
goto v_resetjp_1318_;
}
else
{
lean_inc(v_a_1317_);
lean_dec(v___x_1228_);
v___x_1319_ = lean_box(0);
v_isShared_1320_ = v_isSharedCheck_1324_;
goto v_resetjp_1318_;
}
v_resetjp_1318_:
{
lean_object* v___x_1322_; 
if (v_isShared_1320_ == 0)
{
v___x_1322_ = v___x_1319_;
goto v_reusejp_1321_;
}
else
{
lean_object* v_reuseFailAlloc_1323_; 
v_reuseFailAlloc_1323_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1323_, 0, v_a_1317_);
v___x_1322_ = v_reuseFailAlloc_1323_;
goto v_reusejp_1321_;
}
v_reusejp_1321_:
{
return v___x_1322_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_main___boxed(lean_object* v_a_1325_){
_start:
{
lean_object* v_res_1326_; 
v_res_1326_ = _lean_main();
return v_res_1326_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0(lean_object* v_range_1327_, lean_object* v_b_1328_, lean_object* v_i_1329_, lean_object* v_hs_1330_, lean_object* v_hl_1331_){
_start:
{
lean_object* v___x_1333_; 
v___x_1333_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___redArg(v_range_1327_, v_b_1328_, v_i_1329_);
return v___x_1333_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0___boxed(lean_object* v_range_1334_, lean_object* v_b_1335_, lean_object* v_i_1336_, lean_object* v_hs_1337_, lean_object* v_hl_1338_, lean_object* v___y_1339_){
_start:
{
lean_object* v_res_1340_; 
v_res_1340_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__0(v_range_1334_, v_b_1335_, v_i_1336_, v_hs_1337_, v_hl_1338_);
lean_dec_ref(v_range_1334_);
return v_res_1340_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3(lean_object* v_fst_1341_, lean_object* v_range_1342_, lean_object* v_b_1343_, lean_object* v_i_1344_, lean_object* v_hs_1345_, lean_object* v_hl_1346_){
_start:
{
lean_object* v___x_1348_; 
v___x_1348_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___redArg(v_fst_1341_, v_range_1342_, v_b_1343_, v_i_1344_);
return v___x_1348_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3___boxed(lean_object* v_fst_1349_, lean_object* v_range_1350_, lean_object* v_b_1351_, lean_object* v_i_1352_, lean_object* v_hs_1353_, lean_object* v_hl_1354_, lean_object* v___y_1355_){
_start:
{
lean_object* v_res_1356_; 
v_res_1356_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__3(v_fst_1349_, v_range_1350_, v_b_1351_, v_i_1352_, v_hs_1353_, v_hl_1354_);
lean_dec_ref(v_range_1350_);
lean_dec_ref(v_fst_1349_);
return v_res_1356_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4(lean_object* v_a_1357_, lean_object* v_range_1358_, lean_object* v_b_1359_, lean_object* v_i_1360_, lean_object* v_hs_1361_, lean_object* v_hl_1362_){
_start:
{
lean_object* v___x_1364_; 
v___x_1364_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___redArg(v_a_1357_, v_range_1358_, v_b_1359_, v_i_1360_);
return v___x_1364_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4___boxed(lean_object* v_a_1365_, lean_object* v_range_1366_, lean_object* v_b_1367_, lean_object* v_i_1368_, lean_object* v_hs_1369_, lean_object* v_hl_1370_, lean_object* v___y_1371_){
_start:
{
lean_object* v_res_1372_; 
v_res_1372_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__4(v_a_1365_, v_range_1366_, v_b_1367_, v_i_1368_, v_hs_1369_, v_hl_1370_);
lean_dec_ref(v_range_1366_);
lean_dec_ref(v_a_1365_);
return v_res_1372_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5(lean_object* v_range_1373_, lean_object* v_b_1374_, lean_object* v_i_1375_, lean_object* v_hs_1376_, lean_object* v_hl_1377_){
_start:
{
lean_object* v___x_1379_; 
v___x_1379_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___redArg(v_range_1373_, v_b_1374_, v_i_1375_);
return v___x_1379_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5___boxed(lean_object* v_range_1380_, lean_object* v_b_1381_, lean_object* v_i_1382_, lean_object* v_hs_1383_, lean_object* v_hl_1384_, lean_object* v___y_1385_){
_start:
{
lean_object* v_res_1386_; 
v_res_1386_ = l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00main_spec__5(v_range_1380_, v_b_1381_, v_i_1382_, v_hs_1383_, v_hl_1384_);
lean_dec_ref(v_range_1380_);
return v_res_1386_;
}
}
LEAN_EXPORT uint8_t l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2(lean_object* v_n_1387_, lean_object* v_lo_1388_, lean_object* v_xs_1389_, lean_object* v_a_1390_, lean_object* v_b_1391_, uint8_t v_afterEqual_1392_, lean_object* v_pivot_1393_, lean_object* v_hab_1394_, lean_object* v_hb_1395_){
_start:
{
uint8_t v___x_1396_; 
v___x_1396_ = l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___redArg(v_lo_1388_, v_xs_1389_, v_a_1390_, v_afterEqual_1392_, v_pivot_1393_);
return v___x_1396_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2___boxed(lean_object* v_n_1397_, lean_object* v_lo_1398_, lean_object* v_xs_1399_, lean_object* v_a_1400_, lean_object* v_b_1401_, lean_object* v_afterEqual_1402_, lean_object* v_pivot_1403_, lean_object* v_hab_1404_, lean_object* v_hb_1405_){
_start:
{
uint8_t v_afterEqual_boxed_1406_; uint8_t v_res_1407_; lean_object* v_r_1408_; 
v_afterEqual_boxed_1406_ = lean_unbox(v_afterEqual_1402_);
v_res_1407_ = l_Array_QSort_Internal_equalM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__2(v_n_1397_, v_lo_1398_, v_xs_1399_, v_a_1400_, v_b_1401_, v_afterEqual_boxed_1406_, v_pivot_1403_, v_hab_1404_, v_hb_1405_);
lean_dec(v_pivot_1403_);
lean_dec(v_b_1401_);
lean_dec(v_a_1400_);
lean_dec_ref(v_xs_1399_);
lean_dec(v_lo_1398_);
lean_dec(v_n_1397_);
v_r_1408_ = lean_box(v_res_1407_);
return v_r_1408_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1(lean_object* v___x_1409_, lean_object* v_n_1410_, lean_object* v_lo_1411_, lean_object* v_xs_1412_, lean_object* v_a_1413_, lean_object* v_b_1414_, lean_object* v_limit_1415_, uint8_t v_balanced_1416_, uint8_t v_partitioned_1417_, uint8_t v_afterEqual_1418_, lean_object* v_fuel_1419_, lean_object* v_hf_1420_, lean_object* v_hlo_1421_, lean_object* v_hab_1422_, lean_object* v_hb_1423_){
_start:
{
lean_object* v___x_1424_; 
v___x_1424_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___redArg(v___x_1409_, v_n_1410_, v_lo_1411_, v_xs_1412_, v_a_1413_, v_b_1414_, v_limit_1415_, v_balanced_1416_, v_partitioned_1417_, v_afterEqual_1418_, v_fuel_1419_);
return v___x_1424_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1___boxed(lean_object* v___x_1425_, lean_object* v_n_1426_, lean_object* v_lo_1427_, lean_object* v_xs_1428_, lean_object* v_a_1429_, lean_object* v_b_1430_, lean_object* v_limit_1431_, lean_object* v_balanced_1432_, lean_object* v_partitioned_1433_, lean_object* v_afterEqual_1434_, lean_object* v_fuel_1435_, lean_object* v_hf_1436_, lean_object* v_hlo_1437_, lean_object* v_hab_1438_, lean_object* v_hb_1439_){
_start:
{
uint8_t v_balanced_boxed_1440_; uint8_t v_partitioned_boxed_1441_; uint8_t v_afterEqual_boxed_1442_; lean_object* v_res_1443_; 
v_balanced_boxed_1440_ = lean_unbox(v_balanced_1432_);
v_partitioned_boxed_1441_ = lean_unbox(v_partitioned_1433_);
v_afterEqual_boxed_1442_ = lean_unbox(v_afterEqual_1434_);
v_res_1443_ = l_Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1(v___x_1425_, v_n_1426_, v_lo_1427_, v_xs_1428_, v_a_1429_, v_b_1430_, v_limit_1431_, v_balanced_boxed_1440_, v_partitioned_boxed_1441_, v_afterEqual_boxed_1442_, v_fuel_1435_, v_hf_1436_, v_hlo_1437_, v_hab_1438_, v_hb_1439_);
lean_dec(v_lo_1427_);
lean_dec(v_n_1426_);
lean_dec(v___x_1425_);
return v_res_1443_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3(lean_object* v_n_1444_, lean_object* v_xs_1445_, lean_object* v_a_1446_, lean_object* v_b_1447_, lean_object* v_pivot_1448_, lean_object* v_hb_1449_){
_start:
{
lean_object* v___x_1450_; 
v___x_1450_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___redArg(v_n_1444_, v_xs_1445_, v_a_1446_, v_b_1447_, v_pivot_1448_);
return v___x_1450_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3___boxed(lean_object* v_n_1451_, lean_object* v_xs_1452_, lean_object* v_a_1453_, lean_object* v_b_1454_, lean_object* v_pivot_1455_, lean_object* v_hb_1456_){
_start:
{
lean_object* v_res_1457_; 
v_res_1457_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3(v_n_1451_, v_xs_1452_, v_a_1453_, v_b_1454_, v_pivot_1455_, v_hb_1456_);
lean_dec(v_pivot_1455_);
lean_dec(v_b_1454_);
lean_dec(v_a_1453_);
lean_dec(v_n_1451_);
return v_res_1457_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4(lean_object* v_n_1458_, lean_object* v_xs_1459_, lean_object* v_a_1460_, lean_object* v_b_1461_, lean_object* v_hab_1462_, lean_object* v_hb_1463_){
_start:
{
lean_object* v___x_1464_; 
v___x_1464_ = l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___redArg(v_n_1458_, v_xs_1459_, v_a_1460_, v_b_1461_);
return v___x_1464_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4___boxed(lean_object* v_n_1465_, lean_object* v_xs_1466_, lean_object* v_a_1467_, lean_object* v_b_1468_, lean_object* v_hab_1469_, lean_object* v_hb_1470_){
_start:
{
lean_object* v_res_1471_; 
v_res_1471_ = l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4(v_n_1465_, v_xs_1466_, v_a_1467_, v_b_1468_, v_hab_1469_, v_hb_1470_);
lean_dec(v_b_1468_);
lean_dec(v_a_1467_);
lean_dec(v_n_1465_);
return v_res_1471_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5(lean_object* v_n_1472_, lean_object* v_xs_1473_, lean_object* v_a_1474_, lean_object* v_b_1475_, lean_object* v_hb_1476_){
_start:
{
lean_object* v___x_1477_; 
v___x_1477_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___redArg(v_n_1472_, v_xs_1473_, v_a_1474_, v_b_1475_);
return v___x_1477_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5___boxed(lean_object* v_n_1478_, lean_object* v_xs_1479_, lean_object* v_a_1480_, lean_object* v_b_1481_, lean_object* v_hb_1482_){
_start:
{
lean_object* v_res_1483_; 
v_res_1483_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5(v_n_1478_, v_xs_1479_, v_a_1480_, v_b_1481_, v_hb_1482_);
lean_dec(v_b_1481_);
lean_dec(v_a_1480_);
lean_dec(v_n_1478_);
return v_res_1483_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9(lean_object* v_n_1484_, lean_object* v_a_1485_, lean_object* v_b_1486_, lean_object* v_pivot_1487_, lean_object* v_hb_1488_, uint64_t v_p_1489_, lean_object* v_xs_1490_, lean_object* v_i_1491_, lean_object* v_j_1492_, lean_object* v_h1_1493_, lean_object* v_h2_1494_, lean_object* v_h3_1495_){
_start:
{
lean_object* v___x_1496_; 
v___x_1496_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___redArg(v_p_1489_, v_xs_1490_, v_i_1491_, v_j_1492_);
return v___x_1496_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9___boxed(lean_object* v_n_1497_, lean_object* v_a_1498_, lean_object* v_b_1499_, lean_object* v_pivot_1500_, lean_object* v_hb_1501_, lean_object* v_p_1502_, lean_object* v_xs_1503_, lean_object* v_i_1504_, lean_object* v_j_1505_, lean_object* v_h1_1506_, lean_object* v_h2_1507_, lean_object* v_h3_1508_){
_start:
{
uint64_t v_p_boxed_1509_; lean_object* v_res_1510_; 
v_p_boxed_1509_ = lean_unbox_uint64(v_p_1502_);
lean_dec_ref(v_p_1502_);
v_res_1510_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__9(v_n_1497_, v_a_1498_, v_b_1499_, v_pivot_1500_, v_hb_1501_, v_p_boxed_1509_, v_xs_1503_, v_i_1504_, v_j_1505_, v_h1_1506_, v_h2_1507_, v_h3_1508_);
lean_dec(v_j_1505_);
lean_dec_ref(v_xs_1503_);
lean_dec(v_pivot_1500_);
lean_dec(v_b_1499_);
lean_dec(v_a_1498_);
lean_dec(v_n_1497_);
return v_res_1510_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10(lean_object* v_n_1511_, lean_object* v_a_1512_, lean_object* v_b_1513_, lean_object* v_pivot_1514_, lean_object* v_hb_1515_, uint64_t v_p_1516_, lean_object* v_xs_1517_, lean_object* v_i_1518_, lean_object* v_j_1519_, lean_object* v_h1_1520_, lean_object* v_h2_1521_, lean_object* v_h3_1522_){
_start:
{
lean_object* v___x_1523_; 
v___x_1523_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___redArg(v_p_1516_, v_xs_1517_, v_i_1518_, v_j_1519_);
return v___x_1523_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10___boxed(lean_object* v_n_1524_, lean_object* v_a_1525_, lean_object* v_b_1526_, lean_object* v_pivot_1527_, lean_object* v_hb_1528_, lean_object* v_p_1529_, lean_object* v_xs_1530_, lean_object* v_i_1531_, lean_object* v_j_1532_, lean_object* v_h1_1533_, lean_object* v_h2_1534_, lean_object* v_h3_1535_){
_start:
{
uint64_t v_p_boxed_1536_; lean_object* v_res_1537_; 
v_p_boxed_1536_ = lean_unbox_uint64(v_p_1529_);
lean_dec_ref(v_p_1529_);
v_res_1537_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__10(v_n_1524_, v_a_1525_, v_b_1526_, v_pivot_1527_, v_hb_1528_, v_p_boxed_1536_, v_xs_1530_, v_i_1531_, v_j_1532_, v_h1_1533_, v_h2_1534_, v_h3_1535_);
lean_dec(v_i_1531_);
lean_dec_ref(v_xs_1530_);
lean_dec(v_pivot_1527_);
lean_dec(v_b_1526_);
lean_dec(v_a_1525_);
lean_dec(v_n_1524_);
return v_res_1537_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11(lean_object* v_n_1538_, lean_object* v_a_1539_, lean_object* v_b_1540_, lean_object* v_pivot_1541_, lean_object* v_hb_1542_, uint64_t v_p_1543_, lean_object* v_xs_1544_, lean_object* v_i_1545_, lean_object* v_j_1546_, lean_object* v_h1_1547_, lean_object* v_h2_1548_, lean_object* v_h3_1549_){
_start:
{
lean_object* v___x_1550_; 
v___x_1550_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___redArg(v_n_1538_, v_a_1539_, v_b_1540_, v_pivot_1541_, v_p_1543_, v_xs_1544_, v_i_1545_, v_j_1546_);
return v___x_1550_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11___boxed(lean_object* v_n_1551_, lean_object* v_a_1552_, lean_object* v_b_1553_, lean_object* v_pivot_1554_, lean_object* v_hb_1555_, lean_object* v_p_1556_, lean_object* v_xs_1557_, lean_object* v_i_1558_, lean_object* v_j_1559_, lean_object* v_h1_1560_, lean_object* v_h2_1561_, lean_object* v_h3_1562_){
_start:
{
uint64_t v_p_boxed_1563_; lean_object* v_res_1564_; 
v_p_boxed_1563_ = lean_unbox_uint64(v_p_1556_);
lean_dec_ref(v_p_1556_);
v_res_1564_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__3_spec__11(v_n_1551_, v_a_1552_, v_b_1553_, v_pivot_1554_, v_hb_1555_, v_p_boxed_1563_, v_xs_1557_, v_i_1558_, v_j_1559_, v_h1_1560_, v_h2_1561_, v_h3_1562_);
lean_dec(v_pivot_1554_);
lean_dec(v_b_1553_);
lean_dec(v_a_1552_);
lean_dec(v_n_1551_);
return v_res_1564_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13(lean_object* v_n_1565_, lean_object* v_a_1566_, lean_object* v_b_1567_, lean_object* v_hb_1568_, lean_object* v_xs_1569_, lean_object* v_i_1570_, lean_object* v_steps_1571_, lean_object* v_h1_1572_, lean_object* v_h2_1573_){
_start:
{
lean_object* v___x_1574_; 
v___x_1574_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___redArg(v_n_1565_, v_a_1566_, v_b_1567_, v_xs_1569_, v_i_1570_, v_steps_1571_);
return v___x_1574_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13___boxed(lean_object* v_n_1575_, lean_object* v_a_1576_, lean_object* v_b_1577_, lean_object* v_hb_1578_, lean_object* v_xs_1579_, lean_object* v_i_1580_, lean_object* v_steps_1581_, lean_object* v_h1_1582_, lean_object* v_h2_1583_){
_start:
{
lean_object* v_res_1584_; 
v_res_1584_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13(v_n_1575_, v_a_1576_, v_b_1577_, v_hb_1578_, v_xs_1579_, v_i_1580_, v_steps_1581_, v_h1_1582_, v_h2_1583_);
lean_dec(v_b_1577_);
lean_dec(v_a_1576_);
lean_dec(v_n_1575_);
return v_res_1584_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15(lean_object* v_n_1585_, lean_object* v_a_1586_, lean_object* v_b_1587_, lean_object* v_hb_1588_, lean_object* v_xs_1589_, lean_object* v_i_1590_){
_start:
{
lean_object* v___x_1591_; 
v___x_1591_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___redArg(v_n_1585_, v_a_1586_, v_b_1587_, v_xs_1589_, v_i_1590_);
return v___x_1591_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15___boxed(lean_object* v_n_1592_, lean_object* v_a_1593_, lean_object* v_b_1594_, lean_object* v_hb_1595_, lean_object* v_xs_1596_, lean_object* v_i_1597_){
_start:
{
lean_object* v_res_1598_; 
v_res_1598_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15(v_n_1592_, v_a_1593_, v_b_1594_, v_hb_1595_, v_xs_1596_, v_i_1597_);
lean_dec(v_b_1594_);
lean_dec(v_a_1593_);
lean_dec(v_n_1592_);
return v_res_1598_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14(lean_object* v_n_1599_, lean_object* v_a_1600_, lean_object* v_b_1601_, lean_object* v_hb_1602_, lean_object* v_xs_1603_, lean_object* v_i_1604_, lean_object* v_h1_1605_, lean_object* v_h2_1606_){
_start:
{
lean_object* v___x_1607_; 
v___x_1607_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___redArg(v_b_1601_, v_xs_1603_, v_i_1604_);
return v___x_1607_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14___boxed(lean_object* v_n_1608_, lean_object* v_a_1609_, lean_object* v_b_1610_, lean_object* v_hb_1611_, lean_object* v_xs_1612_, lean_object* v_i_1613_, lean_object* v_h1_1614_, lean_object* v_h2_1615_){
_start:
{
lean_object* v_res_1616_; 
v_res_1616_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_scan___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__14(v_n_1608_, v_a_1609_, v_b_1610_, v_hb_1611_, v_xs_1612_, v_i_1613_, v_h1_1614_, v_h2_1615_);
lean_dec_ref(v_xs_1612_);
lean_dec(v_b_1610_);
lean_dec(v_a_1609_);
lean_dec(v_n_1608_);
return v_res_1616_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15(lean_object* v_n_1617_, lean_object* v_a_1618_, lean_object* v_b_1619_, lean_object* v_hb_1620_, lean_object* v_xs_1621_, lean_object* v_j_1622_, lean_object* v_hj_1623_){
_start:
{
lean_object* v___x_1624_; 
v___x_1624_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___redArg(v_b_1619_, v_xs_1621_, v_j_1622_);
return v___x_1624_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15___boxed(lean_object* v_n_1625_, lean_object* v_a_1626_, lean_object* v_b_1627_, lean_object* v_hb_1628_, lean_object* v_xs_1629_, lean_object* v_j_1630_, lean_object* v_hj_1631_){
_start:
{
lean_object* v_res_1632_; 
v_res_1632_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_riseRight___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__15(v_n_1625_, v_a_1626_, v_b_1627_, v_hb_1628_, v_xs_1629_, v_j_1630_, v_hj_1631_);
lean_dec(v_b_1627_);
lean_dec(v_a_1626_);
lean_dec(v_n_1625_);
return v_res_1632_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16(lean_object* v_n_1633_, lean_object* v_a_1634_, lean_object* v_b_1635_, lean_object* v_hb_1636_, lean_object* v_xs_1637_, lean_object* v_j_1638_, lean_object* v_hj_1639_){
_start:
{
lean_object* v___x_1640_; 
v___x_1640_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___redArg(v_a_1634_, v_xs_1637_, v_j_1638_);
return v___x_1640_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16___boxed(lean_object* v_n_1641_, lean_object* v_a_1642_, lean_object* v_b_1643_, lean_object* v_hb_1644_, lean_object* v_xs_1645_, lean_object* v_j_1646_, lean_object* v_hj_1647_){
_start:
{
lean_object* v_res_1648_; 
v_res_1648_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_sinkLeft___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partialInsertionSortM_step___at___00Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__4_spec__13_spec__16(v_n_1641_, v_a_1642_, v_b_1643_, v_hb_1644_, v_xs_1645_, v_j_1646_, v_hj_1647_);
lean_dec(v_b_1643_);
lean_dec(v_a_1642_);
lean_dec(v_n_1641_);
return v_res_1648_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19(lean_object* v_n_1649_, lean_object* v_a_1650_, lean_object* v_b_1651_, lean_object* v_xs_1652_, lean_object* v_j_1653_, lean_object* v_hj_1654_){
_start:
{
lean_object* v___x_1655_; 
v___x_1655_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___redArg(v_a_1650_, v_xs_1652_, v_j_1653_);
return v___x_1655_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19___boxed(lean_object* v_n_1656_, lean_object* v_a_1657_, lean_object* v_b_1658_, lean_object* v_xs_1659_, lean_object* v_j_1660_, lean_object* v_hj_1661_){
_start:
{
lean_object* v_res_1662_; 
v_res_1662_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortCoreM___at___00Array_qsortOrd___at___00main_spec__1_spec__1_spec__5_spec__15_spec__19(v_n_1656_, v_a_1657_, v_b_1658_, v_xs_1659_, v_j_1660_, v_hj_1661_);
lean_dec(v_b_1658_);
lean_dec(v_a_1657_);
lean_dec(v_n_1656_);
return v_res_1662_;
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
