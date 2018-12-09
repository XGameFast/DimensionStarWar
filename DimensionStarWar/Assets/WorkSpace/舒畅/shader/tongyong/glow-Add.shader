// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33693,y:32411,varname:node_9361,prsc:2|custl-9874-OUT;n:type:ShaderForge.SFN_TexCoord,id:9955,x:32371,y:32588,varname:node_9955,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:2001,x:32371,y:32740,varname:node_2001,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:8003,x:32566,y:32655,varname:node_8003,prsc:2|A-9955-UVOUT,B-2001-OUT;n:type:ShaderForge.SFN_Power,id:1869,x:33263,y:32683,varname:node_1869,prsc:2|VAL-8312-OUT,EXP-5564-OUT;n:type:ShaderForge.SFN_Vector1,id:5564,x:33068,y:32772,varname:node_5564,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:3275,x:32750,y:32655,varname:node_3275,prsc:2|A-8003-OUT,B-5978-OUT;n:type:ShaderForge.SFN_Vector1,id:5978,x:32566,y:32782,varname:node_5978,prsc:2,v1:2;n:type:ShaderForge.SFN_OneMinus,id:8054,x:32909,y:32656,varname:node_8054,prsc:2|IN-3275-OUT;n:type:ShaderForge.SFN_Clamp01,id:8312,x:33068,y:32656,varname:node_8312,prsc:2|IN-8054-OUT;n:type:ShaderForge.SFN_Multiply,id:9874,x:33516,y:32683,varname:node_9874,prsc:2|A-1869-OUT,B-9367-RGB,C-9367-A,D-6646-OUT;n:type:ShaderForge.SFN_VertexColor,id:9367,x:33263,y:32826,varname:node_9367,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:6646,x:33263,y:32961,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_6646,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:6646;pass:END;sub:END;*/

Shader "Shader Forge/glow-Add" {
    Properties {
        _Intensity ("Intensity", Float ) = 1
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _Intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float3 finalColor = (pow(saturate((1.0 - (distance(i.uv0,float2(0.5,0.5))*2.0))),1.5)*i.vertexColor.rgb*i.vertexColor.a*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
