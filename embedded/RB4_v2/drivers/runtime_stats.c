/*
 * runtime_stats.c
 *
 *  Created on: 31 Mar 2025
 *      Author: linax
 */
#include "common.h"

volatile unsigned long g_ulRunTimeCounter = 0;
void setupRuntimeStatsTimer(void) {
    g_ulRunTimeCounter = 0;
}

