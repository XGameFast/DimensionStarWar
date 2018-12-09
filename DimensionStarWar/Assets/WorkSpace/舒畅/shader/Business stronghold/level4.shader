// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33353,y:32661,varname:node_4013,prsc:2|custl-3660-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32635,y:32839,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.7124746,c3:0.4044118,c4:1;n:type:ShaderForge.SFN_Fresnel,id:4123,x:32706,y:32659,varname:node_4123,prsc:2|EXP-3257-OUT;n:type:ShaderForge.SFN_Vector1,id:3257,x:32515,y:32711,varname:node_3257,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5527,x:32879,y:32805,varname:node_5527,prsc:2|A-4123-OUT,B-1304-RGB;n:type:ShaderForge.SFN_Tex2d,id:1300,x:32814,y:33008,ptovrint:False,ptlb:node_1300,ptin:_node_1300,varname:node_1300,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:98be3e3be282ea14a81651a6f5d39bf6,ntxv:0,isnm:False|UVIN-2569-UVOUT;n:type:ShaderForge.SFN_Add,id:3660,x:33192,y:32897,varname:node_3660,prsc:2|A-5527-OUT,B-9740-OUT;n:type:ShaderForge.SFN_TexCoord,id:338,x:32441,y:33008,varname:node_338,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:2569,x:32635,y:33008,varname:node_2569,prsc:2,spu:0.3,spv:0|UVIN-338-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9740,x:33039,y:33037,varname:node_9740,prsc:2|A-1300-RGB,B-1641-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1641,x:32826,y:33203,ptovrint:False,ptlb:wenli Intensity,ptin:_wenliIntensity,varname:node_1641,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;proporder:1304-1300-1641;pass:END;sub:END;*/

Shader "Shader Forge/level4" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,0.7124746,0.4044118,1)
        _node_1300 ("node_1300", 2D) = "white" {}
        _wenliIntensity ("wenli Intensity", Float ) = 2
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
            Blend One One
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
            uniform sampler2D _node_1300; uniform float4 _node_1300_ST;
            uniform float _wenliIntensity;
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
                float4 node_3902 = _Time;
                float2 node_2569 = (i.uv0+node_3902.g*float2(0.3,0));
                float4 _node_1300_var = tex2D(_node_1300,TRANSFORM_TEX(node_2569, _node_1300));
                float3 finalColor = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_Color.rgb)+(_node_1300_var.rgb*_wenliIntensity));
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
