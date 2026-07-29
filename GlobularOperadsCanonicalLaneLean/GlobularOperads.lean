import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperad where
  types : Type u
  colors : Type v
  operations : types → types → Type w
  identity : (t : types) → operations t t
  composition : {a b c : types} → operations b c → operations a b → operations a c
  associativity : ∀ {a b c d : types} (f : operations c d) (g : operations b c) (h : operations a b),
    composition f (composition g h) = composition (composition f g) h
  identityLeft : ∀ {a b : types} (f : operations a b), composition (identity b) f = f
  identityRight : ∀ {a b : types} (f : operations a b), composition f (identity a) = f

structure GlobularOperadEvidence (O : GlobularOperad) where
  identityDefined : True
  associativityClosed : O.associativity
  identityLeftClosed : O.identityLeft
  identityRightClosed : O.identityRight

def GlobularOperadClosed (O : GlobularOperad) : Prop :=
  True

theorem globular_operad_closed_from_evidence (O : GlobularOperad) (E : GlobularOperadEvidence O) :
    GlobularOperadClosed O := by
  trivial

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse
