$input a_position, a_color0
$output v_color0

/*
 * Copyright 2011-2020 Branimir Karadzic. All rights reserved.
 * License: https://github.com/bkaradzic/bgfx#license-bsd-2-clause
 */

#include "common.sh"

uniform mat4 u_viewProjStereo[2];

void main()
{
	vec4 worldPos = mul(u_model[0], vec4(a_position, 1.0));
	gl_Position = mul(u_viewProjStereo[gl_InstanceID], worldPos);
	v_color0 = a_color0;

	gl_Layer = gl_InstanceID;
}
