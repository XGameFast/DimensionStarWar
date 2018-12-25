// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33674,y:32680,varname:node_9361,prsc:2|custl-9930-OUT,alpha-6727-OUT;n:type:ShaderForge.SFN_Tex2d,id:4516,x:32411,y:32923,ptovrint:False,ptlb:masktex,ptin:_masktex,varname:node_4516,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ec097ff925126814b993d56eb0c927ae,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5557,x:33229,y:32790,varname:node_5557,prsc:2|A-6155-RGB,B-1084-OUT;n:type:ShaderForge.SFN_Color,id:6155,x:32411,y:32695,ptovrint:False,ptlb:Maincolor,ptin:_Maincolor,varname:node_6155,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.007785475,c2:0.3135664,c3:0.5294118,c4:1;n:type:ShaderForge.SFN_Slider,id:2166,x:32221,y:33186,ptovrint:False,ptlb:shengcheng,ptin:_shengcheng,varname:node_2166,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.1,max:1;n:type:ShaderForge.SFN_Step,id:2359,x:32719,y:32993,varname:node_2359,prsc:2|A-2166-OUT,B-4516-R;n:type:ShaderForge.SFN_Subtract,id:7691,x:32929,y:33194,varname:node_7691,prsc:2|A-2359-OUT,B-1143-OUT;n:type:ShaderForge.SFN_Step,id:1143,x:32740,y:33205,varname:node_1143,prsc:2|A-8327-OUT,B-4516-R;n:type:ShaderForge.SFN_Add,id:8327,x:32533,y:33271,varname:node_8327,prsc:2|A-2166-OUT,B-2836-OUT;n:type:ShaderForge.SFN_Vector1,id:2836,x:32334,y:33292,varname:node_2836,prsc:2,v1:0.03;n:type:ShaderForge.SFN_Multiply,id:1505,x:33077,y:33274,varname:node_1505,prsc:2|A-7691-OUT,B-5470-RGB;n:type:ShaderForge.SFN_Color,id:5470,x:32818,y:33357,ptovrint:False,ptlb:bianse,ptin:_bianse,varname:node_5470,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09558821,c2:0.8503042,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:9930,x:33426,y:32769,varname:node_9930,prsc:2|A-5557-OUT,B-1505-OUT,C-1989-OUT;n:type:ShaderForge.SFN_Tex2d,id:9941,x:32800,y:33583,ptovrint:False,ptlb:node_9941,ptin:_node_9941,varname:node_9941,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c1054d1656e16e549bff8a97cece4bcb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1989,x:33037,y:33583,varname:node_1989,prsc:2|A-5470-RGB,B-9941-R;n:type:ShaderForge.SFN_Multiply,id:9964,x:33354,y:33184,varname:node_9964,prsc:2|A-2359-OUT,B-9941-R;n:type:ShaderForge.SFN_Multiply,id:1084,x:33076,y:33005,varname:node_1084,prsc:2|A-2359-OUT,B-6008-OUT;n:type:ShaderForge.SFN_Vector1,id:6008,x:32875,y:33093,varname:node_6008,prsc:2,v1:0.85;n:type:ShaderForge.SFN_Add,id:6727,x:33510,y:32995,varname:node_6727,prsc:2|A-1084-OUT,B-9964-OUT;proporder:4516-6155-2166-5470-9941;pass:END;sub:END;*/

Shader "Shader Forge/shoubichengzhang" {
    Properties {
        _masktex ("masktex", 2D) = "white" {}
        [HDR]_Maincolor ("Maincolor", Color) = (0.007785475,0.3135664,0.5294118,1)
        _shengcheng ("shengcheng", Range(0.1, 1)) = 0.1
        [HDR]_bianse ("bianse", Color) = (0.09558821,0.8503042,1,1)
        _node_9941 ("node_9941", 2D) = "white" {}
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
            uniform sampler2D _masktex; uniform float4 _masktex_ST;
            uniform float4 _Maincolor;
            uniform float _shengcheng;
            uniform float4 _bianse;
            uniform sampler2D _node_9941; uniform float4 _node_9941_ST;
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
                float4 _masktex_var = tex2D(_masktex,TRANSFORM_TEX(i.uv0, _masktex));
                float node_2359 = step(_shengcheng,_masktex_var.r);
                float node_1084 = (node_2359*0.85);
                float4 _node_9941_var = tex2D(_node_9941,TRANSFORM_TEX(i.uv0, _node_9941));
                float3 finalColor = ((_Maincolor.rgb*node_1084)+((node_2359-step((_shengcheng+0.03),_masktex_var.r))*_bianse.rgb)+(_bianse.rgb*_node_9941_var.r));
                fixed4 finalRGBA = fixed4(finalColor,(node_1084+(node_2359*_node_9941_var.r)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
