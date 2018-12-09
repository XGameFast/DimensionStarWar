// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33331,y:32519,varname:node_9361,prsc:2|custl-4281-OUT,alpha-8754-A;n:type:ShaderForge.SFN_Tex2d,id:8754,x:32599,y:32721,ptovrint:False,ptlb:node_8754,ptin:_node_8754,varname:node_8754,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e1144c40ec6344d5280ecf9143792726,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1172,x:32463,y:32901,ptovrint:False,ptlb:node_1172,ptin:_node_1172,varname:node_1172,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d7b57e090aba5fa42861bb03f55f449c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:2226,x:31841,y:33110,varname:node_2226,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:4281,x:33002,y:32682,varname:node_4281,prsc:2|A-8754-RGB,B-692-OUT,C-8808-OUT;n:type:ShaderForge.SFN_Multiply,id:692,x:32896,y:33109,varname:node_692,prsc:2|A-1172-RGB,B-1238-OUT,C-6144-R;n:type:ShaderForge.SFN_Color,id:5348,x:32456,y:33305,ptovrint:False,ptlb:node_5348,ptin:_node_5348,varname:node_5348,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.212221,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Panner,id:6615,x:32072,y:33110,varname:node_6615,prsc:2,spu:0.1,spv:0.2|UVIN-2226-UVOUT,DIST-1800-OUT;n:type:ShaderForge.SFN_Tex2d,id:6144,x:32475,y:33111,ptovrint:False,ptlb:node_6144,ptin:_node_6144,varname:node_6144,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c196117898ed97045928df82293354a4,ntxv:0,isnm:False|UVIN-7358-UVOUT;n:type:ShaderForge.SFN_Sin,id:3305,x:31948,y:33370,varname:node_3305,prsc:2|IN-2912-OUT;n:type:ShaderForge.SFN_Time,id:2966,x:31622,y:33357,varname:node_2966,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:1800,x:32124,y:33370,varname:node_1800,prsc:2,frmn:-1,frmx:1,tomn:-4,tomx:4|IN-3305-OUT;n:type:ShaderForge.SFN_Rotator,id:7358,x:32285,y:33111,varname:node_7358,prsc:2|UVIN-6615-UVOUT,SPD-4906-OUT;n:type:ShaderForge.SFN_Multiply,id:8808,x:32792,y:32881,varname:node_8808,prsc:2|A-1172-R,B-8097-OUT,C-5348-RGB;n:type:ShaderForge.SFN_Vector1,id:8097,x:32624,y:32967,varname:node_8097,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Vector1,id:4906,x:32111,y:33255,varname:node_4906,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:2912,x:31786,y:33381,varname:node_2912,prsc:2|A-2966-T,B-3201-OUT;n:type:ShaderForge.SFN_Vector1,id:3201,x:31633,y:33484,varname:node_3201,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Add,id:1238,x:32688,y:33305,varname:node_1238,prsc:2|A-5348-RGB,B-4906-OUT;proporder:8754-1172-5348-6144;pass:END;sub:END;*/

Shader "Shader Forge/diwen" {
    Properties {
        _node_8754 ("node_8754", 2D) = "white" {}
        _node_1172 ("node_1172", 2D) = "white" {}
        [HDR]_node_5348 ("node_5348", Color) = (0,0.212221,0.9926471,1)
        _node_6144 ("node_6144", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _node_8754; uniform float4 _node_8754_ST;
            uniform sampler2D _node_1172; uniform float4 _node_1172_ST;
            uniform float4 _node_5348;
            uniform sampler2D _node_6144; uniform float4 _node_6144_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 _node_8754_var = tex2D(_node_8754,TRANSFORM_TEX(i.uv0, _node_8754));
                float4 _node_1172_var = tex2D(_node_1172,TRANSFORM_TEX(i.uv0, _node_1172));
                float node_4906 = 0.3;
                float4 node_3492 = _Time;
                float node_7358_ang = node_3492.g;
                float node_7358_spd = node_4906;
                float node_7358_cos = cos(node_7358_spd*node_7358_ang);
                float node_7358_sin = sin(node_7358_spd*node_7358_ang);
                float2 node_7358_piv = float2(0.5,0.5);
                float4 node_2966 = _Time;
                float2 node_7358 = (mul((i.uv0+(sin((node_2966.g*0.1))*4.0+0.0)*float2(0.1,0.2))-node_7358_piv,float2x2( node_7358_cos, -node_7358_sin, node_7358_sin, node_7358_cos))+node_7358_piv);
                float4 _node_6144_var = tex2D(_node_6144,TRANSFORM_TEX(node_7358, _node_6144));
                float3 finalColor = (_node_8754_var.rgb+(_node_1172_var.rgb*(_node_5348.rgb+node_4906)*_node_6144_var.r)+(_node_1172_var.r*0.2*_node_5348.rgb));
                return fixed4(finalColor,_node_8754_var.a);
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
