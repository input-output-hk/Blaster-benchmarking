import LiveScripts.Shared
import LiveScripts.S_0060fe78c784b0c405cdd9d55a992f1e3630c90700441c952cf9302f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0060fe78c784b0c405cdd9d55a992f1e3630c90700441c952cf9302f.script [ctx] 10000]
