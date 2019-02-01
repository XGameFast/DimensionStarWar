// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34093,y:32111,varname:node_9361,prsc:2|custl-5664-OUT,alpha-1980-OUT;n:type:ShaderForge.SFN_Tex2d,id:4982,x:33023,y:32236,ptovrint:False,ptlb:Main tex,ptin:_Maintex,varname:node_4982,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2b3041e6333f3464e90355bbd18ad8d6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:2294,x:32659,y:32410,varname:node_2294,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Step,id:2247,x:33114,y:32441,varname:node_2247,prsc:2|A-2294-V,B-3159-OUT;n:type:ShaderForge.SFN_Slider,id:3159,x:32366,y:32564,ptovrint:False,ptlb:load,ptin:_load,varname:node_3159,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:1980,x:33475,y:32439,varname:node_1980,prsc:2|A-4982-A,B-3516-OUT;n:type:ShaderForge.SFN_Multiply,id:6655,x:32964,y:33071,varname:node_6655,prsc:2|A-2294-UVOUT,B-7472-OUT;n:type:ShaderForge.SFN_Tex2d,id:3744,x:33122,y:32899,ptovrint:False,ptlb:Offset tex,ptin:_Offsettex,varname:node_3744,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4ec3ba2206e8ced469331ebac4ceae79,ntxv:0,isnm:False|UVIN-4004-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4238,x:33122,y:33071,ptovrint:False,ptlb:Wangge tex,ptin:_Wanggetex,varname:node_4238,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a12a870693898be4e82d880524c9a7cf,ntxv:0,isnm:False|UVIN-6655-OUT;n:type:ShaderForge.SFN_Step,id:3516,x:33114,y:32592,varname:node_3516,prsc:2|A-2294-V,B-8763-OUT;n:type:ShaderForge.SFN_Add,id:8763,x:32840,y:32615,varname:node_8763,prsc:2|A-3159-OUT,B-8587-OUT;n:type:ShaderForge.SFN_Vector1,id:8587,x:32678,y:32635,varname:node_8587,prsc:2,v1:0.02;n:type:ShaderForge.SFN_Subtract,id:2727,x:33286,y:32439,varname:node_2727,prsc:2|A-3516-OUT,B-2247-OUT;n:type:ShaderForge.SFN_Multiply,id:4491,x:33475,y:32572,varname:node_4491,prsc:2|A-2727-OUT,B-9187-RGB;n:type:ShaderForge.SFN_Color,id:9187,x:33286,y:32592,ptovrint:False,ptlb:bianxian color,ptin:_bianxiancolor,varname:node_9187,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:5664,x:33858,y:32242,varname:node_5664,prsc:2|A-4982-RGB,B-4491-OUT,C-1860-OUT;n:type:ShaderForge.SFN_Panner,id:4004,x:32964,y:32899,varname:node_4004,prsc:2,spu:0,spv:1|UVIN-2294-UVOUT,DIST-7714-OUT;n:type:ShaderForge.SFN_RemapRange,id:7714,x:32678,y:32767,varname:node_7714,prsc:2,frmn:0,frmx:1,tomn:0.7,tomx:-0.7|IN-3159-OUT;n:type:ShaderForge.SFN_Multiply,id:8842,x:33357,y:32919,varname:node_8842,prsc:2|A-3744-R,B-4238-R,C-3516-OUT;n:type:ShaderForge.SFN_Color,id:2461,x:33357,y:33073,ptovrint:False,ptlb:wangge color,ptin:_wanggecolor,varname:node_2461,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.05882353,c2:0.5716025,c3:1,c4:1;n:type:ShaderForge.SFN_Vector2,id:7472,x:32802,y:33089,varname:node_7472,prsc:2,v1:1,v2:1;n:type:ShaderForge.SFN_Multiply,id:1860,x:33524,y:32978,varname:node_1860,prsc:2|A-8842-OUT,B-2461-RGB;proporder:4982-3159-9187-3744-4238-2461;pass:END;sub:END;*/

Shader "Shader Forge/Load" {
    Properties {
        _Maintex ("Main tex", 2D) = "white" {}
        _load ("load", Range(0, 1)) = 1
        [HDR]_bianxiancolor ("bianxian color", Color) = (1,1,1,1)
        _Offsettex ("Offset tex", 2D) = "white" {}
        _Wanggetex ("Wangge tex", 2D) = "white" {}
        [HDR]_wanggecolor ("wangge color", Color) = (0.05882353,0.5716025,1,1)
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
            uniform sampler2D _Maintex; uniform float4 _Maintex_ST;
            uniform float _load;
            uniform sampler2D _Offsettex; uniform float4 _Offsettex_ST;
            uniform sampler2D _Wanggetex; uniform float4 _Wanggetex_ST;
            uniform float4 _bianxiancolor;
            uniform float4 _wanggecolor;
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
                float4 _Maintex_var = tex2D(_Maintex,TRANSFORM_TEX(i.uv0, _Maintex));
                float node_3516 = step(i.uv0.g,(_load+0.02));
                float2 node_4004 = (i.uv0+(_load*-1.4+0.7)*float2(0,1));
                float4 _Offsettex_var = tex2D(_Offsettex,TRANSFORM_TEX(node_4004, _Offsettex));
                float2 node_6655 = (i.uv0*float2(1,1));
                float4 _Wanggetex_var = tex2D(_Wanggetex,TRANSFORM_TEX(node_6655, _Wanggetex));
                float3 finalColor = (_Maintex_var.rgb+((node_3516-step(i.uv0.g,_load))*_bianxiancolor.rgb)+((_Offsettex_var.r*_Wanggetex_var.r*node_3516)*_wanggecolor.rgb));
                fixed4 finalRGBA = fixed4(finalColor,(_Maintex_var.a*node_3516));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
