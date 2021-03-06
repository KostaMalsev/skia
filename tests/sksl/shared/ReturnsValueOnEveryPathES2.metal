#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
struct Uniforms {
    float4 colorGreen;
    float4 colorRed;
    float unknownInput;
};
struct Inputs {
};
struct Outputs {
    float4 sk_FragColor [[color(0)]];
};



bool for_inside_body() {
    for (int x = 0;x <= 10; ++x) {
        return true;
    }
}
bool after_for_body() {
    for (int x = 0;x <= 10; ++x) {
    }
    return true;
}
bool for_with_double_sided_conditional_return(Uniforms _uniforms) {
    for (int x = 0;x <= 10; ++x) {
        if (_uniforms.unknownInput == 1.0) return true; else return true;
    }
}
bool if_else_chain(Uniforms _uniforms) {
    if (_uniforms.unknownInput == 1.0) return true; else if (_uniforms.unknownInput == 2.0) return false; else if (_uniforms.unknownInput == 3.0) return true; else if (_uniforms.unknownInput == 4.0) return false; else return true;
}
fragment Outputs fragmentMain(Inputs _in [[stage_in]], constant Uniforms& _uniforms [[buffer(0)]], bool _frontFacing [[front_facing]], float4 _fragCoord [[position]]) {
    Outputs _out;
    (void)_out;
    bool _0_return_on_both_sides;
    if (_uniforms.unknownInput == 1.0) _0_return_on_both_sides = true; else _0_return_on_both_sides = true;
    _out.sk_FragColor = (((_0_return_on_both_sides && for_inside_body()) && after_for_body()) && for_with_double_sided_conditional_return(_uniforms)) && if_else_chain(_uniforms) ? _uniforms.colorGreen : _uniforms.colorRed;
    return _out;


}
