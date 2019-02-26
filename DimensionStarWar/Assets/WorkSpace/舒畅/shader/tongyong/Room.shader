// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33744,y:32724,varname:node_9361,prsc:2|custl-177-OUT,clip-6321-OUT;n:type:ShaderForge.SFN_Tex2d,id:7375,x:32731,y:33487,ptovrint:False,ptlb:dissolve tex,ptin:_dissolvetex,varname:node_7375,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:46a5e82dd2634d94bb1662061241a8ba,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1649,x:32605,y:33074,ptovrint:False,ptlb:liuwen tex,ptin:_liuwentex,varname:node_1649,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-5125-UVOUT;n:type:ShaderForge.SFN_Add,id:177,x:33457,y:32820,varname:node_177,prsc:2|A-6212-OUT,B-2070-OUT,C-4252-OUT;n:type:ShaderForge.SFN_TexCoord,id:1347,x:32215,y:32895,varname:node_1347,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8173,x:32418,y:32895,varname:node_8173,prsc:2|A-1347-UVOUT,B-5968-OUT;n:type:ShaderForge.SFN_Vector2,id:5968,x:32215,y:33033,varname:node_5968,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_Step,id:3637,x:32904,y:33407,varname:node_3637,prsc:2|A-7375-R,B-3411-OUT;n:type:ShaderForge.SFN_Slider,id:3411,x:32398,y:33580,ptovrint:False,ptlb:Dissolve,ptin:_Dissolve,varname:node_3411,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.1,cur:1,max:1;n:type:ShaderForge.SFN_Add,id:3445,x:32679,y:33674,varname:node_3445,prsc:2|A-3411-OUT,B-5266-OUT;n:type:ShaderForge.SFN_Vector1,id:5266,x:32473,y:33721,varname:node_5266,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Step,id:5018,x:32902,y:33674,varname:node_5018,prsc:2|A-7375-R,B-3445-OUT;n:type:ShaderForge.SFN_Subtract,id:5251,x:33063,y:33528,varname:node_5251,prsc:2|A-5018-OUT,B-3637-OUT;n:type:ShaderForge.SFN_Multiply,id:4252,x:33255,y:33518,varname:node_4252,prsc:2|A-5251-OUT,B-2964-RGB;n:type:ShaderForge.SFN_Color,id:2964,x:33063,y:33692,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_2964,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2205882,c2:0.7419877,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1929,x:32605,y:32895,ptovrint:False,ptlb:wangge tex,ptin:_wanggetex,varname:node_1929,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7ed65089cc37c6c44a423350ee3bd0c6,ntxv:0,isnm:False|UVIN-8173-OUT;n:type:ShaderForge.SFN_Tex2d,id:6282,x:32603,y:32516,ptovrint:False,ptlb:muqiang tex,ptin:_muqiangtex,varname:node_6282,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:77b1731b29e742a449c2418b9de45188,ntxv:0,isnm:False|UVIN-1254-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3081,x:32240,y:32516,varname:node_3081,prsc:2,uv:2,uaff:False;n:type:ShaderForge.SFN_Panner,id:1254,x:32422,y:32516,varname:node_1254,prsc:2,spu:0.05,spv:0|UVIN-3081-UVOUT;n:type:ShaderForge.SFN_Panner,id:5125,x:32418,y:33081,varname:node_5125,prsc:2,spu:0.1,spv:0.05|UVIN-1347-UVOUT;n:type:ShaderForge.SFN_Add,id:2070,x:33218,y:32979,varname:node_2070,prsc:2|A-7362-OUT,B-9403-OUT;n:type:ShaderForge.SFN_Multiply,id:9403,x:32845,y:33074,varname:node_9403,prsc:2|A-1929-R,B-1649-R,C-1433-OUT;n:type:ShaderForge.SFN_Multiply,id:7362,x:33021,y:32907,varname:node_7362,prsc:2|A-1929-R,B-2523-RGB;n:type:ShaderForge.SFN_Color,id:2523,x:32771,y:32713,ptovrint:False,ptlb:wangge color,ptin:_wanggecolor,varname:node_2523,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.233564,c2:0.5529023,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Multiply,id:6212,x:32841,y:32516,varname:node_6212,prsc:2|A-6282-RGB,B-6340-RGB;n:type:ShaderForge.SFN_Color,id:6340,x:32603,y:32696,ptovrint:False,ptlb:muqiang color,ptin:_muqiangcolor,varname:node_6340,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08136895,c2:0.1189931,c3:0.2573529,c4:1;n:type:ShaderForge.SFN_Add,id:1433,x:32669,y:33260,varname:node_1433,prsc:2|A-2523-RGB,B-8767-OUT;n:type:ShaderForge.SFN_Vector1,id:8767,x:32478,y:33273,varname:node_8767,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:6321,x:33579,y:33016,varname:node_6321,prsc:2|A-5018-OUT,B-5868-OUT;n:type:ShaderForge.SFN_Slider,id:5868,x:33355,y:33345,ptovrint:False,ptlb:off/on,ptin:_offon,varname:node_5868,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:7375-3411-2964-1929-6282-1649-2523-6340-5868;pass:END;sub:END;*/

