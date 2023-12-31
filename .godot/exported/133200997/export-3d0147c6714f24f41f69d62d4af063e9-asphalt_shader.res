RSRC                    VisualShader            ��������                                            ]      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    source    texture    texture_type    script    parameter_name 
   qualifier    color_default    texture_filter    texture_repeat    texture_source    input_name    op_type 	   operator 	   constant    default_value_enabled    default_value    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/5/node    nodes/fragment/5/position    nodes/fragment/7/node    nodes/fragment/7/position    nodes/fragment/8/node    nodes/fragment/8/position    nodes/fragment/9/node    nodes/fragment/9/position    nodes/fragment/10/node    nodes/fragment/10/position    nodes/fragment/11/node    nodes/fragment/11/position    nodes/fragment/13/node    nodes/fragment/13/position    nodes/fragment/14/node    nodes/fragment/14/position    nodes/fragment/15/node    nodes/fragment/15/position    nodes/fragment/16/node    nodes/fragment/16/position    nodes/fragment/17/node    nodes/fragment/17/position    nodes/fragment/18/node    nodes/fragment/18/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        &   local://VisualShaderNodeTexture_aopfn �      1   local://VisualShaderNodeTexture2DParameter_ovte1 �      $   local://VisualShaderNodeInput_83i14 H      '   local://VisualShaderNodeVectorOp_xx7qx }      ,   local://VisualShaderNodeFloatConstant_25ua1 �      1   local://VisualShaderNodeTexture2DParameter_yyq2v ,      &   local://VisualShaderNodeTexture_en03q �      '   local://VisualShaderNodeVectorOp_8va7i �      '   local://VisualShaderNodeVectorOp_2u8v0 �      '   local://VisualShaderNodeVectorOp_wf588 "      ,   local://VisualShaderNodeFloatConstant_4tt5c W      ,   local://VisualShaderNodeFloatConstant_gajwe �      '   local://VisualShaderNodeVectorOp_k4tku �      -   local://VisualShaderNodeColorParameter_230qm           local://VisualShader_juahw M         VisualShaderNodeTexture                   #   VisualShaderNodeTexture2DParameter    	         Texture                            VisualShaderNodeInput             uv          VisualShaderNodeVectorOp                    
                 
                                       VisualShaderNodeFloatConstant            �B      #   VisualShaderNodeTexture2DParameter    	         NoiseTexture                   VisualShaderNodeTexture                               VisualShaderNodeVectorOp                      VisualShaderNodeVectorOp             VisualShaderNodeVectorOp                      VisualShaderNodeFloatConstant            ��         VisualShaderNodeFloatConstant          ��u=         VisualShaderNodeVectorOp                      VisualShaderNodeColorParameter    	         Color                   VisualShader           E  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform vec4 Color : source_color = vec4(1.000000, 1.000000, 1.000000, 1.000000);
uniform sampler2D Texture : source_color, filter_nearest_mipmap;
uniform sampler2D NoiseTexture : filter_nearest_mipmap;



void fragment() {
// ColorParameter:18
	vec4 n_out18p0 = Color;


// Input:5
	vec2 n_out5p0 = UV;


// FloatConstant:8
	float n_out8p0 = 100.000000;


// VectorOp:7
	vec2 n_out7p0 = n_out5p0 * vec2(n_out8p0);


	vec4 n_out2p0;
// Texture2D:2
	n_out2p0 = texture(Texture, n_out7p0);


// VectorOp:17
	vec3 n_out17p0 = vec3(n_out18p0.xyz) * vec3(n_out2p0.xyz);


	vec4 n_out10p0;
// Texture2D:10
	n_out10p0 = texture(NoiseTexture, UV);


// FloatConstant:16
	float n_out16p0 = 0.060000;


// VectorOp:11
	vec3 n_out11p0 = vec3(n_out10p0.xyz) * vec3(n_out16p0);


// FloatConstant:15
	float n_out15p0 = -1.000000;


// VectorOp:14
	vec3 n_out14p0 = n_out11p0 * vec3(n_out15p0);


// VectorOp:13
	vec3 n_out13p0 = n_out17p0 + n_out14p0;


// Output:0
	ALBEDO = n_out13p0;


}
 /   
     �C  D0             1   
     /�  �C2            3   
     ��  D4            5   
     ��  �C6            7   
     f�  �C8            9   
     ��  D:            ;   
     �  kD<            =   
     /�  kD>            ?   
     ��  kD@            A   
     ��  �CB         	   C   
     p�  kDD         
   E   
     �� ��DF            G   
      � ��DH            I   
     ��  �CJ            K   
     ��  �CL       8                                                         	       
                                               
                                                                                        RSRC