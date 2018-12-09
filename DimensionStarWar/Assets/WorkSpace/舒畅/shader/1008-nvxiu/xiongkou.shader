// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33206,y:32739,varname:node_9361,prsc:2|custl-7391-OUT;n:type:ShaderForge.SFN_Tex2d,id:3878,x:32490,y:33015,ptovrint:False,ptlb:node_3878,ptin:_node_3878,varname:node_3878,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1010e7c957697e849a5b70450e403ed7,ntxv:0,isnm:False|UVIN-643-UVOUT;n:type:ShaderForge.SFN_Rotator,id:643,x:32327,y:33015,varname:node_643,prsc:2|UVIN-8034-UVOUT,ANG-3654-OUT;n:type:ShaderForge.SFN_TexCoord,id:8034,x:32099,y:33015,varname:node_8034,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Sin,id:2227,x:32099,y:33193,varname:node_2227,prsc:2|IN-535-TDB;n:type:ShaderForge.SFN_Time,id:535,x:31933,y:33173,varname:node_535,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:3654,x:32269,y:33193,varname:node_3654,prsc:2,frmn:-1,frmx:1,tomn:0.5,tomx:-0.5|IN-2227-OUT;n:type:ShaderForge.SFN_TexCoord,id:237,x:31613,y:32708,varname:node_237,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:2833,x:31613,y:32885,varname:node_2833,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:4721,x:31978,y:32718,varname:node_4721,prsc:2|A-237-UVOUT,B-203-OUT;n:type:ShaderForge.SFN_Subtract,id:1707,x:31799,y:32865,varname:node_1707,prsc:2|A-237-UVOUT,B-2833-OUT;n:type:ShaderForge.SFN_Divide,id:203,x:31991,y:32865,varname:node_203,prsc:2|A-1707-OUT,B-7848-OUT;n:type:ShaderForge.SFN_Lerp,id:8636,x:32178,y:32756,varname:node_8636,prsc:2|A-4721-OUT,B-2833-OUT,T-7848-OUT;n:type:ShaderForge.SFN_Add,id:8127,x:32667,y:32921,varname:node_8127,prsc:2|A-4248-RGB,B-3878-RGB;n:type:ShaderForge.SFN_Tex2d,id:4248,x:32376,y:32756,ptovrint:False,ptlb:node_4248,ptin:_node_4248,varname:node_4248,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7525d4bcbd9176140af871f1eed0f71e,ntxv:0,isnm:False|UVIN-8636-OUT;n:type:ShaderForge.SFN_RemapRange,id:7848,x:32269,y:33377,varname:node_7848,prsc:2,frmn:-1,frmx:1,tomn:0.55,tomx:0.65|IN-2227-OUT;n:type:ShaderForge.SFN_Multiply,id:7391,x:32939,y:32947,varname:node_7391,prsc:2|A-8127-OUT,B-7767-RGB,C-7767-A,D-7585-OUT;n:type:ShaderForge.SFN_VertexColor,id:7767,x:32667,y:33070,varname:node_7767,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:7585,x:32820,y:33180,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_7585,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:3878-4248-7585;pass:END;sub:END;*/

Shader "Shader Forge/xiongkou" {
    Properties {
        _node_3878 ("node_3878", 2D) = "white" {}
        _node_4248 ("node_4248", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 1
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
            Cull Off
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
            uniform sampler2D _node_3878; uniform float4 _node_3878_ST;
            uniform sampler2D _node_4248; uniform float4 _node_4248_ST;
            uniform float _Intensity;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float node_2833 = 0.5;
                float4 node_535 = _Time;
                float node_2227 = sin(node_535.b);
                float node_7848 = (node_2227*0.04999998+0.6);
                float2 node_8636 = lerp((i.uv0+((i.uv0-node_2833)/node_7848)),float2(node_2833,node_2833),node_7848);
                float4 _node_4248_var = tex2D(_node_4248,TRANSFORM_TEX(node_8636, _node_4248));
                float node_643_ang = (node_2227*-0.5+0.0);
                float node_643_spd = 1.0;
                float node_643_cos = cos(node_643_spd*node_643_ang);
                float node_643_sin = sin(node_643_spd*node_643_ang);
                float2 node_643_piv = float2(0.5,0.5);
                float2 node_643 = (mul(i.uv0-node_643_piv,float2x2( node_643_cos, -node_643_sin, node_643_sin, node_643_cos))+node_643_piv);
                float4 _node_3878_var = tex2D(_node_3878,TRANSFORM_TEX(node_643, _node_3878));
                float3 finalColor = ((_node_4248_var.rgb+_node_3878_var.rgb)*i.vertexColor.rgb*i.vertexColor.a*_Intensity);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
