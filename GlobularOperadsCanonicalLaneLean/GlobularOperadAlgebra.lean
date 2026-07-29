import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperadAlgebra (G : GlobularOperad) where
  algebraObject : Type u
  interpretation : G.objects → algebraObject
  action : (f : G.morphisms) → (G.source f = G.target f) → algebraObject → algebraObject
  actionIdentity : ∀ x : G.objects, action (G.identity x) rfl = id
  actionComposition : ∀ (f g : G.morphisms) (h : G.target f = G.source g) (a : algebraObject),
    action (G.composition f g h) (by
      subst h
      rfl) a = action g (by rfl) (action f (by rfl) a)

structure GlobularOperadAlgebraEvidence {G : GlobularOperad}
    (A : GlobularOperadAlgebra G) where
  actionIdentityClosed : ∀ x : G.objects, A.action (G.identity x) rfl = id
  actionCompositionClosed : ∀ (f g : G.morphisms) (h : G.target f = G.source g) (a : A.algebraObject),
    A.action (G.composition f g h) (by
      subst h
      rfl) a = A.action g (by rfl) (A.action f (by rfl) a)

def GlobularOperadAlgebraClosed {G : GlobularOperad}
    (A : GlobularOperadAlgebra G) : Prop :=
  (∀ x : G.objects, A.action (G.identity x) rfl = id) ∧
  (∀ (f g : G.morphisms) (h : G.target f = G.source g) (a : A.algebraObject),
    A.action (G.composition f g h) (by
      subst h
      rfl) a = A.action g (by rfl) (A.action f (by rfl) a))

theorem globular_operad_algebra_closed_from_evidence {G : GlobularOperad}
    (A : GlobularOperadAlgebra G) (E : GlobularOperadAlgebraEvidence A) :
    GlobularOperadAlgebraClosed A := by
  exact And.intro E.actionIdentityClosed E.actionCompositionClosed

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse