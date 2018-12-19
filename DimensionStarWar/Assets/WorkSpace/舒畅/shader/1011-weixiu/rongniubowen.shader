// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33195,y:33364,varname:node_9361,prsc:2|custl-461-OUT,alpha-2650-OUT;n:type:ShaderForge.SFN_Step,id:2545,x:32590,y:33384,varname:node_2545,prsc:2|A-860-OUT,B-7157-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7550,x:31329,y:33001,ptovrint:False,ptlb:node_7550,ptin:_node_7550,varname:node_7550,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8111,x:31518,y:32849,varname:node_8111,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-5910-UVOUT,TEX-7550-TEX;n:type:ShaderForge.SFN_Tex2d,id:3,x:31518,y:33150,varname:_node_8111_copy,prsc:2,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-9259-UVOUT,TEX-7550-TEX;n:type:ShaderForge.SFN_Panner,id:5910,x:31329,y:32849,varname:node_5910,prsc:2,spu:0.5,spv:0.3|UVIN-3535-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3535,x:31161,y:32991,varname:node_3535,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:9259,x:31329,y:33150,varname:node_9259,prsc:2,spu:-0.3,spv:0.6|UVIN-3535-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4186,x:31701,y:33001,varname:node_4186,prsc:2|A-8111-R,B-3-R;n:type:ShaderForge.SFN_Add,id:8429,x:32389,y:33606,varname:node_8429,prsc:2|A-7157-OUT,B-7895-OUT;n:type:ShaderForge.SFN_Vector1,id:7895,x:32230,y:33650,varname:node_7895,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Step,id:5501,x:32590,y:33580,varname:node_5501,prsc:2|A-860-OUT,B-8429-OUT;n:type:ShaderForge.SFN_Subtract,id:9926,x:32769,y:33491,varname:node_9926,prsc:2|A-5501-OUT,B-2545-OUT;n:type:ShaderForge.SFN_Distance,id:2707,x:31365,y:33410,varname:node_2707,prsc:2|A-3535-UVOUT,B-4236-OUT;n:type:ShaderForge.SFN_Vector2,id:4236,x:31201,y:33428,varname:node_4236,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_RemapRange,id:5353,x:31523,y:33410,varname:node_5353,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:1|IN-2707-OUT;n:type:ShaderForge.SFN_OneMinus,id:7979,x:31681,y:33410,varname:node_7979,prsc:2|IN-5353-OUT;n:type:ShaderForge.SFN_Multiply,id:6883,x:31869,y:33192,varname:node_6883,prsc:2|A-4186-OUT,B-7979-OUT;n:type:ShaderForge.SFN_Add,id:860,x:32047,y:33192,varname:node_860,prsc:2|A-6883-OUT,B-6302-OUT;n:type:ShaderForge.SFN_Multiply,id:6302,x:31896,y:33422,varname:node_6302,prsc:2|A-7979-OUT,B-8826-OUT;n:type:ShaderForge.SFN_Multiply,id:461,x:33003,y:33396,varname:node_461,prsc:2|A-9926-OUT,B-4927-RGB,C-6085-OUT;n:type:ShaderForge.SFN_Multiply,id:2650,x:32984,y:33613,varname:node_2650,prsc:2|A-9926-OUT,B-4927-A;n:type:ShaderForge.SFN_VertexColor,id:4927,x:32771,y:33682,varname:node_4927,prsc:2;n:type:ShaderForge.SFN_Vector1,id:8826,x:31681,y:33541,varname:node_8826,prsc:2,v1:0.4145581;n:type:ShaderForge.SFN_Vector1,id:7157,x:32230,y:33557,varname:node_7157,prsc:2,v1:0.1592097;n:type:ShaderForge.SFN_ValueProperty,id:6085,x:32769,y:33384,ptovrint:False,ptlb:intensity,ptin:_intensity,varname:node_6085,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:7550-6085;pass:END;sub:END;*/

Shader "Shader Forge/rongniubowen" {
    Properties {
        _node_7550 ("node_7550", 2D) = "white" {}
        _intensity ("intensity", Float ) = 1
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
            uniform sampler2D _node_7550; uniform float4 _node_7550_ST;
            uniform float _intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_1385 = _Time;
                float2 node_5910 = (i.uv0+node_1385.g*float2(0.5,0.3));
                float4 node_8111 = tex2D(_node_7550,TRANSFORM_TEX(node_5910, _node_7550));
                float2 node_9259 = (i.uv0+node_1385.g*float2(-0.3,0.6));
                float4 _node_8111_copy = tex2D(_node_7550,TRANSFORM_TEX(node_9259, _node_7550));
                float node_7979 = (1.0 - (distance(i.uv0,float2(0.5,0.5))*2.0+0.0));
                float node_860 = (((node_8111.r*_node_8111_copy.r)*node_7979)+(node_7979*0.4145581));
                float node_7157 = 0.1592097;
                float node_9926 = (step(node_860,(node_7157+0.01))-step(node_860,node_7157));
                float3 finalColor = (node_9926*i.vertexColor.rgb*_intensity);
                fixed4 finalRGBA = fixed4(finalColor,(node_9926*i.vertexColor.a));
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
