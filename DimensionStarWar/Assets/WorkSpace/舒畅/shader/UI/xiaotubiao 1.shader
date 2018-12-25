// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33512,y:32536,varname:node_9361,prsc:2|custl-3146-OUT;n:type:ShaderForge.SFN_Panner,id:3224,x:32244,y:32761,varname:node_3224,prsc:2,spu:0,spv:-1|UVIN-3573-UVOUT,DIST-1866-OUT;n:type:ShaderForge.SFN_TexCoord,id:3573,x:32032,y:32761,varname:node_3573,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:3100,x:32410,y:32761,ptovrint:False,ptlb:node_3100,ptin:_node_3100,varname:node_3100,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4ec3ba2206e8ced469331ebac4ceae79,ntxv:0,isnm:False|UVIN-3224-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4649,x:32735,y:32665,varname:node_4649,prsc:2|A-1235-R,B-2103-OUT;n:type:ShaderForge.SFN_RemapRange,id:1866,x:32047,y:32906,varname:node_1866,prsc:2,frmn:0,frmx:1,tomn:-0.7,tomx:0.7|IN-5159-A;n:type:ShaderForge.SFN_Color,id:8585,x:32773,y:32842,ptovrint:False,ptlb:liudong color,ptin:_liudongcolor,varname:node_8585,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.6275859,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3146,x:32933,y:32744,varname:node_3146,prsc:2|A-4649-OUT,B-8585-RGB;n:type:ShaderForge.SFN_VertexColor,id:5159,x:31810,y:32948,varname:node_5159,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:1235,x:32410,y:32570,ptovrint:False,ptlb:node_1235,ptin:_node_1235,varname:node_1235,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9799411ffa48f1d4083732e4c9f4159c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Power,id:2103,x:32585,y:32778,varname:node_2103,prsc:2|VAL-3100-R,EXP-230-OUT;n:type:ShaderForge.SFN_Vector1,id:230,x:32432,y:32976,varname:node_230,prsc:2,v1:2;proporder:3100-8585-1235;pass:END;sub:END;*/

Shader "Shader Forge/xiaotubiao 1" {
    Properties {
        _node_3100 ("node_3100", 2D) = "white" {}
        [HDR]_liudongcolor ("liudong color", Color) = (0,0.6275859,1,1)
        _node_1235 ("node_1235", 2D) = "white" {}
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
            uniform sampler2D _node_3100; uniform float4 _node_3100_ST;
            uniform float4 _liudongcolor;
            uniform sampler2D _node_1235; uniform float4 _node_1235_ST;
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
                float4 _node_1235_var = tex2D(_node_1235,TRANSFORM_TEX(i.uv0, _node_1235));
                float2 node_3224 = (i.uv0+(i.vertexColor.a*1.4+-0.7)*float2(0,-1));
                float4 _node_3100_var = tex2D(_node_3100,TRANSFORM_TEX(node_3224, _node_3100));
                float3 finalColor = ((_node_1235_var.r*pow(_node_3100_var.r,2.0))*_liudongcolor.rgb);
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
