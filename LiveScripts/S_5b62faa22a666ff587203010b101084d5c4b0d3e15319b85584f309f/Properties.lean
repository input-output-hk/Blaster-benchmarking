import LiveScripts.Shared
import LiveScripts.S_5b62faa22a666ff587203010b101084d5c4b0d3e15319b85584f309f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5b62faa22a666ff587203010b101084d5c4b0d3e15319b85584f309f.script [ctx] 10000]