Shader "Shader Forge/Room" {
    Properties {
        _dissolvetex ("dissolve tex", 2D) = "white" {}
        _Dissolve ("Dissolve", Range(-0.1, 1)) = 1
        [HDR]_biancolor ("bian color", Color) = (0.2205882,0.7419877,1,1)
        _wanggetex ("wangge tex", 2D) = "white" {}
        _muqiangtex ("muqiang tex", 2D) = "white" {}
        _liuwentex ("liuwen tex", 2D) = "white" {}
        [HDR]_wanggecolor ("wangge color", Color) = (0.233564,0.5529023,0.9926471,1)
        _muqiangcolor ("muqiang color", Color) = (0.08136895,0.1189931,0.2573529,1)
        _offon ("off/on", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
            uniform sampler2D _liuwentex; uniform float4 _liuwentex_ST;
            uniform float _Dissolve;
            uniform float4 _biancolor;
            uniform sampler2D _wanggetex; uniform float4 _wanggetex_ST;
            uniform sampler2D _muqiangtex; uniform float4 _muqiangtex_ST;
            uniform float4 _wanggecolor;
            uniform float4 _muqiangcolor;
            uniform float _offon;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                float node_5018 = step(_dissolvetex_var.r,(_Dissolve+0.01));
                clip((node_5018*_offon) - 0.5);
////// Lighting:
                float4 node_2055 = _Time;
                float2 node_1254 = (i.uv2+node_2055.g*float2(0.05,0));
                float4 _muqiangtex_var = tex2D(_muqiangtex,TRANSFORM_TEX(node_1254, _muqiangtex));
                float2 node_8173 = (i.uv1*float2(2,2));
                float4 _wanggetex_var = tex2D(_wanggetex,TRANSFORM_TEX(node_8173, _wanggetex));
                float2 node_5125 = (i.uv1+node_2055.g*float2(0.1,0.05));
                float4 _liuwentex_var = tex2D(_liuwentex,TRANSFORM_TEX(node_5125, _liuwentex));
                float3 finalColor = ((_muqiangtex_var.rgb*_muqiangcolor.rgb)+((_wanggetex_var.r*_wanggecolor.rgb)+(_wanggetex_var.r*_liuwentex_var.r*(_wanggecolor.rgb+0.3)))+((node_5018-step(_dissolvetex_var.r,_Dissolve))*_biancolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            uniform sampler2D _dissolvetex; uniform float4 _dissolvetex_ST;
            uniform float _Dissolve;
            uniform float _offon;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _dissolvetex_var = tex2D(_dissolvetex,TRANSFORM_TEX(i.uv0, _dissolvetex));
                float node_5018 = step(_dissolvetex_var.r,(_Dissolve+0.01));
                clip((node_5018*_offon) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
