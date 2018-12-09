// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:31170,y:33311,varname:node_9361,prsc:2|custl-3889-OUT,alpha-8030-OUT;n:type:ShaderForge.SFN_TexCoord,id:9669,x:29892,y:33285,varname:node_9669,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Distance,id:8717,x:30071,y:33285,varname:node_8717,prsc:2|A-9669-UVOUT,B-6249-OUT;n:type:ShaderForge.SFN_Vector2,id:6249,x:29892,y:33436,varname:node_6249,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_RemapRange,id:8644,x:30244,y:33285,varname:node_8644,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:1.1|IN-8717-OUT;n:type:ShaderForge.SFN_Power,id:2049,x:30412,y:33285,varname:node_2049,prsc:2|VAL-8644-OUT,EXP-2758-OUT;n:type:ShaderForge.SFN_Vector1,id:2758,x:30244,y:33458,varname:node_2758,prsc:2,v1:1;n:type:ShaderForge.SFN_OneMinus,id:4712,x:30573,y:33285,varname:node_4712,prsc:2|IN-2049-OUT;n:type:ShaderForge.SFN_Clamp01,id:9295,x:30725,y:33285,varname:node_9295,prsc:2|IN-4712-OUT;n:type:ShaderForge.SFN_Panner,id:6780,x:30269,y:33584,varname:node_6780,prsc:2,spu:0.2,spv:0.5|UVIN-1694-OUT;n:type:ShaderForge.SFN_TexCoord,id:5301,x:29436,y:33618,varname:node_5301,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:9442,x:29621,y:33618,varname:node_9442,prsc:2,spu:0.2,spv:0.3|UVIN-5301-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5436,x:29792,y:33618,varname:node_5436,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-9442-UVOUT,TEX-56-TEX;n:type:ShaderForge.SFN_Panner,id:2349,x:29621,y:33775,varname:node_2349,prsc:2,spu:-0.35,spv:-0.15|UVIN-5301-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7283,x:29792,y:33775,varname:node_7283,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2349-UVOUT,TEX-56-TEX;n:type:ShaderForge.SFN_Multiply,id:8064,x:29977,y:33723,varname:node_8064,prsc:2|A-5436-B,B-7283-B,C-2853-OUT;n:type:ShaderForge.SFN_Add,id:1694,x:30127,y:33723,varname:node_1694,prsc:2|A-8064-OUT,B-5301-UVOUT;n:type:ShaderForge.SFN_Slider,id:2853,x:29687,y:33948,ptovrint:False,ptlb:niuqu Intensity,ptin:_niuquIntensity,varname:node_2853,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1732355,max:1;n:type:ShaderForge.SFN_Multiply,id:3889,x:30713,y:33608,varname:node_3889,prsc:2|A-4108-RGB,B-4733-OUT;n:type:ShaderForge.SFN_Multiply,id:8030,x:30896,y:33451,varname:node_8030,prsc:2|A-9295-OUT,B-2989-OUT;n:type:ShaderForge.SFN_Slider,id:2989,x:30570,y:33485,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_2989,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2dAsset,id:56,x:29284,y:33476,ptovrint:False,ptlb:node_56,ptin:_node_56,varname:node_56,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4108,x:30451,y:33596,ptovrint:False,ptlb:node_4108,ptin:_node_4108,varname:node_4108,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f2ec27081656d8647b8be6525cc47884,ntxv:0,isnm:False|UVIN-6780-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:4733,x:30451,y:33781,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_4733,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;proporder:2853-2989-56-4108-4733;pass:END;sub:END;*/

Shader "Shader Forge/level4 xin" {
    Properties {
        _niuquIntensity ("niuqu Intensity", Range(0, 1)) = 0.1732355
        _alpha ("alpha", Range(0, 1)) = 1
        _node_56 ("node_56", 2D) = "white" {}
        _node_4108 ("node_4108", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 2
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
            uniform float _niuquIntensity;
            uniform float _alpha;
            uniform sampler2D _node_56; uniform float4 _node_56_ST;
            uniform sampler2D _node_4108; uniform float4 _node_4108_ST;
            uniform float _Intensity;
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
                float4 node_5527 = _Time;
                float2 node_9442 = (i.uv0+node_5527.g*float2(0.2,0.3));
                float4 node_5436 = tex2D(_node_56,TRANSFORM_TEX(node_9442, _node_56));
                float2 node_2349 = (i.uv0+node_5527.g*float2(-0.35,-0.15));
                float4 node_7283 = tex2D(_node_56,TRANSFORM_TEX(node_2349, _node_56));
                float2 node_6780 = (((node_5436.b*node_7283.b*_niuquIntensity)+i.uv0)+node_5527.g*float2(0.2,0.5));
                float4 _node_4108_var = tex2D(_node_4108,TRANSFORM_TEX(node_6780, _node_4108));
                float3 finalColor = (_node_4108_var.rgb*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(saturate((1.0 - pow((distance(i.uv1,float2(0.5,0.5))*2.2+0.0),1.0)))*_alpha));
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
