import LiveScripts.Shared
import LiveScripts.S_dfd60ad4007847af51012185ff92347d01fe7284f4f367b407fecb2a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dfd60ad4007847af51012185ff92347d01fe7284f4f367b407fecb2a.script [ctx] 10000]
