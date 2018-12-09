// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33568,y:32710,varname:node_4013,prsc:2|emission-4419-RGB;n:type:ShaderForge.SFN_Color,id:1304,x:33166,y:32506,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_TexCoord,id:164,x:32265,y:32674,varname:node_164,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:6533,x:32594,y:32893,varname:node_6533,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-164-V;n:type:ShaderForge.SFN_Append,id:5323,x:32594,y:32666,varname:node_5323,prsc:2|A-164-U,B-6533-OUT;n:type:ShaderForge.SFN_UVTile,id:821,x:32910,y:32673,varname:node_821,prsc:2|UVIN-5323-OUT,WDT-572-OUT,HGT-5868-OUT,TILE-3474-OUT;n:type:ShaderForge.SFN_ValueProperty,id:572,x:32716,y:32707,ptovrint:False,ptlb:2,ptin:_2,varname:node_572,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:3384,x:32366,y:33101,ptovrint:False,ptlb:hei,ptin:_hei,varname:node_3384,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Negate,id:5868,x:32559,y:33070,varname:node_5868,prsc:2|IN-3384-OUT;n:type:ShaderForge.SFN_Time,id:3572,x:32404,y:33291,varname:node_3572,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4814,x:32663,y:33289,varname:node_4814,prsc:2|A-3572-T,B-1144-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1144,x:32415,y:33458,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_1144,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.6;n:type:ShaderForge.SFN_Trunc,id:3474,x:32823,y:33142,varname:node_3474,prsc:2|IN-4814-OUT;n:type:ShaderForge.SFN_Tex2d,id:4419,x:33190,y:32693,varname:node_4419,prsc:2,tex:a5b21ae69e5209c4cb884d69d2ea39d7,ntxv:0,isnm:False|UVIN-821-UVOUT,TEX-5242-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:5242,x:32950,y:32855,ptovrint:False,ptlb:node_5242,ptin:_node_5242,varname:node_5242,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a5b21ae69e5209c4cb884d69d2ea39d7,ntxv:0,isnm:False;proporder:1304-572-3384-1144-5242;pass:END;sub:END;*/

Shader "Shader Forge/UVxuliezhen" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _2 ("2", Float ) = 3
        _hei ("hei", Float ) = 2
        _speed ("speed", Float ) = 0.6
        _node_5242 ("node_5242", 2D) = "white" {}
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
            uniform float _2;
            uniform float _hei;
            uniform float _speed;
            uniform sampler2D _node_5242; uniform float4 _node_5242_ST;
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
////// Emissive:
                float4 node_3572 = _Time;
                float node_3474 = trunc((node_3572.g*_speed));
                float2 node_821_tc_rcp = float2(1.0,1.0)/float2( _2, (-1*_hei) );
                float node_821_ty = floor(node_3474 * node_821_tc_rcp.x);
                float node_821_tx = node_3474 - _2 * node_821_ty;
                float2 node_821 = (float2(i.uv0.r,(i.uv0.g*-1.0+1.0)) + float2(node_821_tx, node_821_ty)) * node_821_tc_rcp;
                float4 node_4419 = tex2D(_node_5242,TRANSFORM_TEX(node_821, _node_5242));
                float3 emissive = node_4419.rgb;
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
