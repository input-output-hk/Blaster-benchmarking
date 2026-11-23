import LiveScripts.Shared
import LiveScripts.S_50a65666e492e14fbfd080bd7ba3448aecd3a308b6d46f0ee5a0cc0f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_50a65666e492e14fbfd080bd7ba3448aecd3a308b6d46f0ee5a0cc0f.script [ctx] 10000]
