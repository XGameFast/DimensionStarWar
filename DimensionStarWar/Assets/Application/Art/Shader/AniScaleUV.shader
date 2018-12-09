// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "HZEffect/AniScaleUV" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _TintColor ("Color", Color) = (0.5,0.5,0.5,1)
        _LiuGuang ("流光贴图", 2D) = "white" {}
        [MaterialToggle] _WuAlpha ("黑白流光图无Alpha时勾选", Float ) = 0
        _LiuGuang_Color ("流光_Color", Color) = (0.5,0.5,0.5,1)
        _LiuGuang_QiangDu ("流光强度", Float ) = 3
        _UVScale ("UV缩放", Range(0, 1)) = 0.3
        [MaterialToggle] _AniUVScale ("UV缩放动画", Float ) = 0.3
        _LiuGuang_Speed ("动画速度", Float ) = 5
        _LiuGuang_Mask ("二次_Mask（给流光更复杂的遮罩）", 2D) = "white" {}
        _UVNiuQu ("UV扭曲", 2D) = "white" {}
        _NiuQu_QiangDu ("扭曲强度", Float ) = 0
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
            #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _TintColor;
            uniform sampler2D _LiuGuang; uniform float4 _LiuGuang_ST;
            uniform float4 _LiuGuang_Color;
            uniform float _LiuGuang_QiangDu;
            uniform fixed _LiuGuang_Speed;
            uniform fixed _WuAlpha;
            uniform sampler2D _UVNiuQu; uniform float4 _UVNiuQu_ST;
            uniform fixed _NiuQu_QiangDu;
            uniform fixed _AniUVScale;
            uniform fixed _UVScale;
            uniform sampler2D _LiuGuang_Mask; uniform float4 _LiuGuang_Mask_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                fixed node_5662 = 0.5;
                fixed node_1254 = ((_NiuQu_QiangDu*0.15)+node_5662);
                float4 node_9400 = _Time + _TimeEditor;
                fixed _AniUVScale_var = lerp( _UVScale, fmod((node_9400.r*_LiuGuang_Speed),1.0), _AniUVScale );
                float4 _UVNiuQu_var = tex2D(_UVNiuQu,TRANSFORM_TEX(i.uv0, _UVNiuQu));
                float2 node_5211 = lerp((i.uv0+((i.uv0-node_1254)/_AniUVScale_var)+(_UVNiuQu_var.r*_NiuQu_QiangDu)),float2(node_1254,node_1254),_AniUVScale_var);
                float2 node_8432 = saturate(node_5211);
                float4 _LiuGuang_var = tex2D(_LiuGuang,TRANSFORM_TEX(node_8432, _LiuGuang));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _LiuGuang_Mask_var = tex2D(_LiuGuang_Mask,TRANSFORM_TEX(i.uv0, _LiuGuang_Mask));
                fixed node_7335 = (lerp( _LiuGuang_var.a, _LiuGuang_var.r, _WuAlpha )*_MainTex_var.a*_LiuGuang_Mask_var.r);
                float3 node_6933 = (_LiuGuang_var.rgb*_LiuGuang_Color.rgb*_LiuGuang_QiangDu);
                float3 emissive = ((lerp( _MainTex_var.rgb, node_6933, node_7335.r ))*i.vertexColor.rgb*_TintColor.rgb*2.0);
                float3 finalColor = emissive;
                return fixed4(finalColor,(_MainTex_var.a*i.vertexColor.a*_TintColor.a));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
