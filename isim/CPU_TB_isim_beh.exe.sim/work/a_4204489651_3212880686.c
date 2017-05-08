/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/zlang/Final_Project_Complete/ROM.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_4204489651_3212880686_p_0(char *t0)
{
    char t21[16];
    char t23[16];
    char t28[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t22;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    char *t29;
    int t30;
    unsigned char t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(226, ng0);

LAB3:    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5064U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 41, 1, t4);
    t7 = (8U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 1648U);
    t11 = *((char **)t10);
    t10 = (t0 + 1192U);
    t12 = *((char **)t10);
    t10 = (t0 + 5064U);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t12, t10);
    t14 = (t13 + 1);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 41, 1, t14);
    t17 = (8U * t16);
    t18 = (0 + t17);
    t19 = (t11 + t18);
    t22 = ((IEEE_P_2592010699) + 4024);
    t24 = (t23 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 7;
    t25 = (t24 + 4U);
    *((int *)t25) = 0;
    t25 = (t24 + 8U);
    *((int *)t25) = -1;
    t26 = (0 - 7);
    t27 = (t26 * -1);
    t27 = (t27 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t27;
    t25 = (t28 + 0U);
    t29 = (t25 + 0U);
    *((int *)t29) = 7;
    t29 = (t25 + 4U);
    *((int *)t29) = 0;
    t29 = (t25 + 8U);
    *((int *)t29) = -1;
    t30 = (0 - 7);
    t27 = (t30 * -1);
    t27 = (t27 + 1);
    t29 = (t25 + 12U);
    *((unsigned int *)t29) = t27;
    t20 = xsi_base_array_concat(t20, t21, t22, (char)97, t9, t23, (char)97, t19, t28, (char)101);
    t27 = (8U + 8U);
    t31 = (16U != t27);
    if (t31 == 1)
        goto LAB5;

LAB6:    t29 = (t0 + 3032);
    t32 = (t29 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memcpy(t35, t20, 16U);
    xsi_driver_first_trans_fast_port(t29);

LAB2:    t36 = (t0 + 2952);
    *((int *)t36) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(16U, t27, 0);
    goto LAB6;

}


extern void work_a_4204489651_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4204489651_3212880686_p_0};
	xsi_register_didat("work_a_4204489651_3212880686", "isim/CPU_TB_isim_beh.exe.sim/work/a_4204489651_3212880686.didat");
	xsi_register_executes(pe);
}
