import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularSet where
  objects : Type u
  morphisms : Type v
  source : morphisms → objects
  target : morphisms → objects
  identities : objects → morphisms
  sourceIdentity : ∀ x : objects, source (identities x) = x
  targetIdentity : ∀ x : objects, target (identities x) = x

structure GlobularSetEvidence (G : GlobularSet) where
  sourceIdentityClosed : ∀ x : G.objects, G.source (G.identities x) = x
  targetIdentityClosed : ∀ x : G.objects, G.target (G.identities x) = x

def GlobularSetClosed (G : GlobularSet) : Prop :=
  ∀ x : G.objects, G.source (G.identities x) = x ∧ G.target (G.identities x) = x

theorem globular_set_closed_from_evidence (G : GlobularSet)
    (E : GlobularSetEvidence G) : GlobularSetClosed G := by
  intro x
  exact And.intro (E.sourceIdentityClosed x) (E.targetIdentityClosed x)

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse