// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34465,y:32834,varname:node_9361,prsc:2|custl-6037-OUT,alpha-2475-OUT;n:type:ShaderForge.SFN_Tex2d,id:6559,x:33065,y:32944,varname:node_6559,prsc:2,tex:a6da9d84ca546694b882d4865acf9a9c,ntxv:0,isnm:False|UVIN-2982-UVOUT,TEX-5893-TEX;n:type:ShaderForge.SFN_TexCoord,id:7719,x:32348,y:33294,varname:node_7719,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_UVTile,id:2862,x:32732,y:32944,varname:node_2862,prsc:2|UVIN-7719-UVOUT,WDT-3071-OUT,HGT-3786-OUT,TILE-1730-OUT;n:type:ShaderForge.SFN_Vector1,id:3071,x:32563,y:32978,varname:node_3071,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:3786,x:32563,y:33029,varname:node_3786,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:1730,x:32563,y:33082,varname:node_1730,prsc:2,v1:0;n:type:ShaderForge.SFN_Panner,id:2982,x:32912,y:32944,varname:node_2982,prsc:2,spu:1,spv:0|UVIN-2862-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4770,x:33238,y:33139,varname:_node_6559_copy,prsc:2,tex:a6da9d84ca546694b882d4865acf9a9c,ntxv:0,isnm:False|UVIN-8135-UVOUT,TEX-5893-TEX;n:type:ShaderForge.SFN_UVTile,id:4282,x:32732,y:33139,varname:node_4282,prsc:2|UVIN-7719-UVOUT,WDT-6704-OUT,HGT-843-OUT,TILE-3722-OUT;n:type:ShaderForge.SFN_Vector1,id:6704,x:32563,y:33173,varname:node_6704,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:843,x:32563,y:33224,varname:node_843,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:3722,x:32563,y:33274,varname:node_3722,prsc:2,v1:0;n:type:ShaderForge.SFN_Panner,id:8030,x:32912,y:33139,varname:node_8030,prsc:2,spu:0,spv:1|UVIN-4282-UVOUT,DIST-3621-OUT;n:type:ShaderForge.SFN_Vector1,id:3621,x:32732,y:33261,varname:node_3621,prsc:2,v1:0.04;n:type:ShaderForge.SFN_Panner,id:8135,x:33081,y:33139,varname:node_8135,prsc:2,spu:0.7,spv:0|UVIN-8030-UVOUT;n:type:ShaderForge.SFN_Add,id:4382,x:33414,y:33050,varname:node_4382,prsc:2|A-1811-OUT,B-4770-R;n:type:ShaderForge.SFN_Tex2dAsset,id:5893,x:32912,y:33261,ptovrint:False,ptlb:node_5893,ptin:_node_5893,varname:node_5893,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a6da9d84ca546694b882d4865acf9a9c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1811,x:33251,y:32969,varname:node_1811,prsc:2|A-6559-R,B-7011-OUT;n:type:ShaderForge.SFN_Vector1,id:7011,x:33065,y:33064,varname:node_7011,prsc:2,v1:0.5;n:type:ShaderForge.SFN_UVTile,id:1210,x:32732,y:33411,varname:node_1210,prsc:2|UVIN-7719-UVOUT,WDT-5762-OUT,HGT-7033-OUT,TILE-9119-OUT;n:type:ShaderForge.SFN_Vector1,id:5762,x:32563,y:33411,varname:node_5762,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:7033,x:32563,y:33465,varname:node_7033,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:9119,x:32563,y:33520,varname:node_9119,prsc:2,v1:1;n:type:ShaderForge.SFN_Panner,id:1710,x:32926,y:33411,varname:node_1710,prsc:2,spu:0.6,spv:0|UVIN-1210-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9721,x:33089,y:33411,varname:node_9721,prsc:2,tex:a6da9d84ca546694b882d4865acf9a9c,ntxv:0,isnm:False|UVIN-1710-UVOUT,TEX-5893-TEX;n:type:ShaderForge.SFN_UVTile,id:3061,x:32732,y:33590,varname:node_3061,prsc:2|UVIN-7719-UVOUT,WDT-5054-OUT,HGT-4723-OUT,TILE-7099-OUT;n:type:ShaderForge.SFN_Vector1,id:5054,x:32563,y:33590,varname:node_5054,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4723,x:32563,y:33644,varname:node_4723,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:7099,x:32563,y:33699,varname:node_7099,prsc:2,v1:1;n:type:ShaderForge.SFN_Panner,id:8525,x:33071,y:33590,varname:node_8525,prsc:2,spu:0.8,spv:0|UVIN-1128-UVOUT;n:type:ShaderForge.SFN_Panner,id:1128,x:32908,y:33590,varname:node_1128,prsc:2,spu:0,spv:1|UVIN-3061-UVOUT,DIST-5236-OUT;n:type:ShaderForge.SFN_Vector1,id:5236,x:32732,y:33709,varname:node_5236,prsc:2,v1:-0.04;n:type:ShaderForge.SFN_Tex2d,id:4447,x:33249,y:33590,varname:node_4447,prsc:2,tex:a6da9d84ca546694b882d4865acf9a9c,ntxv:0,isnm:False|UVIN-8525-UVOUT,TEX-5893-TEX;n:type:ShaderForge.SFN_Multiply,id:4860,x:33249,y:33433,varname:node_4860,prsc:2|A-9721-R,B-9687-OUT;n:type:ShaderForge.SFN_Vector1,id:9687,x:33089,y:33530,varname:node_9687,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:9540,x:33422,y:33499,varname:node_9540,prsc:2|A-4860-OUT,B-4447-R;n:type:ShaderForge.SFN_Multiply,id:7023,x:33586,y:33076,varname:node_7023,prsc:2|A-4382-OUT,B-1809-RGB;n:type:ShaderForge.SFN_Color,id:1809,x:33414,y:33194,ptovrint:False,ptlb:xian color,ptin:_xiancolor,varname:node_1809,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09558821,c2:0.5883368,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:3012,x:33792,y:33288,varname:node_3012,prsc:2|A-7023-OUT,B-7708-OUT;n:type:ShaderForge.SFN_Multiply,id:7708,x:33587,y:33499,varname:node_7708,prsc:2|A-9540-OUT,B-1600-RGB;n:type:ShaderForge.SFN_Color,id:1600,x:33422,y:33640,ptovrint:False,ptlb:lizi color,ptin:_lizicolor,varname:node_1600,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5220588,c2:0.8615618,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:9699,x:33792,y:33436,varname:node_9699,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:4209,x:32563,y:33778,varname:node_4209,prsc:2|IN-7719-V;n:type:ShaderForge.SFN_Multiply,id:8442,x:32760,y:33778,varname:node_8442,prsc:2|A-4209-OUT,B-7719-V,C-780-OUT;n:type:ShaderForge.SFN_Vector1,id:780,x:32563,y:33899,varname:node_780,prsc:2,v1:4;n:type:ShaderForge.SFN_Clamp01,id:4783,x:32925,y:33778,varname:node_4783,prsc:2|IN-8442-OUT;n:type:ShaderForge.SFN_Tex2d,id:9993,x:33419,y:32662,ptovrint:False,ptlb:di,ptin:_di,varname:node_9993,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:319a4e50c6c39104aaa60828a4a78842,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8300,x:33671,y:32741,varname:node_8300,prsc:2|A-9993-R,B-8128-RGB;n:type:ShaderForge.SFN_Color,id:8128,x:33419,y:32843,ptovrint:False,ptlb:di color,ptin:_dicolor,varname:node_8128,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.125,c2:0.4206898,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:7338,x:34084,y:33142,varname:node_7338,prsc:2|A-9993-R,B-4382-OUT,C-9540-OUT;n:type:ShaderForge.SFN_Multiply,id:2475,x:34281,y:33187,varname:node_2475,prsc:2|A-7338-OUT,B-5458-OUT,C-9699-A;n:type:ShaderForge.SFN_Add,id:6037,x:34084,y:32990,varname:node_6037,prsc:2|A-8300-OUT,B-3012-OUT;n:type:ShaderForge.SFN_OneMinus,id:8374,x:32563,y:33980,varname:node_8374,prsc:2|IN-7719-U;n:type:ShaderForge.SFN_Multiply,id:7209,x:32937,y:33996,varname:node_7209,prsc:2|A-5018-OUT,B-3587-OUT,C-780-OUT;n:type:ShaderForge.SFN_Power,id:5018,x:32760,y:33996,varname:node_5018,prsc:2|VAL-8374-OUT,EXP-1148-OUT;n:type:ShaderForge.SFN_Vector1,id:1148,x:32563,y:34105,varname:node_1148,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Power,id:3587,x:32563,y:34181,varname:node_3587,prsc:2|VAL-7719-U,EXP-1355-OUT;n:type:ShaderForge.SFN_Vector1,id:1355,x:32391,y:34223,varname:node_1355,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Clamp01,id:3296,x:33104,y:33996,varname:node_3296,prsc:2|IN-7209-OUT;n:type:ShaderForge.SFN_Multiply,id:5458,x:33356,y:33929,varname:node_5458,prsc:2|A-4783-OUT,B-3296-OUT;proporder:5893-1809-1600-9993-8128;pass:END;sub:END;*/

