// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34261,y:32694,varname:node_9361,prsc:2|emission-5150-OUT,custl-5886-OUT;n:type:ShaderForge.SFN_Slider,id:8114,x:32654,y:33333,ptovrint:False,ptlb:zheshe,ptin:_zheshe,varname:node_8114,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:2.107072,max:10;n:type:ShaderForge.SFN_Parallax,id:5077,x:32933,y:32983,varname:node_5077,prsc:2|UVIN-6075-OUT,HEI-8114-OUT;n:type:ShaderForge.SFN_SceneColor,id:5176,x:33091,y:32983,varname:node_5176,prsc:2|UVIN-5077-UVOUT;n:type:ShaderForge.SFN_Fresnel,id:2511,x:32574,y:32713,varname:node_2511,prsc:2|EXP-7565-OUT;n:type:ShaderForge.SFN_Vector1,id:7565,x:32399,y:32730,varname:node_7565,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:8585,x:32755,y:32713,varname:node_8585,prsc:2|A-2511-OUT,B-1198-OUT;n:type:ShaderForge.SFN_Vector1,id:1198,x:32574,y:32853,varname:node_1198,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:5709,x:33291,y:32914,varname:node_5709,prsc:2|A-8585-OUT,B-5176-RGB,C-9101-RGB;n:type:ShaderForge.SFN_ScreenPos,id:9724,x:32239,y:32927,varname:node_9724,prsc:2,sctp:0;n:type:ShaderForge.SFN_Append,id:9330,x:32546,y:33004,varname:node_9330,prsc:2|A-443-R,B-443-G;n:type:ShaderForge.SFN_Lerp,id:6075,x:32756,y:32983,varname:node_6075,prsc:2|A-9724-UVOUT,B-9330-OUT,T-2028-OUT;n:type:ShaderForge.SFN_Slider,id:2028,x:32362,y:33225,ptovrint:False,ptlb:node_2028,ptin:_node_2028,varname:node_2028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5815706,max:1;n:type:ShaderForge.SFN_Tex2dAsset,id:8761,x:31917,y:32861,ptovrint:False,ptlb:node_8761,ptin:_node_8761,varname:node_8761,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:443,x:32301,y:33050,varname:node_443,prsc:2,ntxv:0,isnm:False|TEX-8761-TEX;n:type:ShaderForge.SFN_Tex2d,id:7349,x:32697,y:32366,varname:node_7349,prsc:2,ntxv:0,isnm:False|UVIN-1088-UVOUT,TEX-8761-TEX;n:type:ShaderForge.SFN_Panner,id:1088,x:32522,y:32366,varname:node_1088,prsc:2,spu:-0.01,spv:0.01|UVIN-7858-OUT;n:type:ShaderForge.SFN_TexCoord,id:2447,x:31902,y:32388,varname:node_2447,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:4510,x:32525,y:32532,varname:node_4510,prsc:2,spu:0.005,spv:-0.01|UVIN-2447-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8327,x:32697,y:32532,varname:node_8327,prsc:2,ntxv:0,isnm:False|UVIN-4510-UVOUT,TEX-8761-TEX;n:type:ShaderForge.SFN_Add,id:5315,x:32890,y:32448,varname:node_5315,prsc:2|A-7349-R,B-8327-R,C-2447-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9101,x:33059,y:32448,ptovrint:False,ptlb:beiniuqutu,ptin:_beiniuqutu,varname:node_9101,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5315-OUT;n:type:ShaderForge.SFN_Multiply,id:5886,x:33522,y:32935,varname:node_5886,prsc:2|A-5709-OUT,B-7650-RGB;n:type:ShaderForge.SFN_Color,id:7650,x:33291,y:33096,ptovrint:False,ptlb:node_7650,ptin:_node_7650,varname:node_7650,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5955882,c2:0.815923,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7858,x:32175,y:32417,varname:node_7858,prsc:2|A-2447-UVOUT,B-7553-OUT;n:type:ShaderForge.SFN_Vector2,id:7553,x:32026,y:32551,varname:node_7553,prsc:2,v1:2,v2:2;n:type:ShaderForge.SFN_Tex2d,id:5163,x:33550,y:32325,ptovrint:False,ptlb:node_5163,ptin:_node_5163,varname:node_5163,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f15404cf047b0804c8a781f8479ee5da,ntxv:0,isnm:False|UVIN-6217-UVOUT;n:type:ShaderForge.SFN_Panner,id:6217,x:33371,y:32325,varname:node_6217,prsc:2,spu:0.2,spv:0.3|UVIN-4329-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4329,x:33193,y:32325,varname:node_4329,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Fresnel,id:4055,x:33550,y:32185,varname:node_4055,prsc:2|EXP-9691-OUT;n:type:ShaderForge.SFN_Vector1,id:9691,x:33415,y:32219,varname:node_9691,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5150,x:33795,y:32368,varname:node_5150,prsc:2|A-4055-OUT,B-5163-R,C-6396-RGB;n:type:ShaderForge.SFN_Color,id:6396,x:33562,y:32518,ptovrint:False,ptlb:liuwense,ptin:_liuwense,varname:node_6396,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;proporder:8114-2028-8761-9101-7650-5163-6396;pass:END;sub:END;*/

