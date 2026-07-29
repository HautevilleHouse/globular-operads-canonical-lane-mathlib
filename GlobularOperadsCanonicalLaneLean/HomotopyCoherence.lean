import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GlobularOperadsCanonicalLaneLean.GlobularOperadStructure

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure HomotopyCoherencePackage {O : GlobularOperad} (E : GlobularOperadEvidence O) where
  weakEquivalence : Prop
  coherenceTheorem : Prop
  homotopyRelation : Prop

structure HomotopyCoherenceEvidence {O : GlobularOperad} {E : GlobularOperadEvidence O} (H : HomotopyCoherencePackage E) where
  weakEquivalenceClosed : H.weakEquivalence
  coherenceTheoremClosed : H.coherenceTheorem
  homotopyRelationClosed : H.homotopyRelation

def HomotopyCoherenceClosed {O : GlobularOperad} {E : GlobularOperadEvidence O} (H : HomotopyCoherencePackage E) : Prop :=
  H.weakEquivalence ∧ H.coherenceTheorem ∧ H.homotopyRelation

theorem homotopy_coherence_closed_from_evidence {O : GlobularOperad} {E : GlobularOperadEvidence O} (H : HomotopyCoherencePackage E) (Ev : HomotopyCoherenceEvidence H) : HomotopyCoherenceClosed H := by
  exact And.intro Ev.weakEquivalenceClosed (And.intro Ev.coherenceTheoremClosed Ev.homotopyRelationClosed)

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse