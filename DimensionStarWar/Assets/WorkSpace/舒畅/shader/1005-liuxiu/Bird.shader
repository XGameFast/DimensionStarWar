// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:True,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32327,y:32671,varname:node_9361,prsc:2|custl-4196-OUT,alpha-5239-OUT;n:type:ShaderForge.SFN_Tex2d,id:724,x:31477,y:32720,ptovrint:False,ptlb:UVtex,ptin:_UVtex,varname:node_724,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cb2403b43d30937489359cc308199f4c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8715,x:31479,y:33021,ptovrint:False,ptlb:node_8715,ptin:_node_8715,varname:node_8715,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbf40c5108465a54da7789f77054a1c3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4196,x:31842,y:32774,varname:node_4196,prsc:2|A-6625-RGB,B-724-R;n:type:ShaderForge.SFN_Color,id:6625,x:31588,y:32530,ptovrint:False,ptlb:color,ptin:_color,varname:node_6625,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5953346,c3:0.1617647,c4:1;n:type:ShaderForge.SFN_Add,id:5239,x:31736,y:33031,varname:node_5239,prsc:2|A-724-R,B-8715-R;proporder:724-6625-8715;pass:END;sub:END;*/

Shader "Shader Forge/Bird" {
    Properties {
        _UVtex ("UVtex", 2D) = "white" {}
        [HDR]_color ("color", Color) = (1,0.5953346,0.1617647,1)
        _node_8715 ("node_8715", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "CanUseSpriteAtlas"="True"
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
            uniform sampler2D _UVtex; uniform float4 _UVtex_ST;
            uniform sampler2D _node_8715; uniform float4 _node_8715_ST;
            uniform float4 _color;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 _UVtex_var = tex2D(_UVtex,TRANSFORM_TEX(i.uv0, _UVtex));
                float3 finalColor = (_color.rgb*_UVtex_var.r);
                float4 _node_8715_var = tex2D(_node_8715,TRANSFORM_TEX(i.uv0, _node_8715));
                fixed4 finalRGBA = fixed4(finalColor,(_UVtex_var.r+_node_8715_var.r));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
