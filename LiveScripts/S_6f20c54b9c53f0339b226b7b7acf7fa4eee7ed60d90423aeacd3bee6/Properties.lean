import LiveScripts.Shared
import LiveScripts.S_6f20c54b9c53f0339b226b7b7acf7fa4eee7ed60d90423aeacd3bee6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f20c54b9c53f0339b226b7b7acf7fa4eee7ed60d90423aeacd3bee6.script [ctx] 10000]
