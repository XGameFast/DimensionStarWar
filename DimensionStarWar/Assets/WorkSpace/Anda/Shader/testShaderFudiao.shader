// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33320,y:32762,varname:node_9361,prsc:2|custl-7925-OUT;n:type:ShaderForge.SFN_TexCoord,id:2545,x:31184,y:32728,varname:node_2545,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:4189,x:31184,y:32949,varname:node_4189,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:3701,x:31184,y:33041,varname:node_3701,prsc:2,v1:256;n:type:ShaderForge.SFN_Divide,id:6231,x:31381,y:32982,varname:node_6231,prsc:2|A-4189-OUT,B-3701-OUT;n:type:ShaderForge.SFN_Subtract,id:1332,x:31561,y:32771,varname:node_1332,prsc:2|A-2545-U,B-6231-OUT;n:type:ShaderForge.SFN_Subtract,id:8595,x:31561,y:32933,varname:node_8595,prsc:2|A-2545-V,B-6231-OUT;n:type:ShaderForge.SFN_Append,id:1142,x:31807,y:32869,varname:node_1142,prsc:2|A-1332-OUT,B-8595-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7910,x:31820,y:32528,ptovrint:False,ptlb:MainText,ptin:_MainText,varname:node_7910,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4011,x:31615,y:32610,varname:node_4011,prsc:2,ntxv:0,isnm:False|UVIN-2545-UVOUT,TEX-7910-TEX;n:type:ShaderForge.SFN_Tex2d,id:6995,x:32083,y:32796,varname:node_6995,prsc:2,ntxv:0,isnm:False|UVIN-1142-OUT,TEX-7910-TEX;n:type:ShaderForge.SFN_Subtract,id:2544,x:32322,y:32815,varname:node_2544,prsc:2|A-4011-RGB,B-6995-RGB;n:type:ShaderForge.SFN_ComponentMask,id:3507,x:32475,y:32840,varname:node_3507,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-2544-OUT;n:type:ShaderForge.SFN_Vector1,id:9653,x:32475,y:32747,varname:node_9653,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:6684,x:32717,y:32781,varname:node_6684,prsc:2|A-9653-OUT,B-3507-R;n:type:ShaderForge.SFN_Multiply,id:7286,x:32717,y:32941,varname:node_7286,prsc:2|A-9179-OUT,B-3507-G;n:type:ShaderForge.SFN_Vector1,id:9179,x:32475,y:32997,varname:node_9179,prsc:2,v1:0.59;n:type:ShaderForge.SFN_Multiply,id:4145,x:32717,y:33102,varname:node_4145,prsc:2|A-401-OUT,B-3507-B;n:type:ShaderForge.SFN_Vector1,id:401,x:32475,y:33113,varname:node_401,prsc:2,v1:0.11;n:type:ShaderForge.SFN_Add,id:3803,x:32933,y:32941,varname:node_3803,prsc:2|A-6684-OUT,B-7286-OUT,C-4145-OUT;n:type:ShaderForge.SFN_Vector4,id:5562,x:32872,y:33215,varname:node_5562,prsc:2,v1:1,v2:1,v3:1,v4:0;n:type:ShaderForge.SFN_Multiply,id:7925,x:33076,y:33133,varname:node_7925,prsc:2|A-3803-OUT,B-5562-OUT;proporder:7910;pass:END;sub:END;*/

Shader "Shader Forge/testShaderFudiao" {
    Properties {
        _MainText ("MainText", 2D) = "white" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainText; uniform float4 _MainText_ST;
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
                float4 node_4011 = tex2D(_MainText,TRANSFORM_TEX(i.uv0, _MainText));
                float node_6231 = (1.0/256.0);
                float2 node_1142 = float2((i.uv0.r-node_6231),(i.uv0.g-node_6231));
                float4 node_6995 = tex2D(_MainText,TRANSFORM_TEX(node_1142, _MainText));
                float3 node_3507 = (node_4011.rgb-node_6995.rgb).rgb;
                float3 finalColor = (((0.3*node_3507.r)+(0.59*node_3507.g)+(0.11*node_3507.b))*float4(1,1,1,0)).rgb;
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
