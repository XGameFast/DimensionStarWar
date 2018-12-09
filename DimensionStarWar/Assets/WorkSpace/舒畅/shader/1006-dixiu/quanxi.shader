// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33068,y:32441,varname:node_9361,prsc:2|custl-4625-OUT,alpha-6061-OUT;n:type:ShaderForge.SFN_Tex2d,id:5414,x:32320,y:32613,ptovrint:False,ptlb:Maintex,ptin:_Maintex,varname:node_5414,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:81fcaacc3d9ac9c499b123c6cf659269,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4625,x:32638,y:32620,varname:node_4625,prsc:2|A-4708-RGB,B-5414-R;n:type:ShaderForge.SFN_Color,id:4708,x:32320,y:32448,ptovrint:False,ptlb:color,ptin:_color,varname:node_4708,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:3705,x:32060,y:32829,varname:node_3705,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:8518,x:32229,y:32829,varname:node_8518,prsc:2,spu:0,spv:-4|UVIN-3705-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:1982,x:32408,y:32829,ptovrint:False,ptlb:node_1982,ptin:_node_1982,varname:node_1982,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1c6df1ebfac48e949ba92847089b6db5,ntxv:0,isnm:False|UVIN-8518-UVOUT;n:type:ShaderForge.SFN_Power,id:6207,x:32638,y:32846,varname:node_6207,prsc:2|VAL-1982-R,EXP-1337-OUT;n:type:ShaderForge.SFN_Vector1,id:1337,x:32408,y:32983,varname:node_1337,prsc:2,v1:100;n:type:ShaderForge.SFN_Multiply,id:6061,x:32889,y:32717,varname:node_6061,prsc:2|A-5414-R,B-6207-OUT;proporder:5414-4708-1982;pass:END;sub:END;*/

Shader "Shader Forge/quanxi" {
    Properties {
        _Maintex ("Maintex", 2D) = "white" {}
        [HDR]_color ("color", Color) = (0,1,1,1)
        _node_1982 ("node_1982", 2D) = "white" {}
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
            uniform sampler2D _Maintex; uniform float4 _Maintex_ST;
            uniform float4 _color;
            uniform sampler2D _node_1982; uniform float4 _node_1982_ST;
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
                float4 _Maintex_var = tex2D(_Maintex,TRANSFORM_TEX(i.uv0, _Maintex));
                float3 finalColor = (_color.rgb*_Maintex_var.r);
                float4 node_3461 = _Time;
                float2 node_8518 = (i.uv0+node_3461.g*float2(0,-4));
                float4 _node_1982_var = tex2D(_node_1982,TRANSFORM_TEX(node_8518, _node_1982));
                fixed4 finalRGBA = fixed4(finalColor,(_Maintex_var.r*pow(_node_1982_var.r,100.0)));
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
