// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33867,y:32752,varname:node_4013,prsc:2|custl-8937-OUT,alpha-1034-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:31885,y:33098,ptovrint:False,ptlb:dimianse,ptin:_dimianse,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.04103589,c2:0.06311896,c3:0.1691176,c4:1;n:type:ShaderForge.SFN_Tex2d,id:726,x:32492,y:32996,ptovrint:False,ptlb:node_726,ptin:_node_726,varname:node_726,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ba89c33a350b2ba4cb3f09415dd2fcb3,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:4127,x:31474,y:33274,varname:node_4127,prsc:2,spu:0.05,spv:0.05|UVIN-4331-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4222,x:32797,y:33026,varname:node_4222,prsc:2|A-726-R,B-9921-RGB,C-6164-OUT;n:type:ShaderForge.SFN_Color,id:9921,x:32492,y:33167,ptovrint:False,ptlb:wanggese,ptin:_wanggese,varname:node_9921,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1029412,c2:0.7772816,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:1481,x:32586,y:33407,varname:node_1481,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Add,id:4046,x:33164,y:33031,varname:node_4046,prsc:2|A-4222-OUT,B-3907-OUT,C-5719-OUT;n:type:ShaderForge.SFN_Multiply,id:3907,x:32797,y:33181,varname:node_3907,prsc:2|A-726-R,B-7511-OUT,C-7659-RGB,D-484-OUT;n:type:ShaderForge.SFN_Power,id:7511,x:31874,y:33295,varname:node_7511,prsc:2|VAL-3897-R,EXP-2034-OUT;n:type:ShaderForge.SFN_Vector1,id:2034,x:31662,y:33421,varname:node_2034,prsc:2,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:484,x:32629,y:33324,ptovrint:False,ptlb:liudongqiang,ptin:_liudongqiang,varname:node_484,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Panner,id:9597,x:31461,y:32955,varname:node_9597,prsc:2,spu:-0.03,spv:-0.05|UVIN-4331-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4331,x:31231,y:32743,varname:node_4331,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1914,x:31885,y:32955,varname:node_1914,prsc:2|A-7659-RGB,B-1839-R,C-9846-OUT;n:type:ShaderForge.SFN_Color,id:7659,x:31643,y:32803,ptovrint:False,ptlb:dibanliudongse,ptin:_dibanliudongse,varname:node_7659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1911765,c2:0.4645031,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:5719,x:32182,y:32956,varname:node_5719,prsc:2|A-1914-OUT,B-1304-RGB,T-6925-OUT;n:type:ShaderForge.SFN_Slider,id:6925,x:31832,y:32803,ptovrint:False,ptlb:hunhebi,ptin:_hunhebi,varname:node_6925,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5897436,max:1;n:type:ShaderForge.SFN_Tex2dAsset,id:6077,x:31229,y:33145,ptovrint:False,ptlb:liuwenTEX,ptin:_liuwenTEX,varname:node_6077,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3897,x:31662,y:33274,varname:node_3897,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-4127-UVOUT,TEX-6077-TEX;n:type:ShaderForge.SFN_Tex2d,id:1839,x:31674,y:32955,varname:node_1839,prsc:2,tex:d22778733a18de44d8da6d6b0d744ff1,ntxv:0,isnm:False|UVIN-9597-UVOUT,TEX-6077-TEX;n:type:ShaderForge.SFN_OneMinus,id:94,x:31461,y:32579,varname:node_94,prsc:2|IN-4331-U;n:type:ShaderForge.SFN_OneMinus,id:2995,x:31461,y:32784,varname:node_2995,prsc:2|IN-4331-V;n:type:ShaderForge.SFN_Multiply,id:2133,x:33356,y:33008,varname:node_2133,prsc:2|A-9330-OUT,B-4046-OUT;n:type:ShaderForge.SFN_Slider,id:5636,x:33287,y:33294,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_5636,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:9665,x:32222,y:33536,varname:node_9665,prsc:2|A-1839-R,B-3897-R,C-9584-OUT;n:type:ShaderForge.SFN_Add,id:1611,x:32414,y:33536,varname:node_1611,prsc:2|A-9665-OUT,B-5449-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5449,x:32222,y:33692,varname:node_5449,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:7780,x:32588,y:33536,ptovrint:False,ptlb:node_7780,ptin:_node_7780,varname:node_7780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6a340f64d0c419d44982d6cae286affe,ntxv:0,isnm:False|UVIN-1611-OUT;n:type:ShaderForge.SFN_Vector1,id:9584,x:32061,y:33623,varname:node_9584,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Add,id:8937,x:33553,y:33008,varname:node_8937,prsc:2|A-2133-OUT,B-1955-OUT;n:type:ShaderForge.SFN_Multiply,id:1955,x:32830,y:33486,varname:node_1955,prsc:2|A-2446-RGB,B-7780-R,C-1481-OUT;n:type:ShaderForge.SFN_Multiply,id:3528,x:31674,y:32579,varname:node_3528,prsc:2|A-94-OUT,B-2995-OUT,C-4331-U,D-532-OUT;n:type:ShaderForge.SFN_Multiply,id:1034,x:33630,y:33208,varname:node_1034,prsc:2|A-1304-A,B-5636-OUT;n:type:ShaderForge.SFN_Color,id:2446,x:32588,y:33718,ptovrint:False,ptlb:wei color,ptin:_weicolor,varname:node_2446,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4852941,c2:0.5101419,c3:1,c4:1;n:type:ShaderForge.SFN_Power,id:7615,x:31861,y:32579,varname:node_7615,prsc:2|VAL-3528-OUT,EXP-4689-OUT;n:type:ShaderForge.SFN_Vector1,id:532,x:31461,y:32709,varname:node_532,prsc:2,v1:5;n:type:ShaderForge.SFN_Vector1,id:4689,x:31674,y:32709,varname:node_4689,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:1653,x:32037,y:32579,varname:node_1653,prsc:2|A-7615-OUT,B-6773-OUT;n:type:ShaderForge.SFN_Vector1,id:6773,x:31861,y:32709,varname:node_6773,prsc:2,v1:3;n:type:ShaderForge.SFN_Clamp01,id:9330,x:32186,y:32579,varname:node_9330,prsc:2|IN-1653-OUT;n:type:ShaderForge.SFN_Vector1,id:9846,x:31674,y:33084,varname:node_9846,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Vector1,id:6164,x:32492,y:32903,varname:node_6164,prsc:2,v1:0.2;proporder:1304-726-9921-484-7659-6925-6077-5636-7780-2446;pass:END;sub:END;*/

