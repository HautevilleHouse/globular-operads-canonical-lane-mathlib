import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GlobularOperadClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse