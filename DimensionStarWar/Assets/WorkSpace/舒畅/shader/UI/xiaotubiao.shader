// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33515,y:32595,varname:node_9361,prsc:2|custl-9206-OUT,alpha-621-OUT;n:type:ShaderForge.SFN_Tex2d,id:8319,x:32410,y:32539,ptovrint:False,ptlb:dimian tex,ptin:_dimiantex,varname:node_8319,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c601fb6ef0c67114b9a837e90c8a6d50,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:3224,x:32244,y:32761,varname:node_3224,prsc:2,spu:0,spv:-1|UVIN-3573-UVOUT,DIST-1866-OUT;n:type:ShaderForge.SFN_TexCoord,id:3573,x:32032,y:32822,varname:node_3573,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:3100,x:32410,y:32717,ptovrint:False,ptlb:node_3100,ptin:_node_3100,varname:node_3100,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4ec3ba2206e8ced469331ebac4ceae79,ntxv:0,isnm:False|UVIN-3224-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4649,x:32759,y:32676,varname:node_4649,prsc:2|A-8319-A,B-896-OUT,C-8497-R;n:type:ShaderForge.SFN_Step,id:5398,x:32410,y:33114,varname:node_5398,prsc:2|A-5159-A,B-3573-V;n:type:ShaderForge.SFN_RemapRange,id:1866,x:32032,y:32903,varname:node_1866,prsc:2,frmn:0,frmx:1,tomn:-0.55,tomx:0.6|IN-5159-A;n:type:ShaderForge.SFN_Multiply,id:4508,x:32735,y:32976,varname:node_4508,prsc:2|A-8319-A,B-5398-OUT;n:type:ShaderForge.SFN_Add,id:9206,x:33098,y:32683,varname:node_9206,prsc:2|A-8319-RGB,B-3146-OUT;n:type:ShaderForge.SFN_Add,id:8124,x:32933,y:32976,varname:node_8124,prsc:2|A-4508-OUT,B-4649-OUT;n:type:ShaderForge.SFN_Tex2d,id:8497,x:32410,y:32959,ptovrint:False,ptlb:node_8497,ptin:_node_8497,varname:node_8497,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:84cafc8c1f260554a98869821f66942d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:8585,x:32735,y:32828,ptovrint:False,ptlb:liudong color,ptin:_liudongcolor,varname:node_8585,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.4206896,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3146,x:32933,y:32744,varname:node_3146,prsc:2|A-4649-OUT,B-8585-RGB;n:type:ShaderForge.SFN_Clamp01,id:621,x:33258,y:32979,varname:node_621,prsc:2|IN-2438-OUT;n:type:ShaderForge.SFN_VertexColor,id:5159,x:31836,y:33146,varname:node_5159,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2438,x:33090,y:33094,varname:node_2438,prsc:2|A-8124-OUT,B-4321-OUT;n:type:ShaderForge.SFN_RemapRange,id:4321,x:32429,y:33239,varname:node_4321,prsc:2,frmn:0,frmx:1,tomn:0,tomx:10|IN-5159-A;n:type:ShaderForge.SFN_Power,id:896,x:32587,y:32734,varname:node_896,prsc:2|VAL-3100-R,EXP-5204-OUT;n:type:ShaderForge.SFN_Vector1,id:5204,x:32428,y:32889,varname:node_5204,prsc:2,v1:2;proporder:8319-3100-8497-8585;pass:END;sub:END;*/

Shader "Shader Forge/xiaotubiao" {
    Properties {
        _dimiantex ("dimian tex", 2D) = "white" {}
        _node_3100 ("node_3100", 2D) = "white" {}
        _node_8497 ("node_8497", 2D) = "white" {}
        [HDR]_liudongcolor ("liudong color", Color) = (0,0.4206896,1,1)
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
            uniform sampler2D _dimiantex; uniform float4 _dimiantex_ST;
            uniform sampler2D _node_3100; uniform float4 _node_3100_ST;
            uniform sampler2D _node_8497; uniform float4 _node_8497_ST;
            uniform float4 _liudongcolor;
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
                float4 _dimiantex_var = tex2D(_dimiantex,TRANSFORM_TEX(i.uv0, _dimiantex));
                float2 node_3224 = (i.uv0+(i.vertexColor.a*1.15+-0.55)*float2(0,-1));
                float4 _node_3100_var = tex2D(_node_3100,TRANSFORM_TEX(node_3224, _node_3100));
                float4 _node_8497_var = tex2D(_node_8497,TRANSFORM_TEX(i.uv0, _node_8497));
                float node_4649 = (_dimiantex_var.a*pow(_node_3100_var.r,2.0)*_node_8497_var.r);
                float3 finalColor = (_dimiantex_var.rgb+(node_4649*_liudongcolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,saturate((((_dimiantex_var.a*step(i.vertexColor.a,i.uv0.g))+node_4649)*(i.vertexColor.a*10.0+0.0))));
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
