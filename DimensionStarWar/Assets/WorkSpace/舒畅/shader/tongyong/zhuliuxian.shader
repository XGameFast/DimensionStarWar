// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33947,y:32648,varname:node_9361,prsc:2|custl-3460-OUT,alpha-7648-OUT;n:type:ShaderForge.SFN_Panner,id:7727,x:32690,y:32932,varname:node_7727,prsc:2,spu:1,spv:0|UVIN-5355-UVOUT,DIST-5227-OUT;n:type:ShaderForge.SFN_TexCoord,id:5355,x:32484,y:32932,varname:node_5355,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:2234,x:32690,y:32776,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2234,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:406c7f69df15daa4081b82605d91cceb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:128,x:32916,y:32610,varname:node_128,prsc:2,tex:406c7f69df15daa4081b82605d91cceb,ntxv:0,isnm:False|UVIN-8235-UVOUT,TEX-2234-TEX;n:type:ShaderForge.SFN_Tex2d,id:2464,x:32929,y:32932,varname:node_2464,prsc:2,tex:406c7f69df15daa4081b82605d91cceb,ntxv:0,isnm:False|UVIN-7727-UVOUT,TEX-2234-TEX;n:type:ShaderForge.SFN_Panner,id:8235,x:32690,y:32610,varname:node_8235,prsc:2,spu:0.8,spv:0.1|UVIN-5513-UVOUT,DIST-5227-OUT;n:type:ShaderForge.SFN_TexCoord,id:5513,x:32491,y:32610,varname:node_5513,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:7216,x:33112,y:32779,varname:node_7216,prsc:2|A-128-R,B-2464-R;n:type:ShaderForge.SFN_VertexColor,id:674,x:33231,y:32980,varname:node_674,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7648,x:33504,y:33029,varname:node_7648,prsc:2|A-7216-OUT,B-674-A,C-7138-OUT;n:type:ShaderForge.SFN_Multiply,id:3460,x:33538,y:32615,varname:node_3460,prsc:2|A-5373-RGB,B-7216-OUT;n:type:ShaderForge.SFN_Color,id:5373,x:33243,y:32503,ptovrint:False,ptlb:main color,ptin:_maincolor,varname:node_5373,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1764706,c2:0.5229208,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:7138,x:33344,y:33182,varname:node_7138,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:429,x:31905,y:32844,ptovrint:False,ptlb:liudong,ptin:_liudong,varname:node_429,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_RemapRange,id:5227,x:32290,y:32773,varname:node_5227,prsc:2,frmn:0,frmx:1,tomn:-0.6,tomx:1.2|IN-429-OUT;proporder:2234-5373-429;pass:END;sub:END;*/

Shader "Shader Forge/zhuliuxian" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_maincolor ("main color", Color) = (0.1764706,0.5229208,1,1)
        _liudong ("liudong", Range(0, 1)) = 0
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
            uniform float4 _maincolor;
            uniform float _liudong;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float node_5227 = (_liudong*1.8+-0.6);
                float2 node_8235 = (i.uv0+node_5227*float2(0.8,0.1));
                float4 node_128 = tex2D(_MainTex,TRANSFORM_TEX(node_8235, _MainTex));
                float2 node_7727 = (i.uv0+node_5227*float2(1,0));
                float4 node_2464 = tex2D(_MainTex,TRANSFORM_TEX(node_7727, _MainTex));
                float node_7216 = (node_128.r+node_2464.r);
                float3 finalColor = (_maincolor.rgb*node_7216);
                fixed4 finalRGBA = fixed4(finalColor,(node_7216*i.vertexColor.a*2.0));
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
