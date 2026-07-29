import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure JoyalOperad extends GlobularOperad where
  joyalCondition : Prop
  joyalConditionClosed : joyalCondition

def isJoyalOperad (O : GlobularOperad) : Prop :=
  O.associativity ∧ O.identityLaw ∧ O.globularCondition

theorem joyal_operad_closed (O : JoyalOperad) : isJoyalOperad O := by
  exact And.intro (by exact O.associativity) (And.intro (by exact O.identityLaw) (by exact O.globularCondition))

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse