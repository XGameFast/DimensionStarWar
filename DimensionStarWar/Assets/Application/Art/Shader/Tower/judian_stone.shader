// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34358,y:32728,varname:node_4013,prsc:2|emission-2972-OUT,clip-3715-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:362,x:33024,y:33529,varname:node_362,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:8824,x:32717,y:33541,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_8824,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:4748,x:32394,y:33625,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_4748,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:8939,x:32206,y:33778,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_8939,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3565027,max:1;n:type:ShaderForge.SFN_Multiply,id:4583,x:32578,y:33701,varname:node_4583,prsc:2|A-4748-OUT,B-8939-OUT;n:type:ShaderForge.SFN_Add,id:1333,x:32885,y:33702,varname:node_1333,prsc:2|A-8824-Y,B-4583-OUT;n:type:ShaderForge.SFN_Step,id:3715,x:33360,y:33594,varname:node_3715,prsc:2|A-362-Y,B-9019-OUT;n:type:ShaderForge.SFN_Color,id:3040,x:33658,y:34025,ptovrint:False,ptlb:LineColor,ptin:_LineColor,varname:node_3040,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8161765,c2:0.07801685,c3:0.07801685,c4:1;n:type:ShaderForge.SFN_Vector1,id:7352,x:32860,y:33907,varname:node_7352,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:111,x:33929,y:33946,varname:node_111,prsc:2|A-1416-OUT,B-3040-RGB;n:type:ShaderForge.SFN_Add,id:9019,x:33118,y:33750,varname:node_9019,prsc:2|A-1333-OUT,B-7352-OUT;n:type:ShaderForge.SFN_Step,id:2476,x:33349,y:33780,varname:node_2476,prsc:2|A-362-Y,B-1333-OUT;n:type:ShaderForge.SFN_Subtract,id:1416,x:33573,y:33748,varname:node_1416,prsc:2|A-3715-OUT,B-2476-OUT;n:type:ShaderForge.SFN_Add,id:9071,x:33755,y:32851,varname:node_9071,prsc:2|A-111-OUT,B-7203-RGB;n:type:ShaderForge.SFN_Tex2d,id:7203,x:33336,y:32736,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7203,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:8167,x:33755,y:33018,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_8167,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Min,id:2972,x:34001,y:32923,varname:node_2972,prsc:2|A-9071-OUT,B-8167-RGB;proporder:8824-4748-8939-3040-7203-8167;pass:END;sub:END;*/

Shader "Shader Forge/judian_stone" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 0.3565027
        [HDR]_LineColor ("LineColor", Color) = (0.8161765,0.07801685,0.07801685,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
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
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            uniform float4 _LineColor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _MainColor;
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 emissive = min((((node_3715-step(i.posWorld.g,node_1333))*_LineColor.rgb)+_MainTex_var.rgb),_MainColor.rgb);
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
