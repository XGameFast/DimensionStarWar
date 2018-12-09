// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33746,y:32674,varname:node_9361,prsc:2;n:type:ShaderForge.SFN_Slider,id:8114,x:32655,y:33222,ptovrint:False,ptlb:zheshe,ptin:_zheshe,varname:node_8114,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:2.107072,max:10;n:type:ShaderForge.SFN_Parallax,id:5077,x:32733,y:33327,varname:node_5077,prsc:2|HEI-8114-OUT;n:type:ShaderForge.SFN_Fresnel,id:2511,x:32574,y:32713,varname:node_2511,prsc:2|EXP-1499-OUT;n:type:ShaderForge.SFN_Multiply,id:8585,x:32898,y:32827,varname:node_8585,prsc:2|A-2511-OUT,B-980-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9724,x:32304,y:32911,varname:node_9724,prsc:2,sctp:0;n:type:ShaderForge.SFN_Append,id:9330,x:32546,y:33004,varname:node_9330,prsc:2|A-443-R,B-443-G;n:type:ShaderForge.SFN_Lerp,id:6075,x:32655,y:32977,varname:node_6075,prsc:2|A-9724-UVOUT,B-9330-OUT,T-2028-OUT;n:type:ShaderForge.SFN_Slider,id:2028,x:32314,y:33227,ptovrint:False,ptlb:node_2028,ptin:_node_2028,varname:node_2028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5815706,max:1;n:type:ShaderForge.SFN_Tex2dAsset,id:8761,x:31894,y:32654,ptovrint:False,ptlb:node_8761,ptin:_node_8761,varname:node_8761,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:443,x:32174,y:33057,varname:node_443,prsc:2,ntxv:0,isnm:False|TEX-8761-TEX;n:type:ShaderForge.SFN_Tex2d,id:7349,x:32697,y:32366,varname:node_7349,prsc:2,ntxv:0,isnm:False|UVIN-1088-UVOUT,TEX-8761-TEX;n:type:ShaderForge.SFN_Panner,id:1088,x:32522,y:32366,varname:node_1088,prsc:2,spu:-0.01,spv:0.01|UVIN-2447-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2447,x:32320,y:32366,varname:node_2447,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:4510,x:32525,y:32532,varname:node_4510,prsc:2,spu:0.005,spv:-0.01|UVIN-2447-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8327,x:32697,y:32532,varname:node_8327,prsc:2,ntxv:0,isnm:False|UVIN-4510-UVOUT,TEX-8761-TEX;n:type:ShaderForge.SFN_Add,id:5315,x:32890,y:32448,varname:node_5315,prsc:2|A-7349-R,B-8327-R,C-2447-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9101,x:33178,y:32394,ptovrint:False,ptlb:beiniuqutu,ptin:_beiniuqutu,varname:node_9101,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5315-OUT;n:type:ShaderForge.SFN_Multiply,id:5886,x:33522,y:32935,varname:node_5886,prsc:2|A-8585-OUT,B-7650-RGB;n:type:ShaderForge.SFN_Color,id:7650,x:33291,y:33096,ptovrint:False,ptlb:node_7650,ptin:_node_7650,varname:node_7650,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5955882,c2:0.815923,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:1499,x:32281,y:32804,ptovrint:False,ptlb:fangwei,ptin:_fangwei,varname:node_1499,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8793575,max:5;n:type:ShaderForge.SFN_Slider,id:980,x:32525,y:32895,ptovrint:False,ptlb:qiangdu,ptin:_qiangdu,varname:_node_1499_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8908994,max:5;n:type:ShaderForge.SFN_Fresnel,id:5508,x:33320,y:32671,varname:node_5508,prsc:2|EXP-1956-OUT;n:type:ShaderForge.SFN_Vector1,id:1956,x:33123,y:32679,varname:node_1956,prsc:2,v1:0.2;proporder:8114-2028-8761-9101-7650-1499-980;pass:END;sub:END;*/

Shader "Shader Forge/shiyan" {
    Properties {
        _zheshe ("zheshe", Range(-10, 10)) = 2.107072
        _node_2028 ("node_2028", Range(0, 1)) = 0.5815706
        _node_8761 ("node_8761", 2D) = "white" {}
        _beiniuqutu ("beiniuqutu", 2D) = "white" {}
        [HDR]_node_7650 ("node_7650", Color) = (0.5955882,0.815923,1,1)
        _fangwei ("fangwei", Range(0, 5)) = 0.8793575
        _qiangdu ("qiangdu", Range(0, 5)) = 0.8908994
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
                float3 finalColor = 0;
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
