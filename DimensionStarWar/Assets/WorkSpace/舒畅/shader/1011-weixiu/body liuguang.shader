// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32732,y:32676,varname:node_9361,prsc:2|custl-6916-OUT,alpha-3697-OUT;n:type:ShaderForge.SFN_Tex2d,id:9787,x:31983,y:32632,ptovrint:False,ptlb:1011Mask2 ,ptin:_1011Mask2,varname:node_9787,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d8affb142953f9e4b88690b058c63eb7,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:336,x:31650,y:32818,ptovrint:False,ptlb:offset tex,ptin:_offsettex,varname:node_336,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-5218-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3697,x:32202,y:32841,varname:node_3697,prsc:2|A-9787-R,B-2946-OUT,C-2216-OUT;n:type:ShaderForge.SFN_TexCoord,id:8655,x:31274,y:32825,varname:node_8655,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:5218,x:31478,y:32825,varname:node_5218,prsc:2,spu:0.05,spv:-0.3|UVIN-8655-UVOUT;n:type:ShaderForge.SFN_Color,id:5493,x:32202,y:32687,ptovrint:False,ptlb:liu guang color,ptin:_liuguangcolor,varname:node_5493,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.3379312,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6916,x:32441,y:32745,varname:node_6916,prsc:2|A-5493-RGB,B-3697-OUT;n:type:ShaderForge.SFN_Slider,id:2216,x:31933,y:33166,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_2216,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Power,id:2946,x:31883,y:32918,varname:node_2946,prsc:2|VAL-336-B,EXP-7818-OUT;n:type:ShaderForge.SFN_Vector1,id:7818,x:31661,y:32968,varname:node_7818,prsc:2,v1:2;proporder:9787-5493-336-2216;pass:END;sub:END;*/

Shader "Shader Forge/body liuguang" {
    Properties {
        _1011Mask2 ("1011Mask2 ", 2D) = "white" {}
        [HDR]_liuguangcolor ("liu guang color", Color) = (0,0.3379312,1,1)
        _offsettex ("offset tex", 2D) = "white" {}
        _alpha ("alpha", Range(0, 1)) = 0
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
            uniform sampler2D _1011Mask2; uniform float4 _1011Mask2_ST;
            uniform sampler2D _offsettex; uniform float4 _offsettex_ST;
            uniform float4 _liuguangcolor;
            uniform float _alpha;
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
                float4 _1011Mask2_var = tex2D(_1011Mask2,TRANSFORM_TEX(i.uv0, _1011Mask2));
                float4 node_7382 = _Time;
                float2 node_5218 = (i.uv0+node_7382.g*float2(0.05,-0.3));
                float4 _offsettex_var = tex2D(_offsettex,TRANSFORM_TEX(node_5218, _offsettex));
                float node_3697 = (_1011Mask2_var.r*pow(_offsettex_var.b,2.0)*_alpha);
                float3 finalColor = (_liuguangcolor.rgb*node_3697);
                fixed4 finalRGBA = fixed4(finalColor,node_3697);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
