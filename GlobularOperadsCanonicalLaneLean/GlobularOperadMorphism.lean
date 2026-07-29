import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperadMorphism (G H : GlobularOperad) where
  objectMap : G.objects → H.objects
  morphismMap : G.morphisms → H.morphisms
  sourcePreserved : ∀ f : G.morphisms, H.source (morphismMap f) = objectMap (G.source f)
  targetPreserved : ∀ f : G.morphisms, H.target (morphismMap f) = objectMap (G.target f)
  identityPreserved : ∀ x : G.objects, morphismMap (G.identity x) = H.identity (objectMap x)
  compositionPreserved : (f g : G.morphisms) → (h : G.target f = G.source g) →
    morphismMap (G.composition f g h) = H.composition (morphismMap f) (morphismMap g) (by
      rw [sourcePreserved f, targetPreserved g, h])

structure GlobularOperadMorphismEvidence {G H : GlobularOperad}
    (F : GlobularOperadMorphism G H) where
  sourcePreservedClosed : ∀ f : G.morphisms, H.source (F.morphismMap f) = F.objectMap (G.source f)
  targetPreservedClosed : ∀ f : G.morphisms, H.target (F.morphismMap f) = F.objectMap (G.target f)
  identityPreservedClosed : ∀ x : G.objects, F.morphismMap (G.identity x) = H.identity (F.objectMap x)
  compositionPreservedClosed : ∀ (f g : G.morphisms) (h : G.target f = G.source g),
    F.morphismMap (G.composition f g h) = H.composition (F.morphismMap f) (F.morphismMap g) (by
      rw [sourcePreservedClosed f, targetPreservedClosed g, h])

theorem globular_operad_morphism_evidence_to_morphism {G H : GlobularOperad}
    (F : GlobularOperadMorphism G H) (E : GlobularOperadMorphismEvidence F) : F.sourcePreserved := E.sourcePreservedClosed

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse