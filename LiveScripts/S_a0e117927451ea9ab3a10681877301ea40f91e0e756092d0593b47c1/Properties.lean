import LiveScripts.Shared
import LiveScripts.S_a0e117927451ea9ab3a10681877301ea40f91e0e756092d0593b47c1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a0e117927451ea9ab3a10681877301ea40f91e0e756092d0593b47c1.script [ctx] 10000]
