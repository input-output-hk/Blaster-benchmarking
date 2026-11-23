import LiveScripts.Shared
import LiveScripts.S_1f8529e2eb64a2853d72c3b211d9fe3a56eabdb823f91ea6244f1726.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1f8529e2eb64a2853d72c3b211d9fe3a56eabdb823f91ea6244f1726.script [ctx] 10000]
