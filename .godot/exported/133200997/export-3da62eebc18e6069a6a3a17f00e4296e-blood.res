RSRC                    VisualShader            ��������                                            V      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    parameter_name 
   qualifier    default_value_enabled    default_value    script    texture_type    color_default    texture_filter    texture_repeat    texture_source    source    texture    op_type 	   operator    input_name    hint    min    max    step    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/5/node    nodes/fragment/5/position    nodes/fragment/6/node    nodes/fragment/6/position    nodes/fragment/7/node    nodes/fragment/7/position    nodes/fragment/8/node    nodes/fragment/8/position    nodes/fragment/9/node    nodes/fragment/9/position    nodes/fragment/10/node    nodes/fragment/10/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections     
   -   local://VisualShaderNodeColorParameter_c67xf �
      1   local://VisualShaderNodeTexture2DParameter_5tq26 �
      &   local://VisualShaderNodeTexture_fpa3m 4      '   local://VisualShaderNodeVectorOp_he3dd h      $   local://VisualShaderNodeInput_r701j �      $   local://VisualShaderNodeInput_lhbx0 �      '   local://VisualShaderNodeVectorOp_hku16 	      &   local://VisualShaderNodeFloatOp_w1gdo r      -   local://VisualShaderNodeFloatParameter_jyjnx �         local://VisualShader_nlnvn 7         VisualShaderNodeColorParameter             Color          	      #   VisualShaderNodeTexture2DParameter             NoiseTexture          	         VisualShaderNodeTexture             	         VisualShaderNodeVectorOp             	         VisualShaderNodeInput             time 	         VisualShaderNodeInput             uv 	         VisualShaderNodeVectorOp                    
                 
                     	         VisualShaderNodeFloatOp                                      �?         	         VisualShaderNodeFloatParameter             Speed                           �?	         VisualShader            shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform vec4 Color : source_color = vec4(1.000000, 1.000000, 1.000000, 1.000000);
uniform float Speed : hint_range(0, 1) = 1;
uniform sampler2D NoiseTexture : filter_nearest_mipmap;



void fragment() {
// ColorParameter:2
	vec4 n_out2p0 = Color;


// Input:6
	float n_out6p0 = TIME;


// FloatParameter:10
	float n_out10p0 = Speed;


// FloatOp:9
	float n_out9p0 = n_out6p0 * n_out10p0;


// Input:7
	vec2 n_out7p0 = UV;


// VectorOp:8
	vec2 n_out8p0 = vec2(n_out9p0) + n_out7p0;


	vec4 n_out4p0;
// Texture2D:4
	n_out4p0 = texture(NoiseTexture, n_out8p0);


// VectorOp:5
	vec3 n_out5p0 = vec3(n_out2p0.xyz) * vec3(n_out4p0.xyz);


// Output:0
	ALBEDO = n_out5p0;


}
 3             4   
     z�   C5            6   
     z�  �C7            8   
     ��  �C9            :   
     4�  C;            <   
    ���  4D=            >   
     ��  �D?            @   
     *�  4DA            B   
     R�  /DC            D   
     ��  HDE       $                                                                                            	       	              
       	      	      RSRC