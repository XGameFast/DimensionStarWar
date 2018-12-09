// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:False,rpth:0,vtps:1,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:33234,y:33267,varname:node_2865,prsc:2|emission-3715-OUT,alpha-9452-OUT,voffset-8823-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:4430,x:32041,y:33444,ptovrint:False,ptlb:MainTex,ptin:_MainTex,cmnt:MainTex contains the color of the scene,varname:node_9933,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1fbb08182337c664ab3a8287f4e017a8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7542,x:32515,y:33275,varname:node_1672,prsc:2,tex:1fbb08182337c664ab3a8287f4e017a8,ntxv:0,isnm:False|UVIN-7870-UVOUT,TEX-4430-TEX;n:type:ShaderForge.SFN_TexCoord,id:6591,x:32862,y:33765,varname:node_6591,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:8823,x:33044,y:33765,varname:node_8823,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-6591-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:4004,x:31544,y:33266,varname:node_4004,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8956-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:7670,x:31711,y:33264,varname:node_7670,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4004-OUT;n:type:ShaderForge.SFN_ArcTan2,id:3616,x:31892,y:33284,varname:node_3616,prsc:2,attp:3|A-7670-G,B-7670-R;n:type:ShaderForge.SFN_TexCoord,id:8956,x:31369,y:33266,varname:node_8956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:3184,x:32074,y:33274,varname:node_3184,prsc:2|A-3616-OUT,B-3616-OUT;n:type:ShaderForge.SFN_Rotator,id:7870,x:32228,y:33274,varname:node_7870,prsc:2|UVIN-3184-OUT;n:type:ShaderForge.SFN_Multiply,id:8051,x:32711,y:33275,varname:node_8051,prsc:2|A-7542-R,B-2122-RGB,C-594-OUT;n:type:ShaderForge.SFN_Color,id:2122,x:32427,y:33420,ptovrint:False,ptlb:node_2122,ptin:_node_2122,varname:node_2122,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07352942,c2:0.3866127,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:594,x:32427,y:33137,ptovrint:False,ptlb:node_594,ptin:_node_594,varname:node_594,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Lerp,id:3715,x:33003,y:33260,varname:node_3715,prsc:2|A-825-RGB,B-8051-OUT,T-2002-OUT;n:type:ShaderForge.SFN_Color,id:825,x:32697,y:33072,ptovrint:False,ptlb:node_825,ptin:_node_825,varname:node_825,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:2002,x:32615,y:33449,ptovrint:False,ptlb:bianbai,ptin:_bianbai,varname:node_2002,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.00135636,max:1;n:type:ShaderForge.SFN_Multiply,id:9452,x:33044,y:33548,varname:node_9452,prsc:2|A-6074-OUT,B-3466-OUT;n:type:ShaderForge.SFN_Slider,id:3466,x:32492,y:33683,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_3466,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Distance,id:1924,x:31589,y:33683,varname:node_1924,prsc:2|A-8956-UVOUT,B-7535-OUT;n:type:ShaderForge.SFN_Vector2,id:7535,x:31400,y:33715,varname:node_7535,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Clamp01,id:6074,x:32227,y:33720,varname:node_6074,prsc:2|IN-6173-OUT;n:type:ShaderForge.SFN_RemapRange,id:7675,x:31769,y:33679,varname:node_7675,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:1|IN-1924-OUT;n:type:ShaderForge.SFN_Power,id:6173,x:31994,y:33679,varname:node_6173,prsc:2|VAL-7675-OUT,EXP-6874-OUT;n:type:ShaderForge.SFN_Slider,id:6874,x:31612,y:33884,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_6874,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.476712,max:5;proporder:4430-2122-594-825-2002-3466-6874;pass:END;sub:END;*/

Shader "Shader Forge/jiasupingmu" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_node_2122 ("node_2122", Color) = (0.07352942,0.3866127,1,1)
        _node_594 ("node_594", Float ) = 1
        [HDR]_node_825 ("node_825", Color) = (1,1,1,1)
        _bianbai ("bianbai", Range(0, 1)) = 0.00135636
        _Alpha ("Alpha", Range(0, 1)) = 1
        _mask ("mask", Range(0, 5)) = 2.476712
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
            Cull Off
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _node_2122;
            uniform float _node_594;
            uniform float4 _node_825;
            uniform float _bianbai;
            uniform float _Alpha;
            uniform float _mask;
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
                o.pos = v.vertex;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_3004 = _Time;
                float node_7870_ang = node_3004.g;
                float node_7870_spd = 1.0;
                float node_7870_cos = cos(node_7870_spd*node_7870_ang);
                float node_7870_sin = sin(node_7870_spd*node_7870_ang);
                float2 node_7870_piv = float2(0.5,0.5);
                float2 node_7670 = (i.uv0*2.0+-1.0).rg;
                float node_3616 = (1-abs(atan2(node_7670.g,node_7670.r)/3.14159265359));
                float2 node_7870 = (mul(float2(node_3616,node_3616)-node_7870_piv,float2x2( node_7870_cos, -node_7870_sin, node_7870_sin, node_7870_cos))+node_7870_piv);
                float4 node_1672 = tex2D(_MainTex,TRANSFORM_TEX(node_7870, _MainTex));
                float3 emissive = lerp(_node_825.rgb,(node_1672.r*_node_2122.rgb*_node_594),_bianbai);
                float3 finalColor = emissive;
                return fixed4(finalColor,(saturate(pow((distance(i.uv0,float2(0.5,0.5))*2.0+0.0),_mask))*_Alpha));
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
