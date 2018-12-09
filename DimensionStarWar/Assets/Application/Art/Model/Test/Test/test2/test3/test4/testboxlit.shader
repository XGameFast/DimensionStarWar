// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33303,y:32665,varname:node_9361,prsc:2|custl-478-OUT,alpha-1651-A;n:type:ShaderForge.SFN_Tex2d,id:1651,x:32978,y:32590,ptovrint:False,ptlb:node_1651,ptin:_node_1651,varname:node_1651,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4048,x:31874,y:32746,varname:node_4048,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:9221,x:32100,y:32797,varname:node_9221,prsc:2,frmn:0,frmx:1,tomn:0,tomx:3.14|IN-4048-V;n:type:ShaderForge.SFN_Sin,id:8212,x:32481,y:32797,varname:node_8212,prsc:2|IN-936-OUT;n:type:ShaderForge.SFN_Add,id:478,x:33079,y:32922,varname:node_478,prsc:2|A-1651-RGB,B-3298-OUT;n:type:ShaderForge.SFN_Power,id:3014,x:32724,y:32797,varname:node_3014,prsc:2|VAL-8212-OUT,EXP-1685-OUT;n:type:ShaderForge.SFN_Slider,id:6894,x:32061,y:33229,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_6894,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.094309,max:10;n:type:ShaderForge.SFN_Exp,id:1685,x:32481,y:33007,varname:node_1685,prsc:2,et:0|IN-6894-OUT;n:type:ShaderForge.SFN_Color,id:8979,x:32757,y:33221,ptovrint:False,ptlb:LitColor,ptin:_LitColor,varname:node_8979,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3298,x:33065,y:33213,varname:node_3298,prsc:2|A-7132-OUT,B-8979-RGB,C-7486-OUT;n:type:ShaderForge.SFN_Vector1,id:7486,x:32744,y:33389,varname:node_7486,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:5701,x:31853,y:33086,ptovrint:False,ptlb:Offset,ptin:_Offset,varname:node_5701,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-3.2,cur:2.686819,max:3.2;n:type:ShaderForge.SFN_Add,id:936,x:32303,y:32797,varname:node_936,prsc:2|A-9221-OUT,B-5701-OUT;n:type:ShaderForge.SFN_Clamp,id:7132,x:32843,y:32981,varname:node_7132,prsc:2|IN-3014-OUT,MIN-8725-OUT,MAX-7736-OUT;n:type:ShaderForge.SFN_Vector1,id:8725,x:32613,y:32981,varname:node_8725,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Vector1,id:7736,x:32642,y:33126,varname:node_7736,prsc:2,v1:1;proporder:1651-6894-8979-5701;pass:END;sub:END;*/

Shader "Shader Forge/testboxlit" {
    Properties {
        _node_1651 ("node_1651", 2D) = "white" {}
        _Width ("Width", Range(0, 10)) = 2.094309
        [HDR]_LitColor ("LitColor", Color) = (0.5,0.5,0.5,1)
        _Offset ("Offset", Range(-3.2, 3.2)) = 2.686819
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_1651; uniform float4 _node_1651_ST;
            uniform float _Width;
            uniform float4 _LitColor;
            uniform float _Offset;
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
                float4 _node_1651_var = tex2D(_node_1651,TRANSFORM_TEX(i.uv0, _node_1651));
                float3 finalColor = (_node_1651_var.rgb+(clamp(pow(sin(((i.uv0.g*3.14+0.0)+_Offset)),exp(_Width)),0.01,1.0)*_LitColor.rgb*2.0));
                fixed4 finalRGBA = fixed4(finalColor,_node_1651_var.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
