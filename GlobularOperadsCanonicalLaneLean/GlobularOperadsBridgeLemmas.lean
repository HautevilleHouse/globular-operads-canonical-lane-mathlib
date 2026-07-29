import GlobularOperadsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let G : GlobularAdmittedObject := A.object
  G.strictUnitality

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion.left

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse