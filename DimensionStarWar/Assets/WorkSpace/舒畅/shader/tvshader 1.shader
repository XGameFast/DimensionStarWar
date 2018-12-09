Shader "Unlit/NewUnlitShader 2"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	_TimeScale("花屏速度" , Range(0.0001, 2.0)) = 1.0
	_TimeOffset("时间偏移" , Range(0.0001, 2.0)) = 1.0
	_EffectScale("效果缩放" , Range(0, 500.0)) = 1.0
	_LightScale("亮度缩放" , Range(0.01, 5.0)) = 1.0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

#define R frac(43.*sin(p.x*73.+p.y*8.))


		float _TimeScale;
		float _TimeOffset;
		float _EffectScale;
		float _LightScale;
	float sat(float t) {
		return clamp(t, 0.0, 1.0);
	}

	float2 sat(float2 t) {
		return clamp(t, 0.0, 1.0);
	}

	//remaps inteval [a;b] to [0;1]
	float remap(float t, float a, float b) {
		return sat((t - a) / (b - a));
	}

	//note: /\ t=[0;0.5;1], y=[0;1;0]
	float linterp(float t) {
		return sat(1.0 - abs(2.0*t - 1.0));
	}

	float3 spectrum_offset(float t) {
		float3 ret;
		float lo = step(t,0.5);
		float hi = 1.0 - lo;
		float w = linterp(remap(t, 1.0 / 6.0, 5.0 / 6.0));
		float neg_w = 1.0 - w;
		ret = float3(lo,1.0,hi) * float3(neg_w, w, neg_w);
		return pow(ret, float3(1.0 / 2.2, 1.0 / 2.2, 1.0 / 2.2));
	}

	//note: [0;1]
	float rand(float2 n) {
		//return frac(sin(dot(n.xy, float2(12.9898, 78.233)))* 43758.5453);
		//return (sin(_Time.y*1000));
		return (sin(dot(float2(n.x *_TimeScale+ _TimeOffset, n.y *_TimeScale+ _TimeOffset), float2(12.9898, 78.233))));
	}

	//note: [-1;1]
	float srand(float2 n) {
		return rand(n) * 2.0 - 1.0;
	}

	float mytrunc(float x, float num_levels)
	{
		return floor(x*num_levels) / num_levels;
	}
	float2 mytrunc(float2 x, float num_levels)
	{
		return floor(x*num_levels) / num_levels;
	}
	sampler2D _MainTex;
	float4 _MainTex_ST;
	float uvOffset;


			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};



			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
				// apply fog
				UNITY_APPLY_FOG(i.fogCoord, col);









				float4 c;


				float aspect = _ScreenParams.x / _ScreenParams.y;
				aspect = 1;
				float2 uv = _ScreenParams.xy / _ScreenParams.xy;
				uv = float2(1, 1);
				i.uv.y = 1.0 - i.uv.y;

				float time = fmod(_Time.y, 32.0); // + modelmat[0].x + modelmat[0].z;
												  //float time = _Time.y*pow(0.1,_TimeScale);
				float GLITCH = 0.1*_EffectScale;// + iMouse.x / iResolution.x

								   //float rdist = length( (uv - vec2(0.5,0.5))*vec2(aspect, 1.0) )/1.4;
								   //GLITCH *= rdist;

				float gnm = sat(GLITCH);
				float rnd0 = rand(mytrunc(float2(time, time), 6.0));
				float r0 = sat((1.0 - gnm)*0.7 + rnd0);
				float rnd1 = rand(float2(mytrunc(i.uv.x, 10.0*r0), time)); //horz
																		   //float r1 = 1.0f - sat( (1.0f-gnm)*0.5f + rnd1 );
				float r1 = 0.5 - 0.5 * gnm + rnd1;
				r1 = 1.0 - max(0.0, ((r1<1.0) ? r1 : 0.9999999)); //note: weird ass bug on old drivers
				float rnd2 = rand(float2(mytrunc(i.uv.y, 40.0*r1), time)); //vert
				float r2 = sat(rnd2);

				float rnd3 = rand(float2(mytrunc(i.uv.y, 10.0*r0), time));
				float r3 = (1.0 - sat(rnd3 + 0.8)) - 0.1;

				float pxrnd = rand(i.uv + time);

				float ofs = 0.05 * r2 * GLITCH * (rnd0 > 0.5 ? 1.0 : -1.0);
				ofs += 0.5 * pxrnd * ofs;

				i.uv.y += 0.1 * r3 * GLITCH;

				const int NUM_SAMPLES = 10;
				const float RCP_NUM_SAMPLES_F = 1.0 / float(NUM_SAMPLES);

				float4 sum = float4(0.0, 0.0, 0.0, 0.0);
				float3 wsum = float3(0.0, 0.0, 0.0);
				for (int j = 0; j<NUM_SAMPLES; ++j)
				{
					float t = float(j) * RCP_NUM_SAMPLES_F;
					i.uv.x = sat(i.uv.x + ofs * t);


					float4 samplecol = tex2D(_MainTex, i.uv); //texture(_MainTex, i.uv, -10.0);
					float3 s = spectrum_offset(t);

					samplecol.rgb = samplecol.rgb * s;
					sum += samplecol;
					wsum += s;
				}
				sum.rgb /= wsum;
				sum.a *= RCP_NUM_SAMPLES_F;

				//fragColor = vec4( sum.bbb, 1.0 ); return;

				c.a = sum.a;
				c.rgb = sum.rgb; // * outcol0.a;
				c.rgb = c.rgb*_LightScale;














				return c;
			}
			ENDCG
		}
	}
}
