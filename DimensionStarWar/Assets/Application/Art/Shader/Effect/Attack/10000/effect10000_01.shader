// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32937,y:32740,varname:node_9361,prsc:2|custl-3851-OUT,alpha-3107-OUT;n:type:ShaderForge.SFN_Tex2d,id:1943,x:32389,y:32686,varname:node_1943,prsc:2,tex:f108db0da8a6d4ba8a16cfedee83c2c2,ntxv:0,isnm:False|UVIN-2086-UVOUT,TEX-6777-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6777,x:31980,y:32504,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_6777,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f108db0da8a6d4ba8a16cfedee83c2c2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:1549,x:31643,y:33292,varname:node_1549,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Rotator,id:2086,x:31961,y:32890,varname:node_2086,prsc:2|UVIN-9527-UVOUT,ANG-1627-OUT;n:type:ShaderForge.SFN_Parallax,id:9527,x:32039,y:33080,varname:node_9527,prsc:2|UVIN-1549-UVOUT,HEI-1312-OUT;n:type:ShaderForge.SFN_Slider,id:5281,x:30995,y:33323,ptovrint:False,ptlb:Value,ptin:_Value,varname:node_5281,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRange,id:1312,x:31857,y:33186,varname:node_1312,prsc:2,frmn:0,frmx:1,tomn:0,tomx:-40|IN-5281-OUT;n:type:ShaderForge.SFN_Multiply,id:3851,x:32659,y:32908,varname:node_3851,prsc:2|A-1943-RGB,B-8409-RGB,C-2234-OUT;n:type:ShaderForge.SFN_Color,id:8409,x:32338,y:32985,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_8409,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:1622,x:31558,y:32653,varname:node_1622,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:9769,x:31123,y:32994,ptovrint:False,ptlb:RoateSpeed,ptin:_RoateSpeed,varname:node_9769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:1,max:1;n:type:ShaderForge.SFN_RemapRange,id:3566,x:31558,y:32718,varname:node_3566,prsc:2,frmn:0,frmx:1,tomn:2,tomx:1|IN-8948-OUT;n:type:ShaderForge.SFN_Multiply,id:2234,x:31784,y:32718,varname:node_2234,prsc:2|A-1622-OUT,B-3566-OUT;n:type:ShaderForge.SFN_Sin,id:8948,x:31235,y:32744,varname:node_8948,prsc:2|IN-5281-OUT;n:type:ShaderForge.SFN_RemapRange,id:3560,x:31415,y:33077,varname:node_3560,prsc:2,frmn:0,frmx:1,tomn:2,tomx:5|IN-5281-OUT;n:type:ShaderForge.SFN_Multiply,id:1627,x:31619,y:32971,varname:node_1627,prsc:2|A-9769-OUT,B-3560-OUT;n:type:ShaderForge.SFN_Multiply,id:3107,x:32684,y:33143,varname:node_3107,prsc:2|A-1943-A,B-3914-OUT;n:type:ShaderForge.SFN_RemapRange,id:3914,x:32319,y:33301,varname:node_3914,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-5281-OUT;proporder:6777-5281-8409-9769;pass:END;sub:END;*/

Shader "Shader Forge/effect10000_01" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Value ("Value", Range(0, 1)) = 1
        [HDR]_MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)
        _RoateSpeed ("RoateSpeed", Range(-1, 1)) = 1
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
            uniform float _Value;
            uniform float4 _MainColor;
            uniform float _RoateSpeed;
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
////// Lighting:
                float node_2086_ang = (_RoateSpeed*(_Value*3.0+2.0));
                float node_2086_spd = 1.0;
                float node_2086_cos = cos(node_2086_spd*node_2086_ang);
                float node_2086_sin = sin(node_2086_spd*node_2086_ang);
                float2 node_2086_piv = float2(0.5,0.5);
                float2 node_2086 = (mul((0.05*((_Value*-40.0+0.0) - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0).rg-node_2086_piv,float2x2( node_2086_cos, -node_2086_sin, node_2086_sin, node_2086_cos))+node_2086_piv);
                float4 node_1943 = tex2D(_MainTex,TRANSFORM_TEX(node_2086, _MainTex));
                float3 finalColor = (node_1943.rgb*_MainColor.rgb*(1.0*(sin(_Value)*-1.0+2.0)));
                fixed4 finalRGBA = fixed4(finalColor,(node_1943.a*(_Value*-1.0+1.0)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
