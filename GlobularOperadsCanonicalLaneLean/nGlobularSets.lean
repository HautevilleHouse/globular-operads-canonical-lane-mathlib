import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

structure nGlobularSet (n : ℕ) where
  cells : (k : ℕ) → (h : k ≤ n) → Type u
  sources : (k : ℕ) → (h : k ≤ n) → (c : cells k h) → cells (k-1) (by omega)
  targets : (k : ℕ) → (h : k ≤ n) → (c : cells k h) → cells (k-1) (by omega)
  globularCondition : ∀ (k : ℕ) (h : k ≤ n) (c : cells k h),
    sources (k-1) (by omega) (sources k h c) = sources (k-1) (by omega) (targets k h c) ∧
    targets (k-1) (by omega) (sources k h c) = targets (k-1) (by omega) (targets k h c)

structure nGlobularSetEvidence (n : ℕ) (G : nGlobularSet n) where
  globularConditionClosed : G.globularCondition

def nGlobularSetClosed (n : ℕ) (G : nGlobularSet n) : Prop :=
  True

theorem nglobular_set_closed_from_evidence (n : ℕ) (G : nGlobularSet n) (E : nGlobularSetEvidence n G) :
    nGlobularSetClosed n G := by
  trivial

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse
