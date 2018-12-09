// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33821,y:32825,varname:node_9361,prsc:2|custl-9417-OUT,alpha-9417-B,voffset-8740-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:847,x:31593,y:33006,varname:node_847,prsc:2;n:type:ShaderForge.SFN_Transform,id:326,x:32075,y:32930,varname:node_326,prsc:2,tffrom:0,tfto:1|IN-847-XYZ;n:type:ShaderForge.SFN_Slider,id:332,x:30577,y:33113,ptovrint:False,ptlb:Transform,ptin:_Transform,varname:node_332,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:4062,x:32215,y:32657,ptovrint:False,ptlb:node_4062,ptin:_node_4062,varname:node_4062,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector4Property,id:2781,x:32159,y:33190,ptovrint:False,ptlb:height,ptin:_height,varname:node_2781,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:6,v3:0,v4:0;n:type:ShaderForge.SFN_Transform,id:7751,x:32449,y:33208,varname:node_7751,prsc:2,tffrom:0,tfto:1|IN-2781-XYZ;n:type:ShaderForge.SFN_Lerp,id:8740,x:33101,y:33239,varname:node_8740,prsc:2|A-6852-OUT,B-9274-OUT,T-9826-OUT;n:type:ShaderForge.SFN_Vector1,id:9572,x:32075,y:33095,varname:node_9572,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:1725,x:32260,y:33012,varname:node_1725,prsc:2|A-326-XYZ,B-9572-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6852,x:32479,y:33012,varname:node_6852,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-1725-OUT;n:type:ShaderForge.SFN_Multiply,id:4355,x:32097,y:33533,varname:node_4355,prsc:2|A-2781-Y,B-332-OUT;n:type:ShaderForge.SFN_Vector1,id:1119,x:31172,y:32907,varname:node_1119,prsc:2,v1:20;n:type:ShaderForge.SFN_Multiply,id:6948,x:31434,y:32805,varname:node_6948,prsc:2|A-1885-OUT,B-1119-OUT,C-8185-OUT;n:type:ShaderForge.SFN_Floor,id:4535,x:31612,y:32805,varname:node_4535,prsc:2|IN-6948-OUT;n:type:ShaderForge.SFN_Noise,id:2227,x:31818,y:32788,varname:node_2227,prsc:2|XY-4535-OUT;n:type:ShaderForge.SFN_Step,id:8185,x:31172,y:33027,varname:node_8185,prsc:2|A-3094-OUT,B-332-OUT;n:type:ShaderForge.SFN_Vector1,id:3094,x:31002,y:32989,varname:node_3094,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Step,id:9865,x:32003,y:32657,varname:node_9865,prsc:2|A-2227-OUT,B-4283-OUT;n:type:ShaderForge.SFN_Vector1,id:4283,x:31818,y:32910,varname:node_4283,prsc:2,v1:0.5;n:type:ShaderForge.SFN_ComponentMask,id:9417,x:32991,y:32856,varname:node_9417,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-4433-OUT;n:type:ShaderForge.SFN_ScreenPos,id:3105,x:30768,y:32671,varname:node_3105,prsc:2,sctp:0;n:type:ShaderForge.SFN_Multiply,id:4433,x:32817,y:32757,varname:node_4433,prsc:2|A-4062-RGB,B-8264-OUT;n:type:ShaderForge.SFN_If,id:8264,x:32643,y:32825,varname:node_8264,prsc:2|A-8185-OUT,B-3624-OUT,GT-2227-OUT,EQ-3880-OUT,LT-3880-OUT;n:type:ShaderForge.SFN_Vector1,id:3624,x:32329,y:32904,varname:node_3624,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:3880,x:32353,y:32956,varname:node_3880,prsc:2,v1:1;n:type:ShaderForge.SFN_Append,id:1885,x:31286,y:32738,varname:node_1885,prsc:2|A-3105-U,B-9376-OUT;n:type:ShaderForge.SFN_Multiply,id:9376,x:31076,y:32776,varname:node_9376,prsc:2|A-3105-V,B-6730-OUT;n:type:ShaderForge.SFN_Vector1,id:6730,x:30768,y:32859,varname:node_6730,prsc:2,v1:10;n:type:ShaderForge.SFN_ComponentMask,id:9274,x:32710,y:33242,varname:node_9274,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-7751-XYZ;n:type:ShaderForge.SFN_Vector4Property,id:4594,x:31593,y:33154,ptovrint:False,ptlb:center,ptin:_center,varname:node_4594,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_RemapRange,id:3860,x:31145,y:33313,varname:node_3860,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-332-OUT;n:type:ShaderForge.SFN_Distance,id:1371,x:31799,y:33101,varname:node_1371,prsc:2|A-847-Y,B-4594-Y;n:type:ShaderForge.SFN_Step,id:4187,x:31897,y:33285,varname:node_4187,prsc:2|A-3860-OUT,B-1371-OUT;n:type:ShaderForge.SFN_Multiply,id:9409,x:32352,y:33569,varname:node_9409,prsc:2|A-4187-OUT,B-4355-OUT;n:type:ShaderForge.SFN_Add,id:9826,x:32565,y:33454,varname:node_9826,prsc:2|A-847-Y,B-9409-OUT;proporder:332-4062-2781-4594;pass:END;sub:END;*/

