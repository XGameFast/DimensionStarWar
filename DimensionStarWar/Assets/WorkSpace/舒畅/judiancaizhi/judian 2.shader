// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34220,y:32679,varname:node_4013,prsc:2|emission-9096-OUT,clip-7277-OUT;n:type:ShaderForge.SFN_Tex2d,id:6673,x:32822,y:32587,ptovrint:False,ptlb:node_6673,ptin:_node_6673,varname:node_6673,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:264ef5fe24c0de4408718924fcfcb7f4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:9092,x:32819,y:32906,varname:node_9092,prsc:2|EXP-2539-OUT;n:type:ShaderForge.SFN_Multiply,id:6915,x:33198,y:32927,varname:node_6915,prsc:2|A-1867-OUT,B-9876-RGB,C-8351-OUT;n:type:ShaderForge.SFN_Color,id:9876,x:33012,y:33087,ptovrint:False,ptlb:node_9876,ptin:_node_9876,varname:node_9876,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3308824,c2:0.8032541,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:2865,x:33413,y:32783,varname:node_2865,prsc:2|A-6673-RGB,B-6915-OUT,C-6485-OUT;n:type:ShaderForge.SFN_Slider,id:2539,x:32485,y:33140,ptovrint:False,ptlb:fangwei,ptin:_fangwei,varname:node_2539,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5384618,max:1;n:type:ShaderForge.SFN_Slider,id:8351,x:32866,y:33306,ptovrint:False,ptlb:qiangdu,ptin:_qiangdu,varname:node_8351,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.25641,max:10;n:type:ShaderForge.SFN_Power,id:1867,x:33012,y:32906,varname:node_1867,prsc:2|VAL-9092-OUT,EXP-3957-OUT;n:type:ShaderForge.SFN_Slider,id:5844,x:32550,y:33283,ptovrint:False,ptlb:power,ptin:_power,varname:node_5844,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Exp,id:3957,x:32835,y:33053,varname:node_3957,prsc:2,et:1|IN-5844-OUT;n:type:ShaderForge.SFN_Color,id:885,x:33296,y:32349,ptovrint:False,ptlb:node_885,ptin:_node_885,varname:node_885,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8970588,c2:0.9446248,c3:1,c4:1;n:type:ShaderForge.SFN_Fresnel,id:1661,x:33283,y:32516,varname:node_1661,prsc:2|EXP-365-OUT;n:type:ShaderForge.SFN_Vector1,id:365,x:33116,y:32516,varname:node_365,prsc:2,v1:2.8;n:type:ShaderForge.SFN_Multiply,id:6485,x:33488,y:32516,varname:node_6485,prsc:2|A-1661-OUT,B-885-RGB;n:type:ShaderForge.SFN_Multiply,id:9096,x:33780,y:32893,varname:node_9096,prsc:2|A-2865-OUT,B-7349-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7349,x:33474,y:32995,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:node_7349,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_FragmentPosition,id:9282,x:33008,y:33426,varname:node_9282,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:6990,x:33008,y:33570,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_6990,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:823,x:33008,y:33733,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_823,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:7891,x:32824,y:33812,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_7891,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.06267526,max:1;n:type:ShaderForge.SFN_Multiply,id:6308,x:33182,y:33761,varname:node_6308,prsc:2|A-823-OUT,B-7891-OUT;n:type:ShaderForge.SFN_Add,id:1106,x:33355,y:33647,varname:node_1106,prsc:2|A-6990-Y,B-6308-OUT;n:type:ShaderForge.SFN_Step,id:7277,x:33544,y:33564,varname:node_7277,prsc:2|A-9282-Y,B-1106-OUT;n:type:ShaderForge.SFN_Add,id:1549,x:33577,y:33765,varname:node_1549,prsc:2|A-1106-OUT,B-1588-OUT;n:type:ShaderForge.SFN_Vector1,id:1588,x:33355,y:33854,varname:node_1588,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:4657,x:33741,y:33698,varname:node_4657,prsc:2|A-9282-Y,B-1549-OUT;n:type:ShaderForge.SFN_Subtract,id:7790,x:33915,y:33501,varname:node_7790,prsc:2|A-4657-OUT,B-7277-OUT;proporder:6673-9876-2539-8351-5844-885-7349-6990-823-7891;pass:END;sub:END;*/

Shader "Shader Forge/judian 2" {
    Properties {
        _node_6673 ("node_6673", 2D) = "white" {}
        [HDR]_node_9876 ("node_9876", Color) = (0.3308824,0.8032541,1,1)
        _fangwei ("fangwei", Range(0, 1)) = 0.5384618
        _qiangdu ("qiangdu", Range(0, 10)) = 1.25641
        _power ("power", Range(0, 1)) = 1
        [HDR]_node_885 ("node_885", Color) = (0.8970588,0.9446248,1,1)
        _Emission ("Emission", Float ) = 0.5
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 0.06267526
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _node_6673; uniform float4 _node_6673_ST;
            uniform float4 _node_9876;
            uniform float _fangwei;
            uniform float _qiangdu;
            uniform float _power;
            uniform float4 _node_885;
            uniform float _Emission;
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_1106 = (_Center.g+(_Height*_HologarmGrowup));
                float node_7277 = step(i.posWorld.g,node_1106);
                clip(node_7277 - 0.5);
////// Lighting:
////// Emissive:
                float4 _node_6673_var = tex2D(_node_6673,TRANSFORM_TEX(i.uv0, _node_6673));
                float3 node_2865 = (_node_6673_var.rgb+(pow(pow(1.0-max(0,dot(normalDirection, viewDirection)),_fangwei),exp2(_power))*_node_9876.rgb*_qiangdu)+(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.8)*_node_885.rgb));
                float3 emissive = (node_2865*_Emission);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
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
                float node_1106 = (_Center.g+(_Height*_HologarmGrowup));
                float node_7277 = step(i.posWorld.g,node_1106);
                clip(node_7277 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
