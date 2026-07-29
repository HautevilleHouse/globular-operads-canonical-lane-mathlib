import GlobularOperadsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

def ConstrainedGlobularOperadsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_globular_operads_endgame (A : AdmissibleClass) : ConstrainedGlobularOperadsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse