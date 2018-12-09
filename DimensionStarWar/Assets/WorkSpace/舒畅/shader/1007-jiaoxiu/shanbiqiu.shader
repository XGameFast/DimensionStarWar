// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33367,y:32717,varname:node_9361,prsc:2|custl-6825-OUT,alpha-3068-OUT;n:type:ShaderForge.SFN_Tex2d,id:8891,x:32186,y:32966,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8891,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a12a870693898be4e82d880524c9a7cf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:395,x:32446,y:32664,varname:node_395,prsc:2|EXP-7122-OUT;n:type:ShaderForge.SFN_Vector1,id:7122,x:32235,y:32726,varname:node_7122,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:9236,x:32708,y:32878,varname:node_9236,prsc:2|A-395-OUT,B-6248-OUT,C-4634-OUT;n:type:ShaderForge.SFN_Tex2d,id:6937,x:32379,y:33154,ptovrint:False,ptlb:liudongTex,ptin:_liudongTex,varname:node_6937,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c4f8ddaa0d3047d4da8657565daad313,ntxv:0,isnm:False|UVIN-4838-UVOUT;n:type:ShaderForge.SFN_Panner,id:2898,x:32042,y:33154,varname:node_2898,prsc:2,spu:0,spv:1|UVIN-7632-UVOUT,DIST-6823-OUT;n:type:ShaderForge.SFN_TexCoord,id:7632,x:31874,y:33154,varname:node_7632,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Rotator,id:4838,x:32212,y:33154,varname:node_4838,prsc:2|UVIN-2898-UVOUT,ANG-2471-OUT;n:type:ShaderForge.SFN_Vector1,id:2471,x:32042,y:33328,varname:node_2471,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:6248,x:32565,y:33016,varname:node_6248,prsc:2|A-8891-R,B-6937-R;n:type:ShaderForge.SFN_Multiply,id:6825,x:33039,y:32748,varname:node_6825,prsc:2|A-9236-OUT,B-5020-RGB,C-5412-OUT;n:type:ShaderForge.SFN_VertexColor,id:5020,x:32238,y:33417,varname:node_5020,prsc:2;n:type:ShaderForge.SFN_Sin,id:6823,x:31773,y:33539,varname:node_6823,prsc:2|IN-1062-TTR;n:type:ShaderForge.SFN_Time,id:1062,x:31548,y:33518,varname:node_1062,prsc:2;n:type:ShaderForge.SFN_Step,id:428,x:32458,y:33441,varname:node_428,prsc:2|A-7632-U,B-5020-A;n:type:ShaderForge.SFN_Multiply,id:3068,x:32955,y:33119,varname:node_3068,prsc:2|A-850-OUT,B-428-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5412,x:32800,y:32680,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_5412,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Fresnel,id:5335,x:32311,y:32458,varname:node_5335,prsc:2|EXP-4171-OUT;n:type:ShaderForge.SFN_Vector1,id:4171,x:32110,y:32492,varname:node_4171,prsc:2,v1:15;n:type:ShaderForge.SFN_Multiply,id:4634,x:32677,y:32487,varname:node_4634,prsc:2|A-5335-OUT,B-8479-OUT;n:type:ShaderForge.SFN_Vector1,id:8479,x:32446,y:32567,varname:node_8479,prsc:2,v1:5;n:type:ShaderForge.SFN_Clamp01,id:850,x:32900,y:32931,varname:node_850,prsc:2|IN-9236-OUT;proporder:8891-6937-5412;pass:END;sub:END;*/

Shader "Shader Forge/shanbiqiu" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _liudongTex ("liudongTex", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _liudongTex; uniform float4 _liudongTex_ST;
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_4838_ang = 0.1;
                float node_4838_spd = 1.0;
                float node_4838_cos = cos(node_4838_spd*node_4838_ang);
                float node_4838_sin = sin(node_4838_spd*node_4838_ang);
                float2 node_4838_piv = float2(0.5,0.5);
                float4 node_1062 = _Time;
                float2 node_4838 = (mul((i.uv0+sin(node_1062.a)*float2(0,1))-node_4838_piv,float2x2( node_4838_cos, -node_4838_sin, node_4838_sin, node_4838_cos))+node_4838_piv);
                float4 _liudongTex_var = tex2D(_liudongTex,TRANSFORM_TEX(node_4838, _liudongTex));
                float node_9236 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0)+(_MainTex_var.r*_liudongTex_var.r)+(pow(1.0-max(0,dot(normalDirection, viewDirection)),15.0)*5.0));
                float3 finalColor = (node_9236*i.vertexColor.rgb*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(saturate(node_9236)*step(i.uv0.r,i.vertexColor.a)));
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
