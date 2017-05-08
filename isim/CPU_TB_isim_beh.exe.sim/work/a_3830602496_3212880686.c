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
static const char *ng0 = "C:/Users/zlang/Final_Project_Complete/RAM.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3830602496_3212880686_p_0(char *t0)
{
    char t26[16];
    char t28[16];
    char t33[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t27;
    char *t29;
    char *t30;
    int t31;
    unsigned int t32;
    char *t34;
    int t35;
    unsigned char t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;

LAB0:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB7:    t41 = (t0 + 6387);
    t43 = (t0 + 3816);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    memcpy(t47, t41, 16U);
    xsi_driver_first_trans_fast_port(t43);

LAB2:    t48 = (t0 + 3720);
    *((int *)t48) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1992U);
    t5 = *((char **)t1);
    t1 = (t0 + 1512U);
    t6 = *((char **)t1);
    t1 = (t0 + 6136U);
    t7 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t6, t1);
    t8 = (2 * t7);
    t9 = (t8 - 15);
    t10 = (t9 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t8);
    t11 = (8U * t10);
    t12 = (0 + t11);
    t13 = (t5 + t12);
    t14 = (t0 + 1992U);
    t15 = *((char **)t14);
    t14 = (t0 + 1512U);
    t16 = *((char **)t14);
    t14 = (t0 + 6136U);
    t17 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t16, t14);
    t18 = (2 * t17);
    t19 = (t18 + 1);
    t20 = (t19 - 15);
    t21 = (t20 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t19);
    t22 = (8U * t21);
    t23 = (0 + t22);
    t24 = (t15 + t23);
    t27 = ((IEEE_P_2592010699) + 4024);
    t29 = (t28 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 7;
    t30 = (t29 + 4U);
    *((int *)t30) = 0;
    t30 = (t29 + 8U);
    *((int *)t30) = -1;
    t31 = (0 - 7);
    t32 = (t31 * -1);
    t32 = (t32 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t32;
    t30 = (t33 + 0U);
    t34 = (t30 + 0U);
    *((int *)t34) = 7;
    t34 = (t30 + 4U);
    *((int *)t34) = 0;
    t34 = (t30 + 8U);
    *((int *)t34) = -1;
    t35 = (0 - 7);
    t32 = (t35 * -1);
    t32 = (t32 + 1);
    t34 = (t30 + 12U);
    *((unsigned int *)t34) = t32;
    t25 = xsi_base_array_concat(t25, t26, t27, (char)97, t13, t28, (char)97, t24, t33, (char)101);
    t32 = (8U + 8U);
    t36 = (16U != t32);
    if (t36 == 1)
        goto LAB5;

LAB6:    t34 = (t0 + 3816);
    t37 = (t34 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t25, 16U);
    xsi_driver_first_trans_fast_port(t34);
    goto LAB2;

LAB5:    xsi_size_not_matching(16U, t32, 0);
    goto LAB6;

LAB8:    goto LAB2;

}

static void work_a_3830602496_3212880686_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    int t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;

LAB0:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3736);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB13;

LAB14:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 6403);
    *((int *)t3) = 0;
    t7 = (t0 + 6407);
    *((int *)t7) = 15;
    t8 = 0;
    t9 = 15;

LAB8:    if (t8 <= t9)
        goto LAB9;

LAB11:    goto LAB6;

LAB9:    xsi_set_current_line(33, ng0);
    t10 = xsi_get_transient_memory(8U);
    memset(t10, 0, 8U);
    t11 = t10;
    memset(t11, (unsigned char)2, 8U);
    t12 = (t0 + 6403);
    t13 = *((int *)t12);
    t14 = (t13 - 15);
    t15 = (t14 * -1);
    t16 = (8U * t15);
    t17 = (0U + t16);
    t18 = (t0 + 3880);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t10, 8U);
    xsi_driver_first_trans_delta(t18, t17, 8U, 0LL);

LAB10:    t1 = (t0 + 6403);
    t8 = *((int *)t1);
    t3 = (t0 + 6407);
    t9 = *((int *)t3);
    if (t8 == t9)
        goto LAB11;

LAB12:    t13 = (t8 + 1);
    t8 = t13;
    t4 = (t0 + 6403);
    *((int *)t4) = t8;
    goto LAB8;

LAB13:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t15 = (15 - 7);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t4 + t17);
    t7 = (t0 + 1512U);
    t10 = *((char **)t7);
    t7 = (t0 + 6136U);
    t8 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t10, t7);
    t9 = (2 * t8);
    t13 = (t9 + 1);
    t14 = (t13 - 15);
    t23 = (t14 * -1);
    t24 = (8U * t23);
    t25 = (0U + t24);
    t11 = (t0 + 3880);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t1, 8U);
    xsi_driver_first_trans_delta(t11, t25, 8U, 0LL);
    xsi_set_current_line(39, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t15 = (15 - 15);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t1 = (t3 + t17);
    t4 = (t0 + 1512U);
    t7 = *((char **)t4);
    t4 = (t0 + 6136U);
    t8 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t4);
    t9 = (2 * t8);
    t13 = (t9 - 15);
    t23 = (t13 * -1);
    t24 = (8U * t23);
    t25 = (0U + t24);
    t10 = (t0 + 3880);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t18 = (t12 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t1, 8U);
    xsi_driver_first_trans_delta(t10, t25, 8U, 0LL);
    goto LAB6;

}


extern void work_a_3830602496_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3830602496_3212880686_p_0,(void *)work_a_3830602496_3212880686_p_1};
	xsi_register_didat("work_a_3830602496_3212880686", "isim/CPU_TB_isim_beh.exe.sim/work/a_3830602496_3212880686.didat");
	xsi_register_executes(pe);
}
