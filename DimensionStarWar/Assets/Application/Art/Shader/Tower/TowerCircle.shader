// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-4238-OUT,alpha-930-OUT,clip-588-OUT;n:type:ShaderForge.SFN_TexCoord,id:2147,x:31931,y:32986,varname:node_2147,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:7733,x:31931,y:33165,varname:node_7733,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:6092,x:32149,y:33071,varname:node_6092,prsc:2|A-2147-UVOUT,B-7733-OUT;n:type:ShaderForge.SFN_OneMinus,id:588,x:32481,y:33084,varname:node_588,prsc:2|IN-6092-OUT;n:type:ShaderForge.SFN_Exp,id:7373,x:32219,y:32623,varname:node_7373,prsc:2,et:0|IN-3074-OUT;n:type:ShaderForge.SFN_Slider,id:3074,x:31853,y:32654,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_3074,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.111112,max:5;n:type:ShaderForge.SFN_Color,id:4235,x:32267,y:32345,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_4235,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:4313,x:32254,y:32498,varname:node_4313,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:4238,x:32521,y:32438,varname:node_4238,prsc:2|A-4235-RGB,B-4313-OUT;n:type:ShaderForge.SFN_Divide,id:7365,x:32423,y:32831,varname:node_7365,prsc:2|A-6092-OUT,B-5324-OUT;n:type:ShaderForge.SFN_Power,id:930,x:32654,y:32745,varname:node_930,prsc:2|VAL-7365-OUT,EXP-7373-OUT;n:type:ShaderForge.SFN_Slider,id:5324,x:31853,y:32797,ptovrint:False,ptlb:Circle,ptin:_Circle,varname:node_5324,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.3666667,max:0.5;proporder:3074-4235-5324;pass:END;sub:END;*/

Shader "Shader Forge/TowerCircle" {
    Properties {
        _Power ("Power", Range(0, 5)) = 1.111112
        [HDR]_Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Circle ("Circle", Range(0.1, 0.5)) = 0.3666667
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
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _Power;
            uniform float4 _Color;
            uniform float _Circle;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_6092 = distance(i.uv0,float2(0.5,0.5));
                clip((1.0 - node_6092) - 0.5);
////// Lighting:
                float3 finalColor = (_Color.rgb*2.0);
                return fixed4(finalColor,pow((node_6092/_Circle),exp(_Power)));
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_6092 = distance(i.uv0,float2(0.5,0.5));
                clip((1.0 - node_6092) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
