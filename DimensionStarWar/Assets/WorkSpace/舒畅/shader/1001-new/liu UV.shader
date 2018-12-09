// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33331,y:32724,varname:node_9361,prsc:2|custl-3609-OUT,voffset-4384-OUT;n:type:ShaderForge.SFN_Tex2d,id:6477,x:32382,y:32958,ptovrint:False,ptlb:node_6477,ptin:_node_6477,varname:node_6477,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a62f768f68f8b38448c5199cacc3af2a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:3893,x:32575,y:32887,varname:node_3893,prsc:2|A-5111-OUT,B-6477-R;n:type:ShaderForge.SFN_Step,id:6926,x:32577,y:33179,varname:node_6926,prsc:2|A-6477-R,B-7727-OUT;n:type:ShaderForge.SFN_Multiply,id:2476,x:32791,y:33158,varname:node_2476,prsc:2|A-3893-OUT,B-6926-OUT;n:type:ShaderForge.SFN_RemapRange,id:7727,x:32382,y:33198,varname:node_7727,prsc:2,frmn:0.0084,frmx:1,tomn:0,tomx:1.153|IN-5111-OUT;n:type:ShaderForge.SFN_Multiply,id:3609,x:33135,y:32998,varname:node_3609,prsc:2|A-4661-RGB,B-2476-OUT;n:type:ShaderForge.SFN_Color,id:4661,x:32869,y:32794,ptovrint:False,ptlb:node_4661,ptin:_node_4661,varname:node_4661,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5613739,c2:0.9779412,c3:0.222913,c4:1;n:type:ShaderForge.SFN_Sin,id:4437,x:31908,y:32894,varname:node_4437,prsc:2|IN-5351-TTR;n:type:ShaderForge.SFN_Time,id:5351,x:31736,y:32834,varname:node_5351,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:5111,x:32075,y:32894,varname:node_5111,prsc:2,frmn:-1,frmx:1,tomn:0.0084,tomx:1|IN-4437-OUT;n:type:ShaderForge.SFN_Multiply,id:4384,x:33149,y:33223,varname:node_4384,prsc:2|A-2476-OUT,B-9017-OUT,C-9440-OUT;n:type:ShaderForge.SFN_NormalVector,id:9017,x:32808,y:33289,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector1,id:9440,x:32924,y:33428,varname:node_9440,prsc:2,v1:0.01;proporder:6477-4661;pass:END;sub:END;*/

Shader "Shader Forge/liu UV" {
    Properties {
        _node_6477 ("node_6477", 2D) = "white" {}
        [HDR]_node_4661 ("node_4661", Color) = (0.5613739,0.9779412,0.222913,1)
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
            Cull Off
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
            uniform sampler2D _node_6477; uniform float4 _node_6477_ST;
            uniform float4 _node_4661;
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
                float4 node_5351 = _Time;
                float node_5111 = (sin(node_5351.a)*0.4958+0.5042);
                float4 _node_6477_var = tex2Dlod(_node_6477,float4(TRANSFORM_TEX(o.uv0, _node_6477),0.0,0));
                float node_2476 = (step(node_5111,_node_6477_var.r)*step(_node_6477_var.r,(node_5111*1.162767+-0.009767245)));
                v.vertex.xyz += (node_2476*v.normal*0.01);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
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
                float4 node_5351 = _Time;
                float node_5111 = (sin(node_5351.a)*0.4958+0.5042);
                float4 _node_6477_var = tex2D(_node_6477,TRANSFORM_TEX(i.uv0, _node_6477));
                float node_2476 = (step(node_5111,_node_6477_var.r)*step(_node_6477_var.r,(node_5111*1.162767+-0.009767245)));
                float3 finalColor = (_node_4661.rgb*node_2476);
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
            Cull Off
            
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
            uniform sampler2D _node_6477; uniform float4 _node_6477_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_5351 = _Time;
                float node_5111 = (sin(node_5351.a)*0.4958+0.5042);
                float4 _node_6477_var = tex2Dlod(_node_6477,float4(TRANSFORM_TEX(o.uv0, _node_6477),0.0,0));
                float node_2476 = (step(node_5111,_node_6477_var.r)*step(_node_6477_var.r,(node_5111*1.162767+-0.009767245)));
                v.vertex.xyz += (node_2476*v.normal*0.01);
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
