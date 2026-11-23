import LiveScripts.Shared
import LiveScripts.S_78cbcbed01329ce9eaea91d235ac24a4c604f1f9835a6902a9cf78b3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78cbcbed01329ce9eaea91d235ac24a4c604f1f9835a6902a9cf78b3.script [ctx] 10000]
