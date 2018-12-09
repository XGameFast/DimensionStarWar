// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32581,y:32883,varname:node_9361,prsc:2|custl-3205-OUT,alpha-6872-OUT;n:type:ShaderForge.SFN_Tex2d,id:2830,x:31711,y:32846,ptovrint:False,ptlb:suofang tex,ptin:_suofangtex,varname:node_2830,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f31ee8df879e51b479f245be369630c8,ntxv:0,isnm:False|UVIN-4974-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:38,x:31711,y:33064,ptovrint:False,ptlb:zhunxin tex,ptin:_zhunxintex,varname:node_38,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fc8c5a57fab8a1844a880ffe02e2c93f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3153,x:31711,y:33284,ptovrint:False,ptlb:waiquan tex,ptin:_waiquantex,varname:node_3153,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:06c9f2e489d04994a94a9c4595269a38,ntxv:0,isnm:False|UVIN-2303-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6639,x:31991,y:32839,varname:node_6639,prsc:2|A-8470-RGB,B-2830-R;n:type:ShaderForge.SFN_TexCoord,id:2303,x:30422,y:32863,varname:node_2303,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:5739,x:30442,y:33001,varname:node_5739,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:9178,x:30636,y:32863,varname:node_9178,prsc:2|A-2303-UVOUT,B-5739-OUT;n:type:ShaderForge.SFN_Divide,id:7472,x:30801,y:32863,varname:node_7472,prsc:2|A-9178-OUT,B-1470-OUT;n:type:ShaderForge.SFN_Add,id:9449,x:30992,y:32863,varname:node_9449,prsc:2|A-7472-OUT,B-2303-UVOUT;n:type:ShaderForge.SFN_Lerp,id:4039,x:31175,y:32863,varname:node_4039,prsc:2|A-9449-OUT,B-5739-OUT,T-1470-OUT;n:type:ShaderForge.SFN_Clamp01,id:5935,x:31353,y:32863,varname:node_5935,prsc:2|IN-4039-OUT;n:type:ShaderForge.SFN_Sin,id:2501,x:30484,y:33086,varname:node_2501,prsc:2|IN-4928-TTR;n:type:ShaderForge.SFN_Time,id:4928,x:30252,y:33025,varname:node_4928,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:1470,x:30636,y:33086,varname:node_1470,prsc:2,frmn:-1,frmx:1,tomn:0.48,tomx:0.45|IN-2501-OUT;n:type:ShaderForge.SFN_Color,id:6130,x:31711,y:32660,ptovrint:False,ptlb:di color,ptin:_dicolor,varname:node_6130,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1029412,c2:0.5174443,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:4280,x:31999,y:33110,varname:node_4280,prsc:2|A-6130-RGB,B-3153-R;n:type:ShaderForge.SFN_Multiply,id:3500,x:31999,y:32982,varname:node_3500,prsc:2|A-38-R,B-8470-RGB;n:type:ShaderForge.SFN_Color,id:8470,x:31711,y:33480,ptovrint:False,ptlb:zhognxin color,ptin:_zhognxincolor,varname:node_8470,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5221096,c3:0.08823532,c4:1;n:type:ShaderForge.SFN_Add,id:3205,x:32279,y:32987,varname:node_3205,prsc:2|A-6639-OUT,B-3500-OUT,C-4280-OUT;n:type:ShaderForge.SFN_Add,id:1089,x:32009,y:33299,varname:node_1089,prsc:2|A-2830-R,B-38-R,C-3153-R;n:type:ShaderForge.SFN_Rotator,id:4974,x:31530,y:32863,varname:node_4974,prsc:2|UVIN-5935-OUT;n:type:ShaderForge.SFN_Multiply,id:6872,x:32349,y:33335,varname:node_6872,prsc:2|A-1089-OUT,B-1407-OUT;n:type:ShaderForge.SFN_Slider,id:1407,x:31984,y:33496,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_1407,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:2830-38-3153-6130-8470-1407;pass:END;sub:END;*/

Shader "Shader Forge/zhunxin" {
    Properties {
        _suofangtex ("suofang tex", 2D) = "white" {}
        _zhunxintex ("zhunxin tex", 2D) = "white" {}
        _waiquantex ("waiquan tex", 2D) = "white" {}
        [HDR]_dicolor ("di color", Color) = (0.1029412,0.5174443,1,1)
        [HDR]_zhognxincolor ("zhognxin color", Color) = (1,0.5221096,0.08823532,1)
        _Alpha ("Alpha", Range(0, 1)) = 1
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
            uniform sampler2D _suofangtex; uniform float4 _suofangtex_ST;
            uniform sampler2D _zhunxintex; uniform float4 _zhunxintex_ST;
            uniform sampler2D _waiquantex; uniform float4 _waiquantex_ST;
            uniform float4 _dicolor;
            uniform float4 _zhognxincolor;
            uniform float _Alpha;
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
                float4 node_5138 = _Time;
                float node_4974_ang = node_5138.g;
                float node_4974_spd = 1.0;
                float node_4974_cos = cos(node_4974_spd*node_4974_ang);
                float node_4974_sin = sin(node_4974_spd*node_4974_ang);
                float2 node_4974_piv = float2(0.5,0.5);
                float node_5739 = 0.5;
                float4 node_4928 = _Time;
                float node_1470 = (sin(node_4928.a)*-0.015+0.465);
                float2 node_4974 = (mul(saturate(lerp((((i.uv0-node_5739)/node_1470)+i.uv0),float2(node_5739,node_5739),node_1470))-node_4974_piv,float2x2( node_4974_cos, -node_4974_sin, node_4974_sin, node_4974_cos))+node_4974_piv);
                float4 _suofangtex_var = tex2D(_suofangtex,TRANSFORM_TEX(node_4974, _suofangtex));
                float4 _zhunxintex_var = tex2D(_zhunxintex,TRANSFORM_TEX(i.uv0, _zhunxintex));
                float4 _waiquantex_var = tex2D(_waiquantex,TRANSFORM_TEX(i.uv0, _waiquantex));
                float3 finalColor = ((_zhognxincolor.rgb*_suofangtex_var.r)+(_zhunxintex_var.r*_zhognxincolor.rgb)+(_dicolor.rgb*_waiquantex_var.r));
                fixed4 finalRGBA = fixed4(finalColor,((_suofangtex_var.r+_zhunxintex_var.r+_waiquantex_var.r)*_Alpha));
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
