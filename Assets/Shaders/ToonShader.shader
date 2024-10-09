Shader "Custom/ToonShader"
{
    Properties
    {
        _MainTexture  ("Main texture", 2D) = "white"{}
        _Color  ("Color", Color) = (1,1,1,1)
        _ColRamp ("Ramp Texture", 2D) = "white"{}

    }
    SubShader
    {
             
        CGPROGRAM

        #pragma surface surf ToonShader

        float4 _Color;
        sampler _ColRamp;


        float4 LightingToonShader(SurfaceOutput s , fixed3 lightDire,fixed allen)
        {
            //diffuse
            float diff = dot(s.Normal, lightDire);
            float h = diff * 0.5 + 0.3;

            float2 rh = h; 
            float3 ramp = tex2D(_ColRamp, rh).rgb;


            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
            c.a = s.Alpha;
            return c; 


        }
            
        struct Input
        {
            float2 MainText;

        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;

        }
           
        ENDCG
        
    }
    Fallback "Diffuse"
}
