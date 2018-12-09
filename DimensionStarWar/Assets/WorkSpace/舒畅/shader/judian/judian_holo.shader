// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34358,y:32728,varname:node_4013,prsc:2|emission-1848-OUT,clip-3715-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:33332,y:32454,ptovrint:False,ptlb:niuquyanse,ptin:_niuquyanse,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2058824,c2:0.4085191,c3:1,c4:1;n:type:ShaderForge.SFN_Panner,id:7841,x:32382,y:32196,varname:node_7841,prsc:2,spu:0.2,spv:-0.3|UVIN-2598-UVOUT;n:type:ShaderForge.SFN_Tex2dAsset,id:8391,x:32424,y:31789,ptovrint:False,ptlb:node_8391,ptin:_node_8391,varname:node_8391,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4837,x:32598,y:32196,varname:node_4837,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-7841-UVOUT,TEX-8391-TEX;n:type:ShaderForge.SFN_TexCoord,id:2598,x:32193,y:32196,varname:node_2598,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:1725,x:32392,y:32391,varname:node_1725,prsc:2,spu:-0.25,spv:0.15|UVIN-2598-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3138,x:32598,y:32414,varname:node_3138,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-1725-UVOUT,TEX-8391-TEX;n:type:ShaderForge.SFN_Multiply,id:6989,x:32822,y:32302,varname:node_6989,prsc:2|A-4837-R,B-3138-R;n:type:ShaderForge.SFN_Add,id:1259,x:33017,y:32302,varname:node_1259,prsc:2|A-6989-OUT,B-7528-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7528,x:32822,y:32457,varname:node_7528,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Rotator,id:6406,x:33170,y:32302,varname:node_6406,prsc:2|UVIN-1259-OUT,SPD-9077-OUT;n:type:ShaderForge.SFN_Vector1,id:9077,x:33017,y:32457,varname:node_9077,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:1691,x:33670,y:32345,varname:node_1691,prsc:2|A-9401-OUT,B-1304-RGB,C-1697-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1697,x:33346,y:32633,ptovrint:False,ptlb:niuquliangdu,ptin:_niuquliangdu,varname:node_1697,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Power,id:9401,x:33543,y:32149,varname:node_9401,prsc:2|VAL-280-R,EXP-6363-OUT;n:type:ShaderForge.SFN_Add,id:4158,x:33706,y:32601,varname:node_4158,prsc:2|A-4372-OUT,B-1691-OUT;n:type:ShaderForge.SFN_Panner,id:5577,x:33391,y:31914,varname:node_5577,prsc:2,spu:0.1,spv:0.2|UVIN-136-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:136,x:33188,y:31914,varname:node_136,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4372,x:33850,y:31883,varname:node_4372,prsc:2|A-9718-OUT,B-3186-OUT,C-6776-RGB;n:type:ShaderForge.SFN_ValueProperty,id:9718,x:33543,y:31958,ptovrint:False,ptlb:liangwenqiang,ptin:_liangwenqiang,varname:node_9718,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Tex2d,id:280,x:33039,y:32072,varname:node_280,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-6406-UVOUT,TEX-8391-TEX;n:type:ShaderForge.SFN_Tex2d,id:7635,x:33569,y:31690,varname:node_7635,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-5577-UVOUT,TEX-8391-TEX;n:type:ShaderForge.SFN_Color,id:6776,x:33319,y:31740,ptovrint:False,ptlb:liangwenyanse,ptin:_liangwenyanse,varname:node_6776,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4852941,c2:0.744422,c3:1,c4:1;n:type:ShaderForge.SFN_Power,id:3186,x:33775,y:31711,varname:node_3186,prsc:2|VAL-7635-R,EXP-1497-OUT;n:type:ShaderForge.SFN_Vector1,id:1497,x:33592,y:31628,varname:node_1497,prsc:2,v1:1.8;n:type:ShaderForge.SFN_Vector1,id:6363,x:33339,y:32224,varname:node_6363,prsc:2,v1:0.9;n:type:ShaderForge.SFN_FragmentPosition,id:362,x:33024,y:33529,varname:node_362,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:8824,x:32717,y:33541,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_8824,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:4748,x:32394,y:33625,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_4748,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:8939,x:32206,y:33778,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_8939,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3565027,max:1;n:type:ShaderForge.SFN_Multiply,id:4583,x:32578,y:33701,varname:node_4583,prsc:2|A-4748-OUT,B-8939-OUT;n:type:ShaderForge.SFN_Add,id:1333,x:32885,y:33702,varname:node_1333,prsc:2|A-8824-Y,B-4583-OUT;n:type:ShaderForge.SFN_Step,id:3715,x:33360,y:33594,varname:node_3715,prsc:2|A-362-Y,B-9019-OUT;n:type:ShaderForge.SFN_Color,id:3040,x:33658,y:34025,ptovrint:False,ptlb:LineColor,ptin:_LineColor,varname:node_3040,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8161765,c2:0.07801685,c3:0.07801685,c4:1;n:type:ShaderForge.SFN_Vector1,id:7352,x:32860,y:33907,varname:node_7352,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:111,x:33929,y:33946,varname:node_111,prsc:2|A-1416-OUT,B-3040-RGB;n:type:ShaderForge.SFN_Add,id:1848,x:34101,y:32838,varname:node_1848,prsc:2|A-4158-OUT,B-111-OUT;n:type:ShaderForge.SFN_Add,id:9019,x:33118,y:33750,varname:node_9019,prsc:2|A-1333-OUT,B-7352-OUT;n:type:ShaderForge.SFN_Step,id:2476,x:33349,y:33780,varname:node_2476,prsc:2|A-362-Y,B-1333-OUT;n:type:ShaderForge.SFN_Subtract,id:1416,x:33573,y:33748,varname:node_1416,prsc:2|A-3715-OUT,B-2476-OUT;proporder:1304-8391-1697-9718-6776-8824-4748-8939-3040;pass:END;sub:END;*/

