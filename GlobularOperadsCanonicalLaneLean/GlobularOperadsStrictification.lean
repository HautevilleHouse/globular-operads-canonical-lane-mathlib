import GlobularOperadsCanonicalLaneLean.GlobularOperadsAdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure StrictificationPackage (G : GlobularOperadSpace) where
  alphaDefined : Prop
  rhoDefined : Prop
  strictificationMap : ∀ k, G.nCells k → G.nCells k
  alphaNatural : Prop
  rhoNatural : Prop
  strictUnitalityMap : Prop

structure StrictificationEvidence (G : GlobularOperadSpace) (S : StrictificationPackage G) where
  alphaNaturalClosed : S.alphaNatural
  rhoNaturalClosed : S.rhoNatural
  strictUnitalityMapClosed : S.strictUnitalityMap

def StrictificationClosed (G : GlobularOperadSpace) (S : StrictificationPackage G) : Prop :=
  S.alphaNatural ∧ S.rhoNatural ∧ S.strictUnitalityMap

theorem strictification_closed_from_evidence (G : GlobularOperadSpace)(S : StrictificationPackage G)(E : StrictificationEvidence G S) : StrictificationClosed G S := by
  exact And.intro E.alphaNaturalClosed (And.intro E.rhoNaturalClosed E.strictUnitalityMapClosed)

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse