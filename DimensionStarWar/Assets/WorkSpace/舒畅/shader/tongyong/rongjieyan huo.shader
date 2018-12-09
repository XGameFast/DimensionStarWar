// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33166,y:32532,varname:node_4013,prsc:2|emission-5354-OUT,alpha-3704-OUT;n:type:ShaderForge.SFN_Tex2d,id:8084,x:32742,y:32618,ptovrint:False,ptlb:maintex,ptin:_maintex,varname:node_8084,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8757,x:32186,y:33165,varname:node_8757,prsc:2|A-3834-A,B-392-OUT;n:type:ShaderForge.SFN_Vector1,id:392,x:31976,y:33221,varname:node_392,prsc:2,v1:-2;n:type:ShaderForge.SFN_Add,id:8297,x:32374,y:32969,varname:node_8297,prsc:2|A-8304-R,B-9331-OUT,C-8757-OUT;n:type:ShaderForge.SFN_Vector1,id:9331,x:32186,y:33104,varname:node_9331,prsc:2,v1:1;n:type:ShaderForge.SFN_Clamp01,id:287,x:32539,y:32969,varname:node_287,prsc:2|IN-8297-OUT;n:type:ShaderForge.SFN_Smoothstep,id:218,x:32742,y:32864,varname:node_218,prsc:2|A-9895-OUT,B-9523-OUT,V-287-OUT;n:type:ShaderForge.SFN_Slider,id:9523,x:32107,y:32840,ptovrint:False,ptlb:ruanying,ptin:_ruanying,varname:node_9523,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4812085,max:1;n:type:ShaderForge.SFN_OneMinus,id:9895,x:32539,y:32817,varname:node_9895,prsc:2|IN-9523-OUT;n:type:ShaderForge.SFN_Multiply,id:5354,x:32961,y:32635,varname:node_5354,prsc:2|A-8084-R,B-3834-RGB,C-9872-OUT;n:type:ShaderForge.SFN_Multiply,id:3704,x:32961,y:32792,varname:node_3704,prsc:2|A-8084-R,B-218-OUT;n:type:ShaderForge.SFN_VertexColor,id:3834,x:31976,y:33090,varname:node_3834,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8304,x:32186,y:32952,ptovrint:False,ptlb:rongjietex,ptin:_rongjietex,varname:node_8304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:867794c513b41704c9e219f4b9261461,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:9872,x:32742,y:32792,ptovrint:False,ptlb:zongqiangdu,ptin:_zongqiangdu,varname:node_9872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:8084-9523-8304-9872;pass:END;sub:END;*/

Shader "Shader Forge/rongjieyan huo" {
    Properties {
        _maintex ("maintex", 2D) = "white" {}
        _ruanying ("ruanying", Range(0, 1)) = 0.4812085
        _rongjietex ("rongjietex", 2D) = "white" {}
        _zongqiangdu ("zongqiangdu", Float ) = 1
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
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
            uniform float _ruanying;
            uniform sampler2D _rongjietex; uniform float4 _rongjietex_ST;
            uniform float _zongqiangdu;
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
////// Emissive:
                float4 _maintex_var = tex2D(_maintex,TRANSFORM_TEX(i.uv0, _maintex));
                float3 emissive = (_maintex_var.r*i.vertexColor.rgb*_zongqiangdu);
                float3 finalColor = emissive;
                float4 _rongjietex_var = tex2D(_rongjietex,TRANSFORM_TEX(i.uv0, _rongjietex));
                fixed4 finalRGBA = fixed4(finalColor,(_maintex_var.r*smoothstep( (1.0 - _ruanying), _ruanying, saturate((_rongjietex_var.r+1.0+(i.vertexColor.a*(-2.0)))) )));
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
