// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33115,y:32577,varname:node_9361,prsc:2|custl-1864-OUT;n:type:ShaderForge.SFN_Multiply,id:1864,x:32883,y:32728,varname:node_1864,prsc:2|A-735-RGB,B-4029-OUT;n:type:ShaderForge.SFN_Color,id:735,x:32510,y:32661,ptovrint:False,ptlb:color,ptin:_color,varname:node_735,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5882353,c3:0.1470588,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5492,x:32510,y:33033,ptovrint:False,ptlb:liuwen tex,ptin:_liuwentex,varname:node_5492,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc0b42b84e090a34db616972eb72206d,ntxv:0,isnm:False|UVIN-7836-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2553,x:32103,y:33036,varname:node_2553,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7836,x:32315,y:33036,varname:node_7836,prsc:2,spu:0.1,spv:-0.05|UVIN-2553-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4029,x:32735,y:32925,varname:node_4029,prsc:2|A-9852-R,B-5492-R,C-735-A;n:type:ShaderForge.SFN_Tex2d,id:9852,x:32510,y:32839,ptovrint:False,ptlb:Masktex,ptin:_Masktex,varname:node_9852,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bfe3ceca48d7e08459c2799848533920,ntxv:0,isnm:False;proporder:735-5492-9852;pass:END;sub:END;*/

Shader "Shader Forge/st" {
    Properties {
        [HDR]_color ("color", Color) = (1,0.5882353,0.1470588,1)
        _liuwentex ("liuwen tex", 2D) = "white" {}
        _Masktex ("Masktex", 2D) = "white" {}
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
            uniform float4 _color;
            uniform sampler2D _liuwentex; uniform float4 _liuwentex_ST;
            uniform sampler2D _Masktex; uniform float4 _Masktex_ST;
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
                float4 _Masktex_var = tex2D(_Masktex,TRANSFORM_TEX(i.uv0, _Masktex));
                float4 node_2014 = _Time;
                float2 node_7836 = (i.uv0+node_2014.g*float2(0.1,-0.05));
                float4 _liuwentex_var = tex2D(_liuwentex,TRANSFORM_TEX(node_7836, _liuwentex));
                float3 finalColor = (_color.rgb*(_Masktex_var.r*_liuwentex_var.r*_color.a));
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
