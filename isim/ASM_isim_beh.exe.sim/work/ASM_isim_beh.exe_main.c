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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *STD_TEXTIO;
char *STD_STANDARD;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    xilinxcorelib_a_2914102733_3212880686_init();
    work_a_3276747723_0033051833_init();
    work_a_3501706103_3212880686_init();
    xilinxcorelib_a_0126766044_3212880686_init();
    work_a_0911369590_2903183497_init();
    xilinxcorelib_a_3838311550_3212880686_init();
    work_a_0266295731_2941103824_init();
    xilinxcorelib_a_0214985951_3212880686_init();
    work_a_0413421040_2928657639_init();
    xilinxcorelib_a_4179989883_3212880686_init();
    work_a_2093293625_2881540706_init();
    work_a_3830602496_3212880686_init();
    work_a_2187592342_3212880686_init();
    work_a_1490920390_3212880686_init();
    work_a_1913265227_3212880686_init();
    work_a_2084710558_3212880686_init();


    xsi_register_tops("work_a_2084710558_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
