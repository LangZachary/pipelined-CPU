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
static const char *ng0 = "C:/Users/zlang/Final_Project_Complete/ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1547270861_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_2053728113_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_2271993008_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_2540846514_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2547962040_1035706684(char *, char *, char *, char *, int );
char *ieee_p_2592010699_sub_3798478767_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_1878664202_p_0(char *t0)
{
    char t5[16];
    char t11[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 7348U);
    t3 = (t0 + 7505);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 3;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (3 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB5:    t21 = (t0 + 7509);
    t23 = (t0 + 4928);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t21, 32U);
    xsi_driver_first_trans_fast(t23);

LAB2:    t28 = (t0 + 4784);
    *((int *)t28) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 1192U);
    t12 = *((char **)t7);
    t7 = (t0 + 7316U);
    t13 = (t0 + 1352U);
    t14 = *((char **)t13);
    t13 = (t0 + 7332U);
    t15 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t11, t12, t7, t14, t13);
    t16 = (t0 + 4928);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t15, 32U);
    xsi_driver_first_trans_fast(t16);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0832606739_1878664202_p_1(char *t0)
{
    char t15[16];
    char t30[16];
    char t35[16];
    char t49[16];
    char t54[16];
    char t68[16];
    char t85[16];
    char t91[16];
    char t108[16];
    char t114[16];
    char t129[16];
    char t134[16];
    char t149[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t31;
    char *t32;
    int t33;
    unsigned char t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t50;
    char *t51;
    int t52;
    unsigned char t53;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t69;
    char *t70;
    int t71;
    unsigned char t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t86;
    char *t87;
    int t88;
    unsigned int t89;
    unsigned char t90;
    char *t92;
    char *t93;
    char *t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned char t98;
    char *t99;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t106;
    char *t109;
    char *t110;
    int t111;
    unsigned int t112;
    unsigned char t113;
    char *t115;
    char *t116;
    char *t117;
    int t118;
    char *t119;
    char *t120;
    char *t121;
    char *t122;
    char *t123;
    char *t124;
    char *t125;
    char *t126;
    char *t127;
    char *t130;
    char *t131;
    int t132;
    unsigned char t133;
    char *t135;
    char *t136;
    char *t137;
    int t138;
    char *t139;
    char *t140;
    char *t141;
    char *t142;
    char *t143;
    char *t144;
    char *t145;
    char *t146;
    char *t147;
    char *t150;
    char *t151;
    int t152;
    unsigned char t153;
    char *t154;
    char *t155;
    char *t156;
    char *t157;
    char *t158;
    char *t159;
    char *t161;
    char *t162;
    char *t163;
    char *t164;
    char *t165;
    char *t166;

LAB0:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t11 = (t0 + 1512U);
    t12 = *((char **)t11);
    t11 = (t0 + 7348U);
    t13 = (t0 + 7557);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 3;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (3 - 0);
    t19 = (t18 * 1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t20 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t12, t11, t13, t15);
    if (t20 != 0)
        goto LAB5;

LAB6:    t26 = (t0 + 1512U);
    t27 = *((char **)t26);
    t26 = (t0 + 7348U);
    t28 = (t0 + 7561);
    t31 = (t30 + 0U);
    t32 = (t31 + 0U);
    *((int *)t32) = 0;
    t32 = (t31 + 4U);
    *((int *)t32) = 3;
    t32 = (t31 + 8U);
    *((int *)t32) = 1;
    t33 = (3 - 0);
    t19 = (t33 * 1);
    t19 = (t19 + 1);
    t32 = (t31 + 12U);
    *((unsigned int *)t32) = t19;
    t34 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t27, t26, t28, t30);
    if (t34 != 0)
        goto LAB7;

LAB8:    t45 = (t0 + 1512U);
    t46 = *((char **)t45);
    t45 = (t0 + 7348U);
    t47 = (t0 + 7565);
    t50 = (t49 + 0U);
    t51 = (t50 + 0U);
    *((int *)t51) = 0;
    t51 = (t50 + 4U);
    *((int *)t51) = 3;
    t51 = (t50 + 8U);
    *((int *)t51) = 1;
    t52 = (3 - 0);
    t19 = (t52 * 1);
    t19 = (t19 + 1);
    t51 = (t50 + 12U);
    *((unsigned int *)t51) = t19;
    t53 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t46, t45, t47, t49);
    if (t53 != 0)
        goto LAB9;

LAB10:    t64 = (t0 + 1512U);
    t65 = *((char **)t64);
    t64 = (t0 + 7348U);
    t66 = (t0 + 7569);
    t69 = (t68 + 0U);
    t70 = (t69 + 0U);
    *((int *)t70) = 0;
    t70 = (t69 + 4U);
    *((int *)t70) = 3;
    t70 = (t69 + 8U);
    *((int *)t70) = 1;
    t71 = (3 - 0);
    t19 = (t71 * 1);
    t19 = (t19 + 1);
    t70 = (t69 + 12U);
    *((unsigned int *)t70) = t19;
    t72 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t65, t64, t66, t68);
    if (t72 != 0)
        goto LAB11;

