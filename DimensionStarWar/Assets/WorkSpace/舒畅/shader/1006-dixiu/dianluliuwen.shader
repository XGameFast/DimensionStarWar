// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33121,y:32249,varname:node_9361,prsc:2|custl-6056-OUT,alpha-5024-OUT;n:type:ShaderForge.SFN_Tex2d,id:4116,x:32424,y:32480,ptovrint:False,ptlb:node_4116,ptin:_node_4116,varname:node_4116,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:612e9622ec6a22145876c4247f72348d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4389,x:31136,y:32865,varname:node_4389,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Subtract,id:660,x:31338,y:32865,varname:node_660,prsc:2|A-4389-UVOUT,B-8594-OUT;n:type:ShaderForge.SFN_Divide,id:2849,x:31520,y:32986,varname:node_2849,prsc:2|A-660-OUT,B-2763-OUT;n:type:ShaderForge.SFN_Add,id:4371,x:31734,y:32865,varname:node_4371,prsc:2|A-4389-UVOUT,B-2849-OUT;n:type:ShaderForge.SFN_Lerp,id:8674,x:31914,y:32865,varname:node_8674,prsc:2|A-4371-OUT,B-8594-OUT,T-2763-OUT;n:type:ShaderForge.SFN_Clamp01,id:810,x:32111,y:32865,varname:node_810,prsc:2|IN-8674-OUT;n:type:ShaderForge.SFN_Vector1,id:8594,x:31124,y:33026,varname:node_8594,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:5024,x:32715,y:32634,varname:node_5024,prsc:2|A-4116-B,B-1640-R;n:type:ShaderForge.SFN_Multiply,id:6056,x:32726,y:32306,varname:node_6056,prsc:2|A-7359-RGB,B-4116-B,C-4868-OUT;n:type:ShaderForge.SFN_VertexColor,id:7359,x:31906,y:32292,varname:node_7359,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:4868,x:32424,y:32256,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_4868,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2dAsset,id:6261,x:32111,y:33015,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_6261,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2ba03e988ef7eca45ae9f6cb74bb3a01,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1640,x:32414,y:32709,varname:node_1640,prsc:2,tex:2ba03e988ef7eca45ae9f6cb74bb3a01,ntxv:0,isnm:False|UVIN-810-OUT,TEX-6261-TEX;n:type:ShaderForge.SFN_Vector1,id:1380,x:31226,y:33410,varname:node_1380,prsc:2,v1:-0.4;n:type:ShaderForge.SFN_RemapRange,id:2763,x:30858,y:33139,varname:node_2763,prsc:2,frmn:0,frmx:1,tomn:0.06,tomx:1|IN-7359-A;proporder:4116-4868-6261;pass:END;sub:END;*/

Shader "Shader Forge/dianluliuwen" {
    Properties {
        _node_4116 ("node_4116", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
        _Mask ("Mask", 2D) = "white" {}
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
            uniform sampler2D _node_4116; uniform float4 _node_4116_ST;
            uniform float _Intensity;
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
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
                float4 _node_4116_var = tex2D(_node_4116,TRANSFORM_TEX(i.uv0, _node_4116));
                float3 finalColor = (i.vertexColor.rgb*_node_4116_var.b*_Intensity);
                float node_8594 = 0.5;
                float node_2763 = (i.vertexColor.a*0.94+0.06);
                float2 node_810 = saturate(lerp((i.uv0+((i.uv0-node_8594)/node_2763)),float2(node_8594,node_8594),node_2763));
                float4 node_1640 = tex2D(_Mask,TRANSFORM_TEX(node_810, _Mask));
                fixed4 finalRGBA = fixed4(finalColor,(_node_4116_var.b*node_1640.r));
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
