import LiveScripts.Shared
import LiveScripts.S_075e09eb0fa89e1dc34691b3c56a7f437e60ac5ea67b338f2e176e20.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_075e09eb0fa89e1dc34691b3c56a7f437e60ac5ea67b338f2e176e20.script [datum, redeemer, ctx] 10000]
