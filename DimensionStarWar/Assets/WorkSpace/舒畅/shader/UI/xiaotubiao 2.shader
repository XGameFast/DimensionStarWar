// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32999,y:32618,varname:node_9361,prsc:2|custl-8110-OUT,alpha-6024-OUT;n:type:ShaderForge.SFN_Tex2d,id:6606,x:32096,y:32689,ptovrint:False,ptlb:node_6606,ptin:_node_6606,varname:node_6606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c601fb6ef0c67114b9a837e90c8a6d50,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:3765,x:31822,y:32735,varname:node_3765,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Step,id:2303,x:32096,y:32919,varname:node_2303,prsc:2|A-8555-A,B-3765-V;n:type:ShaderForge.SFN_Multiply,id:1338,x:32304,y:32858,varname:node_1338,prsc:2|A-6606-R,B-2303-OUT;n:type:ShaderForge.SFN_Multiply,id:1733,x:32547,y:32763,varname:node_1733,prsc:2|A-8991-RGB,B-1338-OUT;n:type:ShaderForge.SFN_Color,id:8991,x:32304,y:32689,ptovrint:False,ptlb:node_8991,ptin:_node_8991,varname:node_8991,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.05147058,c2:0.6860043,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:8555,x:31822,y:32937,varname:node_8555,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3543,x:32558,y:32920,varname:node_3543,prsc:2|A-1338-OUT,B-3094-OUT;n:type:ShaderForge.SFN_RemapRange,id:3094,x:32159,y:33048,varname:node_3094,prsc:2,frmn:0,frmx:1,tomn:0,tomx:5|IN-8555-A;n:type:ShaderForge.SFN_Clamp01,id:6024,x:32716,y:32920,varname:node_6024,prsc:2|IN-3543-OUT;n:type:ShaderForge.SFN_Multiply,id:1917,x:32467,y:32384,varname:node_1917,prsc:2|A-1173-OUT,B-8991-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:6468,x:31616,y:32367,ptovrint:False,ptlb:node_6468,ptin:_node_6468,varname:node_6468,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fb1157b277e3f9b4092bfb20083b039e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:5497,x:31358,y:32359,varname:node_5497,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:2086,x:31616,y:32196,varname:node_2086,prsc:2,spu:0,spv:0.2|UVIN-5497-UVOUT;n:type:ShaderForge.SFN_Panner,id:9063,x:31616,y:32536,varname:node_9063,prsc:2,spu:0,spv:-0.1|UVIN-5497-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9044,x:31777,y:32224,varname:node_9044,prsc:2,tex:fb1157b277e3f9b4092bfb20083b039e,ntxv:0,isnm:False|UVIN-2086-UVOUT,TEX-6468-TEX;n:type:ShaderForge.SFN_Tex2d,id:3458,x:31785,y:32521,varname:node_3458,prsc:2,tex:fb1157b277e3f9b4092bfb20083b039e,ntxv:0,isnm:False|UVIN-9063-UVOUT,TEX-6468-TEX;n:type:ShaderForge.SFN_Add,id:1173,x:31969,y:32313,varname:node_1173,prsc:2|A-9044-R,B-3458-R;n:type:ShaderForge.SFN_Add,id:8110,x:32729,y:32440,varname:node_8110,prsc:2|A-1917-OUT,B-8738-OUT;n:type:ShaderForge.SFN_Multiply,id:8738,x:32547,y:32532,varname:node_8738,prsc:2|A-8991-RGB,B-7004-OUT;n:type:ShaderForge.SFN_Vector1,id:7004,x:32374,y:32579,varname:node_7004,prsc:2,v1:0.5;proporder:6606-8991-6468;pass:END;sub:END;*/

Shader "Shader Forge/xiaotubiao 2" {
    Properties {
        _node_6606 ("node_6606", 2D) = "white" {}
        [HDR]_node_8991 ("node_8991", Color) = (0.05147058,0.6860043,1,1)
        _node_6468 ("node_6468", 2D) = "white" {}
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
            uniform sampler2D _node_6606; uniform float4 _node_6606_ST;
            uniform float4 _node_8991;
            uniform sampler2D _node_6468; uniform float4 _node_6468_ST;
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
                float4 node_2679 = _Time;
                float2 node_2086 = (i.uv0+node_2679.g*float2(0,0.2));
                float4 node_9044 = tex2D(_node_6468,TRANSFORM_TEX(node_2086, _node_6468));
                float2 node_9063 = (i.uv0+node_2679.g*float2(0,-0.1));
                float4 node_3458 = tex2D(_node_6468,TRANSFORM_TEX(node_9063, _node_6468));
                float3 finalColor = (((node_9044.r+node_3458.r)*_node_8991.rgb)+(_node_8991.rgb*0.5));
                float4 _node_6606_var = tex2D(_node_6606,TRANSFORM_TEX(i.uv0, _node_6606));
                float node_1338 = (_node_6606_var.r*step(i.vertexColor.a,i.uv0.g));
                fixed4 finalRGBA = fixed4(finalColor,saturate((node_1338*(i.vertexColor.a*5.0+0.0))));
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
