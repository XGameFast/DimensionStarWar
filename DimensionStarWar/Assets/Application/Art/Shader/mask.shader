Shader "Transparent/Masks"
{
	Properties
	{
		_MainTex("Base (RGB)", 2D) = "white" {}
	_Mask("Culling Mask", 2D) = "white" {}
	_Cutoff("Alpha Cutoff", Range(0, 1)) = 0.1
	}
		SubShader
	{
		Pass
	{
		AlphaTest GEqual[_Cutoff]
		SetTexture[_Mask]{}
		SetTexture[_MainTex]{ combine texture, previous }
	}
	}
}