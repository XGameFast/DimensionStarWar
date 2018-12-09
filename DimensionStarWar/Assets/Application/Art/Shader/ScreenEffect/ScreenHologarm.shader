// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:False,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:32740,y:33254,varname:node_2865,prsc:2|emission-7808-OUT,alpha-382-OUT,voffset-6718-OUT;n:type:ShaderForge.SFN_TexCoord,id:9400,x:31352,y:33618,varname:node_9400,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:6718,x:32343,y:33817,varname:node_6718,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-9400-UVOUT;n:type:ShaderForge.SFN_Color,id:6928,x:31880,y:33037,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_6928,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6704,x:31880,y:33262,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_6704,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5717-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7808,x:32292,y:33255,varname:node_7808,prsc:2|A-6928-RGB,B-6704-RGB,C-2768-OUT;n:type:ShaderForge.SFN_Slider,id:8196,x:31077,y:34110,ptovrint:False,ptlb:width,ptin:_width,varname:node_8196,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:5;n:type:ShaderForge.SFN_Vector1,id:4613,x:31346,y:33776,varname:node_4613,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Distance,id:2539,x:31520,y:33710,varname:node_2539,prsc:2|A-9400-V,B-4613-OUT;n:type:ShaderForge.SFN_Vector1,id:2768,x:31880,y:33183,varname:node_2768,prsc:2,v1:2;n:type:ShaderForge.SFN_Power,id:8415,x:31729,y:33847,varname:node_8415,prsc:2|VAL-2539-OUT,EXP-4321-OUT;n:type:ShaderForge.SFN_Exp,id:4321,x:31531,y:33929,varname:node_4321,prsc:2,et:1|IN-8196-OUT;n:type:ShaderForge.SFN_Multiply,id:382,x:31955,y:33909,varname:node_382,prsc:2|A-8415-OUT,B-6543-OUT;n:type:ShaderForge.SFN_Multiply,id:6543,x:31485,y:34153,varname:node_6543,prsc:2|A-8196-OUT,B-3100-OUT;n:type:ShaderForge.SFN_Slider,id:3100,x:30950,y:34388,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_3100,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_Panner,id:5717,x:31561,y:33404,varname:node_5717,prsc:2,spu:0,spv:0.01|UVIN-9400-UVOUT;proporder:6928-6704-8196-3100;pass:END;sub:END;*/

Shader "Shader Forge/ScreenHologarm" {
    Properties {
        [HDR]_Color ("Color", Color) = (0.5,0.5,0.5,1)
        _MainColor ("MainColor", 2D) = "white" {}
        _width ("width", Range(0, 5)) = 2
        _Power ("Power", Range(0, 5)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Overlay+1"
            "RenderType"="Overlay"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _MainColor; uniform float4 _MainColor_ST;
            uniform float _width;
            uniform float _Power;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                v.vertex.xyz = float3((o.uv0*2.0+-1.0),0.0);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_5991 = _Time;
                float2 node_5717 = (i.uv0+node_5991.g*float2(0,0.01));
                float4 _MainColor_var = tex2D(_MainColor,TRANSFORM_TEX(node_5717, _MainColor));
                float3 emissive = (_Color.rgb*_MainColor_var.rgb*2.0);
                float3 finalColor = emissive;
                return fixed4(finalColor,(pow(distance(i.uv0.g,0.5),exp2(_width))*(_width*_Power)));
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
