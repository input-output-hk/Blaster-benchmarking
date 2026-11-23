import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils
import PlutusCore.UPLC.PlutusScript

/-!
Common execution harness for imported on-chain scripts.

`candidateContext` is deliberately a structural precondition, not a proof that
the data is a ledger-valid ScriptContext. A solver model must be replayed and
checked more strongly before the dashboard counts it as verified.
-/

namespace LiveScripts

open PlutusCore.Data (Data)
open PlutusCore.UPLC.Term (Program Term Const)
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)

def candidateContext : Data → Prop
  | .Constr tag fields => tag = 0 ∧ 2 ≤ fields.length
  | _ => False

def admissibleOne (args : List Data) : Prop :=
  ∃ context, args = [context] ∧ candidateContext context

def admissibleTwo (args : List Data) : Prop :=
  ∃ redeemer context, args = [redeemer, context] ∧ candidateContext context

def admissibleThree (args : List Data) : Prop :=
  ∃ datum redeemer context,
    args = [datum, redeemer, context] ∧ candidateContext context

def argsToTerms (args : List Data) : List Term :=
  args.map (fun d => Term.Const (Const.Data d))

def execute (script : Program) (args : List Data) (fuel : Nat) :=
  cekExecuteProgram script (argsToTerms args) fuel

def succeeds (script : Program) (args : List Data) (fuel : Nat) : Prop :=
  PlutusCore.UPLC.Utils.isSuccessful (execute script args fuel)

end LiveScripts
