// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33978,y:32627,varname:node_3138,prsc:2|emission-4735-OUT,alpha-3093-OUT,voffset-7878-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:33175,y:33040,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_RemapRange,id:6230,x:32491,y:32836,varname:node_6230,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2174-OUT;n:type:ShaderForge.SFN_Rotator,id:2996,x:32695,y:32836,varname:node_2996,prsc:2|UVIN-6230-OUT,SPD-1880-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2174,x:32290,y:32836,varname:node_2174,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-3533-XYZ;n:type:ShaderForge.SFN_Tex2d,id:7735,x:33135,y:32542,ptovrint:False,ptlb:node_7735,ptin:_node_7735,varname:node_7735,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_NormalVector,id:9670,x:32843,y:33207,prsc:2,pt:False;n:type:ShaderForge.SFN_Add,id:4735,x:33728,y:32726,varname:node_4735,prsc:2|A-7735-RGB,B-1893-OUT;n:type:ShaderForge.SFN_Multiply,id:1893,x:33505,y:32846,varname:node_1893,prsc:2|A-4235-RGB,B-7241-RGB,C-9007-OUT;n:type:ShaderForge.SFN_Multiply,id:3093,x:33505,y:33011,varname:node_3093,prsc:2|A-4235-A,B-7241-A,C-8050-A,D-7735-R;n:type:ShaderForge.SFN_Multiply,id:7878,x:33505,y:33211,varname:node_7878,prsc:2|A-9670-OUT,B-8050-A,C-4235-RGB;n:type:ShaderForge.SFN_Transform,id:3533,x:32074,y:32836,varname:node_3533,prsc:2,tffrom:0,tfto:3|IN-9670-OUT;n:type:ShaderForge.SFN_Vector1,id:1880,x:32843,y:33042,varname:node_1880,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:4235,x:33175,y:32844,ptovrint:False,ptlb:maintex,ptin:_maintex,varname:node_4235,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0839562779f0c0543aaa239b78bd12b9,ntxv:0,isnm:False|UVIN-4287-OUT;n:type:ShaderForge.SFN_Slider,id:9007,x:33067,y:33281,ptovrint:False,ptlb:liangdu,ptin:_liangdu,varname:node_9007,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.017457,max:10;n:type:ShaderForge.SFN_Clamp01,id:4287,x:32908,y:32836,varname:node_4287,prsc:2|IN-2996-UVOUT;n:type:ShaderForge.SFN_VertexColor,id:8050,x:33103,y:33469,varname:node_8050,prsc:2;proporder:7241-4235-7735-9007;pass:END;sub:END;*/

Shader "Shader Forge/guanghuan" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _maintex ("maintex", 2D) = "white" {}
        _node_7735 ("node_7735", 2D) = "white" {}
        _liangdu ("liangdu", Range(0, 10)) = 2.017457
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
            uniform float4 _Color;
            uniform sampler2D _node_7735; uniform float4 _node_7735_ST;
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
            uniform float _liangdu;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_5677 = _Time;
                float node_2996_ang = node_5677.g;
                float node_2996_spd = 0.5;
                float node_2996_cos = cos(node_2996_spd*node_2996_ang);
                float node_2996_sin = sin(node_2996_spd*node_2996_ang);
                float2 node_2996_piv = float2(0.5,0.5);
                float2 node_2996 = (mul((mul( UNITY_MATRIX_V, float4(v.normal,0) ).xyz.rgb.rg*0.5+0.5)-node_2996_piv,float2x2( node_2996_cos, -node_2996_sin, node_2996_sin, node_2996_cos))+node_2996_piv);
                float2 node_4287 = saturate(node_2996);
                float4 _maintex_var = tex2Dlod(_maintex,float4(TRANSFORM_TEX(node_4287, _maintex),0.0,0));
                v.vertex.xyz += (v.normal*o.vertexColor.a*_maintex_var.rgb);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _node_7735_var = tex2D(_node_7735,TRANSFORM_TEX(i.uv0, _node_7735));
                float4 node_5677 = _Time;
                float node_2996_ang = node_5677.g;
                float node_2996_spd = 0.5;
                float node_2996_cos = cos(node_2996_spd*node_2996_ang);
                float node_2996_sin = sin(node_2996_spd*node_2996_ang);
                float2 node_2996_piv = float2(0.5,0.5);
                float2 node_2996 = (mul((mul( UNITY_MATRIX_V, float4(i.normalDir,0) ).xyz.rgb.rg*0.5+0.5)-node_2996_piv,float2x2( node_2996_cos, -node_2996_sin, node_2996_sin, node_2996_cos))+node_2996_piv);
                float2 node_4287 = saturate(node_2996);
                float4 _maintex_var = tex2D(_maintex,TRANSFORM_TEX(node_4287, _maintex));
                float3 emissive = (_node_7735_var.rgb+(_maintex_var.rgb*_Color.rgb*_liangdu));
                float3 finalColor = emissive;
                return fixed4(finalColor,(_maintex_var.a*_Color.a*i.vertexColor.a*_node_7735_var.r));
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
            uniform sampler2D _maintex; uniform float4 _maintex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_3013 = _Time;
                float node_2996_ang = node_3013.g;
                float node_2996_spd = 0.5;
                float node_2996_cos = cos(node_2996_spd*node_2996_ang);
                float node_2996_sin = sin(node_2996_spd*node_2996_ang);
                float2 node_2996_piv = float2(0.5,0.5);
                float2 node_2996 = (mul((mul( UNITY_MATRIX_V, float4(v.normal,0) ).xyz.rgb.rg*0.5+0.5)-node_2996_piv,float2x2( node_2996_cos, -node_2996_sin, node_2996_sin, node_2996_cos))+node_2996_piv);
                float2 node_4287 = saturate(node_2996);
                float4 _maintex_var = tex2Dlod(_maintex,float4(TRANSFORM_TEX(node_4287, _maintex),0.0,0));
                v.vertex.xyz += (v.normal*o.vertexColor.a*_maintex_var.rgb);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
