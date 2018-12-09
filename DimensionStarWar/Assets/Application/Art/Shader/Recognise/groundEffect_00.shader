// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33529,y:32741,varname:node_9361,prsc:2|custl-2791-RGB,alpha-9214-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4932,x:32016,y:32761,varname:node_4932,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:9602,x:32016,y:32927,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_9602,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Distance,id:7126,x:32518,y:32870,varname:node_7126,prsc:2|A-4932-XYZ,B-9602-XYZ;n:type:ShaderForge.SFN_Slider,id:2775,x:32168,y:33125,ptovrint:False,ptlb:MaxDistance,ptin:_MaxDistance,varname:node_2775,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:2;n:type:ShaderForge.SFN_Divide,id:3815,x:32700,y:32998,varname:node_3815,prsc:2|A-7126-OUT,B-2775-OUT;n:type:ShaderForge.SFN_Clamp01,id:9214,x:33095,y:32998,varname:node_9214,prsc:2|IN-1356-OUT;n:type:ShaderForge.SFN_Tex2d,id:2791,x:32747,y:32690,ptovrint:False,ptlb:node_2791,ptin:_node_2791,varname:node_2791,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5db0892a9f35841a1aafa4d2f617eaf3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_OneMinus,id:1356,x:32874,y:32998,varname:node_1356,prsc:2|IN-3815-OUT;proporder:9602-2775-2791;pass:END;sub:END;*/

Shader "Shader Forge/groundEffect_00" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _MaxDistance ("MaxDistance", Range(0, 2)) = 2
        _node_2791 ("node_2791", 2D) = "white" {}
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
            uniform float4 _Center;
            uniform float _MaxDistance;
            uniform sampler2D _node_2791; uniform float4 _node_2791_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 _node_2791_var = tex2D(_node_2791,TRANSFORM_TEX(i.uv0, _node_2791));
                float3 finalColor = _node_2791_var.rgb;
                fixed4 finalRGBA = fixed4(finalColor,saturate((1.0 - (distance(i.posWorld.rgb,_Center.rgb)/_MaxDistance))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
