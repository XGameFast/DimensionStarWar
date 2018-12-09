// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34172,y:32726,varname:node_4013,prsc:2|custl-7543-OUT,alpha-1571-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:9216,x:32492,y:33015,ptovrint:False,ptlb:niuqu,ptin:_niuqu,varname:node_9216,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f6da0f1d159175148aaf4f33905b3f4d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1717,x:32718,y:32856,varname:node_1717,prsc:2,tex:f6da0f1d159175148aaf4f33905b3f4d,ntxv:0,isnm:False|UVIN-1273-UVOUT,TEX-9216-TEX;n:type:ShaderForge.SFN_Panner,id:1273,x:32523,y:32831,varname:node_1273,prsc:2,spu:0,spv:0.5|UVIN-1156-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1156,x:32273,y:33134,varname:node_1156,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:98,x:32961,y:33175,varname:node_98,prsc:2|A-1156-UVOUT,B-6005-OUT;n:type:ShaderForge.SFN_Vector2,id:6005,x:32727,y:33313,varname:node_6005,prsc:2,v1:2,v2:1;n:type:ShaderForge.SFN_Tex2d,id:9844,x:32716,y:33175,varname:node_9844,prsc:2,tex:f6da0f1d159175148aaf4f33905b3f4d,ntxv:0,isnm:False|UVIN-4650-UVOUT,TEX-9216-TEX;n:type:ShaderForge.SFN_Panner,id:4650,x:32523,y:33175,varname:node_4650,prsc:2,spu:0.4,spv:0.3|UVIN-1156-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1024,x:33612,y:32746,varname:node_1024,prsc:2|A-775-OUT,B-2851-RGB;n:type:ShaderForge.SFN_Multiply,id:4732,x:32944,y:33008,varname:node_4732,prsc:2|A-1717-R,B-9844-R,C-6399-OUT;n:type:ShaderForge.SFN_Add,id:8748,x:33122,y:33008,varname:node_8748,prsc:2|A-4732-OUT,B-98-OUT;n:type:ShaderForge.SFN_Tex2d,id:2851,x:33439,y:33008,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-9439-UVOUT;n:type:ShaderForge.SFN_Slider,id:6399,x:32637,y:33048,ptovrint:False,ptlb:niuqu intensity,ptin:_niuquintensity,varname:node_6399,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3385526,max:1;n:type:ShaderForge.SFN_Panner,id:9439,x:33281,y:33008,varname:node_9439,prsc:2,spu:0,spv:1|UVIN-8748-OUT;n:type:ShaderForge.SFN_Tex2d,id:7124,x:33439,y:33194,ptovrint:False,ptlb:node_7124,ptin:_node_7124,varname:node_7124,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:82e75f6610e79124cb134867c1ed6d53,ntxv:0,isnm:False|UVIN-3498-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8938,x:33644,y:33111,varname:node_8938,prsc:2|A-2851-B,B-7124-R;n:type:ShaderForge.SFN_TexCoord,id:3498,x:33268,y:33194,varname:node_3498,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:775,x:33404,y:32756,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_775,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:1571,x:33833,y:33111,varname:node_1571,prsc:2|A-8938-OUT,B-7124-R;n:type:ShaderForge.SFN_Add,id:7543,x:33910,y:32757,varname:node_7543,prsc:2|A-1024-OUT,B-3721-OUT;n:type:ShaderForge.SFN_Multiply,id:3721,x:33751,y:32945,varname:node_3721,prsc:2|A-6206-RGB,B-7124-R;n:type:ShaderForge.SFN_Color,id:6206,x:33321,y:32814,ptovrint:False,ptlb:node_6206,ptin:_node_6206,varname:node_6206,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1766497,c2:0.1498702,c3:0.9264706,c4:1;n:type:ShaderForge.SFN_Multiply,id:9856,x:34034,y:33125,varname:node_9856,prsc:2|A-1571-OUT,B-797-A;n:type:ShaderForge.SFN_VertexColor,id:797,x:33833,y:33264,varname:node_797,prsc:2;proporder:9216-2851-6399-7124-775-6206;pass:END;sub:END;*/

Shader "Shader Forge/shanbi2 shou" {
    Properties {
        _niuqu ("niuqu", 2D) = "white" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _niuquintensity ("niuqu intensity", Range(0, 1)) = 0.3385526
        _node_7124 ("node_7124", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
        _node_6206 ("node_6206", Color) = (0.1766497,0.1498702,0.9264706,1)
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
            uniform sampler2D _niuqu; uniform float4 _niuqu_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _niuquintensity;
            uniform sampler2D _node_7124; uniform float4 _node_7124_ST;
            uniform float _Intensity;
            uniform float4 _node_6206;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_2908 = _Time;
                float2 node_1273 = (i.uv0+node_2908.g*float2(0,0.5));
                float4 node_1717 = tex2D(_niuqu,TRANSFORM_TEX(node_1273, _niuqu));
                float2 node_4650 = (i.uv0+node_2908.g*float2(0.4,0.3));
                float4 node_9844 = tex2D(_niuqu,TRANSFORM_TEX(node_4650, _niuqu));
                float2 node_9439 = (((node_1717.r*node_9844.r*_niuquintensity)+(i.uv0*float2(2,1)))+node_2908.g*float2(0,1));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_9439, _MainTex));
                float4 _node_7124_var = tex2D(_node_7124,TRANSFORM_TEX(i.uv1, _node_7124));
                float3 finalColor = ((_Intensity*_MainTex_var.rgb)+(_node_6206.rgb*_node_7124_var.r));
                float node_1571 = ((_MainTex_var.b*_node_7124_var.r)+_node_7124_var.r);
                fixed4 finalRGBA = fixed4(finalColor,node_1571);
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
