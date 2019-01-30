// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34557,y:33739,varname:node_4013,prsc:2|custl-1744-OUT;n:type:ShaderForge.SFN_Tex2d,id:8513,x:34191,y:33865,ptovrint:False,ptlb:zase,ptin:_zase,varname:node_8513,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d9ba30c2a130bac44bf288a66fbe4b6b,ntxv:0,isnm:False|UVIN-7221-OUT;n:type:ShaderForge.SFN_Time,id:224,x:32901,y:33784,varname:node_224,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:2668,x:33671,y:33781,ptovrint:False,ptlb:niuqu,ptin:_niuqu,varname:node_2668,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4b0e926b8a37a1244b45f42eee2589b2,ntxv:0,isnm:False|UVIN-8596-UVOUT;n:type:ShaderForge.SFN_Panner,id:8596,x:33512,y:33785,varname:node_8596,prsc:2,spu:0.1,spv:0.5|UVIN-524-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:524,x:33102,y:33930,varname:node_524,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:7221,x:34021,y:33882,varname:node_7221,prsc:2|A-4594-OUT,B-524-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4594,x:33855,y:33699,varname:node_4594,prsc:2|A-5228-OUT,B-2668-R;n:type:ShaderForge.SFN_Sin,id:7082,x:33476,y:33610,varname:node_7082,prsc:2|IN-8356-OUT;n:type:ShaderForge.SFN_RemapRange,id:5228,x:33671,y:33610,varname:node_5228,prsc:2,frmn:-1,frmx:1,tomn:-0.2,tomx:0.2|IN-7082-OUT;n:type:ShaderForge.SFN_Multiply,id:8356,x:33320,y:33610,varname:node_8356,prsc:2|A-224-TTR,B-6292-OUT;n:type:ShaderForge.SFN_Vector1,id:6292,x:33117,y:33644,varname:node_6292,prsc:2,v1:100;n:type:ShaderForge.SFN_UVTile,id:2219,x:33853,y:34023,varname:node_2219,prsc:2|UVIN-524-UVOUT,WDT-2930-OUT,HGT-2930-OUT,TILE-5848-OUT;n:type:ShaderForge.SFN_Tex2d,id:8661,x:34021,y:34023,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_8661,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bc2411fb286c0684c8551528e681a087,ntxv:0,isnm:False|UVIN-2219-UVOUT;n:type:ShaderForge.SFN_Vector1,id:2930,x:33642,y:34057,varname:node_2930,prsc:2,v1:4;n:type:ShaderForge.SFN_Slider,id:9103,x:33140,y:34289,ptovrint:False,ptlb:exp,ptin:_exp,varname:node_9103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.628372,max:10;n:type:ShaderForge.SFN_Trunc,id:5848,x:33642,y:34115,varname:node_5848,prsc:2|IN-2574-OUT;n:type:ShaderForge.SFN_Multiply,id:2574,x:33476,y:34115,varname:node_2574,prsc:2|A-4780-OUT,B-9103-OUT;n:type:ShaderForge.SFN_Multiply,id:1744,x:34378,y:33979,varname:node_1744,prsc:2|A-8513-RGB,B-5886-OUT,C-8648-OUT;n:type:ShaderForge.SFN_Sin,id:453,x:33128,y:34115,varname:node_453,prsc:2|IN-224-TDB;n:type:ShaderForge.SFN_RemapRange,id:4780,x:33297,y:34115,varname:node_4780,prsc:2,frmn:-1,frmx:1,tomn:-1,tomx:2|IN-453-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8648,x:34201,y:34372,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_8648,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Power,id:5886,x:34191,y:34117,varname:node_5886,prsc:2|VAL-8661-R,EXP-2053-OUT;n:type:ShaderForge.SFN_Vector1,id:2053,x:34001,y:34232,varname:node_2053,prsc:2,v1:5;proporder:8513-2668-8661-9103-8648;pass:END;sub:END;*/

Shader "Shader Forge/ganrao" {
    Properties {
        _zase ("zase", 2D) = "white" {}
        _niuqu ("niuqu", 2D) = "white" {}
        _mask ("mask", 2D) = "white" {}
        _exp ("exp", Range(0, 10)) = 2.628372
        _Intensity ("Intensity", Float ) = 1
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
            Blend One One
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
            uniform sampler2D _zase; uniform float4 _zase_ST;
            uniform sampler2D _niuqu; uniform float4 _niuqu_ST;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform float _exp;
            uniform float _Intensity;
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
                float4 node_224 = _Time;
                float4 node_8569 = _Time;
                float2 node_8596 = (i.uv0+node_8569.g*float2(0.1,0.5));
                float4 _niuqu_var = tex2D(_niuqu,TRANSFORM_TEX(node_8596, _niuqu));
                float2 node_7221 = (((sin((node_224.a*100.0))*0.2+0.0)*_niuqu_var.r)+i.uv0);
                float4 _zase_var = tex2D(_zase,TRANSFORM_TEX(node_7221, _zase));
                float node_2930 = 4.0;
                float node_5848 = trunc(((sin(node_224.b)*1.5+0.5)*_exp));
                float2 node_2219_tc_rcp = float2(1.0,1.0)/float2( node_2930, node_2930 );
                float node_2219_ty = floor(node_5848 * node_2219_tc_rcp.x);
                float node_2219_tx = node_5848 - node_2930 * node_2219_ty;
                float2 node_2219 = (i.uv0 + float2(node_2219_tx, node_2219_ty)) * node_2219_tc_rcp;
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_2219, _mask));
                float3 finalColor = (_zase_var.rgb*pow(_mask_var.r,5.0)*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,1);
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
