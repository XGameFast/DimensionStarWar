// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33761,y:32653,varname:node_4013,prsc:2|emission-3203-OUT,clip-7665-OUT;n:type:ShaderForge.SFN_Tex2d,id:6673,x:32857,y:32689,ptovrint:False,ptlb:node_6673,ptin:_node_6673,varname:node_6673,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:264ef5fe24c0de4408718924fcfcb7f4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7290,x:33212,y:32754,varname:node_7290,prsc:2|A-6673-RGB,B-8157-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8157,x:32946,y:32846,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:node_8157,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_FragmentPosition,id:7730,x:32695,y:33001,varname:node_7730,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:2752,x:32695,y:33136,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_2752,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:1792,x:32695,y:33290,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_1792,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:9726,x:32538,y:33379,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_9726,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:6125,x:32864,y:33331,varname:node_6125,prsc:2|A-1792-OUT,B-9726-OUT;n:type:ShaderForge.SFN_Add,id:7257,x:33004,y:33209,varname:node_7257,prsc:2|A-2752-Y,B-6125-OUT;n:type:ShaderForge.SFN_Step,id:7665,x:33206,y:33128,varname:node_7665,prsc:2|A-7730-Y,B-7257-OUT;n:type:ShaderForge.SFN_Add,id:3027,x:33187,y:33337,varname:node_3027,prsc:2|A-7257-OUT,B-1348-OUT;n:type:ShaderForge.SFN_Vector1,id:1348,x:32984,y:33422,varname:node_1348,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:786,x:33368,y:33258,varname:node_786,prsc:2|A-7730-Y,B-3027-OUT;n:type:ShaderForge.SFN_Subtract,id:5144,x:33368,y:33005,varname:node_5144,prsc:2|A-786-OUT,B-7665-OUT;n:type:ShaderForge.SFN_Add,id:3203,x:33504,y:32807,varname:node_3203,prsc:2|A-7290-OUT,B-5144-OUT;proporder:6673-8157-2752-1792-9726;pass:END;sub:END;*/

Shader "Shader Forge/judian 1" {
    Properties {
        _node_6673 ("node_6673", 2D) = "white" {}
        _Emission ("Emission", Float ) = 1
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 0
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
            uniform sampler2D _node_6673; uniform float4 _node_6673_ST;
            uniform float _Emission;
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
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
                float node_7257 = (_Center.g+(_Height*_HologarmGrowup));
                float node_7665 = step(i.posWorld.g,node_7257);
                clip(node_7665 - 0.5);
////// Lighting:
////// Emissive:
                float4 _node_6673_var = tex2D(_node_6673,TRANSFORM_TEX(i.uv0, _node_6673));
                float3 emissive = ((_node_6673_var.rgb*_Emission)+(step(i.posWorld.g,(node_7257+0.1))-node_7665));
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
                float node_7257 = (_Center.g+(_Height*_HologarmGrowup));
                float node_7665 = step(i.posWorld.g,node_7257);
                clip(node_7665 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
