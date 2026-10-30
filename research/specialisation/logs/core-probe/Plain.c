// Lean compiler output
// Module: Plain
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
lean_object* lean_array_fswap(lean_object*, lean_object*, lean_object*);
lean_object* lean_array_fget(lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
lean_object* lean_array_fget_borrowed(lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
lean_object* l_Nat_decLt___boxed(lean_object*, lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* lean_nat_shiftr(lean_object*, lean_object*);
uint8_t l_Array_QSort_Internal_instBEqHint_beq(uint8_t, uint8_t);
lean_object* l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_warmPis_spec__0___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Array_QSort_Internal_choosePivotM___at___00Array_QSort_Internal_warmPivot_spec__0___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Array_QSort_Internal_reverseRange___redArg(lean_object*, lean_object*, lean_object*);
lean_object* l_Array_QSort_Internal_breakPatterns___redArg(lean_object*, lean_object*, lean_object*);
lean_object* l_Array_QSort_Internal_heapSortM___at___00Array_QSort_Internal_warmHeap_spec__0___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lean_array_get_size(lean_object*);
lean_object* lean_nat_log2(lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_closure_object l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_closure_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 245}, .m_fun = (void*)l_Nat_decLt___boxed, .m_arity = 2, .m_num_fixed = 0, .m_objs = {} };
static const lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg___closed__0 = (const lean_object*)&l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg___closed__0_value;
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint8_t, uint8_t, uint8_t, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_f(lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, uint8_t, uint8_t, uint8_t, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___redArg(lean_object* v_a_1_, lean_object* v_xs_2_, lean_object* v_j_3_){
_start:
{
uint8_t v___x_4_; 
v___x_4_ = lean_nat_dec_lt(v_a_1_, v_j_3_);
if (v___x_4_ == 0)
{
lean_dec(v_j_3_);
return v_xs_2_;
}
else
{
lean_object* v___x_5_; lean_object* v___x_6_; lean_object* v___x_7_; lean_object* v___x_8_; uint8_t v___x_9_; 
v___x_5_ = lean_array_fget_borrowed(v_xs_2_, v_j_3_);
v___x_6_ = lean_unsigned_to_nat(1u);
v___x_7_ = lean_nat_sub(v_j_3_, v___x_6_);
v___x_8_ = lean_array_fget_borrowed(v_xs_2_, v___x_7_);
v___x_9_ = lean_nat_dec_lt(v___x_5_, v___x_8_);
if (v___x_9_ == 0)
{
lean_dec(v___x_7_);
lean_dec(v_j_3_);
return v_xs_2_;
}
else
{
lean_object* v___x_10_; 
v___x_10_ = lean_array_fswap(v_xs_2_, v_j_3_, v___x_7_);
lean_dec(v_j_3_);
v_xs_2_ = v___x_10_;
v_j_3_ = v___x_7_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___redArg___boxed(lean_object* v_a_12_, lean_object* v_xs_13_, lean_object* v_j_14_){
_start:
{
lean_object* v_res_15_; 
v_res_15_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___redArg(v_a_12_, v_xs_13_, v_j_14_);
lean_dec(v_a_12_);
return v_res_15_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___redArg(lean_object* v_n_16_, lean_object* v_a_17_, lean_object* v_b_18_, lean_object* v_xs_19_, lean_object* v_i_20_){
_start:
{
uint8_t v___x_21_; 
v___x_21_ = lean_nat_dec_lt(v_i_20_, v_b_18_);
if (v___x_21_ == 0)
{
lean_dec(v_i_20_);
return v_xs_19_;
}
else
{
lean_object* v___x_22_; lean_object* v___x_23_; lean_object* v___x_24_; 
lean_inc(v_i_20_);
v___x_22_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___redArg(v_a_17_, v_xs_19_, v_i_20_);
v___x_23_ = lean_unsigned_to_nat(1u);
v___x_24_ = lean_nat_add(v_i_20_, v___x_23_);
lean_dec(v_i_20_);
v_xs_19_ = v___x_22_;
v_i_20_ = v___x_24_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___redArg___boxed(lean_object* v_n_26_, lean_object* v_a_27_, lean_object* v_b_28_, lean_object* v_xs_29_, lean_object* v_i_30_){
_start:
{
lean_object* v_res_31_; 
v_res_31_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___redArg(v_n_26_, v_a_27_, v_b_28_, v_xs_29_, v_i_30_);
lean_dec(v_b_28_);
lean_dec(v_a_27_);
lean_dec(v_n_26_);
return v_res_31_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___redArg(lean_object* v_n_32_, lean_object* v_xs_33_, lean_object* v_a_34_, lean_object* v_b_35_){
_start:
{
lean_object* v___x_36_; lean_object* v___x_37_; lean_object* v___x_38_; 
v___x_36_ = lean_unsigned_to_nat(1u);
v___x_37_ = lean_nat_add(v_a_34_, v___x_36_);
v___x_38_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___redArg(v_n_32_, v_a_34_, v_b_35_, v_xs_33_, v___x_37_);
return v___x_38_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___redArg___boxed(lean_object* v_n_39_, lean_object* v_xs_40_, lean_object* v_a_41_, lean_object* v_b_42_){
_start:
{
lean_object* v_res_43_; 
v_res_43_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___redArg(v_n_39_, v_xs_40_, v_a_41_, v_b_42_);
lean_dec(v_b_42_);
lean_dec(v_a_41_);
lean_dec(v_n_39_);
return v_res_43_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___redArg(lean_object* v_p_44_, lean_object* v_xs_45_, lean_object* v_i_46_, lean_object* v_j_47_){
_start:
{
uint8_t v___x_48_; 
v___x_48_ = lean_nat_dec_le(v_i_46_, v_j_47_);
if (v___x_48_ == 0)
{
return v_i_46_;
}
else
{
lean_object* v___x_49_; uint8_t v___x_50_; 
v___x_49_ = lean_array_fget_borrowed(v_xs_45_, v_i_46_);
v___x_50_ = lean_nat_dec_lt(v_p_44_, v___x_49_);
if (v___x_50_ == 0)
{
lean_object* v___x_51_; lean_object* v___x_52_; 
v___x_51_ = lean_unsigned_to_nat(1u);
v___x_52_ = lean_nat_add(v_i_46_, v___x_51_);
lean_dec(v_i_46_);
v_i_46_ = v___x_52_;
goto _start;
}
else
{
return v_i_46_;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___redArg___boxed(lean_object* v_p_54_, lean_object* v_xs_55_, lean_object* v_i_56_, lean_object* v_j_57_){
_start:
{
lean_object* v_res_58_; 
v_res_58_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___redArg(v_p_54_, v_xs_55_, v_i_56_, v_j_57_);
lean_dec(v_j_57_);
lean_dec_ref(v_xs_55_);
lean_dec(v_p_54_);
return v_res_58_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___redArg(lean_object* v_p_59_, lean_object* v_xs_60_, lean_object* v_i_61_, lean_object* v_j_62_){
_start:
{
uint8_t v___x_63_; 
v___x_63_ = lean_nat_dec_le(v_i_61_, v_j_62_);
if (v___x_63_ == 0)
{
return v_j_62_;
}
else
{
lean_object* v___x_64_; uint8_t v___x_65_; 
v___x_64_ = lean_array_fget_borrowed(v_xs_60_, v_j_62_);
v___x_65_ = lean_nat_dec_lt(v_p_59_, v___x_64_);
if (v___x_65_ == 0)
{
return v_j_62_;
}
else
{
lean_object* v___x_66_; lean_object* v___x_67_; 
v___x_66_ = lean_unsigned_to_nat(1u);
v___x_67_ = lean_nat_sub(v_j_62_, v___x_66_);
lean_dec(v_j_62_);
v_j_62_ = v___x_67_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___redArg___boxed(lean_object* v_p_69_, lean_object* v_xs_70_, lean_object* v_i_71_, lean_object* v_j_72_){
_start:
{
lean_object* v_res_73_; 
v_res_73_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___redArg(v_p_69_, v_xs_70_, v_i_71_, v_j_72_);
lean_dec(v_i_71_);
lean_dec_ref(v_xs_70_);
lean_dec(v_p_69_);
return v_res_73_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___redArg(lean_object* v_n_74_, lean_object* v_a_75_, lean_object* v_b_76_, lean_object* v_pivot_77_, lean_object* v_p_78_, lean_object* v_xs_79_, lean_object* v_i_80_, lean_object* v_j_81_){
_start:
{
lean_object* v_val_82_; lean_object* v_val_83_; uint8_t v___x_84_; 
v_val_82_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___redArg(v_p_78_, v_xs_79_, v_i_80_, v_j_81_);
v_val_83_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___redArg(v_p_78_, v_xs_79_, v_val_82_, v_j_81_);
v___x_84_ = lean_nat_dec_lt(v_val_82_, v_val_83_);
if (v___x_84_ == 0)
{
lean_object* v___x_85_; 
lean_dec(v_val_83_);
v___x_85_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_85_, 0, v_xs_79_);
lean_ctor_set(v___x_85_, 1, v_val_82_);
return v___x_85_;
}
else
{
lean_object* v___x_86_; lean_object* v___x_87_; lean_object* v___x_88_; lean_object* v___x_89_; 
v___x_86_ = lean_array_fswap(v_xs_79_, v_val_82_, v_val_83_);
v___x_87_ = lean_unsigned_to_nat(1u);
v___x_88_ = lean_nat_add(v_val_82_, v___x_87_);
lean_dec(v_val_82_);
v___x_89_ = lean_nat_sub(v_val_83_, v___x_87_);
lean_dec(v_val_83_);
v_xs_79_ = v___x_86_;
v_i_80_ = v___x_88_;
v_j_81_ = v___x_89_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___redArg___boxed(lean_object* v_n_91_, lean_object* v_a_92_, lean_object* v_b_93_, lean_object* v_pivot_94_, lean_object* v_p_95_, lean_object* v_xs_96_, lean_object* v_i_97_, lean_object* v_j_98_){
_start:
{
lean_object* v_res_99_; 
v_res_99_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___redArg(v_n_91_, v_a_92_, v_b_93_, v_pivot_94_, v_p_95_, v_xs_96_, v_i_97_, v_j_98_);
lean_dec(v_p_95_);
lean_dec(v_pivot_94_);
lean_dec(v_b_93_);
lean_dec(v_a_92_);
lean_dec(v_n_91_);
return v_res_99_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___redArg(lean_object* v_n_100_, lean_object* v_xs_101_, lean_object* v_a_102_, lean_object* v_b_103_, lean_object* v_pivot_104_){
_start:
{
lean_object* v_xs_105_; lean_object* v___x_106_; lean_object* v___x_107_; lean_object* v___x_108_; lean_object* v___x_109_; lean_object* v___x_110_; 
v_xs_105_ = lean_array_fswap(v_xs_101_, v_a_102_, v_pivot_104_);
v___x_106_ = lean_array_fget(v_xs_105_, v_a_102_);
v___x_107_ = lean_unsigned_to_nat(1u);
v___x_108_ = lean_nat_add(v_a_102_, v___x_107_);
v___x_109_ = lean_nat_sub(v_b_103_, v___x_107_);
v___x_110_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___redArg(v_n_100_, v_a_102_, v_b_103_, v_pivot_104_, v___x_106_, v_xs_105_, v___x_108_, v___x_109_);
lean_dec(v___x_106_);
return v___x_110_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___redArg___boxed(lean_object* v_n_111_, lean_object* v_xs_112_, lean_object* v_a_113_, lean_object* v_b_114_, lean_object* v_pivot_115_){
_start:
{
lean_object* v_res_116_; 
v_res_116_ = l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___redArg(v_n_111_, v_xs_112_, v_a_113_, v_b_114_, v_pivot_115_);
lean_dec(v_pivot_115_);
lean_dec(v_b_114_);
lean_dec(v_a_113_);
lean_dec(v_n_111_);
return v_res_116_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg(lean_object* v_p_117_, lean_object* v_xs_118_, lean_object* v_i_119_, lean_object* v_j_120_){
_start:
{
uint8_t v___x_121_; 
v___x_121_ = lean_nat_dec_le(v_i_119_, v_j_120_);
if (v___x_121_ == 0)
{
return v_i_119_;
}
else
{
lean_object* v___x_122_; uint8_t v___x_123_; 
v___x_122_ = lean_array_fget_borrowed(v_xs_118_, v_i_119_);
v___x_123_ = lean_nat_dec_lt(v___x_122_, v_p_117_);
if (v___x_123_ == 0)
{
return v_i_119_;
}
else
{
lean_object* v___x_124_; lean_object* v___x_125_; 
v___x_124_ = lean_unsigned_to_nat(1u);
v___x_125_ = lean_nat_add(v_i_119_, v___x_124_);
lean_dec(v_i_119_);
v_i_119_ = v___x_125_;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg___boxed(lean_object* v_p_127_, lean_object* v_xs_128_, lean_object* v_i_129_, lean_object* v_j_130_){
_start:
{
lean_object* v_res_131_; 
v_res_131_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg(v_p_127_, v_xs_128_, v_i_129_, v_j_130_);
lean_dec(v_j_130_);
lean_dec_ref(v_xs_128_);
lean_dec(v_p_127_);
return v_res_131_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg(lean_object* v_p_132_, lean_object* v_xs_133_, lean_object* v_i_134_, lean_object* v_j_135_){
_start:
{
uint8_t v___x_136_; 
v___x_136_ = lean_nat_dec_le(v_i_134_, v_j_135_);
if (v___x_136_ == 0)
{
return v_j_135_;
}
else
{
lean_object* v___x_137_; uint8_t v___x_138_; 
v___x_137_ = lean_array_fget_borrowed(v_xs_133_, v_j_135_);
v___x_138_ = lean_nat_dec_lt(v___x_137_, v_p_132_);
if (v___x_138_ == 0)
{
lean_object* v___x_139_; lean_object* v___x_140_; 
v___x_139_ = lean_unsigned_to_nat(1u);
v___x_140_ = lean_nat_sub(v_j_135_, v___x_139_);
lean_dec(v_j_135_);
v_j_135_ = v___x_140_;
goto _start;
}
else
{
return v_j_135_;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg___boxed(lean_object* v_p_142_, lean_object* v_xs_143_, lean_object* v_i_144_, lean_object* v_j_145_){
_start:
{
lean_object* v_res_146_; 
v_res_146_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg(v_p_142_, v_xs_143_, v_i_144_, v_j_145_);
lean_dec(v_i_144_);
lean_dec_ref(v_xs_143_);
lean_dec(v_p_142_);
return v_res_146_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___redArg(lean_object* v_n_147_, lean_object* v_a_148_, lean_object* v_b_149_, lean_object* v_pivot_150_, lean_object* v_p_151_, lean_object* v_xs_152_, lean_object* v_i_153_, lean_object* v_j_154_){
_start:
{
lean_object* v_val_155_; lean_object* v_val_156_; uint8_t v___x_157_; 
v_val_155_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg(v_p_151_, v_xs_152_, v_i_153_, v_j_154_);
v_val_156_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg(v_p_151_, v_xs_152_, v_val_155_, v_j_154_);
v___x_157_ = lean_nat_dec_lt(v_val_155_, v_val_156_);
if (v___x_157_ == 0)
{
lean_object* v___x_158_; lean_object* v___x_159_; lean_object* v___x_160_; lean_object* v___x_161_; 
lean_dec(v_val_155_);
v___x_158_ = lean_array_fswap(v_xs_152_, v_val_156_, v_a_148_);
v___x_159_ = lean_box(v___x_157_);
v___x_160_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_160_, 0, v_val_156_);
lean_ctor_set(v___x_160_, 1, v___x_159_);
v___x_161_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_161_, 0, v___x_158_);
lean_ctor_set(v___x_161_, 1, v___x_160_);
return v___x_161_;
}
else
{
lean_object* v___x_162_; lean_object* v___x_163_; lean_object* v___x_164_; lean_object* v___x_165_; 
v___x_162_ = lean_array_fswap(v_xs_152_, v_val_155_, v_val_156_);
v___x_163_ = lean_unsigned_to_nat(1u);
v___x_164_ = lean_nat_add(v_val_155_, v___x_163_);
lean_dec(v_val_155_);
v___x_165_ = lean_nat_sub(v_val_156_, v___x_163_);
lean_dec(v_val_156_);
v_xs_152_ = v___x_162_;
v_i_153_ = v___x_164_;
v_j_154_ = v___x_165_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___redArg___boxed(lean_object* v_n_167_, lean_object* v_a_168_, lean_object* v_b_169_, lean_object* v_pivot_170_, lean_object* v_p_171_, lean_object* v_xs_172_, lean_object* v_i_173_, lean_object* v_j_174_){
_start:
{
lean_object* v_res_175_; 
v_res_175_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___redArg(v_n_167_, v_a_168_, v_b_169_, v_pivot_170_, v_p_171_, v_xs_172_, v_i_173_, v_j_174_);
lean_dec(v_p_171_);
lean_dec(v_pivot_170_);
lean_dec(v_b_169_);
lean_dec(v_a_168_);
lean_dec(v_n_167_);
return v_res_175_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg(lean_object* v_n_176_, lean_object* v_xs_177_, lean_object* v_a_178_, lean_object* v_b_179_, lean_object* v_pivot_180_){
_start:
{
lean_object* v_xs_181_; lean_object* v_p_182_; lean_object* v___x_183_; lean_object* v___x_184_; lean_object* v___x_185_; lean_object* v_val_186_; lean_object* v_val_187_; uint8_t v___x_188_; 
v_xs_181_ = lean_array_fswap(v_xs_177_, v_a_178_, v_pivot_180_);
v_p_182_ = lean_array_fget_borrowed(v_xs_181_, v_a_178_);
v___x_183_ = lean_unsigned_to_nat(1u);
v___x_184_ = lean_nat_add(v_a_178_, v___x_183_);
v___x_185_ = lean_nat_sub(v_b_179_, v___x_183_);
v_val_186_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg(v_p_182_, v_xs_181_, v___x_184_, v___x_185_);
v_val_187_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg(v_p_182_, v_xs_181_, v_val_186_, v___x_185_);
v___x_188_ = lean_nat_dec_lt(v_val_186_, v_val_187_);
if (v___x_188_ == 0)
{
lean_object* v___x_189_; uint8_t v___x_190_; lean_object* v___x_191_; lean_object* v___x_192_; lean_object* v___x_193_; 
lean_dec(v_val_186_);
v___x_189_ = lean_array_fswap(v_xs_181_, v_val_187_, v_a_178_);
v___x_190_ = 1;
v___x_191_ = lean_box(v___x_190_);
v___x_192_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_192_, 0, v_val_187_);
lean_ctor_set(v___x_192_, 1, v___x_191_);
v___x_193_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_193_, 0, v___x_189_);
lean_ctor_set(v___x_193_, 1, v___x_192_);
return v___x_193_;
}
else
{
lean_object* v___x_194_; lean_object* v___x_195_; lean_object* v___x_196_; lean_object* v___x_197_; 
lean_inc(v_p_182_);
v___x_194_ = lean_array_fswap(v_xs_181_, v_val_186_, v_val_187_);
v___x_195_ = lean_nat_add(v_val_186_, v___x_183_);
lean_dec(v_val_186_);
v___x_196_ = lean_nat_sub(v_val_187_, v___x_183_);
lean_dec(v_val_187_);
v___x_197_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___redArg(v_n_176_, v_a_178_, v_b_179_, v_pivot_180_, v_p_182_, v___x_194_, v___x_195_, v___x_196_);
lean_dec(v_p_182_);
return v___x_197_;
}
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg___boxed(lean_object* v_n_198_, lean_object* v_xs_199_, lean_object* v_a_200_, lean_object* v_b_201_, lean_object* v_pivot_202_){
_start:
{
lean_object* v_res_203_; 
v_res_203_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg(v_n_198_, v_xs_199_, v_a_200_, v_b_201_, v_pivot_202_);
lean_dec(v_pivot_202_);
lean_dec(v_b_201_);
lean_dec(v_a_200_);
lean_dec(v_n_198_);
return v_res_203_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(lean_object* v_n_205_, lean_object* v_lo_206_, lean_object* v_xs_207_, lean_object* v_a_208_, lean_object* v_b_209_, lean_object* v_limit_210_, uint8_t v_balanced_211_, uint8_t v_partitioned_212_, uint8_t v_afterEqual_213_, lean_object* v_fuel_214_){
_start:
{
lean_object* v___x_215_; lean_object* v___x_216_; uint8_t v___x_217_; 
v___x_215_ = lean_nat_sub(v_b_209_, v_a_208_);
v___x_216_ = lean_unsigned_to_nat(24u);
v___x_217_ = lean_nat_dec_le(v___x_215_, v___x_216_);
if (v___x_217_ == 0)
{
lean_object* v___f_218_; lean_object* v___x_219_; uint8_t v___x_220_; 
v___f_218_ = ((lean_object*)(l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg___closed__0));
v___x_219_ = lean_unsigned_to_nat(0u);
v___x_220_ = lean_nat_dec_eq(v_limit_210_, v___x_219_);
if (v___x_220_ == 0)
{
uint8_t v_isZero_221_; lean_object* v_one_222_; lean_object* v_n_223_; lean_object* v___y_225_; uint8_t v___y_226_; lean_object* v___y_227_; lean_object* v___y_228_; uint8_t v___y_229_; lean_object* v___y_253_; lean_object* v___y_254_; lean_object* v_fst_255_; uint8_t v_snd_256_; lean_object* v___y_290_; lean_object* v_fst_291_; lean_object* v_fst_292_; uint8_t v_snd_293_; lean_object* v_fst_303_; lean_object* v_snd_304_; 
v_isZero_221_ = lean_nat_dec_eq(v_fuel_214_, v___x_219_);
v_one_222_ = lean_unsigned_to_nat(1u);
v_n_223_ = lean_nat_sub(v_fuel_214_, v_one_222_);
lean_dec(v_fuel_214_);
if (v_balanced_211_ == 0)
{
lean_object* v___x_317_; lean_object* v___x_318_; 
v___x_317_ = l_Array_QSort_Internal_breakPatterns___redArg(v_xs_207_, v_a_208_, v_b_209_);
v___x_318_ = lean_nat_sub(v_limit_210_, v_one_222_);
lean_dec(v_limit_210_);
v_fst_303_ = v___x_317_;
v_snd_304_ = v___x_318_;
goto v___jp_302_;
}
else
{
v_fst_303_ = v_xs_207_;
v_snd_304_ = v_limit_210_;
goto v___jp_302_;
}
v___jp_224_:
{
lean_object* v___x_230_; lean_object* v_snd_231_; lean_object* v_fst_232_; lean_object* v_fst_233_; lean_object* v_snd_234_; lean_object* v___x_235_; lean_object* v___x_236_; uint8_t v___x_237_; 
v___x_230_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg(v_n_205_, v___y_227_, v_a_208_, v_b_209_, v___y_228_);
lean_dec(v___y_228_);
v_snd_231_ = lean_ctor_get(v___x_230_, 1);
lean_inc(v_snd_231_);
v_fst_232_ = lean_ctor_get(v___x_230_, 0);
lean_inc(v_fst_232_);
lean_dec_ref(v___x_230_);
v_fst_233_ = lean_ctor_get(v_snd_231_, 0);
lean_inc(v_fst_233_);
v_snd_234_ = lean_ctor_get(v_snd_231_, 1);
lean_inc(v_snd_234_);
lean_dec(v_snd_231_);
v___x_235_ = lean_nat_sub(v_fst_233_, v_a_208_);
v___x_236_ = lean_nat_sub(v_b_209_, v_fst_233_);
v___x_237_ = lean_nat_dec_lt(v___x_235_, v___x_236_);
if (v___x_237_ == 0)
{
lean_object* v___x_238_; lean_object* v___x_239_; lean_object* v___x_240_; lean_object* v___x_241_; uint8_t v___x_242_; uint8_t v___x_243_; 
lean_dec(v___x_235_);
v___x_238_ = lean_nat_add(v_fst_233_, v_one_222_);
lean_inc(v_n_223_);
lean_inc(v___y_225_);
v___x_239_ = l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(v_n_205_, v_lo_206_, v_fst_232_, v___x_238_, v_b_209_, v___y_225_, v___y_226_, v___y_226_, v___x_237_, v_n_223_);
v___x_240_ = lean_unsigned_to_nat(3u);
v___x_241_ = lean_nat_shiftr(v___x_215_, v___x_240_);
lean_dec(v___x_215_);
v___x_242_ = lean_nat_dec_le(v___x_241_, v___x_236_);
lean_dec(v___x_236_);
lean_dec(v___x_241_);
v___x_243_ = lean_unbox(v_snd_234_);
lean_dec(v_snd_234_);
v_xs_207_ = v___x_239_;
v_b_209_ = v_fst_233_;
v_limit_210_ = v___y_225_;
v_balanced_211_ = v___x_242_;
v_partitioned_212_ = v___x_243_;
v_afterEqual_213_ = v___x_237_;
v_fuel_214_ = v_n_223_;
goto _start;
}
else
{
lean_object* v___x_245_; lean_object* v___x_246_; lean_object* v___x_247_; lean_object* v___x_248_; uint8_t v___x_249_; uint8_t v___x_250_; 
lean_dec(v___x_236_);
lean_inc(v_n_223_);
lean_inc(v___y_225_);
lean_inc(v_fst_233_);
v___x_245_ = l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(v_n_205_, v_lo_206_, v_fst_232_, v_a_208_, v_fst_233_, v___y_225_, v___y_226_, v___y_226_, v___y_229_, v_n_223_);
v___x_246_ = lean_nat_add(v_fst_233_, v_one_222_);
lean_dec(v_fst_233_);
v___x_247_ = lean_unsigned_to_nat(3u);
v___x_248_ = lean_nat_shiftr(v___x_215_, v___x_247_);
lean_dec(v___x_215_);
v___x_249_ = lean_nat_dec_le(v___x_248_, v___x_235_);
lean_dec(v___x_235_);
lean_dec(v___x_248_);
v___x_250_ = lean_unbox(v_snd_234_);
lean_dec(v_snd_234_);
v_xs_207_ = v___x_245_;
v_a_208_ = v___x_246_;
v_limit_210_ = v___y_225_;
v_balanced_211_ = v___x_249_;
v_partitioned_212_ = v___x_250_;
v_afterEqual_213_ = v___y_229_;
v_fuel_214_ = v_n_223_;
goto _start;
}
}
v___jp_252_:
{
uint8_t v___x_257_; 
v___x_257_ = 1;
if (v_afterEqual_213_ == 0)
{
uint8_t v___x_258_; 
v___x_258_ = lean_nat_dec_lt(v_lo_206_, v_a_208_);
if (v___x_258_ == 0)
{
v___y_225_ = v___y_253_;
v___y_226_ = v___x_257_;
v___y_227_ = v_fst_255_;
v___y_228_ = v___y_254_;
v___y_229_ = v___x_258_;
goto v___jp_224_;
}
else
{
lean_object* v___x_259_; lean_object* v___x_260_; lean_object* v___x_261_; uint8_t v___x_262_; 
v___x_259_ = lean_nat_sub(v_a_208_, v_one_222_);
v___x_260_ = lean_array_fget_borrowed(v_fst_255_, v___x_259_);
lean_dec(v___x_259_);
v___x_261_ = lean_array_fget_borrowed(v_fst_255_, v___y_254_);
v___x_262_ = lean_nat_dec_lt(v___x_260_, v___x_261_);
if (v___x_262_ == 0)
{
lean_object* v___x_263_; lean_object* v_fst_264_; lean_object* v_snd_265_; 
lean_dec(v___x_215_);
v___x_263_ = l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___redArg(v_n_205_, v_fst_255_, v_a_208_, v_b_209_, v___y_254_);
lean_dec(v___y_254_);
lean_dec(v_a_208_);
v_fst_264_ = lean_ctor_get(v___x_263_, 0);
lean_inc(v_fst_264_);
v_snd_265_ = lean_ctor_get(v___x_263_, 1);
lean_inc(v_snd_265_);
lean_dec_ref(v___x_263_);
v_xs_207_ = v_fst_264_;
v_a_208_ = v_snd_265_;
v_limit_210_ = v___y_253_;
v_afterEqual_213_ = v___x_257_;
v_fuel_214_ = v_n_223_;
goto _start;
}
else
{
lean_object* v___x_267_; lean_object* v_snd_268_; lean_object* v_fst_269_; lean_object* v_fst_270_; lean_object* v_snd_271_; lean_object* v___x_272_; lean_object* v___x_273_; uint8_t v___x_274_; 
v___x_267_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg(v_n_205_, v_fst_255_, v_a_208_, v_b_209_, v___y_254_);
lean_dec(v___y_254_);
v_snd_268_ = lean_ctor_get(v___x_267_, 1);
lean_inc(v_snd_268_);
v_fst_269_ = lean_ctor_get(v___x_267_, 0);
lean_inc(v_fst_269_);
lean_dec_ref(v___x_267_);
v_fst_270_ = lean_ctor_get(v_snd_268_, 0);
lean_inc(v_fst_270_);
v_snd_271_ = lean_ctor_get(v_snd_268_, 1);
lean_inc(v_snd_271_);
lean_dec(v_snd_268_);
v___x_272_ = lean_nat_sub(v_fst_270_, v_a_208_);
v___x_273_ = lean_nat_sub(v_b_209_, v_fst_270_);
v___x_274_ = lean_nat_dec_lt(v___x_272_, v___x_273_);
if (v___x_274_ == 0)
{
lean_object* v___x_275_; lean_object* v___x_276_; lean_object* v___x_277_; lean_object* v___x_278_; uint8_t v___x_279_; uint8_t v___x_280_; 
lean_dec(v___x_272_);
v___x_275_ = lean_nat_add(v_fst_270_, v_one_222_);
lean_inc(v_n_223_);
lean_inc(v___y_253_);
v___x_276_ = l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(v_n_205_, v_lo_206_, v_fst_269_, v___x_275_, v_b_209_, v___y_253_, v___x_257_, v___x_257_, v___x_274_, v_n_223_);
v___x_277_ = lean_unsigned_to_nat(3u);
v___x_278_ = lean_nat_shiftr(v___x_215_, v___x_277_);
lean_dec(v___x_215_);
v___x_279_ = lean_nat_dec_le(v___x_278_, v___x_273_);
lean_dec(v___x_273_);
lean_dec(v___x_278_);
v___x_280_ = lean_unbox(v_snd_271_);
lean_dec(v_snd_271_);
v_xs_207_ = v___x_276_;
v_b_209_ = v_fst_270_;
v_limit_210_ = v___y_253_;
v_balanced_211_ = v___x_279_;
v_partitioned_212_ = v___x_280_;
v_afterEqual_213_ = v___x_274_;
v_fuel_214_ = v_n_223_;
goto _start;
}
else
{
lean_object* v___x_282_; lean_object* v___x_283_; lean_object* v___x_284_; lean_object* v___x_285_; uint8_t v___x_286_; uint8_t v___x_287_; 
lean_dec(v___x_273_);
lean_inc(v_n_223_);
lean_inc(v___y_253_);
lean_inc(v_fst_270_);
v___x_282_ = l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(v_n_205_, v_lo_206_, v_fst_269_, v_a_208_, v_fst_270_, v___y_253_, v___x_257_, v___x_257_, v_snd_256_, v_n_223_);
v___x_283_ = lean_nat_add(v_fst_270_, v_one_222_);
lean_dec(v_fst_270_);
v___x_284_ = lean_unsigned_to_nat(3u);
v___x_285_ = lean_nat_shiftr(v___x_215_, v___x_284_);
lean_dec(v___x_215_);
v___x_286_ = lean_nat_dec_le(v___x_285_, v___x_272_);
lean_dec(v___x_272_);
lean_dec(v___x_285_);
v___x_287_ = lean_unbox(v_snd_271_);
lean_dec(v_snd_271_);
v_xs_207_ = v___x_282_;
v_a_208_ = v___x_283_;
v_limit_210_ = v___y_253_;
v_balanced_211_ = v___x_286_;
v_partitioned_212_ = v___x_287_;
v_afterEqual_213_ = v_snd_256_;
v_fuel_214_ = v_n_223_;
goto _start;
}
}
}
}
else
{
v___y_225_ = v___y_253_;
v___y_226_ = v___x_257_;
v___y_227_ = v_fst_255_;
v___y_228_ = v___y_254_;
v___y_229_ = v_snd_256_;
goto v___jp_224_;
}
}
v___jp_289_:
{
if (v_balanced_211_ == 0)
{
v___y_253_ = v___y_290_;
v___y_254_ = v_fst_292_;
v_fst_255_ = v_fst_291_;
v_snd_256_ = v___x_220_;
goto v___jp_252_;
}
else
{
if (v_partitioned_212_ == 0)
{
v___y_253_ = v___y_290_;
v___y_254_ = v_fst_292_;
v_fst_255_ = v_fst_291_;
v_snd_256_ = v___x_220_;
goto v___jp_252_;
}
else
{
uint8_t v___x_294_; uint8_t v___x_295_; 
v___x_294_ = 1;
v___x_295_ = l_Array_QSort_Internal_instBEqHint_beq(v_snd_293_, v___x_294_);
if (v___x_295_ == 0)
{
v___y_253_ = v___y_290_;
v___y_254_ = v_fst_292_;
v_fst_255_ = v_fst_291_;
v_snd_256_ = v___x_295_;
goto v___jp_252_;
}
else
{
lean_object* v___x_296_; lean_object* v_snd_297_; uint8_t v___x_298_; 
v___x_296_ = l_Array_QSort_Internal_partialInsertionSortM___at___00Array_QSort_Internal_warmPis_spec__0___redArg(v_n_205_, v___f_218_, v_fst_291_, v_a_208_, v_b_209_);
v_snd_297_ = lean_ctor_get(v___x_296_, 1);
v___x_298_ = lean_unbox(v_snd_297_);
if (v___x_298_ == 0)
{
lean_object* v_fst_299_; uint8_t v___x_300_; 
lean_inc(v_snd_297_);
v_fst_299_ = lean_ctor_get(v___x_296_, 0);
lean_inc(v_fst_299_);
lean_dec_ref(v___x_296_);
v___x_300_ = lean_unbox(v_snd_297_);
lean_dec(v_snd_297_);
v___y_253_ = v___y_290_;
v___y_254_ = v_fst_292_;
v_fst_255_ = v_fst_299_;
v_snd_256_ = v___x_300_;
goto v___jp_252_;
}
else
{
lean_object* v_fst_301_; 
lean_dec(v_fst_292_);
lean_dec(v___y_290_);
lean_dec(v_n_223_);
lean_dec(v___x_215_);
lean_dec(v_b_209_);
lean_dec(v_a_208_);
v_fst_301_ = lean_ctor_get(v___x_296_, 0);
lean_inc(v_fst_301_);
lean_dec_ref(v___x_296_);
return v_fst_301_;
}
}
}
}
}
v___jp_302_:
{
lean_object* v_down_305_; lean_object* v_fst_306_; lean_object* v_snd_307_; uint8_t v___x_308_; uint8_t v___x_309_; uint8_t v___x_310_; 
v_down_305_ = l_Array_QSort_Internal_choosePivotM___at___00Array_QSort_Internal_warmPivot_spec__0___redArg(v___f_218_, v_fst_303_, v_a_208_, v_b_209_);
v_fst_306_ = lean_ctor_get(v_down_305_, 0);
lean_inc(v_fst_306_);
v_snd_307_ = lean_ctor_get(v_down_305_, 1);
lean_inc(v_snd_307_);
lean_dec_ref(v_down_305_);
v___x_308_ = 2;
v___x_309_ = lean_unbox(v_snd_307_);
v___x_310_ = l_Array_QSort_Internal_instBEqHint_beq(v___x_309_, v___x_308_);
if (v___x_310_ == 0)
{
uint8_t v___x_311_; 
v___x_311_ = lean_unbox(v_snd_307_);
lean_dec(v_snd_307_);
v___y_290_ = v_snd_304_;
v_fst_291_ = v_fst_303_;
v_fst_292_ = v_fst_306_;
v_snd_293_ = v___x_311_;
goto v___jp_289_;
}
else
{
lean_object* v___x_312_; lean_object* v___x_313_; lean_object* v___x_314_; lean_object* v___x_315_; uint8_t v___x_316_; 
lean_dec(v_snd_307_);
lean_inc(v_b_209_);
lean_inc(v_a_208_);
v___x_312_ = l_Array_QSort_Internal_reverseRange___redArg(v_fst_303_, v_a_208_, v_b_209_);
v___x_313_ = lean_nat_sub(v_b_209_, v_one_222_);
v___x_314_ = lean_nat_sub(v_fst_306_, v_a_208_);
lean_dec(v_fst_306_);
v___x_315_ = lean_nat_sub(v___x_313_, v___x_314_);
lean_dec(v___x_314_);
lean_dec(v___x_313_);
v___x_316_ = 1;
v___y_290_ = v_snd_304_;
v_fst_291_ = v___x_312_;
v_fst_292_ = v___x_315_;
v_snd_293_ = v___x_316_;
goto v___jp_289_;
}
}
}
else
{
lean_object* v___x_319_; 
lean_dec(v___x_215_);
lean_dec(v_fuel_214_);
lean_dec(v_limit_210_);
v___x_319_ = l_Array_QSort_Internal_heapSortM___at___00Array_QSort_Internal_warmHeap_spec__0___redArg(v_n_205_, v___f_218_, v_xs_207_, v_a_208_, v_b_209_);
lean_dec(v_b_209_);
lean_dec(v_a_208_);
return v___x_319_;
}
}
else
{
lean_object* v___x_320_; 
lean_dec(v___x_215_);
lean_dec(v_fuel_214_);
lean_dec(v_limit_210_);
v___x_320_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___redArg(v_n_205_, v_xs_207_, v_a_208_, v_b_209_);
lean_dec(v_b_209_);
lean_dec(v_a_208_);
return v___x_320_;
}
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg___boxed(lean_object* v_n_321_, lean_object* v_lo_322_, lean_object* v_xs_323_, lean_object* v_a_324_, lean_object* v_b_325_, lean_object* v_limit_326_, lean_object* v_balanced_327_, lean_object* v_partitioned_328_, lean_object* v_afterEqual_329_, lean_object* v_fuel_330_){
_start:
{
uint8_t v_balanced_boxed_331_; uint8_t v_partitioned_boxed_332_; uint8_t v_afterEqual_boxed_333_; lean_object* v_res_334_; 
v_balanced_boxed_331_ = lean_unbox(v_balanced_327_);
v_partitioned_boxed_332_ = lean_unbox(v_partitioned_328_);
v_afterEqual_boxed_333_ = lean_unbox(v_afterEqual_329_);
v_res_334_ = l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(v_n_321_, v_lo_322_, v_xs_323_, v_a_324_, v_b_325_, v_limit_326_, v_balanced_boxed_331_, v_partitioned_boxed_332_, v_afterEqual_boxed_333_, v_fuel_330_);
lean_dec(v_lo_322_);
lean_dec(v_n_321_);
return v_res_334_;
}
}
LEAN_EXPORT lean_object* l_f(lean_object* v_a_335_){
_start:
{
lean_object* v___x_336_; lean_object* v___x_337_; uint8_t v___x_338_; 
v___x_336_ = lean_array_get_size(v_a_335_);
v___x_337_ = lean_unsigned_to_nat(0u);
v___x_338_ = lean_nat_dec_eq(v___x_336_, v___x_337_);
if (v___x_338_ == 0)
{
lean_object* v___x_339_; lean_object* v___y_341_; lean_object* v___y_342_; lean_object* v___x_349_; lean_object* v___y_351_; uint8_t v___x_353_; 
v___x_339_ = lean_unsigned_to_nat(1u);
v___x_349_ = lean_nat_sub(v___x_336_, v___x_339_);
v___x_353_ = lean_nat_dec_le(v___x_337_, v___x_349_);
if (v___x_353_ == 0)
{
lean_inc(v___x_349_);
v___y_351_ = v___x_349_;
goto v___jp_350_;
}
else
{
v___y_351_ = v___x_337_;
goto v___jp_350_;
}
v___jp_340_:
{
lean_object* v___x_343_; lean_object* v___x_344_; lean_object* v___x_345_; lean_object* v___x_346_; uint8_t v___x_347_; lean_object* v___x_348_; 
v___x_343_ = lean_nat_add(v___y_342_, v___x_339_);
lean_dec(v___y_342_);
v___x_344_ = lean_nat_sub(v___x_343_, v___y_341_);
v___x_345_ = lean_nat_log2(v___x_344_);
v___x_346_ = lean_nat_add(v___x_345_, v___x_339_);
lean_dec(v___x_345_);
v___x_347_ = 1;
lean_inc(v___y_341_);
v___x_348_ = l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(v___x_336_, v___y_341_, v_a_335_, v___y_341_, v___x_343_, v___x_346_, v___x_347_, v___x_347_, v___x_338_, v___x_344_);
lean_dec(v___y_341_);
return v___x_348_;
}
v___jp_350_:
{
uint8_t v___x_352_; 
v___x_352_ = lean_nat_dec_le(v___y_351_, v___x_349_);
if (v___x_352_ == 0)
{
lean_dec(v___x_349_);
lean_inc(v___y_351_);
v___y_341_ = v___y_351_;
v___y_342_ = v___y_351_;
goto v___jp_340_;
}
else
{
v___y_341_ = v___y_351_;
v___y_342_ = v___x_349_;
goto v___jp_340_;
}
}
}
else
{
return v_a_335_;
}
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0(lean_object* v_n_354_, lean_object* v_lo_355_, lean_object* v_xs_356_, lean_object* v_a_357_, lean_object* v_b_358_, lean_object* v_limit_359_, uint8_t v_balanced_360_, uint8_t v_partitioned_361_, uint8_t v_afterEqual_362_, lean_object* v_fuel_363_, lean_object* v_hf_364_, lean_object* v_hlo_365_, lean_object* v_hab_366_, lean_object* v_hb_367_){
_start:
{
lean_object* v___x_368_; 
v___x_368_ = l_Array_QSort_Internal_sortM___at___00f_spec__0___redArg(v_n_354_, v_lo_355_, v_xs_356_, v_a_357_, v_b_358_, v_limit_359_, v_balanced_360_, v_partitioned_361_, v_afterEqual_362_, v_fuel_363_);
return v___x_368_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_sortM___at___00f_spec__0___boxed(lean_object* v_n_369_, lean_object* v_lo_370_, lean_object* v_xs_371_, lean_object* v_a_372_, lean_object* v_b_373_, lean_object* v_limit_374_, lean_object* v_balanced_375_, lean_object* v_partitioned_376_, lean_object* v_afterEqual_377_, lean_object* v_fuel_378_, lean_object* v_hf_379_, lean_object* v_hlo_380_, lean_object* v_hab_381_, lean_object* v_hb_382_){
_start:
{
uint8_t v_balanced_boxed_383_; uint8_t v_partitioned_boxed_384_; uint8_t v_afterEqual_boxed_385_; lean_object* v_res_386_; 
v_balanced_boxed_383_ = lean_unbox(v_balanced_375_);
v_partitioned_boxed_384_ = lean_unbox(v_partitioned_376_);
v_afterEqual_boxed_385_ = lean_unbox(v_afterEqual_377_);
v_res_386_ = l_Array_QSort_Internal_sortM___at___00f_spec__0(v_n_369_, v_lo_370_, v_xs_371_, v_a_372_, v_b_373_, v_limit_374_, v_balanced_boxed_383_, v_partitioned_boxed_384_, v_afterEqual_boxed_385_, v_fuel_378_, v_hf_379_, v_hlo_380_, v_hab_381_, v_hb_382_);
lean_dec(v_lo_370_);
lean_dec(v_n_369_);
return v_res_386_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0(lean_object* v_n_387_, lean_object* v_xs_388_, lean_object* v_a_389_, lean_object* v_b_390_, lean_object* v_pivot_391_, lean_object* v_hb_392_){
_start:
{
lean_object* v___x_393_; 
v___x_393_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___redArg(v_n_387_, v_xs_388_, v_a_389_, v_b_390_, v_pivot_391_);
return v___x_393_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0___boxed(lean_object* v_n_394_, lean_object* v_xs_395_, lean_object* v_a_396_, lean_object* v_b_397_, lean_object* v_pivot_398_, lean_object* v_hb_399_){
_start:
{
lean_object* v_res_400_; 
v_res_400_ = l_Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0(v_n_394_, v_xs_395_, v_a_396_, v_b_397_, v_pivot_398_, v_hb_399_);
lean_dec(v_pivot_398_);
lean_dec(v_b_397_);
lean_dec(v_a_396_);
lean_dec(v_n_394_);
return v_res_400_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1(lean_object* v_n_401_, lean_object* v_xs_402_, lean_object* v_a_403_, lean_object* v_b_404_, lean_object* v_pivot_405_, lean_object* v_hb_406_){
_start:
{
lean_object* v___x_407_; 
v___x_407_ = l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___redArg(v_n_401_, v_xs_402_, v_a_403_, v_b_404_, v_pivot_405_);
return v___x_407_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1___boxed(lean_object* v_n_408_, lean_object* v_xs_409_, lean_object* v_a_410_, lean_object* v_b_411_, lean_object* v_pivot_412_, lean_object* v_hb_413_){
_start:
{
lean_object* v_res_414_; 
v_res_414_ = l_Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1(v_n_408_, v_xs_409_, v_a_410_, v_b_411_, v_pivot_412_, v_hb_413_);
lean_dec(v_pivot_412_);
lean_dec(v_b_411_);
lean_dec(v_a_410_);
lean_dec(v_n_408_);
return v_res_414_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2(lean_object* v_n_415_, lean_object* v_xs_416_, lean_object* v_a_417_, lean_object* v_b_418_, lean_object* v_hb_419_){
_start:
{
lean_object* v___x_420_; 
v___x_420_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___redArg(v_n_415_, v_xs_416_, v_a_417_, v_b_418_);
return v___x_420_;
}
}
LEAN_EXPORT lean_object* l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2___boxed(lean_object* v_n_421_, lean_object* v_xs_422_, lean_object* v_a_423_, lean_object* v_b_424_, lean_object* v_hb_425_){
_start:
{
lean_object* v_res_426_; 
v_res_426_ = l_Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2(v_n_421_, v_xs_422_, v_a_423_, v_b_424_, v_hb_425_);
lean_dec(v_b_424_);
lean_dec(v_a_423_);
lean_dec(v_n_421_);
return v_res_426_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1(lean_object* v_n_427_, lean_object* v_a_428_, lean_object* v_b_429_, lean_object* v_pivot_430_, lean_object* v_hb_431_, lean_object* v_p_432_, lean_object* v_xs_433_, lean_object* v_i_434_, lean_object* v_j_435_, lean_object* v_h1_436_, lean_object* v_h2_437_, lean_object* v_h3_438_){
_start:
{
lean_object* v___x_439_; 
v___x_439_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___redArg(v_p_432_, v_xs_433_, v_i_434_, v_j_435_);
return v___x_439_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1___boxed(lean_object* v_n_440_, lean_object* v_a_441_, lean_object* v_b_442_, lean_object* v_pivot_443_, lean_object* v_hb_444_, lean_object* v_p_445_, lean_object* v_xs_446_, lean_object* v_i_447_, lean_object* v_j_448_, lean_object* v_h1_449_, lean_object* v_h2_450_, lean_object* v_h3_451_){
_start:
{
lean_object* v_res_452_; 
v_res_452_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanUp___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__1(v_n_440_, v_a_441_, v_b_442_, v_pivot_443_, v_hb_444_, v_p_445_, v_xs_446_, v_i_447_, v_j_448_, v_h1_449_, v_h2_450_, v_h3_451_);
lean_dec(v_j_448_);
lean_dec_ref(v_xs_446_);
lean_dec(v_p_445_);
lean_dec(v_pivot_443_);
lean_dec(v_b_442_);
lean_dec(v_a_441_);
lean_dec(v_n_440_);
return v_res_452_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2(lean_object* v_n_453_, lean_object* v_a_454_, lean_object* v_b_455_, lean_object* v_pivot_456_, lean_object* v_hb_457_, lean_object* v_p_458_, lean_object* v_xs_459_, lean_object* v_i_460_, lean_object* v_j_461_, lean_object* v_h1_462_, lean_object* v_h2_463_, lean_object* v_h3_464_){
_start:
{
lean_object* v___x_465_; 
v___x_465_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___redArg(v_p_458_, v_xs_459_, v_i_460_, v_j_461_);
return v___x_465_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2___boxed(lean_object* v_n_466_, lean_object* v_a_467_, lean_object* v_b_468_, lean_object* v_pivot_469_, lean_object* v_hb_470_, lean_object* v_p_471_, lean_object* v_xs_472_, lean_object* v_i_473_, lean_object* v_j_474_, lean_object* v_h1_475_, lean_object* v_h2_476_, lean_object* v_h3_477_){
_start:
{
lean_object* v_res_478_; 
v_res_478_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_scanDown___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__2(v_n_466_, v_a_467_, v_b_468_, v_pivot_469_, v_hb_470_, v_p_471_, v_xs_472_, v_i_473_, v_j_474_, v_h1_475_, v_h2_476_, v_h3_477_);
lean_dec(v_i_473_);
lean_dec_ref(v_xs_472_);
lean_dec(v_p_471_);
lean_dec(v_pivot_469_);
lean_dec(v_b_468_);
lean_dec(v_a_467_);
lean_dec(v_n_466_);
return v_res_478_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3(lean_object* v_n_479_, lean_object* v_a_480_, lean_object* v_b_481_, lean_object* v_pivot_482_, lean_object* v_hb_483_, lean_object* v_p_484_, lean_object* v_xs_485_, lean_object* v_i_486_, lean_object* v_j_487_, lean_object* v_h1_488_, lean_object* v_h2_489_, lean_object* v_h3_490_){
_start:
{
lean_object* v___x_491_; 
v___x_491_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___redArg(v_n_479_, v_a_480_, v_b_481_, v_pivot_482_, v_p_484_, v_xs_485_, v_i_486_, v_j_487_);
return v___x_491_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3___boxed(lean_object* v_n_492_, lean_object* v_a_493_, lean_object* v_b_494_, lean_object* v_pivot_495_, lean_object* v_hb_496_, lean_object* v_p_497_, lean_object* v_xs_498_, lean_object* v_i_499_, lean_object* v_j_500_, lean_object* v_h1_501_, lean_object* v_h2_502_, lean_object* v_h3_503_){
_start:
{
lean_object* v_res_504_; 
v_res_504_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionM_loop___at___00Array_QSort_Internal_partitionM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__0_spec__3(v_n_492_, v_a_493_, v_b_494_, v_pivot_495_, v_hb_496_, v_p_497_, v_xs_498_, v_i_499_, v_j_500_, v_h1_501_, v_h2_502_, v_h3_503_);
lean_dec(v_p_497_);
lean_dec(v_pivot_495_);
lean_dec(v_b_494_);
lean_dec(v_a_493_);
lean_dec(v_n_492_);
return v_res_504_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5(lean_object* v_n_505_, lean_object* v_a_506_, lean_object* v_b_507_, lean_object* v_pivot_508_, lean_object* v_hb_509_, lean_object* v_p_510_, lean_object* v_xs_511_, lean_object* v_i_512_, lean_object* v_j_513_, lean_object* v_h1_514_, lean_object* v_h2_515_, lean_object* v_h3_516_){
_start:
{
lean_object* v___x_517_; 
v___x_517_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___redArg(v_n_505_, v_a_506_, v_b_507_, v_pivot_508_, v_p_510_, v_xs_511_, v_i_512_, v_j_513_);
return v___x_517_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5___boxed(lean_object* v_n_518_, lean_object* v_a_519_, lean_object* v_b_520_, lean_object* v_pivot_521_, lean_object* v_hb_522_, lean_object* v_p_523_, lean_object* v_xs_524_, lean_object* v_i_525_, lean_object* v_j_526_, lean_object* v_h1_527_, lean_object* v_h2_528_, lean_object* v_h3_529_){
_start:
{
lean_object* v_res_530_; 
v_res_530_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5(v_n_518_, v_a_519_, v_b_520_, v_pivot_521_, v_hb_522_, v_p_523_, v_xs_524_, v_i_525_, v_j_526_, v_h1_527_, v_h2_528_, v_h3_529_);
lean_dec(v_p_523_);
lean_dec(v_pivot_521_);
lean_dec(v_b_520_);
lean_dec(v_a_519_);
lean_dec(v_n_518_);
return v_res_530_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7(lean_object* v_n_531_, lean_object* v_a_532_, lean_object* v_b_533_, lean_object* v_hb_534_, lean_object* v_xs_535_, lean_object* v_i_536_){
_start:
{
lean_object* v___x_537_; 
v___x_537_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___redArg(v_n_531_, v_a_532_, v_b_533_, v_xs_535_, v_i_536_);
return v___x_537_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7___boxed(lean_object* v_n_538_, lean_object* v_a_539_, lean_object* v_b_540_, lean_object* v_hb_541_, lean_object* v_xs_542_, lean_object* v_i_543_){
_start:
{
lean_object* v_res_544_; 
v_res_544_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7(v_n_538_, v_a_539_, v_b_540_, v_hb_541_, v_xs_542_, v_i_543_);
lean_dec(v_b_540_);
lean_dec(v_a_539_);
lean_dec(v_n_538_);
return v_res_544_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6(lean_object* v_n_545_, lean_object* v_a_546_, lean_object* v_b_547_, lean_object* v_pivot_548_, lean_object* v_hb_549_, lean_object* v_p_550_, lean_object* v_xs_551_, lean_object* v_i_552_, lean_object* v_j_553_, lean_object* v_h1_554_, lean_object* v_h2_555_, lean_object* v_h3_556_){
_start:
{
lean_object* v___x_557_; 
v___x_557_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___redArg(v_p_550_, v_xs_551_, v_i_552_, v_j_553_);
return v___x_557_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6___boxed(lean_object* v_n_558_, lean_object* v_a_559_, lean_object* v_b_560_, lean_object* v_pivot_561_, lean_object* v_hb_562_, lean_object* v_p_563_, lean_object* v_xs_564_, lean_object* v_i_565_, lean_object* v_j_566_, lean_object* v_h1_567_, lean_object* v_h2_568_, lean_object* v_h3_569_){
_start:
{
lean_object* v_res_570_; 
v_res_570_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanUp___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__6(v_n_558_, v_a_559_, v_b_560_, v_pivot_561_, v_hb_562_, v_p_563_, v_xs_564_, v_i_565_, v_j_566_, v_h1_567_, v_h2_568_, v_h3_569_);
lean_dec(v_j_566_);
lean_dec_ref(v_xs_564_);
lean_dec(v_p_563_);
lean_dec(v_pivot_561_);
lean_dec(v_b_560_);
lean_dec(v_a_559_);
lean_dec(v_n_558_);
return v_res_570_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7(lean_object* v_n_571_, lean_object* v_a_572_, lean_object* v_b_573_, lean_object* v_pivot_574_, lean_object* v_hb_575_, lean_object* v_p_576_, lean_object* v_xs_577_, lean_object* v_i_578_, lean_object* v_j_579_, lean_object* v_h1_580_, lean_object* v_h2_581_, lean_object* v_h3_582_){
_start:
{
lean_object* v___x_583_; 
v___x_583_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___redArg(v_p_576_, v_xs_577_, v_i_578_, v_j_579_);
return v___x_583_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7___boxed(lean_object* v_n_584_, lean_object* v_a_585_, lean_object* v_b_586_, lean_object* v_pivot_587_, lean_object* v_hb_588_, lean_object* v_p_589_, lean_object* v_xs_590_, lean_object* v_i_591_, lean_object* v_j_592_, lean_object* v_h1_593_, lean_object* v_h2_594_, lean_object* v_h3_595_){
_start:
{
lean_object* v_res_596_; 
v_res_596_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_scanDown___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_partitionEqualM_loop___at___00Array_QSort_Internal_partitionEqualM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__1_spec__5_spec__7(v_n_584_, v_a_585_, v_b_586_, v_pivot_587_, v_hb_588_, v_p_589_, v_xs_590_, v_i_591_, v_j_592_, v_h1_593_, v_h2_594_, v_h3_595_);
lean_dec(v_i_591_);
lean_dec_ref(v_xs_590_);
lean_dec(v_p_589_);
lean_dec(v_pivot_587_);
lean_dec(v_b_586_);
lean_dec(v_a_585_);
lean_dec(v_n_584_);
return v_res_596_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10(lean_object* v_n_597_, lean_object* v_a_598_, lean_object* v_b_599_, lean_object* v_xs_600_, lean_object* v_j_601_, lean_object* v_hj_602_){
_start:
{
lean_object* v___x_603_; 
v___x_603_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___redArg(v_a_598_, v_xs_600_, v_j_601_);
return v___x_603_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10___boxed(lean_object* v_n_604_, lean_object* v_a_605_, lean_object* v_b_606_, lean_object* v_xs_607_, lean_object* v_j_608_, lean_object* v_hj_609_){
_start:
{
lean_object* v_res_610_; 
v_res_610_ = l___private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_sink___at___00__private_Init_Data_Array_QSort_Basic_0__Array_QSort_Internal_insertionSortM_outer___at___00Array_QSort_Internal_insertionSortM___at___00Array_QSort_Internal_sortM___at___00f_spec__0_spec__2_spec__7_spec__10(v_n_604_, v_a_605_, v_b_606_, v_xs_607_, v_j_608_, v_hj_609_);
lean_dec(v_b_606_);
lean_dec(v_a_605_);
lean_dec(v_n_604_);
return v_res_610_;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Init(uint8_t builtin);
void lean_initialize_runtime_module();
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Plain(uint8_t builtin) {
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
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
