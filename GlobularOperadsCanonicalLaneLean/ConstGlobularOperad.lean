import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure ConstGlobularOperad (C : Type u) where
  constant : C
  typesUnit : Unit
  identityUnit : Unit → Unit
  composition : Unit → Unit → Unit
  associativity : ∀ (f g h : Unit), composition f (composition g h) = composition (composition f g) h
  identityLeft : ∀ (f : Unit), composition (identityUnit ()) f = f
  identityRight : ∀ (f : Unit), composition f (identityUnit ()) = f

structure ConstGlobularOperadEvidence (C : Type u) (O : ConstGlobularOperad C) where
  associativityClosed : O.associativity
  identityLeftClosed : O.identityLeft
  identityRightClosed : O.identityRight

def ConstGlobularOperadClosed (C : Type u) (O : ConstGlobularOperad C) : Prop :=
  O.associativity ∧ O.identityLeft ∧ O.identityRight

theorem const_globular_operad_closed_from_evidence
  (C : Type u) (O : ConstGlobularOperad C) (E : ConstGlobularOperadEvidence C O) :
    ConstGlobularOperadClosed C O := by
  exact And.intro E.associativityClosed (And.intro E.identityLeftClosed E.identityRightClosed)

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse
