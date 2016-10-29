#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Hotstring C R

; Small Greek letters
::;alpha::α
::;beta::β
::;gamma::γ
::;delta::δ
::;epsilon::ϵ
::;varepsilon::ε
::;zeta::ζ
::;eta::η
::;theta::θ
::;iota::ι
::;kappa::κ
::;lambda::λ
::;lamda::λ
::;mu::μ
::;nu::ν
::;xi::ξ
::;omicron::ο
::;pi::π
::;rho::ρ
::;sigma::σ
::;tau::τ
::;upsilon::υ
::;phi::ϕ
::;chi::χ
::;psi::ψ
::;omega::ω

; Capital Greek letters
::;Alpha::Α
::;Beta::Β
::;Gamma::Γ
::;Delta::Δ
::;Epsilon::Ε
::;Zeta::Ζ
::;Eta::Η
::;Theta::Θ
::;Iota::Ι
::;Kappa::Κ
::;Lambda::Λ
::;Lamda::Λ
::;Mu::Μ
::;Nu::Ν
::;Xi::Ξ
::;Omicron::Ο
::;Pi::Π
::;Rho::Ρ
::;Sigma::Σ
::;Tau::Τ
::;Upsilon::Υ
::;Phi::Φ
::;Chi::Χ
::;Psi::Ψ
::;Omega::Ω

; Vectors - Lowercase Roman letters
::;avec::a⃗
::;bvec::b⃗
::;cvec::c⃗
::;dvec::d⃗
::;evec::e⃗
::;fvec::f⃗
::;gvec::g⃗
::;hvec::h⃗
::;ivec::i⃗
::;jvec::j⃗
::;kvec::k⃗
::;lvec::l⃗
::;mvec::m⃗
::;nvec::n⃗
::;ovec::o⃗
::;pvec::p⃗
::;qvec::q⃗
::;rvec::r⃗
::;svec::s⃗
::;tvec::t⃗
::;uvec::u⃗
::;vvec::v⃗
::;wvec::w⃗
::;xvec::x⃗
::;yvec::y⃗
::;zvec::z⃗

; Vectors - Uppercase Roman letters
::;Avec::A⃗
::;Bvec::B⃗
::;Cvec::C⃗
::;Dvec::D⃗
::;Evec::E⃗
::;Fvec::F⃗
::;Gvec::G⃗
::;Hvec::H⃗
::;Ivec::I⃗
::;Jvec::J⃗
::;Kvec::K⃗
::;Lvec::L⃗
::;Mvec::M⃗
::;Nvec::N⃗
::;Ovec::O⃗
::;Pvec::P⃗
::;Qvec::Q⃗
::;Rvec::R⃗
::;Svec::S⃗
::;Tvec::T⃗
::;Uvec::U⃗
::;Vvec::V⃗
::;Wvec::W⃗
::;Xvec::X⃗
::;Yvec::Y⃗
::;Zvec::Z⃗

; Vectors - Lowercase Greek letters
::;alphavec::α⃗
::;betavec::β⃗
::;gammavec::γ⃗
::;deltavec::δ⃗
::;epsilonvec::ϵ⃗
::;varepsilonvec::ε⃗
::;zetavec::ζ⃗
::;etavec::η⃗
::;thetavec::θ⃗
::;iotavec::ι⃗
::;kappavec::κ⃗
::;lambdavec::λ⃗
::;lamdavec::λ⃗
::;muvec::μ⃗
::;nuvec::ν⃗
::;xivec::ξ⃗
::;omicronvec::ο⃗
::;pivec::π⃗
::;rhovec::ρ⃗
::;sigmavec::σ⃗
::;tauvec::τ⃗
::;upsilonvec::υ⃗
::;phivec::ϕ⃗
::;chivec::χ⃗
::;psivec::ψ⃗
::;omegavec::ω⃗

