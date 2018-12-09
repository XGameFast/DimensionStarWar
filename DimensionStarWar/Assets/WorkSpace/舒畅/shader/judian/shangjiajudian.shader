// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33461,y:32737,varname:node_4013,prsc:2|emission-7002-OUT;n:type:ShaderForge.SFN_Tex2d,id:3992,x:32782,y:32756,ptovrint:False,ptlb:node_3992,ptin:_node_3992,varname:node_3992,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b812174eee039e45b82e95c98a4f8a8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8561,x:32368,y:33031,ptovrint:False,ptlb:node_8561,ptin:_node_8561,varname:node_8561,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:20294435796a70a44b512a1aab4a56a3,ntxv:0,isnm:False|UVIN-5759-OUT;n:type:ShaderForge.SFN_Power,id:2002,x:32587,y:32932,varname:node_2002,prsc:2|VAL-8561-R,EXP-4291-OUT;n:type:ShaderForge.SFN_Tex2d,id:2252,x:32587,y:33117,ptovrint:False,ptlb:caiwen,ptin:_caiwen,varname:node_2252,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:24e2243db5e39a54d8f7d6f5632d2f0c,ntxv:0,isnm:False|UVIN-7026-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3844,x:32888,y:33049,varname:node_3844,prsc:2|A-2002-OUT,B-2252-RGB,C-9598-R,D-7348-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7348,x:32587,y:33296,ptovrint:False,ptlb:caiwenqiang,ptin:_caiwenqiang,varname:node_7348,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Add,id:7002,x:33129,y:32845,varname:node_7002,prsc:2|A-3846-OUT,B-3844-OUT;n:type:ShaderForge.SFN_TexCoord,id:5173,x:31778,y:33133,varname:node_5173,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:9598,x:32712,y:33416,ptovrint:False,ptlb:node_9598,ptin:_node_9598,varname:node_9598,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dbe7741aaadea684abc54d114f25a1fb,ntxv:0,isnm:False|UVIN-5272-UVOUT;n:type:ShaderForge.SFN_Panner,id:5272,x:32358,y:33428,varname:node_5272,prsc:2,spu:0,spv:-0.3|UVIN-5173-UVOUT;n:type:ShaderForge.SFN_Rotator,id:7026,x:32368,y:33193,varname:node_7026,prsc:2|UVIN-5173-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3846,x:32979,y:32793,varname:node_3846,prsc:2|A-3992-RGB,B-5813-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5813,x:32782,y:32932,ptovrint:False,ptlb:node_5813,ptin:_node_5813,varname:node_5813,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.7;n:type:ShaderForge.SFN_Vector1,id:4291,x:32368,y:32951,varname:node_4291,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5759,x:32138,y:33031,varname:node_5759,prsc:2|A-5173-UVOUT,B-6970-OUT;n:type:ShaderForge.SFN_Vector2,id:6970,x:31778,y:33023,varname:node_6970,prsc:2,v1:2,v2:2;proporder:3992-8561-2252-7348-9598-5813;pass:END;sub:END;*/

Shader "Shader Forge/shangjiajudian" {
    Properties {
        _node_3992 ("node_3992", 2D) = "white" {}
        _node_8561 ("node_8561", 2D) = "white" {}
        _caiwen ("caiwen", 2D) = "white" {}
        _caiwenqiang ("caiwenqiang", Float ) = 2
        _node_9598 ("node_9598", 2D) = "white" {}
        _node_5813 ("node_5813", Float ) = 0.7
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
            uniform sampler2D _node_3992; uniform float4 _node_3992_ST;
            uniform sampler2D _node_8561; uniform float4 _node_8561_ST;
            uniform sampler2D _caiwen; uniform float4 _caiwen_ST;
            uniform float _caiwenqiang;
            uniform sampler2D _node_9598; uniform float4 _node_9598_ST;
            uniform float _node_5813;
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
                float4 _node_3992_var = tex2D(_node_3992,TRANSFORM_TEX(i.uv0, _node_3992));
                float2 node_5759 = (i.uv0*float2(2,2));
                float4 _node_8561_var = tex2D(_node_8561,TRANSFORM_TEX(node_5759, _node_8561));
                float4 node_8447 = _Time;
                float node_7026_ang = node_8447.g;
                float node_7026_spd = 1.0;
                float node_7026_cos = cos(node_7026_spd*node_7026_ang);
                float node_7026_sin = sin(node_7026_spd*node_7026_ang);
                float2 node_7026_piv = float2(0.5,0.5);
                float2 node_7026 = (mul(i.uv0-node_7026_piv,float2x2( node_7026_cos, -node_7026_sin, node_7026_sin, node_7026_cos))+node_7026_piv);
                float4 _caiwen_var = tex2D(_caiwen,TRANSFORM_TEX(node_7026, _caiwen));
                float2 node_5272 = (i.uv0+node_8447.g*float2(0,-0.3));
                float4 _node_9598_var = tex2D(_node_9598,TRANSFORM_TEX(node_5272, _node_9598));
                float3 emissive = ((_node_3992_var.rgb*_node_5813)+(pow(_node_8561_var.r,2.0)*_caiwen_var.rgb*_node_9598_var.r*_caiwenqiang));
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
