// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33621,y:32807,varname:node_9361,prsc:2|custl-9482-OUT,alpha-3078-A;n:type:ShaderForge.SFN_Tex2d,id:3078,x:32129,y:32834,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_3078,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:902a7696f9ceecb4da1f4b5662340c92,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:9379,x:31503,y:32878,varname:node_9379,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9482,x:33239,y:33096,varname:node_9482,prsc:2|A-3454-OUT,B-2123-OUT;n:type:ShaderForge.SFN_RemapRange,id:3629,x:31658,y:32878,varname:node_3629,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3.14|IN-9379-UVOUT;n:type:ShaderForge.SFN_Sin,id:774,x:32081,y:33003,varname:node_774,prsc:2|IN-9172-OUT;n:type:ShaderForge.SFN_Power,id:9281,x:32455,y:33143,varname:node_9281,prsc:2|VAL-774-OUT,EXP-5753-OUT;n:type:ShaderForge.SFN_Exp,id:5753,x:32305,y:33327,varname:node_5753,prsc:2,et:0|IN-1731-OUT;n:type:ShaderForge.SFN_Slider,id:1128,x:31443,y:33405,ptovrint:False,ptlb:width,ptin:_width,varname:node_1128,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:6.563718,max:10;n:type:ShaderForge.SFN_RemapRange,id:1731,x:32078,y:33396,varname:node_1731,prsc:2,frmn:0,frmx:10,tomn:10,tomx:1|IN-1128-OUT;n:type:ShaderForge.SFN_Color,id:5527,x:32766,y:33509,ptovrint:False,ptlb:lightColor,ptin:_lightColor,varname:node_5527,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6670387,c2:0.5073529,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:2123,x:32909,y:33320,varname:node_2123,prsc:2|A-4444-OUT,B-6205-OUT,C-5527-RGB;n:type:ShaderForge.SFN_Vector1,id:6205,x:32766,y:33420,varname:node_6205,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:4314,x:31483,y:33128,ptovrint:False,ptlb:Offset,ptin:_Offset,varname:node_4314,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-3.2,cur:-0.8216847,max:3.2;n:type:ShaderForge.SFN_Add,id:9172,x:31899,y:33003,varname:node_9172,prsc:2|A-3629-OUT,B-4314-OUT;n:type:ShaderForge.SFN_Clamp,id:4444,x:32700,y:33255,varname:node_4444,prsc:2|IN-9281-OUT,MIN-5557-OUT,MAX-8870-OUT;n:type:ShaderForge.SFN_Vector1,id:5557,x:32466,y:33348,varname:node_5557,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Vector1,id:8870,x:32429,y:33448,varname:node_8870,prsc:2,v1:1;n:type:ShaderForge.SFN_Color,id:5560,x:32129,y:32653,ptovrint:False,ptlb:node_5560,ptin:_node_5560,varname:node_5560,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4673429,c2:0.2573529,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3454,x:32423,y:32701,varname:node_3454,prsc:2|A-5583-OUT,B-5560-RGB,C-3078-RGB;n:type:ShaderForge.SFN_Vector1,id:5583,x:32129,y:32543,varname:node_5583,prsc:2,v1:2;proporder:3078-1128-5527-4314-5560;pass:END;sub:END;*/

Shader "Shader Forge/sizhoushenzhang" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _width ("width", Range(0, 10)) = 6.563718
        [HDR]_lightColor ("lightColor", Color) = (0.6670387,0.5073529,1,1)
        _Offset ("Offset", Range(-3.2, 3.2)) = -0.8216847
        _node_5560 ("node_5560", Color) = (0.4673429,0.2573529,1,1)
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
            uniform float _width;
            uniform float4 _lightColor;
            uniform float _Offset;
            uniform float4 _node_5560;
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
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = ((2.0*_node_5560.rgb*_MainTex_var.rgb)+(float3(clamp(pow(sin(((i.uv0*3.14+0.0)+_Offset)),exp((_width*-0.9+10.0))),0.01,1.0),0.0)*2.0*_lightColor.rgb));
                return fixed4(finalColor,_MainTex_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
