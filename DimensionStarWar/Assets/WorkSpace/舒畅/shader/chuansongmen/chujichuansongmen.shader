// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33635,y:32730,varname:node_4013,prsc:2|emission-4825-OUT,alpha-2-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:33202,y:32529,ptovrint:False,ptlb:niuwense,ptin:_niuwense,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:7852,x:31908,y:32812,ptovrint:False,ptlb:node_7852,ptin:_node_7852,varname:node_7852,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b2e9ec8b8d9cb44a8817bec1701d420,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8706,x:32983,y:32693,ptovrint:False,ptlb:node_8706,ptin:_node_8706,varname:node_8706,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0525f5ac47fca9c4eb41c0acfe31e574,ntxv:0,isnm:False|UVIN-1946-UVOUT;n:type:ShaderForge.SFN_Panner,id:1096,x:32099,y:32567,varname:node_1096,prsc:2,spu:0.01,spv:0.01|UVIN-1761-UVOUT;n:type:ShaderForge.SFN_Panner,id:1950,x:32114,y:32897,varname:node_1950,prsc:2,spu:-0.01,spv:-0.015|UVIN-1761-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1761,x:31908,y:32601,varname:node_1761,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:3415,x:32286,y:32624,varname:node_3415,prsc:2,tex:6b2e9ec8b8d9cb44a8817bec1701d420,ntxv:0,isnm:False|UVIN-1096-UVOUT,TEX-7852-TEX;n:type:ShaderForge.SFN_Tex2d,id:3042,x:32286,y:32819,varname:node_3042,prsc:2,tex:6b2e9ec8b8d9cb44a8817bec1701d420,ntxv:0,isnm:False|UVIN-1950-UVOUT,TEX-7852-TEX;n:type:ShaderForge.SFN_Add,id:1183,x:32648,y:32693,varname:node_1183,prsc:2|A-6686-OUT,B-1410-UVOUT;n:type:ShaderForge.SFN_Power,id:2,x:33150,y:32968,varname:node_2,prsc:2|VAL-8706-R,EXP-7607-OUT;n:type:ShaderForge.SFN_Vector1,id:7607,x:32885,y:32970,varname:node_7607,prsc:2,v1:0.7;n:type:ShaderForge.SFN_TexCoord,id:1410,x:32468,y:32831,varname:node_1410,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:1946,x:32823,y:32693,varname:node_1946,prsc:2,spu:0,spv:0.1|UVIN-1183-OUT;n:type:ShaderForge.SFN_Add,id:3575,x:33202,y:32673,varname:node_3575,prsc:2|A-1861-OUT,B-2-OUT;n:type:ShaderForge.SFN_TexCoord,id:6588,x:32437,y:32307,varname:node_6588,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4825,x:33418,y:32684,varname:node_4825,prsc:2|A-1304-RGB,B-3575-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5461,x:31947,y:32250,ptovrint:False,ptlb:node_5461,ptin:_node_5461,varname:node_5461,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0e54ee3595ac28a4a82637ce25d86a34,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4738,x:32812,y:32203,varname:node_4738,prsc:2,tex:0e54ee3595ac28a4a82637ce25d86a34,ntxv:0,isnm:False|UVIN-6096-UVOUT,TEX-5461-TEX;n:type:ShaderForge.SFN_Tex2d,id:9290,x:32824,y:32394,varname:node_9290,prsc:2,tex:0e54ee3595ac28a4a82637ce25d86a34,ntxv:0,isnm:False|UVIN-2503-UVOUT,TEX-5461-TEX;n:type:ShaderForge.SFN_Panner,id:6096,x:32658,y:32203,varname:node_6096,prsc:2,spu:0.01,spv:0|UVIN-6588-UVOUT;n:type:ShaderForge.SFN_Panner,id:2503,x:32658,y:32394,varname:node_2503,prsc:2,spu:-0.014,spv:0|UVIN-6588-UVOUT;n:type:ShaderForge.SFN_Add,id:8396,x:32997,y:32297,varname:node_8396,prsc:2|A-4738-R,B-9290-R;n:type:ShaderForge.SFN_Multiply,id:1861,x:33150,y:32295,varname:node_1861,prsc:2|A-8396-OUT,B-2125-RGB;n:type:ShaderForge.SFN_Color,id:2125,x:32997,y:32159,ptovrint:False,ptlb:bianyuanse,ptin:_bianyuanse,varname:node_2125,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1470588,c2:0.7176469,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:6686,x:32468,y:32672,varname:node_6686,prsc:2|A-3415-R,B-3042-R;proporder:1304-7852-8706-5461-2125;pass:END;sub:END;*/

Shader "Shader Forge/chujichuansongmen" {
    Properties {
        [HDR]_niuwense ("niuwense", Color) = (1,1,1,1)
        _node_7852 ("node_7852", 2D) = "white" {}
        _node_8706 ("node_8706", 2D) = "white" {}
        _node_5461 ("node_5461", 2D) = "white" {}
        [HDR]_bianyuanse ("bianyuanse", Color) = (0.1470588,0.7176469,1,1)
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
            uniform float4 _niuwense;
            uniform sampler2D _node_7852; uniform float4 _node_7852_ST;
            uniform sampler2D _node_8706; uniform float4 _node_8706_ST;
            uniform sampler2D _node_5461; uniform float4 _node_5461_ST;
            uniform float4 _bianyuanse;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_4851 = _Time;
                float2 node_6096 = (i.uv0+node_4851.g*float2(0.01,0));
                float4 node_4738 = tex2D(_node_5461,TRANSFORM_TEX(node_6096, _node_5461));
                float2 node_2503 = (i.uv0+node_4851.g*float2(-0.014,0));
                float4 node_9290 = tex2D(_node_5461,TRANSFORM_TEX(node_2503, _node_5461));
                float2 node_1096 = (i.uv1+node_4851.g*float2(0.01,0.01));
                float4 node_3415 = tex2D(_node_7852,TRANSFORM_TEX(node_1096, _node_7852));
                float2 node_1950 = (i.uv1+node_4851.g*float2(-0.01,-0.015));
                float4 node_3042 = tex2D(_node_7852,TRANSFORM_TEX(node_1950, _node_7852));
                float2 node_1946 = (((node_3415.r+node_3042.r)+i.uv0)+node_4851.g*float2(0,0.1));
                float4 _node_8706_var = tex2D(_node_8706,TRANSFORM_TEX(node_1946, _node_8706));
                float node_2 = pow(_node_8706_var.r,0.7);
                float3 emissive = (_niuwense.rgb*(((node_4738.r+node_9290.r)*_bianyuanse.rgb)+node_2));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,node_2);
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
