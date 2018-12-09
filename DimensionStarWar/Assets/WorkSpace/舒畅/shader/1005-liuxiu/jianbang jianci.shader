// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33446,y:32650,varname:node_4013,prsc:2|emission-6426-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32926,y:32703,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5218053,c3:0.1544118,c4:1;n:type:ShaderForge.SFN_Sin,id:8085,x:32587,y:32979,varname:node_8085,prsc:2|IN-4199-T;n:type:ShaderForge.SFN_Time,id:4199,x:32398,y:32959,varname:node_4199,prsc:2;n:type:ShaderForge.SFN_Add,id:2024,x:32793,y:32979,varname:node_2024,prsc:2|A-8085-OUT,B-8271-OUT;n:type:ShaderForge.SFN_Vector1,id:8271,x:32599,y:33154,varname:node_8271,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5545,x:33016,y:32979,varname:node_5545,prsc:2|A-2024-OUT,B-2030-OUT;n:type:ShaderForge.SFN_Vector1,id:2030,x:32793,y:33154,varname:node_2030,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:6426,x:33185,y:32806,varname:node_6426,prsc:2|A-1304-RGB,B-5545-OUT;proporder:1304;pass:END;sub:END;*/

Shader "Shader Forge/jianbang jianci" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,0.5218053,0.1544118,1)
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_4199 = _Time;
                float3 emissive = (_Color.rgb*((sin(node_4199.g)+2.0)*0.5));
                float3 finalColor = emissive;
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
