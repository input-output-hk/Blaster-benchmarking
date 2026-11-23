import LiveScripts.Shared
import LiveScripts.S_66ca2e502343ea7e4d7b0b369cf68ceb3b0364cdf615985360921c73.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_66ca2e502343ea7e4d7b0b369cf68ceb3b0364cdf615985360921c73.script [ctx] 10000]