; Vectors - Uppercase Greek letters
::;Alphavec::Α⃗
::;Betavec::Β⃗
::;Gammavec::Γ⃗
::;Deltavec::Δ⃗
::;Epsilonvec::Ε⃗
::;Zetavec::Ζ⃗
::;Etavec::Η⃗
::;Thetavec::Θ⃗
::;Iotavec::Ι⃗
::;Kappavec::Κ⃗
::;Lambdavec::Λ⃗
::;Lamdavec::Λ⃗
::;Muvec::Μ⃗
::;Nuvec::Ν⃗
::;Xivec::Ξ⃗
::;Omicronvec::Ο⃗
::;Pivec::Π⃗
::;Rhovec::Ρ⃗
::;Sigmavec::Σ⃗
::;Tauvec::Τ⃗
::;Upsilonvec::Υ⃗
::;Phivec::Φ⃗
::;Chivec::Χ⃗
::;Psivec::Ψ⃗
::;Omegavec::Ω⃗

; Dot Derivatives - Lowercase Roman letters
::;adot::ȧ
::;bdot::ḃ
::;cdot::ċ
::;ddot::ḋ
::;edot::ė
::;fdot::ḟ
::;gdot::ġ
::;hdot::ḣ
::;idot::i̇
::;jdot::j̇
::;kdot::k̇
::;ldot::l̇
::;mdot::ṁ
::;ndot::ṅ
::;odot::ȯ
::;pdot::ṗ
::;qdot::q̇
::;rdot::ṙ
::;sdot::ṡ
::;tdot::ṫ
::;udot::u̇
::;vdot::v̇
::;wdot::ẇ
::;xdot::ẋ
::;ydot::ẏ
::;zdot::ż

; Dot Derivatives - Uppercase Roman letters
::;Adot::Ȧ
::;Bdot::Ḃ
::;Cdot::Ċ
::;Ddot::Ḋ
::;Edot::Ė
::;Fdot::Ḟ
::;Gdot::Ġ
::;Hdot::Ḣ
::;Idot::İ
::;Jdot::J̇
::;Kdot::K̇
::;Ldot::L̇
::;Mdot::Ṁ
::;Ndot::Ṅ
::;Odot::Ȯ
::;Pdot::Ṗ
::;Qdot::Q̇
::;Rdot::Ṙ
::;Sdot::Ṡ
::;Tdot::Ṫ
::;Udot::U̇
::;Vdot::V̇
::;Wdot::Ẇ
::;Xdot::Ẋ
::;Ydot::Ẏ
::;Zdot::Ż

; Dot Derivatives - Lowercase Greek letters
::;alphadot::α̇
::;betadot::β̇
::;gammadot::γ̇
::;deltadot::δ̇
::;epsilondot::ϵ̇
::;varepsilondot::ε̇
::;zetadot::ζ̇
::;etadot::η̇
::;thetadot::θ̇
::;iotadot::ι̇
::;kappadot::κ̇
::;lambdadot::λ̇
::;lamdadot::λ̇
::;mudot::μ̇
::;nudot::ν̇
::;xidot::ξ̇
::;omicrondot::ο̇
::;pidot::π̇
::;rhodot::ρ̇
::;sigmadot::σ̇
::;taudot::τ̇
::;upsilondot::υ̇
::;phidot::ϕ̇
::;chidot::χ̇
::;psidot::ψ̇
::;omegadot::ω̇

; Dot Derivatives - Uppercase Greek letters
::;Alphadot::Α̇
::;Betadot::Β̇
::;Gammadot::Γ̇
::;Deltadot::Δ̇
::;Epsilondot::Ε̇
::;Zetadot::Ζ̇
::;Etadot::Η̇
::;Thetadot::Θ̇
::;Iotadot::Ι̇
::;Kappadot::Κ̇
::;Lambdadot::Λ̇
::;Lamdadot::Λ̇
::;Mudot::Μ̇
::;Nudot::Ν̇
::;Xidot::Ξ̇
::;Omicrondot::Ο̇
::;Pidot::Π̇
::;Rhodot::Ρ̇
::;Sigmadot::Σ̇
::;Taudot::Τ̇
::;Upsilondot::Υ̇
::;Phidot::Φ̇
::;Chidot::Χ̇
::;Psidot::Ψ̇
::;Omegadot::Ω̇

