// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33669,y:32575,varname:node_9361,prsc:2|custl-3460-OUT,alpha-3407-OUT;n:type:ShaderForge.SFN_Panner,id:8235,x:32934,y:32679,varname:node_8235,prsc:2,spu:0.8,spv:0.1|UVIN-5513-UVOUT,DIST-8262-OUT;n:type:ShaderForge.SFN_TexCoord,id:5513,x:32755,y:32679,varname:node_5513,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_VertexColor,id:674,x:32786,y:33026,varname:node_674,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3460,x:33369,y:32731,varname:node_3460,prsc:2|A-5373-RGB,B-4312-R,C-7138-OUT;n:type:ShaderForge.SFN_Color,id:5373,x:33181,y:32507,ptovrint:False,ptlb:main color,ptin:_maincolor,varname:node_5373,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1764706,c2:0.5229208,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:7138,x:33109,y:32840,varname:node_7138,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Tex2d,id:4312,x:33109,y:32679,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4312,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4a6627ef815d26349804788987dfd74a,ntxv:0,isnm:False|UVIN-8235-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:8262,x:32755,y:32837,varname:node_8262,prsc:2,frmn:0,frmx:1,tomn:-1.4,tomx:1|IN-7140-OUT;n:type:ShaderForge.SFN_Slider,id:7140,x:32390,y:32950,ptovrint:False,ptlb:node_7140,ptin:_node_7140,varname:node_7140,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:3407,x:33389,y:32940,varname:node_3407,prsc:2|A-4312-R,B-674-A;proporder:5373-4312-7140;pass:END;sub:END;*/

Shader "Shader Forge/zhuliuxian 1" {
    Properties {
        [HDR]_maincolor ("main color", Color) = (0.1764706,0.5229208,1,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _node_7140 ("node_7140", Range(0, 1)) = 0
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
            uniform float4 _maincolor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _node_7140;
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
                float2 node_8235 = (i.uv0+(_node_7140*2.4+-1.4)*float2(0.8,0.1));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_8235, _MainTex));
                float3 finalColor = (_maincolor.rgb*_MainTex_var.r*1.5);
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.r*i.vertexColor.a));
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
