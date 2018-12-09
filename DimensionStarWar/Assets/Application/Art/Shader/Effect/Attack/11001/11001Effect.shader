// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33476,y:32698,varname:node_9361,prsc:2|custl-5544-OUT,alpha-9601-OUT,clip-4330-OUT;n:type:ShaderForge.SFN_Tex2d,id:4698,x:32711,y:32486,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4698,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4765,x:32032,y:32864,varname:node_4765,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Distance,id:3260,x:32404,y:32938,varname:node_3260,prsc:2|A-4765-UVOUT,B-6454-OUT;n:type:ShaderForge.SFN_Vector2,id:6454,x:32032,y:32999,varname:node_6454,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Step,id:4330,x:32697,y:33170,varname:node_4330,prsc:2|A-3260-OUT,B-9290-OUT;n:type:ShaderForge.SFN_Slider,id:9290,x:31403,y:33238,ptovrint:False,ptlb:value,ptin:_value,varname:node_9290,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:9601,x:33137,y:32902,varname:node_9601,prsc:2|A-6781-OUT,B-4698-A;n:type:ShaderForge.SFN_Color,id:312,x:32694,y:32677,ptovrint:False,ptlb:LItColor,ptin:_LItColor,varname:node_312,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:4351,x:32655,y:32904,varname:node_4351,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5544,x:32914,y:32753,varname:node_5544,prsc:2|A-312-RGB,B-4351-OUT,C-4698-RGB;n:type:ShaderForge.SFN_Divide,id:7884,x:32673,y:33005,varname:node_7884,prsc:2|A-3260-OUT,B-9290-OUT;n:type:ShaderForge.SFN_OneMinus,id:6102,x:32837,y:33005,varname:node_6102,prsc:2|IN-7884-OUT;n:type:ShaderForge.SFN_RemapRange,id:6781,x:32969,y:32955,varname:node_6781,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:1|IN-6102-OUT;proporder:4698-9290-312;pass:END;sub:END;*/

Shader "Shader Forge/11001Effect" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _value ("value", Range(0, 1)) = 1
        [HDR]_LItColor ("LItColor", Color) = (0.5,0.5,0.5,1)
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _value;
            uniform float4 _LItColor;
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
                float node_3260 = distance(i.uv0,float2(0.5,0.5));
                clip(step(node_3260,_value) - 0.5);
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = (_LItColor.rgb*2.0*_MainTex_var.rgb);
                fixed4 finalRGBA = fixed4(finalColor,(((1.0 - (node_3260/_value))*2.0+0.0)*_MainTex_var.a));
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
            Cull Back
            
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
            uniform float _value;
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
                float node_3260 = distance(i.uv0,float2(0.5,0.5));
                clip(step(node_3260,_value) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
