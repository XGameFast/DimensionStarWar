// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33438,y:32708,varname:node_4013,prsc:2|emission-4457-OUT,alpha-9116-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32337,y:33366,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4068966,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6077,x:32102,y:32901,ptovrint:False,ptlb:node_6077,ptin:_node_6077,varname:node_6077,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-4080-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5809,x:32102,y:33082,ptovrint:False,ptlb:node_5809,ptin:_node_5809,varname:node_5809,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-9647-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8856,x:32894,y:32826,varname:node_8856,prsc:2|A-6641-OUT,B-4354-OUT,C-1304-RGB;n:type:ShaderForge.SFN_Panner,id:4080,x:31939,y:32901,varname:node_4080,prsc:2,spu:0.2,spv:0.3|UVIN-3642-UVOUT;n:type:ShaderForge.SFN_Panner,id:9647,x:31939,y:33082,varname:node_9647,prsc:2,spu:-0.25,spv:-0.15|UVIN-3642-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3642,x:31762,y:32943,varname:node_3642,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Fresnel,id:9884,x:32339,y:32369,varname:node_9884,prsc:2|EXP-645-OUT;n:type:ShaderForge.SFN_Vector1,id:645,x:32097,y:32493,varname:node_645,prsc:2,v1:3;n:type:ShaderForge.SFN_Add,id:4457,x:33253,y:32803,varname:node_4457,prsc:2|A-844-OUT,B-8856-OUT;n:type:ShaderForge.SFN_Power,id:647,x:32287,y:32918,varname:node_647,prsc:2|VAL-6077-R,EXP-2596-OUT;n:type:ShaderForge.SFN_Vector1,id:2596,x:32087,y:32804,varname:node_2596,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Power,id:7282,x:32287,y:33099,varname:node_7282,prsc:2|VAL-5809-R,EXP-2596-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4354,x:32327,y:33260,ptovrint:False,ptlb:liuwen,ptin:_liuwen,varname:node_4354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:844,x:32965,y:32518,varname:node_844,prsc:2|A-9884-OUT,B-7632-RGB,C-5671-OUT;n:type:ShaderForge.SFN_Color,id:7632,x:32607,y:32304,ptovrint:False,ptlb:Fse,ptin:_Fse,varname:node_7632,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.04411763,c2:0.3671401,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:9116,x:33024,y:33040,varname:node_9116,prsc:2|A-1962-OUT,B-6641-OUT;n:type:ShaderForge.SFN_Multiply,id:6641,x:32728,y:33111,varname:node_6641,prsc:2|A-635-OUT,B-9420-OUT;n:type:ShaderForge.SFN_Fresnel,id:1962,x:32339,y:32523,varname:node_1962,prsc:2|EXP-4138-OUT;n:type:ShaderForge.SFN_Vector1,id:4138,x:32141,y:32580,varname:node_4138,prsc:2,v1:0.2;n:type:ShaderForge.SFN_ValueProperty,id:5671,x:32607,y:32453,ptovrint:False,ptlb:Fqiang,ptin:_Fqiang,varname:node_5671,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Add,id:9420,x:32438,y:32962,varname:node_9420,prsc:2|A-647-OUT,B-7282-OUT;n:type:ShaderForge.SFN_OneMinus,id:635,x:32519,y:32721,varname:node_635,prsc:2|IN-1962-OUT;proporder:1304-6077-5809-4354-7632-5671;pass:END;sub:END;*/

Shader "Shader Forge/duojinengliangqiu" {
    Properties {
        _Color ("Color", Color) = (0.4068966,0,1,1)
        _node_6077 ("node_6077", 2D) = "white" {}
        _node_5809 ("node_5809", 2D) = "white" {}
        _liuwen ("liuwen", Float ) = 1
        _Fse ("Fse", Color) = (0.04411763,0.3671401,1,1)
        _Fqiang ("Fqiang", Float ) = 2
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
            uniform float4 _Color;
            uniform sampler2D _node_6077; uniform float4 _node_6077_ST;
            uniform sampler2D _node_5809; uniform float4 _node_5809_ST;
            uniform float _liuwen;
            uniform float4 _Fse;
            uniform float _Fqiang;
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
                float node_1962 = pow(1.0-max(0,dot(normalDirection, viewDirection)),0.2);
                float4 node_3247 = _Time;
                float2 node_4080 = (i.uv0+node_3247.g*float2(0.2,0.3));
                float4 _node_6077_var = tex2D(_node_6077,TRANSFORM_TEX(node_4080, _node_6077));
                float node_2596 = 0.5;
                float2 node_9647 = (i.uv0+node_3247.g*float2(-0.25,-0.15));
                float4 _node_5809_var = tex2D(_node_5809,TRANSFORM_TEX(node_9647, _node_5809));
                float node_6641 = ((1.0 - node_1962)*(pow(_node_6077_var.r,node_2596)+pow(_node_5809_var.r,node_2596)));
                float3 emissive = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0)*_Fse.rgb*_Fqiang)+(node_6641*_liuwen*_Color.rgb));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(node_1962+node_6641));
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
