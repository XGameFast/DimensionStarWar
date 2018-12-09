// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33554,y:32746,varname:node_9361,prsc:2|custl-4767-RGB,clip-323-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:7056,x:32373,y:32881,varname:node_7056,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:8269,x:32373,y:33072,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_8269,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Distance,id:6686,x:32634,y:32877,varname:node_6686,prsc:2|A-7056-X,B-8269-X;n:type:ShaderForge.SFN_Slider,id:6489,x:32373,y:33285,ptovrint:False,ptlb:Dissvo,ptin:_Dissvo,varname:node_6489,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_Step,id:8113,x:32971,y:32876,varname:node_8113,prsc:2|A-6686-OUT,B-6489-OUT;n:type:ShaderForge.SFN_Tex2d,id:4767,x:32854,y:32721,ptovrint:False,ptlb:node_4767,ptin:_node_4767,varname:node_4767,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:10e3ab0fa3004464f88f957818778bae,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Distance,id:6260,x:32634,y:33102,varname:node_6260,prsc:2|A-7056-Z,B-8269-Z;n:type:ShaderForge.SFN_Step,id:2132,x:32983,y:33102,varname:node_2132,prsc:2|A-6260-OUT,B-6489-OUT;n:type:ShaderForge.SFN_Multiply,id:323,x:33212,y:33020,varname:node_323,prsc:2|A-8113-OUT,B-2132-OUT;proporder:8269-6489-4767;pass:END;sub:END;*/

Shader "Shader Forge/groundEffect_06" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _Dissvo ("Dissvo", Range(0, 5)) = 0
        _node_4767 ("node_4767", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Dissvo;
            uniform sampler2D _node_4767; uniform float4 _node_4767_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                clip((step(distance(i.posWorld.r,_Center.r),_Dissvo)*step(distance(i.posWorld.b,_Center.b),_Dissvo)) - 0.5);
////// Lighting:
                float4 _node_4767_var = tex2D(_node_4767,TRANSFORM_TEX(i.uv0, _node_4767));
                float3 finalColor = _node_4767_var.rgb;
                return fixed4(finalColor,1);
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Dissvo;
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
                clip((step(distance(i.posWorld.r,_Center.r),_Dissvo)*step(distance(i.posWorld.b,_Center.b),_Dissvo)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