; Double-Dot Derivatives - Lowercase Roman letters
::;addot::ä
::;bddot::b̈
::;cddot::c̈
::;dddot::d̈
::;eddot::ë
::;fddot::f̈
::;gddot::g̈
::;hddot::ḧ
::;iddot::ï
::;jddot::j̈
::;kddot::k̈
::;lddot::l̈
::;mddot::m̈
::;nddot::n̈
::;oddot::ö
::;pddot::p̈
::;qddot::q̈
::;rddot::r̈
::;sddot::s̈
::;tddot::ẗ
::;uddot::ü
::;vddot::v̈
::;wddot::ẅ
::;xddot::ẍ
::;yddot::ÿ
::;zddot::z̈

; ddot Derivatives - Uppercase Roman letters
::;Addot::Ä
::;Bddot::B̈
::;Cddot::C̈
::;Dddot::D̈
::;Eddot::Ë
::;Fddot::F̈
::;Gddot::G̈
::;Hddot::Ḧ
::;Iddot::Ï
::;Jddot::J̈
::;Kddot::K̈
::;Lddot::L̈
::;Mddot::M̈
::;Nddot::N̈
::;Oddot::Ö
::;Pddot::P̈
::;Qddot::Q̈
::;Rddot::R̈
::;Sddot::S̈
::;Tddot::T̈
::;Uddot::Ü
::;Vddot::V̈
::;Wddot::Ẅ
::;Xddot::Ẍ
::;Yddot::Ÿ
::;Zddot::Z̈

; Double-dot Derivatives - Lowercase Greek letters
::;alphaddot::α̈
::;betaddot::β̈
::;gammaddot::γ̈
::;deltaddot::δ̈
::;epsilonddot::ϵ̈
::;varepsilonddot::ε̈
::;zetaddot::ζ̈
::;etaddot::η̈
::;thetaddot::θ̈
::;iotaddot::ϊ
::;kappaddot::κ̈
::;lambdaddot::λ̈
::;lamdaddot::λ̈
::;muddot::μ̈
::;nuddot::ν̈
::;xiddot::ξ̈
::;omicronddot::ο̈
::;piddot::π̈
::;rhoddot::ρ̈
::;sigmaddot::σ̈
::;tauddot::τ̈
::;upsilonddot::ϋ
::;phiddot::ϕ̈
::;chiddot::χ̈
::;psiddot::ψ̈
::;omegaddot::ω̈

; Double-dot Derivatives - Uppercase Greek letters
::;Alphaddot::Α̈
::;Betaddot::Β̈
::;Gammaddot::Γ̈
::;Deltaddot::Δ̈
::;Epsilonddot::Ε̈
::;Zetaddot::Ζ̈
::;Etaddot::Η̈
::;Thetaddot::Θ̈
::;Iotaddot::Ϊ
::;Kappaddot::Κ̈
::;Lambdaddot::Λ̈
::;Lamdaddot::Λ̈
::;Muddot::Μ̈
::;Nuddot::Ν̈
::;Xiddot::Ξ̈
::;Omicronddot::Ο̈
::;Piddot::Π̈
::;Rhoddot::Ρ̈
::;Sigmaddot::Σ̈
::;Tauddot::Τ̈
::;Upsilonddot::Ϋ
::;Phiddot::Φ̈
::;Chiddot::Χ̈
::;Psiddot::Ψ̈
::;Omegaddot::Ω̈



; Superscripts - Roman numerals
::;^0::⁰
::;^1::¹
::;^2::²
::;^3::³
::;^4::⁴
::;^5::⁵
::;^6::⁶
::;^7::⁷
::;^8::⁸
::;^9::⁹