Shader "Shader Forge/judian 6" {
    Properties {
        _zheshe ("zheshe", Range(-10, 10)) = 2.107072
        _node_2028 ("node_2028", Range(0, 1)) = 0.5815706
        _node_8761 ("node_8761", 2D) = "white" {}
        _beiniuqutu ("beiniuqutu", 2D) = "white" {}
        [HDR]_node_7650 ("node_7650", Color) = (0.5955882,0.815923,1,1)
        _node_5163 ("node_5163", 2D) = "white" {}
        [HDR]_liuwense ("liuwense", Color) = (1,1,1,1)
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
            uniform float _zheshe;
            uniform float _node_2028;
            uniform sampler2D _node_8761; uniform float4 _node_8761_ST;
            uniform sampler2D _beiniuqutu; uniform float4 _beiniuqutu_ST;
            uniform float4 _node_7650;
            uniform sampler2D _node_5163; uniform float4 _node_5163_ST;
            uniform float4 _liuwense;
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
                float4 projPos : TEXCOORD5;
                UNITY_FOG_COORDS(6)
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
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float4 node_8483 = _Time;
                float2 node_6217 = (i.uv0+node_8483.g*float2(0.2,0.3));
                float4 _node_5163_var = tex2D(_node_5163,TRANSFORM_TEX(node_6217, _node_5163));
                float3 emissive = (pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_node_5163_var.r*_liuwense.rgb);
                float4 node_443 = tex2D(_node_8761,TRANSFORM_TEX(i.uv0, _node_8761));
                float2 node_1088 = ((i.uv0*float2(2,2))+node_8483.g*float2(-0.01,0.01));
                float4 node_7349 = tex2D(_node_8761,TRANSFORM_TEX(node_1088, _node_8761));
                float2 node_4510 = (i.uv0+node_8483.g*float2(0.005,-0.01));
                float4 node_8327 = tex2D(_node_8761,TRANSFORM_TEX(node_4510, _node_8761));
                float2 node_5315 = (node_7349.r+node_8327.r+i.uv0);
                float4 _beiniuqutu_var = tex2D(_beiniuqutu,TRANSFORM_TEX(node_5315, _beiniuqutu));
                float3 finalColor = emissive + (((pow(1.0-max(0,dot(normalDirection, viewDirection)),1.5)*1.0)+tex2D( _GrabTexture, (0.05*(_zheshe - 0.5)*mul(tangentTransform, viewDirection).xy + lerp((sceneUVs * 2 - 1).rg,float2(node_443.r,node_443.g),_node_2028)).rg).rgb+_beiniuqutu_var.rgb)*_node_7650.rgb);
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
