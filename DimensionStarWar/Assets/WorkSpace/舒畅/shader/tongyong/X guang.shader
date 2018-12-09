// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:6,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33630,y:32275,varname:node_9361,prsc:2|custl-3277-OUT;n:type:ShaderForge.SFN_Fresnel,id:2347,x:32813,y:32581,varname:node_2347,prsc:2|EXP-8671-OUT;n:type:ShaderForge.SFN_Multiply,id:1694,x:33025,y:32622,varname:node_1694,prsc:2|A-2347-OUT,B-1640-RGB,C-4756-OUT;n:type:ShaderForge.SFN_Color,id:1640,x:32802,y:32743,ptovrint:False,ptlb:node_1640,ptin:_node_1640,varname:node_1640,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1029412,c2:0.5545641,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1649,x:32759,y:32328,ptovrint:False,ptlb:node_1649,ptin:_node_1649,varname:node_1649,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:39ad41a29a506f14e8c1df9ccd4c1a9e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Depth,id:9736,x:32759,y:32099,varname:node_9736,prsc:2;n:type:ShaderForge.SFN_SceneDepth,id:4227,x:32759,y:31966,varname:node_4227,prsc:2|UV-8591-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:8591,x:32542,y:31966,varname:node_8591,prsc:2,sctp:2;n:type:ShaderForge.SFN_If,id:3277,x:33315,y:32372,varname:node_3277,prsc:2|A-4227-OUT,B-9736-OUT,GT-1649-RGB,EQ-1649-RGB,LT-1694-OUT;n:type:ShaderForge.SFN_Vector1,id:8671,x:32650,y:32656,varname:node_8671,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4756,x:32802,y:32917,varname:node_4756,prsc:2,v1:2;proporder:1640-1649;pass:END;sub:END;*/

Shader "Shader Forge/X guang" {
    Properties {
        [HDR]_node_1640 ("node_1640", Color) = (0.1029412,0.5545641,1,1)
        _node_1649 ("node_1649", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZTest Always
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _node_1640;
            uniform sampler2D _node_1649; uniform float4 _node_1649_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
                float node_3277_if_leA = step(max(0, LinearEyeDepth(SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, sceneUVs.rg)) - _ProjectionParams.g),partZ);
                float node_3277_if_leB = step(partZ,max(0, LinearEyeDepth(SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, sceneUVs.rg)) - _ProjectionParams.g));
                float4 _node_1649_var = tex2D(_node_1649,TRANSFORM_TEX(i.uv0, _node_1649));
                float3 finalColor = lerp((node_3277_if_leA*(pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0)*_node_1640.rgb*2.0))+(node_3277_if_leB*_node_1649_var.rgb),_node_1649_var.rgb,node_3277_if_leA*node_3277_if_leB);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
