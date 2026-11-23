import LiveScripts.Shared
import LiveScripts.S_10f000cf3e158519cc4d73cacf1a5dc5d28488ba4d42b13eb102efab.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10f000cf3e158519cc4d73cacf1a5dc5d28488ba4d42b13eb102efab.script [ctx] 10000]
