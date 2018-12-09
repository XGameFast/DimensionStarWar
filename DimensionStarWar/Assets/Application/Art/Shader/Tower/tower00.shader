// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33067,y:32507,varname:node_9361,prsc:2|custl-4784-OUT,clip-5006-OUT;n:type:ShaderForge.SFN_Slider,id:2698,x:31214,y:33325,ptovrint:False,ptlb:dissvo,ptin:_dissvo,varname:node_2698,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.06955973,max:1;n:type:ShaderForge.SFN_FragmentPosition,id:1734,x:31260,y:32818,varname:node_1734,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:8365,x:31260,y:32976,ptovrint:False,ptlb:center,ptin:_center,varname:node_8365,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:220,x:31293,y:33221,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_220,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:4789,x:31534,y:33221,varname:node_4789,prsc:2|A-220-OUT,B-2698-OUT;n:type:ShaderForge.SFN_Add,id:9874,x:31676,y:33142,varname:node_9874,prsc:2|A-8365-Y,B-4789-OUT;n:type:ShaderForge.SFN_Subtract,id:4330,x:32051,y:33055,varname:node_4330,prsc:2|A-9874-OUT,B-1734-Y;n:type:ShaderForge.SFN_Subtract,id:3902,x:31826,y:32870,varname:node_3902,prsc:2|A-1734-Y,B-9874-OUT;n:type:ShaderForge.SFN_Abs,id:9125,x:32251,y:33055,varname:node_9125,prsc:2|IN-4330-OUT;n:type:ShaderForge.SFN_Step,id:4456,x:32456,y:33122,varname:node_4456,prsc:2|A-9125-OUT,B-7069-OUT;n:type:ShaderForge.SFN_Slider,id:7069,x:32094,y:33208,ptovrint:False,ptlb:width,ptin:_width,varname:node_7069,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.05811968,max:0.1;n:type:ShaderForge.SFN_Vector1,id:68,x:32051,y:32917,varname:node_68,prsc:2,v1:0;n:type:ShaderForge.SFN_Step,id:5006,x:32210,y:32812,varname:node_5006,prsc:2|A-3902-OUT,B-68-OUT;n:type:ShaderForge.SFN_Color,id:1604,x:32064,y:32426,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_1604,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2211,x:32567,y:32665,varname:node_2211,prsc:2|A-5199-OUT,B-4456-OUT;n:type:ShaderForge.SFN_Add,id:4784,x:32743,y:32521,varname:node_4784,prsc:2|A-1604-RGB,B-2211-OUT;n:type:ShaderForge.SFN_Color,id:5375,x:32064,y:32586,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_5375,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:5511,x:32052,y:32738,varname:node_5511,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5199,x:32303,y:32633,varname:node_5199,prsc:2|A-5375-RGB,B-5511-OUT;proporder:2698-8365-220-7069-1604-5375;pass:END;sub:END;*/

Shader "Shader Forge/tower00" {
    Properties {
        _dissvo ("dissvo", Range(0, 1)) = 0.06955973
        _center ("center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 2
        _width ("width", Range(0, 0.1)) = 0.05811968
        [HDR]_BaseColor ("BaseColor", Color) = (0.5,0.5,0.5,1)
        _LitColor ("LitColor", Color) = (1,1,1,1)
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
            uniform float _dissvo;
            uniform float4 _center;
            uniform float _Height;
            uniform float _width;
            uniform float4 _BaseColor;
            uniform float4 _LitColor;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_9874 = (_center.g+(_Height*_dissvo));
                clip(step((i.posWorld.g-node_9874),0.0) - 0.5);
////// Lighting:
                float3 finalColor = (_BaseColor.rgb+((_LitColor.rgb*2.0)*step(abs((node_9874-i.posWorld.g)),_width)));
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
            uniform float _dissvo;
            uniform float4 _center;
            uniform float _Height;
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
                float node_9874 = (_center.g+(_Height*_dissvo));
                clip(step((i.posWorld.g-node_9874),0.0) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