; Superscripts - Uppercase Roman Letters
::;^A::ᴬ
::;^B::ᴮ
::;^D::ᴰ
::;^E::ᴱ
::;^G::ᴳ
::;^H::ᴴ
::;^I::ᴵ
::;^J::ᴶ
::;^K::ᴷ
::;^L::ᴸ
::;^M::ᴹ
::;^N::ᴺ
::;^O::ᴼ
::;^P::ᴾ
::;^R::ᴿ
::;^T::ᵀ
::;^U::ᵁ
::;^V::ⱽ
::;^W::ᵂ

; Superscripts - Lowercase Roman Letters
::;^a::ᵃ
::;^b::ᵇ
::;^c::ᶜ
::;^d::ᵈ
::;^e::ᵉ
::;^f::ᶠ
::;^g::ᵍ
::;^h::ʰ
::;^i::ⁱ
::;^j::ʲ
::;^k::ᵏ
::;^l::ˡ
::;^m::ᵐ
::;^n::ⁿ
::;^o::ᵒ
::;^p::ᵖ
::;^r::ʳ
::;^s::ˢ
::;^t::ᵗ
::;^u::ᵘ
::;^v::ᵛ
::;^w::ʷ
::;^x::ˣ
::;^y::ʸ
::;^z::ᶻ

; Superscripts - Lowercase Greek letters
::;^beta::ᵝ
::;^gamma::ᵞ
::;^delta::ᵟ
::;^theta::ᶿ
::;^iota::ᶥ
::;^phi::ᵠ
::;^chi::ᵡ

; Subscripts - Roman Numerals
::;_0::₀
::;_1::₁
::;_2::₂
::;_3::₃
::;_4::₄
::;_5::₅
::;_6::₆
::;_7::₇
::;_8::₈
::;_9::₉

; Subscripts - Lowercase Roman letters
::;_a::ₐ
::;_e::ₑ
::;_h::ₕ
::;_i::ᵢ
::;_j::ⱼ
::;_k::ₖ
::;_l::ₗ
::;_m::ₘ
::;_n::ₙ
::;_o::ₒ
::;_p::ₚ
::;_r::ᵣ
::;_s::ₛ
::;_t::ₜ
::;_u::ᵤ
::;_v::ᵥ
::;_x::ₓ

; Subscripts - lowercase Greek letters
::;_beta::ᵦ
::;_gamma::ᵧ
::;_rho::ᵨ
::;_phi::ᵩ
::;_chi::ᵪ





::;rsun::R☉
::;reSun::R☉
::;msun::m☉
::;musun::μ☉
::;alphasun::α☉
::;deltasun::δ☉

::;rearth::R⨁
::;reEarth::R⨁
::;mearth::m⨁
::;muearth::μ⨁
::;omegaearth::ω⨁

::;rmoon::R☾
::;reMoon::R☾
::;mumoon::μ☾
::;alphamoon::α☾
::;deltamoon::δ☾

; Celestial bodies
::;sun::☉
::;mercury::☿
::;venus::♀
::;earth::⨁
::;moon::☾
::;mars::♂
::;jupiter::♃
::;saturn::♄
::;uranus::♅
::;neptune::♆
::;pluto::♇

::;epsilonbar::ϵ̄
::;varepsilonbar::ε̄
::;omegatilde::ω̃


::;2pi::2π
::;micro::μ
::;check::✓

::;lat::ϕ
::;lon::λ

::;dot::̇
::;ddot::̈
::;vec::⃗
::;bar::̄
::;tilde::̃


::;deg::°
::;degree::°
::;pm::±
::;neq::≠
::;approx::≈
::;napprox::≉
::;leq::≤
::;geq::≥
::;cross::×
::;mult::×
::;div::÷
::;cbrt::∛
::;sqrt::√
::;prime::′
::;pprime::″
::;ppprime::‴
::;pppprime::⁗

::;leftarrow::←
::;rightarrow::→
::;leftrightarrow::↔
::;uparrow::↑
::;downarrow::↓
::;updownarrow::↕

::;larr::←
::;rarr::→
::;lrarr::↔
::;uarr::↑
::;darr::↓
::;udarr::↕

return