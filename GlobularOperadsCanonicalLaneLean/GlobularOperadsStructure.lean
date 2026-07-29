import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperad where
  objects : Type u
  morphisms : Type v
  source : morphisms → objects
  target : morphisms → objects
  identity : objects → morphisms
  composition : (f g : morphisms) → target f = source g → morphisms
  associativity : Prop
  identityLaw : Prop

structure GlobularOperadEvidence (G : GlobularOperad) where
  associativityClosed : G.associativity
  identityLawClosed : G.identityLaw

def GlobularOperadClosed (G : GlobularOperad) : Prop :=
  G.associativity ∧ G.identityLaw

theorem globular_operad_closed_from_evidence (G : GlobularOperad)
    (E : GlobularOperadEvidence G) : GlobularOperadClosed G := by
  exact And.intro E.associativityClosed E.identityLawClosed

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse