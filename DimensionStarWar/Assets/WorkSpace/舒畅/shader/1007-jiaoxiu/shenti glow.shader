// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-5141-OUT,alpha-7745-OUT;n:type:ShaderForge.SFN_Tex2d,id:4646,x:32558,y:33021,ptovrint:False,ptlb:Red mask,ptin:_Redmask,varname:node_4646,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbc2fdfe26d8f014c8190424833cb72b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5141,x:32875,y:32851,varname:node_5141,prsc:2|A-7345-RGB,B-4646-R;n:type:ShaderForge.SFN_Color,id:7345,x:32558,y:32823,ptovrint:False,ptlb:glow color,ptin:_glowcolor,varname:node_7345,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1862069,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:7745,x:32875,y:33079,varname:node_7745,prsc:2|A-4646-R,B-3699-OUT;n:type:ShaderForge.SFN_Slider,id:3699,x:32529,y:33231,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_3699,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:4646-7345-3699;pass:END;sub:END;*/

Shader "Shader Forge/shenti glow" {
    Properties {
        _Redmask ("Red mask", 2D) = "white" {}
        [HDR]_glowcolor ("glow color", Color) = (1,0.1862069,0,1)
        _Alpha ("Alpha", Range(0, 1)) = 1
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
            uniform sampler2D _Redmask; uniform float4 _Redmask_ST;
            uniform float4 _glowcolor;
            uniform float _Alpha;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 _Redmask_var = tex2D(_Redmask,TRANSFORM_TEX(i.uv0, _Redmask));
                float3 finalColor = (_glowcolor.rgb*_Redmask_var.r);
                fixed4 finalRGBA = fixed4(finalColor,(_Redmask_var.r*_Alpha));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
