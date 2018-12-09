// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33438,y:32708,varname:node_4013,prsc:2|emission-4670-OUT,alpha-4457-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32677,y:33198,ptovrint:False,ptlb:liuwense,ptin:_liuwense,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2573529,c2:0.6005071,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6077,x:32102,y:32901,ptovrint:False,ptlb:node_6077,ptin:_node_6077,varname:node_6077,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-4080-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5809,x:32102,y:33082,ptovrint:False,ptlb:node_5809,ptin:_node_5809,varname:node_5809,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-9647-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8856,x:32677,y:33026,varname:node_8856,prsc:2|A-4871-OUT,B-3356-OUT,C-3356-OUT,D-3356-OUT,E-3356-OUT;n:type:ShaderForge.SFN_Panner,id:4080,x:31939,y:32901,varname:node_4080,prsc:2,spu:0.2,spv:0.3|UVIN-3642-UVOUT;n:type:ShaderForge.SFN_Panner,id:9647,x:31939,y:33082,varname:node_9647,prsc:2,spu:-0.25,spv:-0.15|UVIN-3642-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3642,x:31762,y:32943,varname:node_3642,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Fresnel,id:9884,x:32336,y:32367,varname:node_9884,prsc:2|EXP-645-OUT;n:type:ShaderForge.SFN_Vector1,id:645,x:32126,y:32389,varname:node_645,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Add,id:4457,x:33172,y:33071,varname:node_4457,prsc:2|A-9884-OUT,B-8856-OUT;n:type:ShaderForge.SFN_Power,id:647,x:32287,y:32918,varname:node_647,prsc:2|VAL-6077-R,EXP-2596-OUT;n:type:ShaderForge.SFN_Vector1,id:2596,x:32087,y:32804,varname:node_2596,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Power,id:7282,x:32287,y:33099,varname:node_7282,prsc:2|VAL-5809-R,EXP-2596-OUT;n:type:ShaderForge.SFN_Multiply,id:844,x:32572,y:32367,varname:node_844,prsc:2|A-9884-OUT,B-7632-RGB;n:type:ShaderForge.SFN_Color,id:7632,x:32336,y:32520,ptovrint:False,ptlb:Fse,ptin:_Fse,varname:node_7632,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.007454339,c3:0.1544118,c4:1;n:type:ShaderForge.SFN_Multiply,id:6641,x:32483,y:32866,varname:node_6641,prsc:2|A-647-OUT,B-7282-OUT;n:type:ShaderForge.SFN_Add,id:4871,x:32483,y:33026,varname:node_4871,prsc:2|A-647-OUT,B-7282-OUT;n:type:ShaderForge.SFN_OneMinus,id:3356,x:32519,y:32576,varname:node_3356,prsc:2|IN-9884-OUT;n:type:ShaderForge.SFN_Lerp,id:8622,x:32989,y:32539,varname:node_8622,prsc:2|A-844-OUT,B-5478-OUT,T-9208-OUT;n:type:ShaderForge.SFN_Vector1,id:9208,x:32783,y:32573,varname:node_9208,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4670,x:33176,y:32709,varname:node_4670,prsc:2|A-8622-OUT,B-9982-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9982,x:33001,y:32816,ptovrint:False,ptlb:zongqiang,ptin:_zongqiang,varname:node_9982,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:5478,x:32883,y:32941,varname:node_5478,prsc:2|A-8856-OUT,B-1304-RGB;proporder:1304-6077-5809-7632-9982;pass:END;sub:END;*/

Shader "Shader Forge/duojinengliangqiu 1" {
    Properties {
        [HDR]_liuwense ("liuwense", Color) = (0.2573529,0.6005071,1,1)
        _node_6077 ("node_6077", 2D) = "white" {}
        _node_5809 ("node_5809", 2D) = "white" {}
        [HDR]_Fse ("Fse", Color) = (0,0.007454339,0.1544118,1)
        _zongqiang ("zongqiang", Float ) = 2
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
            uniform float4 _liuwense;
            uniform sampler2D _node_6077; uniform float4 _node_6077_ST;
            uniform sampler2D _node_5809; uniform float4 _node_5809_ST;
            uniform float4 _Fse;
            uniform float _zongqiang;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float node_9884 = pow(1.0-max(0,dot(normalDirection, viewDirection)),0.7);
                float4 node_7312 = _Time;
                float2 node_4080 = (i.uv0+node_7312.g*float2(0.2,0.3));
                float4 _node_6077_var = tex2D(_node_6077,TRANSFORM_TEX(node_4080, _node_6077));
                float node_2596 = 0.5;
                float node_647 = pow(_node_6077_var.r,node_2596);
                float2 node_9647 = (i.uv0+node_7312.g*float2(-0.25,-0.15));
                float4 _node_5809_var = tex2D(_node_5809,TRANSFORM_TEX(node_9647, _node_5809));
                float node_7282 = pow(_node_5809_var.r,node_2596);
                float node_3356 = (1.0 - node_9884);
                float node_8856 = ((node_647+node_7282)*node_3356*node_3356*node_3356*node_3356);
                float3 emissive = (lerp((node_9884*_Fse.rgb),(node_8856*_liuwense.rgb),0.5)*_zongqiang);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(node_9884+node_8856));
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
