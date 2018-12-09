// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32842,y:32980,varname:node_9361,prsc:2|custl-9475-OUT,clip-1271-OUT;n:type:ShaderForge.SFN_Tex2d,id:2156,x:32177,y:32973,ptovrint:False,ptlb:node_2156,ptin:_node_2156,varname:node_2156,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_FragmentPosition,id:8867,x:30897,y:33425,varname:node_8867,prsc:2;n:type:ShaderForge.SFN_Add,id:4892,x:31255,y:33684,varname:node_4892,prsc:2|A-9920-OUT,B-2682-OUT;n:type:ShaderForge.SFN_Step,id:1271,x:31720,y:33587,varname:node_1271,prsc:2|A-6010-OUT,B-9486-OUT;n:type:ShaderForge.SFN_Noise,id:1835,x:31439,y:33005,varname:node_1835,prsc:2|XY-8519-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9920,x:30897,y:33627,ptovrint:False,ptlb:height,ptin:_height,varname:node_9920,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_TexCoord,id:2685,x:30919,y:32957,varname:node_2685,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Floor,id:8519,x:31280,y:33005,varname:node_8519,prsc:2|IN-8310-OUT;n:type:ShaderForge.SFN_Vector1,id:9854,x:30926,y:33165,varname:node_9854,prsc:2,v1:200;n:type:ShaderForge.SFN_Multiply,id:8310,x:31133,y:33005,varname:node_8310,prsc:2|A-2685-UVOUT,B-9854-OUT;n:type:ShaderForge.SFN_Subtract,id:6010,x:31478,y:33529,varname:node_6010,prsc:2|A-8867-Y,B-4892-OUT;n:type:ShaderForge.SFN_Vector1,id:9486,x:31478,y:33652,varname:node_9486,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:296,x:31646,y:32819,ptovrint:False,ptlb:EdgeColor,ptin:_EdgeColor,varname:node_296,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.391,c2:0.846653,c3:1,c4:0;n:type:ShaderForge.SFN_Step,id:1298,x:31627,y:33264,varname:node_1298,prsc:2|A-3384-OUT,B-8867-Y;n:type:ShaderForge.SFN_Multiply,id:8841,x:32177,y:33238,varname:node_8841,prsc:2|A-4246-OUT,B-1298-OUT;n:type:ShaderForge.SFN_Multiply,id:7634,x:32144,y:32780,varname:node_7634,prsc:2|A-9831-OUT,B-296-RGB;n:type:ShaderForge.SFN_Subtract,id:3384,x:31425,y:33264,varname:node_3384,prsc:2|A-4892-OUT,B-3392-OUT;n:type:ShaderForge.SFN_Multiply,id:4246,x:31688,y:33033,varname:node_4246,prsc:2|A-7634-OUT,B-1835-OUT;n:type:ShaderForge.SFN_Add,id:9475,x:32456,y:33039,varname:node_9475,prsc:2|A-2156-RGB,B-8841-OUT;n:type:ShaderForge.SFN_Slider,id:9831,x:31646,y:32686,ptovrint:False,ptlb:EdgeLight,ptin:_EdgeLight,varname:node_9831,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:11;n:type:ShaderForge.SFN_ValueProperty,id:2682,x:30897,y:33762,ptovrint:False,ptlb:Dissvo,ptin:_Dissvo,varname:node_2682,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:3392,x:31184,y:33283,ptovrint:False,ptlb:edge_width,ptin:_edge_width,varname:node_3392,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.05;proporder:2156-9920-296-9831-2682-3392;pass:END;sub:END;*/

Shader "Shader Forge/Dissvo9" {
    Properties {
        _node_2156 ("node_2156", 2D) = "white" {}
        _height ("height", Float ) = 0
        [HDR]_EdgeColor ("EdgeColor", Color) = (0.391,0.846653,1,0)
        _EdgeLight ("EdgeLight", Range(0, 11)) = 0
        _Dissvo ("Dissvo", Float ) = 0
        _edge_width ("edge_width", Float ) = 0.05
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _node_2156; uniform float4 _node_2156_ST;
            uniform float _height;
            uniform float4 _EdgeColor;
            uniform float _EdgeLight;
            uniform float _Dissvo;
            uniform float _edge_width;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_4892 = (_height+_Dissvo);
                clip(step((i.posWorld.g-node_4892),0.0) - 0.5);
////// Lighting:
                float4 _node_2156_var = tex2D(_node_2156,TRANSFORM_TEX(i.uv0, _node_2156));
                float2 node_8519 = floor((i.uv0*200.0));
                float2 node_1835_skew = node_8519 + 0.2127+node_8519.x*0.3713*node_8519.y;
                float2 node_1835_rnd = 4.789*sin(489.123*(node_1835_skew));
                float node_1835 = frac(node_1835_rnd.x*node_1835_rnd.y*(1+node_1835_skew.x));
                float3 finalColor = (_node_2156_var.rgb+(((_EdgeLight*_EdgeColor.rgb)*node_1835)*step((node_4892-_edge_width),i.posWorld.g)));
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            uniform float _height;
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
                float node_4892 = (_height+_Dissvo);
                clip(step((i.posWorld.g-node_4892),0.0) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
