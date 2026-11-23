import LiveScripts.Shared
import LiveScripts.S_14f187f49a33e9fd87455e575a53fe41b77f52a90ee32d8c36cd8229.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_14f187f49a33e9fd87455e575a53fe41b77f52a90ee32d8c36cd8229.script [ctx] 10000]
