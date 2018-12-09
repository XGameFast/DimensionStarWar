// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33222,y:32678,varname:node_9361,prsc:2|normal-7435-RGB,emission-8931-OUT;n:type:ShaderForge.SFN_Fresnel,id:2445,x:32550,y:32775,varname:node_2445,prsc:2|EXP-2150-OUT;n:type:ShaderForge.SFN_Multiply,id:8931,x:32810,y:32774,varname:node_8931,prsc:2|A-2445-OUT,B-6160-OUT,C-3061-OUT;n:type:ShaderForge.SFN_Slider,id:6160,x:32114,y:33000,ptovrint:False,ptlb:chuxian/xiaoshi,ptin:_chuxianxiaoshi,varname:node_6160,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3931624,max:2;n:type:ShaderForge.SFN_Tex2d,id:213,x:32225,y:33120,ptovrint:False,ptlb:rongjie Tex,ptin:_rongjieTex,varname:node_213,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0839562779f0c0543aaa239b78bd12b9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:3061,x:32668,y:33051,varname:node_3061,prsc:2|A-213-R,B-6160-OUT;n:type:ShaderForge.SFN_Vector1,id:2150,x:32399,y:32672,varname:node_2150,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:7435,x:32778,y:32592,ptovrint:False,ptlb:normal,ptin:_normal,varname:node_7435,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a5192cd78d4c5f54ea113b83d617aafb,ntxv:3,isnm:True;proporder:6160-213-7435;pass:END;sub:END;*/

Shader "Shader Forge/hit" {
    Properties {
        _chuxianxiaoshi ("chuxian/xiaoshi", Range(0, 2)) = 0.3931624
        _rongjieTex ("rongjie Tex", 2D) = "white" {}
        _normal ("normal", 2D) = "bump" {}
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
            Blend One One
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
            uniform float _chuxianxiaoshi;
            uniform sampler2D _rongjieTex; uniform float4 _rongjieTex_ST;
            uniform sampler2D _normal; uniform float4 _normal_ST;
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
                float3 _normal_var = UnpackNormal(tex2D(_normal,TRANSFORM_TEX(i.uv0, _normal)));
                float3 normalLocal = _normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
////// Lighting:
////// Emissive:
                float4 _rongjieTex_var = tex2D(_rongjieTex,TRANSFORM_TEX(i.uv0, _rongjieTex));
                float node_8931 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),1.0)*_chuxianxiaoshi*step(_rongjieTex_var.r,_chuxianxiaoshi));
                float3 emissive = float3(node_8931,node_8931,node_8931);
                float3 finalColor = emissive;
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
