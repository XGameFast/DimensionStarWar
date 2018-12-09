// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33801,y:32685,varname:node_4013,prsc:2|diff-2865-OUT;n:type:ShaderForge.SFN_Tex2d,id:6673,x:32822,y:32587,ptovrint:False,ptlb:node_6673,ptin:_node_6673,varname:node_6673,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:264ef5fe24c0de4408718924fcfcb7f4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:9092,x:32819,y:32906,varname:node_9092,prsc:2|EXP-2539-OUT;n:type:ShaderForge.SFN_Multiply,id:6915,x:33198,y:32927,varname:node_6915,prsc:2|A-1867-OUT,B-9876-RGB,C-8351-OUT;n:type:ShaderForge.SFN_Color,id:9876,x:33012,y:33087,ptovrint:False,ptlb:node_9876,ptin:_node_9876,varname:node_9876,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3308824,c2:0.8032541,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:9057,x:33538,y:33077,varname:node_9057,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:2865,x:33413,y:32783,varname:node_2865,prsc:2|A-6673-RGB,B-6915-OUT,C-6485-OUT;n:type:ShaderForge.SFN_Slider,id:2539,x:32485,y:33140,ptovrint:False,ptlb:fangwei,ptin:_fangwei,varname:node_2539,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5384618,max:1;n:type:ShaderForge.SFN_Slider,id:8351,x:32866,y:33306,ptovrint:False,ptlb:qiangdu,ptin:_qiangdu,varname:node_8351,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.25641,max:10;n:type:ShaderForge.SFN_Power,id:1867,x:33012,y:32906,varname:node_1867,prsc:2|VAL-9092-OUT,EXP-3957-OUT;n:type:ShaderForge.SFN_Slider,id:5844,x:32550,y:33283,ptovrint:False,ptlb:power,ptin:_power,varname:node_5844,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Exp,id:3957,x:32835,y:33053,varname:node_3957,prsc:2,et:1|IN-5844-OUT;n:type:ShaderForge.SFN_Color,id:885,x:33296,y:32349,ptovrint:False,ptlb:node_885,ptin:_node_885,varname:node_885,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8970588,c2:0.9446248,c3:1,c4:1;n:type:ShaderForge.SFN_Fresnel,id:1661,x:33283,y:32516,varname:node_1661,prsc:2|EXP-365-OUT;n:type:ShaderForge.SFN_Vector1,id:365,x:33116,y:32516,varname:node_365,prsc:2,v1:2.8;n:type:ShaderForge.SFN_Multiply,id:6485,x:33488,y:32516,varname:node_6485,prsc:2|A-1661-OUT,B-885-RGB;proporder:6673-9876-2539-8351-5844-885;pass:END;sub:END;*/

Shader "Shader Forge/judian 2" {
    Properties {
        _node_6673 ("node_6673", 2D) = "white" {}
        [HDR]_node_9876 ("node_9876", Color) = (0.3308824,0.8032541,1,1)
        _fangwei ("fangwei", Range(0, 1)) = 0.5384618
        _qiangdu ("qiangdu", Range(0, 10)) = 1.25641
        _power ("power", Range(0, 1)) = 1
        [HDR]_node_885 ("node_885", Color) = (0.8970588,0.9446248,1,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _node_6673; uniform float4 _node_6673_ST;
            uniform float4 _node_9876;
            uniform float _fangwei;
            uniform float _qiangdu;
            uniform float _power;
            uniform float4 _node_885;
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
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _node_6673_var = tex2D(_node_6673,TRANSFORM_TEX(i.uv0, _node_6673));
                float3 diffuseColor = (_node_6673_var.rgb+(pow(pow(1.0-max(0,dot(normalDirection, viewDirection)),_fangwei),exp2(_power))*_node_9876.rgb*_qiangdu)+(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.8)*_node_885.rgb));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _node_6673; uniform float4 _node_6673_ST;
            uniform float4 _node_9876;
            uniform float _fangwei;
            uniform float _qiangdu;
            uniform float _power;
            uniform float4 _node_885;
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
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_6673_var = tex2D(_node_6673,TRANSFORM_TEX(i.uv0, _node_6673));
                float3 diffuseColor = (_node_6673_var.rgb+(pow(pow(1.0-max(0,dot(normalDirection, viewDirection)),_fangwei),exp2(_power))*_node_9876.rgb*_qiangdu)+(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.8)*_node_885.rgb));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
