# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "STEP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "UPDATE_DIV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.STEP { PARAM_VALUE.STEP } {
	# Procedure called to update STEP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STEP { PARAM_VALUE.STEP } {
	# Procedure called to validate STEP
	return true
}

proc update_PARAM_VALUE.UPDATE_DIV { PARAM_VALUE.UPDATE_DIV } {
	# Procedure called to update UPDATE_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.UPDATE_DIV { PARAM_VALUE.UPDATE_DIV } {
	# Procedure called to validate UPDATE_DIV
	return true
}

proc update_PARAM_VALUE.WIDTH { PARAM_VALUE.WIDTH } {
	# Procedure called to update WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH { PARAM_VALUE.WIDTH } {
	# Procedure called to validate WIDTH
	return true
}


proc update_MODELPARAM_VALUE.WIDTH { MODELPARAM_VALUE.WIDTH PARAM_VALUE.WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH}] ${MODELPARAM_VALUE.WIDTH}
}

proc update_MODELPARAM_VALUE.STEP { MODELPARAM_VALUE.STEP PARAM_VALUE.STEP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STEP}] ${MODELPARAM_VALUE.STEP}
}

proc update_MODELPARAM_VALUE.UPDATE_DIV { MODELPARAM_VALUE.UPDATE_DIV PARAM_VALUE.UPDATE_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.UPDATE_DIV}] ${MODELPARAM_VALUE.UPDATE_DIV}
}

