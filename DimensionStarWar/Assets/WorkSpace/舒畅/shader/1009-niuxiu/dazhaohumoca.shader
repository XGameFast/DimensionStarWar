// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33810,y:32642,varname:node_4013,prsc:2|custl-1566-OUT,alpha-4269-OUT;n:type:ShaderForge.SFN_Tex2d,id:6729,x:32996,y:32735,ptovrint:False,ptlb:node_6729,ptin:_node_6729,varname:node_6729,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6f9c9ad4b1caae64b98f602434afaf8f,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1428,x:32394,y:32846,ptovrint:False,ptlb:node_1428,ptin:_node_1428,varname:node_1428,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:51367dfeea6195443b62d62e70f7435b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1566,x:33217,y:32812,varname:node_1566,prsc:2|A-6729-R,B-7693-OUT;n:type:ShaderForge.SFN_OneMinus,id:4072,x:32560,y:32863,varname:node_4072,prsc:2|IN-1428-R;n:type:ShaderForge.SFN_Power,id:7693,x:32753,y:32863,varname:node_7693,prsc:2|VAL-4072-OUT,EXP-5996-OUT;n:type:ShaderForge.SFN_Vector1,id:5996,x:32487,y:33069,varname:node_5996,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Step,id:2364,x:33092,y:33003,varname:node_2364,prsc:2|A-5127-A,B-7693-OUT;n:type:ShaderForge.SFN_Multiply,id:5442,x:33445,y:32925,varname:node_5442,prsc:2|A-1566-OUT,B-2364-OUT;n:type:ShaderForge.SFN_VertexColor,id:5127,x:32789,y:33228,varname:node_5127,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4269,x:33643,y:32986,varname:node_4269,prsc:2|A-5442-OUT,B-2572-OUT;n:type:ShaderForge.SFN_Slider,id:2572,x:33288,y:33124,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_2572,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:6729-1428-2572;pass:END;sub:END;*/

Shader "Shader Forge/dazhaohumoca" {
    Properties {
        _node_6729 ("node_6729", 2D) = "white" {}
        _node_1428 ("node_1428", 2D) = "white" {}
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
            uniform sampler2D _node_6729; uniform float4 _node_6729_ST;
            uniform sampler2D _node_1428; uniform float4 _node_1428_ST;
            uniform float _alpha;
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
                float4 _node_6729_var = tex2D(_node_6729,TRANSFORM_TEX(i.uv0, _node_6729));
                float4 _node_1428_var = tex2D(_node_1428,TRANSFORM_TEX(i.uv0, _node_1428));
                float node_7693 = pow((1.0 - _node_1428_var.r),0.5);
                float node_1566 = (_node_6729_var.r*node_7693);
                float3 finalColor = float3(node_1566,node_1566,node_1566);
                fixed4 finalRGBA = fixed4(finalColor,((node_1566*step(i.vertexColor.a,node_7693))*_alpha));
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