LAB12:    t81 = (t0 + 1512U);
    t82 = *((char **)t81);
    t81 = (t0 + 7348U);
    t83 = (t0 + 7573);
    t86 = (t85 + 0U);
    t87 = (t86 + 0U);
    *((int *)t87) = 0;
    t87 = (t86 + 4U);
    *((int *)t87) = 3;
    t87 = (t86 + 8U);
    *((int *)t87) = 1;
    t88 = (3 - 0);
    t89 = (t88 * 1);
    t89 = (t89 + 1);
    t87 = (t86 + 12U);
    *((unsigned int *)t87) = t89;
    t90 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t82, t81, t83, t85);
    if (t90 != 0)
        goto LAB13;

LAB14:    t104 = (t0 + 1512U);
    t105 = *((char **)t104);
    t104 = (t0 + 7348U);
    t106 = (t0 + 7577);
    t109 = (t108 + 0U);
    t110 = (t109 + 0U);
    *((int *)t110) = 0;
    t110 = (t109 + 4U);
    *((int *)t110) = 3;
    t110 = (t109 + 8U);
    *((int *)t110) = 1;
    t111 = (3 - 0);
    t112 = (t111 * 1);
    t112 = (t112 + 1);
    t110 = (t109 + 12U);
    *((unsigned int *)t110) = t112;
    t113 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t105, t104, t106, t108);
    if (t113 != 0)
        goto LAB17;

LAB18:    t125 = (t0 + 1512U);
    t126 = *((char **)t125);
    t125 = (t0 + 7348U);
    t127 = (t0 + 7581);
    t130 = (t129 + 0U);
    t131 = (t130 + 0U);
    *((int *)t131) = 0;
    t131 = (t130 + 4U);
    *((int *)t131) = 3;
    t131 = (t130 + 8U);
    *((int *)t131) = 1;
    t132 = (3 - 0);
    t112 = (t132 * 1);
    t112 = (t112 + 1);
    t131 = (t130 + 12U);
    *((unsigned int *)t131) = t112;
    t133 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t126, t125, t127, t129);
    if (t133 != 0)
        goto LAB19;

LAB20:    t145 = (t0 + 1512U);
    t146 = *((char **)t145);
    t145 = (t0 + 7348U);
    t147 = (t0 + 7585);
    t150 = (t149 + 0U);
    t151 = (t150 + 0U);
    *((int *)t151) = 0;
    t151 = (t150 + 4U);
    *((int *)t151) = 3;
    t151 = (t150 + 8U);
    *((int *)t151) = 1;
    t152 = (3 - 0);
    t112 = (t152 * 1);
    t112 = (t112 + 1);
    t151 = (t150 + 12U);
    *((unsigned int *)t151) = t112;
    t153 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t146, t145, t147, t149);
    if (t153 != 0)
        goto LAB21;

LAB22:
LAB23:    t159 = (t0 + 7589);
    t161 = (t0 + 4992);
    t162 = (t161 + 56U);
    t163 = *((char **)t162);
    t164 = (t163 + 56U);
    t165 = *((char **)t164);
    memcpy(t165, t159, 16U);
    xsi_driver_first_trans_fast(t161);

LAB2:    t166 = (t0 + 4800);
    *((int *)t166) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 7541);
    t6 = (t0 + 4992);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB5:    t17 = (t0 + 1192U);
    t21 = *((char **)t17);
    t17 = (t0 + 4992);
    t22 = (t17 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t21, 16U);
    xsi_driver_first_trans_fast(t17);
    goto LAB2;

LAB7:    t32 = (t0 + 1192U);
    t36 = *((char **)t32);
    t32 = (t0 + 7316U);
    t37 = (t0 + 1352U);
    t38 = *((char **)t37);
    t37 = (t0 + 7332U);
    t39 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t35, t36, t32, t38, t37);
    t40 = (t0 + 4992);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memcpy(t44, t39, 16U);
    xsi_driver_first_trans_fast(t40);
    goto LAB2;

LAB9:    t51 = (t0 + 1192U);
    t55 = *((char **)t51);
    t51 = (t0 + 7316U);
    t56 = (t0 + 1352U);
    t57 = *((char **)t56);
    t56 = (t0 + 7332U);
    t58 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t54, t55, t51, t57, t56);
    t59 = (t0 + 4992);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memcpy(t63, t58, 16U);
    xsi_driver_first_trans_fast(t59);
    goto LAB2;

LAB11:    t70 = (t0 + 2312U);
    t73 = *((char **)t70);
    t19 = (31 - 15);
    t74 = (t19 * 1U);
    t75 = (0 + t74);
    t70 = (t73 + t75);
    t76 = (t0 + 4992);
    t77 = (t76 + 56U);
    t78 = *((char **)t77);
    t79 = (t78 + 56U);
    t80 = *((char **)t79);
    memcpy(t80, t70, 16U);
    xsi_driver_first_trans_fast(t76);
    goto LAB2;

