// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34436,y:32505,varname:node_9361,prsc:2|custl-9-OUT,alpha-1919-OUT;n:type:ShaderForge.SFN_Multiply,id:3697,x:33337,y:32659,varname:node_3697,prsc:2|A-8999-RGB,B-4619-R;n:type:ShaderForge.SFN_Color,id:8999,x:33101,y:32511,ptovrint:False,ptlb:bian color,ptin:_biancolor,varname:node_8999,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.3931034,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:6202,x:33337,y:32511,ptovrint:False,ptlb:base color,ptin:_basecolor,varname:node_6202,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5567951,c3:0.1544118,c4:0.547;n:type:ShaderForge.SFN_Lerp,id:3833,x:33650,y:32819,varname:node_3833,prsc:2|A-6202-A,B-4619-R,T-901-OUT;n:type:ShaderForge.SFN_Vector1,id:901,x:33379,y:32857,varname:node_901,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Tex2d,id:4619,x:33083,y:32697,ptovrint:False,ptlb:node_4619,ptin:_node_4619,varname:node_4619,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4241f151f57ee3b429a28f60b6f0d01a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:9,x:33812,y:32670,varname:node_9,prsc:2|A-6202-RGB,B-3697-OUT,C-6342-OUT;n:type:ShaderForge.SFN_Tex2d,id:2386,x:33791,y:32361,ptovrint:False,ptlb:liuguang Tex,ptin:_liuguangTex,varname:node_2386,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fb1157b277e3f9b4092bfb20083b039e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1066,x:34064,y:32184,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_1066,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c196117898ed97045928df82293354a4,ntxv:0,isnm:False|UVIN-5211-UVOUT;n:type:ShaderForge.SFN_Panner,id:5211,x:33864,y:32184,varname:node_5211,prsc:2,spu:1,spv:1|UVIN-3973-UVOUT,DIST-4311-OUT;n:type:ShaderForge.SFN_TexCoord,id:3973,x:33645,y:32184,varname:node_3973,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Sin,id:4311,x:33645,y:32327,varname:node_4311,prsc:2|IN-3504-T;n:type:ShaderForge.SFN_Time,id:3504,x:33483,y:32241,varname:node_3504,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2015,x:33980,y:32361,varname:node_2015,prsc:2|A-1066-R,B-2386-R;n:type:ShaderForge.SFN_Add,id:1919,x:34057,y:32919,varname:node_1919,prsc:2|A-2015-OUT,B-3833-OUT;n:type:ShaderForge.SFN_Multiply,id:6342,x:34184,y:32505,varname:node_6342,prsc:2|A-2015-OUT,B-7574-RGB;n:type:ShaderForge.SFN_Color,id:7574,x:33950,y:32505,ptovrint:False,ptlb:liudong color,ptin:_liudongcolor,varname:node_7574,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8235294,c3:0.5588235,c4:1;proporder:8999-6202-4619-2386-1066-7574;pass:END;sub:END;*/

Shader "Shader Forge/shangjiajudian2" {
    Properties {
        [HDR]_biancolor ("bian color", Color) = (1,0.3931034,0,1)
        [HDR]_basecolor ("base color", Color) = (1,0.5567951,0.1544118,0.547)
        _node_4619 ("node_4619", 2D) = "white" {}
        _liuguangTex ("liuguang Tex", 2D) = "white" {}
        _mask ("mask", 2D) = "white" {}
        [HDR]_liudongcolor ("liudong color", Color) = (1,0.8235294,0.5588235,1)
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
            uniform float4 _biancolor;
            uniform float4 _basecolor;
            uniform sampler2D _node_4619; uniform float4 _node_4619_ST;
            uniform sampler2D _liuguangTex; uniform float4 _liuguangTex_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
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
                float4 _node_4619_var = tex2D(_node_4619,TRANSFORM_TEX(i.uv0, _node_4619));
                float4 node_3504 = _Time;
                float2 node_5211 = (i.uv0+sin(node_3504.g)*float2(1,1));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_5211, _mask));
                float4 _liuguangTex_var = tex2D(_liuguangTex,TRANSFORM_TEX(i.uv0, _liuguangTex));
                float node_2015 = (_mask_var.r*_liuguangTex_var.r);
                float3 finalColor = (_basecolor.rgb+(_biancolor.rgb*_node_4619_var.r)+(node_2015*_liudongcolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(node_2015+lerp(_basecolor.a,_node_4619_var.r,0.4)));
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
