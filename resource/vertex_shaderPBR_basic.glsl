attribute vec3 a_Position;
attribute vec2 a_uv;
attribute vec3 a_normal;
attribute vec3 a_tangent;
attribute vec3 a_bitangent;

uniform mat4 u_Pmatrix;
uniform mat4 u_Mmatrix;
uniform mat4 u_Vmatrix;
uniform mat4 u_Nmatrix;
uniform vec3 u_source_direction;
uniform vec3 u_Camera;

varying vec2 v_uv;
varying vec3 v_LightDir;
varying vec3 v_ViewDir;
varying vec3 v_Normal;
varying vec3 v_LightDir_tangent;

varying vec3 v_pos_World;
varying vec3 v_LightDir_World;
varying vec3 v_ViewDir_World;
varying vec3 v_Normal_World;

void main(){
    
    v_uv=a_uv;
    
    // -----NORMAL --------------------------------
    // vec3 norm=normalize((u_Nmatrix*vec4(a_normal,1.)).xyz);
    // vec3 tang=normalize((u_Nmatrix*vec4(a_tangent,1.)).xyz);
    // vec3 binormal=normalize((u_Nmatrix*vec4(a_bitangent,1.)).xyz);
    
    // mat3 tbnMatrix=mat3(
        //     tang.x,binormal.x,norm.x,
        //     tang.y,binormal.y,norm.y,
    // tang.z,binormal.z,norm.z);
    
    // vec3 pos=(u_Vmatrix*u_Mmatrix*vec4(a_Position,1.)).xyz;
    // vec4 lightPos_UI=vec4(u_source_direction,1.);
    
    // v_LightDir=normalize(lightPos_UI.xyz);
    // v_LightDir_tangent=normalize(tbnMatrix*(lightPos_UI.xyz));
    
    // v_ViewDir_tangent=tbnMatrix*normalize(-pos);
    
    v_pos_World=(u_Mmatrix*vec4(a_Position,1.)).xyz;
    v_LightDir_World=u_source_direction;
    v_ViewDir_World=normalize(u_Camera);
    v_Normal_World=normalize((u_Nmatrix*vec4(a_normal,1.)).xyz);
    
    //---------------------------------------------
    
    gl_Position=u_Pmatrix*u_Vmatrix*u_Mmatrix*vec4(a_Position,1.);
    
}