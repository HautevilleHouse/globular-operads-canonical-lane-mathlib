import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GlobularOperadsCanonicalLaneLean.GlobularOperadStructure

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure OperadicHomologyPackage {O : GlobularOperad} (E : GlobularOperadEvidence O) where
  chainComplex : Type u
  homologyGroups : ℕ → Type v
  differential : ℕ → chainComplex → chainComplex
  differentialSquared : ∀ (n : ℕ) (x : chainComplex), differential n (differential n x) = differential n x
  homologyComputed : Prop

structure OperadicHomologyEvidence {O : GlobularOperad} {E : GlobularOperadEvidence O} (H : OperadicHomologyPackage E) where
  differentialSquaredClosed : ∀ (n : ℕ) (x : H.chainComplex), H.differential n (H.differential n x) = H.differential n x
  homologyComputedClosed : H.homologyComputed

def OperadicHomologyClosed {O : GlobularOperad} {E : GlobularOperadEvidence O} (H : OperadicHomologyPackage E) : Prop :=
  (∀ (n : ℕ) (x : H.chainComplex), H.differential n (H.differential n x) = H.differential n x) ∧ H.homologyComputed

theorem operadic_homology_closed_from_evidence {O : GlobularOperad} {E : GlobularOperadEvidence O} (H : OperadicHomologyPackage E) (Ev : OperadicHomologyEvidence H) : OperadicHomologyClosed H := by
  exact And.intro Ev.differentialSquaredClosed Ev.homologyComputedClosed

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse