import LiveScripts.Shared
import LiveScripts.S_9dca290641bdc031325cfda1861986f9ef1d14f27a7f020059fa749f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9dca290641bdc031325cfda1861986f9ef1d14f27a7f020059fa749f.script [ctx] 10000]
