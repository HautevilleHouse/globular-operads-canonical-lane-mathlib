import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperadHomomorphism (O1 O2 : GlobularOperad) where
  typesMap : O1.types → O2.types
  opsMap : (a b : O1.types) → O1.operations a b → O2.operations (typesMap a) (typesMap b)
  preservesIdentity : ∀ (t : O1.types),
    opsMap t t (O1.identity t) = O2.identity (typesMap t)
  preservesComposition : ∀ (a b c : O1.types) (f : O1.operations b c) (g : O1.operations a b),
    opsMap a c (O1.composition f g) = O2.composition (opsMap b c f) (opsMap a b g)

structure GlobularOperadHomomorphismEvidence (O1 O2 : GlobularOperad) (H : GlobularOperadHomomorphism O1 O2) where
  preservesIdentityClosed : H.preservesIdentity
  preservesCompositionClosed : H.preservesComposition

def GlobularOperadHomomorphismClosed (O1 O2 : GlobularOperad) (H : GlobularOperadHomomorphism O1 O2) : Prop :=
  H.preservesIdentity ∧ H.preservesComposition

theorem globular_operad_homomorphism_closed_from_evidence
  (O1 O2 : GlobularOperad) (H : GlobularOperadHomomorphism O1 O2)
  (E : GlobularOperadHomomorphismEvidence O1 O2 H) :
    GlobularOperadHomomorphismClosed O1 O2 H := by
  exact And.intro E.preservesIdentityClosed E.preservesCompositionClosed

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse
