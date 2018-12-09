// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33667,y:32558,varname:node_9361,prsc:2|custl-4413-OUT,alpha-1233-OUT;n:type:ShaderForge.SFN_Color,id:6794,x:33093,y:33093,ptovrint:False,ptlb:bianse,ptin:_bianse,varname:node_6794,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1470588,c2:0.7882354,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2581,x:32505,y:32877,ptovrint:False,ptlb:node_2581,ptin:_node_2581,varname:node_2581,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:59b9b262ac496a849b61896382b2ef34,ntxv:0,isnm:False|UVIN-7060-UVOUT;n:type:ShaderForge.SFN_Panner,id:7060,x:32330,y:32877,varname:node_7060,prsc:2,spu:0,spv:-1|UVIN-6141-UVOUT,DIST-5425-OUT;n:type:ShaderForge.SFN_TexCoord,id:6141,x:32130,y:32877,varname:node_6141,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:2645,x:32507,y:33196,ptovrint:False,ptlb:node_2645,ptin:_node_2645,varname:node_2645,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:26d7625faa637844b905fdd0bd863fc8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2568,x:32693,y:33194,varname:node_2568,prsc:2|A-2581-R,B-2645-R;n:type:ShaderForge.SFN_Step,id:276,x:32873,y:33393,varname:node_276,prsc:2|A-4033-OUT,B-2568-OUT;n:type:ShaderForge.SFN_Add,id:4033,x:32693,y:33393,varname:node_4033,prsc:2|A-3700-A,B-1535-OUT;n:type:ShaderForge.SFN_Vector1,id:1535,x:32514,y:33443,varname:node_1535,prsc:2,v1:0.02;n:type:ShaderForge.SFN_Subtract,id:5217,x:33093,y:33249,varname:node_5217,prsc:2|A-1233-OUT,B-276-OUT;n:type:ShaderForge.SFN_Multiply,id:3065,x:33261,y:33218,varname:node_3065,prsc:2|A-6794-RGB,B-5217-OUT;n:type:ShaderForge.SFN_VertexColor,id:3700,x:32418,y:32553,varname:node_3700,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1188,x:33160,y:32796,varname:node_1188,prsc:2|A-3700-RGB,B-2581-R,C-9713-OUT;n:type:ShaderForge.SFN_Add,id:4413,x:33412,y:32796,varname:node_4413,prsc:2|A-1188-OUT,B-3065-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9713,x:32902,y:32607,ptovrint:False,ptlb:zhuse,ptin:_zhuse,varname:node_9713,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_RemapRange,id:5425,x:32130,y:32722,varname:node_5425,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:0|IN-3700-A;n:type:ShaderForge.SFN_If,id:1233,x:32906,y:33178,varname:node_1233,prsc:2|A-3700-A,B-2568-OUT,GT-6911-OUT,EQ-6911-OUT,LT-1055-OUT;n:type:ShaderForge.SFN_Vector1,id:6911,x:32693,y:33303,varname:node_6911,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:1055,x:32693,y:33148,varname:node_1055,prsc:2,v1:1;proporder:6794-2581-2645-9713;pass:END;sub:END;*/

Shader "Shader Forge/quxianrongjie" {
    Properties {
        [HDR]_bianse ("bianse", Color) = (0.1470588,0.7882354,1,1)
        _node_2581 ("node_2581", 2D) = "white" {}
        _node_2645 ("node_2645", 2D) = "white" {}
        _zhuse ("zhuse", Float ) = 1
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
            uniform float4 _bianse;
            uniform sampler2D _node_2581; uniform float4 _node_2581_ST;
            uniform sampler2D _node_2645; uniform float4 _node_2645_ST;
            uniform float _zhuse;
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
                float2 node_7060 = (i.uv0+(i.vertexColor.a*1.0+-1.0)*float2(0,-1));
                float4 _node_2581_var = tex2D(_node_2581,TRANSFORM_TEX(node_7060, _node_2581));
                float4 _node_2645_var = tex2D(_node_2645,TRANSFORM_TEX(i.uv0, _node_2645));
                float node_2568 = (_node_2581_var.r*_node_2645_var.r);
                float node_1233_if_leA = step(i.vertexColor.a,node_2568);
                float node_1233_if_leB = step(node_2568,i.vertexColor.a);
                float node_6911 = 0.0;
                float node_1233 = lerp((node_1233_if_leA*1.0)+(node_1233_if_leB*node_6911),node_6911,node_1233_if_leA*node_1233_if_leB);
                float3 finalColor = ((i.vertexColor.rgb*_node_2581_var.r*_zhuse)+(_bianse.rgb*(node_1233-step((i.vertexColor.a+0.02),node_2568))));
                fixed4 finalRGBA = fixed4(finalColor,node_1233);
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
