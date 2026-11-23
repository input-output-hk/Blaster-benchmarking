import LiveScripts.Shared
import LiveScripts.S_a5643b4a22a192d7691d05baf4a9bbb8acdbb5daa60be1f333e128f1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a5643b4a22a192d7691d05baf4a9bbb8acdbb5daa60be1f333e128f1.script [redeemer, ctx] 10000]
