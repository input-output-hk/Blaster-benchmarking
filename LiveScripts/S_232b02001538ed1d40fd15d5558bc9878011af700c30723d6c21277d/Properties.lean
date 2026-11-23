import LiveScripts.Shared
import LiveScripts.S_232b02001538ed1d40fd15d5558bc9878011af700c30723d6c21277d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_232b02001538ed1d40fd15d5558bc9878011af700c30723d6c21277d.script [ctx] 10000]
