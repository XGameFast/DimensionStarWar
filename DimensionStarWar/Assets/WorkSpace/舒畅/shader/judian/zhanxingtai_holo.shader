// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32932,y:33240,varname:node_4013,prsc:2|emission-3285-OUT,clip-1621-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32403,y:32616,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6059839,c2:1,c3:0.2279412,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6963,x:32403,y:32514,ptovrint:False,ptlb:zhanxingtai,ptin:_zhanxingtai,varname:node_6963,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:2061,x:31751,y:32639,varname:node_2061,prsc:2,spu:0.1,spv:0.2|UVIN-5245-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8061,x:31923,y:32639,ptovrint:False,ptlb:node_8061,ptin:_node_8061,varname:node_8061,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2061-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5245,x:31579,y:32639,varname:node_5245,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9721,x:32367,y:33336,varname:node_9721,prsc:2|A-6963-RGB,B-4743-OUT;n:type:ShaderForge.SFN_Multiply,id:4743,x:32626,y:32798,varname:node_4743,prsc:2|A-1304-RGB,B-9145-OUT,C-8061-R;n:type:ShaderForge.SFN_Vector1,id:9145,x:31923,y:32819,varname:node_9145,prsc:2,v1:1;n:type:ShaderForge.SFN_FragmentPosition,id:2718,x:31437,y:33463,varname:node_2718,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:1315,x:31437,y:33626,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_1315,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:8073,x:31437,y:33833,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_8073,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:6883,x:31280,y:33930,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_6883,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:6848,x:31638,y:33833,varname:node_6848,prsc:2|A-8073-OUT,B-6883-OUT;n:type:ShaderForge.SFN_Add,id:9593,x:31850,y:33733,varname:node_9593,prsc:2|A-1315-Y,B-6848-OUT;n:type:ShaderForge.SFN_Step,id:1621,x:32226,y:33599,varname:node_1621,prsc:2|A-2718-Y,B-5613-OUT;n:type:ShaderForge.SFN_Color,id:8649,x:32651,y:33922,ptovrint:False,ptlb:LIneColor,ptin:_LIneColor,varname:node_8649,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9705882,c2:0.07850347,c3:0.07850347,c4:1;n:type:ShaderForge.SFN_Multiply,id:441,x:32801,y:33723,varname:node_441,prsc:2|A-5273-OUT,B-8649-RGB;n:type:ShaderForge.SFN_Add,id:3285,x:32669,y:33351,varname:node_3285,prsc:2|A-9721-OUT,B-441-OUT;n:type:ShaderForge.SFN_Add,id:5613,x:32090,y:33721,varname:node_5613,prsc:2|A-9593-OUT,B-6926-OUT;n:type:ShaderForge.SFN_Step,id:538,x:32241,y:33871,varname:node_538,prsc:2|A-2718-Y,B-9593-OUT;n:type:ShaderForge.SFN_Subtract,id:5273,x:32418,y:33715,varname:node_5273,prsc:2|A-1621-OUT,B-538-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:6926,x:31711,y:33976,varname:node_6926,prsc:2,min:0,max:0.1|IN-6883-OUT;proporder:1304-6963-8061-1315-8073-6883-8649;pass:END;sub:END;*/

Shader "Shader Forge/zhanxingtai_holo" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.6059839,1,0.2279412,1)
        _zhanxingtai ("zhanxingtai", 2D) = "white" {}
        _node_8061 ("node_8061", 2D) = "white" {}
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 1
        [HDR]_LIneColor ("LIneColor", Color) = (0.9705882,0.07850347,0.07850347,1)
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
            uniform float4 _Color;
            uniform sampler2D _zhanxingtai; uniform float4 _zhanxingtai_ST;
            uniform sampler2D _node_8061; uniform float4 _node_8061_ST;
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            uniform float4 _LIneColor;
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
                float node_9593 = (_Center.g+(_Height*_HologarmGrowup));
                float node_1621 = step(i.posWorld.g,(node_9593+clamp(_HologarmGrowup,0,0.1)));
                clip(node_1621 - 0.5);
////// Lighting:
////// Emissive:
                float4 _zhanxingtai_var = tex2D(_zhanxingtai,TRANSFORM_TEX(i.uv0, _zhanxingtai));
                float4 node_8209 = _Time;
                float2 node_2061 = (i.uv0+node_8209.g*float2(0.1,0.2));
                float4 _node_8061_var = tex2D(_node_8061,TRANSFORM_TEX(node_2061, _node_8061));
                float3 emissive = ((_zhanxingtai_var.rgb+(_Color.rgb*1.0*_node_8061_var.r))+((node_1621-step(i.posWorld.g,node_9593))*_LIneColor.rgb));
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
                float node_9593 = (_Center.g+(_Height*_HologarmGrowup));
                float node_1621 = step(i.posWorld.g,(node_9593+clamp(_HologarmGrowup,0,0.1)));
                clip(node_1621 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
