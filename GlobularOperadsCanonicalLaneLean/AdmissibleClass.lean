import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperadObject where
  object : Type u
  sources : object → List object
  targets : object → object
  composition : object → object → object
  identities : object → object
  associativity : Prop
  unitLaws : Prop

def GlobularOperadWitnessClosed (O : GlobularOperadObject) : Prop :=
  O.associativity ∧ O.unitLaws

structure AdmissibleClass where
  object : GlobularOperadObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GlobularOperadWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse