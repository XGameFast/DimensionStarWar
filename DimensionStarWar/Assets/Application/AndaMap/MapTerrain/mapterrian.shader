// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:True,qofs:-1,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-9825-OUT,alpha-906-OUT;n:type:ShaderForge.SFN_Tex2d,id:2600,x:31629,y:32070,varname:node_2600,prsc:2,ntxv:0,isnm:False|TEX-4484-TEX;n:type:ShaderForge.SFN_FragmentPosition,id:9239,x:32033,y:32883,varname:node_9239,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:6746,x:32033,y:33020,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_6746,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:1393,x:32085,y:33251,ptovrint:False,ptlb:Distance,ptin:_Distance,varname:node_1393,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Distance,id:4687,x:32221,y:32970,varname:node_4687,prsc:2|A-9239-XYZ,B-6746-XYZ;n:type:ShaderForge.SFN_Divide,id:6512,x:32381,y:33091,varname:node_6512,prsc:2|A-4687-OUT,B-1393-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:4484,x:31364,y:32088,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4484,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:6083,x:31652,y:32585,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_6083,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:8226,x:31652,y:32764,varname:node_8226,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:6104,x:31629,y:32224,varname:node_6104,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:7900,x:31935,y:32656,varname:node_7900,prsc:2|A-6083-RGB,B-8226-OUT;n:type:ShaderForge.SFN_Multiply,id:9825,x:32241,y:32681,varname:node_9825,prsc:2|A-2600-RGB,B-7900-OUT;n:type:ShaderForge.SFN_OneMinus,id:906,x:32692,y:32971,varname:node_906,prsc:2|IN-6732-OUT;n:type:ShaderForge.SFN_Power,id:6732,x:32799,y:33166,varname:node_6732,prsc:2|VAL-6512-OUT,EXP-5641-OUT;n:type:ShaderForge.SFN_Exp,id:5641,x:32547,y:33269,varname:node_5641,prsc:2,et:0|IN-2711-OUT;n:type:ShaderForge.SFN_Slider,id:2711,x:32023,y:33346,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_2711,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:10;proporder:6746-1393-4484-6083-2711;pass:END;sub:END;*/

Shader "Shader Forge/mapterrian" {
    Properties {
        _Center ("Center", Vector) = (0,0,0,0)
        _Distance ("Distance", Float ) = 1
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_LitColor ("LitColor", Color) = (0.5,0.5,0.5,1)
        _Power ("Power", Range(0, 10)) = 10
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent-1"
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
            uniform float _Distance;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _LitColor;
            uniform float _Power;
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
                float4 node_2600 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = (node_2600.rgb*(_LitColor.rgb*2.0));
                fixed4 finalRGBA = fixed4(finalColor,(1.0 - pow((distance(i.posWorld.rgb,_Center.rgb)/_Distance),exp(_Power))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
