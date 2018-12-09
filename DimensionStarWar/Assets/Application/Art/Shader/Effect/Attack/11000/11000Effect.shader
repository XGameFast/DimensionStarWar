// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33476,y:32698,varname:node_9361,prsc:2|custl-2689-OUT,alpha-4698-A,clip-9043-OUT;n:type:ShaderForge.SFN_Tex2d,id:4698,x:32553,y:32420,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4698,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1a78ee1faeb5bdd4089c9f0ca0f7e7d8,ntxv:0,isnm:False|UVIN-6092-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4765,x:32049,y:32708,varname:node_4765,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:9290,x:32005,y:33085,ptovrint:False,ptlb:value,ptin:_value,varname:node_9290,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Color,id:312,x:32538,y:32684,ptovrint:False,ptlb:LItColor,ptin:_LItColor,varname:node_312,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:4351,x:32538,y:32837,varname:node_4351,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5544,x:32799,y:32700,varname:node_5544,prsc:2|A-312-RGB,B-4351-OUT,C-4698-RGB;n:type:ShaderForge.SFN_Panner,id:6092,x:32306,y:32656,varname:node_6092,prsc:2,spu:0,spv:-0.5|UVIN-4765-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3093,x:32026,y:32889,ptovrint:False,ptlb:noise,ptin:_noise,varname:node_3093,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b9d6c5b05059c6c429143498db2233cd,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:2364,x:32005,y:33232,ptovrint:False,ptlb:power,ptin:_power,varname:node_2364,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:1,max:1;n:type:ShaderForge.SFN_Distance,id:7439,x:32350,y:32837,varname:node_7439,prsc:2|A-4765-V,B-971-OUT;n:type:ShaderForge.SFN_Step,id:4118,x:32518,y:32976,varname:node_4118,prsc:2|A-9290-OUT,B-7439-OUT;n:type:ShaderForge.SFN_Vector1,id:971,x:32162,y:32860,varname:node_971,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:145,x:32679,y:32955,varname:node_145,prsc:2|IN-4118-OUT;n:type:ShaderForge.SFN_Multiply,id:9043,x:32964,y:33109,varname:node_9043,prsc:2|A-145-OUT,B-3093-R;n:type:ShaderForge.SFN_Step,id:8426,x:32604,y:33142,varname:node_8426,prsc:2|A-2364-OUT,B-3093-R;n:type:ShaderForge.SFN_Add,id:2689,x:33061,y:32873,varname:node_2689,prsc:2|A-5544-OUT,B-8426-OUT;proporder:4698-9290-312-3093-2364;pass:END;sub:END;*/

Shader "Shader Forge/11000Effect" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _value ("value", Range(0, 1)) = 1
        [HDR]_LItColor ("LItColor", Color) = (0.5,0.5,0.5,1)
        _noise ("noise", 2D) = "white" {}
        _power ("power", Range(0.1, 1)) = 1
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
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float _power;
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
                float node_7439 = distance(i.uv0.g,0.5);
                float node_4118 = step(_value,node_7439);
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                clip(((1.0 - node_4118)*_noise_var.r) - 0.5);
////// Lighting:
                float4 node_4968 = _Time;
                float2 node_6092 = (i.uv0+node_4968.g*float2(0,-0.5));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_6092, _MainTex));
                float3 node_5544 = (_LItColor.rgb*2.0*_MainTex_var.rgb);
                float3 finalColor = (node_5544+step(_power,_noise_var.r));
                fixed4 finalRGBA = fixed4(finalColor,_MainTex_var.a);
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
            uniform sampler2D _noise; uniform float4 _noise_ST;
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
                float node_7439 = distance(i.uv0.g,0.5);
                float node_4118 = step(_value,node_7439);
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                clip(((1.0 - node_4118)*_noise_var.r) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
