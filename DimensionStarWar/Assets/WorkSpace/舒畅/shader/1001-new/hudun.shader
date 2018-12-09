// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34317,y:32778,varname:node_9361,prsc:2|custl-709-OUT,alpha-4203-OUT;n:type:ShaderForge.SFN_Tex2d,id:2128,x:32056,y:32902,ptovrint:False,ptlb:dun color,ptin:_duncolor,varname:node_2128,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ded7c2d24fad976449b44aaf0e8a4909,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Power,id:1348,x:32416,y:32663,varname:node_1348,prsc:2|VAL-2128-R,EXP-9431-OUT;n:type:ShaderForge.SFN_Vector1,id:9431,x:32210,y:32697,varname:node_9431,prsc:2,v1:6;n:type:ShaderForge.SFN_Multiply,id:2545,x:32605,y:32663,varname:node_2545,prsc:2|A-1348-OUT,B-9431-OUT;n:type:ShaderForge.SFN_Tex2d,id:6745,x:32609,y:33223,ptovrint:False,ptlb:node_6745,ptin:_node_6745,varname:node_6745,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-471-UVOUT;n:type:ShaderForge.SFN_Panner,id:471,x:32420,y:33223,varname:node_471,prsc:2,spu:0.51,spv:0.5|UVIN-1549-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1549,x:32056,y:33220,varname:node_1549,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:7842,x:32795,y:32663,varname:node_7842,prsc:2|A-2545-OUT,B-6412-OUT;n:type:ShaderForge.SFN_Multiply,id:6412,x:32796,y:33223,varname:node_6412,prsc:2|A-2545-OUT,B-6745-R;n:type:ShaderForge.SFN_Add,id:709,x:33621,y:32891,varname:node_709,prsc:2|A-8835-OUT,B-2167-OUT,C-2301-OUT;n:type:ShaderForge.SFN_Add,id:6763,x:32970,y:33001,varname:node_6763,prsc:2|A-7842-OUT,B-2128-R;n:type:ShaderForge.SFN_Multiply,id:8835,x:32964,y:32663,varname:node_8835,prsc:2|A-7842-OUT,B-7312-RGB;n:type:ShaderForge.SFN_Color,id:7312,x:32773,y:32499,ptovrint:False,ptlb:xiankuang color,ptin:_xiankuangcolor,varname:node_7312,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2947263,c2:1,c3:0.1617647,c4:1;n:type:ShaderForge.SFN_Multiply,id:2167,x:32420,y:32978,varname:node_2167,prsc:2|A-2128-R,B-1451-RGB;n:type:ShaderForge.SFN_Color,id:1451,x:32056,y:33074,ptovrint:False,ptlb:node_1451,ptin:_node_1451,varname:node_1451,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07417818,c2:0.7205882,c3:0.1321322,c4:1;n:type:ShaderForge.SFN_Multiply,id:7118,x:32021,y:33550,varname:node_7118,prsc:2|A-7151-OUT,B-1549-U,C-917-OUT;n:type:ShaderForge.SFN_OneMinus,id:7151,x:31806,y:33550,varname:node_7151,prsc:2|IN-1549-U;n:type:ShaderForge.SFN_Vector1,id:917,x:31806,y:33690,varname:node_917,prsc:2,v1:4;n:type:ShaderForge.SFN_Slider,id:2344,x:33677,y:33312,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_2344,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Add,id:6789,x:32256,y:33819,varname:node_6789,prsc:2|A-9866-A,B-4394-OUT;n:type:ShaderForge.SFN_Vector1,id:4394,x:32073,y:33794,varname:node_4394,prsc:2,v1:0.03;n:type:ShaderForge.SFN_Subtract,id:8025,x:32746,y:33665,varname:node_8025,prsc:2|A-9256-OUT,B-9234-OUT;n:type:ShaderForge.SFN_Multiply,id:3267,x:33055,y:33646,varname:node_3267,prsc:2|A-3504-OUT,B-8025-OUT;n:type:ShaderForge.SFN_Multiply,id:2301,x:33306,y:33646,varname:node_2301,prsc:2|A-3267-OUT,B-8986-RGB;n:type:ShaderForge.SFN_Color,id:8986,x:33018,y:33812,ptovrint:False,ptlb:bianse,ptin:_bianse,varname:node_8986,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7413793,c2:1,c3:0.4485294,c4:1;n:type:ShaderForge.SFN_Add,id:2006,x:33621,y:33062,varname:node_2006,prsc:2|A-6763-OUT,B-3267-OUT;n:type:ShaderForge.SFN_Multiply,id:7862,x:33802,y:33062,varname:node_7862,prsc:2|A-2006-OUT,B-9256-OUT;n:type:ShaderForge.SFN_Step,id:3504,x:32897,y:33518,varname:node_3504,prsc:2|A-7452-OUT,B-6763-OUT;n:type:ShaderForge.SFN_Vector1,id:7452,x:32714,y:33503,varname:node_7452,prsc:2,v1:0.2264634;n:type:ShaderForge.SFN_Multiply,id:4203,x:34129,y:33149,varname:node_4203,prsc:2|A-9710-OUT,B-2344-OUT;n:type:ShaderForge.SFN_VertexColor,id:9866,x:31683,y:33765,varname:node_9866,prsc:2;n:type:ShaderForge.SFN_Step,id:9256,x:32437,y:33550,varname:node_9256,prsc:2|A-9866-A,B-7118-OUT;n:type:ShaderForge.SFN_Step,id:9234,x:32463,y:33772,varname:node_9234,prsc:2|A-6789-OUT,B-7118-OUT;n:type:ShaderForge.SFN_Clamp01,id:9710,x:33976,y:33037,varname:node_9710,prsc:2|IN-7862-OUT;proporder:2128-6745-7312-1451-2344-8986;pass:END;sub:END;*/

