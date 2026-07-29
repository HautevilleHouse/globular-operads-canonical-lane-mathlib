import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperadColaxMorphism (G H : GlobularOperad) where
  objectMap : G.objects → H.objects
  morphismMap : G.morphisms → H.morphisms
  sourcePreserved : ∀ f : G.morphisms, H.source (morphismMap f) = objectMap (G.source f)
  targetPreserved : ∀ f : G.morphisms, H.target (morphismMap f) = objectMap (G.target f)
  laxStructure : (x : G.objects) → H.morphisms
  laxSource : ∀ x : G.objects, H.source (laxStructure x) = objectMap x
  laxTarget : ∀ x : G.objects, H.target (laxStructure x) = objectMap x
  coherence : Prop

structure GlobularOperadColaxEvidence {G H : GlobularOperad}
    (F : GlobularOperadColaxMorphism G H) where
  sourcePreservedClosed : ∀ f : G.morphisms, H.source (F.morphismMap f) = F.objectMap (G.source f)
  targetPreservedClosed : ∀ f : G.morphisms, H.target (F.morphismMap f) = F.objectMap (G.target f)
  laxSourceClosed : ∀ x : G.objects, H.source (F.laxStructure x) = F.objectMap x
  laxTargetClosed : ∀ x : G.objects, H.target (F.laxStructure x) = F.objectMap x
  coherenceClosed : F.coherence

def GlobularOperadColaxClosed {G H : GlobularOperad}
    (F : GlobularOperadColaxMorphism G H) : Prop :=
  (∀ f : G.morphisms, H.source (F.morphismMap f) = F.objectMap (G.source f)) ∧
  (∀ f : G.morphisms, H.target (F.morphismMap f) = F.objectMap (G.target f)) ∧
  (∀ x : G.objects, H.source (F.laxStructure x) = F.objectMap x) ∧
  (∀ x : G.objects, H.target (F.laxStructure x) = F.objectMap x) ∧
  F.coherence

theorem globular_operad_colax_closed_from_evidence {G H : GlobularOperad}
    (F : GlobularOperadColaxMorphism G H) (E : GlobularOperadColaxEvidence F) :
    GlobularOperadColaxClosed F := by
  exact And.intro E.sourcePreservedClosed (And.intro E.targetPreservedClosed
    (And.intro E.laxSourceClosed (And.intro E.laxTargetClosed E.coherenceClosed)))

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse