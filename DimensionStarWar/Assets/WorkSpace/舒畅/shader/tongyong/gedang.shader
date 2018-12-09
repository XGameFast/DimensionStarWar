// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33417,y:32710,varname:node_4013,prsc:2|custl-5601-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32935,y:33176,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1440,x:32756,y:32995,ptovrint:False,ptlb:MaskTex,ptin:_MaskTex,varname:node_1440,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:86dad683d5561f145a57a714ba14d85a,ntxv:0,isnm:False|UVIN-2658-OUT;n:type:ShaderForge.SFN_Tex2d,id:1501,x:32756,y:32747,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1501,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:95c36a2f959f1564c8c425fa1845613d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:7120,x:31881,y:32997,varname:node_7120,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:4270,x:32204,y:32995,varname:node_4270,prsc:2|A-7120-UVOUT,B-2111-OUT;n:type:ShaderForge.SFN_Subtract,id:794,x:32104,y:33227,varname:node_794,prsc:2|A-7120-UVOUT,B-5675-OUT;n:type:ShaderForge.SFN_Vector1,id:5675,x:31881,y:33143,varname:node_5675,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Divide,id:2111,x:32263,y:33227,varname:node_2111,prsc:2|A-794-OUT,B-3858-A;n:type:ShaderForge.SFN_Lerp,id:7695,x:32434,y:32995,varname:node_7695,prsc:2|A-4270-OUT,B-5675-OUT,T-3858-A;n:type:ShaderForge.SFN_Clamp01,id:2658,x:32593,y:32995,varname:node_2658,prsc:2|IN-7695-OUT;n:type:ShaderForge.SFN_Multiply,id:5601,x:33149,y:32973,varname:node_5601,prsc:2|A-1501-R,B-1470-OUT,C-1304-RGB;n:type:ShaderForge.SFN_Multiply,id:1470,x:32935,y:33012,varname:node_1470,prsc:2|A-1440-R,B-7291-OUT;n:type:ShaderForge.SFN_Vector1,id:7291,x:32756,y:33176,varname:node_7291,prsc:2,v1:2;n:type:ShaderForge.SFN_VertexColor,id:3858,x:32201,y:33520,varname:node_3858,prsc:2;proporder:1304-1440-1501;pass:END;sub:END;*/

Shader "Shader Forge/gedang" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        _MaskTex ("MaskTex", 2D) = "white" {}
        _MainTex ("MainTex", 2D) = "white" {}
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
            uniform float4 _Color;
            uniform sampler2D _MaskTex; uniform float4 _MaskTex_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_5675 = 0.5;
                float2 node_2658 = saturate(lerp((i.uv0+((i.uv0-node_5675)/i.vertexColor.a)),float2(node_5675,node_5675),i.vertexColor.a));
                float4 _MaskTex_var = tex2D(_MaskTex,TRANSFORM_TEX(node_2658, _MaskTex));
                float3 finalColor = (_MainTex_var.r*(_MaskTex_var.r*2.0)*_Color.rgb);
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
