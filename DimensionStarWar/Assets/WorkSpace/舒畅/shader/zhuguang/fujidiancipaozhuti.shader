// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34353,y:32758,varname:node_4013,prsc:2|emission-7414-OUT,alpha-2341-OUT;n:type:ShaderForge.SFN_Tex2d,id:7907,x:32783,y:33004,ptovrint:False,ptlb:node_7907,ptin:_node_7907,varname:node_7907,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:959b620c5db1bbe458a611ce4276d3a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:4041,x:32956,y:32596,varname:node_4041,prsc:2|EXP-9507-OUT;n:type:ShaderForge.SFN_Vector1,id:9507,x:32762,y:32626,varname:node_9507,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Multiply,id:6661,x:33324,y:32736,varname:node_6661,prsc:2|A-1913-OUT,B-8894-RGB,C-7850-OUT,D-6461-RGB;n:type:ShaderForge.SFN_Step,id:2341,x:33128,y:32986,varname:node_2341,prsc:2|A-7907-R,B-6461-A;n:type:ShaderForge.SFN_OneMinus,id:1913,x:33119,y:32596,varname:node_1913,prsc:2|IN-4041-OUT;n:type:ShaderForge.SFN_Panner,id:7347,x:32446,y:32758,varname:node_7347,prsc:2,spu:0,spv:-1|UVIN-274-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:274,x:32191,y:32751,varname:node_274,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:7850,x:33073,y:32867,ptovrint:False,ptlb:node_7850,ptin:_node_7850,varname:node_7850,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:6461,x:32878,y:33181,varname:node_6461,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8894,x:32674,y:32758,ptovrint:False,ptlb:node_8894,ptin:_node_8894,varname:node_8894,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-7347-UVOUT;n:type:ShaderForge.SFN_Fresnel,id:3375,x:33136,y:32457,varname:node_3375,prsc:2|EXP-7499-OUT;n:type:ShaderForge.SFN_Vector1,id:7499,x:32966,y:32475,varname:node_7499,prsc:2,v1:5;n:type:ShaderForge.SFN_Add,id:7414,x:33497,y:32642,varname:node_7414,prsc:2|A-3297-OUT,B-6661-OUT;n:type:ShaderForge.SFN_Multiply,id:3297,x:33345,y:32446,varname:node_3297,prsc:2|A-3375-OUT,B-7774-OUT,C-1120-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7774,x:33136,y:32251,ptovrint:False,ptlb:bianyuanliang,ptin:_bianyuanliang,varname:node_7774,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Color,id:1120,x:33062,y:32308,ptovrint:False,ptlb:node_1120,ptin:_node_1120,varname:node_1120,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1691176,c2:0.5874241,c3:1,c4:1;proporder:7907-7850-8894-7774-1120;pass:END;sub:END;*/

Shader "Shader Forge/fujidiancipaozhuti" {
    Properties {
        _node_7907 ("node_7907", 2D) = "white" {}
        _node_7850 ("node_7850", Float ) = 1
        _node_8894 ("node_8894", 2D) = "white" {}
        _bianyuanliang ("bianyuanliang", Float ) = 3
        _node_1120 ("node_1120", Color) = (0.1691176,0.5874241,1,1)
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
            uniform sampler2D _node_7907; uniform float4 _node_7907_ST;
            uniform float _node_7850;
            uniform sampler2D _node_8894; uniform float4 _node_8894_ST;
            uniform float _bianyuanliang;
            uniform float4 _node_1120;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_3088 = _Time;
                float2 node_7347 = (i.uv0+node_3088.g*float2(0,-1));
                float4 _node_8894_var = tex2D(_node_8894,TRANSFORM_TEX(node_7347, _node_8894));
                float3 emissive = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),5.0)*_bianyuanliang*_node_1120.rgb)+((1.0 - pow(1.0-max(0,dot(normalDirection, viewDirection)),0.7))*_node_8894_var.rgb*_node_7850*i.vertexColor.rgb));
                float3 finalColor = emissive;
                float4 _node_7907_var = tex2D(_node_7907,TRANSFORM_TEX(i.uv0, _node_7907));
                fixed4 finalRGBA = fixed4(finalColor,step(_node_7907_var.r,i.vertexColor.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
