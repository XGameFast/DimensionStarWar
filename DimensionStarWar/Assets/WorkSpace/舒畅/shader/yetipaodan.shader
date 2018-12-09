// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33625,y:32687,varname:node_4013,prsc:2|emission-9178-OUT,alpha-2019-OUT,voffset-4494-OUT;n:type:ShaderForge.SFN_Tex2d,id:4511,x:32579,y:32930,ptovrint:False,ptlb:node_4511,ptin:_node_4511,varname:node_4511,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-5839-UVOUT;n:type:ShaderForge.SFN_Panner,id:5839,x:32414,y:32930,varname:node_5839,prsc:2,spu:0.1,spv:0.2|UVIN-3129-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3129,x:32249,y:32930,varname:node_3129,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4494,x:32855,y:33082,varname:node_4494,prsc:2|A-4511-R,B-8452-OUT;n:type:ShaderForge.SFN_Multiply,id:5383,x:32820,y:32869,varname:node_5383,prsc:2|A-9818-RGB,B-4511-R;n:type:ShaderForge.SFN_VertexColor,id:9818,x:32301,y:32629,varname:node_9818,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2019,x:33353,y:32953,varname:node_2019,prsc:2|A-9818-A,B-870-OUT;n:type:ShaderForge.SFN_Vector1,id:8452,x:32563,y:33199,varname:node_8452,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Fresnel,id:355,x:32754,y:32637,varname:node_355,prsc:2|EXP-9649-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9649,x:32557,y:32654,ptovrint:False,ptlb:node_9649,ptin:_node_9649,varname:node_9649,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Add,id:9178,x:33003,y:32850,varname:node_9178,prsc:2|A-5868-OUT,B-5383-OUT;n:type:ShaderForge.SFN_Add,id:870,x:33159,y:32978,varname:node_870,prsc:2|A-355-OUT,B-4511-R;n:type:ShaderForge.SFN_Multiply,id:5868,x:32975,y:32588,varname:node_5868,prsc:2|A-9786-RGB,B-355-OUT;n:type:ShaderForge.SFN_Color,id:9786,x:32654,y:32369,ptovrint:False,ptlb:node_9786,ptin:_node_9786,varname:node_9786,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9926471,c2:0.9312358,c3:0.1021842,c4:1;proporder:4511-9649-9786;pass:END;sub:END;*/

Shader "Shader Forge/yetipaodan" {
    Properties {
        _node_4511 ("node_4511", 2D) = "white" {}
        _node_9649 ("node_9649", Float ) = 2
        _node_9786 ("node_9786", Color) = (0.9926471,0.9312358,0.1021842,1)
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
            uniform sampler2D _node_4511; uniform float4 _node_4511_ST;
            uniform float _node_9649;
            uniform float4 _node_9786;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_9021 = _Time;
                float2 node_5839 = (o.uv0+node_9021.g*float2(0.1,0.2));
                float4 _node_4511_var = tex2Dlod(_node_4511,float4(TRANSFORM_TEX(node_5839, _node_4511),0.0,0));
                float node_4494 = (_node_4511_var.r*0.01);
                v.vertex.xyz += float3(node_4494,node_4494,node_4494);
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
                float node_355 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_node_9649);
                float4 node_9021 = _Time;
                float2 node_5839 = (i.uv0+node_9021.g*float2(0.1,0.2));
                float4 _node_4511_var = tex2D(_node_4511,TRANSFORM_TEX(node_5839, _node_4511));
                float3 emissive = ((_node_9786.rgb*node_355)+(i.vertexColor.rgb*_node_4511_var.r));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*(node_355+_node_4511_var.r)));
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
            uniform sampler2D _node_4511; uniform float4 _node_4511_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_906 = _Time;
                float2 node_5839 = (o.uv0+node_906.g*float2(0.1,0.2));
                float4 _node_4511_var = tex2Dlod(_node_4511,float4(TRANSFORM_TEX(node_5839, _node_4511),0.0,0));
                float node_4494 = (_node_4511_var.r*0.01);
                v.vertex.xyz += float3(node_4494,node_4494,node_4494);
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
