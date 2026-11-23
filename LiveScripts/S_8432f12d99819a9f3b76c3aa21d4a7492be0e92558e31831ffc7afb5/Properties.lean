import LiveScripts.Shared
import LiveScripts.S_8432f12d99819a9f3b76c3aa21d4a7492be0e92558e31831ffc7afb5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8432f12d99819a9f3b76c3aa21d4a7492be0e92558e31831ffc7afb5.script [ctx] 10000]
