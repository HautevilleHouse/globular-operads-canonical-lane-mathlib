import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperad where
  levels : ℕ → Type u
  operations : ∀ (k : ℕ), levels k → levels (k+1) → Type v
  composition : ∀ (k : ℕ) (f : levels k) (g : levels (k+1)), operations k f g → operations (k+1) f g
  identity : ∀ (k : ℕ) (x : levels k), operations k x x
  associativity : Prop
  identityLaw : Prop

structure GlobularOperadEvidence (O : GlobularOperad) where
  associativityClosed : O.associativity
  identityLawClosed : O.identityLaw

def GlobularOperadClosed (O : GlobularOperad) : Prop :=
  O.associativity ∧ O.identityLaw

theorem globular_operad_closed_from_evidence (O : GlobularOperad) (E : GlobularOperadEvidence O) : GlobularOperadClosed O := by
  exact And.intro E.associativityClosed E.identityLawClosed

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse