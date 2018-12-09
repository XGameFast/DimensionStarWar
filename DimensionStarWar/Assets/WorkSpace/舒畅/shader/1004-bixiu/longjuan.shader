// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-5871-OUT,alpha-9607-OUT;n:type:ShaderForge.SFN_Tex2d,id:5616,x:32028,y:32800,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5616,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6f9c9ad4b1caae64b98f602434afaf8f,ntxv:0,isnm:False|UVIN-2883-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3474,x:31859,y:33143,ptovrint:False,ptlb:rongjie tex,ptin:_rongjietex,varname:node_3474,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:959b620c5db1bbe458a611ce4276d3a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Subtract,id:3889,x:32313,y:33242,varname:node_3889,prsc:2|A-3410-OUT,B-7848-OUT;n:type:ShaderForge.SFN_Step,id:7848,x:32121,y:33199,varname:node_7848,prsc:2|A-3474-R,B-3078-A;n:type:ShaderForge.SFN_RemapRange,id:3462,x:31790,y:33398,varname:node_3462,prsc:2,frmn:0,frmx:1,tomn:0.1,tomx:1|IN-3078-A;n:type:ShaderForge.SFN_Step,id:3410,x:32121,y:33418,varname:node_3410,prsc:2|A-3474-R,B-3462-OUT;n:type:ShaderForge.SFN_Multiply,id:3253,x:32544,y:33242,varname:node_3253,prsc:2|A-3889-OUT,B-4250-RGB;n:type:ShaderForge.SFN_Color,id:4250,x:32385,y:33429,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_4250,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2132353,c2:0.5767749,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:4888,x:32745,y:32844,varname:node_4888,prsc:2|A-9626-OUT,B-3253-OUT;n:type:ShaderForge.SFN_Multiply,id:9607,x:32825,y:33123,varname:node_9607,prsc:2|A-5616-R,B-3410-OUT;n:type:ShaderForge.SFN_Multiply,id:9626,x:32382,y:32731,varname:node_9626,prsc:2|A-5616-R,B-3078-RGB;n:type:ShaderForge.SFN_VertexColor,id:3078,x:31510,y:32928,varname:node_3078,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5871,x:32974,y:32844,varname:node_5871,prsc:2|A-4888-OUT,B-9142-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9142,x:32745,y:32781,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_9142,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Panner,id:2883,x:31756,y:32796,varname:node_2883,prsc:2,spu:0,spv:-2|UVIN-14-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:14,x:31594,y:32796,varname:node_14,prsc:2,uv:0,uaff:False;proporder:5616-3474-4250-9142;pass:END;sub:END;*/

Shader "Shader Forge/longjuan" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _rongjietex ("rongjie tex", 2D) = "white" {}
        [HDR]_biancolor ("bian color", Color) = (0.2132353,0.5767749,1,1)
        _Intensity ("Intensity", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _rongjietex; uniform float4 _rongjietex_ST;
            uniform float4 _biancolor;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_4485 = _Time;
                float2 node_2883 = (i.uv0+node_4485.g*float2(0,-2));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2883, _MainTex));
                float4 _rongjietex_var = tex2D(_rongjietex,TRANSFORM_TEX(i.uv0, _rongjietex));
                float node_3410 = step(_rongjietex_var.r,(i.vertexColor.a*0.9+0.1));
                float3 finalColor = (((_MainTex_var.r*i.vertexColor.rgb)+((node_3410-step(_rongjietex_var.r,i.vertexColor.a))*_biancolor.rgb))*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.r*node_3410));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
