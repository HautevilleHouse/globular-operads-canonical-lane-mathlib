import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

def ConstrainedGlobularOperadClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_globular_operad_endgame (A : AdmissibleClass) :
    ConstrainedGlobularOperadClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse