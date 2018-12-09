// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33212,y:32664,varname:node_9361,prsc:2|custl-9159-OUT,alpha-8861-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7245,x:31814,y:32971,ptovrint:False,ptlb:node_7245,ptin:_node_7245,varname:node_7245,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0ae2833d5ba332544bf6d77b918b5c48,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6787,x:32051,y:32837,varname:node_6787,prsc:2,tex:0ae2833d5ba332544bf6d77b918b5c48,ntxv:0,isnm:False|TEX-7245-TEX;n:type:ShaderForge.SFN_Tex2d,id:2482,x:32062,y:33096,varname:node_2482,prsc:2,tex:0ae2833d5ba332544bf6d77b918b5c48,ntxv:0,isnm:False|UVIN-8014-UVOUT,TEX-7245-TEX;n:type:ShaderForge.SFN_Color,id:331,x:32051,y:32681,ptovrint:False,ptlb:main color,ptin:_maincolor,varname:node_331,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5135902,c3:0.1985294,c4:1;n:type:ShaderForge.SFN_TexCoord,id:4067,x:31542,y:33191,varname:node_4067,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Rotator,id:8014,x:31832,y:33197,varname:node_8014,prsc:2|UVIN-4067-UVOUT;n:type:ShaderForge.SFN_Color,id:3097,x:32062,y:33249,ptovrint:False,ptlb:zhuan color,ptin:_zhuancolor,varname:node_3097,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8154158,c3:0.4852941,c4:1;n:type:ShaderForge.SFN_Add,id:895,x:32521,y:32937,varname:node_895,prsc:2|A-6787-A,B-7301-OUT;n:type:ShaderForge.SFN_Multiply,id:7301,x:32254,y:33002,varname:node_7301,prsc:2|A-1180-OUT,B-2482-A;n:type:ShaderForge.SFN_Vector1,id:1180,x:32069,y:33002,varname:node_1180,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Lerp,id:578,x:32553,y:32702,varname:node_578,prsc:2|A-3708-OUT,B-7993-OUT,T-6288-OUT;n:type:ShaderForge.SFN_Multiply,id:6028,x:32012,y:33452,varname:node_6028,prsc:2|A-4067-U,B-4067-V,C-6471-OUT,D-3638-OUT,E-4969-OUT;n:type:ShaderForge.SFN_OneMinus,id:3638,x:31715,y:33455,varname:node_3638,prsc:2|IN-4067-U;n:type:ShaderForge.SFN_OneMinus,id:6471,x:31717,y:33586,varname:node_6471,prsc:2|IN-4067-V;n:type:ShaderForge.SFN_Vector1,id:4969,x:31850,y:33641,varname:node_4969,prsc:2,v1:15;n:type:ShaderForge.SFN_Clamp01,id:4855,x:32186,y:33452,varname:node_4855,prsc:2|IN-6028-OUT;n:type:ShaderForge.SFN_Add,id:6699,x:32757,y:32952,varname:node_6699,prsc:2|A-895-OUT,B-4855-OUT;n:type:ShaderForge.SFN_Multiply,id:3708,x:32254,y:32709,varname:node_3708,prsc:2|A-331-RGB,B-6787-A;n:type:ShaderForge.SFN_Multiply,id:7993,x:32254,y:33193,varname:node_7993,prsc:2|A-2482-A,B-3097-RGB;n:type:ShaderForge.SFN_Add,id:9159,x:32757,y:32702,varname:node_9159,prsc:2|A-578-OUT,B-1228-OUT;n:type:ShaderForge.SFN_Multiply,id:1228,x:32533,y:33352,varname:node_1228,prsc:2|A-4855-OUT,B-2616-RGB;n:type:ShaderForge.SFN_Color,id:2616,x:32318,y:33539,ptovrint:False,ptlb:di color,ptin:_dicolor,varname:node_2616,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9411765,c2:0.4521656,c3:0.1868512,c4:1;n:type:ShaderForge.SFN_Multiply,id:8861,x:33020,y:32981,varname:node_8861,prsc:2|A-6699-OUT,B-896-OUT;n:type:ShaderForge.SFN_Slider,id:896,x:32679,y:33163,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_896,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.435478,max:1;n:type:ShaderForge.SFN_Slider,id:6288,x:32175,y:32597,ptovrint:False,ptlb:hunhebi,ptin:_hunhebi,varname:node_6288,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.11124,max:1;proporder:7245-331-3097-2616-896-6288;pass:END;sub:END;*/

Shader "Shader Forge/jianglidi" {
    Properties {
        _node_7245 ("node_7245", 2D) = "white" {}
        _maincolor ("main color", Color) = (1,0.5135902,0.1985294,1)
        [HDR]_zhuancolor ("zhuan color", Color) = (1,0.8154158,0.4852941,1)
        _dicolor ("di color", Color) = (0.9411765,0.4521656,0.1868512,1)
        _Alpha ("Alpha", Range(0, 1)) = 0.435478
        _hunhebi ("hunhebi", Range(0, 1)) = 0.11124
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
            uniform sampler2D _node_7245; uniform float4 _node_7245_ST;
            uniform float4 _maincolor;
            uniform float4 _zhuancolor;
            uniform float4 _dicolor;
            uniform float _Alpha;
            uniform float _hunhebi;
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
                float4 node_6787 = tex2D(_node_7245,TRANSFORM_TEX(i.uv0, _node_7245));
                float4 node_266 = _Time;
                float node_8014_ang = node_266.g;
                float node_8014_spd = 1.0;
                float node_8014_cos = cos(node_8014_spd*node_8014_ang);
                float node_8014_sin = sin(node_8014_spd*node_8014_ang);
                float2 node_8014_piv = float2(0.5,0.5);
                float2 node_8014 = (mul(i.uv0-node_8014_piv,float2x2( node_8014_cos, -node_8014_sin, node_8014_sin, node_8014_cos))+node_8014_piv);
                float4 node_2482 = tex2D(_node_7245,TRANSFORM_TEX(node_8014, _node_7245));
                float node_4855 = saturate((i.uv0.r*i.uv0.g*(1.0 - i.uv0.g)*(1.0 - i.uv0.r)*15.0));
                float3 finalColor = (lerp((_maincolor.rgb*node_6787.a),(node_2482.a*_zhuancolor.rgb),_hunhebi)+(node_4855*_dicolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(((node_6787.a+(0.3*node_2482.a))+node_4855)*_Alpha));
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
