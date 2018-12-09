// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34522,y:32651,varname:node_4013,prsc:2|emission-5158-OUT,alpha-690-OUT,refract-5010-OUT;n:type:ShaderForge.SFN_Slider,id:4082,x:32313,y:32969,ptovrint:False,ptlb:node_4082,ptin:_node_4082,varname:node_4082,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:612.4695,max:1000;n:type:ShaderForge.SFN_RemapRange,id:7934,x:32687,y:32921,varname:node_7934,prsc:2,frmn:0,frmx:1000,tomn:0,tomx:1|IN-4082-OUT;n:type:ShaderForge.SFN_RemapRange,id:2350,x:32863,y:32921,varname:node_2350,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.5|IN-7934-OUT;n:type:ShaderForge.SFN_TexCoord,id:5857,x:32665,y:32605,varname:node_5857,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9567,x:32888,y:32605,varname:node_9567,prsc:2|A-7934-OUT,B-5857-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:2637,x:33065,y:32604,ptovrint:False,ptlb:wenli,ptin:_wenli,varname:node_2637,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:77b70e79a6d16f44e9ae27b5675becc9,ntxv:0,isnm:False|UVIN-9567-OUT;n:type:ShaderForge.SFN_Append,id:2220,x:33245,y:32604,varname:node_2220,prsc:2|A-2637-R,B-2637-R;n:type:ShaderForge.SFN_Multiply,id:3409,x:33441,y:32604,varname:node_3409,prsc:2|A-2220-OUT,B-2350-OUT;n:type:ShaderForge.SFN_Multiply,id:5282,x:33051,y:32940,varname:node_5282,prsc:2|A-5857-V,B-4082-OUT;n:type:ShaderForge.SFN_Sin,id:4073,x:33205,y:32940,varname:node_4073,prsc:2|IN-5282-OUT;n:type:ShaderForge.SFN_Clamp01,id:1816,x:33364,y:32940,varname:node_1816,prsc:2|IN-4073-OUT;n:type:ShaderForge.SFN_RemapRange,id:1448,x:33520,y:32940,varname:node_1448,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.6|IN-1816-OUT;n:type:ShaderForge.SFN_Vector1,id:229,x:33520,y:33151,varname:node_229,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:690,x:33752,y:32940,varname:node_690,prsc:2|A-1448-OUT,B-229-OUT;n:type:ShaderForge.SFN_Multiply,id:5010,x:33741,y:32656,varname:node_5010,prsc:2|A-3409-OUT,B-2491-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2491,x:33487,y:32780,ptovrint:False,ptlb:niuqu,ptin:_niuqu,varname:node_2491,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:5158,x:34000,y:32804,varname:node_5158,prsc:2|A-690-OUT,B-785-RGB;n:type:ShaderForge.SFN_Color,id:785,x:33752,y:33058,ptovrint:False,ptlb:node_785,ptin:_node_785,varname:node_785,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.00924525,c2:0.4191176,c3:0.1986346,c4:1;proporder:4082-2637-2491-785;pass:END;sub:END;*/

Shader "Shader Forge/huaping" {
    Properties {
        _node_4082 ("node_4082", Range(0, 1000)) = 612.4695
        _wenli ("wenli", 2D) = "white" {}
        _niuqu ("niuqu", Float ) = 2
        _node_785 ("node_785", Color) = (0.00924525,0.4191176,0.1986346,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
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
            uniform sampler2D _GrabTexture;
            uniform float _node_4082;
            uniform sampler2D _wenli; uniform float4 _wenli_ST;
            uniform float _niuqu;
            uniform float4 _node_785;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float node_7934 = (_node_4082*0.001+0.0);
                float2 node_9567 = (node_7934+i.uv0);
                float4 _wenli_var = tex2D(_wenli,TRANSFORM_TEX(node_9567, _wenli));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + ((float2(_wenli_var.r,_wenli_var.r)*(node_7934*0.5+0.0))*_niuqu);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float node_690 = ((saturate(sin((i.uv0.g*_node_4082)))*0.6+0.0)*0.2);
                float3 emissive = (node_690*_node_785.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,node_690),1);
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