Shader "Shader Forge/Energiza blend" {
    Properties {
        _node_5893 ("node_5893", 2D) = "white" {}
        [HDR]_xiancolor ("xian color", Color) = (0.09558821,0.5883368,1,1)
        [HDR]_lizicolor ("lizi color", Color) = (0.5220588,0.8615618,1,1)
        _di ("di", 2D) = "white" {}
        [HDR]_dicolor ("di color", Color) = (0.125,0.4206898,1,1)
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
            uniform sampler2D _node_5893; uniform float4 _node_5893_ST;
            uniform float4 _xiancolor;
            uniform float4 _lizicolor;
            uniform sampler2D _di; uniform float4 _di_ST;
            uniform float4 _dicolor;
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
                float4 _di_var = tex2D(_di,TRANSFORM_TEX(i.uv0, _di));
                float4 node_1795 = _Time;
                float node_3071 = 1.0;
                float node_1730 = 0.0;
                float2 node_2862_tc_rcp = float2(1.0,1.0)/float2( node_3071, 2.0 );
                float node_2862_ty = floor(node_1730 * node_2862_tc_rcp.x);
                float node_2862_tx = node_1730 - node_3071 * node_2862_ty;
                float2 node_2862 = (i.uv0 + float2(node_2862_tx, node_2862_ty)) * node_2862_tc_rcp;
                float2 node_2982 = (node_2862+node_1795.g*float2(1,0));
                float4 node_6559 = tex2D(_node_5893,TRANSFORM_TEX(node_2982, _node_5893));
                float node_6704 = 1.0;
                float node_3722 = 0.0;
                float2 node_4282_tc_rcp = float2(1.0,1.0)/float2( node_6704, 2.0 );
                float node_4282_ty = floor(node_3722 * node_4282_tc_rcp.x);
                float node_4282_tx = node_3722 - node_6704 * node_4282_ty;
                float2 node_4282 = (i.uv0 + float2(node_4282_tx, node_4282_ty)) * node_4282_tc_rcp;
                float2 node_8135 = ((node_4282+0.04*float2(0,1))+node_1795.g*float2(0.7,0));
                float4 _node_6559_copy = tex2D(_node_5893,TRANSFORM_TEX(node_8135, _node_5893));
                float node_4382 = ((node_6559.r*0.5)+_node_6559_copy.r);
                float node_5762 = 1.0;
                float node_9119 = 1.0;
                float2 node_1210_tc_rcp = float2(1.0,1.0)/float2( node_5762, 2.0 );
                float node_1210_ty = floor(node_9119 * node_1210_tc_rcp.x);
                float node_1210_tx = node_9119 - node_5762 * node_1210_ty;
                float2 node_1210 = (i.uv0 + float2(node_1210_tx, node_1210_ty)) * node_1210_tc_rcp;
                float2 node_1710 = (node_1210+node_1795.g*float2(0.6,0));
                float4 node_9721 = tex2D(_node_5893,TRANSFORM_TEX(node_1710, _node_5893));
                float node_5054 = 1.0;
                float node_7099 = 1.0;
                float2 node_3061_tc_rcp = float2(1.0,1.0)/float2( node_5054, 2.0 );
                float node_3061_ty = floor(node_7099 * node_3061_tc_rcp.x);
                float node_3061_tx = node_7099 - node_5054 * node_3061_ty;
                float2 node_3061 = (i.uv0 + float2(node_3061_tx, node_3061_ty)) * node_3061_tc_rcp;
                float2 node_8525 = ((node_3061+(-0.04)*float2(0,1))+node_1795.g*float2(0.8,0));
                float4 node_4447 = tex2D(_node_5893,TRANSFORM_TEX(node_8525, _node_5893));
                float node_9540 = ((node_9721.r*0.5)+node_4447.r);
                float3 finalColor = ((_di_var.r*_dicolor.rgb)+((node_4382*_xiancolor.rgb)+(node_9540*_lizicolor.rgb)));
                float node_780 = 4.0;
                fixed4 finalRGBA = fixed4(finalColor,((_di_var.r+node_4382+node_9540)*(saturate(((1.0 - i.uv0.g)*i.uv0.g*node_780))*saturate((pow((1.0 - i.uv0.r),0.8)*pow(i.uv0.r,0.8)*node_780)))*i.vertexColor.a));
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
