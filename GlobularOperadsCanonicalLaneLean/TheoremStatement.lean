import Mathlib

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularAdmittedObject where
  carrier : Type
  operadStructure : Prop
  coherenceCondition : Prop
  conclusion : coherenceCondition

def GlobularWitnessClosed (O : GlobularAdmittedObject) : Prop :=
  O.coherenceCondition

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse