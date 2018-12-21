// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33257,y:32622,varname:node_9361,prsc:2|custl-2893-OUT,alpha-5951-OUT;n:type:ShaderForge.SFN_Multiply,id:5951,x:33008,y:32958,varname:node_5951,prsc:2|A-4816-OUT,B-6763-A,C-4162-OUT;n:type:ShaderForge.SFN_Slider,id:4162,x:32549,y:33091,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_4162,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_VertexColor,id:6763,x:32671,y:32926,varname:node_6763,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:2072,x:32159,y:32572,ptovrint:False,ptlb:jiemian,ptin:_jiemian,varname:node_2072,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6ffb15e957e29634985393831fbee895,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:8097,x:32689,y:32465,ptovrint:False,ptlb:maintex,ptin:_maintex,varname:node_8097,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1996107,c2:0.554886,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:2893,x:32902,y:32632,varname:node_2893,prsc:2|A-8097-RGB,B-4816-OUT;n:type:ShaderForge.SFN_TexCoord,id:5326,x:31463,y:32580,varname:node_5326,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:4281,x:31283,y:32757,varname:node_4281,prsc:2,frmn:0,frmx:100,tomn:0,tomx:1|IN-2934-OUT;n:type:ShaderForge.SFN_RemapRange,id:2414,x:31475,y:32757,varname:node_2414,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.5|IN-4281-OUT;n:type:ShaderForge.SFN_Multiply,id:1780,x:31668,y:32742,varname:node_1780,prsc:2|A-5326-V,B-2934-OUT;n:type:ShaderForge.SFN_Sin,id:315,x:31834,y:32742,varname:node_315,prsc:2|IN-1780-OUT;n:type:ShaderForge.SFN_Clamp01,id:804,x:31996,y:32742,varname:node_804,prsc:2|IN-315-OUT;n:type:ShaderForge.SFN_RemapRange,id:7764,x:32159,y:32742,varname:node_7764,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.6|IN-804-OUT;n:type:ShaderForge.SFN_Multiply,id:3903,x:32428,y:32826,varname:node_3903,prsc:2|A-7764-OUT,B-2072-R;n:type:ShaderForge.SFN_Add,id:4816,x:32669,y:32701,varname:node_4816,prsc:2|A-2072-R,B-3903-OUT;n:type:ShaderForge.SFN_Time,id:4854,x:30578,y:32773,varname:node_4854,prsc:2;n:type:ShaderForge.SFN_Sin,id:5025,x:30906,y:32789,varname:node_5025,prsc:2|IN-3120-OUT;n:type:ShaderForge.SFN_Multiply,id:3120,x:30748,y:32789,varname:node_3120,prsc:2|A-4854-T,B-3880-OUT;n:type:ShaderForge.SFN_Vector1,id:3880,x:30578,y:32922,varname:node_3880,prsc:2,v1:8;n:type:ShaderForge.SFN_RemapRange,id:2934,x:31090,y:32789,varname:node_2934,prsc:2,frmn:-1,frmx:1,tomn:200,tomx:100|IN-5025-OUT;proporder:4162-2072-8097;pass:END;sub:END;*/

Shader "Shader Forge/jinzhi" {
    Properties {
        _Alpha ("Alpha", Range(0, 1)) = 1
        _jiemian ("jiemian", 2D) = "white" {}
        [HDR]_maintex ("maintex", Color) = (0.1996107,0.554886,1,1)
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
            uniform float _Alpha;
            uniform sampler2D _jiemian; uniform float4 _jiemian_ST;
            uniform float4 _maintex;
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
                float4 _jiemian_var = tex2D(_jiemian,TRANSFORM_TEX(i.uv0, _jiemian));
                float4 node_4854 = _Time;
                float node_2934 = (sin((node_4854.g*8.0))*-50.0+150.0);
                float node_4816 = (_jiemian_var.r+((saturate(sin((i.uv0.g*node_2934)))*0.6+0.0)*_jiemian_var.r));
                float3 finalColor = (_maintex.rgb*node_4816);
                fixed4 finalRGBA = fixed4(finalColor,(node_4816*i.vertexColor.a*_Alpha));
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