Shader "Shader Forge/BlockEffect" {
    Properties {
        _Transform ("Transform", Range(0, 1)) = 0
        _node_4062 ("node_4062", 2D) = "white" {}
        _height ("height", Vector) = (0,6,0,0)
        _center ("center", Vector) = (0,0,0,0)
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Transform;
            uniform sampler2D _node_4062; uniform float4 _node_4062_ST;
            uniform float4 _height;
            uniform float4 _center;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                v.vertex.xyz += lerp((mul( unity_WorldToObject, float4(mul(unity_ObjectToWorld, v.vertex).rgb,0) ).xyz.rgb*0.0).rgb,mul( unity_WorldToObject, float4(_height.rgb,0) ).xyz.rgb.rgb,(mul(unity_ObjectToWorld, v.vertex).g+(step((_Transform*-1.0+1.0),distance(mul(unity_ObjectToWorld, v.vertex).g,_center.g))*(_height.g*_Transform))));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
                float4 _node_4062_var = tex2D(_node_4062,TRANSFORM_TEX(i.uv0, _node_4062));
                float node_8185 = step(0.01,_Transform);
                float node_8264_if_leA = step(node_8185,0.0);
                float node_8264_if_leB = step(0.0,node_8185);
                float node_3880 = 1.0;
                float2 node_4535 = floor((float2((sceneUVs * 2 - 1).r,((sceneUVs * 2 - 1).g*10.0))*20.0*node_8185));
                float2 node_2227_skew = node_4535 + 0.2127+node_4535.x*0.3713*node_4535.y;
                float2 node_2227_rnd = 4.789*sin(489.123*(node_2227_skew));
                float node_2227 = frac(node_2227_rnd.x*node_2227_rnd.y*(1+node_2227_skew.x));
                float3 node_9417 = (_node_4062_var.rgb*lerp((node_8264_if_leA*node_3880)+(node_8264_if_leB*node_2227),node_3880,node_8264_if_leA*node_8264_if_leB)).rgb;
                float3 finalColor = node_9417;
                return fixed4(finalColor,node_9417.b);
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Transform;
            uniform float4 _height;
            uniform float4 _center;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                v.vertex.xyz += lerp((mul( unity_WorldToObject, float4(mul(unity_ObjectToWorld, v.vertex).rgb,0) ).xyz.rgb*0.0).rgb,mul( unity_WorldToObject, float4(_height.rgb,0) ).xyz.rgb.rgb,(mul(unity_ObjectToWorld, v.vertex).g+(step((_Transform*-1.0+1.0),distance(mul(unity_ObjectToWorld, v.vertex).g,_center.g))*(_height.g*_Transform))));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
