import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GlobularOperadWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.associativity

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse