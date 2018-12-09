// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:False,rpth:0,vtps:1,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:33243,y:33241,varname:node_2865,prsc:2|emission-8051-OUT,alpha-9365-OUT,voffset-8823-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:4430,x:32041,y:33444,ptovrint:False,ptlb:MainTex,ptin:_MainTex,cmnt:MainTex contains the color of the scene,varname:node_9933,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1fbb08182337c664ab3a8287f4e017a8,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7542,x:32427,y:33274,varname:node_1672,prsc:2,tex:1fbb08182337c664ab3a8287f4e017a8,ntxv:0,isnm:False|UVIN-7870-UVOUT,TEX-4430-TEX;n:type:ShaderForge.SFN_TexCoord,id:6591,x:32735,y:33604,varname:node_6591,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:8823,x:32917,y:33604,varname:node_8823,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-6591-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:4004,x:31544,y:33266,varname:node_4004,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8956-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:7670,x:31711,y:33264,varname:node_7670,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4004-OUT;n:type:ShaderForge.SFN_ArcTan2,id:3616,x:31886,y:33279,varname:node_3616,prsc:2,attp:3|A-7670-G,B-7670-R;n:type:ShaderForge.SFN_TexCoord,id:8956,x:31369,y:33266,varname:node_8956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:3184,x:32078,y:33274,varname:node_3184,prsc:2|A-3616-OUT,B-3616-OUT;n:type:ShaderForge.SFN_Rotator,id:7870,x:32259,y:33274,varname:node_7870,prsc:2|UVIN-3184-OUT;n:type:ShaderForge.SFN_TexCoord,id:2313,x:31565,y:33488,varname:node_2313,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector2,id:5919,x:31565,y:33653,varname:node_5919,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:9833,x:31768,y:33568,varname:node_9833,prsc:2|A-2313-UVOUT,B-5919-OUT;n:type:ShaderForge.SFN_Power,id:6185,x:32221,y:33609,varname:node_6185,prsc:2|VAL-376-OUT,EXP-3588-OUT;n:type:ShaderForge.SFN_Slider,id:3588,x:31855,y:33804,ptovrint:False,ptlb:node_3588,ptin:_node_3588,varname:node_3588,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:6.361856,max:10;n:type:ShaderForge.SFN_Clamp01,id:9365,x:32381,y:33609,varname:node_9365,prsc:2|IN-6185-OUT;n:type:ShaderForge.SFN_Multiply,id:8051,x:32761,y:33272,varname:node_8051,prsc:2|A-7542-R,B-2122-RGB,C-594-OUT,D-9365-OUT;n:type:ShaderForge.SFN_RemapRange,id:376,x:31949,y:33600,varname:node_376,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:0.9|IN-9833-OUT;n:type:ShaderForge.SFN_Color,id:2122,x:32427,y:33420,ptovrint:False,ptlb:node_2122,ptin:_node_2122,varname:node_2122,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07352942,c2:0.3866127,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:594,x:32427,y:33137,ptovrint:False,ptlb:node_594,ptin:_node_594,varname:node_594,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:4430-3588-2122-594;pass:END;sub:END;*/

Shader "Shader Forge/jiasupingmu" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _node_3588 ("node_3588", Range(0, 10)) = 6.361856
        [HDR]_node_2122 ("node_2122", Color) = (0.07352942,0.3866127,1,1)
        _node_594 ("node_594", Float ) = 1
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
            uniform float _node_3588;
            uniform float4 _node_2122;
            uniform float _node_594;
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
                float4 node_9699 = _Time;
                float node_7870_ang = node_9699.g;
                float node_7870_spd = 1.0;
                float node_7870_cos = cos(node_7870_spd*node_7870_ang);
                float node_7870_sin = sin(node_7870_spd*node_7870_ang);
                float2 node_7870_piv = float2(0.5,0.5);
                float2 node_7670 = (i.uv0*2.0+-1.0).rg;
                float node_3616 = (1-abs(atan2(node_7670.g,node_7670.r)/3.14159265359));
                float2 node_7870 = (mul(float2(node_3616,node_3616)-node_7870_piv,float2x2( node_7870_cos, -node_7870_sin, node_7870_sin, node_7870_cos))+node_7870_piv);
                float4 node_1672 = tex2D(_MainTex,TRANSFORM_TEX(node_7870, _MainTex));
                float node_9365 = saturate(pow((distance(i.uv0,float2(0.5,0.5))*1.8+0.0),_node_3588));
                float3 emissive = (node_1672.r*_node_2122.rgb*_node_594*node_9365);
                float3 finalColor = emissive;
                return fixed4(finalColor,node_9365);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