Shader "Shader Forge/wanggedimian" {
    Properties {
        _dimianse ("dimianse", Color) = (0.04103589,0.06311896,0.1691176,1)
        _node_726 ("node_726", 2D) = "white" {}
        [HDR]_wanggese ("wanggese", Color) = (0.1029412,0.7772816,1,1)
        _liudongqiang ("liudongqiang", Float ) = 1
        _dibanliudongse ("dibanliudongse", Color) = (0.1911765,0.4645031,1,1)
        _hunhebi ("hunhebi", Range(0, 1)) = 0.5897436
        _liuwenTEX ("liuwenTEX", 2D) = "white" {}
        _alpha ("alpha", Range(0, 1)) = 1
        _node_7780 ("node_7780", 2D) = "white" {}
        _weicolor ("wei color", Color) = (0.4852941,0.5101419,1,1)
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _dimianse;
            uniform sampler2D _node_726; uniform float4 _node_726_ST;
            uniform float4 _wanggese;
            uniform float _liudongqiang;
            uniform float4 _dibanliudongse;
            uniform float _hunhebi;
            uniform sampler2D _liuwenTEX; uniform float4 _liuwenTEX_ST;
            uniform float _alpha;
            uniform sampler2D _node_7780; uniform float4 _node_7780_ST;
            uniform float4 _weicolor;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 _node_726_var = tex2D(_node_726,TRANSFORM_TEX(i.uv0, _node_726));
                float4 node_8867 = _Time;
                float2 node_4127 = (i.uv0+node_8867.g*float2(0.05,0.05));
                float4 node_3897 = tex2D(_liuwenTEX,TRANSFORM_TEX(node_4127, _liuwenTEX));
                float2 node_9597 = (i.uv0+node_8867.g*float2(-0.03,-0.05));
                float4 node_1839 = tex2D(_liuwenTEX,TRANSFORM_TEX(node_9597, _liuwenTEX));
                float2 node_1611 = ((node_1839.r*node_3897.r*0.2)+i.uv0);
                float4 _node_7780_var = tex2D(_node_7780,TRANSFORM_TEX(node_1611, _node_7780));
                float3 finalColor = ((saturate((pow(((1.0 - i.uv0.r)*(1.0 - i.uv0.g)*i.uv0.r*5.0),3.0)*3.0))*((_node_726_var.r*_wanggese.rgb*0.2)+(_node_726_var.r*pow(node_3897.r,3.0)*_dibanliudongse.rgb*_liudongqiang)+lerp((_dibanliudongse.rgb*node_1839.r*0.3),_dimianse.rgb,_hunhebi)))+(_weicolor.rgb*_node_7780_var.r*0.7));
                return fixed4(finalColor,(_dimianse.a*_alpha));
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
