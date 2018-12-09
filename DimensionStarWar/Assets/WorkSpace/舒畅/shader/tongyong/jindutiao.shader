// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33844,y:32600,varname:node_9361,prsc:2|custl-825-OUT,alpha-4054-OUT;n:type:ShaderForge.SFN_Color,id:4772,x:32772,y:32653,ptovrint:False,ptlb:di color,ptin:_dicolor,varname:node_4772,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.3793104,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:5829,x:31923,y:32845,varname:node_5829,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Step,id:2170,x:32620,y:32851,varname:node_2170,prsc:2|A-5829-V,B-5631-OUT;n:type:ShaderForge.SFN_Slider,id:5631,x:32214,y:32892,ptovrint:False,ptlb:jindu,ptin:_jindu,varname:node_5631,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.01,cur:0.6253179,max:1.5;n:type:ShaderForge.SFN_Multiply,id:4054,x:32914,y:32879,varname:node_4054,prsc:2|A-4772-A,B-2170-OUT;n:type:ShaderForge.SFN_Tex2d,id:2363,x:32653,y:33302,ptovrint:False,ptlb:liuwen,ptin:_liuwen,varname:node_2363,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-7190-UVOUT;n:type:ShaderForge.SFN_Panner,id:7190,x:32451,y:33302,varname:node_7190,prsc:2,spu:0,spv:1|UVIN-4213-OUT;n:type:ShaderForge.SFN_Multiply,id:1789,x:32869,y:33132,varname:node_1789,prsc:2|A-1686-OUT,B-2363-R;n:type:ShaderForge.SFN_Color,id:2130,x:32653,y:33472,ptovrint:False,ptlb:node_2130,ptin:_node_2130,varname:node_2130,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5310345,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:825,x:33402,y:32757,varname:node_825,prsc:2|A-4772-RGB,B-1789-OUT,C-1450-OUT,D-5157-OUT;n:type:ShaderForge.SFN_Power,id:1686,x:32697,y:33117,varname:node_1686,prsc:2|VAL-6976-R,EXP-5635-OUT;n:type:ShaderForge.SFN_Vector1,id:5635,x:32519,y:33169,varname:node_5635,prsc:2,v1:10;n:type:ShaderForge.SFN_Add,id:8773,x:33041,y:33128,varname:node_8773,prsc:2|A-1686-OUT,B-1789-OUT;n:type:ShaderForge.SFN_Tex2d,id:6976,x:32374,y:33118,ptovrint:False,ptlb:jianbian,ptin:_jianbian,varname:node_6976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:55b2f29a032bbbc4d988c7baf411e2de,ntxv:0,isnm:False|UVIN-5410-UVOUT;n:type:ShaderForge.SFN_Panner,id:5410,x:32198,y:33118,varname:node_5410,prsc:2,spu:0,spv:-1|UVIN-5829-UVOUT,DIST-904-OUT;n:type:ShaderForge.SFN_Multiply,id:1450,x:33210,y:33128,varname:node_1450,prsc:2|A-8773-OUT,B-2130-RGB;n:type:ShaderForge.SFN_Multiply,id:4213,x:32273,y:33381,varname:node_4213,prsc:2|A-5829-UVOUT,B-123-OUT;n:type:ShaderForge.SFN_Vector2,id:123,x:32104,y:33399,varname:node_123,prsc:2,v1:0.3,v2:1;n:type:ShaderForge.SFN_Add,id:904,x:32019,y:33139,varname:node_904,prsc:2|A-5631-OUT,B-7225-OUT;n:type:ShaderForge.SFN_Vector1,id:7225,x:31822,y:33155,varname:node_7225,prsc:2,v1:-0.854;n:type:ShaderForge.SFN_Multiply,id:5157,x:33124,y:32370,varname:node_5157,prsc:2|A-211-OUT,B-1999-RGB;n:type:ShaderForge.SFN_Color,id:1999,x:32911,y:32470,ptovrint:False,ptlb:kuang color,ptin:_kuangcolor,varname:node_1999,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1176471,c2:0.5618663,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:211,x:32490,y:32548,varname:node_211,prsc:2|A-4906-OUT,B-3247-OUT;n:type:ShaderForge.SFN_OneMinus,id:3266,x:32129,y:32483,varname:node_3266,prsc:2|IN-5829-U;n:type:ShaderForge.SFN_Power,id:4906,x:32314,y:32466,varname:node_4906,prsc:2|VAL-3266-OUT,EXP-1398-OUT;n:type:ShaderForge.SFN_Vector1,id:1398,x:32129,y:32608,varname:node_1398,prsc:2,v1:15;n:type:ShaderForge.SFN_Power,id:3247,x:32314,y:32640,varname:node_3247,prsc:2|VAL-5829-U,EXP-1398-OUT;proporder:4772-5631-2363-2130-6976-1999;pass:END;sub:END;*/

Shader "Shader Forge/jindutiao" {
    Properties {
        [HDR]_dicolor ("di color", Color) = (0,0.3793104,1,1)
        _jindu ("jindu", Range(-0.01, 1.5)) = 0.6253179
        _liuwen ("liuwen", 2D) = "white" {}
        [HDR]_node_2130 ("node_2130", Color) = (0.5310345,0,1,1)
        _jianbian ("jianbian", 2D) = "white" {}
        [HDR]_kuangcolor ("kuang color", Color) = (0.1176471,0.5618663,1,1)
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
            uniform float4 _dicolor;
            uniform float _jindu;
            uniform sampler2D _liuwen; uniform float4 _liuwen_ST;
            uniform float4 _node_2130;
            uniform sampler2D _jianbian; uniform float4 _jianbian_ST;
            uniform float4 _kuangcolor;
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
                float2 node_5410 = (i.uv0+(_jindu+(-0.854))*float2(0,-1));
                float4 _jianbian_var = tex2D(_jianbian,TRANSFORM_TEX(node_5410, _jianbian));
                float node_1686 = pow(_jianbian_var.r,10.0);
                float4 node_7014 = _Time;
                float2 node_7190 = ((i.uv0*float2(0.3,1))+node_7014.g*float2(0,1));
                float4 _liuwen_var = tex2D(_liuwen,TRANSFORM_TEX(node_7190, _liuwen));
                float node_1789 = (node_1686*_liuwen_var.r);
                float node_1398 = 15.0;
                float3 finalColor = (_dicolor.rgb+node_1789+((node_1686+node_1789)*_node_2130.rgb)+((pow((1.0 - i.uv0.r),node_1398)+pow(i.uv0.r,node_1398))*_kuangcolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(_dicolor.a*step(i.uv0.g,_jindu)));
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
