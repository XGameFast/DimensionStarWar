// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33956,y:32681,varname:node_9361,prsc:2|emission-5876-OUT,custl-3109-OUT,alpha-5946-OUT,clip-6995-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:2364,x:32093,y:32594,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2364,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0560065518c7a47b58c650f074db0059,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9929,x:32548,y:32584,varname:node_9929,prsc:2,tex:0560065518c7a47b58c650f074db0059,ntxv:0,isnm:False|UVIN-6746-UVOUT,TEX-2364-TEX;n:type:ShaderForge.SFN_TexCoord,id:4821,x:31550,y:32868,varname:node_4821,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:1437,x:31550,y:33073,varname:node_1437,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:1560,x:31774,y:32985,varname:node_1560,prsc:2|A-4821-UVOUT,B-1437-OUT;n:type:ShaderForge.SFN_Step,id:6995,x:32010,y:33079,varname:node_6995,prsc:2|A-1560-OUT,B-9365-OUT;n:type:ShaderForge.SFN_Vector1,id:9365,x:31753,y:33147,varname:node_9365,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Color,id:8004,x:32586,y:32783,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_8004,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:6732,x:32586,y:32930,varname:node_6732,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:3109,x:33070,y:32767,varname:node_3109,prsc:2|A-9969-OUT,B-8004-RGB,C-6732-OUT;n:type:ShaderForge.SFN_Step,id:2159,x:32774,y:32438,varname:node_2159,prsc:2|A-9929-RGB,B-3735-OUT;n:type:ShaderForge.SFN_Multiply,id:5946,x:32935,y:33172,varname:node_5946,prsc:2|A-9929-A,B-3175-OUT;n:type:ShaderForge.SFN_Parallax,id:7919,x:32209,y:33107,varname:node_7919,prsc:2|UVIN-4821-UVOUT,HEI-3412-OUT;n:type:ShaderForge.SFN_RemapRange,id:3412,x:32282,y:33262,varname:node_3412,prsc:2,frmn:0,frmx:1,tomn:0,tomx:-200|IN-6277-OUT;n:type:ShaderForge.SFN_Rotator,id:6746,x:32414,y:32846,varname:node_6746,prsc:2|UVIN-7919-UVOUT,PIV-1437-OUT,SPD-8167-OUT;n:type:ShaderForge.SFN_Slider,id:6277,x:31315,y:33485,ptovrint:False,ptlb:Value,ptin:_Value,varname:node_6277,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_OneMinus,id:7023,x:32970,y:32438,varname:node_7023,prsc:2|IN-2159-OUT;n:type:ShaderForge.SFN_Step,id:8587,x:32742,y:32248,varname:node_8587,prsc:2|A-9929-RGB,B-6900-OUT;n:type:ShaderForge.SFN_OneMinus,id:8415,x:32970,y:32263,varname:node_8415,prsc:2|IN-8587-OUT;n:type:ShaderForge.SFN_Subtract,id:15,x:33186,y:32263,varname:node_15,prsc:2|A-7023-OUT,B-8415-OUT;n:type:ShaderForge.SFN_RemapRange,id:6900,x:32524,y:32163,varname:node_6900,prsc:2,frmn:0,frmx:0.3,tomn:0.5,tomx:0.8|IN-6277-OUT;n:type:ShaderForge.SFN_Step,id:9969,x:32915,y:32585,varname:node_9969,prsc:2|A-8751-OUT,B-9929-RGB;n:type:ShaderForge.SFN_Vector1,id:8751,x:32720,y:32691,varname:node_8751,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:5876,x:33494,y:32278,varname:node_5876,prsc:2|A-15-OUT,B-9811-RGB,C-1227-OUT;n:type:ShaderForge.SFN_Color,id:9811,x:33206,y:32411,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_9811,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:1227,x:33448,y:32634,varname:node_1227,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:8167,x:32244,y:32986,varname:node_8167,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_RemapRange,id:3735,x:32537,y:32363,varname:node_3735,prsc:2,frmn:0,frmx:0.3,tomn:0.5,tomx:0.7|IN-6277-OUT;n:type:ShaderForge.SFN_RemapRange,id:9833,x:31908,y:33498,varname:node_9833,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3.14|IN-6277-OUT;n:type:ShaderForge.SFN_Sin,id:3175,x:32388,y:33495,varname:node_3175,prsc:2|IN-9833-OUT;proporder:2364-8004-6277-9811;pass:END;sub:END;*/

Shader "Shader Forge/effect0000-1" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _Value ("Value", Range(0, 1)) = 1
        [HDR]_LitColor ("LitColor", Color) = (0.5,0.5,0.5,1)
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
            uniform float4 _MainColor;
            uniform float _Value;
            uniform float4 _LitColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 node_1437 = float2(0.5,0.5);
                clip(step(distance(i.uv0,node_1437),0.5) - 0.5);
////// Lighting:
////// Emissive:
                float4 node_6182 = _Time;
                float node_6746_ang = node_6182.g;
                float node_6746_spd = (-0.5);
                float node_6746_cos = cos(node_6746_spd*node_6746_ang);
                float node_6746_sin = sin(node_6746_spd*node_6746_ang);
                float2 node_6746_piv = node_1437;
                float2 node_6746 = (mul((0.05*((_Value*-200.0+0.0) - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0).rg-node_6746_piv,float2x2( node_6746_cos, -node_6746_sin, node_6746_sin, node_6746_cos))+node_6746_piv);
                float4 node_9929 = tex2D(_MainTex,TRANSFORM_TEX(node_6746, _MainTex));
                float3 emissive = (((1.0 - step(node_9929.rgb,(_Value*0.6666666+0.5)))-(1.0 - step(node_9929.rgb,(_Value*1.0+0.5))))*_LitColor.rgb*2.0);
                float3 finalColor = emissive + (step(0.0,node_9929.rgb)*_MainColor.rgb*1.0);
                fixed4 finalRGBA = fixed4(finalColor,(node_9929.a*sin((_Value*3.14+0.0))));
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
                float2 node_1437 = float2(0.5,0.5);
                clip(step(distance(i.uv0,node_1437),0.5) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
