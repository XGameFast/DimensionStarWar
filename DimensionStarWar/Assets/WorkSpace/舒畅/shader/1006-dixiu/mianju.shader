// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33524,y:32691,varname:node_9361,prsc:2|custl-4161-OUT,alpha-136-OUT;n:type:ShaderForge.SFN_Tex2d,id:3489,x:32569,y:32872,ptovrint:False,ptlb:Maintex,ptin:_Maintex,varname:node_3489,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ded7c2d24fad976449b44aaf0e8a4909,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3140,x:33014,y:32803,varname:node_3140,prsc:2|A-5446-RGB,B-3489-R;n:type:ShaderForge.SFN_Color,id:5446,x:32569,y:32699,ptovrint:False,ptlb:color,ptin:_color,varname:node_5446,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1323529,c2:1,c3:0.8563896,c4:1;n:type:ShaderForge.SFN_Subtract,id:5362,x:32765,y:33136,varname:node_5362,prsc:2|A-225-OUT,B-7733-OUT;n:type:ShaderForge.SFN_Step,id:7733,x:32531,y:33119,varname:node_7733,prsc:2|A-3238-OUT,B-6351-OUT;n:type:ShaderForge.SFN_Slider,id:6351,x:31986,y:33277,ptovrint:False,ptlb:kongzhi,ptin:_kongzhi,varname:node_6351,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.1,cur:0.574968,max:1;n:type:ShaderForge.SFN_Step,id:225,x:32531,y:33352,varname:node_225,prsc:2|A-3238-OUT,B-2651-OUT;n:type:ShaderForge.SFN_Add,id:2651,x:32279,y:33375,varname:node_2651,prsc:2|A-6351-OUT,B-5485-OUT;n:type:ShaderForge.SFN_Vector1,id:5485,x:32088,y:33435,varname:node_5485,prsc:2,v1:0.03;n:type:ShaderForge.SFN_Multiply,id:136,x:33146,y:33175,varname:node_136,prsc:2|A-3489-R,B-225-OUT;n:type:ShaderForge.SFN_Add,id:4161,x:33186,y:32850,varname:node_4161,prsc:2|A-3140-OUT,B-2972-OUT;n:type:ShaderForge.SFN_Multiply,id:2972,x:33014,y:32935,varname:node_2972,prsc:2|A-801-OUT,B-5362-OUT;n:type:ShaderForge.SFN_Add,id:801,x:32864,y:32904,varname:node_801,prsc:2|A-5446-RGB,B-3554-OUT;n:type:ShaderForge.SFN_Vector1,id:3554,x:32709,y:32923,varname:node_3554,prsc:2,v1:0.3;n:type:ShaderForge.SFN_TexCoord,id:5472,x:31859,y:32861,varname:node_5472,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:3238,x:32250,y:32877,varname:node_3238,prsc:2|A-5472-U,B-8729-OUT,C-1984-OUT;n:type:ShaderForge.SFN_OneMinus,id:8729,x:32046,y:32899,varname:node_8729,prsc:2|IN-5472-U;n:type:ShaderForge.SFN_Vector1,id:1984,x:32026,y:33068,varname:node_1984,prsc:2,v1:4;proporder:3489-5446-6351;pass:END;sub:END;*/

Shader "Shader Forge/mianju" {
    Properties {
        _Maintex ("Maintex", 2D) = "white" {}
        [HDR]_color ("color", Color) = (0.1323529,1,0.8563896,1)
        _kongzhi ("kongzhi", Range(-0.1, 1)) = 0.574968
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Maintex; uniform float4 _Maintex_ST;
            uniform float4 _color;
            uniform float _kongzhi;
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
                float4 _Maintex_var = tex2D(_Maintex,TRANSFORM_TEX(i.uv0, _Maintex));
                float node_3238 = (i.uv0.r*(1.0 - i.uv0.r)*4.0);
                float node_225 = step(node_3238,(_kongzhi+0.03));
                float3 finalColor = ((_color.rgb*_Maintex_var.r)+((_color.rgb+0.3)*(node_225-step(node_3238,_kongzhi))));
                fixed4 finalRGBA = fixed4(finalColor,(_Maintex_var.r*node_225));
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
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
