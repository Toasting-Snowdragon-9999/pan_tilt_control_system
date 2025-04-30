//**********************************************************************
// Copyright (c) 2016-2018 Xilinx Inc.  All Rights Reserved
//**********************************************************************
//
//   TLM wrapper for Slice IP 
//   Provides a sc_module anchor to receive IP params. This IP will come into picture when M*N Stream 
//   design with TDEST width is more than 4. As NOC_MUX sel_in width at most 4 and Slice IP will slice the 
//   incoming TDEST to 4 bits and send to NOC_MUX IP 
//**********************************************************************

#ifndef _even_parity_checker_bit_2_5_core_h_
#define _even_parity_checker_bit_2_5_core_h_

#include <systemc.h>
#include "properties.h"


class even_parity_checker_bit_2_5_core : public sc_module 
{
    public: 
       even_parity_checker_bit_2_5_core (sc_core::sc_module_name nm, const xsc::common_cpp::properties& props)
            : sc_module(nm)
              , Din    ( "Din" )
              , Dout   ( "Dout" )
    {
        SC_HAS_PROCESS(even_parity_checker_bit_2_5_core);
        SC_METHOD(get_slice_value);
        sensitive << Din;

    }

    virtual ~even_parity_checker_bit_2_5_core() = default;

    void get_slice_value()
    {
        std::cout << __func__<< " :: "<< sc_time_stamp() << std::endl;
        Dout.write(Din.read().get_word(0));
    }
   
    public: 
        sc_in< sc_bv<9 > >   Din;
        sc_out< sc_bv <1 > >  Dout;

};

#endif

