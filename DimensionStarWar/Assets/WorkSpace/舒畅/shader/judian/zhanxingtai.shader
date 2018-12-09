// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33355,y:32744,varname:node_4013,prsc:2|emission-9721-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32674,y:32998,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6059839,c2:1,c3:0.2279412,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6963,x:32674,y:32801,ptovrint:False,ptlb:zhanxingtai,ptin:_zhanxingtai,varname:node_6963,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:2061,x:32503,y:33162,varname:node_2061,prsc:2,spu:0.1,spv:0.2|UVIN-5245-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8061,x:32674,y:33162,ptovrint:False,ptlb:node_8061,ptin:_node_8061,varname:node_8061,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-2061-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5245,x:32319,y:33162,varname:node_5245,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9721,x:33106,y:32922,varname:node_9721,prsc:2|A-6963-RGB,B-4743-OUT;n:type:ShaderForge.SFN_Multiply,id:4743,x:32897,y:33085,varname:node_4743,prsc:2|A-1304-RGB,B-9145-OUT,C-8061-R;n:type:ShaderForge.SFN_Vector1,id:9145,x:32674,y:33344,varname:node_9145,prsc:2,v1:1;proporder:1304-6963-8061;pass:END;sub:END;*/

Shader "Shader Forge/zhanxingtai" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.6059839,1,0.2279412,1)
        _zhanxingtai ("zhanxingtai", 2D) = "white" {}
        _node_8061 ("node_8061", 2D) = "white" {}
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
            uniform float4 _Color;
            uniform sampler2D _zhanxingtai; uniform float4 _zhanxingtai_ST;
            uniform sampler2D _node_8061; uniform float4 _node_8061_ST;
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
                float4 _zhanxingtai_var = tex2D(_zhanxingtai,TRANSFORM_TEX(i.uv0, _zhanxingtai));
                float4 node_7449 = _Time;
                float2 node_2061 = (i.uv0+node_7449.g*float2(0.1,0.2));
                float4 _node_8061_var = tex2D(_node_8061,TRANSFORM_TEX(node_2061, _node_8061));
                float3 emissive = (_zhanxingtai_var.rgb+(_Color.rgb*1.0*_node_8061_var.r));
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
