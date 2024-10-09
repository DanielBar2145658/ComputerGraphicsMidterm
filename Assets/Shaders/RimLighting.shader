Shader "Custom/RimLighting"
{
    Properties
    {

        _RimColor ("Rim Color", Color) = (0.0,0.0,0.0) 
        _RimPower ("RimPower", Range(0.2, 10.0)) = 5.0  
        _RimColor2 ("Rim Color2", Color) = (0.0,0.0,0.0) 
        _RimPower2 ("RimPower2", Range(0.2, 10.0)) = 5.0  
    
    }
    SubShader
    {
        

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float3 viewDir;

        };

        float RimPower;
        float4 _RimColor;
        float RimPower2;
        float4 _RimColor2;


        void surf(Input IN, inout SurfaceOutput o)
        {
            half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
            half rim2 = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _RimColor.rgb * rim;
            o.Emission = _RimColor2.rgb * rim2 + rim;
        }
        ENDCG
        
        

    }
    Fallback "Diffuse"
}
