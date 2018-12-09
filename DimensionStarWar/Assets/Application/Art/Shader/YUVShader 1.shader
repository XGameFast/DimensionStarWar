Shader "Unlit/ARCameraShaderssss"
{
	Properties
	{
		_textureY("TextureY", 2D) = "white" {}
	    _textureCbCr("TextureCbCr", 2D) = "black" {}
		_DissolveTex("DissolveTex (RGB)", 2D) = "white" {}
		_Tile("DissolveTile", Range(0.1, 1)) = 1
		_Amount("DissAmount", Range(0, 1)) = 0
	    _DissSize("DissSize", Range(0, 1)) = 0.1
		_DissColor("DissColor", Color) = (1,0,0,1)
		_AddColor("AddColor", Color) = (1,1,0,1)
       
	}
		SubShader
	{
		Cull Off
		Tags{ "RenderType" = "Opaque" }
		LOD 100

		Pass
	{
		ZWrite Off
		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog  

#include "UnityCG.cginc"

		float4x4 _DisplayTransform;

		// samplers
		sampler2D _textureY, _DissolveTex;
		sampler2D _textureCbCr;

		fixed4 _textureY_ST, _DissolveTex_ST;
		half _Tile, _Amount, _DissSize;
		half4 _DissColor, _AddColor;

	struct Vertex
	{
		float4 position : POSITION;
		float2 texcoord : TEXCOORD0;
	};

	struct TexCoordInOut
	{
		float4 position : SV_POSITION;
		float2 texcoord : TEXCOORD0;
		UNITY_FOG_COORDS(1)
	};

	TexCoordInOut vert(Vertex vertex)
	{
		TexCoordInOut o;
		o.position = UnityObjectToClipPos(vertex.position);
		
		o.texcoord = TRANSFORM_TEX(vertex.texcoord, _textureY);

		float texX = vertex.texcoord.x;
		float texY = vertex.texcoord.y;

		o.texcoord.x = (_DisplayTransform[0].x * texX + _DisplayTransform[1].x * (texY)+_DisplayTransform[2].x);
		o.texcoord.y = (_DisplayTransform[0].y * texX + _DisplayTransform[1].y * (texY)+(_DisplayTransform[2].y));

		UNITY_TRANSFER_FOG(o, o.position);

		return o;
	}

	

	fixed4 frag(TexCoordInOut i) : SV_Target
	{
		fixed4 col = tex2D(_textureY, i.texcoord);
	    float ClipTex = tex2D(_DissolveTex, i.texcoord / _Tile).r;
		float ClipAmount = ClipTex - _Amount;
		if (_Amount > 0)
		{
			if (ClipAmount < 0)
			{
				clip(-0.1);
			}
			else {
				if (ClipAmount < _DissSize)
				{
					float4 finalColor = lerp(_DissColor, _AddColor, ClipAmount / _DissSize) * 2;
					col = col * finalColor;
				}
			}
		}
		UNITY_APPLY_FOG(i.fogCoord, col);
		UNITY_OPAQUE_ALPHA(col.a);
		// sample the texture
		float2 texcoord = i.texcoord;
		float y = tex2D(_textureY, texcoord).r;
		float4 ycbcr = float4(y, tex2D(_textureCbCr, texcoord).rg, 1.0);

		const float4x4 ycbcrToRGBTransform = float4x4(
			float4(1.0, +0.0000, +1.4020, -0.7010),
			float4(1.0, -0.3441, -0.7141, +0.5291),
			float4(1.0, +1.7720, +0.0000, -0.8860),
			float4(0.0, +0.0000, +0.0000, +1.0000)
			);


		return mul(ycbcrToRGBTransform, ycbcr);
	}
		ENDCG
	}
	}
}
