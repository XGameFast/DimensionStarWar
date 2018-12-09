// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-7249-OUT,clip-8607-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4965,x:32039,y:32714,varname:node_4965,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:8134,x:32039,y:32914,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_8134,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Step,id:8607,x:32832,y:32956,varname:node_8607,prsc:2|A-515-OUT,B-1791-OUT;n:type:ShaderForge.SFN_Distance,id:234,x:32295,y:32846,varname:node_234,prsc:2|A-4965-XYZ,B-8134-XYZ;n:type:ShaderForge.SFN_RemapRange,id:515,x:32502,y:32819,varname:node_515,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-234-OUT;n:type:ShaderForge.SFN_Slider,id:1791,x:31999,y:33150,ptovrint:False,ptlb:Dissvo,ptin:_Dissvo,varname:node_1791,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:5151,x:32458,y:32321,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5151,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:3161,x:31634,y:32411,varname:node_3161,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Floor,id:4168,x:32059,y:32410,varname:node_4168,prsc:2|IN-771-OUT;n:type:ShaderForge.SFN_Multiply,id:7249,x:32803,y:32430,varname:node_7249,prsc:2|A-5151-RGB,B-7950-OUT;n:type:ShaderForge.SFN_Slider,id:3283,x:31634,y:32582,ptovrint:False,ptlb:NoseWidth,ptin:_NoseWidth,varname:node_3283,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:25,max:50;n:type:ShaderForge.SFN_Multiply,id:771,x:31899,y:32410,varname:node_771,prsc:2|A-3161-UVOUT,B-3283-OUT;n:type:ShaderForge.SFN_Vector1,id:7355,x:32039,y:32585,varname:node_7355,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:5551,x:32258,y:32488,varname:node_5551,prsc:2|A-4168-OUT,B-7355-OUT;n:type:ShaderForge.SFN_Noise,id:7950,x:32458,y:32488,varname:node_7950,prsc:2|XY-5551-OUT;proporder:1791-8134-5151-3283;pass:END;sub:END;*/

Shader "Shader Forge/groundEffect_05" {
    Properties {
        _Dissvo ("Dissvo", Range(0, 1)) = 0
        _Center ("Center", Vector) = (0,0,0,0)
        _MainTex ("MainTex", 2D) = "white" {}
        _NoseWidth ("NoseWidth", Range(0, 50)) = 25
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Dissvo;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _NoseWidth;
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
                clip(step((distance(i.posWorld.rgb,_Center.rgb)*0.5+0.5),_Dissvo) - 0.5);
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float2 node_5551 = (floor((i.uv0*_NoseWidth))*0.1);
                float2 node_7950_skew = node_5551 + 0.2127+node_5551.x*0.3713*node_5551.y;
                float2 node_7950_rnd = 4.789*sin(489.123*(node_7950_skew));
                float node_7950 = frac(node_7950_rnd.x*node_7950_rnd.y*(1+node_7950_skew.x));
                float3 finalColor = (_MainTex_var.rgb*node_7950);
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
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
                clip(step((distance(i.posWorld.rgb,_Center.rgb)*0.5+0.5),_Dissvo) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