LAB13:    t87 = (t0 + 1192U);
    t92 = *((char **)t87);
    t87 = (t0 + 7316U);
    t93 = (t0 + 1352U);
    t94 = *((char **)t93);
    t93 = (t0 + 7332U);
    t95 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t91, t92, t87, t94, t93);
    t96 = (t91 + 12U);
    t89 = *((unsigned int *)t96);
    t97 = (1U * t89);
    t98 = (16U != t97);
    if (t98 == 1)
        goto LAB15;

LAB16:    t99 = (t0 + 4992);
    t100 = (t99 + 56U);
    t101 = *((char **)t100);
    t102 = (t101 + 56U);
    t103 = *((char **)t102);
    memcpy(t103, t95, 16U);
    xsi_driver_first_trans_fast(t99);
    goto LAB2;

LAB15:    xsi_size_not_matching(16U, t97, 0);
    goto LAB16;

LAB17:    t110 = (t0 + 1192U);
    t115 = *((char **)t110);
    t110 = (t0 + 7316U);
    t116 = (t0 + 1352U);
    t117 = *((char **)t116);
    t116 = (t0 + 7332U);
    t118 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t117, t116);
    t119 = ieee_p_1242562249_sub_2540846514_1035706684(IEEE_P_1242562249, t114, t115, t110, t118);
    t120 = (t0 + 4992);
    t121 = (t120 + 56U);
    t122 = *((char **)t121);
    t123 = (t122 + 56U);
    t124 = *((char **)t123);
    memcpy(t124, t119, 16U);
    xsi_driver_first_trans_fast(t120);
    goto LAB2;

LAB19:    t131 = (t0 + 1192U);
    t135 = *((char **)t131);
    t131 = (t0 + 7316U);
    t136 = (t0 + 1352U);
    t137 = *((char **)t136);
    t136 = (t0 + 7332U);
    t138 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t137, t136);
    t139 = ieee_p_1242562249_sub_2547962040_1035706684(IEEE_P_1242562249, t134, t135, t131, t138);
    t140 = (t0 + 4992);
    t141 = (t140 + 56U);
    t142 = *((char **)t141);
    t143 = (t142 + 56U);
    t144 = *((char **)t143);
    memcpy(t144, t139, 16U);
    xsi_driver_first_trans_fast(t140);
    goto LAB2;

LAB21:    t151 = (t0 + 1192U);
    t154 = *((char **)t151);
    t151 = (t0 + 4992);
    t155 = (t151 + 56U);
    t156 = *((char **)t155);
    t157 = (t156 + 56U);
    t158 = *((char **)t157);
    memcpy(t158, t154, 16U);
    xsi_driver_first_trans_fast(t151);
    goto LAB2;

LAB24:    goto LAB2;

}

static void work_a_0832606739_1878664202_p_2(char *t0)
{
    char t6[16];
    char t15[16];
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 7380U);
    t4 = (t0 + 7605);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 15;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (15 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t24 = (t0 + 5056);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t24);

LAB2:    t29 = (t0 + 4816);
    *((int *)t29) = 1;

LAB1:    return;
LAB3:    t17 = (t0 + 5056);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t17);
    goto LAB2;

LAB5:    t8 = (t0 + 1512U);
    t12 = *((char **)t8);
    t8 = (t0 + 7348U);
    t13 = (t0 + 7621);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 3;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (3 - 0);
    t10 = (t18 * 1);
    t10 = (t10 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t10;
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t12, t8, t13, t15);
    t1 = t19;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_0832606739_1878664202_p_3(char *t0)
{
    char t10[16];
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 7380U);
    t4 = ieee_p_1242562249_sub_2271993008_1035706684(IEEE_P_1242562249, t3, t2);
    t5 = (t4 < 0);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t20 = (t0 + 5120);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t20);

LAB2:    t25 = (t0 + 4832);
    *((int *)t25) = 1;

LAB1:    return;
LAB3:    t12 = (t0 + 5120);
    t16 = (t12 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t12);
    goto LAB2;

LAB5:    t6 = (t0 + 1512U);
    t7 = *((char **)t6);
    t6 = (t0 + 7348U);
    t8 = (t0 + 7625);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 3;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (3 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t15 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t7, t6, t8, t10);
    t1 = t15;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_0832606739_1878664202_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(46, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 5184);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4848);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0832606739_1878664202_init()
{
	static char *pe[] = {(void *)work_a_0832606739_1878664202_p_0,(void *)work_a_0832606739_1878664202_p_1,(void *)work_a_0832606739_1878664202_p_2,(void *)work_a_0832606739_1878664202_p_3,(void *)work_a_0832606739_1878664202_p_4};
	xsi_register_didat("work_a_0832606739_1878664202", "isim/CPU_TB_isim_beh.exe.sim/work/a_0832606739_1878664202.didat");
	xsi_register_executes(pe);
}
