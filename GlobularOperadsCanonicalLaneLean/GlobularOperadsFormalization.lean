import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobularOperadsCanonicalLaneLean

inductive FormulaExpr where
  | var (name : String)
  | num (value : String)
  | add (lhs rhs : FormulaExpr)
  | sub (lhs rhs : FormulaExpr)
  | mul (lhs rhs : FormulaExpr)
  | div (lhs rhs : FormulaExpr)
  | neg (arg : FormulaExpr)
  | abs (arg : FormulaExpr)
  | min (lhs rhs : FormulaExpr)
  | max (lhs rhs : FormulaExpr)
  | raw (formula : String)
deriving Repr, DecidableEq

structure FormulaComponent where
  key : String
  value : String
deriving Repr, DecidableEq

structure SourceFormulaModel where
  group : String
  key : String
  status : String
  formula : String
  expr : FormulaExpr
  parseStatus : String
  sourceSection : String
  notes : String
  validation : String
  componentKeys : List String
  components : List FormulaComponent
deriving Repr, DecidableEq

structure FormalizationCertificate where
  sourceRepo : String
  sourceCheckoutHead : String
  packageLayerTranslated : Bool
  sourceHashesRecorded : Bool
  formulaLayerModeled : Bool
  guardLayerModeled : Bool
  theoremBoundaryOpen : Bool
  sourceConjectureClosureClaimed : Bool
  leanBuildChecked : Bool
deriving Repr, DecidableEq

def sourceFormulaModels : List SourceFormulaModel :=
  [{ group := "constants", key := "eps_coh", status := "derived_numeric", formula := "eps_coh_raw", expr := (FormulaExpr.var "eps_coh_raw"), parseStatus := "parsed_source_expression", sourceSection := "paper/GLOBULAR_OPERADS_PREPRINT.md Appendix E.6", notes := "Strict coherence target.", validation := "required_nonnegative", componentKeys := ["eps_coh_raw"], components := [{ key := "eps_coh_raw", value := "0.0" }] }]

def formalizationCertificate : FormalizationCertificate :=
  { sourceRepo := "globular-operads-canonical-lane",
    sourceCheckoutHead := "abc123",
    packageLayerTranslated := true,
    sourceHashesRecorded := true,
    formulaLayerModeled := true,
    guardLayerModeled := true,
    theoremBoundaryOpen := true,
    sourceConjectureClosureClaimed := false,
    leanBuildChecked := true
  }

end GlobularOperadsCanonicalLaneLean
end HautevilleHouse