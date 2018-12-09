// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-2139-OUT,alpha-9607-OUT;n:type:ShaderForge.SFN_Tex2d,id:808,x:32155,y:32518,ptovrint:False,ptlb:node_808,ptin:_node_808,varname:node_808,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b387d14c648799643abdf9006d33e08e,ntxv:0,isnm:False|UVIN-218-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6272,x:32155,y:32940,ptovrint:False,ptlb:node_6272,ptin:_node_6272,varname:node_6272,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a4d7dec4393cb47438641fbf2616071a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3191,x:32155,y:32718,ptovrint:False,ptlb:node_3191,ptin:_node_3191,varname:node_3191,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6eba454a7ea83c34e96d7436dff53933,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:9607,x:32852,y:33082,varname:node_9607,prsc:2|A-808-R,B-7690-OUT,C-6272-R;n:type:ShaderForge.SFN_Add,id:2139,x:32940,y:32762,varname:node_2139,prsc:2|A-2443-OUT,B-510-OUT,C-3655-OUT;n:type:ShaderForge.SFN_Multiply,id:2443,x:32657,y:32392,varname:node_2443,prsc:2|A-8976-RGB,B-3191-RGB;n:type:ShaderForge.SFN_Color,id:8976,x:32433,y:32392,ptovrint:False,ptlb:node_8976,ptin:_node_8976,varname:node_8976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2065835,c2:0.058391,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Rotator,id:218,x:31937,y:32518,varname:node_218,prsc:2|UVIN-8086-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:8086,x:31756,y:32518,varname:node_8086,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:7690,x:32631,y:33082,varname:node_7690,prsc:2|A-3191-A,B-3108-OUT;n:type:ShaderForge.SFN_Vector1,id:3108,x:32453,y:33104,varname:node_3108,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:510,x:32669,y:32594,varname:node_510,prsc:2|A-808-R,B-8571-RGB;n:type:ShaderForge.SFN_Color,id:8571,x:32433,y:32636,ptovrint:False,ptlb:node_8571,ptin:_node_8571,varname:node_8571,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.462069,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3655,x:32684,y:32905,varname:node_3655,prsc:2|A-8428-RGB,B-6272-R;n:type:ShaderForge.SFN_Color,id:8428,x:32433,y:32824,ptovrint:False,ptlb:node_8428,ptin:_node_8428,varname:node_8428,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.7931032,c3:1,c4:1;proporder:3191-808-6272-8976-8571-8428;pass:END;sub:END;*/

Shader "Shader Forge/jindutiao2" {
    Properties {
        _node_3191 ("node_3191", 2D) = "white" {}
        _node_808 ("node_808", 2D) = "white" {}
        _node_6272 ("node_6272", 2D) = "white" {}
        _node_8976 ("node_8976", Color) = (0.2065835,0.058391,0.9926471,1)
        _node_8571 ("node_8571", Color) = (0,0.462069,1,1)
        [HDR]_node_8428 ("node_8428", Color) = (0,0.7931032,1,1)
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
            uniform sampler2D _node_808; uniform float4 _node_808_ST;
            uniform sampler2D _node_6272; uniform float4 _node_6272_ST;
            uniform sampler2D _node_3191; uniform float4 _node_3191_ST;
            uniform float4 _node_8976;
            uniform float4 _node_8571;
            uniform float4 _node_8428;
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
                float4 _node_3191_var = tex2D(_node_3191,TRANSFORM_TEX(i.uv0, _node_3191));
                float4 node_5604 = _Time;
                float node_218_ang = node_5604.g;
                float node_218_spd = 1.0;
                float node_218_cos = cos(node_218_spd*node_218_ang);
                float node_218_sin = sin(node_218_spd*node_218_ang);
                float2 node_218_piv = float2(0.5,0.5);
                float2 node_218 = (mul(i.uv0-node_218_piv,float2x2( node_218_cos, -node_218_sin, node_218_sin, node_218_cos))+node_218_piv);
                float4 _node_808_var = tex2D(_node_808,TRANSFORM_TEX(node_218, _node_808));
                float4 _node_6272_var = tex2D(_node_6272,TRANSFORM_TEX(i.uv0, _node_6272));
                float3 finalColor = ((_node_8976.rgb*_node_3191_var.rgb)+(_node_808_var.r*_node_8571.rgb)+(_node_8428.rgb*_node_6272_var.r));
                fixed4 finalRGBA = fixed4(finalColor,(_node_808_var.r+(_node_3191_var.a*0.3)+_node_6272_var.r));
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
