#version 320 es


precision highp float;

layout(location=0)out vec4 fragColor;

layout(location=0)uniform vec2 resolution;
layout(location=1)uniform float iTime;
layout(location=2)uniform vec2 mouse;

#define iterations 15.
#define formuparam 0.7

#define volsteps 10.
#define stepsize 0.1

#define zoom   0.800
#define tile   0.850
#define speed  0.020

#define brightness 0.001
#define darkmatter 0.100
#define distfading 0.810
#define saturation 0.950

void main(){
	vec2 uv=gl_FragCoord.xy/resolution.xy-.5;
	uv.y*=resolution.y/resolution.x;
	vec3 dir=vec3(uv*zoom,1.);
	float time=iTime*speed+.25;

	float a1=.5+mouse.x/resolution.x*2.;
	float a2=.8+mouse.y/resolution.y*2.;
	mat2 rot1=mat2(cos(a1),sin(a1),-sin(a1),cos(a1));
	mat2 rot2=mat2(cos(a2),sin(a2),-sin(a2),cos(a2));
	dir.xz*=rot1;
	dir.xy*=rot2;
	vec3 from=vec3(1.,.5,0.5);
	from+=vec3(time*2.,time,-2.);
	from.xz*=rot1;
	from.xy*=rot2;
	
	float s=0.8,fade=1.;
	vec3 v=vec3(0.);
	for (float r=0.; r<volsteps; r++) {
		vec3 p=from+s*dir*.2;
		p = abs(vec3(tile)-mod(p,vec3(tile*2.))); 
		float pa,a=pa=0.;
		for (float i=0.; i<iterations; i++) { 
			p=abs(p)/dot(p,p)-formuparam; // the magic formula
			a+=abs(length(p)-pa); 
			pa=length(p);
		}
		float dm=max(0.,darkmatter-a*a*.001); 
		a*=a*a; 
		if (r>6.) fade*=1.-dm; 
		//v+=vec3(dm,dm*.5,0.);
		v+=fade;
		v+=vec3(s,s*s,s*s*s*s)*a*brightness*fade; 
		fade*=distfading; 
		s+=stepsize;
	}
	v=mix(vec3(length(v)),v,saturation); //color adjust
	fragColor = vec4(v*.01,1.);	
}