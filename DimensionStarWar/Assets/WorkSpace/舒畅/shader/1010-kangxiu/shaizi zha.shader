// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33314,y:32718,varname:node_4013,prsc:2|emission-3692-OUT,alpha-6013-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32422,y:32659,ptovrint:False,ptlb:shuzi,ptin:_shuzi,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6031,x:32241,y:32795,ptovrint:False,ptlb:node_6031,ptin:_node_6031,varname:node_6031,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7f4c6e8d0424d8d4fa8937f3b8bd1688,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5651,x:32614,y:32784,varname:node_5651,prsc:2|A-1304-RGB,B-6031-R;n:type:ShaderForge.SFN_OneMinus,id:76,x:32413,y:32955,varname:node_76,prsc:2|IN-6031-R;n:type:ShaderForge.SFN_Multiply,id:3008,x:32666,y:32955,varname:node_3008,prsc:2|A-76-OUT,B-4322-RGB,C-1305-OUT,D-1818-OUT;n:type:ShaderForge.SFN_Add,id:3692,x:32913,y:32818,varname:node_3692,prsc:2|A-5651-OUT,B-3008-OUT;n:type:ShaderForge.SFN_VertexColor,id:4322,x:32598,y:33410,varname:node_4322,prsc:2;n:type:ShaderForge.SFN_Fresnel,id:1305,x:32324,y:33147,varname:node_1305,prsc:2|EXP-2901-OUT;n:type:ShaderForge.SFN_Vector1,id:2901,x:32148,y:33162,varname:node_2901,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Multiply,id:6013,x:33070,y:33128,varname:node_6013,prsc:2|A-3845-OUT,B-4322-A;n:type:ShaderForge.SFN_Add,id:3845,x:32769,y:33125,varname:node_3845,prsc:2|A-6031-R,B-1305-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1818,x:32430,y:33266,ptovrint:False,ptlb:shaimianqiangdu,ptin:_shaimianqiangdu,varname:node_1818,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1304-6031-1818;pass:END;sub:END;*/

Shader "Shader Forge/shaizi zha" {
    Properties {
        [HDR]_shuzi ("shuzi", Color) = (1,1,1,1)
        _node_6031 ("node_6031", 2D) = "white" {}
        _shaimianqiangdu ("shaimianqiangdu", Float ) = 1
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
            uniform float4 _shuzi;
            uniform sampler2D _node_6031; uniform float4 _node_6031_ST;
            uniform float _shaimianqiangdu;
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
                float4 _node_6031_var = tex2D(_node_6031,TRANSFORM_TEX(i.uv0, _node_6031));
                float node_1305 = pow(1.0-max(0,dot(normalDirection, viewDirection)),0.7);
                float3 emissive = ((_shuzi.rgb*_node_6031_var.r)+((1.0 - _node_6031_var.r)*i.vertexColor.rgb*node_1305*_shaimianqiangdu));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,((_node_6031_var.r+node_1305)*i.vertexColor.a));
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
