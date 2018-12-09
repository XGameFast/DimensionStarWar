// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33516,y:32552,varname:node_9361,prsc:2|custl-2217-OUT,alpha-7656-A;n:type:ShaderForge.SFN_Tex2d,id:7656,x:32797,y:32432,ptovrint:False,ptlb:Main sprite,ptin:_Mainsprite,varname:node_7656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1510de10abbe9b84aa4e916446314882,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:451,x:32173,y:32760,varname:node_451,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:784,x:32459,y:32575,varname:node_784,prsc:2,spu:0.2,spv:0.3|UVIN-451-UVOUT;n:type:ShaderForge.SFN_Tex2dAsset,id:2165,x:32459,y:32736,ptovrint:False,ptlb:liudongTEX,ptin:_liudongTEX,varname:node_2165,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5487,x:32654,y:32575,varname:node_5487,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-784-UVOUT,TEX-2165-TEX;n:type:ShaderForge.SFN_Tex2d,id:396,x:32651,y:32899,varname:node_396,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-2790-UVOUT,TEX-2165-TEX;n:type:ShaderForge.SFN_Panner,id:2790,x:32459,y:32899,varname:node_2790,prsc:2,spu:-0.35,spv:-0.15|UVIN-451-UVOUT;n:type:ShaderForge.SFN_Multiply,id:155,x:32805,y:32738,varname:node_155,prsc:2|A-5487-R,B-396-R;n:type:ShaderForge.SFN_Color,id:4505,x:33046,y:32405,ptovrint:False,ptlb:liudongcolor,ptin:_liudongcolor,varname:node_4505,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09558821,c2:0.2889451,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:8608,x:33056,y:32567,varname:node_8608,prsc:2|A-7656-RGB,B-155-OUT;n:type:ShaderForge.SFN_Multiply,id:2217,x:33283,y:32548,varname:node_2217,prsc:2|A-4505-RGB,B-8608-OUT;proporder:7656-2165-4505;pass:END;sub:END;*/

Shader "Shader Forge/slider" {
    Properties {
        _Mainsprite ("Main sprite", 2D) = "white" {}
        _liudongTEX ("liudongTEX", 2D) = "white" {}
        [HDR]_liudongcolor ("liudongcolor", Color) = (0.09558821,0.2889451,1,1)
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
            uniform sampler2D _Mainsprite; uniform float4 _Mainsprite_ST;
            uniform sampler2D _liudongTEX; uniform float4 _liudongTEX_ST;
            uniform float4 _liudongcolor;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 _Mainsprite_var = tex2D(_Mainsprite,TRANSFORM_TEX(i.uv0, _Mainsprite));
                float4 node_224 = _Time;
                float2 node_784 = (i.uv0+node_224.g*float2(0.2,0.3));
                float4 node_5487 = tex2D(_liudongTEX,TRANSFORM_TEX(node_784, _liudongTEX));
                float2 node_2790 = (i.uv0+node_224.g*float2(-0.35,-0.15));
                float4 node_396 = tex2D(_liudongTEX,TRANSFORM_TEX(node_2790, _liudongTEX));
                float node_155 = (node_5487.r*node_396.r);
                float3 finalColor = (_liudongcolor.rgb*(_Mainsprite_var.rgb+node_155));
                fixed4 finalRGBA = fixed4(finalColor,_Mainsprite_var.a);
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
