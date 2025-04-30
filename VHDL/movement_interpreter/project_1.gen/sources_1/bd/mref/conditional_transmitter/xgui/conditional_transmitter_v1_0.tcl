# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "n_bits_0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "n_bits_1" -parent ${Page_0}


}

proc update_PARAM_VALUE.n_bits_0 { PARAM_VALUE.n_bits_0 } {
	# Procedure called to update n_bits_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.n_bits_0 { PARAM_VALUE.n_bits_0 } {
	# Procedure called to validate n_bits_0
	return true
}

proc update_PARAM_VALUE.n_bits_1 { PARAM_VALUE.n_bits_1 } {
	# Procedure called to update n_bits_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.n_bits_1 { PARAM_VALUE.n_bits_1 } {
	# Procedure called to validate n_bits_1
	return true
}


proc update_MODELPARAM_VALUE.n_bits_0 { MODELPARAM_VALUE.n_bits_0 PARAM_VALUE.n_bits_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.n_bits_0}] ${MODELPARAM_VALUE.n_bits_0}
}

proc update_MODELPARAM_VALUE.n_bits_1 { MODELPARAM_VALUE.n_bits_1 PARAM_VALUE.n_bits_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.n_bits_1}] ${MODELPARAM_VALUE.n_bits_1}
}

