import LiveScripts.Shared
import LiveScripts.S_263d5615bf97333cc5b794d0361c303247d2580cc50e5c0c3fe1760a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_263d5615bf97333cc5b794d0361c303247d2580cc50e5c0c3fe1760a.script [ctx] 10000]
