// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32051,y:32733,varname:node_9361,prsc:2|custl-9380-OUT,alpha-8173-OUT;n:type:ShaderForge.SFN_Tex2d,id:2336,x:31586,y:32771,ptovrint:False,ptlb:node_2336,ptin:_node_2336,varname:node_2336,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d632c6eafe9b84588be3d3528f789efa,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:9850,x:31219,y:32860,varname:node_9850,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:8173,x:31861,y:32953,varname:node_8173,prsc:2|A-2336-A,B-8749-R;n:type:ShaderForge.SFN_Tex2d,id:8749,x:31586,y:32970,ptovrint:False,ptlb:zhuanpan,ptin:_zhuanpan,varname:node_8749,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1ef9c18a4024f194aab2ef4520d0fd4f,ntxv:0,isnm:False|UVIN-5573-UVOUT;n:type:ShaderForge.SFN_Add,id:9380,x:31861,y:32771,varname:node_9380,prsc:2|A-2336-RGB,B-8561-OUT;n:type:ShaderForge.SFN_Rotator,id:5573,x:31410,y:32970,varname:node_5573,prsc:2|UVIN-9850-UVOUT,SPD-4798-OUT;n:type:ShaderForge.SFN_Vector1,id:4798,x:31219,y:33013,varname:node_4798,prsc:2,v1:-0.3;n:type:ShaderForge.SFN_Multiply,id:8561,x:31760,y:33128,varname:node_8561,prsc:2|A-8749-R,B-8266-RGB;n:type:ShaderForge.SFN_Color,id:8266,x:31586,y:33141,ptovrint:False,ptlb:zhuanpan color,ptin:_zhuanpancolor,varname:node_8266,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5586207,c3:0,c4:1;proporder:2336-8749-8266;pass:END;sub:END;*/

Shader "Shader Forge/yuandi0040" {
    Properties {
        _node_2336 ("node_2336", 2D) = "white" {}
        _zhuanpan ("zhuanpan", 2D) = "white" {}
        [HDR]_zhuanpancolor ("zhuanpan color", Color) = (1,0.5586207,0,1)
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
            uniform sampler2D _node_2336; uniform float4 _node_2336_ST;
            uniform sampler2D _zhuanpan; uniform float4 _zhuanpan_ST;
            uniform float4 _zhuanpancolor;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 _node_2336_var = tex2D(_node_2336,TRANSFORM_TEX(i.uv0, _node_2336));
                float4 node_4550 = _Time;
                float node_5573_ang = node_4550.g;
                float node_5573_spd = (-0.3);
                float node_5573_cos = cos(node_5573_spd*node_5573_ang);
                float node_5573_sin = sin(node_5573_spd*node_5573_ang);
                float2 node_5573_piv = float2(0.5,0.5);
                float2 node_5573 = (mul(i.uv0-node_5573_piv,float2x2( node_5573_cos, -node_5573_sin, node_5573_sin, node_5573_cos))+node_5573_piv);
                float4 _zhuanpan_var = tex2D(_zhuanpan,TRANSFORM_TEX(node_5573, _zhuanpan));
                float3 finalColor = (_node_2336_var.rgb+(_zhuanpan_var.r*_zhuanpancolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(_node_2336_var.a+_zhuanpan_var.r));
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
