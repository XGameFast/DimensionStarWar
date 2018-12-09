// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33449,y:32504,varname:node_9361,prsc:2|custl-8098-OUT;n:type:ShaderForge.SFN_Tex2d,id:2169,x:32564,y:32698,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2169,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-6121-UVOUT;n:type:ShaderForge.SFN_Panner,id:6121,x:32401,y:32698,varname:node_6121,prsc:2,spu:0.3,spv:0.5|UVIN-3159-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3159,x:32222,y:32698,varname:node_3159,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Fresnel,id:4774,x:32401,y:32485,varname:node_4774,prsc:2|EXP-1924-OUT;n:type:ShaderForge.SFN_Vector1,id:1924,x:32207,y:32505,varname:node_1924,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:5324,x:32951,y:32674,varname:node_5324,prsc:2|A-5306-OUT,B-4246-OUT;n:type:ShaderForge.SFN_Multiply,id:5306,x:32753,y:32442,varname:node_5306,prsc:2|A-2039-RGB,B-4774-OUT;n:type:ShaderForge.SFN_Color,id:2039,x:32417,y:32340,ptovrint:False,ptlb:F color,ptin:_Fcolor,varname:node_2039,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07352942,c2:0.1565921,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:4246,x:32763,y:32698,varname:node_4246,prsc:2|A-2169-R,B-6863-RGB,C-1252-OUT;n:type:ShaderForge.SFN_VertexColor,id:6863,x:32564,y:32885,varname:node_6863,prsc:2;n:type:ShaderForge.SFN_Step,id:8388,x:32881,y:33062,varname:node_8388,prsc:2|A-8592-R,B-6863-A;n:type:ShaderForge.SFN_Tex2d,id:8592,x:32564,y:33084,ptovrint:False,ptlb:rongjie tex,ptin:_rongjietex,varname:node_8592,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:932fd8666f6371942b60dbf63277dc8c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8098,x:33129,y:32674,varname:node_8098,prsc:2|A-5324-OUT,B-9780-OUT,C-8388-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9780,x:32931,y:32516,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_9780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_OneMinus,id:1252,x:32588,y:32505,varname:node_1252,prsc:2|IN-4774-OUT;proporder:2169-2039-8592-9780;pass:END;sub:END;*/

Shader "Shader Forge/chuxian2" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Fcolor ("F color", Color) = (0.07352942,0.1565921,1,1)
        _rongjietex ("rongjie tex", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Fcolor;
            uniform sampler2D _rongjietex; uniform float4 _rongjietex_ST;
            uniform float _Intensity;
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
                float node_4774 = pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0);
                float4 node_3645 = _Time;
                float2 node_6121 = (i.uv0+node_3645.g*float2(0.3,0.5));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_6121, _MainTex));
                float4 _rongjietex_var = tex2D(_rongjietex,TRANSFORM_TEX(i.uv0, _rongjietex));
                float node_8388 = step(_rongjietex_var.r,i.vertexColor.a);
                float3 finalColor = (((_Fcolor.rgb*node_4774)+(_MainTex_var.r*i.vertexColor.rgb*(1.0 - node_4774)))*_Intensity*node_8388);
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
