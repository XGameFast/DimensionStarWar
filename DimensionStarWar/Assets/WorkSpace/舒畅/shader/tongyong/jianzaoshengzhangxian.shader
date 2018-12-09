// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33558,y:32706,varname:node_9361,prsc:2|custl-3193-OUT,alpha-6517-OUT;n:type:ShaderForge.SFN_Tex2d,id:1226,x:31445,y:32887,ptovrint:False,ptlb:node_1226,ptin:_node_1226,varname:node_1226,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0839562779f0c0543aaa239b78bd12b9,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5603,x:32471,y:32722,ptovrint:False,ptlb:node_5603,ptin:_node_5603,varname:node_5603,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:627c197522a23124f9ad524d03f3229f,ntxv:0,isnm:False|UVIN-1490-UVOUT;n:type:ShaderForge.SFN_Subtract,id:2778,x:32318,y:33044,varname:node_2778,prsc:2|A-1187-OUT,B-1400-OUT;n:type:ShaderForge.SFN_Step,id:1187,x:32011,y:32924,varname:node_1187,prsc:2|A-5719-A,B-6472-OUT;n:type:ShaderForge.SFN_Panner,id:1490,x:32274,y:32722,varname:node_1490,prsc:2,spu:0.1,spv:0.05|UVIN-9339-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4175,x:32482,y:33355,ptovrint:False,ptlb:node_4175,ptin:_node_4175,varname:node_4175,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1e8549d3af51f054cad7d1e397e92c47,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:9801,x:32677,y:33372,varname:node_9801,prsc:2|IN-4175-R;n:type:ShaderForge.SFN_Multiply,id:6517,x:32978,y:33057,varname:node_6517,prsc:2|A-1187-OUT,B-9801-OUT;n:type:ShaderForge.SFN_TexCoord,id:9339,x:32058,y:32728,varname:node_9339,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:902,x:32821,y:32747,varname:node_902,prsc:2|A-5603-RGB,B-550-RGB;n:type:ShaderForge.SFN_Color,id:550,x:32471,y:32515,ptovrint:False,ptlb:node_550,ptin:_node_550,varname:node_550,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1956099,c2:0.3317623,c3:0.9852941,c4:1;n:type:ShaderForge.SFN_Add,id:8013,x:31942,y:33178,varname:node_8013,prsc:2|A-5719-A,B-7171-OUT;n:type:ShaderForge.SFN_Vector1,id:7171,x:31748,y:33237,varname:node_7171,prsc:2,v1:0.03;n:type:ShaderForge.SFN_Step,id:1400,x:32115,y:33118,varname:node_1400,prsc:2|A-8013-OUT,B-6472-OUT;n:type:ShaderForge.SFN_Multiply,id:8145,x:32562,y:33044,varname:node_8145,prsc:2|A-2778-OUT,B-2536-RGB;n:type:ShaderForge.SFN_Color,id:2536,x:32318,y:32896,ptovrint:False,ptlb:node_2536,ptin:_node_2536,varname:node_2536,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1605752,c2:0.6827722,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Add,id:4575,x:33019,y:32747,varname:node_4575,prsc:2|A-902-OUT,B-8145-OUT;n:type:ShaderForge.SFN_Tex2d,id:3733,x:31316,y:32651,ptovrint:False,ptlb:node_3733,ptin:_node_3733,varname:node_3733,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2e49480a1b693254997ab24797142856,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6472,x:31630,y:32887,varname:node_6472,prsc:2|A-3733-R,B-1226-R;n:type:ShaderForge.SFN_VertexColor,id:5719,x:31394,y:33227,varname:node_5719,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3193,x:33326,y:32760,varname:node_3193,prsc:2|A-4575-OUT,B-302-OUT;n:type:ShaderForge.SFN_ValueProperty,id:302,x:33019,y:32577,ptovrint:False,ptlb:node_302,ptin:_node_302,varname:node_302,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1226-4175-5603-550-2536-3733-302;pass:END;sub:END;*/

Shader "Shader Forge/jianzaoshengzhangxian" {
    Properties {
        _node_1226 ("node_1226", 2D) = "white" {}
        _node_4175 ("node_4175", 2D) = "white" {}
        _node_5603 ("node_5603", 2D) = "white" {}
        [HDR]_node_550 ("node_550", Color) = (0.1956099,0.3317623,0.9852941,1)
        [HDR]_node_2536 ("node_2536", Color) = (0.1605752,0.6827722,0.9926471,1)
        _node_3733 ("node_3733", 2D) = "white" {}
        _node_302 ("node_302", Float ) = 1
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
            uniform sampler2D _node_1226; uniform float4 _node_1226_ST;
            uniform sampler2D _node_5603; uniform float4 _node_5603_ST;
            uniform sampler2D _node_4175; uniform float4 _node_4175_ST;
            uniform float4 _node_550;
            uniform float4 _node_2536;
            uniform sampler2D _node_3733; uniform float4 _node_3733_ST;
            uniform float _node_302;
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
                float4 node_4371 = _Time;
                float2 node_1490 = (i.uv0+node_4371.g*float2(0.1,0.05));
                float4 _node_5603_var = tex2D(_node_5603,TRANSFORM_TEX(node_1490, _node_5603));
                float4 _node_3733_var = tex2D(_node_3733,TRANSFORM_TEX(i.uv0, _node_3733));
                float4 _node_1226_var = tex2D(_node_1226,TRANSFORM_TEX(i.uv0, _node_1226));
                float node_6472 = (_node_3733_var.r*_node_1226_var.r);
                float node_1187 = step(i.vertexColor.a,node_6472);
                float3 finalColor = (((_node_5603_var.rgb*_node_550.rgb)+((node_1187-step((i.vertexColor.a+0.03),node_6472))*_node_2536.rgb))*_node_302);
                float4 _node_4175_var = tex2D(_node_4175,TRANSFORM_TEX(i.uv0, _node_4175));
                fixed4 finalRGBA = fixed4(finalColor,(node_1187*(1.0 - _node_4175_var.r)));
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
