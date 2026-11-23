import LiveScripts.Shared
import LiveScripts.S_376b60b514883cd39fb64602d03643a8eef1287d2e4750c3b7f82aff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_376b60b514883cd39fb64602d03643a8eef1287d2e4750c3b7f82aff.script [ctx] 10000]
