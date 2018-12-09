// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33950,y:32682,varname:node_9361,prsc:2|emission-4329-OUT,clip-8972-OUT;n:type:ShaderForge.SFN_Fresnel,id:2511,x:32837,y:32771,varname:node_2511,prsc:2|EXP-9837-OUT;n:type:ShaderForge.SFN_Multiply,id:8585,x:33065,y:32810,varname:node_8585,prsc:2|A-2511-OUT,B-9286-OUT;n:type:ShaderForge.SFN_Add,id:5709,x:33291,y:32850,varname:node_5709,prsc:2|A-8585-OUT,B-7978-OUT;n:type:ShaderForge.SFN_Multiply,id:5886,x:33517,y:32850,varname:node_5886,prsc:2|A-5709-OUT,B-7650-RGB;n:type:ShaderForge.SFN_Color,id:7650,x:33291,y:33014,ptovrint:False,ptlb:node_7650,ptin:_node_7650,varname:node_7650,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5955882,c2:0.815923,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:7978,x:33090,y:32998,varname:node_7978,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:9837,x:32490,y:32912,ptovrint:False,ptlb:Fresnel fangwei,ptin:_Fresnelfangwei,varname:node_9837,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.5,max:2;n:type:ShaderForge.SFN_Slider,id:9286,x:32704,y:33069,ptovrint:False,ptlb:qiangdu,ptin:_qiangdu,varname:node_9286,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:3;n:type:ShaderForge.SFN_FragmentPosition,id:2922,x:32920,y:33246,varname:node_2922,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:5312,x:32920,y:33397,ptovrint:False,ptlb:Center,ptin:_Center,varname:node_5312,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ValueProperty,id:6878,x:32920,y:33563,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_6878,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Slider,id:853,x:32763,y:33649,ptovrint:False,ptlb:HologarmGrowup,ptin:_HologarmGrowup,varname:node_853,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:7503,x:33101,y:33589,varname:node_7503,prsc:2|A-6878-OUT,B-853-OUT;n:type:ShaderForge.SFN_Add,id:7306,x:33247,y:33518,varname:node_7306,prsc:2|A-5312-Y,B-7503-OUT;n:type:ShaderForge.SFN_Step,id:8972,x:33404,y:33438,varname:node_8972,prsc:2|A-2922-Y,B-7306-OUT;n:type:ShaderForge.SFN_Add,id:3736,x:33499,y:33626,varname:node_3736,prsc:2|A-7306-OUT,B-2109-OUT;n:type:ShaderForge.SFN_Vector1,id:2109,x:33285,y:33770,varname:node_2109,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Step,id:6631,x:33664,y:33550,varname:node_6631,prsc:2|A-2922-Y,B-3736-OUT;n:type:ShaderForge.SFN_Subtract,id:3004,x:33795,y:33417,varname:node_3004,prsc:2|A-6631-OUT,B-8972-OUT;n:type:ShaderForge.SFN_Add,id:4329,x:33620,y:33012,varname:node_4329,prsc:2|A-5886-OUT,B-3004-OUT;proporder:7650-9837-9286-5312-6878-853;pass:END;sub:END;*/

Shader "Shader Forge/judian 3" {
    Properties {
        [HDR]_node_7650 ("node_7650", Color) = (0.5955882,0.815923,1,1)
        _Fresnelfangwei ("Fresnel fangwei", Range(0, 2)) = 1.5
        _qiangdu ("qiangdu", Range(0, 3)) = 1
        _Center ("Center", Vector) = (0,0,0,0)
        _Height ("Height", Float ) = 1
        _HologarmGrowup ("HologarmGrowup", Range(0, 1)) = 0
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
            uniform float4 _node_7650;
            uniform float _Fresnelfangwei;
            uniform float _qiangdu;
            uniform float4 _Center;
            uniform float _Height;
            uniform float _HologarmGrowup;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                float node_7306 = (_Center.g+(_Height*_HologarmGrowup));
                float node_8972 = step(i.posWorld.g,node_7306);
                clip(node_8972 - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = ((((pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnelfangwei)*_qiangdu)+1.0)*_node_7650.rgb)+(step(i.posWorld.g,(node_7306+0.1))-node_8972));
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
                float node_7306 = (_Center.g+(_Height*_HologarmGrowup));
                float node_8972 = step(i.posWorld.g,node_7306);
                clip(node_8972 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
