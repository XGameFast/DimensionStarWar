// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33651,y:32684,varname:node_9361,prsc:2|custl-7578-OUT,alpha-391-OUT;n:type:ShaderForge.SFN_Tex2d,id:2360,x:32391,y:32863,ptovrint:False,ptlb:node_2360,ptin:_node_2360,varname:node_2360,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0839562779f0c0543aaa239b78bd12b9,ntxv:0,isnm:False|UVIN-2654-OUT;n:type:ShaderForge.SFN_Multiply,id:2654,x:32211,y:32854,varname:node_2654,prsc:2|A-810-UVOUT,B-7469-OUT;n:type:ShaderForge.SFN_Vector2,id:7469,x:31980,y:32996,varname:node_7469,prsc:2,v1:10,v2:2;n:type:ShaderForge.SFN_Slider,id:1294,x:31980,y:33108,ptovrint:False,ptlb:node_1294,ptin:_node_1294,varname:node_1294,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Step,id:3570,x:32619,y:32945,varname:node_3570,prsc:2|A-2360-R,B-1294-OUT;n:type:ShaderForge.SFN_Tex2d,id:6619,x:32360,y:32453,ptovrint:False,ptlb:node_6619,ptin:_node_6619,varname:node_6619,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-4240-UVOUT;n:type:ShaderForge.SFN_Panner,id:4240,x:32173,y:32472,varname:node_4240,prsc:2,spu:0.1,spv:0.2|UVIN-2753-OUT;n:type:ShaderForge.SFN_TexCoord,id:810,x:31725,y:32372,varname:node_810,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Color,id:2291,x:32602,y:32302,ptovrint:False,ptlb:liudongwenli color,ptin:_liudongwenlicolor,varname:node_2291,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1838235,c2:0.3920891,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:9251,x:32602,y:32453,varname:node_9251,prsc:2|A-3971-RGB,B-6619-R;n:type:ShaderForge.SFN_Tex2d,id:3971,x:32360,y:32282,ptovrint:False,ptlb:node_3971,ptin:_node_3971,varname:node_3971,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-8321-UVOUT;n:type:ShaderForge.SFN_Panner,id:8321,x:32173,y:32307,varname:node_8321,prsc:2,spu:0.2,spv:0.2|UVIN-2753-OUT;n:type:ShaderForge.SFN_Multiply,id:6043,x:32842,y:32453,varname:node_6043,prsc:2|A-9251-OUT,B-2291-RGB,C-450-OUT;n:type:ShaderForge.SFN_Add,id:3899,x:33065,y:32581,varname:node_3899,prsc:2|A-6043-OUT,B-4888-OUT;n:type:ShaderForge.SFN_Multiply,id:2753,x:31944,y:32423,varname:node_2753,prsc:2|A-810-UVOUT,B-6508-OUT;n:type:ShaderForge.SFN_Vector2,id:6508,x:31725,y:32519,varname:node_6508,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_Step,id:7818,x:32619,y:33104,varname:node_7818,prsc:2|A-2360-R,B-5639-OUT;n:type:ShaderForge.SFN_Subtract,id:2612,x:32813,y:33002,varname:node_2612,prsc:2|A-7818-OUT,B-3570-OUT;n:type:ShaderForge.SFN_Multiply,id:4888,x:33041,y:33071,varname:node_4888,prsc:2|A-2612-OUT,B-1325-RGB;n:type:ShaderForge.SFN_Color,id:1325,x:32802,y:33218,ptovrint:False,ptlb:node_1325,ptin:_node_1325,varname:node_1325,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2647059,c2:0.9391481,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7578,x:33387,y:32621,varname:node_7578,prsc:2|A-3899-OUT,B-78-OUT;n:type:ShaderForge.SFN_ValueProperty,id:78,x:33127,y:32496,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_78,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:450,x:32602,y:32586,varname:node_450,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:391,x:33379,y:33094,varname:node_391,prsc:2|A-7818-OUT,B-5912-OUT;n:type:ShaderForge.SFN_Slider,id:5912,x:33017,y:33239,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_5912,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRange,id:5639,x:32372,y:33120,varname:node_5639,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1.1|IN-1294-OUT;proporder:2360-1294-6619-2291-3971-1325-78-5912;pass:END;sub:END;*/

Shader "Shader Forge/jianzaoshengzhang" {
    Properties {
        _node_2360 ("node_2360", 2D) = "white" {}
        _node_1294 ("node_1294", Range(0, 1)) = 1
        _node_6619 ("node_6619", 2D) = "white" {}
        _liudongwenlicolor ("liudongwenli color", Color) = (0.1838235,0.3920891,1,1)
        _node_3971 ("node_3971", 2D) = "white" {}
        _node_1325 ("node_1325", Color) = (0.2647059,0.9391481,1,1)
        _Intensity ("Intensity", Float ) = 1
        _alpha ("alpha", Range(0, 1)) = 1
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
            uniform sampler2D _node_2360; uniform float4 _node_2360_ST;
            uniform float _node_1294;
            uniform sampler2D _node_6619; uniform float4 _node_6619_ST;
            uniform float4 _liudongwenlicolor;
            uniform sampler2D _node_3971; uniform float4 _node_3971_ST;
            uniform float4 _node_1325;
            uniform float _Intensity;
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
                float4 node_851 = _Time;
                float2 node_2753 = (i.uv0*float2(2,2));
                float2 node_8321 = (node_2753+node_851.g*float2(0.2,0.2));
                float4 _node_3971_var = tex2D(_node_3971,TRANSFORM_TEX(node_8321, _node_3971));
                float2 node_4240 = (node_2753+node_851.g*float2(0.1,0.2));
                float4 _node_6619_var = tex2D(_node_6619,TRANSFORM_TEX(node_4240, _node_6619));
                float2 node_2654 = (i.uv0*float2(10,2));
                float4 _node_2360_var = tex2D(_node_2360,TRANSFORM_TEX(node_2654, _node_2360));
                float node_7818 = step(_node_2360_var.r,(_node_1294*1.1+0.0));
                float3 finalColor = ((((_node_3971_var.rgb+_node_6619_var.r)*_liudongwenlicolor.rgb*2.0)+((node_7818-step(_node_2360_var.r,_node_1294))*_node_1325.rgb))*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,(node_7818*_alpha));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
