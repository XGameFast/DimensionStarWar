// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34329,y:32702,varname:node_4013,prsc:2|emission-6845-OUT;n:type:ShaderForge.SFN_Panner,id:5577,x:33109,y:32660,varname:node_5577,prsc:2,spu:0.1,spv:0.2|UVIN-136-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:136,x:32906,y:32660,varname:node_136,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:9718,x:33302,y:32552,ptovrint:False,ptlb:lan,ptin:_lan,varname:node_9718,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Tex2d,id:2675,x:33734,y:33048,ptovrint:False,ptlb:node_2675,ptin:_node_2675,varname:node_2675,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e7bcaa20183dd854e9fcb60aee9bff39,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2160,x:33859,y:32525,ptovrint:False,ptlb:node_2160,ptin:_node_2160,varname:node_2160,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6553e08aa43b7be47bb3e2e945c4e5f9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7999,x:33970,y:32938,varname:node_7999,prsc:2|A-5458-OUT,B-2675-R,C-4034-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4034,x:33817,y:32771,ptovrint:False,ptlb:zongqiang,ptin:_zongqiang,varname:node_4034,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:6845,x:34151,y:32725,varname:node_6845,prsc:2|A-2160-RGB,B-7999-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:2126,x:32744,y:32444,ptovrint:False,ptlb:node_2126,ptin:_node_2126,varname:node_2126,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5044,x:33304,y:32660,varname:node_5044,prsc:2,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-5577-UVOUT,TEX-2126-TEX;n:type:ShaderForge.SFN_Tex2d,id:1920,x:33304,y:32890,varname:node_1920,prsc:2,tex:2a9af0d6364f8da43bc827ff5408c4a9,ntxv:0,isnm:False|UVIN-8050-UVOUT,TEX-2126-TEX;n:type:ShaderForge.SFN_Panner,id:8050,x:33109,y:32880,varname:node_8050,prsc:2,spu:-0.3,spv:-0.05|UVIN-136-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9608,x:33544,y:32890,varname:node_9608,prsc:2|A-1512-OUT,B-1920-B,C-8319-RGB;n:type:ShaderForge.SFN_Color,id:8319,x:33304,y:33041,ptovrint:False,ptlb:node_8319,ptin:_node_8319,varname:node_8319,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4075051,c2:1,c3:0.06617647,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:1512,x:33304,y:32832,ptovrint:False,ptlb:lv,ptin:_lv,varname:node_1512,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:5458,x:33659,y:32712,varname:node_5458,prsc:2|A-8419-OUT,B-9608-OUT;n:type:ShaderForge.SFN_Multiply,id:8419,x:33487,y:32660,varname:node_8419,prsc:2|A-9718-OUT,B-5044-RGB;proporder:9718-2160-2675-4034-2126-8319-1512;pass:END;sub:END;*/

Shader "Shader Forge/judian" {
    Properties {
        _lan ("lan", Float ) = 2
        _node_2160 ("node_2160", 2D) = "white" {}
        _node_2675 ("node_2675", 2D) = "white" {}
        _zongqiang ("zongqiang", Float ) = 1
        _node_2126 ("node_2126", 2D) = "white" {}
        _node_8319 ("node_8319", Color) = (0.4075051,1,0.06617647,1)
        _lv ("lv", Float ) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _lan;
            uniform sampler2D _node_2675; uniform float4 _node_2675_ST;
            uniform sampler2D _node_2160; uniform float4 _node_2160_ST;
            uniform float _zongqiang;
            uniform sampler2D _node_2126; uniform float4 _node_2126_ST;
            uniform float4 _node_8319;
            uniform float _lv;
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
////// Emissive:
                float4 _node_2160_var = tex2D(_node_2160,TRANSFORM_TEX(i.uv0, _node_2160));
                float4 node_7712 = _Time;
                float2 node_5577 = (i.uv0+node_7712.g*float2(0.1,0.2));
                float4 node_5044 = tex2D(_node_2126,TRANSFORM_TEX(node_5577, _node_2126));
                float2 node_8050 = (i.uv0+node_7712.g*float2(-0.3,-0.05));
                float4 node_1920 = tex2D(_node_2126,TRANSFORM_TEX(node_8050, _node_2126));
                float3 node_9608 = (_lv*node_1920.b*_node_8319.rgb);
                float4 _node_2675_var = tex2D(_node_2675,TRANSFORM_TEX(i.uv0, _node_2675));
                float3 emissive = (_node_2160_var.rgb+(((_lan*node_5044.rgb)+node_9608)*_node_2675_var.r*_zongqiang));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
