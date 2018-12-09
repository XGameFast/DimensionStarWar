// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-3613-OUT,alpha-8083-OUT;n:type:ShaderForge.SFN_Color,id:5273,x:32605,y:32662,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_5273,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:5787,x:32605,y:32822,varname:node_5787,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:3613,x:32846,y:32737,varname:node_3613,prsc:2|A-5273-RGB,B-5787-OUT;n:type:ShaderForge.SFN_Vector4Property,id:3598,x:32354,y:33004,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_3598,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_FragmentPosition,id:5222,x:32354,y:32838,varname:node_5222,prsc:2;n:type:ShaderForge.SFN_Distance,id:3888,x:32605,y:32956,varname:node_3888,prsc:2|A-5222-XYZ,B-3598-XYZ;n:type:ShaderForge.SFN_ValueProperty,id:6752,x:32398,y:33284,ptovrint:False,ptlb:radius,ptin:_radius,varname:node_6752,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.5;n:type:ShaderForge.SFN_Divide,id:8083,x:32958,y:33139,varname:node_8083,prsc:2|A-4263-OUT,B-6752-OUT;n:type:ShaderForge.SFN_Subtract,id:4263,x:32831,y:32979,varname:node_4263,prsc:2|A-6752-OUT,B-3888-OUT;proporder:5273-3598-6752;pass:END;sub:END;*/

Shader "Shader Forge/litColorWithDistance" {
    Properties {
        [HDR]_LitColor ("LitColor", Color) = (0.5,0.5,0.5,1)
        _Center ("Center", Vector) = (0,0,0,0)
        _radius ("radius", Float ) = 1.5
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform float4 _LitColor;
            uniform float4 _Center;
            uniform float _radius;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float3 finalColor = (_LitColor.rgb*2.0);
                fixed4 finalRGBA = fixed4(finalColor,((_radius-distance(i.posWorld.rgb,_Center.rgb))/_radius));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
