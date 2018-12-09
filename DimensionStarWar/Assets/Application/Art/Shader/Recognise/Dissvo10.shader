// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32838,y:33338,varname:node_9361,prsc:2|custl-3678-OUT,alpha-8816-A,clip-6357-OUT;n:type:ShaderForge.SFN_Tex2d,id:8816,x:31335,y:33185,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8816,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:902a7696f9ceecb4da1f4b5662340c92,ntxv:0,isnm:False;n:type:ShaderForge.SFN_FragmentPosition,id:6545,x:30863,y:33467,varname:node_6545,prsc:2;n:type:ShaderForge.SFN_Distance,id:9309,x:31335,y:33671,varname:node_9309,prsc:2|A-6545-XYZ,B-877-XYZ;n:type:ShaderForge.SFN_Step,id:6357,x:31968,y:33781,varname:node_6357,prsc:2|A-32-OUT,B-4295-OUT;n:type:ShaderForge.SFN_RemapRange,id:32,x:31497,y:33638,varname:node_32,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9309-OUT;n:type:ShaderForge.SFN_Vector4Property,id:877,x:30863,y:33619,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_877,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_TexCoord,id:7284,x:30475,y:34117,varname:node_7284,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Exp,id:5823,x:31250,y:34582,varname:node_5823,prsc:2,et:0|IN-1488-OUT;n:type:ShaderForge.SFN_RemapRange,id:1488,x:31022,y:34582,varname:node_1488,prsc:2,frmn:0,frmx:10,tomn:10,tomx:1|IN-9904-OUT;n:type:ShaderForge.SFN_RemapRange,id:6156,x:30673,y:34134,varname:node_6156,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3.14|IN-7284-UVOUT;n:type:ShaderForge.SFN_Power,id:4933,x:31402,y:34239,varname:node_4933,prsc:2|VAL-5138-OUT,EXP-5823-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9904,x:30808,y:34582,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_9904,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_RemapRange,id:6148,x:30698,y:33955,varname:node_6148,prsc:2,frmn:0,frmx:1,tomn:-3.2,tomx:3.2|IN-9771-OUT;n:type:ShaderForge.SFN_Clamp,id:9448,x:31760,y:34324,varname:node_9448,prsc:2|IN-4933-OUT,MIN-8386-OUT,MAX-4664-OUT;n:type:ShaderForge.SFN_Vector1,id:8386,x:31567,y:34340,varname:node_8386,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Vector1,id:4664,x:31567,y:34406,varname:node_4664,prsc:2,v1:1;n:type:ShaderForge.SFN_Color,id:5185,x:31335,y:33383,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_5185,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4411765,c2:1,c3:0.7687627,c4:1;n:type:ShaderForge.SFN_Color,id:6707,x:31760,y:34511,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_6707,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2639,x:31633,y:33396,varname:node_2639,prsc:2|A-8816-RGB,B-5185-RGB,C-291-OUT;n:type:ShaderForge.SFN_Multiply,id:786,x:31968,y:34530,varname:node_786,prsc:2|A-6707-RGB,B-4917-OUT,C-9448-OUT;n:type:ShaderForge.SFN_Vector1,id:4917,x:31760,y:34656,varname:node_4917,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:4295,x:30863,y:33794,ptovrint:False,ptlb:Dissvo,ptin:_Dissvo,varname:node_4295,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4169572,max:1;n:type:ShaderForge.SFN_Sin,id:5138,x:31222,y:33969,varname:node_5138,prsc:2|IN-5634-OUT;n:type:ShaderForge.SFN_Add,id:5634,x:30966,y:34022,varname:node_5634,prsc:2|A-6148-OUT,B-6156-OUT;n:type:ShaderForge.SFN_Add,id:3678,x:32502,y:33933,varname:node_3678,prsc:2|A-2639-OUT,B-786-OUT;n:type:ShaderForge.SFN_Vector1,id:291,x:31308,y:33586,varname:node_291,prsc:2,v1:2;n:type:ShaderForge.SFN_Time,id:30,x:30165,y:33884,varname:node_30,prsc:2;n:type:ShaderForge.SFN_Vector1,id:1038,x:30104,y:34201,varname:node_1038,prsc:2,v1:10;n:type:ShaderForge.SFN_Multiply,id:9771,x:30382,y:33933,varname:node_9771,prsc:2|A-30-TSL,B-3901-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3424,x:30104,y:34077,ptovrint:False,ptlb:LitSpeed,ptin:_LitSpeed,varname:node_3424,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:3901,x:30302,y:34098,varname:node_3901,prsc:2|A-3424-OUT,B-1038-OUT;proporder:5185-8816-4295-6707-877-9904-3424;pass:END;sub:END;*/

Shader "Shader Forge/DissvoHori" {
    Properties {
        [HDR]_MainColor ("MainColor", Color) = (0.4411765,1,0.7687627,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _Dissvo ("Dissvo", Range(0, 1)) = 0.4169572
        [HDR]_LitColor ("LitColor", Color) = (0.5,0.5,0.5,1)
        _Center ("Center", Vector) = (0,0,0,0)
        _Width ("Width", Float ) = 5
        _LitSpeed ("LitSpeed", Float ) = 0
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Center;
            uniform float _Width;
            uniform float4 _MainColor;
            uniform float4 _LitColor;
            uniform float _Dissvo;
            uniform float _LitSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                clip(step((distance(i.posWorld.rgb,_Center.rgb)*0.5+0.5),_Dissvo) - 0.5);
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_30 = _Time;
                float3 finalColor = ((_MainTex_var.rgb*_MainColor.rgb*2.0)+(_LitColor.rgb*2.0*float3(clamp(pow(sin((((node_30.r*(_LitSpeed+10.0))*6.4+-3.2)+(i.uv0*3.14+0.0))),exp((_Width*-0.9+10.0))),0.01,1.0),0.0)));
                return fixed4(finalColor,_MainTex_var.a);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Dissvo;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                clip(step((distance(i.posWorld.rgb,_Center.rgb)*0.5+0.5),_Dissvo) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
