// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33492,y:32732,varname:node_9361,prsc:2|custl-8436-OUT,alpha-1188-OUT;n:type:ShaderForge.SFN_Tex2d,id:6982,x:32414,y:32798,ptovrint:False,ptlb:node_6982,ptin:_node_6982,varname:node_6982,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8e74affc173e245458802e6a382dde59,ntxv:0,isnm:False|UVIN-6670-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8786,x:32414,y:33053,ptovrint:False,ptlb:node_8786,ptin:_node_8786,varname:node_8786,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:95c36a2f959f1564c8c425fa1845613d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:6670,x:32242,y:32798,varname:node_6670,prsc:2,spu:0,spv:-2|UVIN-5972-UVOUT;n:type:ShaderForge.SFN_Multiply,id:419,x:32808,y:33106,varname:node_419,prsc:2|A-4546-OUT,B-5128-OUT;n:type:ShaderForge.SFN_Add,id:1581,x:33010,y:32815,varname:node_1581,prsc:2|A-4515-OUT,B-459-OUT,C-9656-OUT;n:type:ShaderForge.SFN_Add,id:5210,x:33013,y:33106,varname:node_5210,prsc:2|A-419-OUT,B-8786-R,C-5128-OUT;n:type:ShaderForge.SFN_Multiply,id:4546,x:32596,y:32815,varname:node_4546,prsc:2|A-6982-R,B-8254-OUT;n:type:ShaderForge.SFN_Vector1,id:8254,x:32414,y:32950,varname:node_8254,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Multiply,id:8436,x:33208,y:32815,varname:node_8436,prsc:2|A-1581-OUT,B-4128-OUT;n:type:ShaderForge.SFN_VertexColor,id:59,x:32596,y:33252,varname:node_59,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:4128,x:33013,y:32963,ptovrint:False,ptlb:node_4128,ptin:_node_4128,varname:node_4128,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1188,x:33203,y:33089,varname:node_1188,prsc:2|A-59-A,B-5210-OUT;n:type:ShaderForge.SFN_Multiply,id:459,x:32596,y:33121,varname:node_459,prsc:2|A-8786-R,B-4178-RGB;n:type:ShaderForge.SFN_Color,id:4178,x:32414,y:33242,ptovrint:False,ptlb:wangge color,ptin:_wanggecolor,varname:node_4178,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.06617647,c2:0.5749494,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:4515,x:32804,y:32815,varname:node_4515,prsc:2|A-4546-OUT,B-6551-RGB;n:type:ShaderForge.SFN_Color,id:6551,x:32596,y:32962,ptovrint:False,ptlb:liudong color,ptin:_liudongcolor,varname:node_6551,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.407505,c2:0.06617647,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:5972,x:31647,y:33318,varname:node_5972,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_OneMinus,id:5429,x:31864,y:33217,varname:node_5429,prsc:2|IN-5972-U;n:type:ShaderForge.SFN_OneMinus,id:6222,x:31864,y:33461,varname:node_6222,prsc:2|IN-5972-V;n:type:ShaderForge.SFN_Power,id:2945,x:32022,y:33517,varname:node_2945,prsc:2|VAL-6222-OUT,EXP-8103-OUT;n:type:ShaderForge.SFN_Vector1,id:8103,x:31864,y:33595,varname:node_8103,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:7557,x:32024,y:33217,varname:node_7557,prsc:2|A-5429-OUT,B-5972-U,C-2145-OUT;n:type:ShaderForge.SFN_Vector1,id:2145,x:31864,y:33340,varname:node_2145,prsc:2,v1:4;n:type:ShaderForge.SFN_Power,id:4015,x:32189,y:33217,varname:node_4015,prsc:2|VAL-7557-OUT,EXP-7858-OUT;n:type:ShaderForge.SFN_Vector1,id:7858,x:32024,y:33340,varname:node_7858,prsc:2,v1:40;n:type:ShaderForge.SFN_Add,id:1269,x:32190,y:33497,varname:node_1269,prsc:2|A-4015-OUT,B-2945-OUT;n:type:ShaderForge.SFN_Multiply,id:645,x:32428,y:33438,varname:node_645,prsc:2|A-5429-OUT,B-5972-U,C-6222-OUT,D-1269-OUT,E-8103-OUT;n:type:ShaderForge.SFN_Clamp01,id:5128,x:32596,y:33438,varname:node_5128,prsc:2|IN-645-OUT;n:type:ShaderForge.SFN_Multiply,id:9656,x:32799,y:33453,varname:node_9656,prsc:2|A-59-RGB,B-5128-OUT;proporder:6982-8786-4128-4178-6551;pass:END;sub:END;*/

Shader "Shader Forge/1006-hudun" {
    Properties {
        _node_6982 ("node_6982", 2D) = "white" {}
        _node_8786 ("node_8786", 2D) = "white" {}
        _node_4128 ("node_4128", Float ) = 1
        [HDR]_wanggecolor ("wangge color", Color) = (0.06617647,0.5749494,1,1)
        _liudongcolor ("liudong color", Color) = (0.407505,0.06617647,1,1)
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
            uniform sampler2D _node_6982; uniform float4 _node_6982_ST;
            uniform sampler2D _node_8786; uniform float4 _node_8786_ST;
            uniform float _node_4128;
            uniform float4 _wanggecolor;
            uniform float4 _liudongcolor;
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
                float4 node_6807 = _Time;
                float2 node_6670 = (i.uv0+node_6807.g*float2(0,-2));
                float4 _node_6982_var = tex2D(_node_6982,TRANSFORM_TEX(node_6670, _node_6982));
                float node_4546 = (_node_6982_var.r*0.8);
                float4 _node_8786_var = tex2D(_node_8786,TRANSFORM_TEX(i.uv0, _node_8786));
                float node_5429 = (1.0 - i.uv0.r);
                float node_6222 = (1.0 - i.uv0.g);
                float node_8103 = 3.0;
                float node_5128 = saturate((node_5429*i.uv0.r*node_6222*(pow((node_5429*i.uv0.r*4.0),40.0)+pow(node_6222,node_8103))*node_8103));
                float3 finalColor = (((node_4546*_liudongcolor.rgb)+(_node_8786_var.r*_wanggecolor.rgb)+(i.vertexColor.rgb*node_5128))*_node_4128);
                fixed4 finalRGBA = fixed4(finalColor,(i.vertexColor.a*((node_4546*node_5128)+_node_8786_var.r+node_5128)));
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