Shader "Shader Forge/judian_holo" {
    Properties {
        _niuquyanse ("niuquyanse", Color) = (0.2058824,0.4085191,1,1)
        _node_8391 ("node_8391", 2D) = "white" {}
        _niuquliangdu ("niuquliangdu", Float ) = 2
        _liangwenqiang ("liangwenqiang", Float ) = 3
        _liangwenyanse ("liangwenyanse", Color) = (0.4852941,0.744422,1,1)
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 0.3565027
        [HDR]_LineColor ("LineColor", Color) = (0.8161765,0.07801685,0.07801685,1)
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _niuquyanse;
            uniform sampler2D _node_8391; uniform float4 _node_8391_ST;
            uniform float _niuquliangdu;
            uniform float _liangwenqiang;
            uniform float4 _liangwenyanse;
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            uniform float4 _LineColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_1333 = (_Center.g+(_Height*_HologarmGrowup));
                float node_3715 = step(i.posWorld.g,(node_1333+0.1));
                clip(node_3715 - 0.5);
////// Lighting:
////// Emissive:
                float4 node_4253 = _Time;
                float2 node_5577 = (i.uv0+node_4253.g*float2(0.1,0.2));
                float4 node_7635 = tex2D(_node_8391,TRANSFORM_TEX(node_5577, _node_8391));
                float node_6406_ang = node_4253.g;
                float node_6406_spd = 0.5;
                float node_6406_cos = cos(node_6406_spd*node_6406_ang);
                float node_6406_sin = sin(node_6406_spd*node_6406_ang);
                float2 node_6406_piv = float2(0.5,0.5);
                float2 node_7841 = (i.uv0+node_4253.g*float2(0.2,-0.3));
                float4 node_4837 = tex2D(_node_8391,TRANSFORM_TEX(node_7841, _node_8391));
                float2 node_1725 = (i.uv0+node_4253.g*float2(-0.25,0.15));
                float4 node_3138 = tex2D(_node_8391,TRANSFORM_TEX(node_1725, _node_8391));
                float2 node_6406 = (mul(((node_4837.r*node_3138.r)+i.uv0)-node_6406_piv,float2x2( node_6406_cos, -node_6406_sin, node_6406_sin, node_6406_cos))+node_6406_piv);
                float4 node_280 = tex2D(_node_8391,TRANSFORM_TEX(node_6406, _node_8391));
                float3 emissive = (((_liangwenqiang*pow(node_7635.r,1.8)*_liangwenyanse.rgb)+(pow(node_280.r,0.9)*_niuquyanse.rgb*_niuquliangdu))+((node_3715-step(i.posWorld.g,node_1333))*_LineColor.rgb));
                float3 finalColor = emissive;
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
            Cull Back
            
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
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_1333 = (_Center.g+(_Height*_HologarmGrowup));
                float node_3715 = step(i.posWorld.g,(node_1333+0.1));
                clip(node_3715 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
