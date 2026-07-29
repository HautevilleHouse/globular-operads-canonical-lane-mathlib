import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure GlobularOperadSpace where
  nCells : ℕ → Type
  source : Π (k : ℕ), nCells (k+1) → nCells k
  target : Π (k : ℕ), nCells (k+1) → nCells k
  identities : Π (k : ℕ), nCells k → nCells (k+1)
  composition : Π (k : ℕ), nCells (k+1) → nCells (k+1) → nCells (k+1)
  globularity : Π (k : ℕ) (f : nCells (k+1)), source k (target (k+1) f) = target k (source (k+1) f)

structure GlobularAdmittedObject where
  space : GlobularOperadSpace
  strictUnitality : Prop
  strictAssociativity : Prop
  conclusion : strictUnitality ∧ strictAssociativity

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse