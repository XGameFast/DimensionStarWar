// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33235,y:32724,varname:node_9361,prsc:2|custl-9378-OUT,alpha-6455-OUT;n:type:ShaderForge.SFN_Tex2d,id:5308,x:32695,y:32790,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5308,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4a6627ef815d26349804788987dfd74a,ntxv:0,isnm:False|UVIN-2332-UVOUT;n:type:ShaderForge.SFN_Panner,id:2332,x:32522,y:32790,varname:node_2332,prsc:2,spu:1,spv:0|UVIN-2236-UVOUT,DIST-3300-OUT;n:type:ShaderForge.SFN_TexCoord,id:2236,x:32317,y:32790,varname:node_2236,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_VertexColor,id:2560,x:32136,y:32942,varname:node_2560,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6455,x:33044,y:33045,varname:node_6455,prsc:2|A-5308-R,B-1490-OUT,C-2560-A;n:type:ShaderForge.SFN_RemapRange,id:3300,x:32317,y:32942,varname:node_3300,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:0.5|IN-2560-A;n:type:ShaderForge.SFN_Multiply,id:9378,x:33044,y:32899,varname:node_9378,prsc:2|A-7966-RGB,B-5308-R;n:type:ShaderForge.SFN_Color,id:7966,x:32706,y:32621,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_7966,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1323529,c2:0.3537524,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:8249,x:32583,y:33055,ptovrint:False,ptlb:node_8249,ptin:_node_8249,varname:node_8249,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1e8549d3af51f054cad7d1e397e92c47,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:1490,x:32763,y:33055,varname:node_1490,prsc:2|IN-8249-R;proporder:5308-7966-8249;pass:END;sub:END;*/

Shader "Shader Forge/luoxuanshengtian" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_MainColor ("Main Color", Color) = (0.1323529,0.3537524,1,1)
        _node_8249 ("node_8249", 2D) = "white" {}
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
            uniform float4 _MainColor;
            uniform sampler2D _node_8249; uniform float4 _node_8249_ST;
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
                float2 node_2332 = (i.uv0+(i.vertexColor.a*1.5+-1.0)*float2(1,0));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2332, _MainTex));
                float3 finalColor = (_MainColor.rgb*_MainTex_var.r);
                float4 _node_8249_var = tex2D(_node_8249,TRANSFORM_TEX(i.uv0, _node_8249));
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.r*(1.0 - _node_8249_var.r)*i.vertexColor.a));
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