Shader "Shader Forge/hudun" {
    Properties {
        _duncolor ("dun color", 2D) = "white" {}
        _node_6745 ("node_6745", 2D) = "white" {}
        [HDR]_xiankuangcolor ("xiankuang color", Color) = (0.2947263,1,0.1617647,1)
        _node_1451 ("node_1451", Color) = (0.07417818,0.7205882,0.1321322,1)
        _Alpha ("Alpha", Range(0, 1)) = 1
        [HDR]_bianse ("bianse", Color) = (0.7413793,1,0.4485294,1)
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
            uniform sampler2D _duncolor; uniform float4 _duncolor_ST;
            uniform sampler2D _node_6745; uniform float4 _node_6745_ST;
            uniform float4 _xiankuangcolor;
            uniform float4 _node_1451;
            uniform float _Alpha;
            uniform float4 _bianse;
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
                float4 _duncolor_var = tex2D(_duncolor,TRANSFORM_TEX(i.uv0, _duncolor));
                float node_9431 = 6.0;
                float node_2545 = (pow(_duncolor_var.r,node_9431)*node_9431);
                float4 node_8046 = _Time;
                float2 node_471 = (i.uv0+node_8046.g*float2(0.51,0.5));
                float4 _node_6745_var = tex2D(_node_6745,TRANSFORM_TEX(node_471, _node_6745));
                float node_7842 = (node_2545+(node_2545*_node_6745_var.r));
                float node_6763 = (node_7842+_duncolor_var.r);
                float node_7118 = ((1.0 - i.uv0.r)*i.uv0.r*4.0);
                float node_9256 = step(i.vertexColor.a,node_7118);
                float node_3267 = (step(0.2264634,node_6763)*(node_9256-step((i.vertexColor.a+0.03),node_7118)));
                float3 finalColor = ((node_7842*_xiankuangcolor.rgb)+(_duncolor_var.r*_node_1451.rgb)+(node_3267*_bianse.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(saturate(((node_6763+node_3267)*node_9256))*_Alpha));
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
