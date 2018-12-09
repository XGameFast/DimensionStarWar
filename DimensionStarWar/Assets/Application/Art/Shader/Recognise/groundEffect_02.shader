// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33449,y:32808,varname:node_9361,prsc:2|custl-1181-OUT,alpha-4667-OUT,clip-9542-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:5792,x:31678,y:33333,varname:node_5792,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:3281,x:31678,y:33462,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_3281,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Distance,id:9946,x:31938,y:33445,varname:node_9946,prsc:2|A-5792-Y,B-3281-Y;n:type:ShaderForge.SFN_Slider,id:5760,x:31678,y:33627,ptovrint:False,ptlb:Dissvo,ptin:_Dissvo,varname:node_5760,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Step,id:9542,x:32471,y:33302,varname:node_9542,prsc:2|A-9946-OUT,B-5760-OUT;n:type:ShaderForge.SFN_Color,id:7699,x:31699,y:32791,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_7699,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8257,x:32547,y:32799,varname:node_8257,prsc:2|A-9460-OUT,B-8328-OUT;n:type:ShaderForge.SFN_Vector1,id:4396,x:31699,y:32927,varname:node_4396,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:8328,x:32097,y:32802,varname:node_8328,prsc:2|A-7699-RGB,B-4396-OUT;n:type:ShaderForge.SFN_TexCoord,id:7831,x:30435,y:32630,varname:node_7831,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:9460,x:31699,y:32597,varname:node_9460,prsc:2,frmn:0,frmx:1,tomn:0.1,tomx:1|IN-8115-OUT;n:type:ShaderForge.SFN_Noise,id:8115,x:31502,y:32518,varname:node_8115,prsc:2|XY-1830-OUT;n:type:ShaderForge.SFN_Multiply,id:8233,x:30960,y:32573,varname:node_8233,prsc:2|A-7831-UVOUT,B-1491-OUT;n:type:ShaderForge.SFN_Slider,id:1491,x:30634,y:32698,ptovrint:False,ptlb:NoiseWidth,ptin:_NoiseWidth,varname:node_1491,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:25.51282,max:50;n:type:ShaderForge.SFN_Floor,id:8175,x:31151,y:32548,varname:node_8175,prsc:2|IN-8233-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1391,x:31151,y:32771,ptovrint:False,ptlb:NoiseSpeed,ptin:_NoiseSpeed,varname:node_1391,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:1830,x:31314,y:32548,varname:node_1830,prsc:2|A-8175-OUT,B-1391-OUT;n:type:ShaderForge.SFN_Slider,id:4667,x:32914,y:33391,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_4667,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:5690,x:32097,y:33032,ptovrint:False,ptlb:node_5690,ptin:_node_5690,varname:node_5690,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1181,x:32677,y:33058,varname:node_1181,prsc:2|A-8257-OUT,B-5690-RGB;proporder:3281-5760-7699-1491-1391-4667-5690;pass:END;sub:END;*/

Shader "Shader Forge/groundEffect_02" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _Dissvo ("Dissvo", Range(0, 10)) = 0
        [HDR]_LitColor ("LitColor", Color) = (0.5,0.5,0.5,1)
        _NoiseWidth ("NoiseWidth", Range(0, 50)) = 25.51282
        _NoiseSpeed ("NoiseSpeed", Float ) = 0.1
        _Alpha ("Alpha", Range(0, 1)) = 0
        _node_5690 ("node_5690", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Dissvo;
            uniform float4 _LitColor;
            uniform float _NoiseWidth;
            uniform float _NoiseSpeed;
            uniform float _Alpha;
            uniform sampler2D _node_5690; uniform float4 _node_5690_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                clip(step(distance(i.posWorld.g,_Center.g),_Dissvo) - 0.5);
////// Lighting:
                float2 node_1830 = (floor((i.uv0*_NoiseWidth))*_NoiseSpeed);
                float2 node_8115_skew = node_1830 + 0.2127+node_1830.x*0.3713*node_1830.y;
                float2 node_8115_rnd = 4.789*sin(489.123*(node_8115_skew));
                float node_8115 = frac(node_8115_rnd.x*node_8115_rnd.y*(1+node_8115_skew.x));
                float4 _node_5690_var = tex2D(_node_5690,TRANSFORM_TEX(i.uv0, _node_5690));
                float3 finalColor = (((node_8115*0.9+0.1)*(_LitColor.rgb*2.0))*_node_5690_var.rgb);
                return fixed4(finalColor,_Alpha);
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
            uniform float4 _Center;
            uniform float _Dissvo;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                clip(step(distance(i.posWorld.g,_Center.g),_Dissvo) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
