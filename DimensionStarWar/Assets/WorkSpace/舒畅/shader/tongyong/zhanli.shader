// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34441,y:32569,varname:node_9361,prsc:2|custl-9582-OUT,alpha-3666-OUT;n:type:ShaderForge.SFN_TexCoord,id:7386,x:31973,y:32852,varname:node_7386,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Subtract,id:8096,x:32244,y:33085,varname:node_8096,prsc:2|A-7386-UVOUT,B-2298-OUT;n:type:ShaderForge.SFN_Divide,id:4764,x:32457,y:33085,varname:node_4764,prsc:2|A-8096-OUT,B-4174-OUT;n:type:ShaderForge.SFN_Slider,id:4174,x:32039,y:33233,ptovrint:False,ptlb:wangge size,ptin:_wanggesize,varname:node_4174,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.65,max:1;n:type:ShaderForge.SFN_Vector1,id:2298,x:31973,y:33013,varname:node_2298,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:4636,x:32351,y:32849,varname:node_4636,prsc:2|A-7386-UVOUT,B-4764-OUT;n:type:ShaderForge.SFN_Lerp,id:3249,x:32584,y:32849,varname:node_3249,prsc:2|A-4636-OUT,B-2298-OUT,T-4174-OUT;n:type:ShaderForge.SFN_Clamp01,id:9420,x:32757,y:32846,varname:node_9420,prsc:2|IN-3249-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9171,x:32747,y:32540,ptovrint:False,ptlb:glow,ptin:_glow,varname:node_9171,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:82e75f6610e79124cb134867c1ed6d53,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2196,x:32974,y:32473,varname:node_2196,prsc:2,tex:82e75f6610e79124cb134867c1ed6d53,ntxv:0,isnm:False|UVIN-7386-UVOUT,TEX-9171-TEX;n:type:ShaderForge.SFN_Panner,id:5722,x:32784,y:33253,varname:node_5722,prsc:2,spu:0,spv:-1|UVIN-3331-UVOUT,DIST-2303-OUT;n:type:ShaderForge.SFN_TexCoord,id:3331,x:32457,y:33227,varname:node_3331,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9913,x:33492,y:33036,varname:node_9913,prsc:2|A-6938-R,B-8126-R,C-6825-OUT;n:type:ShaderForge.SFN_Add,id:713,x:33499,y:32510,varname:node_713,prsc:2|A-2196-R,B-448-OUT;n:type:ShaderForge.SFN_Multiply,id:448,x:33305,y:32544,varname:node_448,prsc:2|A-2196-R,B-6938-R;n:type:ShaderForge.SFN_Add,id:3666,x:33910,y:32974,varname:node_3666,prsc:2|A-3027-OUT,B-9913-OUT;n:type:ShaderForge.SFN_Multiply,id:3027,x:33726,y:32525,varname:node_3027,prsc:2|A-713-OUT,B-9267-OUT;n:type:ShaderForge.SFN_Add,id:9582,x:34171,y:32623,varname:node_9582,prsc:2|A-5442-OUT,B-1281-OUT;n:type:ShaderForge.SFN_Multiply,id:5442,x:33970,y:32525,varname:node_5442,prsc:2|A-3027-OUT,B-7094-RGB;n:type:ShaderForge.SFN_Multiply,id:1281,x:33970,y:32772,varname:node_1281,prsc:2|A-2522-OUT,B-9913-OUT;n:type:ShaderForge.SFN_Add,id:2522,x:33667,y:32773,varname:node_2522,prsc:2|A-7094-RGB,B-8580-OUT;n:type:ShaderForge.SFN_Vector1,id:8580,x:33410,y:32955,varname:node_8580,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Slider,id:6686,x:32060,y:33534,ptovrint:False,ptlb:liudong,ptin:_liudong,varname:node_6686,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:8126,x:33064,y:33130,ptovrint:False,ptlb:node_8126,ptin:_node_8126,varname:node_8126,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c4f8ddaa0d3047d4da8657565daad313,ntxv:0,isnm:False|UVIN-5722-UVOUT;n:type:ShaderForge.SFN_Color,id:7094,x:33378,y:32782,ptovrint:False,ptlb:color,ptin:_color,varname:node_7094,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1323529,c2:0.6409736,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:9267,x:33321,y:32690,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_9267,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5891218,max:1;n:type:ShaderForge.SFN_Tex2d,id:6938,x:32982,y:32829,ptovrint:False,ptlb:wenli,ptin:_wenli,varname:node_6938,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:95c36a2f959f1564c8c425fa1845613d,ntxv:0,isnm:False|UVIN-9420-OUT;n:type:ShaderForge.SFN_Vector1,id:6825,x:33597,y:32943,varname:node_6825,prsc:2,v1:3;n:type:ShaderForge.SFN_RemapRange,id:2303,x:32497,y:33509,varname:node_2303,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-6686-OUT;proporder:4174-9171-6686-8126-7094-9267-6938;pass:END;sub:END;*/

Shader "Shader Forge/zhanli" {
    Properties {
        _wanggesize ("wangge size", Range(0, 1)) = 0.65
        _glow ("glow", 2D) = "white" {}
        _liudong ("liudong", Range(0, 1)) = 0
        _node_8126 ("node_8126", 2D) = "white" {}
        _color ("color", Color) = (0.1323529,0.6409736,1,1)
        _alpha ("alpha", Range(0, 1)) = 0.5891218
        _wenli ("wenli", 2D) = "white" {}
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
            uniform float _wanggesize;
            uniform sampler2D _glow; uniform float4 _glow_ST;
            uniform float _liudong;
            uniform sampler2D _node_8126; uniform float4 _node_8126_ST;
            uniform float4 _color;
            uniform float _alpha;
            uniform sampler2D _wenli; uniform float4 _wenli_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_2196 = tex2D(_glow,TRANSFORM_TEX(i.uv1, _glow));
                float node_2298 = 0.5;
                float2 node_9420 = saturate(lerp((i.uv1+((i.uv1-node_2298)/_wanggesize)),float2(node_2298,node_2298),_wanggesize));
                float4 _wenli_var = tex2D(_wenli,TRANSFORM_TEX(node_9420, _wenli));
                float node_3027 = ((node_2196.r+(node_2196.r*_wenli_var.r))*_alpha);
                float2 node_5722 = (i.uv0+(_liudong*2.0+-1.0)*float2(0,-1));
                float4 _node_8126_var = tex2D(_node_8126,TRANSFORM_TEX(node_5722, _node_8126));
                float node_9913 = (_wenli_var.r*_node_8126_var.r*3.0);
                float3 finalColor = ((node_3027*_color.rgb)+((_color.rgb+0.3)*node_9913));
                fixed4 finalRGBA = fixed4(finalColor,(node_3027+node_9913));
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
